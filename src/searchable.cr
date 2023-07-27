module Searchable
  private getter! search_bar : Gtk::SearchBar?
  private getter! search_entry : Gtk::Entry

  def setup_search_bar
    @search_bar = search_bar = Gtk::SearchBar.new(valign: :start)
    append(search_bar)

    v_box = Gtk::Box.new(:vertical, 0)
    v_box.hexpand = true
    occurences_label = Gtk::Label.new("0 occurrences")
    occurences_label.halign = :start
    occurences_label.add_css_class("dim-label")
    v_box.append(occurences_label)
    search_bar.child = v_box

    search_box = Gtk::Box.new(:horizontal, 6)
    v_box.append(search_box)

    @search_entry = search_entry = Gtk::Entry.new(hexpand: true,
      primary_icon_name: "edit-find-symbolic",
      primary_icon_activatable: false,
      primary_icon_sensitive: false,
      width_request: 300)

    sc_controller = Gtk::ShortcutController.new(propagation_phase: :capture)
    action = Gtk::CallbackAction.new(->(w : Gtk::Widget, v : GLib::Variant?) { search_stop; true })
    shortcut = Gtk::Shortcut.new(action: action, trigger: Gtk::ShortcutTrigger.parse_string("Escape"))
    sc_controller.add_shortcut(shortcut)

    action = Gtk::CallbackAction.new(->(w : Gtk::Widget, v : GLib::Variant?) { search_next; true })
    shortcut = Gtk::Shortcut.new(action: action, trigger: Gtk::ShortcutTrigger.parse_string("F3"))
    sc_controller.add_shortcut(shortcut)

    action = Gtk::CallbackAction.new(->(w : Gtk::Widget, v : GLib::Variant?) { search_previous; true })
    shortcut = Gtk::Shortcut.new(action: action, trigger: Gtk::ShortcutTrigger.parse_string("<Shift>F3"))
    sc_controller.add_shortcut(shortcut)

    search_entry.add_controller(sc_controller)

    prev_btn = Gtk::Button.new(icon_name: "go-up-symbolic", action_name: "view.search_previous")
    next_btn = Gtk::Button.new(icon_name: "go-down-symbolic", action_name: "view.search_next")
    replace_mode_btn = Gtk::ToggleButton.new(icon_name: "edit-find-replace-symbolic")
    close_btn = Gtk::Button.new(icon_name: "window-close-symbolic", action_name: "view.search_stop")
    close_btn.add_css_class("circular")
    search_box.append(search_entry)
    search_box.append(prev_btn)
    search_box.append(next_btn)
    search_box.append(replace_mode_btn)
    search_box.append(close_btn)
    search_bar.connect_entry(search_entry)

    @editor.bind_property("search_occurences", occurences_label, "label", :default)
    search_entry.changed_signal.connect { search_changed(search_entry.text) }
  end

  def setup_actions(action_group : Gio::SimpleActionGroup)
    {% for action in %w(search_start search_replace_start search_next search_previous search_stop) %}
      action = Gio::SimpleAction.new({{ action }}, nil)
      connect(action.activate_signal) { {{ action.id }} }
      action_group.add_action(action)
    {% end %}
  end

  private def search_start
    search_bar.search_mode = true
    search_entry.text = search_started
    search_entry.grab_focus
  end

  private def search_replace_start
    Log.warn { "search_replace_start not implemented." }
  end

  abstract def search_started
  abstract def search_replace_started
  abstract def search_changed(text : String)
  abstract def search_next
  abstract def search_previous
  abstract def search_stopped

  def search_stop
    search_bar.search_mode = false
    activate_action("win.focus_editor", nil)
  end

  def search_replace
    Log.warn { "Search/replace not implementet yet." }
  end
end
