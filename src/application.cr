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
    @main_window = main_window = Gtk::ApplicationWindow.new(application: @application)
    {% if flag?(:release) %}
    main_window.maximize
    {% end %}
    setup_actions

    builder = builder_for("header_bar")
    @header_bar = Gtk::HeaderBar.cast(builder["root"])
    main_window.titlebar = header_bar

    apply_css

    if @argv_files.empty?
      welcome = WelcomeWindow.new(self)
      main_window.add(welcome.root)
    else
      open_project(@argv_files)
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
    return false unless project.valid?

    init_ide(project)
    true
  end

  def open_project(files : Array(String))
    pwd = Dir.current
    paths = files.map { |f| Path.new(f).expand(base: pwd) }

    project = Project.new
    paths.each do |path|
      break if project.try_load_project(path)
    end

    ide = init_ide(project)
    paths.each do |path|
      ide.open_file(path) unless Dir.exists?(path)
    end
  end

  private def init_ide(project : Project) : IdeWindow
    ide_window = IdeWindow.new(self, project)

    header_bar.title = project.name
    subtitle = project.root.relative_to(Path.home).to_s
    subtitle = "~/#{subtitle}" unless subtitle.starts_with?(".") || subtitle.starts_with?("/")
    header_bar.subtitle = subtitle

    child = main_window.child
    main_window.remove(child) unless child.nil?
    main_window.add(ide_window.root)

    ide_window
  end

  def run
    @application.run(nil)
  end

  def error(exception : Exception) : Nil
    message = exception.message || exception.class.name
    Log.warn { message }
    dialog = Gtk::MessageDialog.new(text: message, message_type: :error, buttons: :ok)
    dialog.on_response { dialog.close }
    dialog.run
  end
end
