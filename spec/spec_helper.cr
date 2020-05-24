require "spec"
require "gobject/gtk"

require "../src/config"
require "../src/error"
require "../src/gtk"
require "../src/helper"
require "../src/project"
require "../src/project_tree"

class FakeProject < Project
  def initialize(files)
    @files = Set.new(files.map { |f| Path.new(f) })
    @root = Path.new("/fake")
  end
end
