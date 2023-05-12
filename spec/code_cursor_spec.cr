require "./spec_helper"

describe CodeCursor do
  it "preserve column" do
    buffer = CodeBuffer.new("123\n12345\n12", nil)
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

  it "can backspace" do
    buffer = CodeBuffer.new("123\n12345\n12", nil)
    cursor = CodeCursor.new(buffer)
    cursor.move(:display_lines, 1)
    cursor.pos.should eq({1, 0})
    cursor.backspace
    buffer.contents.should eq("12312345\n12")
    buffer.line_count.should eq(2)
  end

  it "can backspace (2)" do
    buffer = CodeBuffer.new("123", nil)
    cursor = CodeCursor.new(buffer)
    cursor.backspace
    buffer.contents.should eq("123")
    buffer.line_count.should eq(1)
  end
end
