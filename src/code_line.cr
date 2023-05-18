class CodeLine
  getter layout : Pango::Layout
  property? text_outdated = true

  @render_node_outdated = true
  getter render_node : Gsk::RenderNode?

  def initialize(ctx : Pango::Context)
    Log.info { "new code line" }

    @layout = Pango::Layout.new(ctx)
    @layout.ellipsize = :end
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

  delegate :attributes=, to: @layout

  def text=(text : Bytes?)
    text ||= "".to_slice
    Log.info { "updating code line text: #{String.new(text).inspect.colorize.yellow}" } if text
    @layout.set_text(text)
    @text_outdated = false
    @render_node_outdated = true
  end

  # Return -1 if the column is out of index
  def byte_at(x : Float64) : Int32
    x = (x * Pango::SCALE).to_i
    res = @layout.xy_to_index(x, 0)
    res[:inside_text] ? res[:index] : -1
  end

  # Width in pango units.
  def width=(value : Float32)
    @layout.width = value.to_i * Pango::SCALE
    @render_node_outdated = true
  end

  def render(snapshot : CodeSnapshot)
    create_render_node if @render_node_outdated
    render_node = @render_node
    snapshot.append_node(render_node) if render_node
  end
end
