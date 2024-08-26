require "fzy"
require "./tijolo_rc"

private class WelcomeProject < GObject::Object
  @[GObject::Property]
  getter name : String = ""
  @[GObject::Property]
  getter path : String = ""
  @[GObject::Property]
  getter last_used : String = ""

  getter full_path : String

  def initialize(project : RCData::Project)
    super()
    @name = project.name
    @full_path = project.path.to_s
    @last_used = "<i>#{project.humanized_last_used}</i>"

    home = Path.home
    relative_path = project.path.relative_to(home).to_s
    @path = relative_path.starts_with?(".") ? project.path.to_s : "~/#{relative_path}"
  end
end

@[Gtk::UiTemplate(file: "#{__DIR__}/ui/welcome_widget.ui", children: %w(rescan_btn search_entry spinner listview))]
class WelcomeWidget < Gtk::Box
  include Gtk::WidgetTemplate
  include Gio::ListModel

  private getter? scanning_projects = false
  getter entry : Gtk::SearchEntry

  @list_view : Gtk::ListView
  @rescan_btn : Gtk::Button
  @spinner : Gtk::Spinner

  @haystack : Fzy::PreparedHaystack?
  @fzy_results = [] of Fzy::Match
  @available_projects = [] of WelcomeProject
  @selection_model : Gtk::SingleSelection

  @signal_connections = [] of GObject::SignalConnection

  def initialize
    super(css_name: "welcome")

    @spinner = Gtk::Spinner.cast(template_child("spinner"))

    @entry = Gtk::SearchEntry.cast(template_child("search_entry"))
    @signal_connections << @entry.activate_signal.connect(&->entry_activated)
    @signal_connections << @entry.notify_signal["text"].connect(&->entry_text_changed(GObject::ParamSpec))
    event_ctl = Gtk::EventControllerKey.new
    @signal_connections << event_ctl.key_pressed_signal.connect(&->entry_key_pressed(UInt32, UInt32, Gdk::ModifierType))
    @entry.add_controller(event_ctl)

    @rescan_btn = Gtk::Button.cast(template_child("rescan_btn"))
    @signal_connections << @rescan_btn.clicked_signal.connect(&->scan_projects)

    @selection_model = Gtk::SingleSelection.new
    @list_view = Gtk::ListView.cast(template_child("listview"))
    @signal_connections << @list_view.activate_signal.connect(->row_activated(UInt32))
    @selection_model.model = self
    @list_view.model = @selection_model

    if TijoloRC.instance.scan_projects?
      scan_projects
    else
      scan_projects_finished
    end
  end

  def disconnect_all_signals
    @signal_connections.each(&.disconnect)
  end

  private def entry_key_pressed(keyval : UInt32, keycode : UInt32, state : Gdk::ModifierType) : Bool
    if keyval == Gdk::KEY_Up
      selected = @selection_model.selected
      return false if selected.zero?

      @selection_model.selected = selected - 1
    elsif keyval == Gdk::KEY_Down
      return true if @fzy_results.size < 2 # First item is already selected...

      selected = @selection_model.selected + 1
      @selection_model.selected = selected if selected < @fzy_results.size
    elsif keyval == Gdk::KEY_F5 # This should be a GTK action, but who cares...
      scan_projects
    else
      return false
    end
    true
  end

  private def entry_activated : Nil
    row_activated(@selection_model.selected)
  end

  private def entry_text_changed(_param : GObject::ParamSpec? = nil)
    haystack = @haystack
    return if haystack.nil? || haystack.empty?

    old_size = @fzy_results.size
    @fzy_results = Fzy.search(@entry.text, haystack)
    items_changed(0, old_size, @fzy_results.size)

    @selection_model.selected = 0
    @list_view.scroll_to(0, :select, nil)
  end

  private def scan_projects : Nil
    return if @scanning_projects

    @scanning_projects = true
    @rescan_btn.sensitive = false
    @spinner.visible = true
    Thread.new do
      rc = TijoloRC.instance

      t = Time.measure do
        Project.scan_projects(Path.home) do |path|
          rc.add_project(path)
        end
      end
      Log.info { "Scaning all projects in #{t}." }
      rc.scan_projects = false
      rc.filter_projects!

      # Execute this in main thread
      GLib.idle_add(&->scan_projects_finished)
    end
  end

  private def scan_projects_finished : Bool
    projects = TijoloRC.instance.projects
    @available_projects = projects.map { |project| WelcomeProject.new(project) }
    @haystack = Fzy::PreparedHaystack.new(projects.map(&.path.to_s))

    entry_text_changed

    @rescan_btn.sensitive = true
    @spinner.visible = false
    @entry.grab_focus
    @scanning_projects = false

    inform_about_lack_of_projects if projects.empty?
    false
  end

  private def row_activated(pos : UInt32) : Nil
    match = @fzy_results[pos]
    project_path = @available_projects[match.index].full_path
    activate_action("win.open_project", project_path)
  end

  @[GObject::Virtual]
  def grab_focus : Bool
    @entry.grab_focus
  end

  @[GObject::Virtual]
  def get_n_items : UInt32
    @fzy_results.size.to_u32
  end

  @[GObject::Virtual]
  def get_item(pos : UInt32) : GObject::Object?
    return if pos >= @fzy_results.size

    match = @fzy_results[pos]
    @available_projects[match.index]
  end

  @[GObject::Virtual]
  def get_item_type : UInt64
    WelcomeProject.g_type
  end

  private def inform_about_lack_of_projects
    message = "Tijolo is meant to be used with git projects but no git projects were found under " \
              "<span allow_breaks=\"false\" font_family=\"monospace\">#{Path.home}</span>. " \
              "Create a git project somewhere and ask Tijolo to rescan projects."
    dialog = Gtk::MessageDialog.ok(message_type: :info,
      text: "No Git projects were found", secondary_text: message,
      secondary_use_markup: true, transient_for: ApplicationWindow.cast(root.not_nil!)) do
    end
  end
end
