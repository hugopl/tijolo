class GitBranchModel < GObject::Object
  @head_monitor : Gio::FileMonitor?
  @menu_model : Gio::MenuModel?
  @connections = [] of GObject::SignalConnection

  @project_root = Path.new

  @[GObject::Property]
  property current_branch : String = ""

  def initialize
    super
  end

  def start_monitoring(@project_root : Path) : Bool
    path = project_root.join(".git/HEAD")
    return false unless File.exists?(path)

    @head_monitor = monitor = Gio::File.new_for_path(path).monitor_file(:none, nil)
    monitor.changed_signal.connect do
      reload_head
    end
    reload_head
    true
  end

  def menu_model=(menu_model : Gio::Menu)
    @menu_model = menu_model
    menu_model.remove_all
    local_branches.each do |branch_name|
      variant = GLib::Variant.new(branch_name)
      menu_model.append(branch_name, "win.change_git_branch(#{variant})")
    end
  end

  def disconnect_signals
    @connections.each(&.disconnect)
    @connections.clear
  end

  private def reload_head
    new_branch = Dir.cd(@project_root) { `git branch --show-current`.strip }
    return if new_branch == @current_branch

    self.current_branch = new_branch
  end

  private def local_branches : Array(String)
    Dir.cd(@project_root) { `git branch --list --format="%(refname:short)"`.split }
  end
end
