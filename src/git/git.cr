require "./lib_git2"

module Git
  alias BranchType = LibGit::BranchT
  alias ErrorCode = LibGit::ErrorCode

  class Error < Exception
    def initialize(code : ErrorCode, message)
      super("#{code}: #{message}")
    end
  end

  class NotFoundError < Error
    def initialize(message)
      super(ErrorCode::NotFound, message)
    end
  end

  protected def nerr(code : ErrorCode, message = "Git Error")
    return if code.ok?

    raise NotFoundError.new(message) if code == LibGit::ErrorCode::NotFound
    raise Error.new(code, message)
  end

  class Repo
    @@initied = false

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
