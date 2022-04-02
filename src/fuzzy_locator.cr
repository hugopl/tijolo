require "./locator_provider"

abstract class FuzzyLocator < LocatorProvider
  # Number of file locator matches to show in the UI
  MAX_LOCATOR_ITEMS = 25

  @last_results = [] of Fzy::Match
  @search_text = ""

  # A message to show if haystack is empty.
  getter placeholder : String
  getter haystack : Fzy::PreparedHaystack?

  def initialize(@placeholder : String)
    super()
    install_placeholder
  end

  def placeholder=(@placeholder)
    install_placeholder
  end

  private def install_placeholder
    return if @placeholder.blank?

    @model.clear
    iter = @model.append
    @model.set(iter, {LABEL_COLUMN}, {@placeholder})
    # notify_locator_provider_model_changed(self)
  end

  def results_size : Int32
    haystack = @haystack
    if !haystack.nil? && haystack.empty? && !@placeholder.blank?
      1
    else
      @last_results.size
    end
  end

  def activate(locator : Locator, index : Int32) : Bool
    result = @last_results[index]?
    return false if result.nil?

    activate(locator, result)
    true
  end

  abstract def activate(locator : Locator, match : Fzy::Match)

  def haystack=(@haystack : Fzy::PreparedHaystack?)
    install_placeholder if @haystack.nil?
    fuzzy_search(@search_text)
  end

  def search_changed(search_text : String) : Nil
    @search_text = search_text
    fuzzy_search(search_text)
  end

  private def fuzzy_search(text)
    haystack = @haystack
    return if haystack.nil? || haystack.empty?

    @model.clear
    @last_results = Fzy.search(text, haystack)
    @last_results.delete_at(MAX_LOCATOR_ITEMS..-1) if @last_results.size > MAX_LOCATOR_ITEMS

    @last_results.each do |match|
      iter = @model.append
      @model.set(iter, {LABEL_COLUMN}, {markup(match)})
    end
    # notify_locator_provider_model_changed(self)
  end

  def markup(match)
    value = match.value
    str_size = value.bytesize + match.positions.size * 7 # 7 is the size of the extra markup
    pos_iter = match.positions.each
    next_pos = pos_iter.next
    String.build(str_size) do |str|
      value.each_char_with_index do |char, i|
        if i == next_pos
          str << %q(<span weight="heavy">)
          str << char
          str << "</span>"
          next_pos = pos_iter.next
        else
          str << char
        end
      end
    end
  end
end
