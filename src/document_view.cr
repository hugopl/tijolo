require "./view"

abstract class DocumentView < View
  getter resource : Path?
  property project : Project?
  property? readonly = false
  @[GObject::Property]
  property modified = false

  @resource_actions = [] of Gio::SimpleAction

  def initialize(contents : Gtk::Widget, @resource : Path?, @project : Project?)
    super(contents)

    modified_label = Gtk::Label.new(visible: false, label: "🞶")
    header_center_box.insert_child_after(modified_label, header_label)
    bind_property("modified", modified_label, "visible", :default)

    copy_path_btn = Gtk::MenuButton.new(icon_name: "edit-copy-symbolic",
      focus_on_click: false,
      margin_start: 3,
      menu_model: copy_path_menu_model)
    copy_path_btn.add_css_class("flat")
    header_center_box.prepend(copy_path_btn)

    setup_actions(!@resource.nil?)
  end

  abstract def save : Nil

  # FIXME: gi-crystal isn't notifying the property change if modified is declared as `property?`
  def modified?
    @modified
  end

  def save_as(resource : Path) : Nil
    old_resource = @resource
    self.resource = resource
    save
  end

  def resource=(resource : Path?)
    old_resource = @resource
    @resource = resource
    self.label = resource.nil? ? "" : File.basename(resource)
    @resource_actions.each(&.enabled=(true)) if old_resource.nil?
  end

  def resource_hint : Path
    resource = self.resource
    return resource if resource

    (GLib.user_special_dir(:directory_documents) || Path.home).join("#{@label}.txt")
  end

  private def copy_path_menu_model : Gio::MenuModel
    menu = Gio::Menu.new
    menu.append_item(Gio::MenuItem.new("Copy full path", "view.copy_full_path"))
    menu.append_item(Gio::MenuItem.new("Copy full path and line", "view.copy_full_path_and_line"))
    menu.append_item(Gio::MenuItem.new("Copy relative path", "view.copy_relative_path"))
    menu.append_item(Gio::MenuItem.new("Copy relative path and line", "view.copy_relative_path_and_line"))
    menu
  end

  private def update_title
    resource = self.resource
    project = self.project
    label = if project && resource
              resource.relative_to(project.root).to_s
            elsif resource
              resource.to_s
            else
              untitled_label
            end
    self.label = label
  end

  private def untitled_label : String
    @@untitled_count += 1
    return "Untitled" if @@untitled_count == 1

    "Untitled #{@@untitled_count}"
  end

  private def setup_actions(has_resource : Bool)
    action_group = Gio::SimpleActionGroup.new
    {% for action in %w(copy_full_path copy_file_name copy_relative_path) %}
      action = Gio::SimpleAction.new({{ action }}, nil)
      action.enabled = has_resource
      connect(action.activate_signal) { {{ action.id }} }
      action_group.add_action(action)
      @resource_actions << action
    {% end %}
    # line based actions
    {% for action in %w(copy_full_path_and_line copy_relative_path_and_line) %}
      action = Gio::SimpleAction.new({{ action }}, nil)
      action.enabled = has_resource
      connect(action.activate_signal) { {{ action.id }} }
      action_group.add_action(action)
      @resource_actions << action
    {% end %}
    setup_actions(action_group)

    insert_action_group("view", action_group)
  end

  private def copy_full_path
    resource = @resource
    Gdk::Display.default!.clipboard.set(resource.to_s) if resource
  end

  private def copy_full_path_and_line
    resource = @resource
    if resource
      Gdk::Display.default!.clipboard.set("#{resource}:#{current_line + 1}")
    end
  end

  private def copy_file_name
    resource = @resource
    Gdk::Display.default!.clipboard.set(resource.basename.to_s) if resource
  end

  private def copy_relative_path
    project = @project
    resource = @resource
    if project && resource
      path = resource.relative_to(project.root).to_s
      Gdk::Display.default!.clipboard.set(path)
    end
  end

  private def copy_relative_path_and_line
    project = @project
    resource = @resource
    if project && resource
      path = resource.relative_to(project.root)
      Gdk::Display.default!.clipboard.set("#{path}:#{current_line + 1}")
    end
  end
end
