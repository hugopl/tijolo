@[Gtk::UiTemplate(file: "#{__DIR__}/ui/view.ui", children: %w(container header header_label))]
class View < Gtk::Box
  include Gtk::WidgetTemplate

  alias Id = String

  getter id : Id
  getter resource : String
  getter? can_share_node = true
  getter? maximized = false
  property? readonly = false

  @header : Gtk::Box

  def initialize(@resource, contents : Gtk::Widget)
    super()
    @id = object_id.to_s(16)
    @header = Gtk::Box.cast(template_child(View.g_type, "header"))
    @header_label = Gtk::MenuButton.cast(template_child(View.g_type, "header_label"))
    @header_label.label = @resource
    container = Gtk::ScrolledWindow.cast(template_child(View.g_type, "container"))
    container.child = contents
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

  private def update_header
  end

  def label : String
    File.basename(@resource)
  end

  def to_s(io : IO)
    io << label
  end
end
