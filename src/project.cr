require "log"
require "./config"
require "./tijolo_error"

class ProjectError < TijoloError
end

class Project < GObject::Object
  Log          = ::Log.for(self)
  IGNORED_DIRS = {".git", ".hg", ".svn", ".ccls-cache"}

  getter root : Path = Path.new
  getter? load_finished = false

  @files_mutex = Mutex.new
  @ignored_dirs = [] of Path

  # All paths here should be relative to `root`, directories doesn't include root dir.
  @directories = Set(Path).new
  @files = Set(Path).new

  # Emitted when a file was added or removed from project
  signal files_changed
  @files_changed = false

  def initialize
    super
  end

  def initialize(location : Path)
    super()
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

  def files_changed!
    return if @files_changed

    @files_changed = true
    GLib.idle_add(:low) do
      files_changed_signal.emit
      @files_changed = false
      false
    end
  end

  def add_path(path : Path)
    Dir.exists?(path) ? add_dir(path) : add_file(path)
    files_changed!
  end

  def remove_path(path : Path)
    @directories.includes?(path) ? remove_dir(path) : remove_file(path)
    files_changed!
  end

  def rename_path(old_path : Path, new_path : Path)
    # FIXME: Proper rename folders
    remove_path(old_path)
    add_path(new_path)
  end

  private def add_file(path : Path) : Nil
    path = path.relative_to(@root)
    Log.debug { "add file: #{path}" }

    @files_mutex.synchronize do
      @files.add?(path)
    end
  end

  private def add_dir(path : Path) : Nil
    path = path.relative_to(@root)
    Log.debug { "add dir: #{path}" }

    files = Set(Path).new
    directories = Set(Path).new
    scan_dir(path, files, directories)

    @files_mutex.synchronize do
      files.each do |file|
        @files.add?(file)
      end
      directories.each { |f| @directories.add(f) }
    end
  end

  private def remove_dir(path : Path) : Nil
    path = path.relative_to(@root)
    # Remove all files under this dir.
    path_str = "#{path}/"
    @files_mutex.synchronize do
      files_to_remove = @files.select(&.to_s.starts_with?(path_str))
      @files.subtract(files_to_remove)
    end
  end

  private def remove_file(path : Path) : Nil
    path = path.relative_to(@root)
    @files_mutex.synchronize do
      @files.delete(path)
    end
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

    return unless File.exists?(location)

    File.directory?(location) ? location : Path.new(File.dirname(location))
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

  private def scan_dir(dir : Path, files : Set(Path), directories : Set(Path))
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
      elsif info.directory? && !entry.in?(IGNORED_DIRS)
        scan_dir(path, files, directories)
      end
    end
  end
end
