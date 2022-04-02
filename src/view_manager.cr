require "./split/root_node"

@[Gtk::UiTemplate(file: "#{__DIR__}/ui/view_manager.ui", children: %w(contents_stack open_files_view overlay))]
class ViewManager < Gtk::Box
  include Gtk::WidgetTemplate

  @gtk_views_view : Gtk::TreeView
  @overlay : Gtk::Overlay
  getter model : Gtk::ListStore
  getter views = [] of View # Views in the order they are stored in GTK model
  getter copy_of_views : Array(View)?

  getter selected_view_index = 0

  @ignore_focus_event = false # true if user if pressing Ctrl+Tab

  # Open files model columns
  OPEN_FILES_LABEL       = 0
  OPEN_FILES_SPLIT_LABEL = 1

  @root : Split::RootNode

  delegate empty?, to: @views
  delegate any?, to: @views
  delegate current_view, to: @root

  def initialize
    super()
    @model = Gtk::ListStore.new({GObject::TYPE_STRING, GObject::TYPE_STRING})
    @gtk_views_view = Gtk::TreeView.cast(template_child("open_files_view"))
    @overlay = Gtk::Overlay.cast(template_child("overlay"))
    stack = Gtk::Stack.cast(template_child("contents_stack"))
    @root = Split::RootNode.new(stack)
    @gtk_views_view.model = @model
  end

  delegate add_overlay, to: @overlay

  def view_by_id(id : String) : View?
    @views.find { |view| view.id == id }
  end

  def view(id : UInt64) : View?
    @views.find { |view| view.object_id == id }
  end

  def view(file_path : Path) : View?
    @views.find { |view| view.file_path == file_path }
  end

  private def populate_gtk_model
    prioritize_views_from_current_split
    @model.clear
    has_split = @root.has_split?
    @views.each do |view|
      split_label = has_split ? @root.split_label(view) : ""
      @model.append({OPEN_FILES_LABEL, OPEN_FILES_SPLIT_LABEL}, {view.label, split_label})
    end
  end

  private def prioritize_views_from_current_split
    node = @root.current_node
    return if node.nil?

    priority_view_ids = node.view_ids

    insertion_idx = 1
    @copy_of_views = @views.dup
    1.upto(@views.size - 1) do |i|
      view = @views[i]
      if priority_view_ids.includes?(view.id)
        @views.swap(i, insertion_idx) if i != insertion_idx
        insertion_idx += 1
      end
    end
  end

  def rotate_views(reverse : Bool) : Bool
    views_count = @views.size
    return false if views_count < 2

    first_rotation = !@gtk_views_view.visible?

    @root.show_split_labels

    @selected_view_index = 0 if first_rotation
    @selected_view_index += reverse ? -1 : 1
    max_index = views_count - 1
    if @selected_view_index < 0
      @selected_view_index = max_index
    elsif @selected_view_index > max_index
      @selected_view_index = 0
    end

    if first_rotation
      @root.save_state
      populate_gtk_model
      @gtk_views_view.grab_focus
    end
    @gtk_views_view.selection.select_row(@selected_view_index)

    selected_view = @views[@selected_view_index]
    ignore_focus_event do
      highlight_view(selected_view)
    end
    true
  end

  def change_to_highlighted_view
    @root.hide_split_labels
    view = @views[@selected_view_index]?
    change_current_view(view) if view
  end

  def change_current_view(view : View)
    @root.restore_state
    highlight_view(view)
    # notify_view_manager_current_view_changed(view)
    ignore_focus_event do
      view.grab_focus
    end

    # User original copy of view, without changes to group views from same split
    @views = @copy_of_views.not_nil! if @copy_of_views
    @copy_of_views = nil
    # Move view to top
    idx = @views.index(view)
    @views.unshift(@views.delete_at(idx)) if idx && idx > 0
  end

  private def highlight_view(view : View)
    @root.reveal_view(view)
  end

  private def ignore_focus_event
    @ignore_focus_event = true
    yield
  ensure
    @ignore_focus_event = false
  end

  private def first_shared_view : View?
    @views.each do |view|
      return view if view.can_share_node?
    end
    nil
  end

  def add_view(view : View, split_view : Bool) : View
    reference_view = split_view ? @views.first? : first_shared_view
    # If no views were found, e.g. there are just non-shared terminals, use the terminal and split the view
    if reference_view.nil? && @views.any?
      reference_view = @views.first
      split_view = true
    end

    @views.unshift(view)
    @copy_of_views = nil
    ignore_focus_event do
      @root.add_view(view, reference_view, split_view)
      change_current_view(view)
    end
    view.add_view_listener(self)
    view
  end

  def all_saved?
    !@views.any?(&.modified?)
  end

  def close_current_view : View?
    return if @views.empty?

    view = current_view
    return if view.nil?

    view.remove_view_listener(self)
    @views.delete(view)
    @copy_of_views = nil
    change_current_view(@views.first) unless @views.empty?
    @root.remove_view(view)
    view
  end

  def maximize_view
    return if @views.empty?

    if @root.maximized?
      @root.unmaximize_view
    else
      @root.maximize_view
    end
  end

  def view_file_path_changed(view)
    populate_gtk_model if @gtk_views_view.visible?
  end

  def focus_upper_split
    select_view_node(@root.upper_split(@views.first)) if @views.size > 0
  end

  def focus_right_split
    select_view_node(@root.right_split(@views.first)) if @views.size > 0
  end

  def focus_lower_split
    select_view_node(@root.lower_split(@views.first)) if @views.size > 0
  end

  def focus_left_split
    select_view_node(@root.left_split(@views.first)) if @views.size > 0
  end

  private def select_view_node(view_node : Split::ViewNode?)
    return if view_node.nil?

    view_id = view_node.visible_view_id
    return if view_id.nil?

    view = view_by_id(view_id)
    change_current_view(view) if view
  end

  def view_focused(view : View)
    return if @ignore_focus_event
    @root.current_view = view
    ignore_focus_event do
      change_current_view(view)
    end
  end
end
