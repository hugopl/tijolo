class CodeCursors
  @buffer : CodeBuffer
  @cursors : Array(CodeCursor)
  @cursor_changed_callback : Proc(Int32, Int32, Nil)?

  def initialize(@buffer : CodeBuffer)
    @cursors = [CodeCursor.new(@buffer)]
  end

  def at_line(line : Int32)
    @cursors.each do |cursor|
      yield(cursor) if cursor.line == line
    end
  end

  def on_cursor_change(&callback : Proc(Int32, Int32, Nil))
    @cursor_changed_callback = callback
  end

  private def watch_cursor
    pos = @cursors.first.pos
    yield
    cursor_changed_callback = @cursor_changed_callback
    return if cursor_changed_callback.nil?

    new_pos = @cursors.first.pos
    cursor_changed_callback.call(*new_pos) if new_pos != pos
  end

  def move(step : Gtk::MovementStep, count : Int32) : Nil
    watch_cursor do
      # FIXME: This mess with multiple cursors, but we just plan to support multiple cursors, we do not support yet 😉️
      @cursors.each(&.move(step, count))
    end
  end

  def commit_text(text : String)
    watch_cursor do
      @cursors.each(&.commit_text(text))
    end
  end
end

class CodeCursor
  getter line = 0
  getter column = 0

  @old_column_value = 0

  @buffer : CodeBuffer

  def initialize(@buffer)
  end

  def pos : {Int32, Int32}
    {line, column}
  end

  def column_byte : Int32
    @buffer.column_byte_index(@line, @column)
  end

  def move(step : Gtk::MovementStep, count : Int32) : Nil
    return if count.zero?

    if step.visual_positions?
      column = @column + count
      @column = column.clamp(0, @buffer.line_size(@line))
      @old_column_value = @column
    elsif step.display_lines?
      old_line = @line
      @line = (@line + count).clamp(0, @buffer.line_count - 1)

      if old_line != @line
        @column = @old_column_value.clamp(0, @buffer.line_size(@line))
      end
    else
      Log.warn { "Not implemented" }
    end
  end

  def commit_text(text : String)
    @buffer.insert(@line, @column, text)
    @old_column_value = @column += text.size
  end
end