require "./text_buffer"

# This still just a draft to check how GTK/Pango API works and verify if the bindings are working with them.
#
# TODO: In this order
#
# - Fix pango metrics crash
# - Add a bunch of overloads to Gtk::Snapshot to avoid keep creating graphene points on stack
# - Draw grid
# - Use monospaced font
# - Draw cursor
# - Move cursor
# - Add scrollbar and handle scrolling
# - Handle text input
# - Study treesitter
# - Highlight code with tree sitter
# - Replace dummy text buffer by a piece table
class TextViewTijolo < Gtk::Widget
  include TextViewImpl

  getter resource : String

  @pango_ctx : Pango::Context
  @buffer : TextBuffer

  # Colors
  @bg_color : Gdk::RGBA
  @text_color : Gdk::RGBA
  @grid_color : Gdk::RGBA

  @font_height : Float32
  @font_width : Float32

  def initialize(resource : String? = nil)
    super()
    @resource = resource || ""
    @buffer = TextBuffer.new(resource)

    @pango_ctx = pango_context

    # Colors
    @bg_color = Gdk::RGBA.new(0.14, 0.14, 0.14, 1.0)
    @text_color = Gdk::RGBA.new(1.0, 1.0, 1.0, 1.0)
    @grid_color = Gdk::RGBA.new(0.14, 0.14, 0.14, 1.0)

    # FIXME: Pango::FontMetrics is crashing with a double free!
    #metric = @pango_ctx.metrics(nil, nil)
    @font_height = 20_f32 # (metric.height / Pango::SCALE).to_f32
    @font_width = 10_f32 # (metric.approximate_char_width / Pango::SCALE).to_f32
  end

  def do_snapshot(snapshot : Gtk::Snapshot)
    w = width.to_f32
    h = height.to_f32
    orig = Graphene::Point.new(0.0, 0.0)
    size = Graphene::Size.new(w, h)
    rect = Graphene::Rect.new(orig, size)

    Log.notice { "snapshot! #{w} x #{h}" }

    snapshot.append_color(@bg_color, rect)

    draw_gutter(snapshot)
    draw_line_numbers(snapshot)
    draw_grid(snapshot)
    draw_text(snapshot)
  end

  private def digits_count(n : Int32) : Int32
    (Math.log(n.to_f + 1) / Math::LOG10).ceil.to_i
  end

  private def draw_grid(snapshot : Gtk::Snapshot)
  end

  private def draw_line_numbers(snapshot : Gtk::Snapshot)
    layout = Pango::Layout.new(@pango_ctx)
    trans = Graphene::Point.new(0.0, @font_height)

    1.upto(@buffer.line_count + 1) do |i|
      layout.set_text(i.to_s, i.to_s.bytesize)
      snapshot.append_layout(layout, @text_color)
      snapshot.translate(trans)
    end
    snapshot.translate(Graphene::Point.new(0.0, -(@buffer.line_count + 1) * @font_height))
  end

  private def draw_gutter(snapshot : Gtk::Snapshot)
  end

  private def draw_text(snapshot : Gtk::Snapshot)
    digits = digits_count(@buffer.line_count) + 2
    trans = Graphene::Point.new(digits * @font_width, 0.0)
    snapshot.translate(trans)

    trans = Graphene::Point.new(0.0, @font_height)
    @buffer.each_line do |line|
      layout = Pango::Layout.new(@pango_ctx)
      layout.set_text(line, line.bytesize)
      snapshot.append_layout(layout, @text_color)
      snapshot.translate(trans)
    end
  end
end
