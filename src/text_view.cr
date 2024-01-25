require "./document_view"

require "./code_editor"
require "./searchable"

class TextView < DocumentView
  include Searchable
  Log = ::Log.for("TextView")

  @@untitled_count = 0

  @editor : CodeEditor
  @line_column : Gtk::Label

  def initialize(resource : Path? = nil, project : Project? = nil)
    source = File.open(resource) if resource
    @editor = CodeEditor.new(source, CodeLanguage.detect(resource))
    super(@editor, resource, project)

    @line_column = Gtk::Label.new
    @header_end_box.prepend(@line_column)

    setup_search_bar

    @editor.buffer.modified_changed_signal.connect do
      self.modified = @editor.buffer.modified
    end

    connect(@editor.cursor_changed_signal) do
      set_cursor_label(*@editor.cursor_line_col)
    end
    update_title
    set_cursor_label(*@editor.cursor_line_col)

    setup_editor_preferences
  end

  delegate grab_focus, to: @editor
  delegate :color_scheme=, to: @editor

  def do_reload_contents : Nil
    resource = @resource
    return if resource.nil?

    @editor.reload(File.open(resource))
  end

  private def setup_editor_preferences
    config = Config.instance
    resource = self.resource
    is_make_file = resource.try(&.basename) == "Makefile"

    @editor.tab_width = is_make_file ? 4 : config.editor_tab_width
    @editor.insert_spaces_instead_of_tabs = is_make_file ? false : config.editor_insert_spaces_instead_of_tabs
    @editor.show_right_margin = config.editor_show_right_margin
    @editor.right_margin_position = config.editor_right_margin_position
    @editor.highlight_current_line = config.editor_highlight_current_line
  end

  # Line and col starts at zero in code, but at 1 in UI
  private def set_cursor_label(line : Int32, col : Int32)
    @line_column.label = line.negative? ? "?" : "#{line + 1}:#{col + 1}"
  end

  def current_line : Int32
    @editor.cursor_line_col[0]
  end

  def do_save : Nil
    Log.info { "Saving buffer to #{resource_hint}" }
    File.open(resource_hint, "w") do |file|
      @editor.buffer.save(file)
    end
  end

  delegate sort_lines, to: @editor
  delegate comment_code, to: @editor
  delegate move_lines_up, to: @editor
  delegate move_lines_down, to: @editor
  delegate move_viewport_line_up, to: @editor
  delegate move_viewport_line_down, to: @editor
  delegate move_viewport_page_up, to: @editor
  delegate move_viewport_page_down, to: @editor
  delegate goto_line, to: @editor
  delegate search_started, to: @editor
  delegate search_replace_started, to: @editor
  delegate search_changed, to: @editor
  delegate search_next, to: @editor
  delegate search_previous, to: @editor
  delegate search_stopped, to: @editor
end
