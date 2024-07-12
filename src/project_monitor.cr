class ProjectMonitor
  @monitors = Hash(String, Gio::FileMonitor).new
  @project : Project

  Log = ::Log.for(self)

  def initialize(@project)
  end

  def project_load_finished
    @project.each_directory do |dir|
      create_monitor(dir.to_s)
    end
    Log.info { "Monitoring #{@monitors.size} directories for changes." }
  end

  private def create_monitor(dir : String)
    return if @monitors.has_key?(dir)

    @monitors[dir] = monitor = Gio::File.new_for_path(dir).monitor_directory(:none, nil)
    Log.debug { "Monitoring #{dir} for changes." }
    monitor.changed_signal.connect(&->dir_changed(Gio::File, Gio::File?, Gio::FileMonitorEvent))
  end

  private def destroy_monitor(dir : String)
    monitor = @monitors.delete(dir)
    if monitor
      Log.debug { "Destroying monitor #{dir}" }
      monitor.cancel
    end
  end

  private def dir_changed(file : Gio::File, other_file : Gio::File?, event : Gio::FileMonitorEvent)
    # TODO: Handle changes_done_hint and just bufferize things on created events.
    return if event.changed? || event.changes_done_hint?

    file_path = Path.new(file.parse_name)
    other_path = Path.new(other_file.parse_name) if other_file

    case event
    when .created?
      @project.add_path(file_path)
      create_monitor(file_path.to_s) if File.info(file_path).directory?
    when .deleted?
      destroy_monitor(file_path.to_s)
      @project.remove_path(file_path)
    when .renamed?
      @project.rename_path(file_path, other_path) if other_path
    end
  rescue e : File::NotFoundError
    Log.warn { e.message }
  end
end
