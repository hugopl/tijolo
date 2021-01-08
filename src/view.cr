require "./observable"
require "./helper"

module ViewListener
  def view_escape_pressed(view : View)
  end

  def view_file_path_changed(view : View)
  end

  def view_cursor_location_changed(view : View, line : Int32, column : Int32)
  end

  def view_focused(view : View)
  end

  def view_close_requested(view : View)
  end
end

# Base class for everything that Tijolo can show in the editor
abstract class View
  include UiBuilderHelper

  observable_by ViewListener

  @@untitled_count = -1

  getter file_path : Path?
  property project_path : Path?
  getter id : String
  property label = ""
  property? readonly = false
  property? virtual = false
  getter last_saved_at : Time::Span?
  getter? externally_modified = false
  getter? maximized = false

  getter widget : Gtk::Widget

  delegate show_all, to: @view_widget
  delegate grab_focus, to: @view_widget

  def initialize(@view_widget : Gtk::Widget, file_path : Path? = nil, @project_path = nil)
    builder = builder_for("view")
    @widget = Gtk::Widget.cast(builder["root"])
    @editor_header = Gtk::Widget.cast(builder["editor_header"])
    @line_column_label = Gtk::Label.cast(builder["line_column"])
    @file_path_label = Gtk::MenuButton.cast(builder["file_path"])
    @file_path_label.on_button_press_event do |_widget, _event|
      @file_path_label.clicked unless @file_path.nil?
      true
    end

    container = Gtk::ScrolledWindow.cast(builder["container"])
    container.add(@view_widget)

    @id = object_id.to_s
    if file_path
      self.file_path = file_path.expand
    else
      @label = untitled_name
    end

    @view_widget.on_focus_in_event do
      notify_view_focused(self)
      false
    end

    variant_self = GLib::Variant.new_uint64(self.object_id)
    Gtk::ModelButton.cast(builder["copy_full_path"]).action_target_value = variant_self
    Gtk::ModelButton.cast(builder["copy_full_path_and_line"]).action_target_value = variant_self
    Gtk::ModelButton.cast(builder["copy_file_name"]).action_target_value = variant_self
    Gtk::ModelButton.cast(builder["copy_relative_path_and_line"]).action_target_value = variant_self
    Gtk::ModelButton.cast(builder["copy_relative_path"]).action_target_value = variant_self
  end

  def self.reset_untitled_count
    @@untitled_count = -1
  end

  def line_column_label(line : Int32, col : Int32)
    @line_column_label.label = "#{line}:#{col}"
  end

  def file_path=(file_path : Path) : Nil
    @file_path = file_path
    self.readonly = !File.writable?(file_path) if File.exists?(file_path)
    @virtual = false
    self.label = relative_path_label(file_path, @project_path)
    notify_view_file_path_changed(self)
  end

  def label=(@label : String)
    update_header
    notify_view_file_path_changed(self)
  end

  def maximized=(@maximized)
    update_header
  end

  def update_header
    @file_path_label.label = header_text
  end

  private def key_pressed(_widget : Gtk::Widget, event : Gdk::EventKey) : Bool
    if event.keyval == Gdk::KEY_Escape
      notify_view_escape_pressed(self)
      return true
    end
    false
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
    # TODO: Find a better/nicer way to inform view status on UI
    modified = if modified?
                 "✱"
               elsif readonly?
                 "<readonly>"
               end
    maximized = "<maximized>" if @maximized
    separator = " " if maximized || modified
    "#{label}#{separator}#{modified}#{maximized}"
  end

  def modified? : Bool
    false
  end

  def can_share_node? : Bool
    true
  end

  def restore_state
  end

  def selected=(value : Bool) : Nil
    ctx = @editor_header.style_context
    if value
      ctx.add_class("selected")
    else
      ctx.remove_class("selected")
    end
  end

  def cursor_pos
    {0, 0}
  end

  def externally_unmodified!
    @externally_modified = false
  end

  def externally_modified!
    last_saved_at = @last_saved_at
    @externally_modified = last_saved_at.nil? ? true : Time.monotonic - last_saved_at > 1.seconds
  end

  def can_reload? : Bool
    return false if modified?

    # A more accurate approach would check if the view contents matches the contents on disk, if not, return false. However
    # meanwhile I think this will be slow as hell for a corner-case. This can change in the future.
    Git::Repo.current.modified?(@file_path.not_nil!)
  end

  def reload : Nil
    @last_saved_at = Time.monotonic
    @externally_modified = false
  end

  def save : Nil
    @last_saved_at = Time.monotonic
    @externally_modified = false
    self.readonly = false
  end

  def to_s(io : IO) : IO
    io << @label
  end
end
