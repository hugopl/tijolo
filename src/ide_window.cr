require "./locator"
require "./open_files"
require "./window"
require "./project_tree"
require "./text_view"

class IdeWindow < Window
  @open_files_view : Gtk::TreeView

  @switching_open_files = false # True if user is switching open files with Ctrl + Tab

  @project_tree : ProjectTree
  @open_files : OpenFiles
  @locator : Locator

  def initialize(application : Application, @project : Project)
    builder = builder_for("ide_window")
    super(application, builder)

    Config.instance.update_last_used_of(@project.root)

    overlay = Gtk::Overlay.cast(builder["editor_overlay"])
    @locator = Locator.new(@project, ->open_file(String))
    overlay.add_overlay(@locator.locator_widget)

    # Open Files view
    @open_files_view = Gtk::TreeView.cast(builder["open_files"])
    @open_files_view.selection.mode = :browse
    @open_files = OpenFiles.new(Gtk::Stack.cast(builder["stack"]))
    @open_files.on_selected_open_file_change { |row| @open_files_view.selection.select_row(row) }
    @open_files_view.model = @open_files.sorted_model
    @open_files_view.on_row_activated &->open_file_from_open_files(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn)

    # Setup accelerators
    setup_actions

    # Setup Project Tree view
    tree_view = Gtk::TreeView.cast(builder["project_tree"])
    tree_view.selection.mode = :browse
    tree_view.on_row_activated &->open_file_from_project_tree(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn)

    @project_tree = ProjectTree.new(@project, Gtk::TreeStore.cast(builder["project_model"]))

    main_window.on_key_press_event(&->key_press_event(Gtk::Widget, Gdk::EventKey))
    main_window.on_key_release_event(&->key_release_event(Gtk::Widget, Gdk::EventKey))

    builder.unref
  end

  def key_press_event(widget : Gtk::Widget, event : Gdk::EventKey)
    if event.keyval == Gdk::KEY_Tab && event.state.control_mask?
      @switching_open_files = true
      @open_files.switch_current_view(false)
      true
    end
    false
  end

  def key_release_event(widget : Gtk::Widget, event : Gdk::EventKey)
    if @switching_open_files && event.keyval != Gdk::KEY_Tab && event.state.control_mask?
      @open_files.switch_current_view(true)
      @switching_open_files = false
      true
    end
    false
  end

  # FIXME: Get shortcuts from a config file
  private def setup_actions
    show_locator = Gio::SimpleAction.new("show_locator", nil)
    show_locator.on_activate { @locator.show }
    main_window.add_action(show_locator)
    application.set_accels_for_action("win.show_locator", {"<Control>P"})

    new_file = Gio::SimpleAction.new("new_file", nil)
    new_file.on_activate { create_text_view(nil) }
    main_window.add_action(new_file)
    application.set_accels_for_action("win.new_file", {"<Control>N"})

    close_view = Gio::SimpleAction.new("close_view", nil)
    close_view.on_activate { @open_files.close_current_view }
    main_window.add_action(close_view)
    application.set_accels_for_action("win.close_view", {"<Control>W"})

    save_view = Gio::SimpleAction.new("save_view", nil)
    save_view.on_activate { save_current_view }
    main_window.add_action(save_view)
    application.set_accels_for_action("win.save_view", {"<Control>S"})
  end

  private def create_text_view(file : String?) : TextView
    @open_files << TextView.new(file)
  end

  private def open_file_from_open_files(view : Gtk::TreeView, path : Gtk::TreePath, _column : Gtk::TreeViewColumn)
    view_id = view.value(path, OpenFiles::OPEN_FILES_VIEW_ID).uint64
    view = @open_files.view(view_id)
    @open_files.show_view(view) unless view.nil?
  end

  private def open_file_from_project_tree(view : Gtk::TreeView, path : Gtk::TreePath, _column : Gtk::TreeViewColumn)
    return if view.value(path, ProjectTree::PROJECT_TREE_IS_DIR).boolean

    open_file(view.value(path, ProjectTree::PROJECT_TREE_PATH).string)
  end

  def open_file(file : String)
    text_view = @open_files.view(file)
    if text_view.nil?
      create_text_view(file)
    else
      @open_files.show_view(text_view)
    end
  rescue e : IO::Error
    application.error(e)
  end

  def save_current_view
    view = @open_files.current_view
    return if view.nil?

    if view.file_path.nil?
      dlg = Gtk::FileChooserDialog.new(title: "Save file", action: :save, local_only: true, modal: true, do_overwrite_confirmation: true)
      dlg.add_button("Cancel", Gtk::ResponseType::CANCEL.to_i)
      dlg.add_button("Save", Gtk::ResponseType::ACCEPT.to_i)
      res = dlg.run
      if res == Gtk::ResponseType::ACCEPT.to_i
        file_path = Path.new(dlg.filename.to_s).expand
        @project.add_file(file_path)
        view.file_path = file_path
      end

      dlg.destroy
    end

    view.save unless view.file_path.nil?
  rescue e : IO::Error
    application.error(e)
  end
end
