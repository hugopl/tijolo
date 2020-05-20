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
  @locator_focus_is_mine = false # True when focus is on locator entry or locator results, used to hide locator on focus lost

  @project_haystack : Fzy::PreparedHaystack
  @last_results = [] of Fzy::Match

  # callbacks
  @on_open_file : Proc(String, Nil)

  delegate hide, to: @locator_widget

  def initialize(builder, overlay, @project, @on_open_file)
    locator_widget = Gtk::Widget.cast(builder["locator_widget"])
    overlay.add_overlay(locator_widget)
    @locator_widget = locator_widget

    @locator_entry = Gtk::SearchEntry.cast(builder["locator_entry"])
    @locator_entry.on_key_press_event(&->entry_key_pressed(Gtk::Widget, Gdk::EventKey))
    @locator_entry.on_activate(&->open_file(Gtk::Entry))
    @locator_entry.on_search_changed(&->search_changed(Gtk::SearchEntry))
    @locator_entry.on_focus_out_event(&->focus_out_event(Gtk::Widget, Gdk::EventFocus))

    # Original model
    @project_model = Gtk::ListStore.new({GObject::Type::UTF8, GObject::Type::BOOLEAN, GObject::Type::DOUBLE})
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
    @locator_results.on_key_press_event(&->results_key_pressed(Gtk::Widget, Gdk::EventKey))
    @locator_results.on_focus_out_event(&->focus_out_event(Gtk::Widget, Gdk::EventFocus))
  end

  def show
    @locator_widget.show
    @locator_entry.grab_focus
    @locator_results.set_cursor(0)
  end

  private def focus_out_event(widget, event : Gdk::EventFocus) : Bool
    @locator_widget.hide unless @locator_focus_is_mine

    @locator_focus_is_mine = false
    false
  end

  macro hide_locator_on_esc!
    if event.keyval == Gdk::KEY_Escape
      @locator_focus_is_mine = false
      @locator_widget.hide
      return true
    end
  end

  private def entry_key_pressed(_widget, event : Gdk::EventKey)
    hide_locator_on_esc!

    if event.keyval == Gdk::KEY_Up
      return true
    elsif event.keyval == Gdk::KEY_Down
      return true if @last_results.size < 2 # First item is already selected...

      @locator_results.set_cursor(1)
      @locator_focus_is_mine = true
      @locator_results.grab_focus
      return true
    end
    false
  end

  private def results_key_pressed(_widget, event : Gdk::EventKey)
    hide_locator_on_esc!

    if event.keyval == Gdk::KEY_Up
      # Check if we are on first row.
      iter = Gtk::TreeIter.new
      return false unless @locator_results.model.not_nil!.iter_first(iter)
      return false unless @locator_results.selection.iter_is_selected(iter)

      @locator_focus_is_mine = true
      @locator_entry.grab_focus
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
        tree_path = Gtk::TreePath.new_from_indices({match.index})
        @project_model.iter(iter, tree_path)
        @project_model.set(iter, {VISIBLE_COLUMN, SCORE_COLUMN}, {true, match.score})
      end
    end
    @locator_results.set_cursor(0)

    Log.info { "Locator found #{@last_results.size} results in #{time}" }
  end

  private def reset_search_model
    iter = Gtk::TreeIter.new
    @last_results.each do |match|
      tree_path = Gtk::TreePath.new_from_indices({match.index})
      @project_model.iter(iter, tree_path)
      @project_model.set(iter, {VISIBLE_COLUMN, SCORE_COLUMN}, {false, -Float64::INFINITY})
    end
  end
end
