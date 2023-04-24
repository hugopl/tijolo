class CodeLine
  getter layout : Pango::Layout
  property? dirty = false

  def initialize(ctx : Pango::Context, text : Bytes, width : Int32)
    @layout = Pango::Layout.new(ctx)
    @layout.set_text(text)
    self.width = width
  end

  def dirty!
    @dirty = true
  end

  def text=(text : Bytes?)
    @dirty = false
    text ||= ""
    @layout.set_text(text)
  end

  # Width in pango units.
  def width=(value : Int32)
    @layout.width = value * Pango::SCALE
  end
end
