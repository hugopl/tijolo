require "./view"
{% if flag?(:experimental) %}
  require "./code_editor"
{% else %}
  require "./gsv/code_editor"
{% end %}

class TextView < View
  Log = ::Log.for("TextView")

  @editor : CodeEditor

  def initialize(resource : Path? = nil, label : String? = nil)
    source = File.open(resource) if resource
    @editor = CodeEditor.new(source, detect_language(resource))
    super(@editor, resource, label)

    @editor.buffer.bind_property("modified", self, "modified", :default)
    @editor.cursor_changed_signal.connect do
      set_cursor(*@editor.cursor_line_col)
    end
  end

  delegate grab_focus, to: @editor

  def save : Nil
    Log.info { "Saving buffer to #{resource_hint}" }
    File.open(resource_hint, "w") do |file|
      @editor.buffer.save(file)
    end
  end

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
