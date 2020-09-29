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

  @sorted_files = [] of View # Files reverse sorted by last used
  @sorted_files_index = 0    # Selected file on open files model
  @last_used_counter = 0     # Counter used to sort open files, last used first

  # Open files model columns
  OPEN_FILES_LABEL     = 0
  OPEN_FILES_LAST_USED = 1

  Log = ::Log.for("OpenFiles")

  @root : Split::RootNode

  delegate empty?, to: @files
  delegate widget, to: @root
  delegate current_view, to: @root
  delegate focus_upper_split, to: @root
  delegate focus_right_split, to: @root
  delegate focus_lower_split, to: @root
  delegate focus_left_split, to: @root

  def initialize
    @model = Gtk::ListStore.new({GObject::Type::UTF8, GObject::Type::ULONG})
    @sorted_model = Gtk::TreeModelSort.new(model: @model)
    @sorted_model.set_sort_column_id(OPEN_FILES_LAST_USED, :descending)

    @root = Split::RootNode.new
  end

  def view(id : UInt64) : View?
    @files.each do |view|
      return view if view.object_id == id
    end
    nil
  end

  def view(file_path : Path) : View?
    @files.find do |view|
      view.file_path == file_path
    end
  end

  def add_view(view : View, split_view : Bool) : View
    @files << view
    @sorted_files << view
    @sorted_files_index = @sorted_files.size - 1
    @model.append({0, 1}, {view.label, last_used_counter})

    @root.add_view(view, split_view)

    reveal_view(view, true)
    view.add_view_listener(self)
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
    @root.reveal_view(view, definitive)
    notify_open_files_view_revealed(view, definitive)
  end

  private def reorder_open_files(new_selected_index)
    @sorted_files.push(@sorted_files.delete_at(new_selected_index))
    @sorted_files_index = @sorted_files.size - 1

    idx = @files.index(@sorted_files[@sorted_files_index])
    @model.set(idx, {OPEN_FILES_LAST_USED}, {last_used_counter}) unless idx.nil?
  end

  def switch_current_view(reorder : Bool)
    return if @files.size < 2

    if reorder
      reorder_open_files(@sorted_files_index)
    else
      @sorted_files_index -= 1
      @sorted_files_index = @sorted_files.size - 1 if @sorted_files_index < 0
    end

    reveal_view(@sorted_files[@sorted_files_index], reorder)
  end

  def show_view(view : View)
    idx = @sorted_files.index(view)
    if idx.nil?
      Log.warn { "Unknow view: #{view.label}" }
      return
    end

    reorder_open_files(idx)
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

  def view_focused(view : View)
    @root.current_view = view
  end
end
