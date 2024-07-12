{% skip_file if flag?(:no_hexeditor) %}

GICrystal.require("Hex", "4")

class HexView < DocumentView
  Log = ::Log.for(HexView)

  @hex : Hex::Widget

  def initialize(resource : Path = nil, project : Project? = nil)
    document = Hex::Document.new_from_file(Gio::File.new_for_path(resource)) if resource
    @hex = Hex::Widget.new(document: document)
    @hex.show_offsets(true)
    super(@hex, resource, project)

    if document
      document.read_async(nil) do |_obj, result|
        document.read_finish(result)
      rescue ex
        Log.error(exception: ex) { ex.message }
      end
    end
    update_title

    # Make it editable is another step.
    self.readonly = true
  end

  def do_save : Nil
    not_implemented!
  end

  def do_reload_contents : Nil
    not_implemented!
  end

  def do_check_for_external_changes : Nil
    not_implemented!
  end

  def current_line
    0
  end

  def goto_line(line, col)
    @hex.set_cursor_by_row_and_col(line, col)
  end
end
