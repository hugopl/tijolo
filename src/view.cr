@[Gtk::UiTemplate(file: "#{__DIR__}/ui/view.ui", children: %w())]
class View < Gtk::Box
  include Gtk::WidgetTemplate

  alias Id = UInt64

end