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

  def remove_view(view : View) : Bool
    view_widget = @stack.child_by_name(view.id)
    if view_widget
      @stack.remove(view_widget)
      @views_count -= 1
      parent.destroy_child(self) if @views_count.zero?
      return true
    end
    false
  end

  def destroy_child(child : AbstractSplitNode)
  end

  def reveal_view(view : View) : Bool
    view_widget = @stack.child_by_name(view.id)
    if view_widget
      @stack.visible_child = view_widget
      return true
    end
    false
  end
end
