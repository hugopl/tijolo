require "./git"
require "./project"

# Responsible for display the available git branches
class GitBranches
  include ProjectListener

  BRANCH_NAME_COL  = 0
  BRANCH_LABEL_COL = 1

  getter model : Gtk::ListStore

  def initialize(@project : Project)
    @model = Gtk::ListStore.new({GObject::Type::UTF8, GObject::Type::UTF8})
    @project.add_project_listener(self)
  end

  def project_load_finished
    fill_model
    create_monitor
  end

  def switch_branch(tree_path : Gtk::TreePath)
    branch = @model.value(tree_path, BRANCH_NAME_COL).string
    Git.run_cli({"checkout", branch}) unless branch.empty?
  end

  private def fill_model
    return unless @project.valid?

    @model.clear
    repo = Git::Repo.open(@project.root.to_s)
    repo.each_branch(:local) do |branch|
      label = if branch.head?
                "<b>* #{branch.name}</b>"
              else
                "  #{branch.name}"
              end
      @model.append({BRANCH_NAME_COL, BRANCH_LABEL_COL}, {branch.name, label})
    end
  rescue e : Git::Error
    Log.error { "Error reading git repository: #{e.message}" }
  end

  private def create_monitor
    head = "#{@project.root}/.git/HEAD"
    Gio::File.new_for_path(head).monitor_file(:none, nil).on_changed do
      fill_model
    end

    heads = "#{@project.root}/.git/refs/heads"
    Gio::File.new_for_path(heads).monitor_directory(:none, nil).on_changed do
      fill_model
    end
  end
end
