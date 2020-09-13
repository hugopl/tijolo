require "version_from_shard"

require "./config"

VersionFromShard.declare

# Return file_path relative to project path, Home or abs.
def relative_path_label(path : Path, project_path : Path? = nil) : String
  return path.relative_to(project_path).to_s if project_path

  path_from_home = path.relative_to(Path.home)
  path_from_home_str = path_from_home.to_s
  if path_from_home_str.starts_with?(".") || path_from_home_str.starts_with?("/")
    path.expand.to_s
  else
    "~/#{path_from_home_str}"
  end
end

def usr_share_paths(dir : String, paths = [] of String)
  usr_path = Path[File.readlink("/proc/self/exe"), "../../"]

  paths.unshift(usr_path.join("./share/tijolo/#{dir}/").expand.to_s)
  paths.unshift(usr_path.join("./local/share/tijolo/#{dir}/").expand.to_s)
  paths.unshift(Path.home.join(".local/share/tijolo/#{dir}/").expand.to_s)

  # data dir has preference on debug builds
  {% if flag?(:debug) %}
    paths.unshift("#{__DIR__}/../data/#{dir}/")
  {% end %}
  paths
end

def parse_args(argv)
  gc_disabled = true # Leak all the things! See main.cr
  logfile = nil
  log_level = Config.instance.log_level

  OptionParser.parse(argv) do |parser|
    parser.banner = "Usage: tijolo [OPTIONS] [FILE|DIRECTORY]..."
    parser.on("-v", "--version", "Show tijolo version.") do
      puts "Tijolo version #{VERSION}"
      exit
    end
    parser.on("--licenses", "Show license from Tijolo and their Crystal dependencies.") { }
    parser.on("-h", "--help", "Show this help.") do
      puts parser
      exit
    end
    parser.on("--logfile=FILE", "Where to save log, default to STDOUT or /tmp/tijolo.PID.log if not on a tty.") do |file|
      logfile = file
    end
    parser.on("--debug", "Enable some debug stuff, like log all LSP communication.") { log_level = Log::Severity::Debug }
    parser.on("--enable-gc", "Enable garbage collector (see https://github.com/jhass/crystal-gobject/issues/69).") do
      gc_disabled = false
    end
    parser.invalid_option do |flag|
      STDERR.puts "ERROR: #{flag} is not a valid option."
      STDERR.puts parser
      exit(1)
    end
  end

  {locations:   argv,
   gc_disabled: gc_disabled,
   logfile:     logfile,
   log_level:   log_level}
end
