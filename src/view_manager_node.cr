require "colorize"

class ViewManagerNode < Adw::Bin
  @paned : Gtk::Paned
  getter stack1 : Gtk::Stack?
  getter stack2 : Gtk::Stack?

  @child1 : ViewManagerNode?
  @child2 : ViewManagerNode?

  @views : Hash(View, Gtk::Stack)

  @placeholder : ViewPlaceHolder?

  private PLACEHOLDER_NAME = "placeholder"

  def initialize
    super()
    @views = Hash(View, Gtk::Stack).new
    @placeholder = placeholder = ViewPlaceHolder.new
    @paned = Gtk::Paned.new
    @stack1 = stack1 = Gtk::Stack.new
    stack1.add_child(placeholder)
    @paned.start_child = stack1
    self.child = @paned
    Log.trace { "Root node: #{@paned}" }
  end

  def initialize(stack1 : Gtk::Stack, stack_views : Hash(View, Gtk::Stack), view : View, orientation : Gtk::Orientation)
    super()

    @views = stack_views
    @stack1 = stack1
    @stack2 = stack2 = Gtk::Stack.new
    @paned = Gtk::Paned.new(orientation: orientation)
    @paned.start_child = stack1
    @paned.end_child = stack2
    stack2.add_child(view)
    @views[view] = stack2

    self.child = @paned
  end

  delegate orientation, to: @paned

  def add_view(view : View, reference_view : View?, new_split : Bool)
    Log.trace { "---- add view #{view}, ref: #{reference_view}, split: #{new_split} ----".colorize.green }
    if reference_view.nil?
      add_first_view(view)
    else
      node = find_node(reference_view)
      raise TijoloError.new if node.nil?

      if new_split
        node.split(view, reference_view)
      else
        node.add_another_view(view, reference_view)
      end
    end
  end

  private def add_first_view(view : View)
    Log.trace { "first view".colorize.magenta }
    stack = @stack1
    raise TijoloError.new if stack.nil?

    add_view_to_stack(view, stack)
  end

  def add_another_view(view : View, reference_view : View)
    Log.trace { "existing stack".colorize.magenta }
    stack = find_view_stack(reference_view)
    add_view_to_stack(view, stack)
  end

  private def add_view_to_stack(view, stack)
    stack.add_child(view)
    @views[view] = stack
  end

  def remove_view(view : View)
    stack = find_view_stack(view)
    stack.remove(view)
    @views.delete(view)

    if @views.empty?
      placeholder = @placeholder
      stack.visible_child = placeholder if placeholder
    end
    # If stack is empty then remove stack from paned
  end

  def show_view(view : View) : Nil
    node = find_node(view)
    stack = node.find_view_stack(view)
    stack.visible_child = view
  end

  def find_view_stack(view : View) : Gtk::Stack
    @views[view]? || raise TijoloError.new("View #{view.label} not found in any stack.")
  end

  def find_node(view : View) : self
    find_node?(view) || raise TijoloError.new("Can't find node for #{view.label}")
  end

  def find_node?(view : View) : self?
    return self if @views.has_key?(view)

    node = @child1.try(&.find_node?(view))
    return node if node

    @child2.try(&.find_node?(view))
  end

  def split(view : View, reference_view : View)
    stack = find_view_stack(reference_view)
    stack1 = @stack1
    stack2 = @stack2
    target_stack = nil

    if stack1.nil? && @child1.nil? && stack == stack2
      Log.trace { "split to stack 1".colorize.magenta }
      @stack1 = stack1 = Gtk::Stack.new
      @paned.start_child = stack1
      target_stack = stack1
    elsif stack2.nil? && @child2.nil? && stack == stack1
      Log.trace { "split to stack 2".colorize.magenta }
      @stack2 = stack2 = Gtk::Stack.new
      @paned.end_child = stack2
      target_stack = stack2
    else
      create_new_node(view, stack)
    end

    if target_stack
      target_stack.add_child(view)
      @views[view] = target_stack
    end
  end

  def create_new_node(view : View, moved_stack : Gtk::Stack) : Nil
    moved_views = Hash(View, Gtk::Stack).new
    @views.reject! do |v, v_stack|
      move_view = v_stack == moved_stack
      moved_views[v] = moved_stack if move_view
      move_view
    end

    # Calculate new node orientation before unparent the stack
    node_orientation = calc_orientation(moved_stack)
    Log.trace { "split to new #{node_orientation} node".colorize.magenta }

    # Remove stack from old Paned
    if moved_stack == @stack1 && @child1.nil?
      @stack1 = @child1 = nil
      @paned.start_child = nil
      target_stack = 1
    elsif moved_stack == @stack2 && @child2.nil?
      @stack2 = @child2 = nil
      @paned.end_child = nil
      target_stack = 2
    end

    # Create new node
    node = ViewManagerNode.new(moved_stack, moved_views, view, node_orientation)

    # Add child node into this node
    if target_stack == 1
      @paned.start_child = node
      @child1 = node
    elsif target_stack == 2
      @paned.end_child = node
      @child2 = node
    end
  end

  private def calc_orientation(widget : Gtk::Widget) : Gtk::Orientation
    Log.trace { "#{widget.allocated_width} x #{widget.allocated_height}" }
    widget.allocated_width >= widget.allocated_height ? Gtk::Orientation::Horizontal : Gtk::Orientation::Vertical
  end

  def to_dot(io : IO)
    io << "#{self} -> (child1) #{@child1}\n" if @child1
    io << "#{self} -> (child2) #{@child2}\n" if @child1
    io << "#{self} -> (stack1) #{@stack1}\n" if @stack1
    io << "#{self} -> (stack2) #{@stack2}\n" if @stack2

    @child1.try(&.to_dot(io))
    @child2.try(&.to_dot(io))
  end
end
