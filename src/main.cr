require "log"
require "option_parser"

require "compiled_license"

require "./ui_builder_helper"
require "./observable"

require "./application"
require "./helper"

options = parse_args(ARGV)

if options[:logfile]
  ::Log.for("").backend = Log::IOBackend.new(File.open(options[:logfile].to_s, "w"))
end

if options[:debug]
  lsp_logger = ::Log.for("LSP")
  lsp_logger.level = :debug
  lsp_logger.backend = Log::IOBackend.new(File.open("#{Dir.tempdir}/tijolo-lsp.log", "w"))
end

# Yes, always leak memory...
#
# Crystal GC has several problems with GTK (and probably other C libraries as well), causing several
# crashes. This project is written in Crystal because it's a pleasure to write Crystal code, and pet
# projects should be pleasent to write, but these GC related issues made me think if it's resonable
# to port all this to C++... or learn Rust, but C++ has a horrible standard library and Rust feels
# ugly at first sight.
#
# When the project get more mature... if these crashes doesn't get solved I may try to compile my own
# GTK version BoehmGC aware and static link it to tijolo.
if options[:gc_disabled]
  GC.collect
  GC.disable
end

begin
  app = Application.new(options[:locations])

  if options[:gc_disabled] || options[:debug]
    GLib.timeout(60) do # each 60 seconds...
      Log.info { "NonGTK memory usage: #{GC.stats.heap_size.humanize_bytes}" }
      true
    end
  end

  app.run
rescue e : AppError
  Log.fatal { e.message }
  abort
end
