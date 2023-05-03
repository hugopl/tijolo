class CodeLine
  getter layout : Pango::Layout
  property? dirty = false

  def initialize(ctx : Pango::Context, text : Bytes, width : Int32)
    @layout = Pango::Layout.new(ctx)
    @layout.ellipsize = :end
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

  # Return -1 if the column is out of index
  def char_at(x : Float64) : Int32
    x = (x * Pango::SCALE).to_i
    @layout.xy_to_index(x, 0)
  end

  # Width in pango units.
  def width=(value : Int32)
    @layout.width = value * Pango::SCALE
  end
end
