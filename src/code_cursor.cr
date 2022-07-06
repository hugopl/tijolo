class CodeCursors
  @buffer : CodeBuffer
  @cursors : Array(CodeCursor)

  def initialize(@buffer : CodeBuffer)
    @cursors = [CodeCursor.new(@buffer)]
  end

  def at_line(line : Int32)
    @cursors.each do |cursor|
      yield(cursor) if cursor.line == line
    end
  end

  def move(step : Gtk::MovementStep, count : Int32) : Nil
    # FIXME: This mess with multiple cursors, but we just plan to support multiple cursors, we do not support yet 😉️
    @cursors.each do |cursor|
      cursor.move(step, count)
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
end
