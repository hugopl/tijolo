abstract class LocatorProvider
  LABEL_COLUMN   = 0
  VISIBLE_COLUMN = 1
  SCORE_COLUMN   = 2

  getter model : Gtk::ListStore
  getter sorted_model : Gtk::TreeModelSort

  def initialize
    @model = Gtk::ListStore.new({GObject::Type::UTF8, GObject::Type::BOOLEAN, GObject::Type::DOUBLE})

    populate_model
    # Original model now filtered
    filter_model = Gtk::TreeModelFilter.new(child_model: @model)
    filter_model.visible_column = 1
    # Original model now filtered and sorted by search score
    @sorted_model = Gtk::TreeModelSort.new(model: filter_model)
    @sorted_model.set_sort_column_id(SCORE_COLUMN, :descending)
  end

  # index is the index of the entry in the provided model.
  abstract def activate(locator, index : Int32)
  abstract def results_size : Int32
  protected abstract def populate_model : Nil
  abstract def shortcut : Char
  abstract def search_changed(search_text : String) : Nil
end
