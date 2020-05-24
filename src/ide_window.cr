require "./find_replace"
require "./locator"
require "./open_files"
require "./window"
require "./project_tree"
require "./text_view"

class IdeWindow < Window
  include TextViewListener
  include OpenFilesListener
  include LocatorListener

  @open_files_view : Gtk::TreeView
  @project_tree_view : Gtk::TreeView

  @switching_open_files = false # True if user is switching open files with Ctrl + Tab

  @project_tree : ProjectTree
  @open_files : OpenFiles
  @find_replace : FindReplace
  @locator : Locator

  def initialize(application : Application, @project : Project)
    builder = builder_for("ide_window")
    super(application, builder)

    Config.instance.update_last_used_of(@project.root)

    overlay = Gtk::Overlay.cast(builder["editor_overlay"])
    @locator = Locator.new(@project)
    overlay.add_overlay(@locator.locator_widget)

    # Find widget
    @find_replace = FindReplace.new(Gtk::Revealer.cast(builder["find_revealer"]), Gtk::Entry.cast(builder["find_entry"]))

    # Open Files view
    @open_files_view = Gtk::TreeView.cast(builder["open_files"])
    @open_files_view.selection.mode = :browse
    @open_files = OpenFiles.new(Gtk::Stack.cast(builder["stack"]))
    @open_files_view.model = @open_files.sorted_model
    @open_files_view.on_row_activated &->open_file_from_open_files(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn)

    # Setup Project Tree view
    @project_tree = ProjectTree.new(@project)
    @project_tree_view = Gtk::TreeView.cast(builder["project_tree"])
    @project_tree_view.model = @project_tree.model
    @project_tree_view.selection.mode = :browse
    @project_tree_view.on_row_activated &->open_file_from_project_tree(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn)

    main_window.on_key_press_event(&->key_press_event(Gtk::Widget, Gdk::EventKey))
    main_window.on_key_release_event(&->key_release_event(Gtk::Widget, Gdk::EventKey))

    @open_files.add_listener(self)
    @locator.add_listener(self)

    setup_actions
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

  private def setup_actions
    config = Config.instance
    actions = { {"show_locator", ->{ @locator.show }},
               {"new_file", ->create_text_view},
               {"close_view", ->close_current_view},
               {"save_view", ->save_current_view},
               {"find", ->find_in_current_view},
               {"find_next", ->find_next_in_current_view},
               {"find_prev", ->find_prev_in_current_view} }
    actions.each do |(name, closure)|
      g_action = Gio::SimpleAction.new(name, nil)
      g_action.on_activate { closure.call }
      main_window.add_action(g_action)
      shortcut = config.shortcuts[name]? || config.default_shortcuts[name]
      application.set_accels_for_action("win.#{name}", {shortcut})
    end
  end

  private def create_text_view(file : String? = nil) : TextView
    view = TextView.new(file)
    view.add_listener(self)
    @open_files << view
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

  def locator_open_file(file : String)
    open_file(file)
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

  def open_file_view_revealed(view, definitive)
    @open_files_view.selection.select_row(@open_files.current_row)
    return unless definitive

    @find_replace.hide
    # Select file on project tree view
    file = view.file_path
    return if file.nil?

    path = @project_tree.tree_path(file)
    if path
      tree_path = Gtk::TreePath.new_from_indices(path)
      @project_tree_view.expand_to_path(tree_path)
      @project_tree_view.set_cursor(tree_path, nil, false)
    end
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

  def close_current_view
    view = @open_files.close_current_view
    view.try(&.remove_listener(self))
  end

  def find_in_current_view
    view = @open_files.current_view
    @find_replace.show(view) unless view.nil?
  end

  def find_next_in_current_view
    @find_replace.find_next
  end

  def find_prev_in_current_view
    @find_replace.find_prev
  end

  # from TextViewListener
  def escape_pressed
    @find_replace.hide
  end
end
