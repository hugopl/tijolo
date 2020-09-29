require "./spec_helper"
require "../src/split/root_node"

describe "Split views" do
  it "can split the root node" do
    root = Split::RootNode.new
    root.dump.should eq("root -> \n")

    root.add_view(TextView.new, split_view: true)
    root.dump.should eq("root -> View1 (1)\n")
    root.add_view(TextView.new, split_view: false)
    root.dump.should eq("root -> View1 (2)\n")

    root.add_view(TextView.new, split_view: true)
    root.dump.should eq("root -> Hsplit1\n" \
                        "Hsplit1 -> View1 (2)\n" \
                        "Hsplit1 -> View2 (1)\n")
    root.add_view(TextView.new, split_view: true)
    root.dump.should eq("root -> Hsplit1\n" \
                        "Hsplit1 -> View1 (2)\n" \
                        "Hsplit1 -> Hsplit2\n" \
                        "Hsplit2 -> View2 (1)\n" \
                        "Hsplit2 -> View3 (1)\n")
  end
end
