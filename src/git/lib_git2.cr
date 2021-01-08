@[Link("git2")]
lib LibGit
  enum ErrorCode : Int32
    Ok             =   0
    Error          =  -1
    NotFound       =  -3
    Exists         =  -4
    Ambiguous      =  -5
    Bufs           =  -6
    User           =  -7
    BareRepo       =  -8
    UnbornBranch   =  -9
    Unmerged       = -10
    NonFastForward = -11
    InvalidSpec    = -12
    Conflict       = -13
    Locked         = -14
    Modified       = -15
    Auth           = -16
    Certificate    = -17
    Applied        = -18
    Peel           = -19
    Eof            = -20
    Invalid        = -21
    Uncommitted    = -22
    Directory      = -23
    MergeConflict  = -24
    Passthrough    = -30
    Iterover       = -31
  end

  fun libgit2_init = git_libgit2_init : LibC::Int

  # Branch
  ########
  enum BranchT
    Local  = 1
    Remote = 2
    All    = 3
  end

  type BranchIterator = Void*

  fun branch_is_head = git_branch_is_head(branch : Reference) : LibC::Int
  fun branch_iterator_free = git_branch_iterator_free(iter : BranchIterator)
  fun branch_iterator_new = git_branch_iterator_new(out : BranchIterator*, repo : Repository, list_flags : BranchT) : ErrorCode
  fun branch_name = git_branch_name(out : LibC::Char**, ref : Reference) : ErrorCode
  fun branch_next = git_branch_next(out : Reference*, out_type : BranchT*, iter : BranchIterator) : ErrorCode

  # Reference
  ###########
  type Reference = Void*

  fun reference_free = git_reference_free(ref : Reference)

  # Repository
  ########
  type Repository = Void*

  fun repository_free = git_repository_free(repo : Repository)
  fun repository_open = git_repository_open(out : Repository*, path : LibC::Char*) : ErrorCode
  fun repository_workdir = git_repository_workdir(repo : Repository) : LibC::Char*

  # Status
  ########
  @[Flags]
  enum StatusT : UInt32
    Current = 0

    IndexNew        = (1_u32 << 0)
    IndexModified   = (1_u32 << 1)
    IndexDeleted    = (1_u32 << 2)
    IndexRenamed    = (1_u32 << 3)
    IndexTypechange = (1_u32 << 4)

    WorkTreeNew        = (1_u32 << 7)
    WorkTreeModified   = (1_u32 << 8)
    WorkTreeDeleted    = (1_u32 << 9)
    WorkTreeTypeChange = (1_u32 << 10)
    WorkTreeRenamed    = (1_u32 << 11)
    WorkTreeUnreadable = (1_u32 << 12)

    Ignored    = (1_u32 << 14)
    Conflicted = (1_u32 << 15)
  end
  fun status_file = git_status_file(status_flags : StatusT*, repo : Repository, path : LibC::Char*) : ErrorCode
end
