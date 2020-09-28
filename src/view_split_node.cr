require "./split_node"

class ViewSplitNode < AbstractSplitNode
  @stack = Gtk::Stack.new
  @views_count = 0

  def initialize(parent : AbstractSplitNode)
    super(parent)
    @stack.show_all
  end

  def widget
    @stack
  end

  def add_view(view : View)
    @stack.add_named(view.widget, view.id)
    @stack.visible_child = view.widget
    @views_count += 1
  end

  def remove_view(view : View) : Nil
    view_widget = @stack.child_by_name(view.id)
    if view_widget
      @stack.remove(view_widget)
      @views_count -= 1
    end
  end

  def empty?
    @views_count.zero?
  end

  def reveal_view(view : View) : Bool
    view_widget = @stack.child_by_name(view.id)
    if view_widget
      @stack.visible_child = view_widget
      return true
    end
    false
  end

  def find_node(view : View) : ViewSplitNode?
    return self if @stack.has_child?(view.id)
  end

  def split(view : View)
    width = @stack.allocated_width
    height = @stack.allocated_height
    width >= height ? split(view, :horizontal) : split(view, :vertical)
  end

  def split(view : View, orientation : SplitNode::Orientation)
    parent = self.parent
    parent.replace_child(self) do
      new_view = ViewSplitNode.new(self) # Split node will re-parent this
      new_view.add_view(view)
      SplitNode.new(parent, orientation, self, new_view)
    end
    # parent.child_split(self, new_split)
  end

  def to_s(io : IO)
    io << "View#{@id} (#{@views_count})"
  end

  def dump(io : IO)
  end
end
