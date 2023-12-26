abstract class LocatorProvider
  # shortcut letter used to activate locator.
  abstract def shortcut : Char
  # Locator provider description.
  abstract def description : String

  # Method called everytime this locator is active and the search text changes.
  # Must return the number of items found.
  #
  # FIXME: This must be assync in the future.
  abstract def search_changed(search_text : String) : Int32
  # Bind locator data to a Locatoritem that will be used as backend on ListView.
  abstract def bind(item : LocatorItem, pos : Int32) : Nil
  # Method called when a locator item is activated.
  abstract def activate(locator : Locator, pos : UInt32) : Bool

  def remove_shortcut_from_input(text : String)
    text[2..-1]
  end
end
