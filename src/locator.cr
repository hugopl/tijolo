require "fzy"

require "./locator_provider"
# require "./document_symbol_locator"
require "./file_locator"
require "./help_locator"
require "./line_locator"
# require "./git_locator"

module LocatorListener
  abstract def locator_open_file(file : String, split_view : Bool)
  abstract def locator_goto_line_col(line : Int32, column : Int32)
  abstract def locator_show_special_file(contents : String, label : String, line : Int32, col : Int32, syntax : String?)
  abstract def locator_hidden
end

@[Gtk::UiTemplate(file: "#{__DIR__}/ui/locator.ui", children: %w(locator_results locator_entry))]
class Locator < Gtk::Box
  include Gtk::WidgetTemplate

  signal open_file(file : String, split_view : Bool)
  signal goto_line(line : Int32, col : Int32)

  # project model columns
  PATH_COLUMN    = 0
  VISIBLE_COLUMN = 1
  SCORE_COLUMN   = 2

  @project : Project
  @entry : Gtk::Entry
  getter? split_next = false # True if next opened file should be open in a new split
  @locator_results : Gtk::TreeView
  private getter results_cursor = 0
  @current_view : View?

  @locator_providers = Hash(Char, LocatorProvider).new
  @default_locator_provider : LocatorProvider
  @current_locator_provider : LocatorProvider

  def initialize(@project)
    super()

    @entry = Gtk::Entry.cast(template_child("locator_entry"))
    @entry.activate_signal.connect(&->entry_activated)
    @entry.notify_signal["text"].connect(&->search_changed(GObject::ParamSpec))

    key_ctl = Gtk::EventControllerKey.new
    key_ctl.key_pressed_signal.connect(&->entry_key_pressed(UInt32, UInt32, Gdk::ModifierType))
    @entry.add_controller(key_ctl)

    focus_ctl = Gtk::EventControllerFocus.new
    focus_ctl.leave_signal.connect(->focus_leave, after: true)
    @entry.add_controller(focus_ctl)

    @default_locator_provider = FileLocator.new(@project)
    @current_locator_provider = @help_locator_provider = HelpLocator.new

    @locator_results = Gtk::TreeView.cast(template_child("locator_results"))
    @locator_results.model = @help_locator_provider.model
    @locator_results.row_activated_signal.connect(&->row_activated(Gtk::TreePath, Gtk::TreeViewColumn?))

    init_locators
  end

  def init_locators
    [LineLocator.new].each do |locator|
      @locator_providers[locator.shortcut] = locator
      @help_locator_provider.add(locator)
    end
  end

  def project_load_finished
    @default_locator_provider.project_load_finished
    @locator_providers.each_value(&.project_load_finished)
  end

  def show(*, select_text : Bool, view : View?, split_view = false)
    @split_next = split_view
    self.results_cursor = 0
    @current_locator_provider.selected(view) if view.nil? || view != @current_view

    @current_view = view
    show
    if select_text
      @entry.grab_focus
    else
      @entry.grab_focus_without_selecting
    end
  end

  def hide
    @current_view = nil
    super
  end

  def text=(text : String)
    @entry.text = text
    @entry.position = text.size
  end

  def view_closed(view : View)
    @locator_providers.each_value(&.view_closed(view))
  end

  private def focus_leave : Nil
    hide
  end

  private def entry_key_pressed(key_val : UInt32, _key_code : UInt32, _modifier : Gdk::ModifierType)
    if key_val == Gdk::KEY_Escape
      hide
    elsif key_val == Gdk::KEY_Up
      self.results_cursor -= 1
      return true
    elsif key_val == Gdk::KEY_Down
      return true if @current_locator_provider.results_size < 2 # First item is already selected...

      self.results_cursor += 1
      return true
    end
    false
  end

  private def search_changed(_param : GObject::ParamSpec)
    text = @entry.text
    locator = find_locator(text)
    if @current_locator_provider != locator
      locator.selected(@current_view)
      @current_locator_provider = locator
      @locator_results.model = @current_locator_provider.model
      self.results_cursor = 0 # Reset the cursor just in case the new provider do nothing, e.g. waiting language server
    end

    if text.size > 0
      text = text[2..-1] if @current_locator_provider != @default_locator_provider
      @current_locator_provider.search_changed(text)
    end
  end

  def locator_provider_model_changed(provider : LocatorProvider)
    self.results_cursor = 0 if provider == @current_locator_provider
  end

  def results_cursor=(row : Int32)
    row = row.clamp(0, @current_locator_provider.results_size - 1)

    @results_cursor = row
    @locator_results.set_cursor(row)
  end

  private def find_locator(text)
    return @help_locator_provider if text.empty?
    return @default_locator_provider if text.size < 2 || !text[1].whitespace?

    @locator_providers[text[0]]? || @default_locator_provider
  end

  private def entry_activated
    row_activated(@results_cursor)
  end

  private def row_activated(tree_path : Gtk::TreePath, _column : Gtk::TreeViewColumn?)
    indices = tree_path.indices
    row_activated(indices.first) if indices
  end

  private def row_activated(index : Int32)
    hide if @current_locator_provider.activate(self, index)
  end
end
