require "./signal_conector"

@[Gtk::UiTemplate(file: "#{__DIR__}/ui/view.ui", children: %w(container label header_start_box header_center_box header_end_box bottom_revealer toast_overlay file_externally_modified_banner file_deleted_banner))]
abstract class View < Gtk::Box
  include Gtk::WidgetTemplate
  include SignalConnector

  @[GObject::Property]
  property label : String = ""

  getter header_start_box : Gtk::Box
  getter header_center_box : Gtk::Box
  getter header_end_box : Gtk::Box
  getter bottom_revealer : Gtk::Revealer
  @toast_overlay : Adw::ToastOverlay
  getter contents : Gtk::Widget

  def initialize(@contents)
    super(css_name: "view")

    @header_start_box = Gtk::Box.cast(template_child(View.g_type, "header_start_box"))
    @header_center_box = Gtk::Box.cast(template_child(View.g_type, "header_center_box"))
    @header_end_box = Gtk::Box.cast(template_child(View.g_type, "header_end_box"))
    @bottom_revealer = Gtk::Revealer.cast(template_child(View.g_type, "bottom_revealer"))
    @toast_overlay = Adw::ToastOverlay.cast(template_child(View.g_type, "toast_overlay"))
    bind_property("label", header_label, "label", :default)

    container = Gtk::ScrolledWindow.cast(template_child(View.g_type, "container"))
    container.child = contents

    key_ctl = Gtk::EventControllerKey.new(propagation_phase: :bubble)
    key_ctl.key_pressed_signal.connect(->key_pressed(UInt32, UInt32, Gdk::ModifierType))
    add_controller(key_ctl)
  end

  def header_label
    Gtk::Label.cast(template_child(View.g_type, "label"))
  end

  @[GObject::Virtual]
  def grab_focus : Bool
    @contents.grab_focus
  end

  private def key_pressed(key_val : UInt32, key_code : UInt32, modifier : Gdk::ModifierType) : Bool
    if key_val == Gdk::KEY_Escape
      grab_focus
      on_esc_key_pressed
      return true
    end
    false
  end

  def on_esc_key_pressed
    @bottom_revealer.reveal_child = false
  end

  def add_toast(message : String) : Nil
    @toast_overlay.add_toast(Adw::Toast.new(message))
  end

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
