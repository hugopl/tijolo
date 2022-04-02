module LocatorProviderListener
  abstract def locator_provider_model_changed(provider : LocatorProvider)
end

abstract class LocatorProvider
  LABEL_COLUMN = 0

  getter model : Gtk::ListStore

  def initialize
    @model = Gtk::ListStore.new({GObject::TYPE_STRING})
  end

  # Called when the locator was selected with the current_view focused.
  def selected(current_view : View?)
  end

  # Called when the view was closed, the locator may or may not be selected
  # Use this to free locator caches.
  def view_closed(view : View) : Nil
  end

  # Called when project load finishes.
  def project_load_finished
  end

  # index is the index of the entry in the provided model.
  # This must return true if the locator should hide after activation
  abstract def activate(locator : Locator, index : Int32) : Bool
  abstract def results_size : Int32
  abstract def shortcut : Char
  abstract def description : String
  abstract def search_changed(search_text : String) : Nil
end
