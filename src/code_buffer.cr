# Meanwhile this is just a stupid implementation, but the plan is to implement a piece table here
# after the widget be capable of editing a text and show it highlighted
#
# The buffer will only accept UTF-8 strings with \n ending.
class CodeBuffer < GObject::Object
  @lines : Array(String)

  @[GObject::Property]
  property modified = false

  signal lines_changed(offset : Int32, count : Int32)
  signal lines_inserted(offset : Int32, count : Int32)
  signal lines_removed(offset : Int32, count : Int32)

  def initialize(*, file : Path? = nil, contents : String? = nil)
    super()
    contents = File.read(file) if file

    @lines = contents ? contents.split("\n") : Array(String).new
    @lines << "" if @lines.empty?
  end

  def line_count : Int32
    @lines.size
  end

  def line_size(n : Int32) : Int32
    @lines[n]?.try(&.size) || -1
  end

  def column_byte_index(line : Int32, column : Int32) : Int32
    @lines[line].char_index_to_byte_index(column) || -1
  end

  def line(n : Int32) : Bytes?
    line = @lines[n]?
    line.to_slice if line
  end

  def insert(line : Int32, col : Int32, text : String) : {Int32, Int32}
    self.modified = true if !@modified

    current_line = @lines[line]
    if text == "\n"
      if col == current_line.size
        new_line = line + 1
        @lines.insert(new_line, "")
        lines_inserted_signal.emit(new_line, 1)
        {new_line, 0}
      else
        @lines[line] = current_line[0...col]
        lines_changed_signal.emit(line, 1)
        new_line = line + 1
        @lines.insert(new_line, current_line[col..-1])
        lines_inserted_signal.emit(new_line, 1)
        {new_line, 0}
      end
    else
      # 🤠️
      @lines[line] = current_line.insert(col, text)
      lines_changed_signal.emit(line, 1)
      {line, col + text.size}
    end
  end

  def delete_chars(line : Int32, col : Int32, count : Int32) : {Int32, Int32}
    current_line = @lines[line]
    Log.error { "Delete chars not yet implemented..." }

    {line, col}
  end

  def save(io : IO) : Nil
    line_count = self.line_count - 1
    @lines.each_with_index do |line, i|
      io << line
      io << '\n' if i < line_count
    end

    self.modified = false
  end
end
