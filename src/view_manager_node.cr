abstract class ViewManagerNode < GObject::Object
  include Gio::ListModel

  enum SplitOrientation
    Horizontal
    Vertical
  end

  enum SplitPosition
    Start
    End
  end

  property parent : ViewManagerSplitNode?

  def initialize
    super()
  end

  def find_node(view : View) : ViewManagerViewNode
    find_node?(view).not_nil!
  end

  abstract def first_view_node : ViewManagerViewNode
  abstract def find_node?(view : View) : ViewManagerViewNode?
  # return the x,y of the selected view
  abstract def size_allocate(x : Int32, y : Int32, width : Int32, height : Int32, selected_view : View?) : {Int32, Int32}
  # FIXME: Replace this by a ViewNodeIterator
  abstract def each_view_node(&block : Proc(ViewManagerViewNode, Nil)) : Nil
  abstract def color_scheme=(scheme : Adw::ColorScheme) : Nil

  def save_png(suffix = nil) : Nil
    File.open("/tmp/tree#{suffix}.dot", "w") do |io|
      io.puts("digraph G {")
      dump_dot(io)
      io.puts("}")
    end
    suffix ||= "tree"
    Log.warn { "saving tree to file:///tmp/tree#{suffix}.png" }
    `dot -Tpng /tmp/tree#{suffix}.dot > /tmp/tree#{suffix}.png`
  end

  abstract def dump_dot(io : IO)
  abstract def dump(io : IO, current_node : ViewManagerNode? = nil)

  def dump(current_node : ViewManagerNode? = nil) : String
    String.build do |str|
      dump(str, current_node)
    end
  end

  def to_s(io : IO)
    io << self.class.name << "@" << object_id
  end
end
