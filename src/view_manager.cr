require "./view_place_holder"

@[Gtk::UiTemplate(file: "#{__DIR__}/ui/view_manager.ui", children: %w(overlay views_model views_ctrltab_box views_ctrltab_selection views_tree))]
class ViewManager < Gtk::Box
  include Gtk::WidgetTemplate

  @views_model : Gtk::ListStore
  @view_ctrltab_box : Gtk::Box
  @view_ctrltab_selection : Gtk::TreeSelection
  @overlay : Gtk::Overlay

  # List of view in Ctrl+Tab menu
  getter views = [] of View
  # Current selected view in Ctrl+Tab menu
  getter selected_view_index = 0

  # ViewManager instance, used to simplify things and avoid a lot of signal connections
  class_getter! instance : ViewManager?

  # TODO: This should be removed once ViewManager gets its own layout and is able to split views again
  @stack : Gtk::Stack

  def initialize
    super()

    raise ArgumentError.new unless @@instance.nil?

    @stack = Gtk::Stack.new
    @overlay = Gtk::Overlay.cast(template_child("overlay"))
    @views_model = Gtk::ListStore.cast(template_child("views_model"))
    @view_ctrltab_box = Gtk::Box.cast(template_child("views_ctrltab_box"))
    @view_ctrltab_selection = Gtk::TreeSelection.cast(template_child("views_ctrltab_selection"))

    @overlay.child = @stack
    @@instance = self
  end

  delegate empty?, to: @views
  delegate any?, to: @views
  delegate add_overlay, to: @overlay

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

  def find_view_by_resource(resource : Path) : View?
    @views.find { |view| view.resource == resource }
  end

  def current_view : View?
    @views.first?
  end

  def show_view(view : View)
    @stack.visible_child = view
    select_view(view)
  end

  private def select_view(view : View)
    old_view = @stack.visible_child.as?(View)
    old_view.unselect if old_view
    view.select
  end

  def focus_view(view : View)
    index = @views.index(view)
    raise ArgumentError.new if index.nil?

    @selected_view_index = index
    reorder_views
    show_view(view)
    view.grab_focus
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

    focus_view(current_view.not_nil!)
  end

  private def rotating_views? : Bool
    @views.size > 1 && @view_ctrltab_box.visible?
  end

  def add_view(view : View, split_view : Bool)
    Log.warn { "Split view feature removed in 0.8.x" } if split_view
    @stack.add_child(view)
    @views.unshift(view)

    focus_view(view)
  end

  def close_current_view
    view = current_view
    return if view.nil?

    @views.delete(view)
    @stack.remove(view)

    show_view(@views.first) unless @views.empty?
  end

  def close_all_views
    while @views.size > 0
      close_current_view
    end
  end
end
