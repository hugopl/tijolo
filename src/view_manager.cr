require "./view_place_holder"
require "./view_manager_node"

@[Gtk::UiTemplate(file: "#{__DIR__}/ui/view_manager.ui", children: %w(overlay views_model views_ctrltab_box views_ctrltab_selection views_tree))]
class ViewManager < Gtk::Box
  include Gtk::WidgetTemplate

  @views_model : Gtk::ListStore
  @view_ctrltab_box : Gtk::Box
  @view_ctrltab_selection : Gtk::TreeSelection
  @overlay : Gtk::Overlay
  getter views = [] of View # Views in the order they are stored in GTK model
  getter selected_view_index = 0

  @root_node : ViewManagerNode

  def initialize
    super()

    @root_node = ViewManagerNode.new(ViewPlaceHolder.new)

    @overlay = Gtk::Overlay.cast(template_child("overlay"))
    @views_model = Gtk::ListStore.cast(template_child("views_model"))
    @view_ctrltab_box = Gtk::Box.cast(template_child("views_ctrltab_box"))
    @view_ctrltab_selection = Gtk::TreeSelection.cast(template_child("views_ctrltab_selection"))

    @overlay.child = @root_node
  end

  delegate empty?, to: @views
  delegate any?, to: @views
  delegate add_overlay, to: @overlay
  delegate show_view, to: @root_node

  private def populate_views_model
    @views_model.clear
    @views.each do |view|
      @views_model.append({0}, {view.label})
    end
  end

  private def reorder_views
    return if @views.size < 2 || @selected_view_index.zero?

    @views.unshift(@views.delete_at(@selected_view_index))
    @selected_view_index = 0
  end

  def find_view(resource : String) : View?
    @views.find { |view| view.resource == resource }
  end

  def current_view : View?
    @views.first?
  end

  def rotate_views(reverse : Bool) : Nil
    views_count = @views.size
    return if views_count < 2

    if !rotating_views?
      populate_views_model
      view = Gtk::TreeView.cast(template_child("views_tree"))
      @selected_view_index = 0
    end

    @selected_view_index += reverse ? -1 : 1
    max_index = views_count - 1
    if @selected_view_index < 0
      @selected_view_index = max_index
    elsif @selected_view_index > max_index
      @selected_view_index = 0
    end

    @view_ctrltab_selection.select_row(@selected_view_index)
    selected_view = @views[@selected_view_index]
    @view_ctrltab_box.visible = true
    show_view(selected_view)
  end

  def stop_rotate : Nil
    return unless rotating_views?

    @view_ctrltab_box.visible = false
    reorder_views
    current_view.try(&.focus)
  end

  def rotating_views? : Bool
    @view_ctrltab_box.visible?
  end

  private def first_shared_view : View?
    @views.each do |view|
      return view if view.can_share_node?
    end
    nil
  end

  def add_view(view : View, split_view : Bool)
    reference_view = split_view ? current_view : first_shared_view
    # If no views were found, e.g. there are just non-shared views, get the first view and split it
    if reference_view.nil? && @views.any?
      reference_view = current_view.not_nil!
      split_view = true
    end

    @views.unshift(view)
    @root_node.add_view(view, reference_view, split_view)
    view.focus
  end

  def close_current_view
    view = current_view
    return if view.nil?

    @views.delete(view)
    @root_node.remove_view(view)

    show_view(@views.first) if @views.any?
  end

  def close_all_views
    while @views.size > 0
      close_current_view
    end
  end
end
