require "uri"

require "./confirm_save_dialog"
require "./find_replace"
require "./locator"
require "./open_files"
require "./window"
require "./project_monitor"
require "./project_tree"
require "./text_view"

class IdeWindow < Window
  include ViewListener
  include OpenFilesListener
  include LocatorListener

  @open_files_view : Gtk::TreeView
  @project_tree_view : Gtk::TreeView

  @switching_open_files = false # True if user is switching open files with Ctrl + Tab
  @fullscreen = false

  @project_tree : ProjectTree
  @open_files : OpenFiles
  @find_replace : FindReplace
  @locator : Locator

  def initialize(application : Application, @project : Project)
    builder = builder_for("ide_window")
    super(application, builder)

    Config.instance.update_last_used_of(@project.root)

    @project_monitor = ProjectMonitor.new(@project)
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
    main_window.on_delete_event(&->about_to_quit(Gtk::Widget, Gdk::Event))

    @open_files.add_open_files_listener(self)
    @locator.add_locator_listener(self)

    setup_actions
  end

  def key_press_event(widget : Gtk::Widget, event : Gdk::EventKey)
    if event.keyval == Gdk::KEY_Tab && event.state.control_mask?
      @switching_open_files = true
      @open_files.switch_current_view(false)
      return true
    end
    false
  end

  def key_release_event(widget : Gtk::Widget, event : Gdk::EventKey)
    if @switching_open_files && event.keyval != Gdk::KEY_Tab && event.state.control_mask?
      @switching_open_files = false
      @open_files.switch_current_view(true)
      return true
    end
    false
  end

  private def setup_actions
    config = Config.instance
    actions = { {"show_locator", ->show_locator},
               {"new_file", ->create_text_view},
               {"open_file", ->open_file_dlg},
               {"close_view", ->close_current_view},
               {"save_view", ->save_current_view},
               {"save_view_as", ->save_current_view_as},
               {"find", ->find_in_current_view},
               {"find_next", ->find_next_in_current_view},
               {"find_prev", ->find_prev_in_current_view},
               {"goto_line", ->show_goto_line_locator},
               {"comment_code", ->comment_code},
               {"sort_lines", ->sort_lines},
               {"fullscreen", ->fullscreen},
               {"goto_definition", ->goto_definition},
    }
    actions.each do |(name, closure)|
      g_action = Gio::SimpleAction.new(name, nil)
      g_action.on_activate { closure.call }
      main_window.add_action(g_action)
      shortcut = config.shortcuts[name]? || config.default_shortcuts[name]
      application.set_accels_for_action("win.#{name}", {shortcut})
    end
  end

  private def show_locator
    @locator.show(select_text: true, view: @open_files.current_view)
  end

  private def create_view(file : String) : View
    # TODO: check file mime type and create the right view.
    create_text_view(file)
  end

  private def create_text_view(file : String? = nil) : TextView
    view = TextView.new(file)
    view.add_view_listener(self)
    @open_files << view

    view.language.file_opened(view)
    view
  end

  private def open_file_from_open_files(view : Gtk::TreeView, path : Gtk::TreePath, _column : Gtk::TreeViewColumn)
    view_id = view.value(path, OpenFiles::OPEN_FILES_VIEW_ID).uint64
    view = @open_files.view(view_id)
    @open_files.show_view(view) unless view.nil?
  end

  private def open_file_from_project_tree(view : Gtk::TreeView, tree_path : Gtk::TreePath, _column : Gtk::TreeViewColumn)
    return if view.value(tree_path, ProjectTree::PROJECT_TREE_IS_DIR).boolean

    file_path = @project_tree.file_path(tree_path)
    open_file(file_path) if file_path
  end

  def locator_open_file(file : String)
    open_file(file)
  end

  def locator_goto_line_col(line : Int32, column : Int32)
    view = @open_files.current_view.as?(TextView)
    return if view.nil?

    view.goto(line, column)
    view.grab_focus
  end

  def show_goto_line_locator
    return if @open_files.empty?

    @locator.text = "l "
    @locator.show(select_text: false, view: @open_files.current_view)
  end

  def open_file(file : String) : View?
    view = @open_files.view(file)
    if view.nil?
      view = create_view(file)
    else
      @open_files.show_view(view)
    end
    view.grab_focus
    view
  rescue e : IO::Error
    application.error(e)
  end

  def open_files_view_revealed(view, definitive)
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
    save_view(view) if view
  end

  def save_current_view_as
    view = @open_files.current_view
    if view
      path = view.file_path
      save_view(view, path)
    end
  end

  def save_view(view : View, path : Path? = nil)
    if view.file_path.nil? || path
      dlg = Gtk::FileChooserDialog.new(title: "Save file", action: :save, local_only: true, modal: true, do_overwrite_confirmation: true)
      dlg.current_name = view.label
      dlg.uri = path.to_uri.to_s unless path.nil?
      dlg.add_button("Cancel", Gtk::ResponseType::CANCEL.to_i)
      dlg.add_button("Save", Gtk::ResponseType::ACCEPT.to_i)
      res = dlg.run
      if res == Gtk::ResponseType::ACCEPT.to_i
        file_path = Path.new(dlg.filename.to_s).expand
        @project.add_file(file_path)
        view.file_path = file_path
      end

      dlg.destroy
      return if res == Gtk::ResponseType::CANCEL.to_i
    end

    view.save unless view.file_path.nil?
  rescue e : IO::Error
    application.error(e)
  end

  private def open_file_dlg
    dlg = Gtk::FileChooserDialog.new(title: "Open file", action: :open, local_only: true, modal: true)
    dlg.add_button("Cancel", Gtk::ResponseType::CANCEL.value)
    dlg.add_button("Open", Gtk::ResponseType::ACCEPT.value)
    dlg.current_folder_uri = @project.root.to_uri.to_s

    if dlg.run == Gtk::ResponseType::ACCEPT.value
      uri = dlg.uri
      open_file(URI.parse(uri).full_path) if uri
    end
  ensure
    dlg.try(&.destroy)
  end

  def close_current_view
    view = @open_files.current_view
    return if view.nil?

    @locator.hide
    if view.modified?
      dlg = ConfirmSaveDialog.new([view])
      result = dlg.run
      return if result.cancel?

      save_view(view) if result.save?
    end
    @open_files.close_current_view
    view.remove_view_listener(self)

    text_view = view.as?(TextView)
    text_view.language.file_closed(text_view) if text_view
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

  # TODO: Write a macro to do this repeated code when we get more text views shortcuts
  def comment_code
    view = @open_files.current_view
    view.comment_action if view && view.focus?
  end

  def sort_lines
    view = @open_files.current_view
    view.sort_lines_action if view && view.focus?
  end

  def goto_definition
    text_view = @open_files.current_view.as?(TextView)
    return if text_view.nil? || !text_view.focus?

    path = text_view.file_path
    return if path.nil?

    text_view.language.goto_definition(path, *text_view.cursor_pos) do |file, line, col|
      view = open_file(file).as?(TextView)
      view.goto(line, col) if view
    end
  rescue e : AppError
    application.error(e)
  end

  def view_escape_pressed(_view)
    @find_replace.hide
  end

  def fullscreen
    if @fullscreen
      main_window.unfullscreen
    else
      main_window.fullscreen
    end
    @fullscreen = !@fullscreen
  end

  def about_to_quit(_widget, event) : Bool
    unless @open_files.all_saved?
      dlg = ConfirmSaveDialog.new(@open_files.files.select(&.modified?))
      result = dlg.run
      if result.cancel?
        return true
      elsif result.save?
        dlg.selected_views.each do |view|
          save_view(view)
        end
      end
    end
    LanguageManager.shutdown
    false
  end
end
