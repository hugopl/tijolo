require "./window"
require "./config"

class WelcomeWindow < Window
  @projects_model : Gtk::ListStore

  def initialize(application : Application)
    builder = builder_for("welcome_window")
    super(application, builder)

    # Signals
    tree_view = Gtk::TreeView.cast(builder["tree_view"])
    tree_view.on_row_activated(&->project_activated(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn))

    rescan_btn = Gtk::Button.cast(builder["rescan_btn"])
    rescan_btn.on_clicked(&->scan_projects(Gtk::Button))

    @projects_model = Gtk::ListStore.cast(builder["projects_model"])
    fill_projects_model
  end

  private def fill_projects_model
    config = Config.instance
    scan_projects if config.scan_projects?

    home = Path.home.to_s
    config.projects.each do |project|
      project_dir = project.path.sub(home, "~")
      @projects_model.append({0, 1}, {"<b>#{project.name}</b>\n<i><small>#{project_dir}</small></i>", project.path})
    end
  end

  private def scan_projects(_button = nil)
    config = Config.instance

    t = Time.measure do
      Project.scan_projects(Path.home).each do |project|
        config.add_project(project.to_s)
      end
    end
    Log.info { "Scaning all projects in #{t}." }
    config.scan_projects = false
    config.filter_projects!

    @projects_model.clear
    fill_projects_model
  end

  private def project_activated(view, path, _column)
    application.open_project(view.value(path, 1).string)
  end
end
