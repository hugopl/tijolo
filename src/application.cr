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
  property? fullscreen = false

  delegate set_accels_for_action, to: @application

  @window : Window?
  @new_tijolo_btn : Gtk::Button?
  @recent_files_btn : Gtk::MenuButton?
  @recent_files_menu : Gio::Menu?

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
    main_window.maximize
    setup_actions

    builder = builder_for("header_bar")
    @header_bar = Gtk::HeaderBar.cast(builder["root"])
    @new_tijolo_btn = Gtk::Button.cast(builder["new_tijolo_btn"])
    @recent_files_btn = recent_files_btn = Gtk::MenuButton.cast(builder["recent_files_btn"])

    init_recent_files_menu
    main_window.titlebar = header_bar

    apply_css

    init_welcome unless open_project(@argv_files)
    main_window.show
  end

  def setup_actions
    # Hamburguer menu
    preferences = Gio::SimpleAction.new("preferences", nil)
    preferences.on_activate { show_preferences_dlg }
    main_window.add_action(preferences)
    about = Gio::SimpleAction.new("about", nil)
    about.on_activate { show_about_dlg }
    main_window.add_action(about)

    new_tijolo = Gio::SimpleAction.new("new_tijolo", nil)
    new_tijolo.on_activate { start_new_tijolo }
    main_window.add_action(new_tijolo)

    string = GLib::VariantType.new("s")
    open_recent = Gio::SimpleAction.new("open_recent_file", string)
    open_recent.on_activate(&->open_recent_file(Gio::SimpleAction, GLib::Variant?))
    main_window.add_action(open_recent)

    # global actions with shortcuts
    config = Config.instance
    actions = {new_file:   ->new_file,
               open_file:  ->open_file,
               fullscreen: ->fullscreen}
    actions.each do |name, closure|
      action = Gio::SimpleAction.new(name.to_s, nil)
      action.on_activate { closure.call }
      main_window.add_action(action)

      shortcut = config.shortcuts[name.to_s]
      set_accels_for_action("win.#{name}", {shortcut}) if shortcut
    end
  end

  private def init_recent_files_menu
    files = TijoloRC.instance.recent_files
    return if files.empty?

    reload_recent_files_menu
    @recent_files_btn.not_nil!.menu_model = recent_files_menu
  end

  private def reload_recent_files_menu
    rc = TijoloRC.instance
    recent_files_menu.remove_all # Yeah, the lazy way... just 10 itens,
    rc.recent_files.each do |file|
      label = relative_path_label(Path.new(file.to_s))
      recent_files_menu.append(label, "win.open_recent_file(#{file.to_s.inspect})")
    end
  end

  def ide : IdeWindow
    window = @window.as?(IdeWindow)
    window ||= init_ide(Project.new)
  end

  def new_file
    ide.create_view(nil)
  end

  def open_file
    dlg = Gtk::FileChooserDialog.new(title: "Open file", action: :open, local_only: true, modal: true)
    dlg.add_button("Cancel", Gtk::ResponseType::CANCEL.value)
    dlg.add_button("Open", Gtk::ResponseType::ACCEPT.value)

    ide_window = @window.as?(IdeWindow)
    dlg.current_folder_uri = ide_window.project.root.to_uri.to_s if ide_window && ide_window.project.valid?

    if dlg.run == Gtk::ResponseType::ACCEPT.value
      uri = dlg.uri
      ide.open_file(Path.new(URI.parse(uri).full_path)) if uri
    end
  ensure
    dlg.try(&.destroy)
  end

  def open_recent_file(_action : Gio::SimpleAction, file : GLib::Variant?)
    ide.open_file(Path.new(file.string)) unless file.nil?
    reload_recent_files_menu
  end

  def recent_files_menu : Gio::Menu
    @recent_files_menu ||= Gio::Menu.new
  end

  def add_recent_file(file : Path)
    TijoloRC.instance.push_recent_file(file)
    reload_recent_files_menu
  end

  def fullscreen
    if @fullscreen
      main_window.unfullscreen
    else
      main_window.fullscreen
    end
    @fullscreen = !@fullscreen
  end

  def start_new_tijolo
    tijolo = Process.new(Process.executable_path.to_s)
  end

  def show_preferences_dlg
    Config.create_config_if_needed

    ide.open_file(Config.path)
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

  private def open_project(files : Array(String)) : Bool
    return false if files.empty?

    pwd = Dir.current
    paths = files.map { |f| Path.new(f).expand(base: pwd) }

    project = Project.new
    paths.each do |path|
      break if project.try_load_project(path)
    end

    files_to_open = paths.reject { |path| Dir.exists?(path) }
    return false if !project.valid? && files_to_open.empty?

    ide = init_ide(project)
    files_to_open.each do |file|
      ide.open_file(file)
    end
    true
  end

  private def init_welcome
    welcome = WelcomeWindow.new(self)
    main_window.add(welcome.root)
  end

  private def init_ide(project : Project) : IdeWindow
    ide_window = IdeWindow.new(self, project)
    header_bar.subtitle = "No Project"

    child = main_window.child
    main_window.remove(child) unless child.nil?
    main_window.add(ide_window.root)

    @window = ide_window
    @new_tijolo_btn.not_nil!.show
    ide_window
  end

  def run
    @application.run(nil)
  end

  def error(exception : Exception) : Nil
    error("Error", exception.message || exception.class.name)
  end

  def error(title : String, message : String) : Nil
    Log.warn { message }
    dialog = Gtk::MessageDialog.new(text: title, secondary_text: message, message_type: :error, buttons: :ok)
    dialog.on_response { dialog.close }
    dialog.run
  end
end
