require "version_from_shard"

require "./tijolo_error"
require "./application_window"

VersionFromShard.declare

LICENSE = {{ run("../lib/compiled_license/src/compiled_license/licenses.cr").stringify }}

class TijoloApplication < Adw::Application
  @project_windows = [] of ApplicationWindow
  @no_project_window : ApplicationWindow?

  def initialize
    super
    self.application_id = "io.github.hugopl.Tijolo"
    self.flags = Gio::ApplicationFlags::HandlesOpen
    self.option_context_parameter_string = "[FILE[:LINE]…]"
    self.add_main_option("version", 0, :none, :none, "Show version information and exit", nil)
    self.add_main_option("license", 0, :none, :none, "Show license information and exit", nil)

    setup_actions

    # FIXME: Remove this once virtual functions get supported in gi-crystal
    activate_signal.connect(->self.activate)
    handle_local_options_signal.connect(->self.handle_local_options(GLib::VariantDict))
    open_signal.connect(->self.open(Enumerable(Gio::File), String))
    self
  end

  private def setup_actions
    about = Gio::SimpleAction.new("about", nil)
    about.activate_signal.connect { show_about_dlg }
    add_action(about)
  end

  def activate
    no_project_window = @no_project_window
    if no_project_window.nil?
      @no_project_window = create_project_window(Project.new)
    else
      no_project_window.present
    end
  end

  def open(files : Enumerable(Gio::File), _hint : String)
    files.each do |file|
      file_path = file.path
      next if file_path.nil?

      window = @project_windows.find(&.project.under_project?(file_path))
      if window.nil?
        if Project.valid?(file_path)
          window = create_project_window(Project.new(file_path))
          @project_windows << window
        else
          window = @no_project_window
          @no_project_window = window = create_project_window(Project.new) if window.nil?
        end
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
      0
    elsif options.remove("license")
      puts {{ run("../lib/compiled_license/src/compiled_license/licenses.cr").stringify }}
      0
    else
      -1
    end
  end

  private def show_about_dlg
    Gtk.show_about_dialog(parent: active_window, application: self,
      copyright: "© 2020-2022 Hugo Parente Lima",
      version: "#{VERSION} (Crystal #{Crystal::VERSION})",
      program_name: "Tijolo",
      logo_icon_name: "io.github.hugopl.Tijolo",
      comments: "Lightweight, keyboard-oriented IDE for the masses",
      website: "https://github.com/hugopl/tijolo",
      website_label: "Learn more about Tijolo",
      license: LICENSE,
      authors: {"Hugo Parente Lima <hugo.pl@gmail.com>"},
      artists: {"Marília Riul <mmriul@gmail.com>"})
  end

  def error(exception : Exception) : Nil
    error("Error", exception.message || exception.class.name)
  end

  def error(title : String, message : String) : Nil
    Log.warn { message }
    Gtk::MessageDialog.ok(text: title, secondary_text: message, message_type: :error, transient_for: active_window) { }
  end
end
