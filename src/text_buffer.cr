# meanwhile this is just a stupid implementation, but the plan is to implement a piece table here
class TextBuffer
  @lines = [] of String

  def initialize(file : String?)
    @lines = File.read_lines(file) if file
  end

  def line_count : Int32
    @lines.size
  end

  def each_line(offset : Int32 = 0)
    @lines.each do |line|
      yield(line.to_slice)
    end
  end
end
