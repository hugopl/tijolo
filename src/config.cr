require "file_utils"
require "toml"

class ConfigError < Exception
  def initialize(exception : TOML::ParseException)
    super(exception.message)
  end

  def initialize(message)
    super(message)
  end
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
  getter log_level : Log::Severity
  property? trim_trailing_white_space_on_save : Bool
  getter? terminal_shared_view : Bool

  # editor
  getter editor_font_size : Int32
  getter editor_wrap_mode : Gtk::WrapMode
  getter editor_show_line_numbers : Bool
  getter editor_insert_spaces_instead_of_tabs : Bool
  getter editor_tab_width : Int32
  getter editor_show_right_margin : Bool
  getter editor_right_margin_position : Int32
  getter editor_highlight_current_line : Bool
  getter editor_background_pattern : GtkSource::BackgroundPatternType

  def self.instance
    @@instance ||= begin
      Config.new(File.read(path), :relaxed)
    rescue e : IO::Error
      Log.error { "Error loading config file: #{e.message}, creating a new one." }
      create_config_if_needed
      default
    rescue e : TOML::ParseException | ConfigError
      Log.error { "Error loading config file: #{e.message}" }
      default
    end
  end

  def self.default
    @@default ||= Config.new(default_contents)
  end

  def self.default_contents
    {{ read_file("#{__DIR__}/../tijolo.toml") }}
  end

  def self.create_config_if_needed
    return if File.exists?(path)

    FileUtils.mkdir_p(Config.path.dirname)
    File.write(path, default_contents)
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
    toml = load_toml(contents, mode)

    @lazy_start_language_servers = toml["lazy_start_language_servers"].as(Bool)
    @shortcuts = toml["shortcuts"].as(Hash).transform_values(&.as(String))
    @language_servers = toml["language-servers"].as(Hash).transform_values(&.as(String))
    @trim_trailing_white_space_on_save = toml["trim_trailing_white_space_on_save"].as(Bool)
    @ignored_dirs = toml["ignored_dirs"].as(Array).map { |e| Path.new(e.as(String)) }
    @log_level = parse_enum(toml, "log_level", Log::Severity)

    terminal_entry = toml["terminal"].as(Hash)
    @terminal_shared_view = terminal_entry["shared_view"].as(Bool)

    editor_entry = toml["editor"].as(Hash)
    @editor_font_size = editor_entry["font_size"].as(Int64).to_i32
    @editor_wrap_mode = parse_enum(editor_entry, "wrap_mode", Gtk::WrapMode)
    @editor_show_line_numbers = editor_entry["show_line_numbers"].as(Bool)
    @editor_insert_spaces_instead_of_tabs = editor_entry["insert_spaces_instead_of_tabs"].as(Bool)
    @editor_tab_width = editor_entry["tab_width"].as(Int64).to_i32
    @editor_show_right_margin = editor_entry["show_right_margin"].as(Bool)
    @editor_right_margin_position = editor_entry["right_margin_position"].as(Int64).to_i32
    @editor_highlight_current_line = editor_entry["highlight_current_line"].as(Bool)
    @editor_background_pattern = parse_enum(editor_entry, "background_pattern", GtkSource::BackgroundPatternType)
  end

  private def parse_enum(toml, key : String, enum_class)
    value = enum_class.parse?(toml[key].as(String))
    if value.nil?
      valid_enums = enum_class.names.map(&.downcase).join(", ")
      raise ConfigError.new("Unknown value for #{key}: #{toml[key].as(String)}, valid values are: #{valid_enums}.")
    end
    value
  end

  private def load_toml(contents, mode)
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
    toml
  rescue e : TOML::ParseException
    raise ConfigError.new(e)
  end

  private def each_invalid_entry(toml : Hash, defaults : Hash, &block : Proc(ErrorInfo, TOML::Type))
    defaults.each do |key, default_value|
      value = toml[key]?
      if value.nil?
        toml[key] = default_value
      else
        error = validate_value(value, default_value)
        if error
          info = ErrorInfo.new(key, default_value, error)
          toml[key] = block.call(info)
        elsif value.is_a?(Hash) && default_value.is_a?(Hash)
          each_invalid_entry(value, default_value, &block)
        end
      end
    end
  end

  # Return a string with the error or nil if there's no error
  def validate_value(value : TOML::Type, default_value : TOML::Type?) : String?
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
