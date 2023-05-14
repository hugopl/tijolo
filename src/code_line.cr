class CodeLine
  getter layout : Pango::Layout
  property? text_outdated = false

  @render_node_outdated = true
  getter render_node : Gsk::RenderNode?

  def initialize(ctx : Pango::Context, text : Bytes, width : Int32, attributes)
    @layout = Pango::Layout.new(ctx)
    @layout.ellipsize = :end
    @layout.set_text(text)
    @layout.width = width * Pango::SCALE
    @layout.attributes = attributes
  end

  private def create_render_node : Nil
    snapshot = Gtk::Snapshot.new
    snapshot.append_layout(@layout, Gdk::RGBA.new(0.922, 0.922, 0.898, 1.0))
    @render_node = snapshot.to_node
    @render_node_outdated = false
  end

  def text_outdated! : Nil
    @text_outdated = true
  end

  def text=(text : Bytes?)
    text ||= ""
    @layout.set_text(text)
    @text_outdated = false
    @render_node_outdated = true
  end

  # Return -1 if the column is out of index
  def char_at(x : Float64) : Int32
    x = (x * Pango::SCALE).to_i
    res = @layout.xy_to_index(x, 0)
    res[:inside_text] ? res[:index] : -1
  end

  # Width in pango units.
  def width=(value : Int32)
    @layout.width = value * Pango::SCALE
    @render_node_outdated = true
  end

  def render(snapshot : Gtk::Snapshot)
    create_render_node if @render_node_outdated
    render_node = @render_node
    snapshot.append_node(render_node) if render_node
  end
end
