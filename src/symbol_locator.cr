require "./code_model"

class SymbolLocator < FuzzyLocator
  @symbols = Array(CodeSymbol).new
  @last_resource : String?
  @symbols_mutex = Mutex.new

  def shortcut : Char
    '.'
  end

  def description : String
    "Goto methods and classes."
  end

  def activate(locator : Locator, match : Fzy::Match) : Bool
    symbol = self.symbol(match)
    return false unless symbol

    location = symbol.location
    locator.activate_action("win.goto_line", "#{location.line}:#{location.column}:#{location.source}")
    true
  end

  def search_changed(view : View?, search_text : String) : Result
    if !view.is_a?(TextView)
      return 0
    end

    lang = view.language
    return 0 if lang.none?

    resource = view.resource
    return 0 if resource.nil?

    return super(view, search_text) if resource.to_s == @last_resource

    code_model = view.code_model
    channel = Channel(Int32).new
    spawn do
      symbols = code_model.resource_symbols(resource)
      next if channel.closed? # another search took place, so bail out.

      haystack = Fzy::PreparedHaystack.new(symbols.map(&.name))
      @symbols_mutex.synchronize do
        @symbols = symbols
        @last_resource = resource.to_s
      end
      update_haystack(haystack)
      n = super(view, search_text)
      channel.send(n)
    end
    channel
  end

  def unselected
  end

  def selected
  end

  private def symbol(pos : Int) : CodeSymbol?
    @symbols_mutex.synchronize do
      fzy_match = match(pos)
      @symbols[fzy_match.index]?
    end
  end

  private def symbol(fzy_match : Fzy::Match) : CodeSymbol?
    @symbols_mutex.synchronize do
      @symbols[fzy_match.index]?
    end
  end

  def bind(item : LocatorItem, pos : Int32) : Nil
    symbol = self.symbol(pos)
    return if symbol.nil?

    item.name = symbol.name
    item.description = "#{symbol.kind} at to line #{symbol.@location.line}"
    item.icon_name = symbol.icon_name
  end
end
