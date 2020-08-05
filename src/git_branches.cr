require "git"

require "./project"

# Responsible for display the available git branches
class GitBranches
  include ProjectListener

  BRANCH_NAME_COL = 0

  getter model : Gtk::ListStore

  def initialize(@project : Project)
    @model = Gtk::ListStore.new({GObject::Type::UTF8})
    @project.add_project_listener(self)
  end

  def project_load_finished
    fill_model
    create_monitor
  end

  private def fill_model
    @model.clear
    repo = Git::Repo.open(@project.root.to_s)
    repo.branches.each(:local).each do |branch|
      label = if branch.head?
                "<b>* #{branch.name}</b>"
              else
                "  #{branch.name}"
              end
      @model.append({BRANCH_NAME_COL}, {label})
    end
  end

  private def create_monitor
    heads = "#{@project.root}/.git/refs/heads"
    Gio::File.new_for_path(heads).monitor_directory(:none, nil).on_changed do
      fill_model
    end
  end
end
