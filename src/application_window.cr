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

@[Gtk::UiTemplate(file: "#{__DIR__}/ui/application_window.ui", children: %w(title show_hide_sidebar_btn project_tree sidebar primary_menu))]
class ApplicationWindow < Adw::ApplicationWindow
  include Gtk::WidgetTemplate

  getter project : Project
  @project_monitor : ProjectMonitor
  @sidebar : Adw::Flap
  @view_manager : ViewManager?
  private getter locator : Locator

  def initialize(application : TijoloApplication, @project : Project)
    super()

    @project_monitor = ProjectMonitor.new(@project)
    @sidebar = Adw::Flap.cast(template_child("sidebar"))
    @locator = Locator.new(@project)

    self.application = application
    @locator.open_file_signal.connect(->open(String))
    @locator.transient_for = self
    @locator.application = application

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

    Adw::WindowTitle.cast(template_child("title")).subtitle = @project.root.relative_to(Path.home).to_s

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
  def close_request : Bool
    views = @view_manager.try(&.modified_views)
    return false if views.nil? || views.empty?

    dlg = SaveModifiedViewsDialog.new(self, views)
    dlg.present do
      destroy
    end
    true
  end

  def project_load_finished
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
    actions = {show_locator:       ->show_locator,
               close_view:         ->close_current_view,
               close_all_views:    ->close_all_views,
               new_file:           ->new_file,
               new_terminal:       ->new_terminal,
               open_file:          ->show_open_file_dialog,
               save_view:          ->save_current_view,
               save_view_as:       ->save_current_view_as,
               show_hide_sidebar:  ->{ @sidebar.reveal_flap = !@sidebar.reveal_flap },
               copy_from_terminal: ->copy_terminal_text,
               paste_in_terminal:  ->paste_terminal_text,
    }
    actions.each do |name, closure|
      action = Gio::SimpleAction.new(name.to_s, nil)
      action.activate_signal.connect { closure.call }
      add_action(action)

      shortcut = config.shortcuts[name.to_s]
      application.not_nil!.set_accels_for_action("win.#{name}", {shortcut})
    end

    enable_project_related_actions(false)

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
      view = ViewFactory.build(resource, @project)
      view_manager.add_view(view)
    else
      view_manager.focus_view(view)
    end
  rescue e : IO::Error
    application.error(e)
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
