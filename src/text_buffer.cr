# Meanwhile this is just a stupid implementation, but the plan is to implement a piece table here
# after the widget be capable of editing a text and show it highlighted
class TextBuffer
  @lines = [] of String

  def initialize(file : String?)
    @lines = File.read_lines(file) if file
  end

  def line_count : Int32
    @lines.size
  end

  def each_line(offset : Int32 = 0) : Nil
    @lines.each.skip(offset).with_index(offset) do |text, i|
      yield(text.to_slice, i)
    end
  end
end
