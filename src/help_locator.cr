class HelpLocator < LocatorProvider
  @providers_shortcuts = Array(String).new

  def initialize
    super

    @model.append({LocatorProvider::LABEL_COLUMN}, {"Type a file name or locate other things with shortcuts bellow"})
    @providers_shortcuts << ""
  end

  def add(locator : LocatorProvider)
    help_text = "#{locator.shortcut}    #{locator.description}"
    @model.append({LocatorProvider::LABEL_COLUMN}, {help_text})
    @providers_shortcuts << "#{locator.shortcut} "
  end

  def results_size : Int32
    @providers_shortcuts.size
  end

  def shortcut : Char
    '?' # Not used, this locator is used when there's no input
  end

  def description : String
    "" # Not used
  end

  def activate(locator : Locator, index : Int32) : Bool
    if index < @providers_shortcuts.size
      shortcut = @providers_shortcuts[index]
      locator.text = shortcut
    end
    false
  end

  def search_changed(search_text : String) : Nil
  end
end
