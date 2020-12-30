require "./window"
require "./tijolo_rc"

class WelcomeWindow < Window
  @projects_model : Gtk::ListStore
  @tree_view : Gtk::TreeView
  @open_btn : Gtk::Button
  @rescan_btn : Gtk::Button
  @scanning_projects = false

  delegate open_project, to: @application

  def initialize(application : Application)
    builder = builder_for("welcome_window")
    super(application, builder)

    Gtk::Label.cast(builder["version"]).label = "v#{VERSION}"

    # Signals
    @tree_view = Gtk::TreeView.cast(builder["tree_view"])
    @tree_view.on_row_activated(&->project_activated(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn))

    @open_btn = Gtk::Button.cast(builder["open_btn"])
    @open_btn.on_clicked(&->open_btn_clicked(Gtk::Button))
    @rescan_btn = Gtk::Button.cast(builder["rescan_btn"])
    @rescan_btn.on_clicked(&->scan_projects(Gtk::Button))

    overlay = Gtk::Overlay.cast(builder["overlay"])
    @spinner = Gtk::Spinner.cast(builder["spinner"])
    overlay.add_overlay(@spinner)
    @spinner.hide

    @projects_model = Gtk::ListStore.cast(builder["projects_model"])

    if TijoloRC.instance.scan_projects?
      scan_projects
    else
      fill_projects_model
    end
  end

  private def fill_projects_model
    home = Path.home.to_s
    projects = TijoloRC.instance.projects
    projects.each do |project|
      project_path = project.path.to_s
      project_path_label = project_path.starts_with?(home) ? project_path.sub(home, "~") : project_path
      last_used = format_last_used(project)
      @projects_model.append({0, 1}, {"<b>#{project.name}</b>\n<i><small>#{project_path_label}#{last_used}</small></i>",
                                      project_path})
    end
    has_projects = projects.any?
    @open_btn.sensitive = has_projects
    inform_about_lack_of_projects unless has_projects
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
    @open_btn.sensitive = false
    @tree_view.sensitive = false
    @spinner.show
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
    open_project(view.value(path, 1).string)
  end

  private def open_btn_clicked(_btn)
    iter = Gtk::TreeIter.new
    @tree_view.selection.selected(nil, iter)
    open_project(@projects_model.value(iter, 1).string)
  end

  private def inform_about_lack_of_projects
    message = "Tijolo is meant to be used with git projects, but no git projects were found under " \
              "<span allow_breaks=\"false\" font_family=\"monospace\">#{Path.home}</span>. " \
              "Create a git project somewhere and ask Tijolo to rescan projects."
    dialog = Gtk::MessageDialog.new(text: "No Git projects were found", secondary_text: message,
      message_type: :info, buttons: :ok, secondary_use_markup: true, transient_for: main_window)
    dialog.on_response { dialog.close }
    dialog.run
    dialog.destroy
  end
end
