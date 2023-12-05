class ViewManagerSplitNode < ViewManagerNode
  getter orientation : SplitOrientation
  @children = [] of ViewManagerNode

  def initialize(@orientation : SplitOrientation)
    super()
  end

  delegate index, to: @children

  def child_count : Int32
    @children.size
  end

  def child(pos : Int32)
    @children[pos]
  end

  def child_index(node : ViewManagerNode) : Int32
    @children.index(node) || raise ArgumentError.new("Bad child.")
  end

  def add_child(position : SplitPosition, node : ViewManagerNode)
    node.parent = self
    if position.start?
      @children.unshift(node)
    else
      @children.push(node)
    end
  end

  def add_child(index : Int32, node : ViewManagerNode)
    node.parent = self
    @children.insert(index, node)
  end

  def remove_child(child : ViewManagerNode) : Nil
    child.parent = nil
    @children.delete(child)
    if @children.empty?
      @parent.try(&.remove_child(self))
    end
  end

  def first_view_node : ViewManagerViewNode
    @children.first.first_view_node
  end

  def find_node?(view : View) : ViewManagerViewNode?
    @children.each do |child|
      node = child.find_node?(view)
      return node if node
    end
  end

  def each_view_node(&block : Proc(ViewManagerViewNode, Nil)) : Nil
    @children.each do |child|
      child.each_view_node(&block)
    end
  end

  def size_allocate(x : Int32, y : Int32, width : Int32, height : Int32, selected_view : View?) : {Int32, Int32}
    child_x = x
    child_y = y
    if orientation.horizontal?
      child_width = width // @children.size
      child_height = height
    else
      child_width = width
      child_height = height // @children.size
    end
    current_view_x = -1
    current_view_y = -1

    @children.each do |child|
      child_coords = child.size_allocate(child_x, child_y, child_width, child_height, selected_view)
      current_view_x, current_view_y = child_coords if child_coords != {-1, -1}

      child_x += child_width if orientation.horizontal?
      child_y += child_height if orientation.vertical?
    end
    {current_view_x, current_view_y}
  end

  def color_scheme=(scheme : Adw::ColorScheme) : Nil
    @children.each(&.color_scheme=(scheme))
  end

  def dump_dot(io : IO)
    io << '"' << self << "\" [label=\"" << orientation << "\" shape=box]\n"

    @children.each do |child|
      child.dump_dot(io)
      io << '"' << self << "\" -> \"" << child << "\"\n"
    end
  end

  def dump(io : IO, current_node : ViewManagerNode? = nil)
    io << @orientation << '{'
    @children.each do |child|
      child.dump(io, current_node)
    end
    io << '}'
  end
end
