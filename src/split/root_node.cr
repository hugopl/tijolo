require "./view_node"
require "../view_place_holder"

module Split
  # Split views are organized in a b-tree structure where the leaves are the node views and all other nodes
  # are split nodes, that split the view. An Exception is for root node, that take care of the special case
  # where there's no split views and works like a facade for the node operations.
  class RootNode < Node
    NO_VIEW_WIDGET_NAME = "no-view"

    @child : Node?
    # Node where the maximized view comes from, need it to put the view back on it on unmaximize.
    @maximized_node : ViewNode?
    # Current selected view, this should be nil only if @child is nil
    @current_view : View?
    # This stack has only 2 faces... a widget to be show when there's no editors open and a widget tree of open editors.
    @stack : Gtk::Stack
    property current_view : View?

    def initialize(@stack)
      create_empty_view
      super(self)
    end

    def widget : Gtk::Widget
      @stack
    end

    def has_split? : Bool
      child = @child
      !child.nil? && child.is_a?(SplitNode)
    end

    def add_view(view : View, reference : View?, split_view : Bool, orientation : Orientation? = nil)
      unmaximize_view if maximized?

      if @child.nil?
        add_first_view(view)
        return
      end

      view_node = find_node(reference) if reference
      if view_node.nil?
        Log.error { "Error finding a node to insert view (#{view})." }
        return
      end

      if split_view
        view_node.split(view, orientation)
      else
        view_node.add_view(view)
      end
      self.current_view = view
    ensure
      relabel_views
    end

    private def add_first_view(view : View)
      @child = child = ViewNode.new(self)
      self.current_view = view
      child.add_view(view)
      @stack.add_child(child.widget)
      @stack.visible_child = child.widget
      @current_view = view
    end

    def replace_child(child : Node)
      @stack.remove(child.widget)
      @child = new_child = yield
      if new_child.nil?
        show_welcome_msg
      else
        new_child.parent = self
        @stack.add_child(new_child.widget)
        @stack.visible_child = new_child.widget
      end
    end

    private def destroy_node(node : ViewNode)
      parent = node.parent
      if parent == self # Just a single view is present, just remove itself and let root show welcome_screen.
        parent.replace_child(node) { nil }
      elsif parent.is_a?(SplitNode) # Some split is present
        node.parent.parent.replace_child(parent) do
          replacement = node == parent.child1 ? parent.child2 : parent.child1
          parent.replace_child(node) { nil }
          parent.replace_child(replacement) { nil }
          replacement
        end
      end
    end

    def current_node : ViewNode?
      current_view = @current_view
      return find_node(current_view) if current_view
    end

    def accept(visitor : NodeVisitor) : Bool
      visitor.visit(self)
      child = @child
      child ? child.accept(visitor) : false
    end

    def find_node(view : View) : ViewNode?
      view_node = @child.not_nil!.find_node(view)
      Log.warn { "Unable to find view for #{view} on split nodes." } if view_node.nil?
      view_node
    end

    private def relabel_views : Nil
      child = @child
      child.accept(NodeLabelerVisitor.new) if child
    end

    def split_label(view : View) : String
      node = find_node(view)
      node.nil? ? "" : node.label
    end

    def save_state
      child = @child
      child.accept(SaveStateVisitor.new) if child
    end

    def restore_state
      child = @child
      child.accept(RestoreStateVisitor.new) if child
    end

    def show_split_labels
      return unless has_split?

      child = @child
      child.accept(ShowLabelVisitor.new) if child
    end

    def hide_split_labels
      child = @child
      child.accept(HideLabelVisitor.new) if child
    end

    def reveal_view(view : View) : Nil
      unmaximize_view if maximized? && view != @current_view
      view_node = find_node(view)
      return if view_node.nil?

      view_node.reveal_view(view)
      self.current_view = view
    end

    def remove_view(view) : Nil
      unmaximize_view if maximized?

      view_node = find_node(view)
      return if view_node.nil?

      view_node.remove_view(view)
      destroy_node(view_node) if view_node.empty?
      @current_view = nil if view == @current_view
      relabel_views
    end

    def current_view=(view : View)
      return if view == @current_view

      @current_view.try(&.unselect)
      @current_view = view
      view.select
    end

    def upper_split(reference : View) : ViewNode?
      navigate(reference, 1, :vertical)
    end

    def right_split(reference : View) : ViewNode?
      navigate(reference, 2, :horizontal)
    end

    def lower_split(reference : View) : ViewNode?
      navigate(reference, 2, :vertical)
    end

    def left_split(reference : View) : ViewNode?
      navigate(reference, 1, :horizontal)
    end

    # This works this way:
    #
    # 1. Climb (or down?) the tree, i.e. go from the leaf you are in the root direction.
    # 2. During the climb, save if you went through child 1 or 2 and save this on horizontal_origin/vertical_origin
    # 3. If find a split node with the same orientation:
    # 3.1 Keep climbing if the `child_to_go` is the same as horizontal_origin/vertical_origin.
    # 3.2 Stop climbing otherwise
    # 4.0 Down the tree through the `child_to_go` node.
    # 4.1 If you find a split node, down through horizontal_origin/vertical_origin node depending on the split orientation.
    # 5.0 Stop at the leaf node you want ☺️
    private def navigate(reference : View, child_to_go : Int32, orientation : Orientation) : ViewNode?
      unmaximize_view if maximized?
      node = find_node(reference)
      return if node.nil?

      horizontal_origin = 0
      vertical_origin = 0

      # Climb the tree
      previous = node
      current = node.parent.as?(SplitNode)
      loop do
        # Reached the root and nothing can be done.
        return if current.nil?

        if current.horizontal?
          horizontal_origin = previous == current.child1 ? 1 : 2
        else
          vertical_origin = previous == current.child1 ? 1 : 2
        end

        if current.orientation == orientation
          origin = previous == current.child1 ? 1 : 2
          break if origin != child_to_go
        end
        previous = current
        current = current.parent.as?(SplitNode)
      end

      # On top
      return if current.nil?
      return if orientation.horizontal? && child_to_go == horizontal_origin
      return if orientation.vertical? && child_to_go == vertical_origin
      current = child_to_go == 1 ? current.child1 : current.child2

      # Down the tree
      loop do
        if current.is_a?(ViewNode)
          return current
        elsif current.is_a?(SplitNode)
          child_to_go = current.horizontal? ? horizontal_origin : vertical_origin
          current = child_to_go == 1 ? current.child1 : current.child2
        end
      end
      nil
    end

    def maximized? : Bool
      !@maximized_node.nil?
    end

    def maximize_view : Nil
      view = @current_view
      return if view.nil?

      node = find_node(view)
      return if node.nil? || node.parent == self # return if screen isn't being split

      @maximized_node = node
      node.remove_view(view)
      @stack.add_named(view, view.id)
      @stack.visible_child = view
      view.maximized = true
    end

    def unmaximize_view : Nil
      view = @current_view
      maximized_node = @maximized_node
      return if view.nil? || maximized_node.nil?

      view_widget = @stack.child_by_name(view.id)
      @stack.remove(view_widget) if view_widget
      maximized_node.add_view(view)
      @maximized_node = nil
      view.maximized = false

      @stack.visible_child = @child.not_nil!.widget
    end

    private def create_empty_view : Nil
      @stack.add_named(ViewPlaceHolder.new, NO_VIEW_WIDGET_NAME)
      show_welcome_msg
    end

    private def show_welcome_msg
      @stack.visible_child_name = NO_VIEW_WIDGET_NAME
    end

    def dump
      String.build { |str| dump(str) }
    end

    def dump(io : IO) : Nil
      child = @child
      io << "root -> #{child}\n"
      child.dump(io) if child
    end

    # Save a root.png with split views tree, only for debugging
    def to_dot
      fp = File.new("/tmp/root.dot", "w")
      fp << "digraph \"\" {\n"
      dump(fp)
      fp << "}\n"
      fp.close
      `dot -Tpng /tmp/root.dot > root.png`
    end
  end
end
