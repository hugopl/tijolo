require "colorize"

class ViewManagerNode < Adw::Bin
  @paned : Gtk::Paned
  @stack1 : Gtk::Stack
  @stack2 : Gtk::Stack?
  @place_holder : Gtk::Widget?

  @views = [] of View
  @previous_view : View?

  def initialize(place_holder : Gtk::Widget? = nil)
    super()

    @place_holder = place_holder
    @paned = Gtk::Paned.new
    @stack1 = Gtk::Stack.new

    @stack1.add_child(place_holder) if place_holder
    @paned.start_child = @stack1
    self.child = @paned
  end

  def add_view(view : View, reference_view : View?, new_split : Bool)
    Log.trace { "#{"add_view".colorize.green}(#{view.label.inspect}, ref: #{reference_view.try &.label}, new_split: #{new_split})" }

    if reference_view.nil? # First view
      Log.trace { "first view".colorize.magenta }
      @stack1.add_child(view)
    elsif !new_split # New view on an existing stack
      Log.trace { "existing stack".colorize.magenta }
      find_view_stack(reference_view).add_child(view)
    else # New stack or node must be created
      Log.trace { "NEW stack".colorize.red }
      split_view(reference_view, with: view)
    end
    @views << view
    show_view(view)
  end

  def remove_view(view : View)
    @stack1.remove(view)
    @views.delete(view)
    place_holder = @place_holder
    @stack1.visible_child = place_holder if place_holder && @views.empty?
  end

  def show_view(view : View) : Nil
    @previous_view.try(&.unselect)

    stack = find_view_stack?(view)
    stack.visible_child = view if stack
    view.select
    @previous_view = view
  end

  private def find_view_stack(view : View) : Gtk::Stack
    find_view_stack?(view) || raise TijoloError.new
  end

  private def find_view_stack?(view : View) : Gtk::Stack?
    return @stack1 if @stack1.has_child?(view)

    stack2 = @stack2
    return stack2 if stack2 && stack2.has_child?(view)
  end

  private def split_view(ref_view, *, with view : View)
    stack2 = @stack2
    if stack2
      raise TijoloError.new "Not implemented yet 😉️"
    else
      @stack2 = stack2 = Gtk::Stack.new
      stack2.add_child(view)
      @paned.end_child = @stack2
    end
  end
end
