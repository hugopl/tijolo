require "./locator_provider"

abstract class FuzzyLocator < LocatorProvider
  @last_results = [] of Fzy::Match
  @search_text = ""

  getter haystack : Fzy::PreparedHaystack?

  def initialize
    super()
  end

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
    fuzzy_search(@search_text)
  end

  def search_changed(search_text : String) : Int32
    @search_text = search_text
    fuzzy_search(search_text)
  end

  private def fuzzy_search(text) : Int32
    haystack = @haystack
    return 0 if haystack.nil? || haystack.empty?

    @last_results = Fzy.search(text, haystack)
    @last_results.size
  end
end
