require "git"
require "./fuzzy_locator"
require "./project"

class GitError < AppError
end

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

  def selected(_view : View?)
    # FIXME offer git init
    return unless @project.valid?

    cmds = [] of String
    repo = Git::Repo.open(@project.root.to_s)
    repo.branches.each.each do |branch|
      cmds << "checkout #{branch.name}" unless branch.head?
    end
    self.haystack = Fzy::PreparedHaystack.new(cmds)
  end

  def activate(locator : Locator, match : Fzy::Match)
    args = match.value.split(' ', 2)
    case args.first
    when "checkout" then checkout(args)
    end
  rescue e : GitError
    title = "Git operation failed"
    dialog = Gtk::MessageDialog.new(text: title, secondary_text: e.message.to_s, message_type: :error, buttons: :ok)
    dialog.on_response { dialog.close }
    dialog.run
  end

  # FIXME: Implement this on libgit and do it with libgit calls.
  def checkout(args)
    err_output = IO::Memory.new
    status = Process.run("git", args, error: err_output)

    raise GitError.new(err_output.to_s) unless status.success?
  end
end
