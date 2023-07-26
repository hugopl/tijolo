class ViewManagerViewNode < ViewManagerNode
  @views = [] of View
  getter x : Int32 = 0
  getter y : Int32 = 0
  getter width : Int32 = 0
  getter height : Int32 = 0
  getter visible_view : View

  def initialize(@visible_view : View)
    @views << @visible_view
  end

  def add_view(view : View)
    @views.each(&.visible=(false))
    @views << view
    @visible_view = view
  end

  def remove_view(view : View) : View
    removed_view = @visible_view
    @views.delete(removed_view)
    if @views.empty?
      @parent.try(&.remove_child(self))
    else
      @visible_view = @views.first
      @visible_view.visible = true
    end
    removed_view
  end

  def remove_visible_view : View
    remove_view(@visible_view)
  end

  def each_view_node(&block : Proc(ViewManagerViewNode, Nil)) : Nil
    block.call(self)
  end

  def split(position : SplitPosition, orientation : SplitOrientation) : Nil
    old_parent = @parent
    moved_view = remove_visible_view

    if old_parent && old_parent.orientation == orientation
      old_parent.add_child(position, ViewManagerViewNode.new(moved_view))
    else
      new_parent = ViewManagerSplitNode.new(orientation)
      if old_parent
        old_parent.remove_child(self)
        old_parent.add_child(:start, new_parent)
      end
      new_parent.parent = old_parent
      new_parent.add_child(:start, self)
      new_parent.add_child(position, ViewManagerViewNode.new(moved_view))
    end
  end

  def views_count : Int32
    @views.size
  end

  def enough_views_to_split? : Bool
    @views.size > 1
  end

  def find_node?(view : View) : ViewManagerViewNode?
    return self if @views.includes?(view)
  end

  def show_view(view : View)
    old_view = @visible_view
    old_view.visible = false if old_view
    view.visible = true
    @visible_view = view
  end

  def size_allocate(@x : Int32, @y : Int32, @width : Int32, @height : Int32) : Nil
    @visible_view.size_allocate(x, y, width, height, -1)
  end

  def dump_tree(io : IO)
    io << '"' << self << "\" [label=\""
    @views.map(&.label).join(io, "\n")
    io << "\" shape=box3d]\n"
  end
end
