require "./observable"

module LocatorProviderListener
  abstract def locator_provider_model_changed(provider : LocatorProvider)
end

abstract class LocatorProvider
  observable_by LocatorProviderListener

  LABEL_COLUMN = 0

  getter model : Gtk::ListStore

  def initialize
    @model = Gtk::ListStore.new({GObject::Type::UTF8})
  end

  def selected(current_view : View?)
  end

  def unselected
  end

  # index is the index of the entry in the provided model.
  # This must return true if the locator should hide after activation
  abstract def activate(locator : Locator, index : Int32) : Bool
  abstract def results_size : Int32
  abstract def shortcut : Char
  abstract def description : String
  abstract def search_changed(search_text : String) : Nil
end
