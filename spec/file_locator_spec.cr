require "./spec_helper"

describe FileLocator do
  it "can open a project file" do
    project = FakeProject.new(%w(spec/locator_spec.cr))

    locator = TestLocator.new(project)
    listener = TestLocatorListener.new
    locator.add_locator_listener(listener)
    locator.text = "locator"

    locator.locator_results.row_activated(Gtk::TreePath.new_first, Gtk::TreeViewColumn.new)

    listener.files.should eq(["/fake/spec/locator_spec.cr"])
  end

  it "do nothing if can't find a file" do
    project = Project.new(".")
    locator = TestLocator.new(project)
    listener = TestLocatorListener.new
    locator.add_locator_listener(listener)
    locator.text = "*&*&%*&%*&"

    locator.locator_results.row_activated(Gtk::TreePath.new_first, Gtk::TreeViewColumn.new)

    listener.files.should eq([] of String)
  end
end
