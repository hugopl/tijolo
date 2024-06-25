require "./spec_helper"

describe CodeEditor do
  it "strip trailing spaces on save" do
    text = "hey   \n" \
           " ho\n" \
           "let's go \n\n"

    editor = CodeEditor.new(nil)
    editor.buffer.text = text

    tempfile = File.tempfile("foo")
    editor.save(Path[tempfile.path])
    editor.buffer.text.should eq("hey\n ho\nlet's go\n\n")
    tempfile.delete
  end
end
