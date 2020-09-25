abstract class AbstractSplitNode
  property parent : AbstractSplitNode

  # ID for testing purporses.
  @id : Int32
  @@id = 0

  def initialize(@parent)
    @id = @@id += 1
  end

  def root?
    false
  end

  # called by the child on father when it split
  def replace_child(child : AbstractSplitNode)
    yield
  end

  # Called by the child when the last view on it was closed.
  abstract def destroy_child(child : AbstractSplitNode)

  abstract def dump(io : IO)
end
