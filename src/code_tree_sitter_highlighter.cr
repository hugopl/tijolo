require "tree_sitter"
require "./code_highlighter"
require "./code_theme"

class CodeTreeSitterHighlighter < CodeHighlighter
  @buffer : CodeBuffer
  @highlighter : TreeSitter::Highlighter

  def initialize(@buffer : CodeBuffer)
    parser = @buffer.parser
    raise ArgumentError.new if parser.nil?

    @highlighter = TreeSitter::Highlighter.new(parser.language)
  end

  def set_line_range(start_line : Int32, end_line : Int32)
    @highlighter.set_line_range(start_line, end_line)
  end

  def exec : Nil
    root_node = @buffer.root_node
    @highlighter.exec(root_node) if root_node
  end

  def skip_attrs_for_next_line : Nil
    @highlighter.highlight_next_line
  end

  def pango_attrs_for_next_line : Pango::AttrList?
    captures = @highlighter.highlight_next_line
    return if captures.nil?

    theme = CodeTheme.instance
    # Pango::AttrList is created string due to https://github.com/hugopl/pango.cr/issues/1
    io = IO::Memory.new
    captures.each do |capture|
      theme.style_to_s(io, capture.rule, capture.node.start_point.column, capture.node.end_point.column)
    end
    Log.info { "Highlight: #{io.to_s.colorize.magenta}" }
    Pango::AttrList.from_string(io.to_s)
  end
end