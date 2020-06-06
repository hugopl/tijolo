require "./spec_helper"

describe ProjectTree do
  it "directories come first when traversing the tree" do
    project = FakeProject.new(%w(file1 dir/file2.ext))
    tree = ProjectTree.new(project)
    tree.to_s.should eq("<root>\n" \
                        "  dir\n" \
                        "    file2.ext\n" \
                        "  file1\n")
  end

  it "can calculate the tree path" do
    project = FakeProject.new(%w(00/00 00/01 01/00/00 01/00/01 02))
    tree = ProjectTree.new(project)
    tree.to_s.should eq("<root>\n" \
                        "  00\n" \
                        "    00\n" \
                        "    01\n" \
                        "  01\n" \
                        "    00\n" \
                        "      00\n" \
                        "      01\n" \
                        "  02\n")
    tree.model.value(tree.tree_path("00").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("00")
    tree.model.value(tree.tree_path("00").not_nil!, ProjectTree::PROJECT_TREE_IS_DIR).boolean.should eq(true)

    tree.model.value(tree.tree_path("00/00").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("00")
    tree.model.value(tree.tree_path("00/00").not_nil!, ProjectTree::PROJECT_TREE_IS_DIR).boolean.should eq(false)

    tree.model.value(tree.tree_path("00/01").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("01")
    tree.model.value(tree.tree_path("00/01").not_nil!, ProjectTree::PROJECT_TREE_IS_DIR).boolean.should eq(false)

    tree.model.value(tree.tree_path("01").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("01")
    tree.model.value(tree.tree_path("01").not_nil!, ProjectTree::PROJECT_TREE_IS_DIR).boolean.should eq(true)

    tree.model.value(tree.tree_path("01/00").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("00")
    tree.model.value(tree.tree_path("01/00").not_nil!, ProjectTree::PROJECT_TREE_IS_DIR).boolean.should eq(true)

    tree.model.value(tree.tree_path("01/00/00").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("00")
    tree.model.value(tree.tree_path("01/00/00").not_nil!, ProjectTree::PROJECT_TREE_IS_DIR).boolean.should eq(false)

    tree.model.value(tree.tree_path("01/00/01").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("01")
    tree.model.value(tree.tree_path("01/00/01").not_nil!, ProjectTree::PROJECT_TREE_IS_DIR).boolean.should eq(false)

    tree.model.value(tree.tree_path("02").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("02")
    tree.model.value(tree.tree_path("02").not_nil!, ProjectTree::PROJECT_TREE_IS_DIR).boolean.should eq(false)
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

  it "add files and folders sorted alphabetically" do
    project = FakeProject.new(%w())
    tree = ProjectTree.new(project)
    project.add_file(Path.new("/fake/3/3"))
    project.add_file(Path.new("/fake/1/0"))
    project.add_file(Path.new("/fake/2/2"))
    project.add_file(Path.new("/fake/3/2"))
    tree.to_s.should eq("<root>\n" \
                        "  1\n" \
                        "    0\n" \
                        "  2\n" \
                        "    2\n" \
                        "  3\n" \
                        "    2\n" \
                        "    3\n")
  end

  it "can have files added" do
    project = FakeProject.new(%w(0 1 2/0 2/1))
    tree = ProjectTree.new(project)
    project.add_file(Path.new("/fake/2/2/0"))
    tree.to_s.should eq("<root>\n" \
                        "  2\n" \
                        "    2\n" \
                        "      0\n" \
                        "    0\n" \
                        "    1\n" \
                        "  0\n" \
                        "  1\n")
    tree.model.value(tree.tree_path("0").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("0")
    tree.file_path({1}).should eq("/fake/0")
    tree.model.value(tree.tree_path("1").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("1")
    tree.file_path({2}).should eq("/fake/1")
    tree.model.value(tree.tree_path("2/0").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("0")
    tree.file_path({0, 1}).should eq("/fake/2/0")
    tree.model.value(tree.tree_path("2/1").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("1")
    tree.file_path({0, 2}).should eq("/fake/2/1")
    tree.model.value(tree.tree_path("2/2/0").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("0")
    tree.file_path({0, 0, 0}).should eq("/fake/2/2/0")
  end

  pending "can have files renamed"
  pending "can have files removed"
end
