require "./window"
require "./tijolo_rc"

class WelcomeWindow < Window
  @entry : Gtk::Entry
  @projects_model : Gtk::ListStore
  @rescan_btn : Gtk::Button
  @projects_view : Gtk::TreeView
  @haystack : Fzy::PreparedHaystack?
  @available_projects = Array(RCData::Project).new
  private getter project_results_cursor = 0
  @scanning_projects = false

  delegate open_project, to: @application

  def initialize(application : Application)
    builder = builder_for("welcome_window")
    super(application, builder)

    Gtk::Label.cast(builder["version"]).label = "v#{VERSION}"

    @projects_view = Gtk::TreeView.cast(builder["tree_view"])
    @projects_view.selection.mode = :browse
    @projects_view.on_row_activated(&->project_activated(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn))

    @entry = Gtk::Entry.cast(builder["open_project_entry"])
    @entry.on_key_press_event(&->entry_key_pressed(Gtk::Widget, Gdk::EventKey))
    @entry.on_activate(&->entry_activated(Gtk::Entry))
    @entry.connect("notify::text", &->entry_text_changed)

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
      scan_projects_finished
    end
  end

  private def entry_key_pressed(_widget : Gtk::Widget, event : Gdk::EventKey)
    if event.keyval == Gdk::KEY_Up
      self.project_results_cursor -= 1
      return true
    elsif event.keyval == Gdk::KEY_Down
      return true if @projects_model.iter_n_children(nil) < 2 # First item is already selected...

      self.project_results_cursor += 1
      return true
    elsif event.keyval == Gdk::KEY_F5 # This should be a GTK action, but who cares...
      scan_projects
    end
    false
  end

  private def entry_activated(_entry : Gtk::Entry)
    return if @projects_model.iter_n_children(nil).zero?

    iter = Gtk::TreeIter.new
    @projects_view.selection.selected(nil, iter)
    open_project(@projects_model.value(iter, 1).string)
  end

  private def entry_text_changed
    haystack = @haystack
    return if haystack.nil? || haystack.empty?

    @projects_model.clear
    results = Fzy.search(@entry.text, haystack)

    iter = Gtk::TreeIter.new
    results.each do |match|
      project = @available_projects[match.index]
      @projects_model.append(iter)
      @projects_model.set(iter, {0, 1}, {markup(project), project.path.to_s})
    end
    self.project_results_cursor = 0
  end

  def project_results_cursor=(row : Int32)
    row = row.clamp(0, @projects_model.iter_n_children(nil) - 1)
    @project_results_cursor = row
    @projects_view.set_cursor(row)
  end

  private def markup(project : RCData::Project) : String
    home = Path.home.to_s

    project_path = project.path.to_s
    project_path_label = project_path.starts_with?(home) ? project_path.sub(home, "~") : project_path
    last_used = format_last_used(project)
    "<b>#{project.name}</b>\n<i><small>#{project_path_label}#{last_used}</small></i>"
  end

  private def format_last_used(project) : String
    last_used = project.last_used
    return "" if last_used.nil?

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
    " - opened #{ago_str}."
  end

  private def scan_projects(_button = nil)
    return if @scanning_projects

    @scanning_projects = true
    @rescan_btn.sensitive = false
    @projects_view.sensitive = false
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

  private def scan_projects_finished : Bool
    @projects_model.clear
    @available_projects = TijoloRC.instance.projects
    @haystack = Fzy::PreparedHaystack.new(@available_projects.map(&.path.to_s))
    entry_text_changed

    @rescan_btn.sensitive = true
    @projects_view.sensitive = true
    @spinner.hide
    @entry.grab_focus
    @scanning_projects = false

    inform_about_lack_of_projects unless @available_projects.any?
    false
  end

  private def project_activated(view, path, _column)
    open_project(view.value(path, 1).string)
  end

  private def inform_about_lack_of_projects
    message = "Tijolo is meant to be used with git projects but no git projects were found under " \
              "<span allow_breaks=\"false\" font_family=\"monospace\">#{Path.home}</span>. " \
              "Create a git project somewhere and ask Tijolo to rescan projects."
    dialog = Gtk::MessageDialog.new(text: "No Git projects were found", secondary_text: message,
      message_type: :info, buttons: :ok, secondary_use_markup: true, transient_for: main_window)
    dialog.on_response { dialog.close }
    dialog.run
    dialog.destroy
  end
end
