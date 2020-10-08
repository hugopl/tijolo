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
  before_each do
    TextView.reset_untitled_count
  end

  it "has a Untitled title for new files" do
    view_label = TextView.new.header_text
    view_label.should eq("Untitled")
    TextView.new.header_text.should eq("Untitled 1")
    TextView.new.header_text.should eq("Untitled 2")
    TextView.new.header_text.should eq("Untitled 3")
  end

  it "can save new files" do
    filename = Path.new(Dir.tempdir) / "test"
    view = TextView.new
    view.readonly?.should eq(false)
    view.virtual?.should eq(false)

    view.file_path = Path.new(filename)
    view.save
    view.modified?.should eq(false)
    view.header_text.should eq(filename.to_s)
    File.delete(filename)
  end

  it "open readonly files in readonly mode" do
    tempfile = File.tempfile("foo", ".txt") do |file|
      file.print("hey")
    end
    File.chmod(tempfile.path, 0o400)
    view = TextView.new(Path.new(tempfile.path))
    view.readonly?.should eq(true)
    view.modified?.should eq(false)
    view.header_text.should eq("#{tempfile.path} 🔒")
  ensure
    if tempfile
      File.chmod(tempfile.path, 0o600)
      tempfile.delete
    end
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

      view = TextView.new(Path.new(tempfile.path))
      view.goto(1, 2)
      view.save
      view.text.should eq("Hey\n\n Ho!\r\nLet's Go\n")
      view.cursor_pos.should eq({1, 0})

      text = "Hey\n   \n Ho! \r\nLet's Go  "
      tempfile = File.tempfile("foo")
      tempfile.print(text)
      tempfile.flush
      view = TextView.new(Path.new(tempfile.path))
      view.save
      view.text.should eq("Hey\n\n Ho!\r\nLet's Go")
    end

    it "strips nothing if configured to" do
      Config.instance.trim_trailing_white_space_on_save = false
      text = "Hey\n   \n Ho! \r\nLet's Go   \n"
      tempfile = File.tempfile("foo")
      tempfile.print(text)
      tempfile.flush

      view = TextView.new(Path.new(tempfile.path))
      view.goto(1, 2)
      view.save
      view.text.should eq(text)
    ensure
      Config.restore_default
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
