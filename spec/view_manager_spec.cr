require "./spec_helper"
require "../src/view_manager"
require "../src/terminal_view"

describe ViewManager do
  it "does not leak views references" do
    vm = ViewManager.new
    view = TextView.new
    view.ref_count.should eq(1)
    vm.add_view(view)
    view.ref_count.should be > 1

    vm.remove_current_view
    view.ref_count.should eq(1)
  end
end
