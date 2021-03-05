module Editor
  alias TextRange = {TextIter, TextIter}

  class TextEditor
    enum BackgroundPattern
      None
      Grid
    end

    enum WrapMode
      None
      Char
      Word
      WordChar
    end
  end

  class TextBuffer
    def search_context : SearchContext
      @search_context ||= Editor::SearchContext.new(self)
    end
  end
end

require "./text_editor_gsv"
