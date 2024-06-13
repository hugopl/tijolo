GICrystal.require("GtkSource", "5")
require "./code_buffer"
require "./code_language"
require "./code_commenter"
require "./init_source_view"
require "./code_model"

class CodeEditor < GtkSource::View
  include CodeCommenter

  getter language : CodeLanguage

  def initialize(resource : Path?)
    super(show_line_numbers: true,
      monospace: true,
      auto_indent: true,
      smart_backspace: true,
      background_pattern: :grid,
      smart_home_end: :before,
      buffer: CodeBuffer.new)
    @language = CodeLanguage.detect(resource)

    setup_key_controller
    supress_source_view_key_bindings
    load(resource) if resource
  end

  def setup_key_controller
    key = Gtk::EventControllerKey.new(propagation_phase: :target)
    key.key_pressed_signal.connect(->on_key_press(UInt32, UInt32, Gdk::ModifierType))
    add_controller(key)
  end

  def reload(resource : Path)
    load(resource)
  end

  private def on_key_press(keyval : UInt32, keycode : UInt32, state : Gdk::ModifierType) : Bool
    if keyval.in?(Gdk::KEY_bracketleft, Gdk::KEY_parenleft, Gdk::KEY_braceleft)
      return insert_char_around_selection(keyval)
    end
    false
  end

  def insert_char_around_selection(keyval : UInt32) : Bool
    return false unless buffer.has_selection?

    start_chr, end_chr = case keyval
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

  def language=(@language : CodeLanguage)
    rehighlight
  end

  private def rehighlight
    buffer.language = GtkSource::LanguageManager.default.language(@language.id)
  end

  private def load(resource : Path)
    buffer.load(resource)

    rehighlight unless @language.none?
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

  def identifier_at_cursor : String
    iter = buffer.iter_at_mark(buffer.insert)
    return "" if iter.char.in_set?(language.identifier_boundaries)

    start_iter = goto_start_of_identifier(iter)
    end_iter = goto_end_of_identifier(iter)

    buffer.select_range(start_iter, end_iter)
    buffer.text(start_iter, end_iter, false)
  end

  private def goto_end_of_identifier(iter : Gtk::TextIter)
    boundaries = language.identifier_boundaries
    iter = iter.copy
    while iter.forward_char
      break if iter.char.in_set?(boundaries)
    end
    iter
  end

  private def goto_start_of_identifier(iter : Gtk::TextIter)
    boundaries = language.identifier_boundaries
    iter = iter.copy
    while iter.backward_char
      if iter.char.in_set?(boundaries)
        iter.forward_char
        break
      end
    end
    iter
  end

  def selection_or_identifier_at_cursor : String
    text = if buffer.has_selection?
             buffer.text(*buffer.selection_bounds, false)
           else
             identifier_at_cursor
           end
    text
  end
end
