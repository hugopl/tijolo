{% skip_file if flag?(:experimental) %}

require "./spec_helper"

describe CodeBuffer do
  it "strip trailing spaces on save" do
    text = "hey   \n" \
           " ho\n" \
           "let's go \n\n"

    buffer = CodeBuffer.new(GtkSource::Buffer.new(text: text))
    saved = IO::Memory.new
    buffer.save(saved)
    saved.to_s.should eq("hey\n ho\nlet's go\n\n")
  end
end
