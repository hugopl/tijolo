require "./tijolo_error"
require "./tijolo_log_format"
require "./application_window"

VERSION = {{ `shards version #{__DIR__}`.strip.stringify }}
LICENSE = {{ run("./macros/license.cr").stringify }}

class TijoloApplication < Adw::Application
  @windows = [] of ApplicationWindow
  getter settings : Gio::Settings
  @system_color_scheme : Adw::ColorScheme

  def initialize
    super(application_id: "io.github.hugopl.Tijolo", flags: Gio::ApplicationFlags::HandlesOpen)

    @settings = Gio::Settings.new("io.github.hugopl.Tijolo")
    style_manager = Adw::StyleManager.default
    @system_color_scheme = style_manager.color_scheme
    @settings.changed_signal["style-variant"].connect(->theme_changed(String))
    theme_changed

    self.option_context_parameter_string = "[FILE[:LINE]…]"
    add_main_option("version", 0, :none, :none, "Show version information and exit", nil)
    add_main_option("license", 0, :none, :none, "Show license information and exit", nil)
    add_main_option("log-level", 0, :none, :string, "Log level to be used", nil)

    setup_actions

    # FIXME: Remove this once virtual functions get supported in gi-crystal
    activate_signal.connect(->self.activate)
    handle_local_options_signal.connect(->self.handle_local_options(GLib::VariantDict))
    open_signal.connect(->self.open(Enumerable(Gio::File), String))
    self
  end

  private def setup_actions
    action = Gio::SimpleAction.new("about", nil)
    action.activate_signal.connect { show_about_dlg }
    add_action(action)

    action = Gio::SimpleAction.new("activate", nil)
    action.activate_signal.connect { activate }
    add_action(action)
    set_accels_for_action("app.activate", {"<Control><Alt>o"})
  end

  def activate
    window = create_project_window(Project.new)
    @windows << window
    window.present
  end

  private def theme_changed(_unused : String = "")
    theme = @settings.string("style-variant")
    style_manager = Adw::StyleManager.default
    color_scheme = case theme
                   when "light" then Adw::ColorScheme::ForceLight
                   when "dark"  then Adw::ColorScheme::ForceDark
                   else
                     @system_color_scheme
                   end
    style_manager.color_scheme = color_scheme
  end

  def open(files : Enumerable(Gio::File), _hint : String)
    files.each do |file|
      file_path = file.path
      next if file_path.nil?

      window = @windows.find(&.project.under_project?(file_path))
      if window.nil?
        window = if Project.valid?(file_path)
                   create_project_window(Project.new(file_path))
                 else
                   create_project_window(Project.new)
                 end
        @windows << window
        window.present
      end
      window.open(file_path.to_s) if File.file?(file_path)
    end
  end

  private def create_project_window(project : Project) : ApplicationWindow
    window = ApplicationWindow.new(self, project)
    window.present
    window
  end

  def handle_local_options(options : GLib::VariantDict) : Int32
    if options.remove("version")
      puts "Tijolo version #{VERSION} build with Crystal #{Crystal::VERSION}."
      return 0
    elsif options.remove("license")
      puts LICENSE.gsub(/<\/?(big|tt)>/, "")
      return 0
    end

    log_level = options.lookup_value("log-level", GLib::VariantType.new("s")).try(&.as_s?)
    setup_logger(log_level)

    -1
  rescue e : ArgumentError
    STDERR.puts(e.message)
    0
  end

  private def setup_logger(log_level : String?)
    level = log_level ? Log::Severity.parse(log_level) : Log::Severity::Info

    backend = Log::IOBackend.new(formatter: TijoloLogFormat, dispatcher: Log::DispatchMode::Direct)
    Log.setup(level, backend)
    Log.info { "Tijolo v#{VERSION} started at #{Time.local}, pid: #{Process.pid}, log level: #{level}" }
  end

  private def show_about_dlg
    Adw.show_about_window(parent: active_window, application: self,
      copyright: "© 2020-#{Time.local.year} Hugo Parente Lima",
      version: VERSION,
      application_name: "Tijolo",
      application_icon: "io.github.hugopl.Tijolo",
      comments: "Lightweight, keyboard-oriented IDE for the masses",
      website: "https://github.com/hugopl/tijolo",
      issue_url: "https://github.com/hugopl/tijolo/issues",
      license: LICENSE,
      developer_name: "Hugo Parente Lima <hugo.pl@gmail.com>",
      developers: {"Hugo Parente Lima <hugo.pl@gmail.com>"},
      artists: {"Marília Riul <mmriul@gmail.com>"})
  end

  def error(exception : Exception) : Nil
    error("Error", exception.message || exception.class.name)
  end

  def error(title : String, message : String) : Nil
    Log.error { message }
    Gtk::MessageDialog.ok(text: title, secondary_text: message, message_type: :error, transient_for: active_window) { }
  end
end
