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

  @monitor : Gio::FileMonitor?

  # True during a saving operation
  private getter? saving = false

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

  def finalize
    @monitor.try(&.cancel)
  end

  def self.reset_untitled_count
    @@untitled_count = -1
  end

  def line_column_label(line : Int32, col : Int32)
    @line_column_label.label = "#{line}:#{col}"
  end

  def file_path=(file_path : Path) : Nil
    return if file_path == @file_path

    @file_path = file_path
    self.readonly = !File.writable?(file_path) if File.exists?(file_path)
    @virtual = false
    self.label = relative_path_label(file_path, @project_path)
    notify_view_file_path_changed(self)
    setup_monitor
  end

  private def setup_monitor
    monitor = @monitor
    file_path = @file_path
    return if monitor || virtual? || file_path.nil?

    @monitor = monitor = Gio::File.new_for_path(file_path.to_s).monitor_file(:none, nil)
    monitor.on_changed(&->file_changed_event(Gio::FileMonitor, Gio::File, Gio::File?, Gio::FileMonitorEvent))
  end

  private def file_changed_event(_monitor : Gio::FileMonitor, file : Gio::File, other_file : Gio::File?, event : Gio::FileMonitorEvent)
    if event.changes_done_hint? # At least on Linux I never see the RENAME event.
      @saving = false
      self.file_path = Path.new(file.parse_name)
    elsif event.changed? && !saving?
      if can_reload?
        reload
      else
        was_modified_before = externally_modified?
        externally_modified!
        update_header unless was_modified_before
      end
    end
  end

  def label=(@label : String)
    update_header
    notify_view_file_path_changed(self)
  end

  def has_focus? : Bool
    @view_widget.has_focus
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
    String.build do |str|
      str << label
      str << " " if readonly? || maximized? || externally_modified? || modified?
      str << "*" if modified?
      str << "<readonly>" if readonly?
      str << "<maximized>" if maximized?
      str << "<externally modified>" if externally_modified?
    end
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
    return true if readonly?
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
    return if readonly?

    file_path = @file_path
    raise AppError.new("Attempt to save a file without a name.") if file_path.nil?

    @last_saved_at = Time.monotonic
    @externally_modified = false
    @saving = true
    do_save
  rescue e
    @saving = false
    raise e
  end

  protected def do_save : Nil
  end

  def to_s(io : IO) : IO
    io << @label
  end
end
