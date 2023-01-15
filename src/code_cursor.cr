require "./code_buffer"

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

  def delete_chars(count : Int32)
    @cursors.each(&.delete_chars(count))
  end

  def backspace
    @cursors.each(&.backspace)
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
    {@line, @column}
  end

  def column_byte : Int32
    @buffer.column_byte_index(@line, @column)
  end

  def move(step : Gtk::MovementStep, count : Int32) : Nil
    return if count.zero?

    if step.visual_positions?
      column = @column + count
      if column < 0
        if @line == 0
          @column = 0
        else
          move(:display_lines, -1)
          move(:display_line_ends, 1)
        end
      elsif column > @buffer.line_size(@line)
        @old_column_value = @column = 0
        return move(:display_lines, 1)
      else
        @column = column
      end
    elsif step.display_lines?
      old_line = @line
      @line = (@line + count).clamp(0, @buffer.line_count - 1)

      if old_line != @line
        @column = @old_column_value.clamp(0, @buffer.line_size(@line))
      end
    elsif step.display_line_ends?
      @column = @old_column_value = @buffer.line_size(@line)
    else
      Log.warn { "Not implemented" }
    end
  end

  def commit_text(text : String)
    if text.size != 1
      Log.error { "Multiple character insertion not implemented 😅️" }
      return
    end

    @line, @column = @buffer.insert(@line, @column, text)
    @old_column_value = @column
  end

  def delete_chars(count : Int32)
    @buffer.delete_chars(@line, @column, count)
  end

  def backspace
    old_line = @line
    old_column = @column
    move(:visual_positions, -1)
    @buffer.delete_chars(@line, @column, 1) if old_line != @line || old_column != @column
  end
end
