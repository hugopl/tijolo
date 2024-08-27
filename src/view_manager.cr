require "./view"
require "./view_manager_layout"
require "./view_manager_node"
require "./view_manager_view_node"
require "./view_manager_split_node"
require "./view_place_holder"
require "./view_switcher"
require "./view_iterator"
require "./focus_glow"

@[Gtk::UiTemplate(file: "#{__DIR__}/ui/view_manager.ui", children: %w())]
class ViewManager < Gtk::Widget
  include Gtk::WidgetTemplate
  include Gio::ListModel

  private getter! root : ViewManagerNode?
  getter current_node : ViewManagerViewNode?
  getter? current_view : View?
  getter views_count : Int32 = 0
  getter maximized_view : View?

  getter place_holder = ViewPlaceHolder.new
  getter focus_glow = FocusGlow.new
  getter glow_view : View?
  getter view_switcher = ViewSwitcher.new

  @layout = ViewManagerLayout.new
  @ordered_view_nodes = [] of ViewManagerViewNode

  def initialize
    super(css_name: "view_manager")
    @place_holder.parent = self
    @view_switcher.parent = self
    @view_switcher.model = self
    @focus_glow.parent = self
    self.layout_manager = @layout

    setup_actions
  end

  def empty?
    @views_count.zero?
  end

  def any?
    @views_count > 0
  end

  def root?
    @root
  end

  def views
    ViewIterator.new(@root)
  end

  # This exists only for debug, will be removed at some time
  {% unless flag?(:release) %}
    @@dump_tree_count = 0
  {% end %}

  private def setup_actions
    group = Gio::SimpleActionGroup.new
    {% for direction in %w(top right bottom left) %}
      {% for action in %w(move_ focus_) %}
      action = Gio::SimpleAction.new({{ action + direction }}, nil)
      action.activate_signal.connect { {{ (action + direction).id }} }
      group.add_action(action)
      {% end %}
    {% end %}

    {% unless flag?(:release) %}
      action = Gio::SimpleAction.new("dump_tree", nil)
      action.activate_signal.connect do
        @@dump_tree_count += 1
        @root.try(&.save_png(@@dump_tree_count))
      end
      group.add_action(action)
    {% end %}

    insert_action_group("view", group)
  end

  def maximized? : Bool
    !@maximized_view.nil?
  end

  def maximize_view(view : View)
    return if @views_count < 2
    return if unmaximize

    root = @root
    return if root.nil?

    @maximized_view = view
    root.each_view_node do |node|
      node.visible_view.visible = node.visible_view == view
    end
    glow_view(view)
    @layout.layout_changed
  end

  # Returns true if was able to unmaximize, false it it was already unmaximized
  private def unmaximize : Bool
    root = @root
    return false if root.nil? || @maximized_view.nil?

    @maximized_view = nil
    root.each_view_node do |node|
      node.visible_view.visible = true
    end
    glow_view(current_view)
    @layout.layout_changed
    true
  end

  def focus_changed
    return if rotating_views?

    child = focus_child
    view : View? = nil
    while child
      view = child if child.is_a?(View)
      child = child.parent
    end

    view.check_for_external_changes if view.is_a?(DocumentView)
    set_current_node(@root.try(&.find_node(view))) if view
  end

  def add_view(view : View) : Nil
    @place_holder.visible = false
    view.insert_before(self, @view_switcher)

    node = @current_node
    if node.nil?
      @root = root = ViewManagerViewNode.new(view)
      set_current_node(root)
    else
      node.add_view(view)
    end
    @views_count += 1
    show_view(view, reorder: false, focus: true)
  end

  {% for dir in %w(top right bottom left) %}
  def move_{{ dir.id }} : Bool
    return false if unmaximize

    current_node = @current_node
    return false if current_node.nil?
    return split_{{ dir.id }}(current_node) if current_node.enough_views_to_split?

    node = find_{{ dir.id }}
    if node && node != current_node
      view = current_node.remove_visible_view
      node.add_view(view)
      show_node(node, focus: true)
      glow_view(view)
      return true
    end
    false
  end

  private def focus_{{ dir.id }}
    return if unmaximize

    node = find_{{ dir.id }}
    if node
      view = node.visible_view
      show_view(view, reorder: true, focus: true)
      glow_view(view)
    end
  end
  {% end %}

  private def split_top(node)
    split(node, :start, :vertical)
  end

  private def split_right(node)
    split(node, :end, :horizontal)
  end

  private def split_bottom(node)
    split(node, :end, :vertical)
  end

  private def split_left(node)
    split(node, :start, :horizontal)
  end

  private def split(node : ViewManagerViewNode, position : ViewManagerSplitNode::SplitPosition,
                    orientation : ViewManagerSplitNode::SplitOrientation) : Bool
    replace_root = (node == @root)
    new_node = node.split(position, orientation)
    @root = node.parent if replace_root

    show_node(new_node, focus: true)
    glow_view(new_node.visible_view)
    true
  end

  private def find_top : ViewManagerViewNode?
    find_by_min do |node1, node2|
      dist = node1.y - (node2.y + node2.height)
      dist < 0 ? Int32::MAX : dist
    end
  end

  private def find_right
    find_by_min do |node1, node2|
      dist = node1.x + node1.width - node2.x
      dist < 0 ? Int32::MAX : dist
    end
  end

  private def find_bottom
    find_by_min do |node1, node2|
      dist = node1.y + node1.height - node2.y
      dist < 0 ? Int32::MAX : dist
    end
  end

  private def find_left
    find_by_min do |node1, node2|
      dist = node1.x - (node2.x + node2.width)
      dist < 0 ? Int32::MAX : dist
    end
  end

  private def find_by_min(&block : Proc(ViewManagerViewNode, ViewManagerViewNode, Int32)) : ViewManagerViewNode?
    root = @root
    return unless root.is_a?(ViewManagerSplitNode)

    current_node = @current_node.not_nil!
    min_distance = Int32::MAX
    node_found : ViewManagerViewNode? = nil
    root.each_view_node do |view_node|
      distance = block.call(current_node, view_node)
      if distance < min_distance
        min_distance = distance
        node_found = view_node
      end
      node_found
    end
    node_found
  end

  def find_view_by_resource(resource : Path) : View?
    root = @root
    return if root.nil?

    views.each.find do |view|
      view.is_a?(DocumentView) && view.resource == resource
    end
  end

  private def current_view : View
    current_view?.not_nil!
  end

  def show_node(node : ViewManagerViewNode, focus : Bool)
    node.show_view(node.visible_view, reorder: false)
    if focus
      node.visible_view.grab_focus
      set_current_node(node)
    end
  end

  def show_view(view : View, *, reorder : Bool, focus : Bool)
    root = @root
    return if root.nil?

    node = root.find_node(view)
    node.show_view(view, reorder)
    if focus
      view.grab_focus
      set_current_node(node) if reorder
    end
  end

  def on_view_changed(&@on_view_changed : Proc(View?, Nil))
  end

  private def set_current_node(node : ViewManagerViewNode?)
    @current_node = node

    on_view_changed = @on_view_changed
    return if on_view_changed.nil?

    new_view = node.visible_view if node
    return if @current_view == new_view

    @current_view = new_view
    on_view_changed.call(new_view)
  end

  def glow_view(view : View)
    @focus_glow.glow
    @glow_view = view
  end

  def rotate_views(reverse : Bool) : Nil
    return if @views_count < 2

    if !rotating_views?
      reorder_and_reset_model
      @view_switcher.visible = true
      @view_switcher.reset
    end

    @view_switcher.rotate(reverse)
    show_view(@view_switcher.selected_view, reorder: false, focus: false)
  end

  def stop_rotate : Nil
    return unless rotating_views?

    @view_switcher.visible = false
    show_view(@view_switcher.selected_view, reorder: true, focus: true)
  end

  private def reorder_and_reset_model
    root = @root
    return if root.nil?

    old_size = @ordered_view_nodes.size
    @ordered_view_nodes.clear
    root.each_view_node do |node|
      @ordered_view_nodes << node
    end
    @ordered_view_nodes.sort! { |view_a, view_b| view_b.last_used <=> view_a.last_used }

    items_changed(0, old_size, @ordered_view_nodes.size)
  end

  private def rotating_views? : Bool
    @views_count > 1 && @view_switcher.visible?
  end

  def remove_current_view
    node = @current_node
    return if node.nil?

    unmaximize

    view = node.remove_visible_view
    view.disconnect_signals
    view.unparent

    @views_count -= 1

    if @views_count.zero?
      @place_holder.visible = true
      @root = nil
      set_current_node(nil)
    elsif node.views_count > 0
      # Keep user on same node
      show_node(node, focus: true)
    else
      # fallback to any node
      # TODO: focus last used node instead of anyone
      show_node(root.first_view_node, focus: true)
    end
  end

  def remove_all_views
    while @views_count > 0
      remove_current_view
    end
  end

  def modified_views : Array(View)
    # FIXME: Let this return an Iterator
    # @views.select do |view|
    #  view.is_a?(DocumentView) && view.modified?
    # end
    [] of View
  end

  @[GObject::Virtual]
  def grab_focus : Bool
    view = current_view?
    view ? view.grab_focus : false
  end

  @[GObject::Virtual]
  def get_n_items : UInt32
    @ordered_view_nodes.size.to_u32
  end

  @[GObject::Virtual]
  def get_item(pos : UInt32) : GObject::Object?
    @ordered_view_nodes[pos]?
  end

  @[GObject::Virtual]
  def get_item_type : UInt64
    ViewManagerViewNode.g_type
  end

  def color_scheme=(scheme : Adw::ColorScheme)
    views.each do |view|
      view.color_scheme = scheme
    end
  end

  {% unless flag?(:release) %}
    def save_png(suffix = nil)
      @root.try(&.save_png(suffix))
    end

    def dump : String
      @root.try(&.dump(@current_node)) || "∅"
    end

    # This need to be called on tests to force a relayout, btu only on tests!! Since GTK does that
    # for us when the application is running.
    def relayout(width = 1000, height = 1000)
      @layout.allocate(self, width, height, -1)
    end

    def current_view=(view : View)
      show_view(view, reorder: true, focus: true)
    end
  {% end %}
end
