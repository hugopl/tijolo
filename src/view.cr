require "./observable"
require "./helper"

module ViewListener
  # This is here... but this class doesn't emit it, since it doesn't have a ref for the widget.
  def view_escape_pressed(view : TextView)
  end

  def view_file_path_changed(view : TextView)
  end
end

# Base class for everything that Tijolo can show in the editor
abstract class View
  observable_by ViewListener

  @@untitled_count = -1

  getter file_path : Path?
  getter project_path : Path?
  getter id : String
  property label : String
  property? readonly = false
  getter last_saved_at : Time::Span?
  getter? externally_modified = false

  def initialize(file_path : Path? = nil, @project_path = nil)
    @id = object_id.to_s
    if file_path
      @file_path = file_path.expand
      @label = relative_path_label(file_path, @project_path)
    else
      @label = untitled_name
    end
  end

  def file_path=(file_path : Path) : Nil
    @file_path = file_path
    self.label = relative_path_label(file_path, @project_path)
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

  def header_text : String
    project_path = @project_path
    file_path = @file_path

    modified = modified? ? " ✱" : ""
    path = if project_path && file_path
             "#{file_path.relative_to(project_path)}"
           else
             @label
           end
    "#{path}#{modified}"
  end

  def modified? : Bool
    false
  end

  abstract def grab_focus
  abstract def modified? : Bool

  def externally_unmodified!
    @externally_modified = false
  end

  def externally_modified!
    last_saved_at = @last_saved_at
    @externally_modified = last_saved_at.nil? ? true : Time.monotonic - last_saved_at > 1.seconds
  end

  def reload : Nil
    @last_saved_at = Time.monotonic
    @externally_modified = false
  end

  def save : Nil
    @last_saved_at = Time.monotonic
    @externally_modified = false
  end
end
