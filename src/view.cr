require "./observable"

module ViewListener
  # This is here... but this class doesn't emit it, since it doesn't have a ref for the widget.
  def view_escape_pressed
  end

  def view_file_path_changed(view : TextView)
  end
end

# Base class for everything that Tijolo can show in the editor
class View
  observable_by ViewListener

  getter file_path : Path?
  property label : String

  def initialize(file_path : String? = nil)
    @file_path = Path.new(file_path).expand unless file_path.nil?
    @label = @file_path.nil? ? untitled_name : File.basename(@file_path.not_nil!)
  end

  def id : String
    @id ||= object_id.to_s
  end

  def file_path=(file_path : Path) : Nil
    @file_path = file_path
    self.label = File.basename(file_path)
    notify_view_file_path_changed(self)
  end

  private def untitled_name
    @@untitled_count += 1
    if @@untitled_count.zero?
      "Untitled"
    else
      "Untitled #{@@untitled_count}"
    end
  end
end
