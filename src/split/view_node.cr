require "./split_node"

module Split
  class ViewNode < Node
    @stack = Gtk::Stack.new
    getter view_ids = [] of View::Id

    def initialize(parent : Node)
      super(parent)
      @stack.show_all
    end

    def widget
      @stack
    end

    def visible_view_id : View::Id?
      @stack.visible_child_name
    end

    def add_view(view : View)
      @stack.add_named(view.widget, view.id)
      @stack.visible_child = view.widget
      @view_ids << view.id
    end

    def remove_view(view : View) : Nil
      view_widget = @stack.child_by_name(view.id)
      if view_widget
        @stack.remove(view_widget)
        @view_ids.delete(view.id)
      end
    end

    delegate empty?, to: @view_ids

    def reveal_view(view : View) : Nil
      view_widget = @stack.child_by_name(view.id)
      if view_widget
        @stack.visible_child = view_widget
      else
        Log.error { "View not found on view node: #{view.label}" }
      end
    end

    def find_node(view : View) : ViewNode?
      return self if @stack.has_child?(view.id)
    end

    def calc_orientation : Orientation
      width = @stack.allocated_width
      height = @stack.allocated_height
      width >= height ? Orientation::Horizontal : Orientation::Vertical
    end

    def split(view : View, orientation : Orientation?)
      orientation ||= calc_orientation
      parent = self.parent
      parent.replace_child(self) do
        new_view = ViewNode.new(self) # Split node will re-parent this
        new_view.add_view(view)
        SplitNode.new(parent, orientation, self, new_view)
      end
    end

    def to_s(io : IO)
      io << "\"View#{@id} (#{@view_ids.size})\""
    end

    def dump(io : IO) : Nil
    end
  end
end
