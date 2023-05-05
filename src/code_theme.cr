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

  property colors : Hash(String, String)
  property styles : Hash(String, SerializableCodeThemeStyle)

  def color(name : String) : String?
    color = @colors[name]?
    return color if color

    Log.debug { "Unknown code theme style color: #{name}" }
    nil
  end
end

class CodeTheme
  Log = ::Log.for("theme")

  @theme : SerializableCodeTheme

  def initialize
    data_home = Path.new(ENV["XDG_DATA_HOME"]? || "~/.local/share").expand(home: true)
    theme_file = data_home.join("tijolo", "styles", "default.yaml")
    @theme = SerializableCodeTheme.from_yaml(File.read(theme_file))
  end

  # FIXME: Pango bindings memory management still buggy, so until I fix it the attributes will be created as a string.
  def style_to_s(io : IO, style : String, start_point : Int32, end_point : Int32) : Nil
    theme_style = @theme.styles[style]?
    if theme_style.nil?
      Log.debug { "No code theme style found for: #{style}" }
      return
    end

    color = @theme.colors[theme_style.fg_color]?
    if color.nil?
      Log.debug { "Unknown code theme style color: #{theme_style.fg_color}" }
      return
    end
    io << start_point << ' ' << end_point << " foreground " << @theme.color(theme_style.fg_color) << ','
  end
end
