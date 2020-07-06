require "yaml"

class Config
  include YAML::Serializable

  PATH = ".config/tijolo/tijolo.yaml"

  class ProjectEntry
    include YAML::Serializable

    property path : String
    property last_used : Time?

    def initialize(@path : String, @last_used : Time? = nil)
    end

    def exists?
      File.exists?(@path)
    end

    def name
      Project.name(@path)
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
  end

  @@instance : Config?

  property projects = [] of Config::ProjectEntry
  property? scan_projects = true
  setter shortcuts : Hash(String, String)?
  setter language_servers : Hash(String, String)?
  property? trailing_whitespace = true

  def self.instance
    @@instance ||= load_yaml
  end

  def self.load_yaml_contents(contents : String | IO)
    from_yaml(contents).tap do |config|
      config.filter_projects!
    end
  end

  private def self.load_yaml
    load_yaml_contents(File.read(path))
  rescue e : IO::Error
    Log.error { "Error loading config file, using default values: #{e.message}" }
    Config.new
  ensure
    at_exit do
      instance.try(&.save)
    end
  end

  def self.path
    Path.home.join(PATH)
  end

  def initialize
  end

  def style_scheme
    "monokai"
  end

  def shortcuts
    @shortcuts ||= default_shortcuts
  end

  def default_shortcuts : Hash(String, String)
    {
      "show_locator"    => "<Control>P",
      "new_file"        => "<Control>N",
      "open_file"       => "<Control>O",
      "close_view"      => "<Control>W",
      "save_view"       => "<Control>S",
      "save_view_as"    => "<Control><Shift>S",
      "find"            => "<Control>F",
      "find_next"       => "F3",
      "find_prev"       => "<Shift>F3",
      "goto_line"       => "<Control>G",
      "comment_code"    => "<Control>slash",
      "sort_lines"      => "F9",
      "fullscreen"      => "F11",
      "goto_definition" => "F2",
    }
  end

  def language_servers
    @language_servers ||= default_language_servers
  end

  def default_language_servers
    {
      "crystal" => "scry",
      "ruby"    => "solargraph stdio",
    }
  end

  def add_project(project_path : String)
    return if @projects.any? { |proj| proj.path == project_path }

    @projects << ProjectEntry.new(project_path, nil)
  end

  def update_last_used_of(project_path) : Nil
    project = @projects.find { |proj| proj.path == project_path.to_s }
    if project.nil?
      project = ProjectEntry.new(project_path.to_s)
      @projects << project
    end
    project.last_used = Time.utc
  end

  def filter_projects!
    @projects.select!(&.exists?)
    @projects.sort!
  end

  def save
    path = Config.path
    Log.info { "Saving config to #{path}" }
    if !File.exists?(path)
      Dir.mkdir_p(Path.home.join(".config/tijolo"))
    end
    File.write(path, to_yaml)
  rescue e
    Log.fatal { "Error saving config file: #{e.message}" }
  end
end
