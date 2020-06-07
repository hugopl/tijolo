require "./spec_helper"

describe Project do
  it "set the project root to the directory with a .git" do
    project = Project.new("./spec")
    project.root.to_s.should eq(Dir.current)
  end

  it "always stores relative paths on files attribute" do
    project = Project.new(".")

    project.files.should_not contain(Path.new("#{__DIR__}/hell_yeahh"))
    project.add_file(Path.new("#{__DIR__}/hell_yeahh"))

    str_files = project.files.map(&.to_s)
    str_files.should_not contain("#{__DIR__}/hell_yeahh")
    str_files.should contain("spec/hell_yeahh")
  end

  it "does not accept repeated files" do
    project = Project.new(".")

    me = Path.new(__FILE__).relative_to(project.root)
    project.add_file(me)
    project.files.select { |path| path == me }.size.should eq(1)
  end

  it "accept project root with/without ending slash" do
    project = Project.new(".")
    str_files = project.files.map(&.to_s)
    str_files.should contain("spec/project_spec.cr")

    project = Project.new("./")
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
end
