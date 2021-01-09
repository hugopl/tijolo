require "./git"
require "./fuzzy_locator"
require "./project"

class GitLocator < FuzzyLocator
  @project : Project

  def initialize(@project)
    super("Git commands")
  end

  def description : String
    "Git commands"
  end

  def shortcut : Char
    'g'
  end

  def selected(view : View?)
    # FIXME offer git init
    return unless @project.valid?

    cmds = [] of String
    Git::Repo.current.each_branch do |branch|
      cmds << "checkout #{branch.name}" unless branch.head?
    end
    cmds << "log"

    if view
      file_path = view.file_path
      if file_path && @project.under_project?(file_path)
        cmds << "log #{view.label}"
        cmds << "blame #{view.label}"
      end
    end

    self.haystack = Fzy::PreparedHaystack.new(cmds)
  end

  def activate(locator : Locator, match : Fzy::Match)
    args = match.value.split(' ', 2)
    case args.first
    when "checkout" then checkout(args)
    when "log"      then git_cmd_with_output(locator, args, "gitlog")
    when "blame"    then git_cmd_with_output(locator, args, nil)
    end
  rescue e : Git::Error
    title = "Git operation failed"
    dialog = Gtk::MessageDialog.new(text: title, secondary_text: e.message.to_s, message_type: :error, buttons: :ok)
    dialog.on_response { dialog.close }
    dialog.run
  end

  # FIXME: Implement this on libgit and do it with libgit calls.
  def checkout(args) : Nil
    Git.run_cli(args)
  end

  def git_cmd_with_output(locator, args, syntax)
    output = Git.run_cli(args)
    label = String.build do |str|
      str << "Git " << args.first.capitalize
      str << " — " << args.last if args.size > 1
    end
    locator.notify_locator_show_special_file(output.to_s, label, syntax)
  end
end
