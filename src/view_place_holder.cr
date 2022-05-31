class ViewPlaceHolder < Gtk::Box
  def initialize
    super
    self.vexpand = true
    self.halign = :center
    append(Gtk::Label.new("[View Place Holder]"))
  end
end
