require "gobject/gtk"
require_gobject "GtkSource"

require "./gtk.cr" # monkey patches to to make GTK API more tasty

require "./error"
require "./ui_builder_helper"

require "./ide_window"
require "./project"
require "./welcome_window"

class Application
  include UiBuilderHelper

  getter! main_window : Gtk::ApplicationWindow?
  getter! header_bar : Gtk::HeaderBar?
  getter! project_location : String?

  getter style_scheme : GtkSource::StyleScheme

  delegate set_accels_for_action, to: @application

  def initialize(options)
    GtkSource.init
    @application = Gtk::Application.new(application_id: "io.github.hugopl.Tijolo", flags: :non_unique)
    @application.on_activate(&->activate_ui(Gio::Application))
    @style_scheme = load_scheme

    location = options[:location]
    @project_location = Path.new(location).expand.to_s if location

    log_memory_usage unless options[:gc_enabled]
  end

  private def log_memory_usage
    GLib.timeout(60) do # each 60 seconds...
      Log.info { "memory usage: #{GC.stats.heap_size.humanize_bytes}" }
      true
    end
  end

  private def load_scheme : GtkSource::StyleScheme
    manager = GtkSource::StyleSchemeManager.default
    # TODO: Remove this workaround until https://gitlab.gnome.org/GNOME/gtksourceview/-/issues/133 get released.
    scheme = manager.scheme2(Config.instance.style_scheme)
    raise AppError.new("Failed to open style scheme #{Config.instance.style_scheme}.") if scheme.nil?

    scheme
  end

  private def activate_ui(g_app)
    @main_window = main_window = Gtk::ApplicationWindow.new(application: @application, default_width: 800, default_height: 600)
    setup_actions

    builder = builder_for("header_bar")
    @header_bar = Gtk::HeaderBar.cast(builder["root"])
    main_window.titlebar = header_bar

    apply_css

    project_loaded = @project_location && open_project(project_location)
    if !project_loaded
      welcome = WelcomeWindow.new(self)
      main_window.add(welcome.root)
    end
    main_window.show
  end

  def setup_actions
    # Hamburguer menu
    preferences = Gio::SimpleAction.new("preferences", nil)
    preferences.enabled = false
    main_window.add_action(preferences)
    preferences.on_activate { show_preferences_dlg }
    about = Gio::SimpleAction.new("about", nil)
    about.on_activate { show_about_dlg }
    main_window.add_action(about)
  end

  def show_preferences_dlg
  end

  def show_about_dlg
    dialog = Gtk::AboutDialog.new(application: @application,
      copyright: "© 2020 Hugo Parente Lima",
      version: VERSION,
      program_name: "Tijolo",
      logo_icon_name: "io.github.hugopl.Tijolo",
      comments: "Lightweight, keyboard-oriented IDE for the masses",
      website: "https://hugopl.github.io/tijolo",
      website_label: "Learn more about Tijolo",
      license: Compiled::License.display)
    # FIXME: Need to fill a bug into crystal-gobject about set these properties on ctor.
    dialog.authors = {"Hugo Parente Lima <hugo.pl@gmail.com>"}
    dialog.artists = {"Marília Riul <mmriul@gmail.com>"}

    dialog.on_response { dialog.close }
    dialog.run
  end

  def open_project(project_path : String) : Bool
    project = Project.new(project_path)
    ide_window = IdeWindow.new(self, project)
    ide_window.open_file(project_path) unless Dir.exists?(project_path)

    header_bar.title = project.name
    header_bar.subtitle = project.root.relative_to(Path.home).to_s

    child = main_window.child
    main_window.remove(child) unless child.nil?
    main_window.add(ide_window.root)
    {% if flag?(:release) %}
      main_window.maximize
    {% end %}
    true
  rescue e
    dialog = Gtk::MessageDialog.new(text: e.message, message_type: :error, buttons: :ok)
    dialog.on_response { dialog.close }
    dialog.run
    false
  end

  def run
    @application.run(nil)
  rescue e
    Log.fatal { e.backtrace }
    abort(e.message)
  end

  def error(exception : Exception) : Nil
    message = exception.message || exception.class.name
    Log.warn { message }
    dialog = Gtk::MessageDialog.new(text: message, message_type: :error, buttons: :ok)
    dialog.on_response { dialog.close }
    dialog.run
  end
end
