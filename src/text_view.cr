require "./view"

class TextView < View
  def initialize(resource : String)
    view = Gtk::TextView.new
    super(resource, view)
    view.buffer.text = File.read(resource)
  end
end
