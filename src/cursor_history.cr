class CursorHistory
  class Cursor
    property file_path : Path
    property line : Int32
    property column : Int32
    property mark_name : String

    @@i = 0

    def initialize(@file_path, @line, @column)
      @mark_name = "hst_#{@@i}"
      @@i += 1
    end

    def self.reset_mark_counter
      @@i = 0
    end

    def inspect(io : IO)
      io << "#<Cursor path="
      @file_path.inspect(io)
      io << " line=" << line << " name=" << mark_name << ">"
    end
  end

  getter items = Array(Cursor).new
  getter idx = -1

  ROW_DELTA = 20

  def add(path : Path, line : Int32, column : Int32) : String?
    return unless should_add?(path, line)

    cursor = Cursor.new(path, line, column)
    @idx += 1
    @items.insert(@idx, cursor)
    cursor.mark_name
  end

  private def should_add?(path : Path, line : Int32) : Bool
    return true if @items.empty?

    cur_item = @items[@idx]
    return true if path != cur_item.file_path

    (line - cur_item.line).abs > ROW_DELTA
  end

  def current : Cursor?
    @items[@idx]?
  end

  def next : Cursor?
    idx = @idx + 1
    if 0 <= idx <= @items.size - 1
      @idx = idx
      @items[idx]
    end
  end

  def prev : Cursor?
    idx = @idx - 1
    if 0 <= idx <= @items.size - 1
      @idx = idx
      @items[idx]
    end
  end
end
