require "log"
require "./project"

class ProjectMonitor
  include ProjectListener

  # The is a directory path relative to the project root
  @monitors = Hash(String, Gio::FileMonitor).new

  def initialize(@project : Project)
    @project.add_project_listener(self)
  end

  private def create_monitors
    @project.each_directory do |dir|
      create_monitor(dir.to_s)
    end
    Log.info { "Monitoring #{@monitors.size} directories for changes." }
  end

  private def create_monitor(dir : String)
    return if @monitors.has_key?(dir)

    @monitors[dir] = monitor = Gio::File.new_for_path(dir).monitor_directory(:none, nil)
    monitor.on_changed(&->file_changed(Gio::FileMonitor, Gio::File, Gio::File?, Gio::FileMonitorEvent))
  end

  private def destroy_monitor(dir : String)
    @monitors[dir]?.try(&.cancel)
    @monitors.delete(dir)
  end

  private def file_changed(_monitor : Gio::FileMonitor, file : Gio::File, other_file : Gio::File?, event : Gio::FileMonitorEvent)
    file_path = Path.new(file.parse_name)
    other_path = Path.new(other_file.parse_name) if other_file

    case event
    when .created?
      @project.add_path(file_path)
    when .deleted?
      @project.remove_path(file_path)
    when .renamed?
      @project.rename_path(file_path, other_path) if other_path
    when .changed?
      @project.notify_project_file_content_changed(file_path)
    end
  end

  def project_dir_added(path : Path)
    create_monitor(path.to_s)
  end

  def project_dir_removed(path : Path)
    destroy_monitor(path.to_s)
  end

  def project_load_finished
    create_monitors
  end
end
