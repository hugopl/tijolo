require "./document_view"
require "./code_editor"
require "./find_replace"

class TextView < DocumentView
  Log = ::Log.for(self)

  @@untitled_count = 0
  @editor : CodeEditor
  @line_column = Gtk::Label.new
  @find_replace : FindReplace

  def initialize(resource : Path? = nil, project : Project? = nil)
    source = File.open(resource) if resource
    @editor = CodeEditor.new(source, CodeLanguage.detect(resource))
    super(@editor, resource, project)

    @find_replace = FindReplace.new(@editor)
    @find_replace.bind_property("active", bottom_revealer, "reveal_child", :none)

    @header_end_box.prepend(@line_column)
    bottom_revealer.child = @find_replace

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

  def resource=(resource : Path?) : Nil
    super(resource)

    highlight
  end

  private def highlight
    resource = @resource
    if resource
      lang = CodeLanguage.detect(resource)
      @editor.language = lang
    end
  end

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

  def find
    @find_replace.find(@editor.selection_or_word_at_cursor)
    bottom_revealer.reveal_child = true
  end

  def find_next
    @find_replace.find_next
    bottom_revealer.reveal_child = true
  end

  def find_prev
    @find_replace.find_prev
    bottom_revealer.reveal_child = true
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
end
