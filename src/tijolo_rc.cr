require "json"

module RCData
  struct ViewCursor
    include JSON::Serializable

    property pos : {Int32, Int32}

    def initialize(line, col)
      @pos = {line, col}
    end
  end

  class Project
    include JSON::Serializable

    property path : Path
    property last_used : Time?
    property cursors : Hash(String, ViewCursor)?

    def initialize(@path, @last_used = nil)
    end

    def reject?
      !File.exists?(@path)
    end

    def name
      ::Project.name(@path)
    end

    def <=>(other)
      if @last_used == other.last_used
        name_sort = name <=> other.name
        name_sort.zero? ? @path <=> other.path : name_sort
      elsif @last_used.nil?
        1
      elsif other.last_used.nil?
        -1
      else
        other.last_used.not_nil! <=> @last_used.not_nil!
      end
    end

    def save_cursor_position(file_path, line, col)
      cursors = @cursors ||= Hash(String, ViewCursor).new
      if line.zero? && col.zero?
        cursors.delete(file_path.to_s)
        @cursors = nil if cursors.empty?
      else
        cursors[file_path.to_s] = ViewCursor.new(line, col)
      end
    end

    def cursor_position(file_path)
      cursors = @cursors
      return {0, 0} if cursors.nil?

      cursor = cursors[file_path.to_s]?
      cursor.nil? ? {0, 0} : cursor.pos
    end
  end
end

# Tijolo Runtime Configuration
class TijoloRC
  include JSON::Serializable

  PATH = ".local/share/tijolo/tijolorc.json"

  property? scan_projects = true
  getter projects : Array(RCData::Project)

  @@instance : self?

  def initialize
    @projects = Array(RCData::Project).new
  end

  def self.instance
    @@instance ||= load
  end

  def self.path
    Path.home.join(PATH)
  end

  def self.load_contents(contents : String | IO)
    from_json(contents).tap do |config|
      config.filter_data!
    end
  end

  private def self.load
    load_contents(File.read(path))
  rescue e
    Log.error { "Error loading config file, using default values: #{e.message}" }
    TijoloRC.new
  ensure
    at_exit do
      instance.try(&.save)
    end
  end

  def filter_projects!
    @projects.reject!(&.reject?).sort!
  end

  protected def filter_data!
    filter_projects!
  end

  def add_project(path : Path) : RCData::Project
    project = @projects.find { |proj| proj.path == path }

    if project.nil?
      project = RCData::Project.new(path, nil)
      @projects << project
    end
    project
  end

  def touch_project(path : Path) : Nil
    project = @projects.find { |proj| proj.path == path }
    if project.nil?
      project = RCData::Project.new(path)
      @projects << project
    end
    project.last_used = Time.utc
  end

  def save_cursor_position(project_path, file_path, line, col) : Nil
    project = add_project(project_path)
    project.save_cursor_position(file_path, line, col)
  end

  def cursor_position(project_path, file_path) : {Int32, Int32}
    project = add_project(project_path)
    project.cursor_position(file_path)
  end

  def save
    path = TijoloRC.path
    Log.info { "Saving config to #{path}" }
    if !File.exists?(path)
      Dir.mkdir_p(path.dirname)
    end
    File.write(path, to_json)
  rescue e
    Log.fatal { "Error saving config file: #{e.message}" }
  end
end
