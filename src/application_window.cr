require "./project"
require "./project_monitor"
require "./project_tree"
require "./welcome_widget"
require "./view_manager"
require "./view_factory"
require "./terminal_view"
require "./locator"
require "./theme_selector"
require "./save_modified_views_dialog"

@[Gtk::UiTemplate(file: "#{__DIR__}/ui/application_window.ui", children: %w(headerbar show_hide_sidebar_btn project_tree_view sidebar primary_menu))]
class ApplicationWindow < Adw::ApplicationWindow
  include Gtk::WidgetTemplate

  getter project : Project
  @project_monitor : ProjectMonitor
  @project_tree : ProjectTree
  @project_tree_view : Gtk::TreeView
  @sidebar : Adw::Flap
  @view_manager : ViewManager?
  private getter locator : Locator

  def initialize(application : TijoloApplication, @project : Project)
    super()

    @project_tree = ProjectTree.new(@project)
    @project_monitor = ProjectMonitor.new(@project)
    @project_tree_view = Gtk::TreeView.cast(template_child("project_tree_view"))
    @project_tree_view.row_activated_signal.connect(->open_from_project_tree(Gtk::TreePath, Gtk::TreeViewColumn))
    @sidebar = Adw::Flap.cast(template_child("sidebar"))
    @locator = Locator.new(@project)
    @locator.open_file_signal.connect(->open(String))

    self.application = application

    @project_tree_view.model = @project_tree.model

    primary_menu = Gtk::MenuButton.cast(template_child("primary_menu"))
    popover_primary_menu = Gtk::PopoverMenu.cast(primary_menu.popover.not_nil!)
    popover_primary_menu.add_child(ThemeSelector.new, "theme")

    key_ctl = Gtk::EventControllerKey.new(propagation_phase: :capture)
    key_ctl.key_pressed_signal.connect(->key_pressed(UInt32, UInt32, Gdk::ModifierType))
    key_ctl.key_released_signal.connect(->key_released(UInt32, UInt32, Gdk::ModifierType))
    add_controller(key_ctl)

    if @project.valid?
      open_project
    else
      welcome
    end

    bind_settings(application.settings)
    setup_actions(application.settings)
  end

  private def bind_settings(settings : Gio::Settings)
    settings.bind("window-width", self, "default-width", :default)
    settings.bind("window-height", self, "default-height", :default)
    settings.bind("window-maximized", self, "maximized", :default)
  end

  def application : TijoloApplication
    super.not_nil!.as(TijoloApplication)
  end

  delegate focus_upper_split, to: view_manager
  delegate focus_right_split, to: view_manager
  delegate focus_lower_split, to: view_manager
  delegate focus_left_split, to: view_manager
  delegate maximize_view, to: view_manager

  def open_project(project_path : String)
    open_project(Path.new(project_path))
  end

  def open_project(project_path : Path)
    raise ArgumentError.new if @project.valid?

    @project.root = project_path
    open_project
    open(project_path) if File.file?(project_path)
  rescue e : ProjectError
    Log.error { "Error loading project from #{project_path}: #{e.message}" }
  end

  private def open_project
    raise ArgumentError.new unless @view_manager.nil?

    Gtk::HeaderBar.cast(template_child("headerbar")).title_widget = @locator

    Gtk::ToggleButton.cast(template_child("show_hide_sidebar_btn")).sensitive = true
    @sidebar.locked = false
    @sidebar.reveal_flap = true
    @sidebar.content.as?(WelcomeWidget).try(&.disconnect_all_signals)
    @sidebar.content = @view_manager = view_manager = ViewManager.new

    @project.scan_files(on_finish: ->project_load_finished)
  end

  private def view_manager
    view_manager = @view_manager
    return view_manager unless view_manager.nil?

    open_project
    @view_manager.not_nil!
  end

  @[GObject::Virtual]
  def close_request
    view_manager = @view_manager
    return 0 if view_manager.nil?

    views = view_manager.modified_views
    return 0 if views.empty?

    dlg = SaveModifiedViewsDialog.new(self, views)
    dlg.present do
      destroy
    end
    1
  end

  def project_load_finished
    @project_tree.project_load_finished
    @project_monitor.project_load_finished
    enable_project_related_actions(true)
  end

  private def welcome
    flap = Adw::Flap.cast(template_child("sidebar"))
    welcome = WelcomeWidget.new
    flap.content = welcome
    self.focus_widget = welcome.entry
  end

  private def setup_actions(settings : Gio::Settings)
    config = Config.instance
    actions = {show_locator: ->show_locator,
    # show_git_locator:          ->show_git_locator,
               close_view:      ->close_current_view,
               close_all_views: ->close_all_views,
               new_file:        ->new_file,
               new_terminal:    ->new_terminal,
               open_file:       ->show_open_file_dialog,
               save_view:       ->save_current_view,
               save_view_as:    ->save_current_view_as,
               # find:                      ->{ find_in_current_view(:find_by_text) },
               # find_by_regexp:            ->{ find_in_current_view(:find_by_regexp) },
               # find_replace:              ->{ find_in_current_view(:find_replace) },
               # find_next:                 ->find_next_in_current_view,
               # find_prev:                 ->find_prev_in_current_view,
               # goto_line:                 ->show_goto_line_locator,
               # comment_code:              ->comment_code,
               # sort_lines:                ->sort_lines,
               # goto_definition:           ->goto_definition,
               show_hide_sidebar: ->{ @sidebar.reveal_flap = !@sidebar.reveal_flap },
               # show_hide_output_pane:     ->show_hide_output_pane,
               # focus_editor:              ->focus_editor,
               # go_back:                   ->go_back,
               # go_forward:                ->go_forward,
               # focus_upper_split:         ->focus_upper_split,
               # focus_right_split:         ->focus_right_split,
               # focus_lower_split:         ->focus_lower_split,
               # focus_left_split:          ->focus_left_split,
               # increase_font_size:        ->increase_current_view_font_size,
               # decrease_font_size:        ->decrease_current_view_font_size,
               # maximize_view:             ->maximize_view,
               copy_in_terminal:  ->copy_terminal_text,
               paste_in_terminal: ->paste_terminal_text,
    }
    actions.each do |name, closure|
      action = Gio::SimpleAction.new(name.to_s, nil)
      action.activate_signal.connect { closure.call }
      add_action(action)

      shortcut = config.shortcuts[name.to_s]
      application.not_nil!.set_accels_for_action("win.#{name}", {shortcut})
    end

    enable_project_related_actions(false)

    # View related actions
    #     uint64 = GLib::VariantType.new("t")
    #     action = Gio::SimpleAction.new("copy_full_path", uint64)
    #     action.activate_signal.connect(->copy_view_full_path(Gio::SimpleAction, GLib::Variant?))
    #     main_window.add_action(action)
    #
    #     action = Gio::SimpleAction.new("copy_full_path_and_line", uint64)
    #     action.activate_signal.connect(->copy_view_full_path_and_line(Gio::SimpleAction, GLib::Variant?))
    #     main_window.add_action(action)
    #
    #     action = Gio::SimpleAction.new("copy_file_name", uint64)
    #     action.activate_signal.connect(->copy_view_file_name(Gio::SimpleAction, GLib::Variant?))
    #     main_window.add_action(action)
    #
    #     action = Gio::SimpleAction.new("copy_relative_path", uint64)
    #     action.activate_signal.connect(->copy_view_relative_path(Gio::SimpleAction, GLib::Variant?))
    #     main_window.add_action(action)
    #
    #     action = Gio::SimpleAction.new("copy_relative_path_and_line", uint64)
    #     action.activate_signal.connect(->copy_view_relative_path_and_line(Gio::SimpleAction, GLib::Variant?))
    #     main_window.add_action(action)

    action = Gio::SimpleAction.new("focus_editor", nil)
    action.activate_signal.connect { with_current_view(&.grab_focus) }
    add_action(action)

    group = Gio::SimpleActionGroup.new
    action = settings.create_action("style-variant")
    group.add_action(action)
    insert_action_group("settings", group)
  end

  private def enable_project_related_actions(value : Bool)
    Gio::SimpleAction.cast(lookup_action("show_hide_sidebar").not_nil!).enabled = value
  end

  def key_pressed(key_val : UInt32, key_code : UInt32, modifier : Gdk::ModifierType) : Bool
    if modifier.control_mask? && key_val.in?({Gdk::KEY_Tab, Gdk::KEY_dead_grave})
      view_manager = @view_manager
      return false if view_manager.nil?

      view_manager.rotate_views(reverse: key_val == Gdk::KEY_dead_grave)
      return true
    end
    false
  end

  def key_released(key_val : UInt32, key_code : UInt32, modifier : Gdk::ModifierType) : Bool
    view_manager = @view_manager
    return false if view_manager.nil?

    if modifier.control_mask?
      return true if key_val.in?({Gdk::KEY_Tab, Gdk::KEY_dead_grave})

      view_manager.stop_rotate
    end
    false
  end

  def with_current_view
    view_manager = @view_manager
    return if view_manager.nil?

    view = view_manager.current_view
    yield(view) if view
  end

  def save_current_view
    with_current_view do |view|
      if view.resource?
        view.save if view.modified?
      else
        save_current_view_as
      end
    end
  end

  def save_current_view_as
    with_current_view do |view|
      dialog = Gtk::FileChooserNative.new("Save File", self, :save, "_Spen", "_Cancel")
      dialog.response_signal.connect do |response|
        if Gtk::ResponseType.from_value(response).accept?
          path = dialog.file.try(&.path)
          view.save_as(path) if path
        end
        dialog.destroy
      end

      dialog.show
    end
  end

  private def close_current_view : Nil
    with_current_view do |view|
      if view.modified?
        dlg = SaveModifiedViewsDialog.new(self, [view])
        dlg.present do
          view_manager.close_current_view
        end
      else
        view_manager.close_current_view
      end
    end
  end

  private def close_all_views : Nil
    view_manager = @view_manager
    return if view_manager.nil?

    modified_views = view_manager.modified_views
    if modified_views.empty?
      view_manager.close_all_views
      return
    end

    dlg = SaveModifiedViewsDialog.new(self, modified_views)
    dlg.present do
      view_manager.close_all_views
    end
  end

  def show_open_file_dialog
    # FIXME: Something is storing `dialog` address and not letting it be garbage collected
    dialog = Gtk::FileChooserNative.new("Open File", self, :open, "_Open", "_Cancel")

    dialog.response_signal.connect do |response|
      if Gtk::ResponseType.from_value(response).accept?
        path = dialog.file.try(&.path)
        open(path) if path
      end
      dialog.destroy
    end

    dialog.show
  end

  def new_file
    view_manager.add_view(TextView.new)
  end

  def new_terminal
    view_manager.add_view(TerminalView.new)
  end

  def open(resource : String) : Nil
    open(Path.new(resource))
  end

  def open(resource : Path) : Nil
    view_manager = @view_manager
    if view_manager.nil?
      open_project(resource)
      return
    end

    view = view_manager.find_view_by_resource(resource)
    if view.nil?
      view = ViewFactory.build(resource)
      view_manager.add_view(view)
    else
      view_manager.focus_view(view)
    end
  rescue e : IO::Error
    application.error(e)
  end

  private def open_from_project_tree(tree_path : Gtk::TreePath, _column : Gtk::TreeViewColumn)
    return if @project_tree_view.value(tree_path, ProjectTree::PROJECT_TREE_IS_DIR).as_bool

    file_path = @project_tree.file_path(tree_path)
    open(Path.new(file_path)) if file_path
  end

  private def show_locator
    return if @locator.nil? || @view_manager.nil?

    locator.show(select_text: true, view: view_manager.current_view)
  end

  private def copy_terminal_text
    with_current_view do |view|
      view.copy_text_to_clipboard if view.is_a?(TerminalView)
    end
  end

  private def paste_terminal_text
    with_current_view do |view|
      view.paste_text_from_clipboard if view.is_a?(TerminalView)
    end
  end
end
