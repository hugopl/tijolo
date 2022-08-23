@[Gtk::UiTemplate(file: "#{__DIR__}/ui/view_place_holder.ui", children: %w())]
class ViewPlaceHolder < Gtk::Box
  include Gtk::WidgetTemplate

  def initialize
    super
  end
end
