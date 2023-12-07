require "./fuzzy_locator"
require "./project"

class FileLocator < FuzzyLocator
  def initialize(@project : Project)
    @project.files_changed_signal.connect do
      update_haystack(Fzy::PreparedHaystack.new(@project.files.map(&.to_s)))
    end
  end

  def shortcut : Char
    'f' # not used, this is the default locator provider.
  end

  def description : String
    "" # not used, this is the default locator provider.
  end

  def activate(locator : Locator, match : Fzy::Match) : Bool
    file = match.value
    locator.activate_action("win.open_file", @project.root.join(file).to_s)
    true
  end

  def bind(item : LocatorItem, pos : Int32) : Nil
    match = self.match(pos)
    item.name = match.value
    item.description = "Open file"
    item.icon_name = "text-x-generic-symbolic"
  end
end
