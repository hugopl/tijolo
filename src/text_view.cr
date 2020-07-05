require "./language_manager"
require "./ui_builder_helper"
require "./view"

class TextView < View
  include UiBuilderHelper

  getter label : String
  getter widget : Gtk::Widget
  getter! search_context : GtkSource::SearchContext?

  @editor : GtkSource::View
  getter buffer : GtkSource::Buffer
  getter version = 1
  @file_path_label : Gtk::Label

  getter language : Language

  Log = ::Log.for("TextView")

  delegate grab_focus, to: @editor
  delegate focus?, to: @editor

  def initialize(file_path : String? = nil)
    super
    builder = builder_for("text_view")
    @widget = Gtk::Widget.cast(builder["root"])
    @widget.ref
    @editor = GtkSource::View.cast(builder["editor"])
    @editor.on_key_press_event(&->key_pressed(Gtk::Widget, Gdk::EventKey))

    @buffer = GtkSource::Buffer.cast(@editor.buffer)
    @line_column = Gtk::Label.cast(builder["line_column"])
    @file_path_label = Gtk::Label.cast(builder["file_path"])

    @language = Language.new
    setup_editor
    update_header
  end

  def label=(label : String)
    super
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

  def readonly=(value)
    super
    @editor.editable = !value
    if value
      @file_path_label.text = "#{@label} 🔒"
    else
      @file_path_label.text = "#{@label}"
    end
  end

  def modified? : Bool
    @buffer.modified
  end

  def key_pressed(_widget : Gtk::Widget, event : Gdk::EventKey)
    if event.keyval == Gdk::KEY_Escape
      notify_view_escape_pressed(self)
      true
    end
    false
  end

  def save
    return if @readonly

    file_path = @file_path
    raise AppError.new("Attempt to save a file without a name.") if file_path.nil?

    remove_all_trailing_spaces! if Config.instance.trailing_whitespace?
    File.write(file_path, text)
    @buffer.modified = false
  end

  private def remove_all_trailing_spaces!
    line, col = cursor_pos
    original_text = self.text
    text_modified = false
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

    @buffer.style_scheme = GtkSource::StyleSchemeManager.default.scheme(Config.instance.style_scheme)

    file_path = @file_path
    if file_path
      text = File.read(file_path)
      @buffer.text = text
      @buffer.modified = false

      @language = LanguageManager.guess_language(@label, mimetype(@label, text))
      @buffer.language = @language.gtk_language

      self.readonly = !File.writable?(file_path)
    else
      @buffer.modified = true
    end

    @buffer.connect("notify::cursor-position") { cursor_changed }
    @buffer.on_insert_text(&->sync_lsp_on_insert(Gtk::TextBuffer, Gtk::TextIter, String, Int32))
    @buffer.on_delete_range(&->sync_lsp_on_delete(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextIter))
    @buffer.on_modified_changed(&->update_header(Gtk::TextBuffer))
    @buffer.place_cursor(0)
  ensure
    @buffer.end_not_undoable_action
  end

  def next_version
    @version += 1
  end

  private def sync_lsp_on_insert(buffer, start_iter, text, _len)
    language.file_changed_by_insertion(self, start_iter.line, start_iter.line_offset, text)
  end

  private def sync_lsp_on_delete(buffer, start_iter, end_iter)
    language.file_changed_by_deletion(self, start_iter.line, start_iter.line_offset, end_iter.line, end_iter.line_offset)
  end

  private def update_header(_buffer = nil)
    @file_path_label.text = @buffer.modified ? "#{@label} ✱" : @label
  end

  private def mimetype(file_name, file_contents)
    contents, _uncertain = Gio.content_type_guess(file_name, file_contents)
    contents
  end

  def cursor_pos
    iter = @buffer.iter_at_offset(@buffer.cursor_position)
    {iter.line, iter.line_offset}
  end

  private def cursor_changed
    line, col = cursor_pos
    @line_column.label = "#{line + 1}:#{col + 1}"
  end

  def selected_text : String
    return "" unless @buffer.has_selection

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

    iter = Gtk::TextIter.new.tap do |iter|
      @buffer.iter_at_offset(iter, offset)
    end

    match_start = Gtk::TextIter.new
    match_end = Gtk::TextIter.new
    found, wrapped_around = if forward
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

  def sort_lines_action
    return unless @buffer.has_selection

    start_iter, end_iter = @buffer.selection_bounds
    return if start_iter.line == end_iter.line

    @buffer.begin_user_action
    @buffer.sort_lines(start_iter, end_iter, :case_sensitive, 0)
    @buffer.end_user_action
  end

  def comment_action
    return if readonly? || @language.none?

    @buffer.begin_user_action
    if @buffer.has_selection
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
