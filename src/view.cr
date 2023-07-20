require "./signal_conector"

@[Gtk::UiTemplate(file: "#{__DIR__}/ui/view.ui", children: %w(container header label line_column modified))]
abstract class View < Gtk::Box
  include Gtk::WidgetTemplate
  include SignalConnector

  @[GObject::Property]
  property label : String = ""
  getter? resource : Path?
  property? readonly = false
  @[GObject::Property]
  property modified = false

  getter resource : Path?
  property project : Project?

  @header : Gtk::Widget
  @line_column : Gtk::Label
  @actions = [] of Gio::SimpleAction
  @line_based_actions = [] of Gio::SimpleAction

  def initialize(contents : Gtk::Widget, @resource : Path?, @project : Project?)
    super(css_name: "view")

    @line_column = Gtk::Label.cast(template_child(View.g_type, "line_column"))

    @header = Gtk::Widget.cast(template_child(View.g_type, "header"))
    header_label = Gtk::Label.cast(template_child(View.g_type, "label"))
    bind_property("label", header_label, "label", :default)

    modified_label = Gtk::Label.cast(template_child(View.g_type, "modified"))
    bind_property("modified", modified_label, "visible", :default)

    container = Gtk::ScrolledWindow.cast(template_child(View.g_type, "container"))
    container.child = contents

    setup_actions(!@resource.nil?)
  end

  def line_based_content?
    false
  end

  def current_line : Int32
    raise NotImplementedError.new("View#current_line")
  end

  def current_column : Int32
    raise NotImplementedError.new("View#current_column")
  end

  private def setup_actions(has_resource : Bool)
    action_group = Gio::SimpleActionGroup.new
    {% for action in %w(copy_full_path copy_file_name copy_relative_path) %}
      action = Gio::SimpleAction.new({{ action }}, nil)
      action.enabled = has_resource
      connect(action.activate_signal) { {{ action.id }} }
      action_group.add_action(action)
      @actions << action
    {% end %}
    # line based actions
    {% for action in %w(copy_full_path_and_line copy_relative_path_and_line) %}
      action = Gio::SimpleAction.new({{ action }}, nil)
      action.enabled = has_resource && line_based_content?
      connect(action.activate_signal) { {{ action.id }} }
      action_group.add_action(action)
      @line_based_actions << action
    {% end %}
    insert_action_group("view", action_group)
  end

  # FIXME: gi-crystal isn't notifying the property change if modified is declared as `property?`
  def modified?
    @modified
  end

  private def enable_resource_actions
    @actions.each(&.enabled=(true))
    @line_based_actions.each(&.enabled=(true)) if line_based_content?
  end

  def resource=(resource : Path?)
    @resource = resource
    self.label = resource.nil? ? "" : File.basename(resource)
    enable_resource_actions
  end

  def select : Nil
    @header.add_css_class("selected")
  end

  def unselect : Nil
    @header.remove_css_class("selected")
  end

  def resource_hint : Path
    resource = self.resource
    return resource if resource

    (GLib.user_special_dir(:directory_documents) || Path.home).join("#{@label}.txt")
  end

  abstract def grab_focus
  abstract def save : Nil

  def save_as(resource : Path) : Nil
    self.resource = resource
    save
  end

  # Line and col starts at zero in code, but at 1 in UI
  def set_cursor_label(line : Int32, col : Int32)
    @line_column.label = line.negative? ? "?" : "#{line + 1}:#{col + 1}"
  end

  private def copy_full_path
    resource = @resource
    Gdk::Display.default!.clipboard.set(resource.to_s) if resource
  end

  private def copy_full_path_and_line
    resource = @resource
    if resource && line_based_content?
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
    if project && resource && line_based_content?
      path = resource.relative_to(project.root)
      Gdk::Display.default!.clipboard.set("#{path}:#{current_line + 1}")
    end
  end

  def to_s(io : IO)
    io << label
  end

  def inspect(io : IO)
    io << "<" << self.class.name << ' ' << label << '>'
  end
end
