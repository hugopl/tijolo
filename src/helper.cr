require "version_from_shard"

VersionFromShard.declare

def usr_share_paths(dir : String, paths = [] of String)
  usr_path = Path[File.readlink("/proc/self/exe"), "../../"]

  paths.unshift(usr_path.join("./share/tijolo/#{dir}/").expand.to_s)
  paths.unshift(usr_path.join("./local/share/tijolo/#{dir}/").expand.to_s)
  paths.unshift(Path.home.join(".local/share/tijolo/#{dir}/").expand.to_s)
  paths
end

def parse_args(argv)
  gc_disabled = true # Leak all the things! See main.cr
  logfile = nil
  debug = false

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
    parser.on("--logfile=FILE", "Where to save log, default to STDOUT.") { |file| logfile = file }
    parser.on("--debug", "Enable some debug stuff, like log all LSP communication.") { debug = true }
    parser.on("--disable-gc", "Disable garbage collector (yes, leak memory).") { gc_disabled = true }
    parser.invalid_option do |flag|
      STDERR.puts "ERROR: #{flag} is not a valid option."
      STDERR.puts parser
      exit(1)
    end
  end

  {locations:   argv,
   gc_disabled: gc_disabled,
   logfile:     logfile,
   debug:       debug}
end
