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

  context "when inserting around selection" do
    it "insert chars" do
      view = TextView.new
      view.text = "123456"
      view.buffer.select_range(2, 4)

      view.insert_char_around_selection(Gdk::KEY_parenleft).should eq(true)
      view.text.should eq("12(34)56")
      view.selected_text.should eq("34")

      view.insert_char_around_selection(Gdk::KEY_bracketleft).should eq(true)
      view.text.should eq("12([34])56")
      view.selected_text.should eq("34")

      view.insert_char_around_selection(Gdk::KEY_braceleft).should eq(true)
      view.text.should eq("12([{34}])56")
      view.selected_text.should eq("34")
    end
  end

  context "when stripping trailing whitespaces" do
    it "strips all trailing whitespaces" do
      text = "Hey\n   \n Ho! \r\nLet's Go   \n"
      tempfile = File.tempfile("foo")
      tempfile.print(text)
      tempfile.flush

      view = TextView.new(tempfile.path.to_s)
      view.goto(1, 2)
      view.save
      view.text.should eq("Hey\n\n Ho!\r\nLet's Go\n")
      view.cursor_pos.should eq({1,0})

      text = "Hey\n   \n Ho! \r\nLet's Go  "
      tempfile = File.tempfile("foo")
      tempfile.print(text)
      tempfile.flush
      view = TextView.new(tempfile.path.to_s)
      view.save
      view.text.should eq("Hey\n\n Ho!\r\nLet's Go")
    end

    it "strips nothing if configured to" do
      Config.instance.trailing_whitespace = false
      text = "Hey\n   \n Ho! \r\nLet's Go   \n"
      tempfile = File.tempfile("foo")
      tempfile.print(text)
      tempfile.flush

      view = TextView.new(tempfile.path.to_s)
      view.goto(1, 2)
      view.save
      view.text.should eq(text)
    ensure
      Config.instance.trailing_whitespace = true
    end
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
