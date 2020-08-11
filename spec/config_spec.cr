require "./spec_helper"

describe Config do
  it "autocomplete config file missing keys with defaults" do
    default = Config.default
    config = Config.new("")
    config.ignored_dirs.should eq(default.ignored_dirs)
    config.lazy_start_language_servers?.should eq(default.lazy_start_language_servers?)
  end
end
