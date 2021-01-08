require "./lib_git2"

module Git
  alias BranchType = LibGit::BranchT
  alias ErrorCode = LibGit::ErrorCode
  alias Status = LibGit::StatusT

  class Error < Exception
    def initialize(code : ErrorCode, message)
      super("#{code}: #{message}")
    end

    def initialize(message)
      super
    end
  end

  class NotFoundError < Error
    def initialize(message)
      super(ErrorCode::NotFound, message)
    end
  end

  def run_cli(args)
    output = IO::Memory.new
    err_output = IO::Memory.new
    status = Process.run("git", args, output: output, error: err_output)
    raise Error.new(err_output.to_s) unless status.success?

    output.to_s
  end

  protected def nerr(code : ErrorCode, message = "Git Error")
    return if code.ok?

    raise NotFoundError.new(message) if code == LibGit::ErrorCode::NotFound
    raise Error.new(code, message)
  end

  class Repo
    @@initied = false
    getter root : Path

    def self.current
      @@current ||= Repo.new(Dir.current)
    end

    def self.open(path : Path | String)
      Repo.new(path)
    end

    @repo : LibGit::Repository

    def initialize(path : Path | String)
      @@initied ||= !!LibGit.libgit2_init

      Git.nerr(LibGit.repository_open(out repo, path.to_s), "Couldn't open repository at #{path}.")
      @repo = repo
      @root = Path.new(String.new(LibGit.repository_workdir(repo)))
    end

    def finalize
      LibGit.repository_free(@repo)
    end

    def each_branch(b_type : BranchType = BranchType::All)
      Git.nerr(LibGit.branch_iterator_new(out iter, @repo, b_type))

      loop do
        code = LibGit.branch_next(out ref, out branch_next, iter)
        break if code == ErrorCode::Iterover

        yield(Branch.new(ref))
      end

      LibGit.branch_iterator_free(iter)
    end

    def modified?(file : Path) : Bool
      path = file.relative_to(@root).to_s
      code = LibGit.status_file(out status, @repo, path)
      return false unless code.ok?

      status == Status::Current
    end
  end

  class Branch
    def initialize(@ref : LibGit::Reference)
    end

    def finalize
      LibGit.reference_free(@ref)
    end

    def name
      Git.nerr(LibGit.branch_name(out b_name, @ref))
      String.new(b_name)
    end

    def head?
      LibGit.branch_is_head(@ref) == 1
    end
  end

  extend self
end
