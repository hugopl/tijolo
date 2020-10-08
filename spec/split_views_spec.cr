require "./spec_helper"
require "../src/split/root_node"

describe "Split views" do
  before_each do
    TextView.reset_untitled_count
  end

  it "can split the root node" do
    root = Split::RootNode.new
    root.dump.should eq("root -> \n")

    root.add_view(TextView.new, true)
    root.dump.should eq("root -> View1 (1)\n")
    root.add_view(TextView.new, false)
    root.dump.should eq("root -> View1 (2)\n")

    root.add_view(TextView.new, true, :horizontal)
    root.dump.should eq("root -> Hsplit1\n" \
                        "Hsplit1 -> View1 (2)\n" \
                        "Hsplit1 -> View2 (1)\n")
    root.add_view(TextView.new, true, :vertical)
    root.dump.should eq("root -> Hsplit1\n" \
                        "Hsplit1 -> View1 (2)\n" \
                        "Hsplit1 -> Vsplit2\n" \
                        "Vsplit2 -> View2 (1)\n" \
                        "Vsplit2 -> View3 (1)\n")
    root.current_view.not_nil!.label.should eq("Untitled 3")
  end
end
