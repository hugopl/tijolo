require "./spec_helper"
require "../src/split/root_node"

describe Split do
  before_each do
    TextView.reset_untitled_count
    Split::SplitNode.reset_node_count
    Split::ViewNode.reset_node_count
  end

  it "can split the root node" do
    root = Split::RootNode.new
    root.dump.should eq("root -> \n")

    view1 = TextView.new
    root.add_view(view1, nil, true)
    root.dump.should eq("root -> \"View1 (1)\"\n")
    view2 = TextView.new
    root.add_view(view2, view1, false)
    root.dump.should eq("root -> \"View1 (2)\"\n")

    view3 = TextView.new
    root.add_view(view3, view2, true, :horizontal)
    root.dump.should eq("root -> Hsplit1\n" \
                        "Hsplit1 -> \"View1 (2)\"\n" \
                        "Hsplit1 -> \"View2 (1)\"\n")
    view4 = TextView.new
    root.add_view(view4, view3, true, :vertical)
    root.dump.should eq("root -> Hsplit1\n" \
                        "Hsplit1 -> \"View1 (2)\"\n" \
                        "Hsplit1 -> Vsplit2\n" \
                        "Vsplit2 -> \"View2 (1)\"\n" \
                        "Vsplit2 -> \"View3 (1)\"\n")
    root.current_view.not_nil!.label.should eq("Untitled 3")
  end

  it "can navigate to through splits" do
    root = Split::RootNode.new
    view0 = TextView.new
    root.add_view(view0, nil, false)
    view1 = TextView.new
    root.add_view(view1, view0, false)
    view2 = TextView.new
    root.add_view(view2, view1, true, :horizontal)
    view3 = TextView.new
    root.add_view(view3, view2, true, :vertical)
    view4 = TextView.new
    root.add_view(view4, view1, true, :vertical)
    #  view1 | view2
    # -------+-------
    #  view4 | view3
    view5 = TextView.new
    root.add_view(view5, view4, true, :horizontal)

    view6 = TextView.new
    root.add_view(view6, view3, true, :horizontal)

    view7 = TextView.new
    root.add_view(view7, view2, true, :horizontal)

    view8 = TextView.new
    root.add_view(view8, view1, true, :horizontal)
    #  view1 | view8 | view2 | view7
    # -------+-------+-------+-------
    #  view4 | view5 | view3 | view6

    # View1
    root.current_view = view1
    root.upper_split.should eq(nil)
    root.right_split.not_nil!.visible_view_id.should eq(view8.id)
    root.lower_split.not_nil!.visible_view_id.should eq(view4.id)
    root.left_split.should eq(nil)

    # View2
    root.current_view = view2
    root.upper_split.should eq(nil)
    root.right_split.not_nil!.visible_view_id.should eq(view7.id)
    root.lower_split.not_nil!.visible_view_id.should eq(view3.id)
    root.left_split.not_nil!.visible_view_id.should eq(view8.id)

    # View3
    root.current_view = view3
    root.upper_split.not_nil!.visible_view_id.should eq(view2.id)
    root.right_split.not_nil!.visible_view_id.should eq(view6.id)
    root.lower_split.should eq(nil)
    root.left_split.not_nil!.visible_view_id.should eq(view5.id)

    # View4
    root.current_view = view4
    root.upper_split.not_nil!.visible_view_id.should eq(view1.id)
    root.right_split.not_nil!.visible_view_id.should eq(view5.id)
    root.lower_split.should eq(nil)
    root.left_split.should eq(nil)

    # View5
    root.current_view = view5
    root.upper_split.not_nil!.visible_view_id.should eq(view8.id)
    root.right_split.not_nil!.visible_view_id.should eq(view3.id)
    root.lower_split.should eq(nil)
    root.left_split.not_nil!.visible_view_id.should eq(view4.id)

    # View6
    root.current_view = view6
    root.upper_split.not_nil!.visible_view_id.should eq(view7.id)
    root.right_split.should eq(nil)
    root.lower_split.should eq(nil)
    root.left_split.not_nil!.visible_view_id.should eq(view3.id)

    # View7
    root.current_view = view7
    root.upper_split.should eq(nil)
    root.right_split.should eq(nil)
    root.lower_split.not_nil!.visible_view_id.should eq(view6.id)
    root.left_split.not_nil!.visible_view_id.should eq(view2.id)

    # View8
    root.current_view = view8
    root.upper_split.should eq(nil)
    root.right_split.not_nil!.visible_view_id.should eq(view2.id)
    root.lower_split.not_nil!.visible_view_id.should eq(view5.id)
    root.left_split.not_nil!.visible_view_id.should eq(view1.id)

    # root.to_dot
  end
end
