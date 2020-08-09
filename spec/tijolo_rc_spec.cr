require "./spec_helper"

describe TijoloRC do
  it "remove non existing projects form config" do
    data = <<-EOS
    {
      "projects": [
        {
          "path": "#{__DIR__}",
          "last_used": "2020-08-09T02:23:36Z"
        },
        {
          "path": "/i/do/not/exist"
        }
      ]
    }
    EOS
    rc = TijoloRC.load_contents(data)
    rc.projects.size.should eq(1)
    rc.projects.first.path.to_s.should eq(__DIR__)
    rc.projects.first.path.should_not eq(nil)
  end

  it "sort projects by last used time" do
    data = <<-EOS
    {
      "projects": [
        {
          "path": "#{__DIR__}/spec_helper.cr",
          "last_used": "2020-05-09T14:12:22Z"
        },
        {
          "path": "#{__DIR__}/project_spec.cr"
        },
        {
          "path": "#{__FILE__}",
          "last_used": "2021-05-09T14:12:22Z"
        }
      ]
    }
    EOS
    rc = TijoloRC.load_contents(data)
    rc.projects.size.should eq(3)
    rc.projects[0].path.to_s.should eq(__FILE__)
    rc.projects[1].path.to_s.should eq("#{__DIR__}/spec_helper.cr")
    rc.projects[2].path.to_s.should eq("#{__DIR__}/project_spec.cr")
  end

  it "store only X files in recent files list" do
    rc = TijoloRC.load_contents(%q({"projects": []}))
    TijoloRC::RECENT_FILES_LIMIT.times do |i|
      rc.push_recent_file(Path.new(i.to_s))
    end
    rc.push_recent_file(Path.new("most recent"))
    rc.recent_files.size.should eq(TijoloRC::RECENT_FILES_LIMIT)
    rc.recent_files.first.should eq("most recent")
    rc.recent_files.last.should eq("1")
  end

  it "does not allow duplicates in recent files list" do
    rc = TijoloRC.load_contents(%q({"projects": []}))
    rc.push_recent_file(Path.new("hey"))
    rc.push_recent_file(Path.new("hey"))
    rc.recent_files.size.should eq(1)
  end
end
