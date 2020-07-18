require "fzy"

require "./locator_provider"
require "./document_symbol_locator"
require "./file_locator"
require "./help_locator"
require "./line_locator"
require "./observable"
require "./ui_builder_helper"

module LocatorListener
  abstract def locator_open_file(file : String)
  abstract def locator_goto_line_col(line : Int32, column : Int32)
end

class Locator
  include UiBuilderHelper
  include LocatorProviderListener

  observable_by LocatorListener

  getter locator_widget : Gtk::Widget # Root widget for locator

  # project model columns
  PATH_COLUMN    = 0
  VISIBLE_COLUMN = 1
  SCORE_COLUMN   = 2

  @project : Project
  @locator_entry : Gtk::SearchEntry
  @locator_results : Gtk::TreeView
  private getter results_cursor = 0

  @locator_providers = Hash(Char, LocatorProvider).new
  @default_locator_provider : LocatorProvider
  @current_locator_provider : LocatorProvider

  def initialize(@project)
    builder = builder_for("locator")
    @locator_widget = Gtk::Widget.cast(builder["locator_widget"])
    @locator_widget.ref

    @locator_entry = Gtk::SearchEntry.cast(builder["locator_entry"])
    @locator_entry.on_key_press_event(&->entry_key_pressed(Gtk::Widget, Gdk::EventKey))
    @locator_entry.on_activate(&->activated(Gtk::Entry))
    @locator_entry.connect("notify::text", &->search_changed)
    @locator_entry.after_focus_out_event(&->focus_out_event(Gtk::Widget, Gdk::EventFocus))

    @default_locator_provider = FileLocator.new(@project)
    @current_locator_provider = @help_locator_provider = HelpLocator.new

    @locator_results = Gtk::TreeView.cast(builder["locator_results"])
    @locator_results.selection.mode = :browse
    @locator_results.model = @help_locator_provider.model
    @locator_results.on_row_activated(&->activated(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn))

    init_locators
  end

  def init_locators
    @default_locator_provider.add_locator_provider_listener(self)

    [DocumentSymbolLocator.new, LineLocator.new].each do |locator|
      @locator_providers[locator.shortcut] = locator
      locator.add_locator_provider_listener(self)
      @help_locator_provider.add(locator)
    end
  end

  def show(*, select_text : Bool, view : View?)
    self.results_cursor = 0
    if view != @current_view
      @current_locator_provider.unselected
      @current_locator_provider.selected(view)
    end

    @current_view = view
    @locator_widget.show
    if select_text
      @locator_entry.grab_focus
    else
      @locator_entry.grab_focus_without_selecting
    end
  end

  def hide
    @current_view = nil
    @locator_widget.hide
  end

  def text=(text : String)
    @locator_entry.text = text
    @locator_entry.position = text.size
  end

  private def focus_out_event(widget, event : Gdk::EventFocus) : Bool
    hide
    false
  end

  macro hide_locator_on_esc!
    if event.keyval == Gdk::KEY_Escape
      hide
      return true
    end
  end

  private def entry_key_pressed(_widget, event : Gdk::EventKey)
    hide_locator_on_esc!

    if event.keyval == Gdk::KEY_Up
      self.results_cursor -= 1
      return true
    elsif event.keyval == Gdk::KEY_Down
      return true if @current_locator_provider.results_size < 2 # First item is already selected...

      self.results_cursor += 1
      return true
    end
    false
  end

  private def search_changed
    text = @locator_entry.text
    locator = find_locator(text)
    if @current_locator_provider != locator
      @current_locator_provider.unselected
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

  private def activated(widget : Gtk::Entry)
    activated(@results_cursor)
  end

  private def activated(widget : Gtk::TreeView, tree_path : Gtk::TreePath, _column : Gtk::TreeViewColumn)
    indices, _depth = tree_path.indices
    activated(indices.first)
  end

  private def activated(index : Int32)
    hide if @current_locator_provider.activate(self, index)
  end
end
