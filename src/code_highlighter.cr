require "tree_sitter"
require "./code_theme"

class CodeHighlighter
  @buffer : CodeBuffer
  @theme : CodeTheme

  def initialize(@buffer : CodeBuffer)
    @theme = CodeTheme.new
  end

  def pango_attrs_for_line(line_n : Int32) : Pango::AttrList?
    parser = @buffer.parser
    return if parser.nil?

    root_node = @buffer.root_node
    return if root_node.nil?

    # FIXME: Create a highlighter for each line is for sure not the way to go, but I want to see something colorized on my
    # screen 😅️, so later I fix all the mess here later.
    highlighter = TreeSitter::Highlighter.new(parser.language, root_node)

    io = IO::Memory.new
    highlighter.each_rule_for_line(line_n) do |capture|
      @theme.style_to_s(io, capture.rule, capture.node.start_point.column, capture.node.end_point.column)
    end
    Pango::AttrList.from_string(io.to_s)
  end
end
