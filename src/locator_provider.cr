abstract class LocatorProvider
  LABEL_COLUMN = 0

  getter model : Gtk::ListStore

  def initialize
    @model = Gtk::ListStore.new({GObject::Type::UTF8})
  end

  # index is the index of the entry in the provided model.
  abstract def activate(locator, index : Int32)
  abstract def results_size : Int32
  abstract def shortcut : Char
  abstract def search_changed(search_text : String) : Nil
end
