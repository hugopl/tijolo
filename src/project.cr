require "log"

class Project
  # FIXME this should be configurable
  IGNORED_DIRS = %w(node_modules)

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

  def add_file(file_path : Path) : Bool
    file_path = file_path.expand
    return false if file_path.parts[0...@root.parts.size] != @root.parts

    @files.add?(file_path.relative_to(@root))
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
