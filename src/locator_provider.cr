abstract class LocatorProvider
  alias Result = Int32 | Channel(Int32)

  # shortcut letter used to activate locator.
  abstract def shortcut : Char
  # Locator provider description.
  abstract def description : String

  # Method called everytime this locator is active and the search text changes.
  #
  # Assync providers must return a Channel(Int32), sync providers a Int32.
  # Int32 values means the number of results available to show.
  #
  # For assync providers, send 0 (zero) as last value to inform there's no more data.
  #
  # See `#bind`.
  abstract def search_changed(search_text : String) : Result
  # Bind locator data to a Locatoritem that will be used as backend on ListView.
  abstract def bind(item : LocatorItem, pos : Int32) : Nil
  # Method called when a locator item is activated.
  abstract def activate(locator : Locator, pos : UInt32) : Bool

  def remove_shortcut_from_input(text : String)
    text[2..-1]
  end

  def project_load_finished(project : Project)
  end

  def unselected
  end

  def selected
  end
end
