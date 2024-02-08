class HelpLocator < LocatorProvider
  @locators = [] of LocatorProvider
  @help_message : String?

  def shortcut : Char
    ' '
  end

  def description : String
    ""
  end

  def search_changed(search_text : String) : Result
    1
  end

  def add_locator(locator : LocatorProvider)
    @locators << locator
  end

  def activate(locator : Locator, pos : UInt32) : Bool
    false
  end

  def help_message
    @help_message ||= @locators.map do |loc|
      "#{loc.shortcut} — #{loc.description}"
    end.join("\n")
  end

  def bind(item : LocatorItem, pos : Int32) : Nil
    item.name = "Available commands"
    item.description = help_message
    item.icon_name = "help-about-symbolic"
  end

  def remove_shortcut_from_input(text : String)
    text
  end
end
