require "./fuzzy_locator"

class DocumentSymbolLocator < FuzzyLocator
  @symbols : Array(LSP::Protocol::SymbolInformation)?

  def initialize
    super
  end

  def shortcut : Char
    '.'
  end

  def selected(current_view : View?)
    super
    return if current_view.nil? || current_view.file_path.nil?

    current_view.language.document_symbols(current_view.file_path.not_nil!) do |symbols|
      @symbols = symbols
      @project_haystack = Fzy::PreparedHaystack.new(symbols.map(&.name))
    end
  rescue e : AppError
    self.error_message = e.message || "Unknow error"
  end

  def unselected
    @symbols = nil
  end

  def activate(locator : Locator, match : Fzy::Match)
    symbols = @symbols
    return if symbols.nil?

    pos = symbols[match.index].location.range.start
    line = pos.line
    col = pos.character
    locator.notify_locator_goto_line_col(line, col)
  end
end
