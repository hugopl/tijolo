class LineLocator < LocatorProvider
  @line : Int32 = 0
  @col : Int32 = 0

  DEFAULT_TEXT = "Type the line number and column separated by \":\""

  def initialize
    super
    @model.append({LABEL_COLUMN}, {DEFAULT_TEXT})
  end

  def activate(locator, _index) : Bool
    return false if @line <= 0

    col = @col - 1
    col = 0 if col < 0
    locator.goto_line_signal.emit(@line - 1, col)
    true
  end

  def results_size : Int32
    1
  end

  def shortcut : Char
    'l'
  end

  def description : String
    "Line in Current Document"
  end

  def search_changed(search_text : String) : Nil
    line_col = search_text.split(":")
    @line = line_col[0]?.try(&.to_i?) || 0
    @col = line_col[1]?.try(&.to_i?) || 0

    text = if @line > 0 && @col > 0
             "Line #{@line}, Column #{@col}"
           elsif @line > 0
             "Line #{@line}"
           else
             DEFAULT_TEXT
           end
    @model.set(0, {LABEL_COLUMN}, {text})
  end
end
