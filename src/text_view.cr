require "./view"
require "./text_view_impl"
require "./text_view_gsv"
require "./text_view_tijolo"

class TextView < View
  @impl : TextViewImpl

  {% if flag?(:gsv) %}
  alias Impl = TextViewGSV
  {% else %}
  alias Impl = TextViewTijolo
  {% end %}

  def initialize(resource : String? = nil)
    @impl = Impl.new(resource)
    label = File.basename(resource) if resource
    super(@impl, label)
  end

  def grab_focus : Nil
    @impl.grab_focus
  end

  def resource : String
    @impl.resource
  end
end
