require "./spec_helper"

describe CodeCursor do
  it "preserve column" do
    buffer = CodeBuffer.new(contents: "123\n12345\n12")
    cursor = CodeCursor.new(buffer)
    cursor.pos.should eq({0, 0})

    cursor.move(:display_line_ends, 1)
    cursor.pos.should eq({0, 3})
    cursor.move(:display_lines, 1)
    cursor.pos.should eq({1, 3})
    cursor.move(:display_lines, 1)
    cursor.pos.should eq({2, 2})
    cursor.move(:display_lines, -2)
    cursor.pos.should eq({0, 3})
  end
end
