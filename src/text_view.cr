require "./view"
require "./code_editor"

class TextView < View
  @editor : CodeEditor

  def initialize(resource : Path? = nil)
    source = File.open(resource) if resource
    @editor = CodeEditor.new(source, detect_language(resource))
    super(@editor, resource)

    @editor.buffer.bind_property("modified", self, "modified", :default)
    @editor.cursor_changed_signal.connect do |line, col|
      set_cursor(line, col)
    end
  end

  delegate grab_focus, to: @editor

  def save : Nil
    resource = self.resource
    if resource.nil?
      Log.warn { "Trying to save a text view with no name!" }
      return
    end

    Log.info { "Saving buffer to #{resource}" }
    File.open(resource, "w") do |file|
      @editor.buffer.save(file)
    end

    self.modified = false
  end

  # FIXME: Replace this scafold with a real implementation in crystal-tree-sitter shard
  #        Meanwhile just JSON and C for testing 😅️
  private def detect_language(resource : Path?) : String?
    return if resource.nil?
    case resource.extension
    when ".json" then "json"
    when ".c"    then "c"
    end
  end
end
