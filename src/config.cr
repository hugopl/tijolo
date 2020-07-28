require "yaml"

class Config
  include YAML::Serializable

  PATH = ".config/tijolo/tijolo.yaml"

  @@instance : Config?

  property ignored_dirs : Array(Path)?
  property? lazy_start_language_servers = false
  setter shortcuts : Hash(String, String)?
  setter language_servers : Hash(String, String)?
  property? trailing_whitespace = true

  def self.instance
    @@instance ||= load_yaml
  end

  def self.load_yaml_contents(contents : String | IO)
    from_yaml(contents)
  end

  private def self.load_yaml
    File.open(path) do |fp|
      from_yaml(fp)
    end
  rescue e : IO::Error
    Log.error { "Error loading config file (#{path}): #{e.message}, using default values." }
    Config.new
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

  def ignored_dirs : Array(Path)
    @ignored_dirs ||= [Path.new("node_modules"), Path.new("tmp/cache")]
  end
end
