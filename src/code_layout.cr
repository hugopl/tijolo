require "./code_line"

class CodeLayout
  private MARGIN = 4.0_f32

  Log = ::Log.for("CodeLayout")

  @line_offset = 0
  @lines = [] of CodeLine
  @buffer : CodeBuffer
  property highlighter : CodeHighlighter
  @pango_ctx : Pango::Context

  @line_numbers_layout : Pango::Layout
  @line_numbers_string_buffer = IO::Memory.new
  getter width = 0 # Width of whole widget
  property height = 0
  @text_width = 0 # Width of text without margins
  @width_changed = false

  getter line_height : Float32
  getter font_width : Float32
  property text_color = Gdk::RGBA.new(0.922, 0.922, 0.898, 1.0)

  def initialize(@pango_ctx, @buffer)
    @line_numbers_layout = Pango::Layout.new(@pango_ctx)
    @line_numbers_layout.alignment = :right

    metric = @pango_ctx.metrics(nil, nil)
    @line_height = (metric.height / Pango::SCALE).ceil.to_f32
    @font_width = (metric.approximate_char_width / Pango::SCALE).to_f32

    @buffer.lines_changed_signal.connect(&->lines_changed(Int32, Int32))
    @buffer.lines_inserted_signal.connect(&->lines_inserted(Int32, Int32))
    @buffer.lines_removed_signal.connect(&->lines_removed(Int32, Int32))
    @highlighter = CodeHighlighter.new(@buffer)
  end

  def x_y_to_line_column(x : Float64, y : Float64, line_offset : Int32 = 0) : {Int32, Int32}
    code_line_index = (y / line_height).floor.to_i
    code_line = @lines[code_line_index]?
    line = code_line_index + line_offset

    # Probably clicking bellow last line
    return {line, 0} if code_line.nil?

    byteindex = code_line.byte_at(x - text_left_margin)
    column = @buffer.line_byte_index_to_char_index(line, byteindex)
    {line, column}
  end

  def lines_changed(n : Int32, count : Int32)
    (n...(n + count)).each do |i|
      line = @lines[i]?
      break if line.nil?

      line.text_outdated!
    end
  end

  def lines_inserted(n : Int32, count : Int32)
    count.times do |i|
      @lines.insert(n + i, CodeLine.new(@pango_ctx))
    end
  end

  def lines_removed(n : Int32, count : Int32)
    codeline_index = n - @line_offset
    count.times do
      break if codeline_index >= @lines.size

      @lines.delete_at(codeline_index)
      codeline_index += 1
    end
  end

  def reset
    @lines.clear
  end

  def width=(@width : Int32) : Nil
    @text_width = calc_text_width(@width)
    @width_changed = true
  end

  # Page size in lines
  def page_size : Int32
    (@height / @line_height).to_i
  end

  def line_offset=(offset : Int32)
    if offset > @line_offset
      @lines.delete_at(0...(offset - @line_offset))
    elsif offset < @line_offset
      # FIXME: Do a better job here, invalidating only the necessary rows
      reset
    end
    @line_offset = offset
  end

  private def line_number_to_string(i : Int32) : Bytes
    @line_numbers_string_buffer.clear
    i.to_s(@line_numbers_string_buffer)
    @line_numbers_string_buffer.to_slice
  end

  def line_number_digits : Int32
    n = @buffer.line_count
    (Math.log(n.to_f + 1) / Math::LOG10).ceil.to_i
  end

  def text_left_margin : Float32
    # The line is rendered as:
    # <margin><line number><margin><margin><text><margin>
    # ╰───── text left margin ────╯
    line_number_digits * @font_width + MARGIN * 2
  end

  def text_area_width : Float32
    @text_width + MARGIN * 2
  end

  def calc_text_width(screen_width : Int32) : Int32
    (screen_width - text_left_margin - MARGIN * 2).to_i
  end

  def render(snapshot : Gtk::Snapshot)
    @lines.each(&.width=(@text_width)) if @width_changed

    line_numbers_width = text_left_margin

    snapshot.translate(MARGIN, 0.0)
    each_code_line do |code_line, line_n|
      render_line_number(snapshot, line_n)

      snapshot.translate(line_numbers_width, 0.0)
      code_line.render(snapshot)
      yield(code_line.layout, line_n)
      snapshot.translate(-line_numbers_width, @line_height)
    end
  end

  private def render_line_number(snapshot : Gtk::Snapshot, line_n : Int32)
    @line_numbers_layout.set_text(line_number_to_string(line_n + 1))
    snapshot.append_layout(@line_numbers_layout, @text_color)
  end

  private def each_code_line
    highlighter = @highlighter
    highlighter.set_line_range(@line_offset, @line_offset + page_size) if highlighter

    Log.info { "------------------Rendering-------------------------".colorize.red }

    0.upto(page_size) do |i|
      line = @lines[i]?
      line_n = @line_offset + i
      if line.nil?
        text = @buffer.line(line_n)
        break if text.nil?

        line = CodeLine.new(@pango_ctx)
        line.text = text
        line.width = @text_width
        line.attributes = highlighter.pango_attrs_for_next_line if highlighter
        @lines << line
      elsif line.text_outdated?
        text = @buffer.line(line_n)
        line.width = @text_width
        line.text = text
      end
      yield(line, line_n)
    end
  end
end
