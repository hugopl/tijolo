module Split
  abstract class NodeVisitor
    def visit(view_node : RootNode) : Bool
      true
    end

    def visit(view_node : ViewNode) : Bool
      true
    end

    def visit(split_node : SplitNode) : Bool
      true
    end
  end
end
