abstract class CodeHighlighter
  abstract def set_line_range(start_line : Int32, end_line : Int32)
  abstract def exec : Nil
  abstract def skip_attrs_for_next_line : Nil
  abstract def pango_attrs_for_next_line : Pango::AttrList?
end
