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

class TestProjectListener
  include ProjectListener

  property files_added = [] of String
  property files_removed = [] of String
  property dirs_added = [] of String
  property dirs_removed = [] of String
  property changed_count = 0

  def reset!
    @files_added.clear
    @files_removed.clear
    @changed_count = 0
  end

  def project_file_added(path : Path)
    @files_added << path.to_s
  end

  def project_file_removed(path : Path)
    @files_removed << path.to_s
  end

  def project_dir_added(path : Path)
    @dirs_added << path.to_s
  end

  def project_dir_removed(path : Path)
    @dirs_removed << path.to_s
  end

  def project_files_changed
    @changed_count += 1
  end
end

class FakeProject < Project
  property listener

  def initialize(files)
    @files = Set.new(files.map { |f| Path.new(f) })
    @files.each do |file|
      path = Path.new(file.dirname)
      while path.to_s != "."
        @directories << path
        path = Path.new(path.dirname)
      end
    end
    @root = Path.new("/fake")
    @ignored_dirs = [] of Path
    @load_finished = true
    @listener = TestProjectListener.new
    add_project_listener(@listener)
  end

  def files_str
    files.map(&.to_s)
  end
end

def load_project(root) : Project
  project = Project.new(root)
  project.scan_files
  while !project.load_finished?
    Fiber.yield
  end
  project
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
