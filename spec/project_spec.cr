require "file_utils"

require "./spec_helper"

describe Project do
  it "set the project root to the directory with a .git" do
    project = load_project("./spec")
    project.root.to_s.should eq(Dir.current)
  end

  it "always stores file paths relative to project root" do
    project = load_project(".")

    project.files.should_not contain(Path.new("#{__DIR__}/hell_yeahh"))
    project.add_path(Path.new("#{__DIR__}/hell_yeahh"))

    str_files = project.files.map(&.to_s)
    str_files.should_not contain("#{__DIR__}/hell_yeahh")
    str_files.should contain("spec/hell_yeahh")
  end

  it "does not accept repeated files" do
    project = Project.new(".")

    me = Path.new(__FILE__).relative_to(project.root)
    project.add_path(me)
    project.files.count { |path| path == me }.should eq(1)
  end

  it "accept project root with/without ending slash" do
    project = load_project(".")
    str_files = project.files.map(&.to_s)
    str_files.should contain("spec/project_spec.cr")

    project = load_project("./")
    str_files = project.files.map(&.to_s)
    str_files.should contain("spec/project_spec.cr")
  end

  it "can iterate over project directories" do
    project = FakeProject.new(%w(file1 file2 dir1/dir2/dir3/file3 dir1/dir4/file4))
    dirs = [] of String
    project.each_directory do |dir|
      dirs << dir.to_s
    end
    dirs.sort.should eq(%w(/fake /fake/dir1 /fake/dir1/dir2 /fake/dir1/dir2/dir3 /fake/dir1/dir4))
  end

  it "know if a file is under the project" do
    project = FakeProject.new(%w(file1 dir/file2))
    project.under_project?(Path.new("whatever")).should eq(true)
    project.under_project?(Path.new("../fake/whatever")).should eq(true)
    project.under_project?(Path.new("../whatever")).should eq(false)
    project.under_project?(Path.new("/fake/whatever")).should eq(true)
    project.under_project?(Path.new("/fake")).should eq(true)
    project.under_project?(Path.new("/hey")).should eq(false)
  end

  context "when adding paths" do
    it "creating missing directories in path" do
      project = FakeProject.new(%w())
      project.add_path(Path.new("foo/bar/pow")).should eq(true)
      project.files_str.should eq(%w(foo/bar/pow))
      project.listener.files_added.should eq(%w(foo/bar/pow))
      project.listener.dirs_added.should eq(%w(foo/bar foo))
      project.listener.changed_count.should eq(1)
    end

    it "scan for directories and files if new path is a directory" do
      current_dir = FileUtils.pwd
      proj_root = Path.new(Dir.tempdir, "proj_#{Process.pid}")
      Dir.mkdir(proj_root)
      Dir.cd(proj_root) { `git init --initial-branch=main .` }
      project = Project.new(proj_root.to_s)
      Dir.mkdir_p(proj_root.join("dir", "subdir"))
      File.write(proj_root.join("dir", "subdir", "file1"), "")
      File.write(proj_root.join("dir", "subdir", "file2"), "")

      # No project monitoring running, so project still empty
      project.files.map(&.to_s).should eq(%w())

      listener = TestProjectListener.new
      project.add_project_listener(listener)

      project.add_path(Path.new("dir"))
      project.files.map(&.to_s).sort.should eq(%w(dir/subdir/file1 dir/subdir/file2))

      listener.dirs_added.should eq(%w(dir dir/subdir))
      listener.changed_count.should eq(1)

      # just to be sure the dir was really there
      project.remove_path(Path.new("dir")).should eq(true)
      listener.dirs_removed.should eq(%w(dir/subdir dir))
      project.files.map(&.to_s).should eq(%w())
      listener.changed_count.should eq(2)
    ensure
      Dir.cd(current_dir.not_nil!) # Project object changes the current directory
      FileUtils.rm_rf(proj_root.to_s) if proj_root
    end
  end

  context "when removing paths" do
    it "can remove a file" do
      project = FakeProject.new(%w(file1 dir/file2))
      project.remove_path(Path.new("dir/file2"))
      project.files_str.should eq(%w(file1))
      project.listener.files_removed.should eq(%w(dir/file2))
      project.listener.dirs_removed.should eq(%w())
      project.listener.changed_count.should eq(1)

      project.listener.reset!
      project.remove_path(Path.new("file1"))
      project.files_str.should eq(%w())
      project.listener.files_removed.should eq %w(file1)
      project.listener.dirs_removed.should eq(%w())
      project.listener.changed_count.should eq(1)
    end

    it "can remove a file with a dir with the same name" do
      project = FakeProject.new(%w(file1 dir dir/file2))
      project.remove_path(Path.new("dir"))
      project.files_str.should eq(%w(file1 dir/file2))
      project.listener.files_removed.should eq %w(dir)
      project.listener.dirs_removed.should eq(%w())
      project.listener.changed_count.should eq(1)
    end

    it "can recursive remove directories" do
      project = FakeProject.new(%w(file1 dir/subdir/file dir/file dir/file2))
      project.remove_path(Path.new("dir"))
      project.files_str.should eq(%w(file1))
      project.listener.files_removed.sort.should eq %w(dir/subdir/file dir/file2 dir/file).sort
      project.listener.dirs_removed.should eq(%w(dir/subdir dir))
      project.listener.changed_count.should eq(1)
    end
  end

  context "when renaming paths" do
  end
end
