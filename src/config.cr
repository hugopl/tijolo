require "yaml"

class Config
  PATH = ".config/tijolo/tijolo.yaml"

  class ProjectEntry
    YAML.mapping(path: String, last_used: Time?)

    def initialize(@path : String, @last_used : Time? = nil)
    end

    def exists?
      File.exists?(@path)
    end

    def name
      Project.name(@path)
    end
  end

  YAML.mapping(projects: Array(ProjectEntry),
    scan_projects: {type: Bool, default: true},
    style_scheme: String?,
    shortcuts: Hash(String, String)?)

  @@instance : Config?
  getter? scan_projects

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
    @projects = [] of ProjectEntry
    @scan_projects = true
    @style_scheme = ""
  end

  def style_scheme
    @style_scheme ||= "solarized-light"
  end

  def shortcuts
    @shortcuts ||= default_shortcuts
  end

  def default_shortcuts : Hash(String, String)
    @default_shortcuts ||= {
      "show_locator" => "<Control>P",
      "new_file"     => "<Control>N",
      "close_view"   => "<Control>W",
      "save_view"    => "<Control>S",
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

  protected def filter_projects!
    @projects.select!(&.exists?)
    @projects.sort! do |a, b|
      if a.last_used == b.last_used
        a.path <=> b.path
      elsif a.last_used.nil?
        1
      elsif b.last_used.nil?
        -1
      else
        b.last_used.not_nil! <=> a.last_used.not_nil!
      end
    end
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
