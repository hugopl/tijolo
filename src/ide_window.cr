require "uri"

require "./confirm_dialogs"
require "./find_replace"
require "./git_branches"
require "./locator"
require "./open_files"
require "./project_monitor"
require "./project_tree"
require "./text_view"
require "./window"
require "./tijolo_rc"

class IdeWindow < Window
  include ViewListener
  include OpenFilesListener
  include LocatorListener
  include ProjectListener

  getter project : Project

  @open_files_view : Gtk::TreeView
  @open_files_box : Gtk::Box
  @project_tree_view : Gtk::TreeView
  @branches_view : Gtk::TreeView
  @sidebar : Gtk::Box

  @switching_open_files = false # True if user is switching open files with Ctrl + Tab

  @project_tree : ProjectTree
  @open_files : OpenFiles
  @find_replace : FindReplace
  @locator : Locator
  @branches : GitBranches

  @tijolorc : TijoloRC

  def initialize(application : Application, @project : Project)
    builder = builder_for("ide_window")
    super(application, builder)

    @tijolorc = TijoloRC.instance
    @tijolorc.touch_project(@project.root)
    @project_monitor = ProjectMonitor.new(@project)
    overlay = Gtk::Overlay.cast(builder["editor_overlay"])
    @locator = Locator.new(@project)
    overlay.add_overlay(@locator.locator_widget)

    # Find widget
    @find_replace = FindReplace.new(Gtk::Revealer.cast(builder["find_revealer"]), Gtk::Entry.cast(builder["find_entry"]))

    # Open Files view
    @open_files_view = Gtk::TreeView.cast(builder["open_files_view"])
    @open_files_box = Gtk::Box.cast(builder["open_files"])
    @open_files = OpenFiles.new(Gtk::Stack.cast(builder["stack"]))
    @open_files_view.model = @open_files.sorted_model
    overlay.add_overlay(@open_files_box)

    @sidebar = Gtk::Box.cast(builder["sidebar"])

    @branches = GitBranches.new(@project)
    @branches_view = Gtk::TreeView.cast(builder["git_branches"])
    @branches_view.model = @branches.model

    # Setup Project Tree view
    @project_tree = ProjectTree.new(@project)
    @project_tree_view = Gtk::TreeView.cast(builder["project_tree"])
    @project_tree_view.model = @project_tree.model
    @project_tree_view.on_row_activated &->open_file_from_project_tree(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn)

    main_window.on_key_press_event(&->key_press_event(Gtk::Widget, Gdk::EventKey))
    main_window.on_key_release_event(&->key_release_event(Gtk::Widget, Gdk::EventKey))
    main_window.on_delete_event(&->about_to_quit(Gtk::Widget, Gdk::Event))
    main_window.connect("notify::is-active") { ask_about_externally_modified_files }

    @open_files.add_open_files_listener(self)
    @locator.add_locator_listener(self)
    @project.add_project_listener(self)
    @project.scan_files # To avoid a race condition we scan project files only after we add all listeners to it.

    setup_actions
  end

  def project_file_content_changed(path : Path)
    view = @open_files.view(path)
    return if view.nil?

    view.externally_modified!
    # TODO: Show a passive banner and let user press F5 to reload or ESC to ignore instead of an annoying dialog.
    ask_about_externally_modified_files
  end

  def project_load_finished
    @sidebar.show_all
    # Setup title bar
    application.header_bar.title = @project.name
    application.header_bar.subtitle = relative_path_label(@project.root)

    return if Config.instance.lazy_start_language_servers?

    LanguageManager.start_languages_for(@project.files)
  end

  def key_press_event(widget : Gtk::Widget, event : Gdk::EventKey)
    if event.keyval == Gdk::KEY_Tab && event.state.control_mask?
      @switching_open_files = true
      @open_files.switch_current_view(false)
      @open_files_box.show_all unless @open_files.empty?
      return true
    end
    false
  end

  def key_release_event(widget : Gtk::Widget, event : Gdk::EventKey)
    if @switching_open_files && event.keyval != Gdk::KEY_Tab && event.state.control_mask?
      @switching_open_files = false
      @open_files.switch_current_view(true)
      @open_files_box.hide
      return true
    end
    false
  end

  private def setup_actions
    config = Config.instance
    actions = {show_locator:    ->show_locator,
               close_view:      ->close_current_view,
               save_view:       ->save_current_view,
               save_view_as:    ->save_current_view_as,
               find:            ->find_in_current_view,
               find_next:       ->find_next_in_current_view,
               find_prev:       ->find_prev_in_current_view,
               goto_line:       ->show_goto_line_locator,
               comment_code:    ->comment_code,
               sort_lines:      ->sort_lines,
               goto_definition: ->goto_definition,
    }
    actions.each do |name, closure|
      action = Gio::SimpleAction.new(name.to_s, nil)
      action.on_activate { closure.call }
      main_window.add_action(action)

      shortcut = config.shortcuts[name.to_s]
      application.set_accels_for_action("win.#{name}", {shortcut}) if shortcut
    end

    # View related actions
    uint64 = GLib::VariantType.new("t")
    action = Gio::SimpleAction.new("copy_full_path", uint64)
    action.on_activate(&->copy_view_full_path(Gio::SimpleAction, GLib::Variant?))
    main_window.add_action(action)

    action = Gio::SimpleAction.new("copy_path_and_line", uint64)
    action.on_activate(&->copy_view_path_and_line(Gio::SimpleAction, GLib::Variant?))
    main_window.add_action(action)

    action = Gio::SimpleAction.new("copy_file_name", uint64)
    action.on_activate(&->copy_view_file_name(Gio::SimpleAction, GLib::Variant?))
    main_window.add_action(action)
  end

  private def show_locator
    @locator.show(select_text: true, view: @open_files.current_view)
  end

  def create_view(file : Path? = nil) : View
    @project.try_load_project!(file) if file && !@project.valid?

    # TODO: check file mime type and create the right view.
    view = create_text_view(file)
    @open_files << view
    view
  end

  # Call create_view instead of this.
  private def create_text_view(file_path : Path? = nil) : TextView
    project_path = @project.root if file_path && @project.under_project?(file_path)
    view = TextView.new(file_path, project_path)
    view.add_view_listener(self)
    view.language.file_opened(view)
    view
  end

  private def open_file_from_project_tree(view : Gtk::TreeView, tree_path : Gtk::TreePath, _column : Gtk::TreeViewColumn)
    return if view.value(tree_path, ProjectTree::PROJECT_TREE_IS_DIR).boolean

    file_path = @project_tree.file_path(tree_path)
    open_file(Path.new(file_path)) if file_path
  end

  def locator_open_file(file : String)
    open_file(Path.new(file))
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

  def open_file(file : Path) : View?
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

    ask_about_externally_modified_files

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
        @project.add_path(file_path)
        view.file_path = file_path
      end

      dlg.destroy
      return if res == Gtk::ResponseType::CANCEL.to_i
    end

    path = view.file_path
    if path
      validate_config(view.text) if path == Config.path
      view.save
    end
  rescue e : ConfigError
    application.error("There's an error in your config file", e.message.to_s)
  rescue e : IO::Error
    application.error(e)
  end

  private def validate_config(contents : String)
    Config.replace(Config.new(contents))
  end

  def close_current_view
    view = @open_files.current_view
    return if view.nil?

    @locator.hide
    if view.modified?
      dlg = ConfirmSaveDialog.new([view])
      result = dlg.run
      return if result.cancel?

      save_view(view) if result.do_action?
    end
    @open_files.close_current_view
    view.remove_view_listener(self)

    text_view = view.as?(TextView)
    if text_view
      text_view.language.file_closed(text_view)
      save_cursor(text_view)
    end
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
      view = open_file(Path.new(file)).as?(TextView)
      view.goto(line, col) if view
    end
  rescue e : AppError
    application.error(e)
  end

  private def clipboard
    Gtk::Clipboard.default(Gdk::Display.default.not_nil!)
  end

  private def copy_view_full_path(_action, view_id : GLib::Variant?)
    view = @open_files.view(view_id.uint64) unless view_id.nil?
    return if view.nil?

    path = view.file_path
    return if path.nil?

    text = path.to_s
    clipboard.set_text(text, text.bytesize)
  end

  private def copy_view_path_and_line(_action, view_id : GLib::Variant?)
    view = @open_files.view(view_id.uint64) unless view_id.nil?
    return if view.nil?

    path = view.file_path
    return if path.nil?

    text = "#{path}:#{view.cursor_pos[0] + 1}"
    clipboard.set_text(text, text.bytesize)
  end

  private def copy_view_file_name(_action, view_id : GLib::Variant?)
    view = @open_files.view(view_id.uint64) unless view_id.nil?
    return if view.nil?

    path = view.file_path
    return if path.nil?

    text = path.basename.to_s
    clipboard.set_text(text, text.bytesize)
  end

  def view_escape_pressed(_view)
    @find_replace.hide
  end

  def save_cursor(view : TextView)
    file_path = view.file_path
    return if file_path.nil?

    @tijolorc.save_cursor_position(@project.root, file_path, *view.cursor_pos)
  end

  def ask_about_externally_modified_files
    return unless main_window.active?

    view = @open_files.current_view
    return if view.nil? || !view.externally_modified?

    modified_views = @open_files.files.select(&.externally_modified?)
    dlg = ConfirmReloadDialog.new(modified_views)
    case dlg.run
    when .cancel?    then return
    when .do_action? then dlg.selected_views.each(&.reload)
    end
    modified_views.each(&.externally_unmodified!)
  end

  def about_to_quit(_widget, event) : Bool
    unless @open_files.all_saved?
      dlg = ConfirmSaveDialog.new(@open_files.files.select(&.modified?))
      result = dlg.run
      if result.cancel?
        return true
      elsif result.do_action?
        dlg.selected_views.each do |view|
          save_view(view)
        end
      end
    end
    LanguageManager.shutdown
    # Save all view cursors
    @open_files.files.each do |view|
      save_cursor(view) if view.is_a?(TextView)
    end
    @tijolorc.touch_project(@project.root)
    false
  end
end
