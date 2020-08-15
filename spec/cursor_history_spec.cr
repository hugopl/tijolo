require "./spec_helper"
require "../src/cursor_history"

describe CursorHistory do
  before_each do
    CursorHistory::Cursor.reset_mark_counter
  end

  it "can do foward and backward in history" do
    hist = CursorHistory.new
    hist.next.should eq(nil)
    hist.current.should eq(nil)
    hist.prev.should eq(nil)

    hist.add(Path.new("foo"), 1, 0).should eq("hst_0")
    hist.add(Path.new("foo"), 100, 0).should eq("hst_1")
    hist.add(Path.new("bar"), 100, 0).should eq("hst_2")
    hist.add(Path.new("bar"), 1, 0).should eq("hst_3")

    hist.next.should eq(nil)

    cursor = hist.prev.not_nil!
    cursor.file_path.should eq(Path.new("bar"))
    cursor.line.should eq(100)
    cursor.mark_name.should eq("hst_2")

    cursor = hist.prev.not_nil!
    cursor.file_path.should eq(Path.new("foo"))
    cursor.line.should eq(100)
    cursor.mark_name.should eq("hst_1")

    cursor = hist.prev.not_nil!
    cursor.file_path.should eq(Path.new("foo"))
    cursor.line.should eq(1)
    cursor.mark_name.should eq("hst_0")
    hist.prev.should eq(nil)

    cursor = hist.next.not_nil!
    cursor.file_path.should eq(Path.new("foo"))
    cursor.line.should eq(100)
    cursor.mark_name.should eq("hst_1")

    cursor = hist.next.not_nil!
    cursor.file_path.should eq(Path.new("bar"))
    cursor.line.should eq(100)
    cursor.mark_name.should eq("hst_2")

    cursor = hist.next.not_nil!
    cursor.file_path.should eq(Path.new("bar"))
    cursor.line.should eq(1)
    cursor.mark_name.should eq("hst_3")

    hist.next.should eq(nil)
  end

  it "items inserted in the middle do not erase itens in history" do
    hist = CursorHistory.new
    hist.add(Path.new("foo"), 1, 0).should eq("hst_0")
    hist.add(Path.new("foo"), 100, 0).should eq("hst_1")
    hist.add(Path.new("bar"), 100, 0).should eq("hst_2")

    hist.prev.not_nil!.mark_name.should eq("hst_1")

    hist.add(Path.new("hey"), 42, 0).should eq("hst_3")
    hist.add(Path.new("yeah"), 42, 0).should eq("hst_4")

    hist.items.map(&.mark_name).should eq(%w(hst_0 hst_1 hst_3 hst_4 hst_2))
    hist.current.not_nil!.mark_name.should eq("hst_4")
  end

  it "do not add items near current item (1)" do
    hist = CursorHistory.new
    hist.add(Path.new("foo"), 1, 0).should eq("hst_0")
    hist.add(Path.new("foo"), 2, 0).should eq(nil)
    hist.add(Path.new("foo"), 1 + CursorHistory::ROW_DELTA, 0).should eq(nil)
    hist.add(Path.new("foo"), 1 + CursorHistory::ROW_DELTA + 1, 0).should eq("hst_1")
    # same line, different file, so add it
    hist.add(Path.new("bar"), 1 + CursorHistory::ROW_DELTA + 1, 0).should eq("hst_2")
  end

  it "do not add items near current item (2)" do
    hist = CursorHistory.new
    hist.add(Path.new("foo"), 1, 0).should eq("hst_0")
    hist.add(Path.new("foo"), 100, 0).should eq("hst_1")
    hist.prev
    hist.add(Path.new("foo"), 1, 0).should eq(nil)
    hist.items.map(&.mark_name).should eq(%w(hst_0 hst_1))
  end

  it "saves the cursor column" do
    hist = CursorHistory.new
    hist.add(Path.new("foo"), 75, 34).should eq("hst_0")
    hist.current.not_nil!.line.should eq(75)
    hist.current.not_nil!.column.should eq(34)
  end
end
