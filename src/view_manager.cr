require "./view"
require "./view_manager_layout"
require "./view_manager_node"
require "./view_manager_view_node"
require "./view_manager_split_node"
require "./view_place_holder"
require "./view_switcher"

@[Gtk::UiTemplate(file: "#{__DIR__}/ui/view_manager.ui", children: %w())]
class ViewManager < Gtk::Widget
  include Gtk::WidgetTemplate
  include Gio::ListModel
  # List of view in Ctrl+Tab menu
  @views = [] of View

  # Current selected view in Ctrl+Tab menu
  @selected_view_index = 0
  private getter! root : ViewManagerNode?
  getter place_holder = ViewPlaceHolder.new
  getter view_switcher = ViewSwitcher.new

  @layout = ViewManagerLayout.new

  def initialize
    super(css_name: "view_manager")
    @place_holder.parent = self
    @view_switcher.parent = self
    @view_switcher.model = self
    self.layout_manager = @layout
    setup_actions
  end

  delegate empty?, to: @views
  delegate any?, to: @views

  def root?
    @root
  end

  # This exists only for debug, will be removed at some time
  {% if flag?(:debug) %}
    @@dump_tree_count = 0
  {% end %}

  private def setup_actions
    group = Gio::SimpleActionGroup.new
    {% for direction in %w(top right bottom left) %}
      {% for action in %w(split_ focus_) %}
      action = Gio::SimpleAction.new({{ action + direction }}, nil)
      action.activate_signal.connect { {{ (action + direction).id }} }
      group.add_action(action)
      {% end %}
    {% end %}

    {% if flag?(:debug) %}
      action = Gio::SimpleAction.new("dump_tree", nil)
      action.activate_signal.connect do
        @@dump_tree_count += 1
        @root.try(&.save_png(@@dump_tree_count))
      end
      group.add_action(action)
    {% end %}

    insert_action_group("view", group)
  end

  def focus_changed
    view = focus_child
    return unless view.as?(View)

    idx = @views.index(view)
    @views.swap(0, idx) if idx
  end

  private def current_node? : ViewManagerNode?
    return if @views.empty?
    root = @root
    return if root.nil?

    view = current_view
    raise TijoloError.new("current_view empty with a root node!?") if view.nil?

    node = root.find_node(view)
    raise TijoloError.new("Failed to find current node for view #{view}") if node.nil?
    node
  end

  private def current_node! : ViewManagerNode
    current_node?.not_nil!
  end

  def add_view(view : View) : Nil
    @place_holder.visible = false
    view.insert_before(self, @view_switcher)

    node = current_node?
    if node.nil?
      @root = ViewManagerViewNode.new(view)
    else
      node.add_view(view)
    end
    @views.unshift(view)
    items_changed_signal.emit(0, 0, 1)
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
    node = current_node?
    return if node.nil? || !node.enough_views_to_split?

    replace_root = (node == @root)
    node.split(position, orientation)
    @root = node.parent if replace_root
  end

  private def focus_top
    focus_by_min_distance do |current_node, view_node|
      dist = current_node.y - (view_node.y + view_node.height)
      dist < 0 ? Int32::MAX : dist
    end
  end

  private def focus_right
    focus_by_min_distance do |current_node, view_node|
      dist = current_node.x + current_node.width - view_node.x
      dist < 0 ? Int32::MAX : dist
    end
  end

  private def focus_bottom
    focus_by_min_distance do |current_node, view_node|
      dist = current_node.y + current_node.height - view_node.y
      dist < 0 ? Int32::MAX : dist
    end
  end

  private def focus_left
    focus_by_min_distance do |current_node, view_node|
      dist = current_node.x - (view_node.x + view_node.width)
      dist < 0 ? Int32::MAX : dist
    end
  end

  private def focus_by_min_distance(&block : Proc(ViewManagerViewNode, ViewManagerViewNode, Int32))
    root = @root
    return unless root.is_a?(ViewManagerSplitNode)

    current_node = current_node!
    min_distance = Int32::MAX
    node_found : ViewManagerViewNode? = nil
    root.each_view_node do |view_node|
      distance = block.call(current_node, view_node)
      if distance < min_distance
        min_distance = distance
        node_found = view_node
      end
    end

    # FIXME: Compiler bug here
    # focus_view(node_found.visible_view) if node_found
    focus_view(node_found.not_nil!.visible_view) if node_found
  end

  def find_view_by_resource(resource : Path) : View?
    @views.find { |view| view.resource == resource }
  end

  def find_view_by_id(id)
    @views.find { |view| view.object_id == id }
  end

  private def current_view : View
    @views.first
  end

  def current_view? : View?
    @views.first?
  end

  def show_view(view : View)
    root = @root
    return if root.nil?

    node = root.find_node(view)
    node.show_view(view)
  end

  def focus_view(view : View)
    show_view(view)
    view.grab_focus
  end

  def rotate_views(reverse : Bool) : Nil
    views_count = @views.size
    return if views_count < 2

    @selected_view_index = 0 if !rotating_views?
    @view_switcher.visible = true

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
    @view_switcher.visible = false
    if @views.size > 1
      @views.unshift(@views.delete_at(@selected_view_index))
      @views.first.grab_focus
    end
  end

  private def rotating_views? : Bool
    @views.size > 1 && @view_switcher.visible?
  end

  def remove_current_view
    node = current_node?
    return if node.nil?

    view = node.remove_visible_view
    removed_view_index = @views.index(view)
    if removed_view_index
      @views.delete_at(removed_view_index)
      items_changed_signal.emit(removed_view_index.to_u32, 1_u32, 0_u32)
    else
      raise IndexError.new
    end

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
    old_views_size = @views.size
    @views.clear
    items_changed_signal.emit(0_u32, old_views_size.to_u32, 0_u32)

    @root = nil
    @place_holder.visible = true
  end

  def modified_views : Array(View)
    @views.select(&.modified?)
  end

  private def save_png(suffix = nil)
    @root.try(&.save_png(suffix))
  end

  @[GObject::Virtual]
  def get_n_items : UInt32
    @views.size.to_u32
  end

  @[GObject::Virtual]
  def get_item(pos : UInt32) : GObject::Object?
    @views[pos]?
  end

  @[GObject::Virtual]
  def get_item_type : UInt64
    View.g_type
  end
end
