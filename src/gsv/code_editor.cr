GICrystal.require("GtkSource", "5")
require "./code_buffer"

class CodeEditor < GtkSource::View
  def initialize(source : IO?, language : String?)
    super()

    setup(source, language)
  end

  private def setup(source, language)
    gsv_buffer = buffer.buffer
    gsv_buffer.text = source.gets_to_end if source
    gsv_buffer.language = GtkSource::LanguageManager.default.language(language) if language

    style_manager = GtkSource::StyleSchemeManager.default
    gsv_buffer.style_scheme = style_manager.scheme("Adwaita-dark")

    iter = gsv_buffer.iter_at_offset(0)
    gsv_buffer.place_cursor(iter)
  end

  def buffer : CodeBuffer
    buffer = super
    CodeBuffer.new(GtkSource::Buffer.cast(buffer))
  end

  def cursor_changed_signal
    buffer.buffer.notify_signal["cursor-position"]
  end

  def cursor_line_col
    buffer = self.buffer
    return {0, 0} if buffer.nil?

    iter = buffer.buffer.iter_at_offset(buffer.cursor_position)
    {iter.line, iter.line_offset}
  end
end

def init_gtk_source_view
  exe_path = Process.executable_path || raise TijoloError.new("Cannot find executable path")
  usr_path = Path[exe_path, "../../"]

  paths = [usr_path.join("share/tijolo/language-specs/").expand.to_s,
           usr_path.join("local/share/tijolo/language-specs/").expand.to_s,
           Path.home.join(".local/share/tijolo/language-specs/").expand.to_s]
  # data dir has preference on debug builds
  {% if flag?(:debug) %}
    paths.unshift("#{__DIR__}/../../data/language-specs/")
  {% end %}
  lm = GtkSource::LanguageManager.default
  paths.concat(lm.search_path.to_a)
  lm.search_path = paths
end

init_gtk_source_view
