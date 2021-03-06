require "./search_context_gsv"

class Editor::TextBuffer
  @buffer : GtkSource::Buffer

  def initialize(@buffer : GtkSource::Buffer)
    @buffer.style_scheme = GtkSource::StyleSchemeManager.default.scheme("monokai")
  end

  def gobject
    @buffer
  end

  delegate iter_at_line, to: @buffer
  delegate iter_at_line_offset, to: @buffer
  delegate iter_at_offset, to: @buffer
  delegate place_cursor, to: @buffer
  delegate cursor_position, to: @buffer
  delegate select_range, to: @buffer
  delegate select_lines, to: @buffer
  delegate delete, to: @buffer
  delegate lines, to: @buffer

  delegate create_mark, to: @buffer
  delegate mark, to: @buffer
  delegate move_mark, to: @buffer
  delegate iter_at_mark, to: @buffer

  def move_mark(name : String, iter)
    @buffer.move_mark_by_name(name, iter)
  end

  delegate :text=, to: @buffer
  delegate :modified=, to: @buffer

  def text : String
    @buffer.text(@buffer.start_iter, @buffer.end_iter, false)
  end

  delegate selection_bounds, to: @buffer
  delegate insert, to: @buffer

  def selected_text : String
    return "" unless has_selection?

    start_iter, end_iter = @buffer.selection_bounds
    @buffer.text(start_iter, end_iter, false)
  end

  def replace(range : TextRange, replacement : String)
    @buffer.begin_user_action
    @buffer.delete_interactive(*range, true)
    @buffer.insert_interactive(range[0], replacement, replacement.bytesize, true)
    @buffer.end_user_action
  end

  def sort_lines(start_iter, end_iter)
    @buffer.sort_lines(start_iter, end_iter, :case_sensitive, 0)
  end

  def language=(language : Language)
    @buffer.language = language.gtk_language
  end

  def modified? : Bool
    @buffer.modified
  end

  def user_action
    @buffer.begin_user_action
    yield
  ensure
    @buffer.end_user_action
  end

  def not_undoable_action
    @buffer.begin_not_undoable_action
    yield
  ensure
    @buffer.end_not_undoable_action
  end

  def has_selection? : Bool
    @buffer.has_selection
  end
end
