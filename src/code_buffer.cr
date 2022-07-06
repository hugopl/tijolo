# Meanwhile this is just a stupid implementation, but the plan is to implement a piece table here
# after the widget be capable of editing a text and show it highlighted
#
# The buffer will only accept UTF-8 strings with \n ending.
class CodeBuffer
  @lines = [] of String

  def initialize(file : String?)
    @lines = File.read(file).split("\n") if file
  end

  def line_count : Int32
    @lines.size
  end

  def line_size(n : Int32) : Int32
    @lines[n]?.try(&.size) || 0
  end

  def each_line(offset : Int32 = 0) : Nil
    @lines.each.skip(offset).with_index(offset) do |text, i|
      yield(text.to_slice, i)
    end
  end
end
