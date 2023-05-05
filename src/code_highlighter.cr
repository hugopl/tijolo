require "tree_sitter"
require "./code_theme"

class CodeHighlighter
  @buffer : CodeBuffer
  @parser : TreeSitter::Parser
  @tree : TreeSitter::Tree
  @theme : CodeTheme

  def initialize(@buffer : CodeBuffer, language : String)
    @parser = TreeSitter::Parser.new(language)
    # FIXME: Use the block version of this to avoid read the entire buffer at once
    @tree = @parser.parse(nil, @buffer.contents)
    @theme = CodeTheme.new
  end

  def language=(name : String)
    language = TreeSitter::Repository.load_language(name)
    @parser.language = language
  rescue e : TreeSitter::Error
    Log.error { "Can't load #{name} language: #{e.message}" }
    nil
  end

  def pango_attrs_for_line(line_n : Int32) : Pango::AttrList?
    # FIXME: Create a highlighter for each line is for sure not the way to go, but I want to see something colorized on my
    # screen 😅️, so later I fix all the mess here later.
    highlighter = TreeSitter::Highlighter.new(@parser.language, @tree.root_node)

    io = IO::Memory.new
    highlighter.each_rule_for_line(line_n) do |capture|
      @theme.style_to_s(io, capture.rule, capture.node.start_point.column, capture.node.end_point.column)
    end
    Pango::AttrList.from_string(io.to_s)
  end
end
