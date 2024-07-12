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

    load if resource
    update_title
  end

  private def load
    document = @hex.document
    document.read_async(nil) do |_obj, result|
      document.read_finish(result)
      document.document_changed_signal.connect do |_ptr, changed|
        self.modified = changed
      end
    rescue ex
      Log.error(exception: ex) { ex.message }
    end
  end

  def save : Nil
    document = @hex.document
    document.write_async(nil) do |_obj, result|
      document.write_finish(result)
      self.modified = false
      self.externally_modified = false
    rescue ex
      Log.error(exception: ex) { ex.message }
    end
  end

  def save_as(resource : Path) : Nil
    document = @hex.document
    document.write_to_file_async(Gio::File.new_for_path(resource), nil) do |_obj, result|
      document.write_finish(result)
      self.modified = false
      self.externally_modified = false
    rescue ex
      Log.error(exception: ex) { ex.message }
    end
  end

  def reload_contents : Nil
    resource = @resource
    return if resource.nil?

    document = Hex::Document.new_from_file(Gio::File.new_for_path(resource))
    @hex.document = document
    load
  end

  def do_check_for_external_changes : Nil
    resource = @resource
    self.readonly = !File.writable?(resource) if resource

    # TODO: Check for external changes.

  rescue ex : File::NotFoundError
    self.deleted = true
  end

  def current_line
    0
  end

  def goto_line(line, col)
    @hex.set_cursor_by_row_and_col(line, col)
  end
end
