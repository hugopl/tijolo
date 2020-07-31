require "./text_view"
require "./ui_builder_helper"

abstract class ConfirmDialog
  include UiBuilderHelper

  MODIFIED_FILES_SELECTED = 0
  MODIFIED_FILES_VIEW_ID  = 1
  MODIFIED_FILES_LABEL    = 2

  enum Result
    Cancel
    DoAction
    DestructiveAction
  end

  def initialize(@views : Array(View))
    builder = builder_for("confirm_dialog")
    builder.connect_signals
    @dialog = Gtk::MessageDialog.cast(builder["root"])

    if @views.size < 2
      @dialog.secondary_text = secondary_text
    else
      contents = Gtk::Box.cast(builder["contents"])
      Gtk::Box.cast(@dialog.message_area).add(contents)
      Gtk::Label.cast(builder["model_label"]).text = model_label
      Gtk::Label.cast(builder["secondary_label"]).text = secondary_text
    end
    @dialog.text = "<span size='larger' weight='bold'>#{primary_text}</span>"
    Gtk::Button.cast(builder["destructive_btn"]).label = destructive_button_label
    Gtk::Button.cast(builder["action_btn"]).label = action_button_label

    @model = Gtk::ListStore.cast(builder["model"])
    toggle = Gtk::CellRendererToggle.cast(builder["toggle"])
    toggle.on_toggled(&->toggle_file(Gtk::CellRendererToggle, String))
    fill_model
    @toogle_status = Array(Bool).new(@views.size, true)

    @dialog.default_response = Result::DoAction.value
    @dialog.ref
  end

  abstract def model_label : String
  abstract def primary_text : String
  abstract def secondary_text : String
  abstract def destructive_button_label : String
  abstract def action_button_label : String

  # Return true if should do something, false on cancel
  # can be called only once.
  def run : Result
    return Result::DestructiveAction if @views.empty?

    res = @dialog.run
    return Result::Cancel if res < 0 || res == Result::Cancel.value
    return Result::DestructiveAction if res == Result::DestructiveAction.value
    return Result::DoAction
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

class ConfirmReloadDialog < ConfirmDialog
  def primary_text : String
    if @views.size < 2
      "Document “#{@views.first.label}” was externally modified. Reload from disk?"
    else
      "Some files were externally modified. Reload contents from disk?"
    end
  end

  def secondary_text : String
    "If you don't reload, changes will be permanently lost on next save."
  end

  def model_label : String
    "Select the files to reload:"
  end

  def destructive_button_label : String
    "Ignore modifications"
  end

  def action_button_label : String
    "Reload"
  end
end

class ConfirmSaveDialog < ConfirmDialog
  def primary_text : String
    if @views.size < 2
      "Save changes to document “#{@views.first.label}” before closing?"
    else
      "There are files with unsaved changes. Save changes before closing?"
    end
  end

  def secondary_text : String
    if @views.size < 2
      "If you don't save, changes will be permanently lost."
    else
      "If you close without saving, all your changes will be permanently lost."
    end
  end

  def model_label : String
    "Select the files to save:"
  end

  def destructive_button_label : String
    "Close without Saving"
  end

  def action_button_label : String
    "Save"
  end
end
