require "log"
require "./config"
require "./tijolo_error"

class ProjectError < TijoloError
end

class Project
  getter root : Path = Path.new
  getter? load_finished = false

  @files_mutex = Mutex.new
  @ignored_dirs = [] of Path

  # All paths here should be relative to `root`, directories doesn't include root dir.
  @directories = Set(Path).new
  @files = Set(Path).new

  def initialize
  end

  def initialize(location : Path)
    self.root = location
  end

  def root=(location : Path)
    raise ProjectError.new("Project already loaded") if valid?

    root = Project.find_root(location)
    raise ProjectError.new("Root not found") if root.nil?

    @root = root
    Dir.cd(root)
    @ignored_dirs = Config.instance.ignored_dirs.map(&.expand(base: root))
  end

  def valid?
    !@root.to_s.empty?
  end

  def self.valid?(path : Path)
    !Project.find_root(path).nil?
  end

  def self.name_from_path(path)
    File.basename(path).tr("-_", " ").titleize
  end

  def name
    Project.name_from_path(@root)
  end

  def under_project?(path : Path) : Bool
    return false unless valid?

    file_path = path.expand(base: @root)
    file_path.parts[0...@root.parts.size] == @root.parts
  end

  def files : Enumerable(Path)
    @files_mutex.synchronize do
      @files.dup
    end
  end

  def add_path(path : Path) : Bool
    path = path.relative_to(@root)
    return false unless under_project?(path)

    if File.directory?(path)
      add_files_in_dir(path)
    else
      add_single_file_path(path)
    end
  end

  private def add_files_in_dir(dir_path) : Bool
    files = [] of Path
    directories = [] of Path
    scan_dir(dir_path, files, directories)

    @files_mutex.synchronize do
      files.each { |file| @files.add?(file) }
      directories.each { |dir| @directories.add?(dir) }
    end
    files.each do |file|
      notify_project_file_added(file)
    end
    directories.each do |dir|
      notify_project_dir_added(dir)
    end
    notify_project_files_changed if files.any?

    files.any? || directories.any?
  end

  private def add_single_file_path(relative_path) : Bool
    added = false
    missing_dirs = missing_directories(relative_path)
    @files_mutex.synchronize do
      added = @files.add?(relative_path)
    end
    if added
      missing_dirs.each do |dir|
        notify_project_dir_added(dir)
      end
      notify_project_file_added(relative_path)
      notify_project_files_changed
    end
    added
  end

  private def missing_directories(relative_file_path) : Array(Path)
    path = Path.new(relative_file_path.dirname)
    missing_dirs = [] of Path
    @files_mutex.synchronize do
      while path.to_s != "." && !@directories.includes?(path)
        missing_dirs << path
        path = Path.new(path.dirname)
      end
    end
    missing_dirs
  end

  def remove_path(path : Path) : Bool
    path = path.relative_to(@root)
    return true if remove_file_path(path)

    files_to_delete = [] of Path
    dirs_to_delete = [] of Path
    @files_mutex.synchronize do
      return false unless @directories.includes?(path)

      # Remove all files under this dir.
      path_str = "#{path}/"
      files_to_delete = @files.select(&.to_s.starts_with?(path_str))
      files_to_delete.not_nil!.each do |file|
        @files.delete(file)
      end

      # Remove all directories under this dir
      dirs_to_delete = @directories.select(&.to_s.starts_with?(path_str)).uniq!
      dirs_to_delete << path
      dirs_to_delete.each do |file|
        @directories.delete(file)
      end
    end
    files_to_delete.each do |file|
      notify_project_file_removed(file)
    end
    dirs_to_delete.each do |dir|
      notify_project_dir_removed(dir)
    end
    notify_project_files_changed
    files_to_delete.any? || dirs_to_delete.any?
  end

  # file_path should already be relative to the project
  private def remove_file_path(relative_path : Path) : Bool
    @files_mutex.synchronize do
      return false unless @files.includes?(relative_path)

      @files.delete(relative_path)
    end
    notify_project_file_removed(relative_path)
    notify_project_files_changed
    true
  end

  def rename_path(old_path : Path, new_path : Path)
    # FIXME: Proper rename folders
    remove_path(old_path)
    add_path(new_path)
  end

  def each_directory
    yield @root.to_s
    @files_mutex.synchronize do
      @directories.each do |dir|
        yield(@root.join(dir))
      end
    end
  end

  def self.scan_projects(dir : Path, &block : Proc(Path, Nil))
    if File.exists?(dir.join(".git"))
      block.call(dir)
    else
      entries = Dir.open(dir.to_s, &.entries)
      entries.each do |entry|
        next if entry.starts_with?(".")

        path = Path.new(dir, entry)
        info = File.info(path.to_s, follow_symlinks: false)
        scan_projects(path, &block) if info.directory?
      end
    end
  end

  protected def self.find_root(location : Path) : Path?
    path = location.expand
    root = path.root.not_nil!

    loop do
      git_path = path.join(".git")
      git_found = File.exists?(git_path)
      if git_found
        return path
      else
        path = path.parent
        break if path == root
      end
    end
    nil
  end

  def scan_files(on_finish : Proc(Nil))
    # Can't use spawn here, or the Fiber will be stuck when the program flow is inside glib main loop.
    Thread.new do
      start_t = Time.monotonic
      files = Set(Path).new
      directories = Set(Path).new
      scan_dir(@root, files, directories)
      @files_mutex.synchronize do
        @files = files
        @directories = directories
      end
      @load_finished = true
      Log.info { "#{files.size} project files found in #{Time.monotonic - start_t}" }
      GLib.idle_add do
        on_finish.call
        false
      end
    end
  end

  private def should_ignore_dir?(path) : Bool
    @ignored_dirs.any?(path)
  end

  private def scan_dir(dir : Path, files, directories)
    return if should_ignore_dir?(dir)

    directories << dir.relative_to(@root) if dir != @root
    entries = Dir.open(dir, &.entries)
    entries.each do |entry|
      next if entry == "." || entry == ".."

      path = Path.new(dir, entry)
      info = File.info(path.to_s, follow_symlinks: false)
      if info.symlink?
        next
      elsif info.file?
        files << path.relative_to(@root)
      elsif info.directory? && entry[0] != '.'
        scan_dir(path, files, directories)
      end
    end
  end
end
