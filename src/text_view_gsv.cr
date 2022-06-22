class TextViewGSV < Gtk::TextView
  include TextViewImpl

  getter resource : String

  def initialize(resource : String? = nil)
    super()
    buffer.text = File.read(resource) if resource
    @resource = resource || ""
  end
end
