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

  class NodeLabelerVisitor < NodeVisitor
    @next_label = 1

    def visit(view_node : ViewNode) : Bool
      view_node.label = @next_label
      @next_label += 1
      true
    end
  end

  class ShowLabelVisitor < NodeVisitor
    def visit(view_node : ViewNode) : Bool
      view_node.show_label
      true
    end
  end

  class HideLabelVisitor < NodeVisitor
    def visit(view_node : ViewNode) : Bool
      view_node.hide_label
      true
    end
  end

  class SaveStateVisitor < NodeVisitor
    def visit(view_node : ViewNode) : Bool
      view_node.save_state
      true
    end
  end

  class RestoreStateVisitor < NodeVisitor
    def visit(view_node : ViewNode) : Bool
      view_node.restore_state
      true
    end
  end
end
