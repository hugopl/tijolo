require "./spec_helper"

describe LineLocator do
  it "can go to a line" do
    locator = TestLocator.new(FakeProject.new(%w()))
    listener = TestLocatorListener.new
    locator.add_locator_listener(listener)

    locator.text = "l 10"
    locator.locator_results.row_activated(Gtk::TreePath.new_first, Gtk::TreeViewColumn.new)
    listener.line_col.should eq({9, 0})
  end

  it "can go to a line/column" do
    locator = TestLocator.new(FakeProject.new(%w()))
    listener = TestLocatorListener.new
    locator.add_locator_listener(listener)

    locator.text = "l 10:5"
    locator.locator_results.row_activated(Gtk::TreePath.new_first, Gtk::TreeViewColumn.new)
    listener.line_col.should eq({9, 4})
  end

  it "don't go negative line/column" do
    locator = TestLocator.new(FakeProject.new(%w()))
    listener = TestLocatorListener.new
    locator.add_locator_listener(listener)

    locator.text = "l -10"
    locator.locator_results.row_activated(Gtk::TreePath.new_first, Gtk::TreeViewColumn.new)
    listener.line_col.should eq({-1, -1})

    locator.text = "l -10:-3"
    locator.locator_results.row_activated(Gtk::TreePath.new_first, Gtk::TreeViewColumn.new)
    listener.line_col.should eq({-1, -1})

    locator.text = "l 10:-3"
    locator.locator_results.row_activated(Gtk::TreePath.new_first, Gtk::TreeViewColumn.new)
    listener.line_col.should eq({9, 0})
  end

  it "ignore bad entries" do
    locator = TestLocator.new(FakeProject.new(%w()))
    listener = TestLocatorListener.new
    locator.add_locator_listener(listener)

    locator.text = "l bad text is bad"
    locator.locator_results.row_activated(Gtk::TreePath.new_first, Gtk::TreeViewColumn.new)
    listener.line_col.should eq({-1, -1})
  end
end
