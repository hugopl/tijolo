require "./locator_provider"

abstract class FuzzyLocator < LocatorProvider
  # Number of file locator matches to show in the UI
  MAX_LOCATOR_ITEMS = 25

  @last_results = [] of Fzy::Match
  getter? error_message : String?
  property project_haystack : Fzy::PreparedHaystack

  def initialize
    super
    @project_haystack = Fzy::PreparedHaystack.new(Array(String).new(0))
  end

  def initialize(@project_haystack)
    super()
  end

  def selected(current_view : View?)
    super
    @error_message = nil
  end

  def results_size : Int32
    error_message? ? 1 : @last_results.size
  end

  def activate(locator : Locator, index : Int32)
    return if index >= @last_results.size || error_message?

    activate(locator, @last_results[index])
  end

  abstract def activate(locator : Locator, match : Fzy::Match)

  def error_message=(message : String)
    @error_message = message
    @model.clear
    iter = Gtk::TreeIter.new
    @model.append(iter)
    @model.set(iter, {LABEL_COLUMN}, {message})
  end

  def search_changed(search_text : String) : Nil
    return if @project_haystack.haystack.empty? || error_message?

    start_time = Time.monotonic
    @model.clear

    @last_results = Fzy.search(search_text, @project_haystack)
    @last_results.delete_at(MAX_LOCATOR_ITEMS..-1) if @last_results.size > MAX_LOCATOR_ITEMS

    iter = Gtk::TreeIter.new
    @last_results.each do |match|
      @model.append(iter)
      @model.set(iter, {LABEL_COLUMN}, {markup(match)})
    end

    end_time = Time.monotonic
    total = end_time - start_time
    Log.debug { "Locator found #{@last_results.size} in #{total}" }
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
