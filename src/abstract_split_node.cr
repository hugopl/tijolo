abstract class AbstractSplitNode
  property parent : AbstractSplitNode

  def initialize(@parent)
  end

  def root?
    false
  end

  # Returns true if the view was found and revealed in this node, false otherwise
  abstract def reveal_view(view : View) : Bool
  abstract def remove_view(view : View) : Bool
  abstract def destroy_child(child : AbstractSplitNode)
end
