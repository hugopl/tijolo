require "./spec_helper"

def project_tree_from_array
end

describe ProjectTree::Node do
  it "directories come first when traversing the tree" do
    tree = ProjectTree::Root.new(%w(file1 dir/file2))
    tree.to_s.should eq("<root>\n" \
                        "  dir\n" \
                        "    file2\n" \
                        "  file1\n")
  end

  it "can calculate the tree path" do
    tree = ProjectTree::Root.new(%w(00/00 00/01 01/00/00 01/00/01 02))
    tree.to_s.should eq("<root>\n" \
                        "  00\n" \
                        "    00\n" \
                        "    01\n" \
                        "  01\n" \
                        "    00\n" \
                        "      00\n" \
                        "      01\n" \
                        "  02\n")
    file_paths = [] of String
    dir_flags = [] of Bool
    tree_paths = [] of Array(Int32)
    tree.traverse do |file_path, is_dir, tree_path|
      file_paths << file_path.join("/")
      dir_flags << is_dir
      tree_paths << tree_path.clone
    end

    expected_file_paths = %w(00 00/00 00/01 01 01/00 01/00/00 01/00/01 02)
    expected_dir_flags = [true, false, false, true, true, false, false, false]
    expected_tree_paths = [[] of Int32, [0], [0], [] of Int32, [1], [1, 0], [1, 0], [] of Int32]

    file_paths.should eq(expected_file_paths)
    dir_flags.should eq(expected_dir_flags)
    tree_paths.should eq(expected_tree_paths)
  end

  it "can get the path tree" do
    project = FakeProject.new(%w(0 1 2/0 2/1))
    tree = ProjectTree.new(project)
    tree.to_s.should eq("<root>\n" \
                        "  2\n" \
                        "    0\n" \
                        "    1\n" \
                        "  0\n" \
                        "  1\n")
    tree.tree_path("/fake/0").should eq([1])
    tree.tree_path("0").should eq([1])
    tree.tree_path("/fake/1").should eq([2])
    tree.tree_path("1").should eq([2])
    tree.tree_path("/fake/2/0").should eq([0, 0])
    tree.tree_path("2/0").should eq([0, 0])
    tree.tree_path("/fake/2/1").should eq([0, 1])
    tree.tree_path("2/1").should eq([0, 1])
    tree.tree_path("2/eita").should eq(nil)
  end
end
