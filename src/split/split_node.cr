require "./node"

module Split
  class SplitNode < Node
    @orientation : Orientation
    property child1 : Node
    property child2 : Node
    @paned : Gtk::Paned

    def initialize(parent, @orientation, @child1, @child2)
      super(parent)

      @paned = Gtk::Paned.new(@orientation.vertical? ? Gtk::Orientation::VERTICAL : Gtk::Orientation::HORIZONTAL)
      @paned.show_all
      @child1.parent = self
      @child2.parent = self
      @paned.pack1(@child1.widget, true, true)
      @paned.pack2(@child2.widget, true, true)

      position = if @orientation.vertical?
                   parent.widget.allocated_height // 2
                 else
                   parent.widget.allocated_width // 2
                 end
      @paned.position = position
    end

    def widget
      @paned
    end

    def replace_child(child : Node)
      @paned.remove(child.widget)
      new_child = yield
      return if new_child.nil?

      new_child.parent = self
      if @child1 == child
        @child1 = new_child
        @paned.pack1(new_child.widget, true, true)
      else
        @child2 = new_child
        @paned.pack2(new_child.widget, true, true)
      end
    end

    def find_node(view : View) : ViewNode?
      @child1.find_node(view) || @child2.find_node(view)
    end

    def to_s(io : IO)
      io << (@orientation.vertical? ? "Vsplit#{@id}" : "Hsplit#{@id}")
    end

    def dump(io : IO)
      io << "#{self} -> #{@child1}\n"
      io << "#{self} -> #{@child2}\n"
      @child1.dump(io)
      @child2.dump(io)
    end
  end
end
