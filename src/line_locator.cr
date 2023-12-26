class LineLocator < LocatorProvider
  @line : Int32 = 0
  @col : Int32 = 0
  @text : String = ""

  DEFAULT_TEXT = "Type the line number and column separated by anything"

  def activate(locator : Locator, pos : UInt32) : Bool
    return false if @line <= 0
    line = @line - 1
    col = @col - 1
    col = 0 if col < 0

    # FIXME: Change this to a tuple when GICrystal support tuples in GVariants
    locator.activate_action("win.goto_line", "#{line}:#{col}")
    true
  end

  def shortcut : Char
    'l'
  end

  def description : String
    "Goto line/column of current document."
  end

  def search_changed(search_text : String) : Int32
    match = search_text.match(/[^\d]*(\d+)(?:[^\d]+(\d+))?/)
    if match.nil?
      @col = @line = -1
      @text = DEFAULT_TEXT
    else
      @line = match[1].to_i
      @col = match[2]?.try(&.to_i) || -1
      @text = String.build do |str|
        str << "Go to line #{@line}"
        str << ", column #{@col}" if @col >= 0
      end
    end
    1
  end

  def bind(item : LocatorItem, pos : Int32) : Nil
    item.name = @text
    item.description = ""
    item.icon_name = "edit-find-symbolic"
  end
end
