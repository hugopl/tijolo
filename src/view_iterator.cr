class ViewIterator
  include Iterator(View)

  @current_node : ViewManagerNode?
  @current_pos_in_view_node = 0

  def initialize(@current_node : ViewManagerNode?)
  end

  def next
    current_node = @current_node
    return stop if current_node.nil?
    if current_node.nil?
      stop
    elsif current_node.is_a?(ViewManagerViewNode)
      if @current_pos_in_view_node < current_node.views_count
        view = current_node.view(@current_pos_in_view_node)
        @current_pos_in_view_node += 1
        view
      else
        @current_pos_in_view_node = 0
        @current_node = nil
        down_into_sibling_or_go_up_tree(current_node)
        self.next
      end
    elsif current_node.is_a?(ViewManagerSplitNode)
      @current_pos_in_view_node = 0
      @current_node = current_node.first_view_node
      self.next
    else
      stop
    end
  end

  private def down_into_sibling_or_go_up_tree(node : ViewManagerNode)
    parent = node.parent
    return if parent.nil?

    node_idx = parent.child_index(node)
    node_idx += 1 # we want the next one!
    if node_idx >= parent.child_count
      down_into_sibling_or_go_up_tree(parent)
    else
      # Down the tree in the sibling
      @current_node = parent.child(node_idx).first_view_node
    end
  end
end
