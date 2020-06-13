require "./spec_helper"

class TestLocatorListener
  include LocatorListener

  property files = [] of String

  def locator_open_file(file : String)
    @files << file
  end

  def locator_goto_line_col(line : Int32, column : Int32)
  end
end

# Just to make things accessible for testing
class TestLocator < Locator
  getter locator_entry
  getter locator_results

  def activated(widget : Gtk::TreeView, tree_path : Gtk::TreePath, _column : Gtk::TreeViewColumn)
    super
  end
end

describe Locator do
  it "can open a project file" do
    project = FakeProject.new(%w(spec/locator_spec.cr))

    locator = TestLocator.new(project)
    listener = TestLocatorListener.new
    locator.add_listener(listener)
    locator.text = "locator"

    locator.locator_results.row_activated(Gtk::TreePath.new_first, Gtk::TreeViewColumn.new)

    listener.files.should eq(["/fake/spec/locator_spec.cr"])
  end

  it "do nothing if can't find a file" do
    project = Project.new(".")
    locator = TestLocator.new(project)
    listener = TestLocatorListener.new
    locator.add_listener(listener)
    locator.text = "*&*&%*&%*&"

    locator.locator_results.row_activated(Gtk::TreePath.new_first, Gtk::TreeViewColumn.new)

    listener.files.should eq([] of String)
  end
end
