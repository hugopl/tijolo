class CodeSnapshot
  @snapshot : Gtk::Snapshot
  getter viewport_width : Float32
  getter viewport_height : Float32
  getter font_width : Float32
  getter line_height : Float32

  def initialize(@snapshot, @viewport_width, @viewport_height, @font_width, @line_height)
  end

  def lines_per_page : Int32
    (@viewport_height / @line_height).to_i
  end

  macro method_missing(call)
    @snapshot.{{ call }}
  end
end
