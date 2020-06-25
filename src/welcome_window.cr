require "./window"
require "./config"

class WelcomeWindow < Window
  @projects_model : Gtk::ListStore
  @tree_view : Gtk::TreeView
  @rescan_btn : Gtk::Button
  @scanning_projects = false

  def initialize(application : Application)
    builder = builder_for("welcome_window")
    super(application, builder)

    # Signals
    @tree_view = Gtk::TreeView.cast(builder["tree_view"])
    @tree_view.on_row_activated(&->project_activated(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn))

    @rescan_btn = Gtk::Button.cast(builder["rescan_btn"])
    @rescan_btn.on_clicked(&->scan_projects(Gtk::Button))

    overlay = Gtk::Overlay.cast(builder["overlay"])
    @spinner = Gtk::Spinner.cast(builder["spinner"])
    overlay.add_overlay(@spinner)
    @spinner.hide

    @projects_model = Gtk::ListStore.cast(builder["projects_model"])

    if Config.instance.scan_projects?
      scan_projects
    else
      fill_projects_model
    end
  end

  private def fill_projects_model
    config = Config.instance
    home = Path.home.to_s

    config.projects.each do |project|
      project_dir = project.path.sub(home, "~")
      last_used = format_last_used(project)
      @projects_model.append({0, 1}, {"<b>#{project.name}</b>\n<i><small>#{project_dir}#{last_used}</small></i>",
                                      project.path})
    end
  end

  private def format_last_used(project)
    last_used = project.last_used
    return if last_used.nil?

    ago = Time.local - last_used
    ago_str = if ago.total_weeks > 1.0
                "#{ago.total_weeks.to_i} weeks ago"
              elsif ago.days > 1
                "#{ago.days} days ago"
              elsif ago.hours > 1
                "#{ago.hours} hours ago"
              elsif ago.minutes > 1
                "#{ago.minutes} minutes ago"
              elsif ago.seconds > 1
                "#{ago.seconds} seconds ago"
              else
                "just now"
              end
    "  -  last used #{ago_str}."
  end

  private def scan_projects(_button = nil)
    return if @scanning_projects

    @scanning_projects = true
    @rescan_btn.sensitive = false
    @tree_view.sensitive = false
    @spinner.show
    spawn do
      config = Config.instance

      t = Time.measure do
        Project.scan_projects(Path.home).each do |project|
          config.add_project(project.to_s)
        end
      end
      Log.info { "Scaning all projects in #{t}." }
      config.scan_projects = false
      config.filter_projects!

      # Execute this in main thread
      GLib.timeout(0, &->scan_projects_finished)
    end
    Fiber.yield # Let Crystal start the Fiber before we back to Glib mainloop.
  end

  private def scan_projects_finished
    @projects_model.clear
    fill_projects_model
    @rescan_btn.sensitive = true
    @tree_view.sensitive = true
    @spinner.hide
    @tree_view.grab_focus
    @scanning_projects = false

    false
  end

  private def project_activated(view, path, _column)
    application.open_project(view.value(path, 1).string)
  end
end
