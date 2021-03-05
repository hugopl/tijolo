require "./spec_helper"
require "../src/find_replace"

# Test monkey patch to access the guts of FindReplace
class FindReplace
  property entry
end

def create_find_replace(haystack : String, mode : FindReplace::Mode, cursor_pos = {0, 0})
  fr = FindReplace.new
  view = TextView.new
  view.text = haystack
  view.cursor_pos = cursor_pos
  fr.show(view, mode)
  {fr, view}
end

describe FindReplace do
  it "select search entry contents when revealed with text selected in text view" do
    fr, view = create_find_replace("AbcXXXdef XXX", :find_by_text)
    fr.search_text = "Xxx"
    view.buffer.selected_text.should eq("XXX")
    fr.hide

    fr.show(view, :find_by_text)
    ok, start_pos, end_pos = fr.entry.selection_bounds
    ok.should eq(true)
    start_pos.should eq(0)
    end_pos.should eq(3)
  end

  it "show empty search entry contents when revealed with no selected text in text view (find by text)" do
    fr, view = create_find_replace("AbcXXXdef XXX", :find_by_text)
    fr.entry.text.should eq("")
    fr.search_text = "888"
    fr.hide
    fr.show(view, :find_by_text)
    fr.entry.text.should eq("")
  end

  it "show \"//\" in search entry contents when revealed with no selected text in text view (find/replace)" do
    fr, view = create_find_replace("AbcXXXdef XXX", :find_replace)
    fr.entry.text.should eq("//")
    fr.search_text = "/888/99"
    fr.hide
    fr.show(view, :find_replace)
    fr.entry.text.should eq("//")
  end

  it "does not select search entry contents if already revealed" do
    fr, view = create_find_replace("AbcXXXdef XXX", :find_by_text)
    fr.search_text = "Xxx"
    fr.show(view, :find_by_text)
    ok, _start_pos, _end_pos = fr.entry.selection_bounds
    ok.should eq(false)
  end

  it "add a / when changing from find_by_text to find_replace" do
    fr, view = create_find_replace("AbcXXXdef XXX", :find_by_text)
    fr.search_text = "Hey"
    fr.show(view, :find_by_text)
    fr.entry.text.should eq("Hey")
    fr.show(view, :find_replace)
    fr.entry.text.should eq("/Hey/")
    fr.show(view, :find_by_regexp)
    fr.entry.text.should eq("Hey")
    fr.show(view, :find_replace)
    fr.search_text = "/Hey/Ho"
    fr.show(view, :find_by_text)
    fr.entry.text.should eq("Hey")
  end

  context "when finding by text" do
    it "is case insensitive" do
      fr, view = create_find_replace("AbcXXXdef XXX", :find_by_text)
      fr.search_text = "Xxx"
      view.buffer.selected_text.should eq("XXX")
      view.cursor_pos.should eq({0, 3})

      fr.find_next
      view.buffer.selected_text.should eq("XXX")
      view.cursor_pos.should eq({0, 10})

      fr.find_prev
      view.buffer.selected_text.should eq("XXX")
      view.cursor_pos.should eq({0, 3})

      fr.find_prev
      view.buffer.selected_text.should eq("XXX")
      view.cursor_pos.should eq({0, 10})
    end
  end

  context "when finding by regexp" do
    it "works" do
      fr, view = create_find_replace("abcd/24ef", :find_by_regexp)
      fr.search_text = "/\\d+"
      view.buffer.selected_text.should eq("/24")
      view.cursor_pos.should eq({0, 4})
    end
  end

  context "when finding and replacing" do
    it "works" do
      fr, view = create_find_replace("abcd/12 3", :find_replace)
      fr.search_text = "/\\d+/Zzz"
      view.buffer.selected_text.should eq("12")
      fr.activate
      view.buffer.text.should eq("abcd/Zzz 3")
      view.cursor_pos.should eq({0, 8})
      fr.activate
      view.buffer.text.should eq("abcd/Zzz Zzz")
      view.cursor_pos.should eq({0, 12})
    end
  end
end
