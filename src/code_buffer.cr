require "tree_sitter"

# Meanwhile this is just a stupid implementation, but the plan is to implement a piece table here
# after the widget be capable of editing a text and show it highlighted
#
# The buffer will only accept UTF-8 strings with \n ending.
class CodeBuffer < GObject::Object
  property parser : TreeSitter::Parser?
  @tree : TreeSitter::Tree?
  @tree_editor : TreeSitter::TreeEditor?

  @lines : Array(String)

  @[GObject::Property]
  property modified = false

  signal lines_changed(start_line : Int32, count : Int32)
  signal lines_inserted(start_line : Int32, count : Int32)
  signal lines_removed(start_line : Int32, count : Int32)
  signal lines_highlight_changed(start_line : Int32, count : Int32)

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
      @tree = tree = parser.parse(nil, contents)
      @tree_editor = TreeSitter::TreeEditor.new(tree, ->point_to_offset(Int32, Int32), ->offset_to_point(UInt32))
    end
  end

  private def edit_finished
    old_tree = @tree
    parser = @parser
    tree_editor = @tree_editor
    return if old_tree.nil? || parser.nil? || tree_editor.nil?

    @tree = new_tree = parser.parse(old_tree, contents)
    new_tree.save_png("tree.png")

    new_tree.changed_ranges(old_tree).each do |range|
      start_line = range.start_point.row
      line_count = range.end_point.row - start_line
      lines_highlight_changed_signal.emit(start_line, line_count)
    end
    tree_editor.tree = new_tree
  end

  def root_node : TreeSitter::Node?
    @tree.try(&.root_node)
  end

  def point_to_offset(line : Int32, column : Int32) : UInt32
    offset = 0_u32
    @lines.each.with_index do |text, line_n|
      if line_n == line
        reader = Char::Reader.new(text)
        (column).times do
          offset += reader.current_char.bytesize
          reader.next_char if reader.has_next?
        end
        break
      end
      offset += text.bytesize
    end
    offset
  end

  def offset_to_point(offset : UInt32) : TreeSitter::Point
    line = 0
    column = 0
    @lines.each.with_index do |text, line_n|
      if offset < text.bytesize
        line = line_n
        loop do
          possible_column = text.byte_index_to_char_index(offset.to_i32)
          if possible_column
            column = possible_column
            break
          end
          offset -= 1
        end
        break
      elsif offset == text.bytesize
        line = line_n
        column = text.size
      end
      offset -= text.bytesize
    end
    TreeSitter::Point.new(line, column)
  end

  def line_byte_index_to_char_index(line_n : Int32, byteindex : Int32) : Int32
    line = @lines[line_n]
    return line.bytesize if byteindex < 0

    char_index = line.byte_index_to_char_index(byteindex)
    raise ArgumentError.new if char_index.nil?

    char_index
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

  def line_column_index_to_byte_index(line : Int32, column : Int32) : Int32
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
    @tree_editor.try(&.insert(line, col, text.bytesize))
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
  ensure
    edit_finished
  end

  # Delete *count* chars starting from *col* at line *line*.
  def delete_chars(line : Int32, col : Int32, count : Int32) : Nil
    current_line = @lines[line]

    # FIXME: Fix this 😅️
    Log.warn { "Oops, deleting multiple chars poisons tree sitter because I'm lazzy." } if count > 1
    @tree_editor.try(&.delete(line, col, current_line[col].bytesize))
    self.modified = true if !@modified

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
  ensure
    edit_finished
  end

  def save(io : IO) : Nil
    @lines.each.with_index do |line, i|
      Log.notice { "#{(i + 1).to_s.rjust(3)}: #{line.strip.colorize.green}" }
      # io << line
    end

    self.modified = false
  end
end
