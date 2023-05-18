require "./code_highlighter"

class CodeNoHighlighter < CodeHighlighter
  def set_line_range(start_line : Int32, end_line : Int32)
  end

  def exec : Nil
  end

  def skip_attrs_for_next_line : Nil
  end

  def pango_attrs_for_next_line : Pango::AttrList?
  end
end
