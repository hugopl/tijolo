require "./spec_helper"
require "../src/view_manager"
require "../src/terminal_view"

describe ViewManager do
  it "does not leak views references" do
    vm = ViewManager.new
    view = TestView.new
    view.ref_count.should eq(1)
    vm.add_view(view)
    view.ref_count.should be > 1

    vm.remove_current_view
    view.ref_count.should eq(1)
  end

  context "when moving views" do
    it "can move view left" do
      vm = ViewManager.new
      right = TestView.new("right")
      left = TestView.new("left")
      vm.add_view(right)
      vm.add_view(left)
      vm.relayout
      vm.move_left.should eq(true)
      vm.dump.should eq("Horizontal{*(left)(right)}")
    end

    it "can move view right" do
      vm = ViewManager.new
      right = TestView.new("right")
      left = TestView.new("left")
      vm.add_view(left)
      vm.add_view(right)
      vm.relayout
      vm.move_right.should eq(true)
      vm.dump.should eq("Horizontal{(left)*(right)}")
    end

    it "can move view top" do
      vm = ViewManager.new
      top = TestView.new("top")
      bottom = TestView.new("bottom")
      vm.add_view(bottom)
      vm.add_view(top)
      vm.relayout
      vm.move_top.should eq(true)
      vm.dump.should eq("Vertical{*(top)(bottom)}")
    end

    it "can move view bottom" do
      vm = ViewManager.new
      top = TestView.new("top")
      bottom = TestView.new("bottom")
      vm.add_view(top)
      vm.add_view(bottom)
      vm.relayout
      vm.move_bottom.should eq(true)
      vm.dump.should eq("Vertical{(top)*(bottom)}")
    end
  end

  it "keep views in a single node ordered by last use" do
    vm = ViewManager.new
    two = TestView.new("two")
    one = TestView.new("one")
    three = TestView.new("three")
    vm.add_view(one)
    vm.add_view(two)
    vm.add_view(three)
    vm.relayout
    vm.dump.should eq("*(three, two, one)")
    vm.show_view(one, reorder: true, focus: false)
    vm.dump.should eq("*(one, three, two)")
    vm.show_view(three, reorder: true, focus: false)
    vm.dump.should eq("*(three, one, two)")
    vm.show_view(three, reorder: true, focus: false)
    vm.dump.should eq("*(three, one, two)")
    vm.show_view(two, reorder: false, focus: false)
    vm.dump.should eq("*(three, one, two)")
  end

  context "when moving views" do
    it "try to split first, only join if alone in the node" do
      vm = ViewManager.new
      one = TestView.new("one")
      two = TestView.new("two")
      three = TestView.new("three")
      vm.add_view(two)
      vm.add_view(one)
      vm.add_view(three)
      vm.relayout
      vm.dump.should eq("*(three, one, two)")
      assert_visible(three)
      assert_not_visible(one, two)

      vm.move_right
      vm.dump.should eq("Horizontal{(one, two)*(three)}")
      vm.relayout
      assert_visible(one, three)
      assert_not_visible(two)

      vm.current_view = two
      vm.dump.should eq("Horizontal{*(two, one)(three)}")
      assert_visible(two, three)
      assert_not_visible(one)

      vm.move_right.should eq(true)
      vm.dump.should eq("Horizontal{(one)*(two)(three)}")
      vm.relayout
      assert_visible(one, two, three)

      vm.move_right.should eq(true)
      vm.dump.should eq("Horizontal{(one)*(two, three)}")
      vm.relayout
      assert_visible(one, two)
      assert_not_visible(three)

      vm.current_view = one
      vm.dump.should eq("Horizontal{*(one)(two, three)}")
      assert_visible(one, two)
      assert_not_visible(three)

      vm.move_right.should eq(true)
      vm.dump.should eq("Horizontal{*(one, two, three)}")
      assert_visible(one)
      assert_not_visible(two, three)
    end
  end
end
