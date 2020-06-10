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
    @monitors[dir]?.try(&.cancel)
    @monitors.delete(dir)
  end

  private def file_changed(_monitor : Gio::FileMonitor, file : Gio::File, other_file : Gio::File?, event : Gio::FileMonitorEvent)
    file_path = file.parse_name
    if File.directory?(file_path)
      case event
      when .created?
        create_monitor(file_path)
      when .deleted?
        destroy_monitor(file_path)
      end
    else
      case event
      when .changes_done_hint?
        # FIXME: tell project file changed.. then IDE ask user to load modifications
      when .created? then @project.add_file(file_path)
      when .deleted? then @project.remove_file(file_path)
      when .moved_in?
        Log.warn { "MOVED IN event not yet supported." }
      when .moved_out?
        Log.warn { "MOVED OUT event not yet supported." }
      when .renamed?
        return if other_file.nil?

        other_file_path = other_file.parse_name
        if File.directory?(other_file_path)
          destroy_monitor(file_path)
          create_monitor(other_file_path)
          @project.rename_folder(file_path, other_file_path)
        else
          @project.remove_file(file_path)
          @project.add_file(other_file_path)
        end
      end
    end
  end
end
