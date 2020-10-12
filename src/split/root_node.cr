require "./view_node"

module Split
  # Split views are organized in a b-tree structure where the leaves are the node views and all other nodes
  # are split nodes, that split the view. An Exception is for root node, that take care of the special case
  # where there's no split views and works like a facade for the node operations.
  class RootNode < Node
    include UiBuilderHelper

    NO_VIEW_WIDGET_NAME = "no-view"

    @child : Node?
    # Current selected view, this should be nil only if @child is nil
    @current_view : View?
    # This stack has only 2 faces... a widget to be show when there's no editors open and a widget tree of open editors.
    @stack : Gtk::Stack
    property current_view : View?

    def initialize
      @stack = Gtk::Stack.new
      create_empty_view
      super(self)
      @stack.show_all
    end

    def widget
      @stack
    end

    def add_view(view : View, split_view : Bool, orientation : Orientation? = nil)
      if @child.nil?
        add_first_view(view)
        return
      end

      view_node = find_current_node
      return if view_node.nil?

      if split_view
        view_node.split(view, orientation)
      else
        view_node.add_view(view)
      end
      self.current_view = view
      Log.trace { "\n#{dump}" }
    end

    private def add_first_view(view : View)
      @child = child = ViewNode.new(self)
      self.current_view = view
      child.add_view(view)
      @stack.add(child.widget)
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
        @stack.add(new_child.widget)
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
      Log.trace { "\n#{dump}" }
    end

    private def find_current_node : ViewNode?
      current_view = @current_view
      if current_view
        find_node(current_view)
      else
        Log.warn { "There's no selected view to find the current split node." }
        nil
      end
    end

    def find_node(view : View) : ViewNode?
      view_node = @child.not_nil!.find_node(view)
      Log.warn { "Unable to find view for #{view.label} on split nodes." } if view_node.nil?
      view_node
    end

    def reveal_view(view : View) : Nil
      view_node = find_node(view)
      return if view_node.nil?

      Log.trace { "root.reveal_view(#{view.label.inspect}" }
      view_node.reveal_view(view)
      self.current_view = view
    end

    def remove_view(view) : Nil
      view_node = find_node(view)
      return if view_node.nil?

      view_node.remove_view(view)
      destroy_node(view_node) if view_node.empty?
      @current_view = nil if view == @current_view
    end

    def current_view=(view : View)
      Log.trace { "root.current_view=(#{view.label.inspect})  - same? #{view == @current_view}" }
      return if view == @current_view

      @current_view.try(&.selected=(false))
      @current_view = view
      view.selected = true
    end

    def upper_split : ViewNode?
      navigate(1, :vertical)
    end

    def right_split : ViewNode?
      navigate(2, :horizontal)
    end

    def lower_split : ViewNode?
      navigate(2, :vertical)
    end

    def left_split : ViewNode?
      navigate(1, :horizontal)
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
    private def navigate(child_to_go : Int32, orientation : Orientation) : ViewNode?
      node = find_current_node
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

    private def create_empty_view : Nil
      builder = builder_for("no_view")
      # FIXME: Use the shortcuts from config file
      Gtk::Label.cast(builder["welcome_label"]).label = <<-EOT
      <b>Code Navigation</b>                                          <b>Editing</b><span foreground="#DCDCD1">
      Ctrl + P           —  Show locator                       Ctrl + F  —  Find text
      F2                 —  Go to definition                   F3        —  Find next text match
      Ctrl + G           —  Go to line/colum                   F9        —  Sort lines
      Alt + Shift + ←/→  —  Go back/forward                    Ctrl + /  —  Comment code
                                                               Ctrl + .  —  Insert emoji 💣️</span>

      <b>Split View</b>                                               <b>Project</b><span foreground="#DCDCD1">
      Alt + ↑/→/←/↓      —  Focus editor in that direction     Ctrl + N  —  New file
                                                               Ctrl + O  —  Open non-project file
      Press Shift on any action that could open a file e.g.    Ctrl + W  —  Close view
      <i>Ctrl + Shift + P</i> and the file will be open in a new      Alt  + G  —  Open Git locator
      split view.
      </span>
    EOT
      widget = Gtk::Widget.cast(builder["root"])
      @stack.add_named(widget, NO_VIEW_WIDGET_NAME)
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
