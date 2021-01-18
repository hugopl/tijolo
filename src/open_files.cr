require "./split/root_node"

module OpenFilesListener
  abstract def open_files_view_revealed(view : View, definitive : Bool)
end

class OpenFiles
  include ViewListener

  observable_by OpenFilesListener

  getter model : Gtk::ListStore
  getter sorted_model : Gtk::TreeModelSort
  getter files = [] of View

  @sorted_files = [] of View  # Files reverse sorted by last used
  @sorted_files_index = 0     # Selected file on open files model
  @last_used_counter = 0      # Counter used to sort open files, last used first
  @ignore_focus_event = false # true if user if pressing Ctrl+Tab

  # Open files model columns
  OPEN_FILES_LABEL     = 0
  OPEN_FILES_LAST_USED = 1

  @root : Split::RootNode

  delegate empty?, to: @files
  delegate any?, to: @files
  delegate widget, to: @root
  delegate current_view, to: @root

  def initialize
    @model = Gtk::ListStore.new({GObject::Type::UTF8, GObject::Type::ULONG})
    @sorted_model = Gtk::TreeModelSort.new(model: @model)
    @sorted_model.set_sort_column_id(OPEN_FILES_LAST_USED, :descending)

    @root = Split::RootNode.new
  end

  def view_by_id(id : String) : View?
    @files.find { |view| view.id == id }
  end

  def view(id : UInt64) : View?
    @files.find { |view| view.object_id == id }
  end

  def view(file_path : Path) : View?
    @files.find { |view| view.file_path == file_path }
  end

  private def ignore_focus_event
    @ignore_focus_event = true
    yield
  ensure
    @ignore_focus_event = false
  end

  private def first_shared_view : View?
    @sorted_files.reverse_each do |view|
      return view if view.can_share_node?
    end
    nil
  end

  def add_view(view : View, split_view : Bool) : View
    reference_view = split_view ? @sorted_files.last? : first_shared_view
    # If no views were found, e.g. there are just non-shared terminals, use the terminal and split the view
    if reference_view.nil? && @sorted_files.any?
      reference_view = @sorted_files.last
      split_view = true
    end

    @files << view
    @sorted_files << view
    @sorted_files_index = @sorted_files.size - 1
    @model.append({0, 1}, {view.label, last_used_counter})

    ignore_focus_event do
      @root.add_view(view, reference_view, split_view)
      reveal_view(view, true)
    end
    view.add_view_listener(self)
    view.show_all
    view
  end

  def last_used_counter
    @last_used_counter += 1
  end

  def all_saved?
    !@files.any?(&.modified?)
  end

  def current_row
    @sorted_files.size - (@sorted_files_index + 1)
  end

  # If definitive is false, the user is just navigating through Ctrl+Tab with Ctrl pressed.
  private def reveal_view(view : View, definitive : Bool)
    @root.reveal_view(view)
    notify_open_files_view_revealed(view, definitive)
    view.grab_focus if definitive
  end

  private def reorder_open_files(view : View)
    idx = @sorted_files.index(view)
    reorder_open_files(idx) unless idx.nil?
  end

  private def reorder_open_files(new_selected_index : Int32)
    @sorted_files.push(@sorted_files.delete_at(new_selected_index))
    @sorted_files_index = @sorted_files.size - 1

    idx = @files.index(@sorted_files.last)
    @model.set(idx, {OPEN_FILES_LAST_USED}, {last_used_counter}) unless idx.nil?
  end

  # Cycle through open views and call reveal_view for the next view.
  # If reorder = true, mark the current view as the last used, i.e. reorder @sorted_files
  def switch_current_view(reorder : Bool)
    return if @files.size < 2

    @ignore_focus_event = !reorder

    unless reorder
      @sorted_files_index -= 1
      @sorted_files_index = @sorted_files.size - 1 if @sorted_files_index < 0
    end

    reveal_view(@sorted_files[@sorted_files_index], reorder)
  end

  def show_view(view : View)
    reveal_view(view, true)
  end

  def close_current_view : View?
    return if @files.empty?

    view = current_view
    return if view.nil?

    idx = @files.index(view)
    @model.remove_row(idx) unless idx.nil?

    view.remove_view_listener(self)
    @files.delete(view)
    @sorted_files.delete(view)
    @sorted_files_index = @sorted_files.size - 1

    @root.remove_view(view)

    reveal_view(@sorted_files.last, true) if @sorted_files.any?
    view
  end

  def maximize_view
    if @sorted_files.empty?
      return
    elsif @root.maximized?
      @root.unmaximize_view
    else
      @root.maximize_view(@sorted_files.last)
    end
    @sorted_files.last.grab_focus
  end

  def view_file_path_changed(view)
    row = files.index(view)
    @model.set(row, {OPEN_FILES_LABEL}, {view.label}) unless row.nil?
  end

  def focus_upper_split
    return if @sorted_files.size < 2
    select_view_node(@root.upper_split(@sorted_files.last))
  end

  def focus_right_split
    return if @sorted_files.size < 2
    select_view_node(@root.right_split(@sorted_files.last))
  end

  def focus_lower_split
    return if @sorted_files.size < 2
    select_view_node(@root.lower_split(@sorted_files.last))
  end

  def focus_left_split
    return if @sorted_files.size < 2
    select_view_node(@root.left_split(@sorted_files.last))
  end

  private def select_view_node(view_node : Split::ViewNode?)
    return if view_node.nil?

    view_id = view_node.visible_view_id
    return if view_id.nil?

    view = view_by_id(view_id)
    show_view(view) if view
  end

  def view_focused(view : View)
    return if @ignore_focus_event

    @root.current_view = view
    reorder_open_files(view)
    ignore_focus_event do
      notify_open_files_view_revealed(view, true)
    end
  end
end
