require "toml"

class ConfigError < Exception
end

class Config
  PATH = ".config/tijolo/tijolo.toml"

  @@instance : Config?

  enum Mode
    Strict
    Relaxed
  end

  struct ErrorInfo
    property key : String
    property default_value : TOML::Type?
    property cause : String

    def initialize(@key, @default_value, @cause)
    end
  end

  getter ignored_dirs : Array(Path)
  getter? lazy_start_language_servers : Bool
  getter shortcuts : Hash(String, String)
  getter language_servers : Hash(String, String)
  property? trim_trailing_white_space_on_save : Bool

  def self.instance
    @@instance ||= begin
      Config.new(File.read(path), :relaxed)
    rescue e : IO::Error
      Log.info { "Error loading config file: #{e.message}, creating a new one." }
      create_config_if_needed
      Config.new(default_contents)
    rescue e : TOML::ParseException
      Log.info { "Error loading config file: #{e.message}" }
      Config.new(default_contents)
    end
  end

  def self.default_contents
    {{ read_file("#{__DIR__}/../tijolo.toml") }}
  end

  def self.create_config_if_needed
    File.write(path, default_contents) unless File.exists?(path)
  end

  def self.replace(other : Config)
    @@instance = other
  end

  def self.restore_default
    @@instance = Config.new(default_contents)
  end

  def self.path
    Path.home.join(PATH)
  end

  def initialize(contents : String, mode : Mode = Mode::Strict)
    toml = TOML.parse(contents)
    if contents != Config.default_contents
      defaults = TOML.parse(Config.default_contents)

      each_invalid_entry(toml, defaults) do |error|
        msg = "Invalid config entry for key #{error.key.inspect}, #{error.cause}"
        raise ConfigError.new(msg) if mode.strict?

        Log.error { msg }
        error.default_value.not_nil!
      end
    end

    @lazy_start_language_servers = toml["lazy_start_language_servers"].as(Bool)
    @shortcuts = toml["shortcuts"].as(Hash).transform_values(&.as(String))
    @language_servers = toml["language-servers"].as(Hash).transform_values(&.as(String))
    @trim_trailing_white_space_on_save = toml["trim_trailing_white_space_on_save"].as(Bool)
    @ignored_dirs = toml["ignored_dirs"].as(Array).map { |e| Path.new(e.as(String)) }
  end

  private def each_invalid_entry(toml : Hash, defaults : Hash, &block : Proc(ErrorInfo, TOML::Type))
    defaults.each do |key, default_value|
      value = toml[key]?
      error = validate_value(value, default_value)
      if error
        info = ErrorInfo.new(key, default_value, error)
        toml[key] = block.call(info)
      elsif value.is_a?(Hash) && default_value.is_a?(Hash)
        each_invalid_entry(value, default_value, &block)
      end
    end
  end

  # Return a string with the error or nil if there's no error
  def validate_value(value, default_value) : String?
    return "found nil value" if value.nil?
    return "expected #{default_value.class}, found #{value.class}" if value.class != default_value.class

    if value.is_a?(Array) && default_value.is_a?(Array)
      item_type = default_value.as(Array).first.class
      return "expected all items to be #{item_type}" if value.any? { |i| i.class != item_type }
    end
  end

  # This was a config flag in the past
  def style_scheme
    "monokai"
  end
end
