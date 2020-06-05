require "./spec_helper"

SAMPLE_CODE = <<-EOF
require "whatever"

module Module
  abstract def method(param : Type)
end
EOF

def create_text_view(text = SAMPLE_CODE, language = "crystal")
  view = TextView.new
  view.text = text
  view.language = language
  view.goto(0, 0)
  view
end

describe TextView do
  it "responst true for modified? when the file isn't saved" do
    TextView.new.modified?.should eq(true)
  end

  context "when commenting current line" do
    it "simple generic case works" do
      view = create_text_view(SAMPLE_CODE)
      view.goto(2, 2)
      view.comment_action
      view.text.should eq(<<-EOF)
        require "whatever"

        # module Module
          abstract def method(param : Type)
        end
        EOF
      view.comment_action
      view.text.should eq(SAMPLE_CODE)
    end

    it "deal correctly with different space configurations" do
      view = create_text_view("    #Hi")
      view.comment_action
      view.text.should eq("    Hi")
      view.comment_action
      view.text.should eq("    # Hi")

      view.text = "#Hi"
      view.comment_action
      view.text.should eq("Hi")

      view.text = "#  Hi"
      view.comment_action
      view.text.should eq(" Hi")
      view.comment_action
      view.text.should eq(" # Hi")

      view.text = "some code # Hi"
      view.comment_action
      view.text.should eq("# some code # Hi")
      view.comment_action
      view.text.should eq("some code # Hi")
    end
  end

  context "when commenting selection" do
    it "simple generic case works" do
      view = create_text_view
      view.buffer.select_lines(2, 3)

      view.comment_action
      view.text.should eq(<<-EOF)
        require "whatever"

        # module Module
        #   abstract def method(param : Type)
        end
        EOF
      view.comment_action
      view.text.should eq(SAMPLE_CODE)
    end

    it "deal correctly with different space configurations" do
      view = create_text_view(<<-EOF)
        require "whatever"

           #module Module # hey!
           #  abstract def method(param : Type)
           #end
        EOF
      view.buffer.select_lines(2, 4)

      view.comment_action
      view.text.should eq(<<-EOF)
        require "whatever"

           module Module # hey!
             abstract def method(param : Type)
           end
        EOF
      view.comment_action
      view.text.should eq(<<-EOF)
        require "whatever"

           # module Module # hey!
           #   abstract def method(param : Type)
           # end
        EOF
    end
  end

  context "when file is read only" do
    it "do not comment readonly files" do
      view = create_text_view
      view.readonly = true

      view.goto(2, 2)
      view.text.lines[2].should eq("module Module")
      view.comment_action
      view.text.lines[2].should eq("module Module")
    end
  end
end
