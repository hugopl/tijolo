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

  def repo
    @repo ||= Git::Repo.open(@project.root.to_s)
  end

  def selected(view : View?)
    # FIXME offer git init
    return unless @project.valid?

    cmds = [] of String
    repo.branches.each.each do |branch|
      cmds << "checkout #{branch.name}" unless branch.head?
    end
    cmds << "log #{view.label}" if view && view.file_path
    cmds << "log"

    self.haystack = Fzy::PreparedHaystack.new(cmds)
  end

  def activate(locator : Locator, match : Fzy::Match)
    args = match.value.split(' ', 2)
    case args.first
    when "checkout" then checkout(args)
    when "log"      then log(locator, args)
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

  # FIXME: Implement this on libgit and do it with libgit calls.
  def log(locator, args)
    output = IO::Memory.new
    err_output = IO::Memory.new
    status = Process.run("git", args, output: output, error: err_output)
    raise GitError.new(err_output.to_s) unless status.success?

    label = String.build do |str|
      str << "Git Log"
      str << " — " << args.last if args.size > 1
    end
    locator.notify_locator_show_special_file(output.to_s, label)
  end
end
