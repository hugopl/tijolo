abstract class ViewManagerNode
  enum SplitOrientation
    Horizontal
    Vertical
  end

  enum SplitPosition
    Start
    End
  end

  property parent : ViewManagerSplitNode?

  def find_node(view : View) : ViewManagerViewNode
    find_node?(view).not_nil!
  end

  abstract def find_node?(view : View) : ViewManagerViewNode?
  # return the x,y of the selected view
  abstract def size_allocate(x : Int32, y : Int32, width : Int32, height : Int32, selected_view : View?) : {Int32, Int32}
  abstract def each_view_node(&block : Proc(ViewManagerViewNode, Nil)) : Nil

  def save_png(suffix = nil) : Nil
    File.open("/tmp/tree#{suffix}.dot", "w") do |io|
      io.puts("digraph G {")
      dump_tree(io)
      io.puts("}")
    end
    suffix ||= "tree"
    Log.warn { "saving tree to file:///tmp/#{suffix}.png" }
    `dot -Tpng /tmp/tree#{suffix}.dot > /tmp/#{suffix}.png`
  end

  abstract def dump_tree(io : IO)

  def to_s(io : IO)
    io << self.class.name << "@" << object_id
  end
end
