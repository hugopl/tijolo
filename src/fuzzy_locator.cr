require "./locator_provider"

abstract class FuzzyLocator < LocatorProvider
  @last_results = [] of Fzy::Match

  getter haystack : Fzy::PreparedHaystack?

  def match(pos : Int32) : Fzy::Match
    @last_results[pos]
  end

  def activate(locator : Locator, index : UInt32) : Bool
    result = @last_results[index]?
    return false if result.nil?

    activate(locator, result)
  end

  abstract def activate(locator : Locator, match : Fzy::Match) : Bool

  def update_haystack(@haystack : Fzy::PreparedHaystack?)
  end

  def search_changed(search_text : String) : Result
    haystack = @haystack
    return 0 if haystack.nil? || haystack.empty?

    @last_results = Fzy.search(search_text, haystack)
    @last_results.size
  end
end
