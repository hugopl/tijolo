require "./locator_provider"

abstract class FuzzyLocator < LocatorProvider
  # Number of file locator matches to show in the UI
  MAX_LOCATOR_ITEMS = 25

  @last_results = [] of Fzy::Match
  @search_text = ""

  # A message to show if haystack is empty.
  getter? place_holder : String
  getter haystack = Fzy::PreparedHaystack.new(Array(String).new(0))

  def initialize(@place_holder : String)
    super()
    self.place_holder = @place_holder
  end

  def place_holder=(@place_holder)
    @model.clear
    iter = Gtk::TreeIter.new
    @model.append(iter)
    @model.set(iter, {LABEL_COLUMN}, {@place_holder})
    notify_locator_provider_model_changed(self)
  end

  def results_size : Int32
    if @haystack.haystack.empty? && @place_holder
      1
    else
      @last_results.size
    end
  end

  def activate(locator : Locator, index : Int32)
    return if index >= @last_results.size

    activate(locator, @last_results[index])
  end

  abstract def activate(locator : Locator, match : Fzy::Match)

  def haystack=(@haystack : Fzy::PreparedHaystack)
    fuzzy_search(@search_text)
  end

  def search_changed(search_text : String) : Nil
    @search_text = search_text
    return if @haystack.haystack.empty?

    fuzzy_search(search_text)
  end

  private def fuzzy_search(text)
    @model.clear
    @last_results = Fzy.search(text, @haystack)
    @last_results.delete_at(MAX_LOCATOR_ITEMS..-1) if @last_results.size > MAX_LOCATOR_ITEMS

    iter = Gtk::TreeIter.new
    @last_results.each do |match|
      @model.append(iter)
      @model.set(iter, {LABEL_COLUMN}, {markup(match)})
    end
    notify_locator_provider_model_changed(self)
  end

  def markup(match)
    value = match.value
    str_size = value.bytesize + match.positions.size * 7 # 7 is the size of the extra markup
    pos_iter = match.positions.each
    next_pos = pos_iter.next
    String.build(str_size) do |str|
      value.each_char_with_index do |char, i|
        if i == next_pos
          str << "<b>#{char}</b>"
          next_pos = pos_iter.next
        else
          str << char
        end
      end
    end
  end
end
