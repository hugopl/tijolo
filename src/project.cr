require "log"

module ProjectListener
  abstract def project_file_added(path : Path)
  abstract def project_file_removed(path : Path)
  abstract def project_folder_renamed(old_path : Path, new_path : Path)
end

class Project
  # FIXME this should be configurable
  IGNORED_DIRS = %w(node_modules)

  observable_by ProjectListener

  # All paths here should be relative to `root`.
  getter files = Set(Path).new
  getter root : Path

  def initialize(location : String)
    @root = find_root(Path.new(location)).normalize

    Log.info { "Project root: #{@root}" }
    scan_files
    Dir.cd(@root)
  end

  def self.name(path)
    File.basename(path).tr("-_", " ").titleize
  end

  def name
    Project.name(@root)
  end

  def under_project?(path : Path)
    file_path = path.expand
    file_path.parts[0...@root.parts.size] == @root.parts
  end

  def add_file(file_path : String)
    add_file(Path.new(file_path))
  end

  def add_file(file_path : Path) : Bool
    return false unless under_project?(file_path)

    relative_path = file_path.expand.relative_to(@root)
    @files.add?(relative_path).tap do
      notify_project_file_added(relative_path)
    end
  end

  def remove_file(file_path : String)
    remove_file(Path.new(file_path))
  end

  def remove_file(file_path : Path) : Bool
    relative_path = file_path.relative_to(@root)
    return false unless @files.includes?(relative_path)

    @files.delete(relative_path)
    notify_project_file_removed(relative_path)
    true
  end

  def rename_folder(old_path : String, new_path : String)
    rename_folder(Path.new(old_path), Path.new(new_path))
  end

  # Both paths must be at same level.. or weird things will happen
  def rename_folder(old_path : Path, new_path : Path) : Nil
    old_path = old_path.relative_to(@root)
    new_path = new_path.relative_to(@root)

    old_path_str = "#{old_path}/"
    new_path_str = new_path.to_s
    files_to_remove = [] of Path
    files_to_add = [] of Path
    @files.each do |file|
      if file.to_s.starts_with?(old_path_str)
        files_to_add << Path.new(file.to_s.sub(old_path.to_s, new_path_str))
        files_to_remove << file
      end
    end
    files_to_remove.each { |f| @files.delete(f) }
    files_to_add.each { |f| @files << f }
    notify_project_folder_renamed(old_path, new_path) if files_to_remove.any?
  end

  def each_directory
    dirs = @files.map(&.dirname).select!(&.index('/')).uniq!
    uniq_dirs = Set(String).new(dirs)

    # Get the inner this
    while dirs.any?
      dirs = dirs.map! { |dir| File.dirname(dir) }.uniq!
      dirs.delete(".")
      dirs.each { |dir| uniq_dirs << dir }
    end

    yield @root.to_s
    uniq_dirs.each do |dir|
      yield(@root.join(dir))
    end
  end

  def self.scan_projects(dir : Path, projects = [] of Path)
    if File.exists?(dir.join(".git"))
      projects << dir
    else
      entries = Dir.open(dir.to_s, &.entries)
      entries.each do |entry|
        next if entry.starts_with?(".")

        path = Path.new(dir, entry)
        info = File.info(path.to_s, follow_symlinks: false)
        scan_projects(path, projects) if info.directory?
      end
    end
    projects.sort!
    return projects
  end

  private def find_root(location : Path) : Path
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
    raise AppError.new("Valid git project directory not found at #{location.expand}.")
  end

  private def scan_files
    # TODO: scan files in another thread
    start_t = Time.monotonic
    scan_dir(@root, @files)
    @files = files
    Log.info { "files scan: #{Time.monotonic - start_t}" }
  end

  private def scan_dir(dir : Path, files)
    entries = Dir.open(dir, &.entries)
    entries.each do |entry|
      next if entry == "." || entry == ".."

      path = Path.new(dir, entry)
      info = File.info(path.to_s, follow_symlinks: false)
      if info.symlink?
        next
      elsif info.file?
        files << path.relative_to(@root)
      elsif info.directory? && entry[0] != '.' && !IGNORED_DIRS.includes?(entry)
        scan_dir(path, files)
      end
    end
  end
end
