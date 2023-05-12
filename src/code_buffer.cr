require "tree_sitter"

# Meanwhile this is just a stupid implementation, but the plan is to implement a piece table here
# after the widget be capable of editing a text and show it highlighted
#
# The buffer will only accept UTF-8 strings with \n ending.
class CodeBuffer < GObject::Object
  property parser : TreeSitter::Parser?
  @tree : TreeSitter::Tree?

  @lines : Array(String)

  @[GObject::Property]
  property modified = false

  signal lines_changed(offset : Int32, count : Int32)
  signal lines_inserted(offset : Int32, count : Int32)
  signal lines_removed(offset : Int32, count : Int32)

  def initialize(source : String, language : String?)
    io = IO::Memory.new(source)
    initialize(io, language)
  end

  def initialize(source : IO?, language : String?)
    super()

    contents = source ? source.gets_to_end : ""
    @lines = contents.lines(chomp: false)
    @lines << "" if @lines.empty?

    if language
      @parser = parser = TreeSitter::Parser.new(language)
      @tree = parser.parse(nil, contents)
    end
  end

  def root_node : TreeSitter::Node?
    @tree.try(&.root_node)
  end

  def line_count : Int32
    @lines.size
  end

  def line_size(n : Int32) : Int32
    line = @lines[n]?
    return -1 if line.nil?

    size = line.size
    size -= 1 if line.ends_with?("\n")
    size
  end

  def column_byte_index(line : Int32, column : Int32) : Int32
    @lines[line].char_index_to_byte_index(column) || -1
  end

  # Allocate a new String and copy the buffer contents into it.
  def contents : String
    String.build do |str|
      @lines.each do |line|
        str << line
      end
    end
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

  # Delete *count* chars starting from *col* at line *line*.
  def delete_chars(line : Int32, col : Int32, count : Int32) : Nil
    current_line = @lines[line]

    if current_line.size > col + count
      @lines[line] = current_line.delete_at(start: col, count: count)
      lines_changed_signal.emit(line, 1)
      return
    end

    # deleting multiple lines
    new_count = current_line.size - col
    rest = count - new_count
    current_line = current_line.delete_at(start: col, count: new_count)

    while rest >= 0
      next_line = @lines[line + 1]?
      if next_line.nil?
        @lines[line] = current_line
        break
      end
      @lines.delete_at(line + 1)
      lines_removed_signal.emit(line + 1, 1)

      if rest < next_line.size
        @lines[line] = current_line + next_line.delete_at(start: 0, count: rest)
        lines_changed_signal.emit(line, 1)
        break
      end
      rest -= next_line.size
    end
  end

  def save(io : IO) : Nil
    @lines.each do |line|
      io << line
    end

    self.modified = false
  end
end
