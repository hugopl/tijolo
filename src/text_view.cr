require "./view"

class TextView < View
  @view : Gtk::TextView

  def initialize(resource : String)
    @view = Gtk::TextView.new
    super(resource, @view)
    @view.buffer.text = File.read(resource)
  end

  def focus
    @view.grab_focus
  end
end
