require "./signal_conector"

@[Gtk::UiTemplate(file: "#{__DIR__}/ui/view.ui", children: %w(container label header_start_box header_center_box header_end_box))]
abstract class View < Gtk::Box
  include Gtk::WidgetTemplate
  include SignalConnector

  @[GObject::Property]
  property label : String = ""

  getter header_start_box : Gtk::Box
  getter header_center_box : Gtk::Box
  getter header_end_box : Gtk::Box

  def initialize(contents : Gtk::Widget)
    super(css_name: "view")

    @header_start_box = Gtk::Box.cast(template_child(View.g_type, "header_start_box"))
    @header_center_box = Gtk::Box.cast(template_child(View.g_type, "header_center_box"))
    @header_end_box = Gtk::Box.cast(template_child(View.g_type, "header_end_box"))
    bind_property("label", header_label, "label", :default)

    container = Gtk::ScrolledWindow.cast(template_child(View.g_type, "container"))
    container.child = contents
  end

  def header_label
    Gtk::Label.cast(template_child(View.g_type, "label"))
  end

  abstract def grab_focus

  # This is triggered on Ctrl+Shift+C, used to copy from terminal views.
  def copy_to_clipboard
  end

  # This is triggered on Ctrl+Shift+V, used to paste on terminal views.
  def paste_from_clipboard
  end

  def color_scheme=(scheme : Adw::ColorScheme)
  end

  def to_s(io : IO)
    io << label
  end

  def inspect(io : IO)
    io << "<" << self.class.name << ' ' << label << '>'
  end
end
