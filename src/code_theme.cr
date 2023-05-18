require "yaml"

private class SerializableCodeThemeStyle
  include YAML::Serializable

  property underline : Bool = false
  property bold : Bool = false
  property italic : Bool = false
  property fg_color : String
end

private class SerializableCodeTheme
  include YAML::Serializable

  @colors : Hash(String, String)
  @styles : Hash(String, SerializableCodeThemeStyle)

  def color(name : String) : String?
    color = @colors[name]?
    return color if color

    Log.debug { "Unknown code theme style color: #{name}" }
    nil
  end

  def fg_color(style : String) : String
    theme_style = @styles[style]?
    if theme_style.nil?
      Log.debug { "No code theme style found for: #{style}" }
      abort("Bad theme, text style not found.") if style == "text"
      return fg_color("text")
    end

    color(theme_style.fg_color) || "red"
  end
end

class CodeTheme
  Log = ::Log.for("theme")

  @theme : SerializableCodeTheme
  getter text_color = Gdk::RGBA.new
  getter background_color = Gdk::RGBA.new
  getter grid_color = Gdk::RGBA.new

  def self.instance
    @@instance ||= CodeTheme.new
  rescue e : KeyError
    raise TijoloError.new(e.message)
  end

  def initialize
    data_home = Path.new(ENV["XDG_DATA_HOME"]? || "~/.local/share").expand(home: true)
    theme_file = data_home.join("tijolo", "styles", "default.yaml")
    @theme = SerializableCodeTheme.from_yaml(File.read(theme_file))
    @text_color.parse(@theme.fg_color("text"))
    @background_color.parse(@theme.fg_color("background"))
    @grid_color.parse(@theme.fg_color("grid"))
  end

  # FIXME: Pango bindings memory management still buggy, so until I fix it the attributes will be created as a string.
  def style_to_s(io : IO, style : String, start_point : Int32, end_point : Int32) : Nil
    io << start_point << ' ' << end_point << " foreground " << @theme.fg_color(style) << ','
  end
end
