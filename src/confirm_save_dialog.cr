require "./text_view"
require "./ui_builder_helper"

class ConfirmSaveDialog
  include UiBuilderHelper

  BTN_CANCEL  = 0
  BTN_SAVE    = 1
  BTN_NO_SAVE = 2

  MODIFIED_FILES_SELECTED = 0
  MODIFIED_FILES_VIEW_ID  = 1
  MODIFIED_FILES_LABEL    = 2

  def initialize(@views : Array(TextView))
    builder = builder_for("confirm_save_dialog")
    builder.connect_signals
    @dialog = Gtk::MessageDialog.cast(builder["root"])
    contents = Gtk::Box.cast(builder["contents"])
    Gtk::Box.cast(@dialog.message_area).add(contents)

    @model = Gtk::ListStore.cast(builder["model"])
    toggle = Gtk::CellRendererToggle.cast(builder["toggle"])
    toggle.on_toggled(&->toggle_file(Gtk::CellRendererToggle, String))
    fill_model
    @toogle_status = Array(Bool).new(@views.size, true)

    @dialog.default_response = BTN_SAVE
    @dialog.ref

    builder.unref
  end

  # Return true if should do something, false on cancel
  # can be called only once.
  def run : Bool
    res = @dialog.run
    return false if res < 0 || res == BTN_CANCEL

    @toogle_status.fill(false) if res == BTN_NO_SAVE
    true
  ensure
    @dialog.destroy
    @dialog.unref
  end

  def selected_views
    views_to_save = Array(TextView).new(@views.size)
    @views.size.times do |i|
      views_to_save << @views[i] if @toogle_status[i]
    end
    views_to_save
  end

  private def fill_model
    iter = Gtk::TreeIter.new
    @views.sort_by(&.label).each do |view|
      @model.append(iter)
      @model.set(iter, {0, 1, 2}, {true, view.object_id, view.label})
    end
  end

  private def toggle_file(_renderer, path : String)
    row = path.to_i
    @toogle_status[row] = !@toogle_status[row]
    @model.set(row, {MODIFIED_FILES_SELECTED}, {@toogle_status[row]})
  end
end
