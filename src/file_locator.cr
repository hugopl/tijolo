require "./fuzzy_locator"
require "./project"

class FileLocator < FuzzyLocator
  include ProjectListener

  def initialize(@project : Project)
    super("Waiting project load to finish...")
    project_load_finished if @project.load_finished?
    @project.add_project_listener(self)
  end

  def project_file_added(_path : Path)
    project_load_finished # Lazy way... just reload all the things
  end

  def project_file_removed(_path : Path)
    project_load_finished # Lazy way... just reload all the things
  end

  def project_folder_renamed(_old_path : Path, _new_path : Path)
    project_load_finished # Lazy way... just reload all the things
  end

  def project_load_finished
    self.haystack = Fzy::PreparedHaystack.new(@project.files.map(&.to_s))
  end

  def shortcut : Char
    'f' # not used, this is the default locator provider.
  end

  def description : String
    ""  # not used, this is the default locator provider.
  end

  def activate(locator : Locator, match : Fzy::Match)
    file = match.value
    locator.notify_locator_open_file(@project.root.join(file).to_s)
  end
end
