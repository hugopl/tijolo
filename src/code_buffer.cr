# Meanwhile this is just a stupid implementation, but the plan is to implement a piece table here
# after the widget be capable of editing a text and show it highlighted
#
# The buffer will only accept UTF-8 strings with \n ending.
class CodeBuffer < GObject::Object
  @lines : Array(String)

  @[GObject::Property]
  property modified = false

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

  def each_line(offset : Int32 = 0) : Nil
    @lines.each.skip(offset).with_index(offset) do |text, i|
      yield(text.to_slice, i)
    end
  end

  def insert(line : Int32, col : Int32, text : String) : {Int32, Int32}
    self.modified = true if !@modified

    current_line = @lines[line]
    if text == "\n"
      if col == current_line.size
        @lines.insert(line + 1, "")
        {line + 1, 0}
      else
        @lines[line] = current_line[0...col]
        @lines.insert(line + 1, current_line[col..-1])
        {line + 1, 0}
      end
    else
      # 🤠️
      @lines[line] = current_line.insert(col, text)
      {line, col + text.size}
    end
  end

  def delete_chars(line : Int32, col : Int32, count : Int32) : {Int32, Int32}
    current_line = @lines[line]
    Log.info { "delete chars not yet implemented..." }

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
