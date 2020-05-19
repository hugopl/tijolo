require "log"
require "option_parser"

require "compiled_license"
require "malloc_pthread_shim"
require "version_from_shard"

require "./application"

VersionFromShard.declare

def parse_args(argv)
  OptionParser.parse do |parser|
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
    parser.invalid_option do |flag|
      STDERR.puts "ERROR: #{flag} is not a valid option."
      STDERR.puts parser
      exit(1)
    end
  end

  {location: ARGV.first?.to_s}
end

app = Application.new(parse_args(ARGV))
app.run
