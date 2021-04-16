require "./split_node"

module Split
  class ViewNode < Node
    @stack : Gtk::Stack
    @overlay : Gtk::Overlay
    @gtk_label : Gtk::Label

    getter view_ids = [] of View::Id
    @label = 0

    def initialize(parent : Node)
      super(parent)
      @stack = Gtk::Stack.new
      @overlay = Gtk::Overlay.new
      @overlay.add(@stack)

      @gtk_label = Gtk::Label.new
      @gtk_label.style_context.add_class("split-label")

      @overlay.add_overlay(@gtk_label)
      @overlay.show_all
      @gtk_label.hide
    end

    def label=(@label)
      @gtk_label.text = self.label
    end

    def label : String
      case @label
      when 1 then "➊"
      when 2 then "➋"
      when 3 then "➌"
      when 4 then "➍"
      when 5 then "➎"
      when 6 then "➏"
      when 7 then "➐"
      when 8 then "➑"
      when 9 then "➒"
      else
        @label.to_s
      end
    end

    def widget
      @overlay
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

    def show_label
      @gtk_label.show
    end

    def hide_label
      @gtk_label.hide
    end

    def accept(visitor : NodeVisitor) : Bool
      visitor.visit(self)
    end

    def find_node(view : View) : ViewNode?
      return self if @stack.has_child?(view.id)
    end

    private def calc_orientation : Orientation
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
