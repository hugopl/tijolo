require "./language_manager"
require "./ui_builder_helper"
require "./view"

class TextView < View
  getter label : String
  getter! search_context : GtkSource::SearchContext?

  @editor = GtkSource::View.new
  getter buffer : GtkSource::Buffer
  getter version = 1

  getter language : Language

  Log = ::Log.for("TextView")

  delegate grab_focus, to: @editor
  delegate focus?, to: @editor

  def initialize(file_path : Path? = nil, project_path : Path? = nil)
    @buffer = GtkSource::Buffer.cast(@editor.buffer)
    super(@editor, file_path, project_path)

    @editor.on_key_press_event(&->key_pressed(Gtk::Widget, Gdk::EventKey))
    @language = Language.new
    setup_editor
    update_header
  end

  def text
    @buffer.text(@buffer.start_iter, @buffer.end_iter, false)
  end

  def text=(text)
    @buffer.set_text(text, -1)
  end

  def language=(lang_id : String)
    language = LanguageManager.find(lang_id)
    if language
      @language = language
      @buffer.language = language.gtk_language
    end
  end

  def readonly=(value : Bool)
    super
    @editor.editable = !value
  end

  def modified? : Bool
    virtual? ? false : @buffer.modified
  end

  def key_pressed(_widget : Gtk::Widget, event : Gdk::EventKey)
    return true if super

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
    @buffer.begin_user_action
    @buffer.insert(start_iter, start_chr)
    start_iter.offset = end_offset + 1
    @buffer.insert(start_iter, end_chr)
    start_iter.backward_char
    @buffer.move_mark_by_name("selection_bound", start_iter)
    @buffer.end_user_action
    true
  end

  def save
    return if readonly?

    file_path = @file_path
    raise AppError.new("Attempt to save a file without a name.") if file_path.nil?

    remove_all_trailing_spaces! if Config.instance.trim_trailing_white_space_on_save?
    super
    File.write(file_path, text)
    @buffer.modified = false

    language.notify_did_save(self)
  end

  private def remove_all_trailing_spaces!
    original_text = self.text
    start_iter = Gtk::TextIter.new
    end_iter = Gtk::TextIter.new

    @buffer.begin_user_action
    original_text.split("\n").each_with_index do |line, line_index|
      next if line.empty? || !line[-1].whitespace?

      match = line.match(/([ \t]+)\r?\z/)
      next if match.nil?

      @buffer.iter_at_line_offset(start_iter, line_index, match.begin(1).not_nil!)
      @buffer.iter_at_line_offset(end_iter, line_index, match.end(1).not_nil!)
      @buffer.delete(start_iter, end_iter)
    end
    @buffer.end_user_action
  end

  private def setup_editor
    @buffer.begin_not_undoable_action
    reload

    config = Config.instance
    file_path = @file_path
    is_make_file = !file_path.nil? && file_path.basename == "Makefile"

    @buffer.style_scheme = GtkSource::StyleSchemeManager.default.scheme(config.style_scheme)
    @editor.wrap_mode = config.editor_wrap_mode
    @editor.show_line_numbers = config.editor_show_line_numbers
    @editor.tab_width = is_make_file ? 4 : config.editor_tab_width
    @editor.insert_spaces_instead_of_tabs = is_make_file ? false : config.editor_insert_spaces_instead_of_tabs
    @editor.show_right_margin = config.editor_show_right_margin
    @editor.right_margin_position = config.editor_right_margin_position
    @editor.highlight_current_line = config.editor_highlight_current_line
    @editor.background_pattern = config.editor_background_pattern

    @editor.smart_home_end = :before
    @editor.monospace = true
    @editor.auto_indent = true
    @editor.smart_backspace = true

    @buffer.connect("notify::cursor-position") { cursor_changed }
    @buffer.after_insert_text(&->text_inserted(Gtk::TextBuffer, Gtk::TextIter, String, Int32))
    @buffer.after_delete_range(&->text_deleted(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextIter))
    @buffer.on_modified_changed { update_header }
    @editor.on_focus_in_event do
      notify_view_focused(self)
      false
    end
  ensure
    @buffer.end_not_undoable_action
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
    @buffer.begin_user_action
    pos = cursor_pos
    load_contents
    @buffer.modified = false
    self.cursor_pos = pos
  ensure
    @buffer.end_user_action
  end

  private def load_contents
    file_path = @file_path
    return if file_path.nil?

    text = File.read(file_path)
    @buffer.text = text

    @language = LanguageManager.guess_language(label, mimetype(label, text))
    @buffer.language = @language.gtk_language
  end

  def restore_state
    file_path = @file_path
    project_path = @project_path
    if file_path && project_path
      GLib.idle_add do
        goto(*TijoloRC.instance.cursor_position(project_path.not_nil!, file_path))
        false
      end
    else
      @buffer.place_cursor(0)
    end
  end

  def next_version
    @version += 1
  end

  private def mimetype(file_name, file_contents)
    contents, _uncertain = Gio.content_type_guess(file_name, file_contents)
    contents
  end

  def cursor_pos
    iter = @buffer.iter_at_offset(@buffer.cursor_position)
    {iter.line, iter.line_offset}
  end

  def cursor_pos=(pos : {Int32, Int32})
    @buffer.place_cursor(@buffer.iter_at_line_offset(*pos))
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

  def has_selection?
    @buffer.has_selection
  end

  def selected_text : String
    return "" unless has_selection?

    start_iter, end_iter = @buffer.selection_bounds
    @buffer.text(start_iter, end_iter, false)
  end

  def create_search_context(settings : GtkSource::SearchSettings)
    @search_context ||= GtkSource::SearchContext.new(@buffer, settings)
  end

  def find
    find_impl(@buffer.cursor_position, true)
  end

  def find_next
    find_impl(@buffer.cursor_position + 1, true)
  end

  def find_prev
    find_impl(@buffer.cursor_position, false)
  end

  private def find_impl(offset, forward)
    search_context = @search_context
    return if search_context.nil?

    iter = Gtk::TextIter.new
    @buffer.iter_at_offset(iter, offset)

    match_start = Gtk::TextIter.new
    match_end = Gtk::TextIter.new
    found, _wrapped_around = if forward
                               search_context.forward(iter, match_start, match_end)
                             else
                               search_context.backward(iter, match_start, match_end)
                             end

    if found
      @buffer.place_cursor(match_start)
      @editor.scroll_to_iter(match_start, 0.0, true, 0.0, 0.5)
      @buffer.select_range(match_start, match_end)
    end
  end

  def goto(line, column)
    iter = Gtk::TextIter.new
    @buffer.iter_at_line(iter, line)
    iter.forward_chars(column)
    @buffer.place_cursor(iter)
    @editor.scroll_to_iter(iter, 0.0, true, 0.0, 0.5)
  end

  def goto(cursor : CursorHistory::Cursor)
    mark = @buffer.mark(cursor.mark_name)
    if mark
      iter = Gtk::TextIter.new
      @buffer.iter_at_mark(iter, mark)
      @buffer.place_cursor(iter)
      @editor.scroll_to_iter(iter, 0.0, true, 0.0, 0.5)
    else
      goto(cursor.line, cursor.column)
    end
  end

  def sort_lines_action
    return unless has_selection?

    start_iter, end_iter = @buffer.selection_bounds
    return if start_iter.line == end_iter.line

    @buffer.begin_user_action
    @buffer.sort_lines(start_iter, end_iter, :case_sensitive, 0)
    @buffer.end_user_action
  end

  def comment_action
    return if readonly? || @language.none?

    @buffer.begin_user_action
    if has_selection?
      comment_selection_action
    else
      comment_current_line_action
    end
    @buffer.end_user_action
  end

  private def comment_regex
    @comment_regex ||= /\A\s*(#{Regex.escape(@language.line_comment)}\s?)/
  end

  private def comment_current_line_action
    iter = Gtk::TextIter.new
    @buffer.iter_at_offset(iter, @buffer.cursor_position)

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

    lines = @buffer.lines(start_iter.line, end_iter.line)
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
