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
    @ignored_dirs = [] of Path
    @load_finished = true
  end
end

class Config
  @@load_yaml : Config?

  def self.load_yaml
    @@load_yaml ||= Config.new
  end
end

class TestLocatorListener
  include LocatorListener

  property files = [] of String
  property line_col = {-1, -1}

  def locator_open_file(file : String)
    @files << file
  end

  def locator_goto_line_col(line : Int32, column : Int32)
    @line_col = {line, column}
  end
end

# Just to make things accessible for testing
class TestLocator < Locator
  getter locator_entry
  getter locator_results

  def activated(widget : Gtk::TreeView, tree_path : Gtk::TreePath, _column : Gtk::TreeViewColumn)
    super
  end
end

LibGtk.init(pointerof(ARGC_UNSAFE), pointerof(ARGV_UNSAFE))
GtkSource.init
GtkSource::LanguageManager.default.search_path =
  GtkSource::LanguageManager.default.search_path.to_a.unshift("#{__DIR__}/../share/tijolo/language-specs")
