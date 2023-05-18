require "./code_line"

# This take care of create, destroy, invalidate and cache `CodeLine`.
#
# TODO: Use a better name for this class
# TODO: Replace the *@lines* array by a splay tree (or a redblack tree) with distributed offset.
class CodeLayout
  Log = ::Log.for("CodeLayout")

  @line_offset = 0
  @lines = [] of CodeLine
  @buffer : CodeBuffer
  property highlighter : CodeHighlighter
  @pango_ctx : Pango::Context

  @code_width : Float32

  property text_color = Gdk::RGBA.new(0.922, 0.922, 0.898, 1.0)

  def initialize(@pango_ctx, @buffer)
    @buffer.lines_changed_signal.connect(&->lines_changed(Int32, Int32))
    @buffer.lines_inserted_signal.connect(&->lines_inserted(Int32, Int32))
    @buffer.lines_removed_signal.connect(&->lines_removed(Int32, Int32))
    @buffer.lines_highlight_changed_signal.connect(&->lines_highlight_changed(Int32, Int32))
    @highlighter = CodeHighlighter.new(@buffer)
    @code_width = 0.0
  end

  def lines_changed(start_line : Int32, count : Int32)
    (start_line...(start_line + count)).each do |i|
      line = @lines[i]?
      break if line.nil?

      line.text_outdated!
    end
  end

  def lines_highlight_changed(start_line : Int32, count : Int32)
    # FIXME: Avoid text re-layout here and just update the pango attrs
    Log.info { "highlight changed: #{start_line} + #{count}" }
    lines_changed(start_line, count)
  end

  def lines_inserted(start_line : Int32, count : Int32)
    count.times do |i|
      @lines.insert(start_line + i, CodeLine.new(@pango_ctx))
    end
  end

  def lines_removed(start_line : Int32, count : Int32)
    codeline_index = start_line - @line_offset
    count.times do
      break if codeline_index >= @lines.size

      @lines.delete_at(codeline_index)
      codeline_index += 1
    end
  end

  def line_visible?(line_n : Int32) : Bool
    Log.warn { "CodeLayout#line_visible? not implemented!" }
    true
  end

  def []?(line_n : Int32) : CodeLine?
    @lines[line_n - @line_offset]?
  end

  def line_layout(line_n : Int32) : Pango::Layout?
    self[line_n]?.try(&.layout)
  end

  private def line_offset=(offset : Int32)
    if offset > @line_offset
      @lines.delete_at(0...(offset - @line_offset))
    elsif offset < @line_offset
      # FIXME: Do a better job here, invalidating only the necessary rows
      @lines.clear
    end
    @line_offset = offset
  end

  def render(snapshot : CodeSnapshot, start_line : Int32, code_width : Float32)
    self.line_offset = start_line
    @lines.each(&.width=(@code_width)) if @code_width != code_width
    @code_width = code_width

    each_code_line(snapshot) do |code_line, line_n|
      code_line.render(snapshot)
      snapshot.translate(0.0_f32, snapshot.line_height)
    end
  end

  private def each_code_line(snapshot)
    highlighter = @highlighter
    if highlighter
      Log.info { "------------------Rendering with highlight-------------------------".colorize.red }
      # FIXME: Only do this if highlight changed
      highlighter.set_line_range(@line_offset, @line_offset + snapshot.lines_per_page)
      highlighter.exec
    end

    0.upto(snapshot.lines_per_page) do |i|
      line = @lines[i]?
      line_n = @line_offset + i

      if line.nil?
        text = @buffer.line(line_n)
        break if text.nil?

        line = CodeLine.new(@pango_ctx)
        line.text = text
        line.width = @code_width
        line.attributes = @highlighter.try(&.pango_attrs_for_next_line)
        @lines << line
      elsif line.text_outdated?
        text = @buffer.line(line_n)
        break if text.nil?

        line.width = @code_width
        line.text = text
        line.attributes = @highlighter.try(&.pango_attrs_for_next_line)
      else
        highlighter.skip_attrs_for_next_line
      end
      yield(line, line_n)
    end
  end
end
