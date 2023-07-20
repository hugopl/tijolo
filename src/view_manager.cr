require "./view"
require "./view_manager_layout"
require "./view_manager_node"
require "./view_manager_view_node"
require "./view_manager_split_node"
require "./view_place_holder"

@[Gtk::UiTemplate(file: "#{__DIR__}/ui/view_manager.ui", children: %w())]
class ViewManager < Gtk::Widget
  include Gtk::WidgetTemplate

  # List of view in Ctrl+Tab menu
  getter views = [] of View
  # Current selected view in Ctrl+Tab menu
  getter selected_view_index = 0
  private getter! root : ViewManagerNode?
  getter place_holder = ViewPlaceHolder.new

  @rotating_views = false
  @selected_view : View?

  @layout = ViewManagerLayout.new

  def initialize
    super(css_name: "view_manager")
    @place_holder.parent = self
    self.layout_manager = @layout
    setup_actions
  end

  delegate empty?, to: @views
  delegate any?, to: @views

  def root?
    @root
  end

  private def setup_actions
    group = Gio::SimpleActionGroup.new
    {% for direction in %w(top right bottom left) %}
      {% for action in %w(split_ focus_) %}
      action = Gio::SimpleAction.new({{ action + direction }}, nil)
      action.activate_signal.connect { {{ (action + direction).id }} }
      group.add_action(action)
      {% end %}
    {% end %}
    insert_action_group("view", group)
  end

  private def current_node : ViewManagerNode?
    root = @root
    return if root.nil?

    view = current_view
    raise TijoloError.new("current_view empty with a root node!?") if view.nil?

    node = root.find_node(view)
    raise TijoloError.new("Failed to find current node for view #{view}") if node.nil?
    node
  end

  def add_view(view : View) : Nil
    @place_holder.visible = false
    view.parent = self

    node = current_node
    if node.nil?
      @root = ViewManagerViewNode.new(view)
    else
      node.add_view(view)
    end
    @views.unshift(view)
    focus_view(view)
  end

  private def split_top
    split(:start, :vertical)
  end

  private def split_right
    split(:end, :horizontal)
  end

  private def split_bottom
    split(:end, :vertical)
  end

  private def split_left
    split(:start, :horizontal)
  end

  private def split(position : ViewManagerSplitNode::SplitPosition,
                    orientation : ViewManagerSplitNode::SplitOrientation)
    node = current_node
    return if node.nil? || !node.enough_views_to_split?

    replace_root = (node == @root)
    node.split(position, orientation)
    @root = node.parent if replace_root
  end

  private def focus_top
    Log.info { "focus top" }
  end

  private def focus_right
    node = current_node
    return if node.nil?

    limit = node.x + node.width
    root = @root
    node_to_focus : ViewManagerViewNode? = nil
    if root.is_a?(ViewManagerSplitNode)
      root.each_view_node do |node|
        next if node.x < limit

        if node_to_focus.nil?
          node_to_focus = node
        else
          node_to_focus = node if node.x < node_to_focus.not_nil!.x
        end
      end
    end
    focus_view(node_to_focus.not_nil!.visible_view) if node_to_focus
  end

  private def focus_bottom
    Log.info { "focus bottom" }
  end

  private def focus_left
    node = current_node
    return if node.nil?

    limit = node.x
    root = @root
    node_to_focus = nil
    if root.is_a?(ViewManagerSplitNode)
      root.each_view_node do |node|
        next if (node.x + node.width) > limit

        if node_to_focus.nil?
          node_to_focus = node
        else
          node_to_focus = node if (node.x + node.width) > (node_to_focus.not_nil!.x + node_to_focus.not_nil!.width)
        end
      end
    end
    focus_view(node_to_focus.not_nil!.visible_view) if node_to_focus
  end

  def find_view_by_resource(resource : Path) : View?
    @views.find { |view| view.resource == resource }
  end

  def find_view_by_id(id)
    @views.find { |view| view.object_id == id }
  end

  def current_view : View?
    @views.first?
  end

  def current_view! : View
    @views.first
  end

  def show_view(view : View)
    root = @root
    return if root.nil? || @selected_view == view

    @selected_view.try(&.unselect)
    @selected_view = view
    node = root.find_node(view)
    node.show_view(view)
    view.select
  end

  def focus_view(view : View)
    show_view(view)
    view.grab_focus
  end

  def rotate_views(reverse : Bool) : Nil
    views_count = @views.size
    return if views_count < 2

    @selected_view_index = 0 if !rotating_views?
    @rotating_views = true

    @selected_view_index += reverse ? -1 : 1
    max_index = views_count - 1
    if @selected_view_index < 0
      @selected_view_index = max_index
    elsif @selected_view_index > max_index
      @selected_view_index = 0
    end
    show_view(@views[@selected_view_index])
  end

  def stop_rotate : Nil
    @rotating_views = false
    @views.unshift(@views.delete_at(@selected_view_index)) if @views.size >= 2 && @selected_view_index > 0

    @selected_view.try(&.grab_focus)
  end

  private def rotating_views? : Bool
    @views.size > 1 && @rotating_views
  end

  def remove_current_view
    node = current_node
    return if node.nil?

    view = node.remove_visible_view
    @views.delete(view)
    view.disconnect_signals
    view.unparent

    if @views.empty?
      @place_holder.visible = true
      @root = nil
    elsif node.views_count > 0
      # Keep user on same node
      show_view(node.visible_view)
    else
      # fallback to last used view
      show_view(@views.first)
    end
  end

  def remove_all_views
    @views.each do |view|
      view.disconnect_signals
      view.unparent
    end
    @views.clear
    @root = nil
    @place_holder.visible = true
  end

  def modified_views : Array(View)
    @views.select(&.modified?)
  end

  private def save_png(suffix = nil)
    @root.try(&.save_png(suffix))
  end
end
