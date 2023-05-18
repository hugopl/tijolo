abstract class CodeGutter
  abstract def render(snapshot : CodeSnapshot, buffer : CodeBuffer, line_offset : Int32) : Nil
  abstract def width : Float32
end

# TODO: Optimize line number rendering by having a cahe of 10 number glyphs and just use them
class CodeLineNumberGutter < CodeGutter
  @layout : Pango::Layout
  @buffer = IO::Memory.new
  getter width : Float32

  def initialize(pango_ctx : Pango::Context)
    @layout = Pango::Layout.new(pango_ctx)
    @layout.alignment = :right
    @width = 0.0
  end

  def render(snapshot : CodeSnapshot, buffer : CodeBuffer, line_offset : Int32) : Nil
    text_color = CodeTheme.instance.text_color
    line_count = buffer.line_count
    max_digits = (Math.log(line_count.to_f + 1) / Math::LOG10).ceil.to_i
    @width = max_digits * snapshot.font_width + CodeEditor::DOUBLE_MARGIN

    snapshot.save do
      snapshot.translate(CodeEditor::MARGIN, 0.0_f32)
      line_offset.upto(snapshot.lines_per_page + line_offset) do |line_n|
        return if line_n >= line_count
        @layout.set_text(line_number_to_string(line_n + 1))
        snapshot.append_layout(@layout, text_color)
        snapshot.translate(0.0_f32, snapshot.line_height)
      end
    end
  end

  private def line_number_to_string(i : Int32) : Bytes
    @buffer.clear
    i.to_s(@buffer)
    @buffer.to_slice
  end
end
