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
  getter style_scheme : GtkSource::StyleScheme

  delegate set_accels_for_action, to: @application

  def initialize(@argv_files : Array(String))
    GtkSource.init
    @application = Gtk::Application.new(application_id: "io.github.hugopl.Tijolo", flags: :non_unique)
    @application.on_activate(&->activate_ui(Gio::Application))
    @style_scheme = load_scheme
  end

  private def load_scheme : GtkSource::StyleScheme
    manager = GtkSource::StyleSchemeManager.default
    manager.search_path = usr_share_paths("styles", manager.search_path.to_a)
    # TODO: Remove this workaround until https://gitlab.gnome.org/GNOME/gtksourceview/-/issues/133 get released.
    scheme = manager.scheme2(Config.instance.style_scheme)
    return scheme unless scheme.nil?

    raise AppError.new("Failed to open style scheme #{Config.instance.style_scheme}, looked at: #{manager.search_path}")
  end

  private def activate_ui(g_app)
    @main_window = main_window = Gtk::ApplicationWindow.new(application: @application, default_width: 800, default_height: 600)
    setup_actions

    builder = builder_for("header_bar")
    @header_bar = Gtk::HeaderBar.cast(builder["root"])
    main_window.titlebar = header_bar

    apply_css

    if !open_project(@argv_files)
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

  def open_project(files : Array(String)) : Bool
    ide = nil
    files.each do |file|
      ide = open_project(file)
      break unless ide.nil?
    end
    return false if ide.nil?

    files.each do |file|
      ide.open_file(file) unless Dir.exists?(file)
    end
    true
  end

  def open_project(project_path : String) : IdeWindow?
    project = Project.new(project_path)
    ide_window = IdeWindow.new(self, project)

    header_bar.title = project.name
    header_bar.subtitle = project.root.relative_to(Path.home).to_s

    child = main_window.child
    main_window.remove(child) unless child.nil?
    main_window.add(ide_window.root)
    {% if flag?(:release) %}
      main_window.maximize
    {% end %}
    ide_window
  rescue e
    dialog = Gtk::MessageDialog.new(text: e.message, message_type: :error, buttons: :ok)
    dialog.on_response { dialog.close }
    dialog.run
    nil
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
