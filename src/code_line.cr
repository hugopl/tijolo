class CodeLine
  getter layout : Pango::Layout

  def initialize(ctx : Pango::Context, text : Bytes, width : Int32)
    @layout = Pango::Layout.new(ctx)
    @layout.set_text(text)
    self.width = width
  end

  # Width in pango units.
  def width=(value : Int32)
    @layout.width = value * Pango::SCALE
  end

  def height : Int32
    # FIXME: Fix this in gi-crystal
    width, height = @layout.pixel_size
  end
end
