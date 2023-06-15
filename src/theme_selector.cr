@[Gtk::UiTemplate(file: "#{__DIR__}/ui/theme_selector.ui")]
class ThemeSelector < Gtk::Box
  include Gtk::WidgetTemplate

  def initialize
    super(css_name: "themeselector")
  end
end
