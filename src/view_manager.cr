require "./view_place_holder"
require "./view"

@[Gtk::UiTemplate(file: "#{__DIR__}/ui/view_manager.ui", children: %w())]
class ViewManager < Gtk::Box
  include Gtk::WidgetTemplate

  # List of view in Ctrl+Tab menu
  getter views = [] of View
  # Current selected view in Ctrl+Tab menu
  getter selected_view_index = 0

  # TODO: This should be removed once ViewManager gets its own layout and is able to split views again
  @stack : Gtk::Stack
  @rotating_views = false

  def initialize
    super()

    @stack = Gtk::Stack.new
    append(@stack)
  end

  delegate empty?, to: @views
  delegate any?, to: @views

  private def reorder_views
    return if @views.size < 2 || @selected_view_index.zero?

    @views.unshift(@views.delete_at(@selected_view_index))
    @selected_view_index = 0
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
      @selected_view_index = 0
    end

    @selected_view_index += reverse ? -1 : 1
    max_index = views_count - 1
    if @selected_view_index < 0
      @selected_view_index = max_index
    elsif @selected_view_index > max_index
      @selected_view_index = 0
    end

    selected_view = @views[@selected_view_index]
    @rotating_views = true
    show_view(selected_view)
  end

  def stop_rotate : Nil
    return unless rotating_views?

    reorder_views
    focus_view(current_view.not_nil!)
  end

  private def rotating_views? : Bool
    @views.size > 1 && @rotating_views
  end

  def add_view(view : View)
    @stack.add_child(view)
    @views.unshift(view)

    focus_view(view)
  end

  def close_current_view
    view = current_view
    return if view.nil?

    @views.delete(view)
    @stack.remove(view)
    view.disconnect_signals

    show_view(@views.first) unless @views.empty?
  end

  def close_all_views
    while @views.size > 0
      close_current_view
    end
  end

  def modified_views : Array(View)
    @views.select(&.modified?)
  end
end
