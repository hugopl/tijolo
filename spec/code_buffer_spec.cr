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
end
