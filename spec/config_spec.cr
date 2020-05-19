require "./spec_helper"

describe Config do
  it "remove non existing projects form config" do
    config = Config.load_yaml_contents("---\n" \
                                       "projects:\n" \
                                       "- path: #{__DIR__}\n" \
                                       "  last_used: 2020-05-09 17:12:22.193120000\n" \
                                       "- path: /i/do/not/exist\n")
    config.projects.size.should eq(1)
    config.projects.first.path.should eq(__DIR__)
    config.projects.first.path.should_not eq(nil)
  end

  it "sort projects by last used time" do
    config = Config.load_yaml_contents("---\n" \
                                       "projects:\n" \
                                       "- path: #{__DIR__}/spec_helper.cr\n" \
                                       "  last_used: 2020-05-09 17:12:22.193120000\n" \
                                       "- path: #{__DIR__}/project_spec.cr\n" \
                                       "- path: #{__FILE__}\n" \
                                       "  last_used: 2021-05-09 17:12:22.193120000\n")
    config.projects.size.should eq(3)
    config.projects[0].path.should eq(__FILE__)
    config.projects[1].path.should eq("#{__DIR__}/spec_helper.cr")
    config.projects[2].path.should eq("#{__DIR__}/project_spec.cr")
  end
end
