require "./view"
{% if flag?(:experimental) %}
  require "./code_editor"
{% else %}
  require "./gsv/code_editor"
{% end %}
require "./searchable"

class TextView < View
  include Searchable
  Log = ::Log.for("TextView")

  @@untitled_count = 0

  @editor : CodeEditor

  def initialize(resource : Path? = nil, project : Project? = nil)
    box = Gtk::Box.new(orientation: :vertical, hexpand: true, vexpand: true, spacing: 0)

    source = File.open(resource) if resource
    @editor = CodeEditor.new(source, detect_language(resource))
    super(@editor, resource, project)

    setup_search_bar

    @editor.buffer.bind_property("modified", self, "modified", :default)
    connect(@editor.cursor_changed_signal) do
      set_cursor_label(*@editor.cursor_line_col)
    end
    update_title
    set_cursor_label(*@editor.cursor_line_col)

    setup_editor_preferences
  end

  delegate grab_focus, to: @editor
  delegate :color_scheme=, to: @editor

  private def setup_editor_preferences
    config = Config.instance
    resource = self.resource
    is_make_file = resource.try(&.basename) == "Makefile"

    {% unless flag?(:experimental) %}
      @editor.tab_width = is_make_file ? 4 : config.editor_tab_width
      @editor.insert_spaces_instead_of_tabs = is_make_file ? false : config.editor_insert_spaces_instead_of_tabs
      @editor.show_right_margin = config.editor_show_right_margin
      @editor.right_margin_position = config.editor_right_margin_position
      @editor.highlight_current_line = config.editor_highlight_current_line
    {% end %}
  end

  def line_based_content?
    true
  end

  def current_line : Int32
    @editor.cursor_line_col[0]
  end

  def current_column : Int32
    @editor.cursor_line_col[1]
  end

  private def update_title
    resource = self.resource
    project = self.project
    label = if project && resource
              resource.relative_to(project.root).to_s
            elsif resource
              resource.to_s
            else
              untitled_label
            end
    self.label = label
  end

  private def untitled_label : String
    @@untitled_count += 1
    return "Untitled" if @@untitled_count == 1

    "Untitled #{@@untitled_count}"
  end

  def save : Nil
    Log.info { "Saving buffer to #{resource_hint}" }
    File.open(resource_hint, "w") do |file|
      @editor.buffer.save(file)
    end
  end

  def sort_lines
    editor = @editor
    editor.sort_lines if editor.responds_to?(:sort_lines)
  end

  delegate search_started, to: @editor
  delegate search_replace_started, to: @editor
  delegate search_changed, to: @editor
  delegate search_next, to: @editor
  delegate search_previous, to: @editor
  delegate search_stopped, to: @editor

  private def detect_language(resource : Path?) : String?
    return if resource.nil?

    {% if flag?(:experimental) %}
      # FIXME: Replace this scafold with a real implementation in crystal-tree-sitter shard
      #        Meanwhile just JSON and C for testing 😅️
      case resource.extension
      when ".json" then "json"
      when ".c"    then "c"
      end
    {% else %}
      lm = GtkSource::LanguageManager.default
      lang = lm.guess_language(resource.to_s, nil)
      lang.id if lang
    {% end %}
  end
end
