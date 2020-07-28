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
    project.add_path(Path.new("/fake/3/3"))
    project.add_path(Path.new("/fake/1/0"))
    project.add_path(Path.new("/fake/2/2"))
    project.add_path(Path.new("/fake/3/2"))
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
    project.add_path(Path.new("/fake/2/2/0"))
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

  it "can have files removed" do
    project = FakeProject.new(%w(file1 dir1/dir2/dir3/file2 dir1/file3))
    tree = ProjectTree.new(project)
    tree.to_s.should eq("<root>\n" \
                        "  dir1\n" \
                        "    dir2\n" \
                        "      dir3\n" \
                        "        file2\n" \
                        "    file3\n" \
                        "  file1\n")
    tree.tree_path("dir1/file3").should eq([0, 1])
    project.remove_path(Path.new("/fake/dir1/dir2/dir3/file2")).should eq(true)
    project.remove_path(Path.new("/fake/dir1/dir2/dir3/file2")).should eq(false)

    tree.to_s.should eq("<root>\n" \
                        "  dir1\n" \
                        "    file3\n" \
                        "  file1\n")

    tree.tree_path("dir1/dir2/dir3/file2").should eq(nil)
    tree.tree_path("dir1/dir2/dir3").should eq(nil)
    tree.tree_path("dir1/dir2").should eq(nil)
    tree.tree_path("dir1/file3").should eq([0, 0])
    tree.model.value(tree.tree_path("dir1/file3").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("file3")
  end

  it "can have files removed (2)" do
    project = FakeProject.new(%w(file1 file2 dir1/file3))
    tree = ProjectTree.new(project)

    tree.to_s.should eq("<root>\n" \
                        "  dir1\n" \
                        "    file3\n" \
                        "  file1\n" \
                        "  file2\n")

    project.remove_path(Path.new("file2")).should eq(true)

    tree.to_s.should eq("<root>\n" \
                        "  dir1\n" \
                        "    file3\n" \
                        "  file1\n")

    tree.model.value(tree.tree_path("/fake/dir1").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("dir1")
    tree.file_path({0}).should eq("/fake/dir1")

    tree.model.value(tree.tree_path("dir1/file3").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("file3")
    tree.file_path({0, 0}).should eq("/fake/dir1/file3")

    tree.model.value(tree.tree_path("file1").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("file1")
    tree.file_path({1}).should eq("/fake/file1")
  end

  it "can have files removed (3)" do
    project = FakeProject.new(%w(file1 dir/file2 dir/file3))
    tree = ProjectTree.new(project)

    tree.to_s.should eq("<root>\n" \
                        "  dir\n" \
                        "    file2\n" \
                        "    file3\n" \
                        "  file1\n")
    project.remove_path(Path.new("dir/file3")).should eq(true)
    tree.to_s.should eq("<root>\n" \
                        "  dir\n" \
                        "    file2\n" \
                        "  file1\n")
    tree.model.value(tree.tree_path("dir/file2").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("file2")
    tree.file_path({0, 0}).should eq("/fake/dir/file2")

    tree.model.value(tree.tree_path("file1").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("file1")
    tree.file_path({1}).should eq("/fake/file1")
  end

  # TODO: Rename operatiosn are beign implemented as removal/creation, this is bad, because means that we re-create a lot
  # of itens in a GTK tree when just a string rename was needed... however it's simpler to code :-)
  #
  # These tests will be commented while I not spend time doing a real rename action.
  #   it "can rename directories" do
  #     project = FakeProject.new(%w(root/A/file1 root/B/B/file2 root/C/file3 root/file4))
  #     tree = ProjectTree.new(project)
  #
  #     tree.to_s.should eq("<root>\n" \
  #                         "  root\n" \
  #                         "    A\n" \
  #                         "      file1\n" \
  #                         "    B\n" \
  #                         "      B\n" \
  #                         "        file2\n" \
  #                         "    C\n" \
  #                         "      file3\n" \
  #                         "    file4\n")
  #     project.rename_path(Path.new("/fake/root/C/"), Path.new("/fake/root/AA"))
  #     tree.to_s.should eq("<root>\n" \
  #                         "  root\n" \
  #                         "    A\n" \
  #                         "      file1\n" \
  #                         "    AA\n" \
  #                         "      file3\n" \
  #                         "    B\n" \
  #                         "      B\n" \
  #                         "        file2\n" \
  #                         "    file4\n")
  #     tree.model.value(tree.tree_path("root/A/file1").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("file1")
  #     tree.file_path({0, 0, 0}).should eq("/fake/root/A/file1")
  #
  #     tree.model.value(tree.tree_path("root/AA/file3").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("file3")
  #     tree.file_path({0, 1, 0}).should eq("/fake/root/AA/file3")
  #
  #     tree.model.value(tree.tree_path("root/B/B/file2").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("file2")
  #     tree.file_path({0, 2, 0, 0}).should eq("/fake/root/B/B/file2")
  #   end
  #
  #   it "can rename directories (2)" do
  #     project = FakeProject.new(%w(aaa/file1 bbb/file2 ccc/file3))
  #     tree = ProjectTree.new(project)
  #     project.rename_path(Path.new("/fake/aaa/"), Path.new("/fake/zzz"))
  #     tree.to_s.should eq("<root>\n" \
  #                         "  bbb\n" \
  #                         "    file2\n" \
  #                         "  ccc\n" \
  #                         "    file3\n" \
  #                         "  zzz\n" \
  #                         "    file1\n")
  #     tree.model.value(tree.tree_path("bbb/file2").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("file2")
  #     tree.file_path({0, 0}).should eq("/fake/bbb/file2")
  #
  #     tree.model.value(tree.tree_path("ccc/file3").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("file3")
  #     tree.file_path({1, 0}).should eq("/fake/ccc/file3")
  #
  #     tree.model.value(tree.tree_path("zzz/file1").not_nil!, ProjectTree::PROJECT_TREE_LABEL).string.should eq("file1")
  #     tree.file_path({2, 0}).should eq("/fake/zzz/file1")
  #   end
end
