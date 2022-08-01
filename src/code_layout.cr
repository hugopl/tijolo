require "./code_line"

class CodeLayout
  private MARGIN = 4.0_f32

  @line_offset = 0
  @lines = [] of CodeLine
  @buffer : CodeBuffer
  @pango_ctx : Pango::Context

  @line_numbers_layout : Pango::Layout
  @line_numbers_string_buffer = IO::Memory.new
  @width = 0      # Width of whole widget
  @text_width = 0 # Width of text without margins
  @width_changed = false
  @height = 0

  getter visible_lines_count = 0
  getter font_height : Float32
  getter font_width : Float32
  property text_color = Gdk::RGBA.new(0.922, 0.922, 0.898, 1.0)

  def initialize(@pango_ctx, @buffer)
    @line_numbers_layout = Pango::Layout.new(@pango_ctx)
    @line_numbers_layout.alignment = :right

    metric = @pango_ctx.metrics(nil, nil)
    @font_height = (metric.height / Pango::SCALE).to_f32
    @font_width = (metric.approximate_char_width / Pango::SCALE).to_f32

    @buffer.lines_changed_signal.connect(&->lines_changed(Int32, Int32))
    @buffer.lines_inserted_signal.connect(&->lines_inserted(Int32, Int32))
    @buffer.lines_removed_signal.connect(&->lines_removed(Int32, Int32))
  end

  def lines_changed(n : Int32, count : Int32)
    (n...(n + count)).each do |i|
      line = @lines[i]?
      break if line.nil?

      line.dirty!
    end
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

  def width=(@width : Int32) : Nil
    @text_width = calc_text_width(@width)
    @width_changed = true
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

  def render(snapshot : Gtk::Snapshot, height : Int32)
    line_numbers_width = text_left_margin + MARGIN

    if @width_changed
      @lines.each(&.width=(@text_width))
      # We set the width instead of do a translation when rendering, so MARGIN*2 here
      @line_numbers_layout.width = (text_left_margin * Pango::SCALE - MARGIN * 2).to_i
    end
    @visible_lines_count = height // @font_height

    snapshot.translate(MARGIN, 0.0)
    each_code_line do |code_line, line_n|
      # Render line number
      @line_numbers_layout.set_text(line_number_to_string(line_n))
      snapshot.append_layout(@line_numbers_layout, @text_color)

      # Render code line
      layout = code_line.layout
      snapshot.translate(line_numbers_width, 0.0)
      snapshot.append_layout(layout, @text_color)

      yield(layout, line_n)

      snapshot.translate(-line_numbers_width, @font_height)
    end
  end

  private def each_code_line
    0.upto(@visible_lines_count) do |i|
      line = @lines[i]?
      line_n = @line_offset + i
      if line.nil?
        text = @buffer.line(line_n)
        break if text.nil?

        line = CodeLine.new(@pango_ctx, text, @text_width)
        @lines << line
      elsif line.dirty?
        line.text = @buffer.line(line_n)
      end
      yield(line, line_n)
    end
  end
end
