GICrystal.require("GtkSource", "5")
require "./code_buffer"

class CodeEditor < GtkSource::View
  def initialize(source : IO?, language : String?)
    super(css_name: "codeeditor",
      show_line_numbers: true,
      monospace: true,
      auto_indent: true,
      smart_backspace: true,
      smart_home_end: :before)

    supress_source_view_key_bindings
    setup(source, language)
  end

  private def supress_source_view_key_bindings
    sc_controller = Gtk::ShortcutController.new(propagation_phase: :capture)
    action = Gtk::CallbackAction.new(->(w : Gtk::Widget, v : GLib::Variant?) { true })
    # Remore shortcuts that clash with Tijolo shortcuts
    # move-words, move-lines and move-viewport
    trigger = Gtk::ShortcutTrigger.parse_string("<Alt>Up|<Alt>Right|<Alt>Down|<Alt>Left|<Alt><Shift>Up|<Alt><Shift>Down")
    shortcut = Gtk::Shortcut.new(action: action, trigger: trigger)
    sc_controller.add_shortcut(shortcut)
    add_controller(sc_controller)
  end

  private def setup(source, language)
    gsv_buffer = buffer.buffer
    gsv_buffer.text = source.gets_to_end if source
    gsv_buffer.language = GtkSource::LanguageManager.default.language(language) if language

    self.color_scheme = Adw::StyleManager.default.color_scheme

    iter = gsv_buffer.iter_at_offset(0)
    gsv_buffer.place_cursor(iter)
  end

  # For compatibility with non-gsv CodeEditor
  {% for attr in %w(tab_width right_margin_position) %}
  def {{ attr.id }}=(value : Int32)
    self.{{ attr.id }} = value.to_u32
  end
  {% end %}

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

  def color_scheme=(scheme : Adw::ColorScheme)
    gsv_buffer = buffer.buffer
    style_manager = GtkSource::StyleSchemeManager.default

    if scheme.force_dark?
      gsv_buffer.style_scheme = style_manager.scheme("Adwaita-dark")
    else
      gsv_buffer.style_scheme = style_manager.scheme("Adwaita")
    end
  end
end

def init_gtk_source_view
  exe_path = Process.executable_path || raise TijoloError.new("Cannot find executable path")
  usr_path = Path[exe_path, "../../"]

  paths = [usr_path.join("share/tijolo/language-specs/").expand.to_s,
           usr_path.join("local/share/tijolo/language-specs/").expand.to_s,
           Path.home.join(".local/share/tijolo/language-specs/").expand.to_s]
  # data dir has preference on debug builds
  {% unless flag?(:release) %}
    paths.unshift("#{__DIR__}/../../data/language-specs/")
  {% end %}
  lm = GtkSource::LanguageManager.default
  paths.concat(lm.search_path.to_a)
  lm.search_path = paths
end

init_gtk_source_view