require "log"
require "./project"

class ProjectMonitor
  @monitors = Hash(String, Gio::FileMonitor).new

  def initialize(@project : Project)
    @project.each_directory do |dir|
      create_monitor(dir.to_s)
    end
    Log.info { "Monitoring #{@monitors.size} directories for changes." }
  end

  private def create_monitor(dir : String)
    return if @monitors.has_key?(dir)

    @monitors[dir] = monitor = Gio::File.new_for_path(dir).monitor_directory(:watch_moves, nil)
    monitor.on_changed(&->file_changed(Gio::FileMonitor, Gio::File, Gio::File?, Gio::FileMonitorEvent))
  end

  private def destroy_monitor(dir : String)
    monitor = @monitors.delete(dir)
    monitor.unref if monitor
  end

  private def file_changed(monitor : Gio::FileMonitor, file : Gio::File, other_file : Gio::File?, event : Gio::FileMonitorEvent)
    file_path = file.parse_name
    if File.directory?(file_path)
      case event
      when .created?
        create_monitor(file_path)
      when .deleted?
        destroy_monitor(file_path)
      when .renamed?
        destroy_monitor(file_path)
        create_monitor(other_file.parse_name) if other_file
      end
    else
      case event
      when .changed?
        # FIXME: tell project file changed.. then IDE ask user to load modifications
      when .created? then @project.add_file(Path.new(file_path))
      when .deleted? then @project.remove_file(Path.new(file_path))
      when .renamed?
        if other_file
          @project.remove_file(Path.new(file.parse_name))
          @project.add_file(Path.new(other_file.parse_name))
        end
      end
    end
  end
end
