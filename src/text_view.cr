require "./view"

class TextView < View
  @view : Gtk::TextView
  getter resource : String

  def initialize(@resource : String)
    @view = Gtk::TextView.new
    super(@view, File.basename(@resource))
    @view.buffer.text = File.read(resource)
  end

  def initialize
    @view = Gtk::TextView.new
    @resource = ""
    super(@view)
  end

  def focus : Nil
    @view.grab_focus
  end
end
