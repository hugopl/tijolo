require "./fuzzy_locator"

struct SymbolCache
  property version : Int32
  property symbols : Array(LSP::SymbolInformation)
  property haystack : Fzy::PreparedHaystack

  def initialize(@version, @symbols, @haystack)
  end
end

class DocumentSymbolLocator < FuzzyLocator
  @symbols = Hash(TextView, SymbolCache).new
  @current_view : TextView?

  PLACEHOLDER = "Waiting for language server..."

  def initialize
    super(PLACEHOLDER)
  end

  def shortcut : Char
    '.'
  end

  def description : String
    "Symbols in Current Document"
  end

  def selected(current_view : View?)
    super
    @current_view = selected_view = validate_view(current_view)
    if selected_view.nil?
      self.haystack = nil
      return
    end

    cache = symbol_cache
    if cache
      self.haystack = cache.haystack
      return
    end

    self.haystack = nil
    selected_view.language.document_symbols(selected_view.file_path.not_nil!) do |symbols|
      view = @current_view
      if !view.nil? && view == selected_view && view.version == selected_view.not_nil!.version
        haystack = Fzy::PreparedHaystack.new(symbols.map(&.name))
        @symbols[view] = SymbolCache.new(view.version, symbols, haystack)
        self.haystack = haystack
      end
    end
  rescue e : AppError
    self.placeholder = e.message || "Unknow error"
  end

  private def validate_view(view : View?) : TextView?
    if view.nil?
      self.placeholder = "Open a file to use this locator"
      return
    elsif !view.is_a?(TextView)
      self.placeholder = "Only text files have symbols"
      return
    elsif view.file_path.nil?
      self.placeholder = "Save this file first to use this locator"
      return
    end
    self.placeholder = PLACEHOLDER
    view
  end

  def activate(locator : Locator, match : Fzy::Match)
    cache = symbol_cache
    return if cache.nil?

    pos = cache.symbols[match.index].location.range.start
    locator.notify_locator_goto_line_col(pos.line, pos.character)
  end

  private def symbol_cache : SymbolCache?
    current_view = @current_view
    return if current_view.nil?

    cache = @symbols[current_view]?
    return if cache.nil?
    return cache if cache.version == current_view.version

    @symbols.delete(current_view)
    nil
  end
end
