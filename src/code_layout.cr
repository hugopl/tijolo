require "./code_line"
require "./code_no_highlighter"
require "./code_tree_sitter_highlighter"

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
    @highlighter = @buffer.parser ? CodeTreeSitterHighlighter.new(@buffer) : CodeNoHighlighter.new
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

    @highlighter.set_line_range(@line_offset, @line_offset + snapshot.lines_per_page)
    highlight_time = Time.measure do
      @highlighter.exec
    end
    Log.notice { "highlight time: #{highlight_time}" }

    0.upto(snapshot.lines_per_page) do |i|
      code_line = @lines[i]?
      line_n = @line_offset + i

      if code_line.nil?
        text = @buffer.line(line_n)
        break if text.nil?

        code_line = CodeLine.new(@pango_ctx)
        code_line.text = text
        code_line.width = @code_width
        code_line.attributes = @highlighter.pango_attrs_for_next_line
        @lines << code_line
      elsif code_line.text_outdated?
        text = @buffer.line(line_n)
        break if text.nil?

        code_line.width = @code_width
        code_line.text = text
        code_line.attributes = @highlighter.pango_attrs_for_next_line
      else
        highlighter.skip_attrs_for_next_line
      end
      code_line.render(snapshot)
      snapshot.translate(0.0_f32, snapshot.line_height)
    end
  end
end
