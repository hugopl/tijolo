@[Gtk::UiTemplate(file: "#{__DIR__}/ui/view.ui", children: %w(container header label))]
abstract class View < Gtk::Box
  include Gtk::WidgetTemplate

  @@untitled_count = 0

  getter label : String
  getter? maximized = false
  property? readonly = false

  @header : Gtk::Widget

  def initialize(contents : Gtk::Widget, label : String? = nil)
    super()
    # @id = object_id.to_s(16)
    @header = Gtk::Widget.cast(template_child(View.g_type, "header"))
    @header_label = Gtk::Label.cast(template_child(View.g_type, "label"))
    @header_label.label = @label = (label || untitled_label)
    container = Gtk::ScrolledWindow.cast(template_child(View.g_type, "container"))
    container.child = contents
  end

  private def untitled_label : String
    @@untitled_count += 1
    return "Untitled" if @@untitled_count == 1

    "Untitled #{@@untitled_count}"
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

  abstract def focus : Nil
  abstract def resource : String

  private def update_header
  end

  def label=(@label : String)
    @header_label.label = @label
  end

  def to_s(io : IO)
    io << label
  end
end
