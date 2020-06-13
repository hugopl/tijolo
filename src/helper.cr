require "version_from_shard"

VersionFromShard.declare

def parse_args(argv)
  gc_enabled = false
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
    parser.on("--enable-gc", "Enable garbage collector and hope to not crash.") { gc_enabled = true }
    parser.invalid_option do |flag|
      STDERR.puts "ERROR: #{flag} is not a valid option."
      STDERR.puts parser
      exit(1)
    end
  end

  {location: argv.first?, gc_enabled: gc_enabled}
end
