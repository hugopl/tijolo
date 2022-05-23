require "./node"

module Split
  class SplitNode < Node
    getter orientation : Orientation
    property child1 : Node
    property child2 : Node
    @paned : Gtk::Paned

    delegate horizontal?, to: @orientation
    delegate vertical?, to: @orientation

    def initialize(parent, @orientation, @child1, @child2)
      super(parent)

      @paned = Gtk::Paned.new(@orientation.vertical? ? Gtk::Orientation::Vertical : Gtk::Orientation::Horizontal)
      @paned.start_child = @child1.widget
      @paned.end_child = @child2.widget
      @child1.parent = self
      @child2.parent = self

      position = if @orientation.vertical?
                   parent.widget.allocated_height // 2
                 else
                   parent.widget.allocated_width // 2
                 end
      @paned.position = position
    end

    def widget : Gtk::Widget
      @paned
    end

    def replace_child(child : Node)
      not_ported!
#       @paned.remove(child.widget)
#       new_child = yield
#       return if new_child.nil?
#
#       new_child.parent = self
#       if @child1 == child
#         @child1 = new_child
#         @paned.pack1(new_child.widget, true, true)
#       else
#         @child2 = new_child
#         @paned.pack2(new_child.widget, true, true)
#       end
    end

    def accept(visitor : NodeVisitor) : Bool
      return false unless visitor.visit(self)
      @child1.accept(visitor) && @child2.accept(visitor)
    end

    def find_node(view : View) : ViewNode?
      @child1.find_node(view) || @child2.find_node(view)
    end

    def to_s(io : IO)
      io << (@orientation.vertical? ? "Vsplit#{@id}" : "Hsplit#{@id}")
    end

    def dump(io : IO) : Nil
      io << "#{self} -> #{@child1}\n"
      io << "#{self} -> #{@child2}\n"
      @child1.dump(io)
      @child2.dump(io)
    end
  end
end
