GICrystal.require("GtkSource", "5")
require "./code_buffer"
require "./code_language"
require "./code_commenter"
require "./init_source_view"

class CodeEditor < GtkSource::View
  include CodeCommenter

  getter language : CodeLanguage

  def initialize(source : IO?, @language : CodeLanguage)
    super(show_line_numbers: true,
      monospace: true,
      auto_indent: true,
      smart_backspace: true,
      background_pattern: :grid,
      smart_home_end: :before,
      buffer: CodeBuffer.new)
    key = Gtk::EventControllerKey.new(propagation_phase: :target)
    key.key_pressed_signal.connect(->on_key_press(UInt32, UInt32, Gdk::ModifierType))
    add_controller(key)

    supress_source_view_key_bindings
    setup(source)
  end

  def reload(source : IO)
    setup(source)
  end

  private def on_key_press(keyval : UInt32, keycode : UInt32, state : Gdk::ModifierType) : Bool
    if keyval.in?(Gdk::KEY_bracketleft, Gdk::KEY_parenleft, Gdk::KEY_braceleft)
      return insert_char_around_selection(keyval)
    end
    false
  end

  def insert_char_around_selection(keyval : UInt32) : Bool
    return false unless buffer.has_selection?

    start_chr, end_chr = case (keyval)
                         when Gdk::KEY_bracketleft then {"[", "]"}
                         when Gdk::KEY_parenleft   then {"(", ")"}
                         when Gdk::KEY_braceleft   then {"{", "}"}
                         else
                           return false
                         end

    start_iter, end_iter = buffer.selection_bounds
    end_offset = end_iter.offset
    buffer.user_action do
      buffer.insert(start_iter, start_chr)
      start_iter.offset = end_offset + 1
      buffer.insert(start_iter, end_chr)
      start_iter.backward_char
      buffer.move_mark_by_name("selection_bound", start_iter)
    end
    true
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

  private def setup(source)
    buffer.text = source.gets_to_end if source
    unless @language.none?
      buffer.language = GtkSource::LanguageManager.default.language(@language.id)
    end

    self.color_scheme = Adw::StyleManager.default.color_scheme

    iter = buffer.iter_at_offset(0)
    buffer.place_cursor(iter)
    buffer.modified = false
  end

  # For compatibility with non-gsv CodeEditor
  {% for attr in %w(tab_width right_margin_position) %}
  def {{ attr.id }}=(value : Int32)
    self.{{ attr.id }} = value.to_u32
  end
  {% end %}

  def buffer : CodeBuffer
    super.as(CodeBuffer)
  end

  def cursor_changed_signal
    buffer.notify_signal["cursor-position"]
  end

  def cursor_line_col
    iter = buffer.iter_at_offset(buffer.cursor_position)
    {iter.line, iter.line_offset}
  end

  private def current_iter : Gtk::TextIter
    pos = buffer.cursor_position
    buffer.iter_at_offset(pos)
  end

  def sort_lines
    start_iter, end_iter = buffer.selection_bounds
    # TODO: Present a focused popup, so th euser can choose to
    # - just sort
    # - remove duplicates
    # - reverse sort
    # - case sensitiviness
    buffer.sort_lines(start_iter, end_iter, :none, 0)
  end

  def goto_line(line : Int32, col : Int32)
    iter = buffer.iter_at_line_offset(line, col)
    goto(iter)
  end

  def goto(iter)
    buffer.place_cursor(iter)
    scroll_to_iter(iter)
  end

  def scroll_to_iter(iter)
    scroll_to_iter(iter, 0.1, true, 0.0, 0.5)
  end

  def move_lines_up
    move_lines_signal.emit(false)
  end

  def move_lines_down
    move_lines_signal.emit(true)
  end

  def move_viewport_line_up
    move_viewport_signal.emit(:steps, -1)
  end

  def move_viewport_line_down
    move_viewport_signal.emit(:steps, 1)
  end

  def move_viewport_page_up
    move_viewport_signal.emit(:pages, -1)
  end

  def move_viewport_page_down
    move_viewport_signal.emit(:pages, 1)
  end

  private def word_at_cursor : String
    start_iter = buffer.iter_at_mark(buffer.insert)
    return "" unless start_iter.inside_word

    start_iter.backward_word_start unless start_iter.starts_word
    end_iter = current_iter
    end_iter.forward_word_end
    buffer.select_range(start_iter, end_iter)
    buffer.text(start_iter, end_iter, false)
  end

  def selection_or_word_at_cursor : String
    text = if buffer.has_selection?
             buffer.text(*buffer.selection_bounds, false)
           else
             word_at_cursor
           end
    text
  end

  def setup_editor_preferences(path)
    config = Config.instance
    resource = self.resource
    is_make_file = resource.try(&.basename) == "Makefile"

    @editor.tab_width = is_make_file ? 4 : config.editor_tab_width
    @editor.insert_spaces_instead_of_tabs = is_make_file ? false : config.editor_insert_spaces_instead_of_tabs
    @editor.show_right_margin = config.editor_show_right_margin
    @editor.right_margin_position = config.editor_right_margin_position
    @editor.highlight_current_line = config.editor_highlight_current_line
  end

  def color_scheme=(scheme : Adw::ColorScheme)
    style_manager = GtkSource::StyleSchemeManager.default

    if scheme.force_dark?
      buffer.style_scheme = style_manager.scheme("monokai")
    else
      buffer.style_scheme = style_manager.scheme("Adwaita")
    end
  end
end
