class ViewManagerSplitNode < ViewManagerNode
  getter orientation : SplitOrientation
  @children = [] of ViewManagerNode

  def initialize(@orientation : SplitOrientation)
  end

  def add_child(position : SplitPosition, node : ViewManagerNode)
    node.parent = self
    if position.start?
      @children.unshift(node)
    else
      @children.push(node)
    end
  end

  def remove_child(child : ViewManagerNode) : Nil
    child.parent = nil
    @children.delete(child)
    if @children.empty?
      @parent.try(&.remove_child(self))
    end
  end

  def find_node?(view : View) : ViewManagerViewNode?
    @children.each do |child|
      node = child.find_node?(view)
      return node if node
    end
  end

  def each_view_node(&block : Proc(ViewManagerViewNode, Nil))
    @children.each do |child|
      child.each_view_node(&block)
    end
  end

  def size_allocate(x : Int32, y : Int32, width : Int32, height : Int32)
    child_x = x
    child_y = y
    if orientation.horizontal?
      child_width = width // @children.size
      child_height = height
    else
      child_width = width
      child_height = height // @children.size
    end
    @children.each do |child|
      child.size_allocate(child_x, child_y, child_width, child_height)
      child_x += child_width if orientation.horizontal?
      child_y += child_height if orientation.vertical?
    end
  end

  def dump_tree(io : IO)
    io << '"' << self << "\" [label=\"" << orientation << "\" shape=box]\n"

    @children.each do |child|
      child.dump_tree(io)
      io << '"' << self << "\" -> \"" << child << "\"\n"
    end
  end
end
