require "./spec_helper"

describe ViewIterator do
  it "traverse views (1)" do
    vm = ViewManager.new
    one = TestView.new("one")
    two = TestView.new("two")
    three = TestView.new("three")
    vm.add_view(three)
    vm.add_view(two)
    vm.add_view(one)

    vm.views.map(&.label).to_a.should eq(%w(one two three))
  end

  it "traverse views (2)" do
    vm = ViewManager.new
    one = TestView.new("one")
    two = TestView.new("two")
    three = TestView.new("three")
    vm.add_view(three)
    vm.add_view(two)
    vm.add_view(one)
    vm.relayout
    vm.move_right
    vm.dump.should eq("Horizontal{(two, three)*(one)}")
    vm.save_png 1

    vm.views.map(&.label).to_a.should eq(%w(two three one))
  end

  # This need more tests 😅️
end
