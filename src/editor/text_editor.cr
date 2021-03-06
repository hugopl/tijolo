class Editor::TextEditor
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

require "./text_editor_gsv"
