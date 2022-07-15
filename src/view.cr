@[Gtk::UiTemplate(file: "#{__DIR__}/ui/view.ui", children: %w(container header label line_column modified))]
abstract class View < Gtk::Box
  include Gtk::WidgetTemplate

  @@untitled_count = 0

  @[GObject::Property]
  property label : String
  getter? resource : Path?
  getter? maximized = false
  property? readonly = false
  @[GObject::Property]
  property modified = false

  getter resource : Path?

  @header : Gtk::Widget
  @line_column : Gtk::Label

  def initialize(contents : Gtk::Widget, @resource : Path?, label : String? = nil)
    super()

    resource = @resource
    @label = label || (resource.nil? ? "" : File.basename(resource))

    @header = Gtk::Widget.cast(template_child(View.g_type, "header"))
    header_label = Gtk::Label.cast(template_child(View.g_type, "label"))
    header_label.label = @label
    bind_property("label", header_label, "label", :default)

    @line_column = Gtk::Label.cast(template_child(View.g_type, "line_column"))

    modified_label = Gtk::Label.cast(template_child(View.g_type, "modified"))
    bind_property("modified", modified_label, "visible", :default)

    container = Gtk::ScrolledWindow.cast(template_child(View.g_type, "container"))
    container.child = contents

    gesture = Gtk::GestureClick.new(button: 0)
    gesture.pressed_signal.connect { ViewManager.instance.focus_view(self) }
    add_controller(gesture)
  end

  private def untitled_label : String
    @@untitled_count += 1
    return "Untitled" if @@untitled_count == 1

    "Untitled #{@@untitled_count}"
  end

  # FIXME: gi-crystal isn't notifying the property change if modified is declared as `property?`
  def modified?
    @modified
  end

  def resource=(resource : Path?)
    @resource = resource
    self.label = resource.nil? ? "" : File.basename(resource)

    pp! @label
  end

  def maximized=(@maximized)
    update_header
  end

  def select : Nil
    @header.style_context.add_class("selected")
  end

  def unselect : Nil
    @header.style_context.remove_class("selected")
  end

  abstract def grab_focus
  abstract def save : Nil

  def save_as(resource : Path) : Nil
    self.resource = resource
    save
  end

  def set_cursor(line : Int32, col : Int32)
    # Internally lines starts at 0, just on UI they start at 1.
    @line_column.label = line.negative? ? "?" : "#{line + 1}:#{col}"
  end

  private def update_header
  end

  def to_s(io : IO)
    io << label
  end
end
