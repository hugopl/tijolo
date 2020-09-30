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
    Log.trace { "\n#{dump}" }
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
    @child = new_child = yield
    if new_child.nil?
      show_welcome_msg
    else
      new_child.parent = self
      @stack.add(new_child.widget)
      @stack.visible_child = new_child.widget
    end
  end

  private def destroy_node(node : ViewSplitNode)
    parent = node.parent
    if parent.root? # Just a single view is present, just remove itself and let root show welcome_screen.
      parent.replace_child(node) { nil }
    elsif parent.is_a?(SplitNode) # Some split is present
      node.parent.parent.replace_child(parent) do
        replacement = node == parent.child1 ? parent.child2 : parent.child1
        parent.replace_child(node) { nil }
        parent.replace_child(replacement) { nil }
        replacement
      end
    end
    Log.trace { "\n#{dump}" }
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

  def reveal_view(view : View, definitive : Bool) : Nil
    view_node = find_node(view)
    return if view_node.nil?

    view_node.reveal_view(view)
    self.current_view = view
    view.grab_focus if definitive
  end

  def remove_view(view) : Nil
    view_node = find_node(view)
    return if view_node.nil?

    view_node.remove_view(view)
    destroy_node(view_node) if view_node.empty?
    @current_view = nil if view == @current_view
  end

  def current_view=(view : View)
    return if view == @current_view

    Log.trace { "current_view: #{view.file_path}" }
    @current_view.try(&.selected=(false))
    @current_view = view
    view.selected = true
  end

  private def create_empty_view : Nil
    builder = builder_for("no_view")
    # FIXME: Use the shortcuts from config file
    Gtk::Label.cast(builder["welcome_label"]).label = <<-EOT
      <b>Code Navigation</b>                                          <b>Editting</b><span foreground="#DCDCD1">
      Ctrl + P           —  Show locator                       Ctrl + F  —  Find text
      F2                 —  Go to definition                   F3        —  Find next text match
      Ctrl + G           —  Go to line/colum                   F9        —  Sort lines
      Alt + Shift + ←/→  —  Go back/forward                    Ctrl + /  —  Comment code
                                                               Ctrl + .  —  Insert emoji 💣️</span>

      <b>Split View</b>                                               <b>Project</b><span foreground="#DCDCD1">
      Alt + ↑/→/←/↓      —  Focus editor in that direction     Ctrl + N  —  New file
                                                               Ctrl + O  —  Open non-project file
      Press Shift on any action that could open a file e.g.    Ctrl + W  —  Close view
      <i>Ctrl + Shift + P</i> and the file will be open in a new      Alt  + G  —  Open Git locator
      split view.
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
