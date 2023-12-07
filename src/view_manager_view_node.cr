class ViewManagerViewNode < ViewManagerNode
  getter x : Int32 = 0
  getter y : Int32 = 0
  getter width : Int32 = 0
  getter height : Int32 = 0
  getter visible_view : View

  @views = [] of View
  getter last_used : Time::Span

  def initialize(view : View)
    super()
    @visible_view = view
    @last_used = Time.monotonic
    add_view(view)
  end

  def add_view(view : View)
    @views.unshift(view)
    items_changed(0, 0, 1)
    set_visible_view(view)
    @last_used = Time.monotonic
  end

  def remove_view(view : View) : View
    removed_view_idx = @views.index(view)
    raise ArgumentError.new("Tried to remove a unexisting view") if removed_view_idx.nil?

    @views.delete(view)
    items_changed(removed_view_idx, 1, 0)
    if @views.empty?
      @parent.try(&.remove_child(self))
    elsif view == @visible_view
      show_view(@views.first, true)
    end

    view
  end

  def remove_visible_view : View
    remove_view(@visible_view)
  end

  def each_view_node(&block : Proc(ViewManagerViewNode, Nil)) : Nil
    block.call(self)
  end

  def split(position : SplitPosition, orientation : SplitOrientation) : ViewManagerViewNode
    old_parent = @parent
    moved_view = remove_visible_view

    if old_parent && old_parent.orientation == orientation
      idx = old_parent.index(self).not_nil!
      idx += 1 if position.end?
      new_node = ViewManagerViewNode.new(moved_view)
      old_parent.add_child(idx, new_node)
    else
      new_parent = ViewManagerSplitNode.new(orientation)
      if old_parent
        old_parent.remove_child(self)
        old_parent.add_child(0, new_parent)
      end
      new_parent.parent = old_parent
      new_parent.add_child(0, self)
      new_node = ViewManagerViewNode.new(moved_view)
      new_parent.add_child(position, new_node)
    end
    new_node
  end

  def views_count : Int32
    @views.size
  end

  def view(pos) : View
    @views[pos]
  end

  def enough_views_to_split? : Bool
    @views.size > 1
  end

  def first_view_node : ViewManagerViewNode
    self
  end

  def find_node?(view : View) : ViewManagerViewNode?
    return self if @views.includes?(view)
  end

  def show_view(view : View, reorder : Bool) : Nil
    set_visible_view(view)
    return unless reorder

    @last_used = Time.monotonic
    view_index = @views.index(view)
    if view_index
      @views.unshift(@views.delete_at(view_index))
      items_changed(0, view_index + 1, view_index + 1)
    end
  end

  private def set_visible_view(view)
    old_view = @visible_view
    old_view.visible = false if old_view
    view.visible = true
    @visible_view = view
  end

  def size_allocate(@x : Int32, @y : Int32, @width : Int32, @height : Int32, selected_view : View?) : {Int32, Int32}
    @visible_view.size_allocate(x, y, width, height, -1)
    @visible_view == selected_view ? {x, y} : {-1, -1}
  end

  @[GObject::Virtual]
  def get_n_items : UInt32
    @views.size.to_u32
  end

  @[GObject::Virtual]
  def get_item(pos : UInt32) : GObject::Object?
    @views[pos]?
  end

  @[GObject::Virtual]
  def get_item_type : UInt64
    View.g_type
  end

  def dump_dot(io : IO)
    io << '"' << self << "\" [label=\""
    @views.map(&.label).join(io, "\n")
    io << "\" shape=box3d]\n"
  end

  def dump(io : IO, current_node : ViewManagerNode? = nil)
    io << '*' if current_node == self
    io << '('
    @views.map(&.label).join(io, ", ")
    io << ')'
  end
end
