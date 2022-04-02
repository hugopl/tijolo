require "./fuzzy_locator"
require "./project"

class FileLocator < FuzzyLocator
  def initialize(@project : Project)
    place_holder = @project.valid? ? "Waiting project load to finish..." : "There's no project open."
    super(place_holder)
    # @project.add_project_listener(self)
  end

  def project_files_changed
    project_load_finished
  end

  def project_load_finished
    self.haystack = Fzy::PreparedHaystack.new(@project.files.map(&.to_s))
  end

  def shortcut : Char
    'f' # not used, this is the default locator provider.
  end

  def description : String
    "" # not used, this is the default locator provider.
  end

  def activate(locator : Locator, match : Fzy::Match)
    file = match.value
    locator.open_file_signal.emit(@project.root.join(file).to_s, locator.split_next?)
  end
end
