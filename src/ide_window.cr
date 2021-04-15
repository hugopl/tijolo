require "uri"

require "./confirm_dialogs"
require "./cursor_history"
require "./find_replace"
require "./git_branches"
require "./image_view"
require "./locator"
require "./notification_area"
require "./project_monitor"
require "./project_tree"
require "./terminal_view.cr"
require "./text_view"
require "./tijolo_log_backend"
require "./tijolo_rc"
require "./view_manager"
require "./window"

class IdeWindow < Window
  include ViewListener
  include ViewManagerListener
  include LocatorListener
  include ProjectListener

  getter project : Project

  @open_files_box : Gtk::Box
  @project_tree_view : Gtk::TreeView
  @branches_view : Gtk::TreeView
  @sidebar : Gtk::Box
  @output_pane : Gtk::Notebook

  @switching_open_files = false # True if user is switching open files with Ctrl + Tab
  # True if user pressed cancel on dlg about reload externally modified files
  # So we don't show th edialog again when main window regain focus.
  @inhibit_modified_files_dlg = false

  @project_tree : ProjectTree
  @view_manager : ViewManager
  @find_replace : FindReplace
  @locator : Locator
  @branches : GitBranches
  @cursor_history : CursorHistory
  @lang_manager : LanguageManager

  @tijolorc : TijoloRC

  delegate focus_upper_split, to: @view_manager
  delegate focus_right_split, to: @view_manager
  delegate focus_lower_split, to: @view_manager
  delegate focus_left_split, to: @view_manager
  delegate maximize_view, to: @view_manager

  def initialize(application : Application, @project : Project)
    builder = builder_for("ide_window")
    super(application, builder)

    @tijolorc = TijoloRC.instance
    @tijolorc.touch_project(@project.root)
    @project_monitor = ProjectMonitor.new(@project)
    @lang_manager = LanguageManager.new
    overlay = Gtk::Overlay.cast(builder["editor_overlay"])
    @locator = Locator.new(@project)
    overlay.add_overlay(@locator.locator_widget)

    notification_area = NotificationArea.new
    overlay.add_overlay(notification_area.widget)
    overlay.set_overlay_pass_through(notification_area.widget, true)

    @cursor_history = CursorHistory.new

    # Find widget
    @find_replace = FindReplace.new
    editor_box = Gtk::Box.cast(builder["editor_box"])
    editor_box.pack_end(@find_replace.widget, fill: true, expand: false, padding: 0)
    editor_box.reorder_child(@find_replace.widget, 1)

    # Open Files view
    view_manager_view = Gtk::TreeView.cast(builder["view_manager_view"])
    @open_files_box = Gtk::Box.cast(builder["open_files"])
    @view_manager = ViewManager.new(view_manager_view)
    editor_box = Gtk::Box.cast(builder["editor_box"])
    editor_box.pack_start(@view_manager.widget, true, true, 0)
    overlay.add_overlay(@open_files_box)

    @sidebar = Gtk::Box.cast(builder["sidebar"])
    @output_pane = Gtk::Notebook.cast(builder["output_pane"])

    @branches = GitBranches.new(@project)
    @branches_view = Gtk::TreeView.cast(builder["git_branches"])
    @branches_view.model = @branches.model
    @branches_view.on_row_activated(&->switch_branch_from_branches_view(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn))

    # Setup Project Tree view
    @project_tree = ProjectTree.new(@project)
    @project_tree_view = Gtk::TreeView.cast(builder["project_tree"])
    @project_tree_view.model = @project_tree.model
    @project_tree_view.on_row_activated(&->open_file_from_project_tree(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn))

    main_window.on_key_press_event(&->key_press_event(Gtk::Widget, Gdk::EventKey))
    main_window.on_key_release_event(&->key_release_event(Gtk::Widget, Gdk::EventKey))
    main_window.on_delete_event(&->about_to_quit(Gtk::Widget, Gdk::Event))
    main_window.connect("notify::is-active") { main_window_active_changed }

    logger = TijoloLogBackend.instance
    logger.gtk_buffer = Gtk::TextView.cast(builder["log"]).buffer

    @view_manager.add_view_manager_listener(self)
    @locator.add_locator_listener(self)
    @project.add_project_listener(self)
    @project.scan_files # To avoid a race condition we scan project files only after we add all listeners to it.

    setup_actions
  end

  def main_window_active_changed
    return unless main_window.active?

    if @inhibit_modified_files_dlg
      @inhibit_modified_files_dlg = false
      return
    end
    ask_about_externally_modified_files
  end

  def project_load_finished
    @sidebar.show_all
    # Setup title bar
    application.header_bar.title = @project.name
    application.header_bar.subtitle = relative_path_label(@project.root)
    application.destroy_welcome
    # Need this to let GTK resize the git branches view
    Gtk::Container.cast(root).check_resize

    @lang_manager.start_languages_for(@project.files) unless Config.instance.lazy_start_language_servers?
  end

  def key_press_event(widget : Gtk::Widget, event : Gdk::EventKey)
    if event.keyval == Gdk::KEY_Escape
      @locator.hide if @locator.visible?
      @find_replace.hide
      focus_editor
      return true
    end
    # FIXME: This must be configurable, since I have no idea if this works on non-US keyboards
    if event.state.control_mask? && event.keyval.in?({Gdk::KEY_Tab, Gdk::KEY_dead_grave})
      if @view_manager.rotate_views(reverse: event.keyval == Gdk::KEY_dead_grave)
        @open_files_box.show_all
        @switching_open_files = true
      end
      return true
    end
    false
  end

  def key_release_event(widget : Gtk::Widget, event : Gdk::EventKey)
    if @switching_open_files && event.state.control_mask? && !event.keyval.in?({Gdk::KEY_Tab, Gdk::KEY_dead_grave})
      @switching_open_files = false
      @view_manager.change_to_highlighted_view
      @open_files_box.hide
      return true
    end
    false
  end

  private def setup_actions
    config = Config.instance
    actions = {show_locator:              ->show_locator,
               show_locator_new_split:    ->{ show_locator(split_view: true) },
               show_git_locator:          ->show_git_locator,
               close_view:                ->close_current_view,
               close_all_views:           ->close_all_views,
               save_view:                 ->save_current_view,
               save_view_as:              ->save_current_view_as,
               find:                      ->{ find_in_current_view(:find_by_text) },
               find_by_regexp:            ->{ find_in_current_view(:find_by_regexp) },
               find_replace:              ->{ find_in_current_view(:find_replace) },
               find_next:                 ->find_next_in_current_view,
               find_prev:                 ->find_prev_in_current_view,
               goto_line:                 ->show_goto_line_locator,
               comment_code:              ->comment_code,
               sort_lines:                ->sort_lines,
               goto_definition:           ->goto_definition,
               goto_definition_new_split: ->{ goto_definition(split_view: true) },
               show_hide_sidebar:         ->show_hide_sidebar,
               show_hide_output_pane:     ->show_hide_output_pane,
               focus_editor:              ->focus_editor,
               go_back:                   ->go_back,
               go_forward:                ->go_forward,
               focus_upper_split:         ->focus_upper_split,
               focus_right_split:         ->focus_right_split,
               focus_lower_split:         ->focus_lower_split,
               focus_left_split:          ->focus_left_split,
               increase_font_size:        ->increase_current_view_font_size,
               decrease_font_size:        ->decrease_current_view_font_size,
               maximize_view:             ->maximize_view,
               copy_in_terminal:          ->copy_terminal_text,
               paste_in_terminal:         ->paste_terminal_text,
    }
    actions.each do |name, closure|
      action = Gio::SimpleAction.new(name.to_s, nil)
      action.on_activate { closure.call }
      main_window.add_action(action)

      shortcut = config.shortcuts[name.to_s]
      application.set_accels_for_action("win.#{name}", {shortcut})
    end

    # View related actions
    uint64 = GLib::VariantType.new("t")
    action = Gio::SimpleAction.new("copy_full_path", uint64)
    action.on_activate(&->copy_view_full_path(Gio::SimpleAction, GLib::Variant?))
    main_window.add_action(action)

    action = Gio::SimpleAction.new("copy_full_path_and_line", uint64)
    action.on_activate(&->copy_view_full_path_and_line(Gio::SimpleAction, GLib::Variant?))
    main_window.add_action(action)

    action = Gio::SimpleAction.new("copy_file_name", uint64)
    action.on_activate(&->copy_view_file_name(Gio::SimpleAction, GLib::Variant?))
    main_window.add_action(action)

    action = Gio::SimpleAction.new("copy_relative_path", uint64)
    action.on_activate(&->copy_view_relative_path(Gio::SimpleAction, GLib::Variant?))
    main_window.add_action(action)

    action = Gio::SimpleAction.new("copy_relative_path_and_line", uint64)
    action.on_activate(&->copy_view_relative_path_and_line(Gio::SimpleAction, GLib::Variant?))
    main_window.add_action(action)
  end

  private def show_locator(split_view = false)
    @locator.show(select_text: true, view: @view_manager.current_view, split_view: split_view)
  end

  private def show_git_locator
    @locator.text = "g "
    @locator.show(select_text: false, view: @view_manager.current_view)
  end

  def show_goto_line_locator
    return if @view_manager.empty?

    @locator.text = "l "
    @locator.show(select_text: false, view: @view_manager.current_view)
  end

  def create_view(file : Path? = nil, split_view = false) : View
    @project.try_load_project!(file) if file && !@project.valid?
    project_path = @project.root if file && @project.under_project?(file)

    application.add_recent_file(file) if file && project_path.nil?

    # TODO: Do this more dinamically... let the views tell us what they can open instead of this
    view = case file.try(&.extension)
           when /\.(png|jpg|jpeg|bmp)/i
             ImageView.new(file.not_nil!, project_path)
           else
             create_text_view(file, project_path)
           end
    @view_manager.add_view(view, split_view)
    view.add_view_listener(self)
    view
  end

  def create_terminal
    view = TerminalView.new
    @view_manager.add_view(view, true)
    view.add_view_listener(self)
  end

  # Call create_view instead of this.
  private def create_text_view(file_path : Path? = nil, project_path : Path? = nil) : TextView
    view = TextView.new(@lang_manager, file_path, project_path)
    view.language.file_opened(view)
    view
  end

  private def switch_branch_from_branches_view(view : Gtk::TreeView, tree_path : Gtk::TreePath, _col : Gtk::TreeViewColumn)
    @branches.switch_branch(tree_path)
  rescue e : Git::Error
    application.error("Git operation failed", e.message.to_s)
  end

  private def open_file_from_project_tree(view : Gtk::TreeView, tree_path : Gtk::TreePath, _column : Gtk::TreeViewColumn)
    return if view.value(tree_path, ProjectTree::PROJECT_TREE_IS_DIR).boolean

    file_path = @project_tree.file_path(tree_path)
    open_file(Path.new(file_path)) if file_path
  end

  def locator_open_file(file : String, split_view : Bool)
    open_file(Path.new(file), split_view)
  end

  def locator_show_special_file(contents : String, label : String, syntax : String?)
    view = create_view.as(TextView)
    view.text = contents
    view.readonly = true
    view.virtual = true
    view.label = label
    if syntax
      lang = @lang_manager.find(syntax)
      view.language = lang
    end

    view.cursor_pos = {0, 0}
  end

  def locator_goto_line_col(line : Int32, column : Int32)
    view = @view_manager.current_view.as?(TextView)
    return if view.nil?

    view.goto(line, column)
    view.grab_focus
  end

  def locator_hidden
    view = @view_manager.current_view
    view.grab_focus if view
  end

  def open_file(file : Path, split_view = false, restore_state = true) : View?
    view = @view_manager.view(file)
    if view.nil?
      view = create_view(file, split_view)
      view.restore_state if restore_state
    else
      @view_manager.change_current_view(view)
    end
    view
  rescue e : IO::Error
    application.error(e)
  end

  def open_file(cursor : CursorHistory::Cursor) : View?
    # TODO: Remove this trace once the feature feels stable enough.
    Log.trace do
      String.build do |str|
        str.puts
        @cursor_history.items.each_with_index do |i, idx|
          a = idx == @cursor_history.idx ? "*" : " "
          str.puts "#{a} #{i.file_path.basename}:#{i.line}"
        end
      end
    end

    view = @view_manager.view(cursor.file_path)
    if view.nil?
      view = create_view(cursor.file_path)
    else
      @view_manager.change_current_view(view)
    end

    path = view.file_path # FIXME Nto workign with unsaved file is a problem.
    return if path.nil? || !view.is_a?(TextView)

    update_text_mark(view)
    view.goto(cursor)
    view
  rescue e : IO::Error
    application.error(e)
  end

  def view_manager_current_view_changed(view)
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
    view = @view_manager.current_view
    save_view(view) if view && !view.virtual?
  end

  def save_current_view_as
    view = @view_manager.current_view
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
        # New, unsaved files, have no project path until they are saved.
        view.project_path = @project.root if view.project_path.nil?
        view.file_path = file_path
      end

      dlg.destroy
      return if res == Gtk::ResponseType::CANCEL.to_i
    end

    path = view.file_path
    if path && view.is_a?(TextView)
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
    view = @view_manager.current_view
    close_view(view) if view
  end

  def close_all_views
    # Close in reverse order to avoid a lot of things to run
    @view_manager.views.reverse.each do |view|
      close_view(view)
    end
  end

  def close_view(view : View)
    @locator.hide
    if view.modified?
      dlg = ConfirmSaveDialog.new(main_window, [view] of View)
      result = dlg.run
      return if result.cancel?

      save_view(view) if result.do_action?
    end
    @view_manager.close_current_view
    view.remove_view_listener(self)
    @locator.view_closed(view)

    text_view = view.as?(TextView)
    if text_view
      text_view.language.file_closed(text_view)
      save_cursor(text_view)
    end

    application.init_welcome if @view_manager.empty? && !@project.valid?
  end

  def find_in_current_view(mode : FindReplace::Mode)
    view = @view_manager.current_view.as?(TextView)
    @find_replace.show(view, mode) if view
  end

  def find_next_in_current_view
    view = @view_manager.current_view.as?(TextView)
    @find_replace.find_next(view)
  end

  def find_prev_in_current_view
    view = @view_manager.current_view.as?(TextView)
    @find_replace.find_prev(view)
  end

  def increase_current_view_font_size
    view = @view_manager.current_view.as?(TextView)
    return if view.nil?

    view.font_size += 1
  end

  def decrease_current_view_font_size
    view = @view_manager.current_view.as?(TextView)
    return if view.nil?

    view.font_size -= 1
  end

  def comment_code
    view = @view_manager.current_view.as?(TextView)
    view.comment_action if view && view.focus?
  end

  def sort_lines
    view = @view_manager.current_view.as?(TextView)
    view.sort_lines_action if view && view.focus?
  end

  def goto_definition(split_view = false)
    text_view = @view_manager.current_view.as?(TextView)
    return if text_view.nil? || !text_view.focus?

    path = text_view.file_path
    return if path.nil?

    text_view.language.goto_definition(path, *text_view.cursor_pos) do |locations|
      if locations.empty?
        Log.info(&.emit("No definition found.", notify: true))
        next
      end

      # TODO: Show a dropdown in case of multiple entries.
      location = locations.first
      cursor_location = location.range.start

      view = open_file(location.uri_full_path, split_view, false).as?(TextView)
      view.goto(cursor_location.line, cursor_location.character) if view
    end
  rescue e : AppError
    application.error(e)
  end

  def show_hide_sidebar
    @sidebar.visible? ? @sidebar.hide : @sidebar.show if @project.valid?
  end

  def show_hide_output_pane
    @output_pane.visible? ? @output_pane.hide : @output_pane.show if @project.valid?
  end

  def focus_editor
    @view_manager.current_view.try(&.grab_focus)
  end

  def copy_terminal_text
    view = @view_manager.current_view
    view.copy_text_to_clipboard if view.is_a?(TerminalView)
  end

  def paste_terminal_text
    view = @view_manager.current_view
    view.paste_text_from_clipboard if view.is_a?(TerminalView)
  end

  private def clipboard
    Gtk::Clipboard.default(Gdk::Display.default.not_nil!)
  end

  private def with_view_and_path(view_id : UInt64?)
    view = @view_manager.view(view_id)
    return if view.nil?

    path = view.file_path
    yield(view, path) if path
  end

  private def copy_view_full_path(_action, view_id : GLib::Variant?)
    return if view_id.nil?

    with_view_and_path(view_id.uint64) do |_view, path|
      clipboard.text = path.to_s
    end
  end

  private def copy_view_full_path_and_line(_action, view_id : GLib::Variant?)
    return if view_id.nil?

    with_view_and_path(view_id.uint64) do |view, path|
      clipboard.text = "#{path}:#{view.cursor_pos[0] + 1}"
    end
  end

  private def copy_view_file_name(_action, view_id : GLib::Variant?)
    return if view_id.nil?

    with_view_and_path(view_id.uint64) do |_view, path|
      clipboard.text = path.basename.to_s
    end
  end

  private def copy_view_relative_path(_action, view_id : GLib::Variant?)
    return if view_id.nil?

    with_view_and_path(view_id.uint64) do |_view, path|
      clipboard.text = path.relative_to(@project.root).to_s
    end
  end

  private def copy_view_relative_path_and_line(_action, view_id : GLib::Variant?)
    return if view_id.nil?

    with_view_and_path(view_id.uint64) do |view, path|
      clipboard.text = "#{path.relative_to(@project.root)}:#{view.cursor_pos[0] + 1}"
    end
  end

  # Go back on cursor position history
  def go_back
    cursor = @cursor_history.prev
    open_file(cursor) if cursor
  end

  # Go forward on cursor position history
  def go_forward
    cursor = @cursor_history.next
    open_file(cursor) if cursor
  end

  def view_cursor_location_changed(view : View, line : Int32, column : Int32)
    path = view.file_path
    return if path.nil?

    mark_name = @cursor_history.add(path, line, column)
    view.create_mark(mark_name, line, column) unless mark_name.nil?
  end

  def view_focused(view : View)
    update_text_mark(view) if view.is_a?(TextView)
  end

  def view_close_requested(view : View)
    close_view(view)
  end

  private def update_text_mark(view : TextView)
    line, column = view.cursor_pos
    path = view.file_path
    return if path.nil?

    mark_name, update = @cursor_history.add!(path, line, column)
    if update
      view.update_mark(mark_name, line, column)
    else
      view.create_mark(mark_name, line, column)
    end
  end

  def save_cursor(view : TextView)
    file_path = view.file_path
    return if file_path.nil?

    @tijolorc.save_cursor_position(@project.root, file_path, *view.cursor_pos)
  end

  def ask_about_externally_modified_files
    return unless main_window.active?

    view = @view_manager.current_view
    return if view.nil? || !view.externally_modified?

    modified_views = @view_manager.views.select(&.externally_modified?)
    # Auto reload views that can be reloaded and remove them from modified views.
    modified_views.reject! do |v|
      if v.can_reload?
        v.reload
        true
      else
        false
      end
    end
    return if modified_views.empty?

    dlg = ConfirmReloadDialog.new(main_window, modified_views)
    case dlg.run
    when .cancel?
      @inhibit_modified_files_dlg = true
      return
    when .do_action?
      dlg.selected_views.each do |v|
        v.reload
      rescue e : File::NotFoundError
        application.error(e)
      end
    end
    modified_views.each(&.externally_unmodified!)
  end

  def about_to_quit(_widget, event) : Bool
    unless @view_manager.all_saved?
      dlg = ConfirmSaveDialog.new(main_window, @view_manager.views.select(&.modified?))
      result = dlg.run
      if result.cancel?
        return true
      elsif result.do_action?
        dlg.selected_views.each do |view|
          save_view(view)
        end
      end
    end
    @lang_manager.shutdown
    # Save all view cursors
    @view_manager.views.each do |view|
      save_cursor(view) if view.is_a?(TextView)
    end
    @tijolorc.touch_project(@project.root)
    false
  end
end
