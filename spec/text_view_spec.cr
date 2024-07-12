require "./spec_helper"

describe TextView do
  it "strip trailing spaces on save" do
    text = "hey   \n" \
           " ho\n" \
           "let's go \n\n"

    text_view = TextView.new(nil)
    text_view.editor.buffer.text = text

    tempfile = File.tempfile("foo")
    text_view.save_as(Path[tempfile.path])
    text_view.editor.buffer.text.should eq("hey\n ho\nlet's go\n\n")
    tempfile.delete
  end
end
