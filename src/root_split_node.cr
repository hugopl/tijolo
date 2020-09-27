require "./abstract_split_node"
require "./view_split_node"

class RootSplitNode < AbstractSplitNode
  include UiBuilderHelper

  NO_VIEW_WIDGET_NAME = "no-view"

  @child : AbstractSplitNode?
  # Current selected view, this should be nil only if @child is nil
  @current_view : View?
  # This stack has only 2 faces... a widget to be show when there's no editors open and a widget tree of open editors.
  @stack : Gtk::Stack
  property current_view : View?

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

  def add_view(view : View, split_view : Bool)
    if @child.nil?
      add_first_view(view)
      return
    end

    view_node = find_current_node
    return if view_node.nil?

    if split_view
      view_node.split(view)
    else
      view_node.add_view(view)
    end
    self.current_view = view
    Log.info { "\n#{dump}" }
  end

  private def add_first_view(view : View)
    @child = child = ViewSplitNode.new(self)
    self.current_view = view
    child.add_view(view)
    @stack.add(child.widget)
    @stack.visible_child = child.widget
    @current_view = view
  end

  def replace_child(child : AbstractSplitNode)
    @stack.remove(child.widget)
    @child = nil
    @child = new_child = yield
    @stack.add(new_child.widget)
    @stack.visible_child = new_child.widget
  end

  private def find_current_node : ViewSplitNode?
    current_view = @current_view
    if current_view
      find_node(current_view)
    else
      Log.warn { "There's no selected view to find the current split node." }
      nil
    end
  end

  def find_node(view : View) : ViewSplitNode?
    view_node = @child.not_nil!.find_node(view)
    Log.warn { "Unable to find view for #{view.label} on split nodes." } if view_node.nil?
    view_node
  end

  def reveal_view(view) : Bool
    view_node = find_node(view)
    view_node ? view_node.reveal_view(view) : false
  end

  def remove_view(view) : Nil
    view_node = find_node(view)
    return if view_node.nil?

    view_node.remove_view(view)
    @current_view = nil if view == @current_view
  end

  def destroy_child(child : AbstractSplitNode)
    raise AppError.new("You found a bug, be welcome!") if child != @child

    @child = nil
    @stack.remove(child.widget)
    show_welcome_msg
  end

  def current_view=(view : View)
    return if view == @current_view

    @current_view.try(&.selected=(false))
    @current_view = view
    view.selected = true
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

  def dump
    String.build { |str| dump(str) }
  end

  def dump(io : IO)
    child = @child
    io << "root -> #{child}\n"
    child.dump(io) if child
  end
end
