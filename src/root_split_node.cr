require "./abstract_split_node"
require "./view_split_node"

class RootSplitNode < AbstractSplitNode
  include UiBuilderHelper
  include ViewListener

  NO_VIEW_WIDGET_NAME = "no-view"

  @child : AbstractSplitNode?
  @current_view : View?
  # This stack has only 2 faces... a widget to be show when there's no editors open and a widget tree of open editors.
  @stack : Gtk::Stack
  getter current_view : View?

  def initialize
    @stack = Gtk::Stack.new
    create_empty_view
    super(self)
    @stack.show_all
  end

  def widget
    @stack
  end

  def root?
    true
  end

  def add_view(view : View, split_view : Bool = false)
    child = @child
    if child.nil?
      @child = child = ViewSplitNode.new(self)
      @stack.add_named(child.widget, "editors")
      @stack.visible_child = child.widget
    end
    child.add_view(view)
    view.add_view_listener(self)
  end

  def reveal_view(view) : Bool
    child = @child
    child ? child.reveal_view(view) : false
  end

  def remove_view(view) : Bool
    child = @child
    if child
      @current_view = nil if view == @current_view
      view.remove_view_listener(self)
      return child.remove_view(view)
    end
    false
  end

  def destroy_child(child : AbstractSplitNode)
    raise "Ooops" if child != @child

    @child = nil
    @stack.remove(child.widget)
    show_welcome_msg
  end

  def view_focused(view : View)
    @current_view = view
  end

  private def create_empty_view : Nil
    builder = builder_for("no_view")
    # FIXME: Use the shortcuts from config file
    Gtk::Label.cast(builder["welcome_label"]).label = <<-EOT
      <b>Code Navigation</b><span foreground="#DCDCD1">
      Ctrl + P         —  Show locator
      F2               —  Go to definition
      Ctrl + G         —  Go to line/column
      Alt + Shift + ←  —  Go back
      Alt + Shift + →  —  Go forward
      </span>
      <b>Editting</b><span foreground="#DCDCD1">
      Ctrl + F  —  Find text
      F3        —  Find next text match
      F9        —  Sort lines
      Ctrl + /  —  Comment code
      Ctrl + .  —  Insert emoji 💣️
      </span>
      <b>Project</b><span foreground="#DCDCD1">
      Ctrl + N  —  New file
      Ctrl + O  —  Open non-project file
      Ctrl + W  —  Close view
      Alt  + G  —  Open Git locator
      </span>
    EOT
    widget = Gtk::Widget.cast(builder["root"])
    @stack.add_named(widget, NO_VIEW_WIDGET_NAME)
    show_welcome_msg
  end

  private def show_welcome_msg
    @stack.visible_child_name = NO_VIEW_WIDGET_NAME
  end
end
