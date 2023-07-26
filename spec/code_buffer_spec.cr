{% skip_file unless flag?(:experimental) %}

require "./spec_helper"

describe CodeBuffer do
  it "deletes a single character" do
    buffer = CodeBuffer.new("123\n12345\n12", nil)
    buffer.delete_chars(0, 0, 1)
    buffer.contents.should eq("23\n12345\n12")
  end

  it "join lines when deleting line feeds lines" do
    buffer = CodeBuffer.new("line0\nline1", nil)
    buffer.delete_chars(0, 5, 1)
    buffer.contents.should eq("line0line1")
    buffer.line_count.should eq(1)

    buffer = CodeBuffer.new("line0\nline1", nil)
    buffer.delete_chars(0, 4, 3)
    buffer.contents.should eq("lineine1")
    buffer.line_count.should eq(1)
  end

  it "deletes multiple lines" do
    buffer = CodeBuffer.new("line0\nline1\n\nline2\nline3", nil)
    buffer.delete_chars(0, 5, 19)
    buffer.contents.should eq("line0")
    buffer.line_count.should eq(1)
  end

  it "translates line/col to offset" do
    buffer = CodeBuffer.new("aé\naé", nil)
    buffer.point_to_offset(0, 0).should eq(0)
    buffer.point_to_offset(0, 1).should eq(1)
    buffer.point_to_offset(0, 2).should eq(3)
    buffer.point_to_offset(0, 3).should eq(4)
    buffer.point_to_offset(1, 0).should eq(4)
    buffer.point_to_offset(1, 1).should eq(5)
    buffer.point_to_offset(1, 2).should eq(7)
    buffer.point_to_offset(1, 3).should eq(8)
  end

  it "translates offset to line/col" do
    buffer = CodeBuffer.new("aé\naé", nil)
    buffer.offset_to_point(0).should eq({0, 0})
    buffer.offset_to_point(1).should eq({0, 1})
    buffer.offset_to_point(2).should eq({0, 1})
    buffer.offset_to_point(3).should eq({0, 2})
    buffer.offset_to_point(4).should eq({1, 0})
    buffer.offset_to_point(5).should eq({1, 1})
    buffer.offset_to_point(6).should eq({1, 1})
    buffer.offset_to_point(7).should eq({1, 2})
  end
end
