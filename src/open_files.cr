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

  def add_view(view : View, split_view : Bool) : View
    Log.trace { "add_view(#{view.label.inspect}, #{split_view})" }
    @files << view
    @sorted_files << view
    @sorted_files_index = @sorted_files.size - 1
    @model.append({0, 1}, {view.label, last_used_counter})

    ignore_focus_event do
      @root.add_view(view, split_view)
      reveal_view(view, true)
    end
    view.add_view_listener(self)
    Log.trace { "~add_view(#{view.label.inspect}, #{split_view})" }
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
    Log.trace { "reveal_view(#{view.label.inspect}, #{definitive})" }
    @root.reveal_view(view)
    notify_open_files_view_revealed(view, definitive)
    view.grab_focus if definitive
  end

  private def reorder_open_files(view : View)
    idx = @sorted_files.index(view)
    reorder_open_files(idx) unless idx.nil?
  end

  private def reorder_open_files(new_selected_index : Int32)
    Log.trace { "reorder_open_files(new_selected_index)" }
    Log.trace { "  Sidx: #{@sorted_files_index} - #{@sorted_files.map(&.label)}" }
    @sorted_files.push(@sorted_files.delete_at(new_selected_index))
    @sorted_files_index = @sorted_files.size - 1

    idx = @files.index(@sorted_files[@sorted_files_index])
    @model.set(idx, {OPEN_FILES_LAST_USED}, {last_used_counter}) unless idx.nil?
    Log.trace { "  Sidx: #{@sorted_files_index} - #{@sorted_files.map(&.label)}" }
  end

  def switch_current_view(reorder : Bool)
    return if @files.size < 2

    Log.trace { "switch_current_view(#{reorder})" }

    @ignore_focus_event = !reorder

    unless reorder
      Log.trace { "  Sidx: #{@sorted_files_index} - #{@sorted_files.map(&.label)}" }
      @sorted_files_index -= 1
      @sorted_files_index = @sorted_files.size - 1 if @sorted_files_index < 0
      Log.trace { "  Sidx: #{@sorted_files_index} - #{@sorted_files.map(&.label)}" }
    end

    reveal_view(@sorted_files[@sorted_files_index], reorder)
  end

  def show_view(view : View)
    Log.trace { "show_view(#{view.label.inspect})" }
    reorder_open_files(view)
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

  def view_file_path_changed(view)
    row = files.index(view)
    @model.set(row, {OPEN_FILES_LABEL}, {view.label}) unless row.nil?
  end

  def focus_upper_split
    select_view_node(@root.upper_split)
  end

  def focus_right_split
    select_view_node(@root.right_split)
  end

  def focus_lower_split
    select_view_node(@root.lower_split)
  end

  def focus_left_split
    select_view_node(@root.left_split)
  end

  private def select_view_node(view_node : Split::ViewNode?)
    return if view_node.nil?

    view_id = view_node.visible_view_id
    pp! view_id
    return if view_id.nil?

    view = view_by_id(view_id)
    pp! view.to_s
    show_view(view) if view
  end

  def view_focused(view : View)
    Log.trace { "view_focused(#{view.label.inspect}) - ignore: #{@ignore_focus_event}" }
    return if @ignore_focus_event

    @root.current_view = view
    reorder_open_files(view)
  end
end
