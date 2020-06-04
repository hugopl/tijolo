require "spec"
require "gobject/gtk"
require_gobject "GtkSource"

require "../src/config"
require "../src/error"
require "../src/gtk"
require "../src/helper"
require "../src/locator"
require "../src/project"
require "../src/project_tree"
require "../src/text_view"

class FakeProject < Project
  def initialize(files)
    @files = Set.new(files.map { |f| Path.new(f) })
    @root = Path.new("/fake")
  end
end

class Config
  @@load_yaml : Config?

  def self.load_yaml
    @@load_yaml ||= Config.new.tap do |config|
      config.style_scheme = "solarized-light"
    end
  end
end

LibGtk.init(pointerof(ARGC_UNSAFE), pointerof(ARGV_UNSAFE))
GtkSource.init
GtkSource::LanguageManager.default.search_path = GtkSource::LanguageManager.default.search_path.to_a.unshift("#{__DIR__}/../data")
