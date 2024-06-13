require "./spec_helper"

describe CodeBuffer do
  it "strip trailing spaces on save" do
    text = "hey   \n" \
           " ho\n" \
           "let's go \n\n"

    buffer = CodeBuffer.new
    buffer.text = text

    tempfile = File.tempfile("foo")
    buffer.save(Path[tempfile.path])
    buffer.text.should eq("hey\n ho\nlet's go\n\n")
  end
end
