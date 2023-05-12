require "tree_sitter"
require "./code_theme"

class CodeHighlighter
  @buffer : CodeBuffer
  @highlighter : TreeSitter::Highlighter?
  @theme : CodeTheme

  def initialize(@buffer : CodeBuffer)
    @theme = CodeTheme.new
    parser = @buffer.parser
    if parser
      @highlighter = TreeSitter::Highlighter.new(parser.language, @buffer.root_node.not_nil!)
    end
  end

  def set_line_range(start_line : Int32, end_line : Int32)
    @highlighter.try(&.set_line_range(start_line, end_line))
  end

  def pango_attrs_for_next_line : Pango::AttrList?
    highlighter = @highlighter
    return if highlighter.nil?

    captures = highlighter.highlight_next_line
    return if captures.nil?

    # Pango::AttrList is created string due to https://github.com/hugopl/pango.cr/issues/1
    io = IO::Memory.new
    captures.each do |capture|
      @theme.style_to_s(io, capture.rule, capture.node.start_point.column, capture.node.end_point.column)
    end
    Pango::AttrList.from_string(io.to_s)
  end
end
