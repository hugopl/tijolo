require "./locator_provider"

abstract class FuzzyLocator < LocatorProvider
  @last_results = [] of Fzy::Match
  @haystack_data : Array(String)?
  @haystack : Fzy::PreparedHaystack?
  @need_prepare_haystack = true

  def match(pos : Int32) : Fzy::Match
    @last_results[pos]
  end

  def activate(locator : Locator, index : UInt32) : Bool
    result = @last_results[index]?
    return false if result.nil?

    activate(locator, result)
  end

  abstract def activate(locator : Locator, match : Fzy::Match) : Bool

  def update_haystack(@haystack_data)
    @need_prepare_haystack = true
  end

  def search_changed(view : View?, search_text : String) : Result
    haystack_data = @haystack_data
    if @need_prepare_haystack && haystack_data
      @haystack = Fzy::PreparedHaystack.new(haystack_data)
      @need_prepare_haystack = false
    end

    haystack = @haystack
    return 0 if haystack.nil? || haystack.empty?

    @last_results = Fzy.search(search_text, haystack)
    @last_results.size
  end
end
