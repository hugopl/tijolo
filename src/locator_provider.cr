abstract class LocatorProvider
  abstract def shortcut : Char
  abstract def description : String
  # FIXME: This must be assync in the future
  abstract def search_changed(search_text : String) : Int32
  abstract def bind(item : LocatorItem, pos : Int32) : Nil
  abstract def activate(locator : Locator, pos : UInt32) : Bool
end
