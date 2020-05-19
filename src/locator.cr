require "fzy"

class Locator
  getter locator_widget : Gtk::Widget # Root widget for locator

  # project model columns
  PATH_COLUMN    = 0
  VISIBLE_COLUMN = 1
  SCORE_COLUMN   = 2

  # Number of locator matches to show in the UI
  MAX_LOCATOR_ITEMS = 50

  @project : Project
  @locator_entry : Gtk::SearchEntry
  @project_model : Gtk::ListStore
  @locator_results : Gtk::TreeView

  @project_haystack : Fzy::PreparedHaystack
  @last_results = [] of Fzy::Match

  # callbacks
  @on_open_file : Proc(String, Nil)

  def initialize(builder, overlay, @project, @on_open_file)
    locator_widget = Gtk::Widget.cast(builder["locator_widget"])
    overlay.add_overlay(locator_widget)
    @locator_widget = locator_widget

    @locator_entry = Gtk::SearchEntry.cast(builder["locator_entry"])
    @locator_entry.on_key_press_event(&->key_pressed(Gtk::Widget, Gdk::EventKey))
    @locator_entry.on_activate(&->open_file(Gtk::Entry))
    @locator_entry.on_search_changed(&->search_changed(Gtk::SearchEntry))

    # Original model
    @project_model = Gtk::ListStore.new(3, [GObject::Type::UTF8, GObject::Type::BOOLEAN, GObject::Type::DOUBLE])
    fill_project_model

    # Original model now filtered
    project_filter_model = Gtk::TreeModelFilter.new(child_model: @project_model)
    project_filter_model.visible_column = 1

    # Original model now filtered and sorted by search score
    sorted_model = Gtk::TreeModelSort.new(model: project_filter_model)
    sorted_model.set_sort_column_id(SCORE_COLUMN, :descending)

    @project_haystack = Fzy::PreparedHaystack.new(@project.files.map(&.to_s))

    @locator_results = Gtk::TreeView.cast(builder["locator_results"])
    @locator_results.selection.mode = :browse
    @locator_results.model = sorted_model
    @locator_results.on_row_activated(&->open_file(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn))
  end

  def show
    @locator_widget.show
    @locator_entry.grab_focus
  end

  def hide
    @locator_widget.hide
  end

  private def key_pressed(widget, event : Gdk::EventKey)
    if event.keyval == Gdk::KEY_Escape
      @locator_widget.hide
      return true
    end

    false
  end

  private def open_file(widget : Gtk::Entry)
    file = @last_results.first?
    open_file(file.value) unless file.nil?
  end

  private def open_file(widget : Gtk::TreeView, tree_path : Gtk::TreePath, _column : Gtk::TreeViewColumn)
    open_file(widget.value(tree_path, PATH_COLUMN).string)
  end

  private def open_file(file : String)
    @on_open_file.call(@project.root.join(file).to_s)
    @locator_widget.hide
  end

  private def fill_project_model
    iter = Gtk::TreeIter.new
    @project.files.each do |file|
      @project_model.append(iter)
      @project_model.set(iter, {PATH_COLUMN, VISIBLE_COLUMN}, {file.to_s, false})
    end
    true
  end

  private def search_changed(widget : Gtk::SearchEntry)
    time = Time.measure do
      reset_search_model

      @last_results = Fzy.search(widget.text, @project_haystack)
      @last_results.delete_at(MAX_LOCATOR_ITEMS..-1) if @last_results.size > MAX_LOCATOR_ITEMS

      # Set visible values
      iter = Gtk::TreeIter.new
      @last_results.each do |match|
        tree_path = Gtk::TreePath.new_from_indices({match.index}, 1)
        @project_model.iter(iter, tree_path)
        @project_model.set(iter, {VISIBLE_COLUMN, SCORE_COLUMN}, {true, match.score})
      end
    end
    @locator_results.selection.select_row(0)
    Log.info { "Locator found #{@last_results.size} results in #{time}" }
  end

  private def reset_search_model
    iter = Gtk::TreeIter.new
    @last_results.each do |match|
      tree_path = Gtk::TreePath.new_from_indices({match.index}, 1)
      @project_model.iter(iter, tree_path)
      @project_model.set(iter, {VISIBLE_COLUMN, SCORE_COLUMN}, {false, -Float64::INFINITY})
    end
  end
end
