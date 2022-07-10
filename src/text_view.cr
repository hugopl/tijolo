require "./view"
require "./code_editor"

class TextView < View
  @editor : CodeEditor

  def initialize(resource : Path? = nil)
    @editor = CodeEditor.new(resource)
    super(@editor, resource)

    @editor.buffer.bind_property("modified", self, "modified", :default)
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
end
