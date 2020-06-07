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
    # Depends on https://github.com/jhass/crystal-gobject/issues/67
    # monitor.on_changed(&->file_changed(Gio::FileMonitor, Gio::File, Gio::File, Gio::FileMonitorEvent))
  end

  private def destroy_monitor
  end

  private def file_changed(monitor : Gio::FileMonitor, file : Gio::File, other_file : Gio::File, event : Gio::FileMonitorEvent)
    case event
    when .changes_done_hint?
      puts "done hint!"
    when .changed?
      puts "changed"
    when .deleted?
      puts "deleted"
    when .created?
      puts "created"
    when .renamed?
      puts "renamed"
    when .attribute_changed? # change readonly
      puts "attr changed"
    end
  end
end
