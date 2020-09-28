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
  # the block given must return the new replacement child.
  def replace_child(child : AbstractSplitNode)
    yield
  end

  abstract def dump(io : IO)
end
