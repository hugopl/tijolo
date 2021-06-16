require "./editor_config"
require "./language_manager"
require "./editor/text_editor"
require "./ui_builder_helper"
require "./view"

class TextView < View
  @editor = Editor::TextEditor.new
  @lang_manager : LanguageManager
  @trim_trailing_white_space_on_save = true
  getter buffer : Editor::TextBuffer
  getter version = 1

  getter language = Language::NONE

  Log = ::Log.for("TextView")

  delegate focus?, to: @editor
  delegate font_size, to: @editor
  delegate :font_size=, to: @editor
  delegate scroll_to, to: @editor
  delegate can_undo?, to: @buffer
  delegate has_selection?, to: @buffer
  delegate text, to: @buffer
  delegate :text=, to: @buffer
  delegate :language=, to: @buffer

  # Used just in tests
  def initialize(file_path : Path? = nil, project_path : Path? = nil)
    initialize(LanguageManager.new, file_path, project_path)
  end

  def initialize(@lang_manager : LanguageManager, file_path : Path? = nil, project_path : Path? = nil)
    @buffer = @editor.buffer
    super(@editor.widget, file_path, project_path)

    setup_editor
    update_header

    @editor.widget.on_key_press_event(&->key_pressed(Gtk::Widget, Gdk::EventKey))
    @buffer.gobject.connect("notify::cursor-position") { cursor_changed }
    @buffer.gobject.after_insert_text(&->text_inserted(Gtk::TextBuffer, Gtk::TextIter, String, Int32))
    @buffer.gobject.after_delete_range(&->text_deleted(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextIter))
    @buffer.gobject.on_modified_changed { update_header }
  end

  def file_path=(file_path : Path) : Nil
    super

    apply_editor_config_settings
    guess_language!(text)
  end

  def readonly=(value : Bool)
    super
    @editor.readonly = value
  end

  def modified? : Bool
    virtual? ? false : @buffer.modified?
  end

  def key_pressed(_widget : Gtk::Widget, event : Gdk::EventKey)
    if event.keyval.in?(Gdk::KEY_bracketleft, Gdk::KEY_parenleft, Gdk::KEY_braceleft)
      return insert_char_around_selection(event.keyval)
    end
    false
  end

  def insert_char_around_selection(keyval) : Bool
    return false unless has_selection?

    start_chr, end_chr = case (keyval)
                         when Gdk::KEY_bracketleft then {"[", "]"}
                         when Gdk::KEY_parenleft   then {"(", ")"}
                         when Gdk::KEY_braceleft   then {"{", "}"}
                         else
                           return false
                         end

    start_iter, end_iter = @buffer.selection_bounds
    end_offset = end_iter.offset
    @buffer.user_action do
      @buffer.insert(start_iter, start_chr)
      start_iter.offset = end_offset + 1
      @buffer.insert(start_iter, end_chr)
      start_iter.backward_char
      @buffer.move_mark("selection_bound", start_iter)
    end
    true
  end

  def do_save
    remove_all_trailing_spaces! if @trim_trailing_white_space_on_save
    File.write(@file_path.not_nil!, text)
    @buffer.modified = false

    language.notify_did_save(self)
  end

  private def remove_all_trailing_spaces!
    original_text = self.text
    start_iter = Gtk::TextIter.new
    end_iter = Gtk::TextIter.new

    @buffer.user_action do
      original_text.split("\n").each_with_index do |line, line_index|
        next if line.empty? || !line[-1].whitespace?

        match = line.match(/([ \t]+)\r?\z/)
        next if match.nil?

        @buffer.iter_at_line_offset(start_iter, line_index, match.begin(1).not_nil!)
        @buffer.iter_at_line_offset(end_iter, line_index, match.end(1).not_nil!)
        @buffer.delete(start_iter, end_iter)
      end
    end
  end

  private def setup_editor
    @buffer.not_undoable_action do
      reload

      config = Config.instance
      file_path = @file_path
      is_make_file = !file_path.nil? && file_path.basename == "Makefile"

      @editor.wrap_mode = config.editor_wrap_mode
      @editor.show_line_numbers = config.editor_show_line_numbers
      @editor.tab_width = is_make_file ? 4 : config.editor_tab_width
      @editor.insert_spaces_instead_of_tabs = is_make_file ? false : config.editor_insert_spaces_instead_of_tabs
      @editor.show_right_margin = config.editor_show_right_margin
      @editor.right_margin_position = config.editor_right_margin_position
      @editor.highlight_current_line = config.editor_highlight_current_line
      @editor.background_pattern = config.editor_background_pattern
      @trim_trailing_white_space_on_save = Config.instance.trim_trailing_white_space_on_save?

      apply_editor_config_settings unless config.ignore_editor_config_files?

      @editor.font_size = config.editor_font_size
    end
  end

  private def apply_editor_config_settings
    file_path = @file_path
    return if file_path.nil?

    EditorConfig.parse(file_path).each do |key, value|
      case key
      when EditorConfig::INDENT_STYLE
        @editor.insert_spaces_instead_of_tabs = value == "space"
      when EditorConfig::TAB_WIDTH
        value = value.to_i?
        @editor.tab_width = value if value && value > 0
      when EditorConfig::CHARSET
        Log.warn { "Tijolo is lame and is not tested at all with non-UTF-8 files!" } if value != "utf-8"
      when EditorConfig::TRIM_TRAILING_WHITESPACE
        @trim_trailing_white_space_on_save = value == "true"
      when EditorConfig::MAX_LINE_LENGTH
        value = value.to_i?
        if value && value > 0
          @editor.show_right_margin = true
          @editor.right_margin_position = value
        end
      end
    end
  rescue e : EditorConfig::Error
    Log.error { e.message }
  end

  def create_mark(name : String, line : Int32, column : Int32)
    iter = @buffer.iter_at_line_offset(line, column)
    @buffer.create_mark(name, iter, true)
  end

  def update_mark(name : String, line : Int32, column : Int32)
    iter = @buffer.iter_at_line_offset(line, column)
    mark = @buffer.mark(name)
    if mark
      @buffer.move_mark(mark, iter)
    else
      @buffer.create_mark(name, iter, true)
    end
  end

  private def text_inserted(_buffer, iter, text, _text_size)
    line = iter.line
    col = iter.line_offset
    language.file_changed_by_insertion(self, line, col, text)
  end

  private def text_deleted(buffer, start_iter, end_iter)
    language.file_changed_by_deletion(self, start_iter.line, start_iter.line_offset, end_iter.line, end_iter.line_offset)
  end

  def reload
    super
    @buffer.user_action do
      pos = cursor_pos
      load_contents
      @buffer.modified = false
      self.cursor_pos = pos
    end
  end

  private def load_contents
    file_path = @file_path
    return if file_path.nil?

    text = File.read(file_path)
    @buffer.text = text
  end

  private def guess_language!(text : String)
    file_path = @file_path
    return if file_path.nil?

    @language = @lang_manager.guess_language(file_path)
    @buffer.language = @language
  end

  def restore_state
    return if virtual?

    file_path = @file_path
    project_path = @project_path
    if file_path && project_path
      goto(*TijoloRC.instance.cursor_position(project_path.not_nil!, file_path))
    else
      @buffer.place_cursor(0)
    end
  end

  def next_version
    @version += 1
  end

  def cursor_pos
    iter = @buffer.iter_at_offset(@buffer.cursor_position)
    {iter.line, iter.line_offset}
  end

  def cursor_pos=(pos : {Int32, Int32})
    self.cursor_pos = iter_at(*pos)
  end

  def cursor_pos=(iter : TextIter)
    @buffer.place_cursor(iter)
  end

  def iter_at(line : Int32, col : Int32) : TextIter
    @buffer.iter_at_line_offset(line, col)
  end

  private def cursor_changed
    line, col = cursor_pos
    line_column_label(line + 1, col + 1)
    notify_view_cursor_location_changed(self, line, col)
  end

  def mark(line) : Gtk::TextMark
    iter = @buffer.iter_at_line(line)
    @buffer.create_mark(nil, iter, true)
  end

  delegate selected_text, to: @buffer
  delegate search_context, to: @buffer

  def goto(line, col)
    iter = iter_at(line, col)
    self.cursor_pos = iter
    @editor.scroll_to(iter)
  end

  def goto(cursor : CursorHistory::Cursor)
    mark = @buffer.mark(cursor.mark_name)
    if mark
      iter = Gtk::TextIter.new
      @buffer.iter_at_mark(iter, mark)
      @buffer.place_cursor(iter)
      @editor.scroll_to(iter)
    else
      goto(cursor.line, cursor.column)
    end
  end

  def sort_lines_action
    return unless has_selection?

    start_iter, end_iter = @buffer.selection_bounds
    return if start_iter.line == end_iter.line

    @buffer.user_action do
      @buffer.sort_lines(start_iter, end_iter)
    end
  end

  def comment_action
    return if readonly? || @language.none?

    @buffer.user_action do
      if has_selection?
        comment_selection_action
      else
        comment_current_line_action
      end
    end
  end

  private def comment_regex
    @comment_regex ||= /\A\s*(#{Regex.escape(@language.line_comment)}\s?)/
  end

  private def comment_current_line_action
    iter = @buffer.iter_at_offset(@buffer.cursor_position)

    iter.line_index = 0
    end_iter = @buffer.iter_at_line_offset(iter.line, Int32::MAX)
    line = iter.text(end_iter)
    match = comment_regex.match(line)

    if match
      uncomment_line(iter, match)
    else
      iter.line_offset = line.index(/[^\s]/) || 0
      comment_line(iter)
    end
  end

  # iter should be at start of the line
  private def uncomment_line(iter, comment_match, comment_length = nil)
    end_comment_iter = Gtk::TextIter.new
    end_comment_iter.assign(iter)

    removal_offset = comment_match.begin(1) || 0
    removal_length = comment_length || comment_match.end(1).not_nil! - removal_offset

    iter.line_offset = removal_offset
    end_comment_iter.line_offset = removal_offset + removal_length
    @buffer.delete(iter, end_comment_iter)
  end

  private def comment_line(iter)
    line_comment = language.line_comment
    @buffer.insert(iter, "#{line_comment} ")
  end

  # This always comment lines using line comment, /* hey */ isn't supported.
  private def comment_selection_action
    start_iter, end_iter = @buffer.selection_bounds
    start_iter.line_index = 0
    end_line = end_iter.line
    end_line -= 1 if end_iter.line_index.zero?

    lines = @buffer.lines(start_iter.line, end_line)
    matches = lines.map(&.match(comment_regex))

    if matches.all? # uncoment
      comment_length = matches.map(&.not_nil![1].size).min
      matches.each do |match|
        uncomment_line(start_iter, match.not_nil!, comment_length)
        start_iter.forward_line
      end
    else # comment
      comment_offset = lines.map { |line| line.index(/[^\s]/) || 0 }.min
      lines.size.times do
        start_iter.line_offset = comment_offset
        comment_line(start_iter)
        start_iter.forward_line
      end
    end
  end
end
