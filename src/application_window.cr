require "./project"
require "./project_tree"
require "./welcome_widget"
require "./view_manager"
require "./view_factory"
require "./locator"

@[Gtk::UiTemplate(file: "#{__DIR__}/ui/application_window.ui", children: %w(title_widget show_hide_sidebar_btn project_tree_view sidebar))]
class ApplicationWindow < Adw::ApplicationWindow
  include Gtk::WidgetTemplate

  getter project : Project
  @project_tree : ProjectTree
  private getter! view_manager : ViewManager?
  private getter! locator : Locator?

  def initialize(application : Gio::Application, @project : Project)
    super()
    @project_tree = ProjectTree.new(@project)
    self.application = application

    Gtk::TreeView.cast(template_child("project_tree_view")).model = @project_tree.model
    if @project.valid?
      open_project
    else
      welcome
    end
    setup_actions
  end

  def application : TijoloApplication
    super.not_nil!.as(TijoloApplication)
  end

  def open_project(project_path : String)
    open_project(Path.new(project_path))
  end

  def open_project(project_path : Path)
    raise ArgumentError.new if @project.valid?

    @project.load(project_path)
    open_project
  rescue e : ProjectError
    Log.error { "Error loading project from #{project_path}: #{e.message}" }
  end

  private def open_project
    raise ArgumentError.new unless @view_manager.nil?

    title_widget = Adw::WindowTitle.cast(template_child("title_widget"))
    title_widget.title = @project.name
    title_widget.subtitle = @project.root.to_s

    Gtk::ToggleButton.cast(template_child("show_hide_sidebar_btn")).sensitive = true
    flap = Adw::Flap.cast(template_child("sidebar"))
    flap.locked = false
    flap.reveal_flap = true
    flap.content.as?(WelcomeWidget).try(&.disconnect_all_signals)
    flap.content = @view_manager = view_manager = ViewManager.new
    @locator = locator = Locator.new(@project)
    view_manager.add_overlay(locator)
    locator.open_file_signal.connect(->open(String,Bool))

    @project.scan_files(on_finish: ->project_load_finished)
  end

  def project_load_finished
    @project_tree.project_load_finished
    locator.project_load_finished
  end

  private def welcome
    flap = Adw::Flap.cast(template_child("sidebar"))
    welcome = WelcomeWidget.new
    flap.content = welcome
    self.focus_widget = welcome.entry
  end

  private def setup_actions
    config = Config.instance
    actions = {show_locator:              ->show_locator,
               show_locator_new_split:    ->{ show_locator(split_view: true) },
               # show_git_locator:          ->show_git_locator,
               # close_view:                ->close_current_view,
               # close_all_views:           ->close_all_views,
               # save_view:                 ->save_current_view,
               # save_view_as:              ->save_current_view_as,
               # find:                      ->{ find_in_current_view(:find_by_text) },
               # find_by_regexp:            ->{ find_in_current_view(:find_by_regexp) },
               # find_replace:              ->{ find_in_current_view(:find_replace) },
               # find_next:                 ->find_next_in_current_view,
               # find_prev:                 ->find_prev_in_current_view,
               # goto_line:                 ->show_goto_line_locator,
               # comment_code:              ->comment_code,
               # sort_lines:                ->sort_lines,
               # goto_definition:           ->goto_definition,
               # goto_definition_new_split: ->{ goto_definition(split_view: true) },
               # show_hide_sidebar:         ->show_hide_sidebar,
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
               # copy_in_terminal:          ->copy_terminal_text,
               # paste_in_terminal:         ->paste_terminal_text,
    }
    actions.each do |name, closure|
      action = Gio::SimpleAction.new(name.to_s, nil)
      action.activate_signal.connect { closure.call }
      add_action(action)

      shortcut = config.shortcuts[name.to_s]
      application.not_nil!.set_accels_for_action("win.#{name}", {shortcut})
    end

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
  end

  def open(resource : String, split_view : Bool = false)
    view = view_manager.view(resource)
    if view.nil?
      view = ViewFactory.build(resource)
      view_manager.add_view(view, split_view)
    else
      view_manager.change_current_view(view)
    end
    view
  rescue e : IO::Error
    application.error(e)
  end

  private def show_locator(split_view = false)
    raise TijoloError.new if @locator.nil?

    locator.show(select_text: true, view: view_manager.current_view, split_view: split_view)
  end

end
