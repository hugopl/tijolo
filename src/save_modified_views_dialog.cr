class SaveModifiedViewsDialog < Adw::MessageDialog
  @checkboxes = Hash(Gtk::CheckButton, View).new

  def initialize(parent : Gtk::Window, views : Array(View))
    super(transient_for: parent,
      modal: true,
      heading: "Save Changes?",
      body: "Open documents contain unsaved changes. Changes which are not saved will be permanently lost.")

    add_response("cancel", "Cancel")
    add_response("discard_all", "Discard All")
    set_response_appearance("discard_all", :destructive)
    add_response("save", "Save")
    set_response_appearance("save", :suggested)
    self.default_response = "save"

    group = Adw::PreferencesGroup.new
    views.each do |view|
      group.add(create_action_row(view))
    end
    self.extra_child = group
  end

  def present(&on_success : Proc(Nil))
    response_signal.connect do |resp|
      if resp == "save"
        save_views
        on_success.call
      elsif resp == "discard_all"
        on_success.call
      end
      @checkboxes.clear
      destroy
    end
    self.present
  end

  private def save_views
    @checkboxes.each do |checkbox, view|
      view.save if checkbox.active?
    end
  end

  private def create_action_row(view : View) : Adw::ActionRow
    resource = view.resource_hint
    row = Adw::ActionRow.new(title: resource.basename.to_s, subtitle: resource.dirname.to_s)
    checkbox = Gtk::CheckButton.new(active: true)
    row.add_prefix(checkbox)
    row.activatable_widget = checkbox
    @checkboxes[checkbox] = view

    row
  end
end
