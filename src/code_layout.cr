require "./code_line"

class CodeLayout
  @line_offset = 0
  @lines = [] of CodeLine
  @buffer : CodeBuffer
  @pango_ctx : Pango::Context
  @width = 0
  @height = 0

  @visible_lines_count = 0
  @font_height : Float32
  @font_width : Float32
  property text_color = Gdk::RGBA.new(0.922, 0.922, 0.898, 1.0)

  def initialize(@pango_ctx, @buffer)
    metric = @pango_ctx.metrics(nil, nil)
    @font_height = (metric.height / Pango::SCALE).to_f32
    @font_width = (metric.approximate_char_width / Pango::SCALE).to_f32

    @buffer.lines_changed_signal.connect(&->lines_changed(Int32, Int32))
    @buffer.lines_changed_signal.connect(&->lines_inserted(Int32, Int32))
    @buffer.lines_changed_signal.connect(&->lines_removed(Int32, Int32))
  end

  def lines_changed(n : Int32, count : Int32)
    # TODO: Proper handle cache here by invalidating the code lines, etc...
    reset
  end

  def lines_inserted(n : Int32, count : Int32)
    # TODO: Proper handle cache here by invalidating the code lines, etc...
    reset
  end

  def lines_removed(n : Int32, count : Int32)
    # TODO: Proper handle cache here by invalidating the code lines, etc...
    reset
  end

  def reset
    @lines.clear
  end

  def line_offset=(offset : Int32)
    # Current implementation is dummy, it just speed up things if nothing was scrolled
    # Future implementation can be smarter

    reset if offset != @line_offset
    @line_offset = offset
  end

  def render(snapshot : Gtk::Snapshot, width : Int32, height : Int32)
    if width != @width
      @width = width
      @lines.each(&.width=(width))
    end
    @visible_lines_count = height // @font_height

    each_code_line do |code_line, line_n|
      layout = code_line.layout
      snapshot.append_layout(layout, @text_color)

      yield(layout, line_n)

      snapshot.translate(0.0, @font_height)
    end
  end

  private def each_code_line
    0.upto(@visible_lines_count) do |i|

      line = @lines[i]?
      line_n = @line_offset + i
      if line.nil?
        text = @buffer.line(line_n)
        break if text.nil?

        line = CodeLine.new(@pango_ctx, text, @width)
        @lines << line
        Log.debug { "New codeline, #{i}: #{String.new(text)}" }
      end
      yield(line, line_n)
    end
  end
end
