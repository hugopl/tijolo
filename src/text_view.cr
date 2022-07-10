require "./view"
require "./code_editor"

class TextView < View
  @editor : CodeEditor
  getter resource : String

  def initialize(resource : String? = nil)
    @editor = CodeEditor.new(resource)
    @resource = resource || ""
    label = File.basename(resource.to_s)
    super(@editor, label)

    @editor.buffer.bind_property("modified", self, "modified", :default)
  end

  delegate grab_focus, to: @editor
end
