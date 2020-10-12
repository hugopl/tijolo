module Split
  enum Orientation
    Horizontal
    Vertical
  end

  abstract class Node
    property parent : Node

    # ID for testing purporses.
    @id : Int32
    @@id = 0

    def initialize(@parent)
      @id = @@id += 1
    end

    # This is used on tests
    def self.reset_node_count
      @@id = 0
    end

    # called by the child on father when it split
    # the block given must return the new replacement child.
    def replace_child(child : Node)
      yield
    end

    abstract def dump(io : IO) : Nil
  end
end
