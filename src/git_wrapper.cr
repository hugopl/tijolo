class GitError < AppError
end

module GitWrapper
  def run_git(args)
    output = IO::Memory.new
    err_output = IO::Memory.new
    status = Process.run("git", args, output: output, error: err_output)
    raise GitError.new(err_output.to_s) unless status.success?

    output.to_s
  end
end
