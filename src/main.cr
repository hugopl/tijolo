require "log"
require "option_parser"

require "compiled_license"

require "./ui_builder_helper"
require "./observable"

require "./application"
require "./helper"
require "./tijolo_log_backend"

def setup_logger(options)
  logfile = options[:logfile]
  is_tty = STDOUT.tty?
  backend = if logfile || !is_tty
              logfile ||= File.join(Dir.tempdir, "tijolo.#{Process.pid}.log")
              Log::IOBackend.new(File.open(logfile, "w"))
            elsif is_tty
              Log::IOBackend.new
            end
  Log.setup do |config|
    level = options[:log_level]
    config.bind("*", level, backend) if backend
    config.bind("*", level, TijoloLogBackend.instance)
  end
end

options = parse_args(ARGV)
setup_logger(options)
Config.instance.language_servers_enabled = false if options[:no_lsp]

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

  if options[:gc_disabled] || options[:log_level].debug?
    GLib.timeout(60.seconds) do
      Log.info { "NonGTK memory usage: #{GC.stats.heap_size.humanize_bytes}" }
      true
    end
  end

  app.run
rescue e : AppError
  Log.fatal { e.message }
  abort
rescue e
  Log.fatal(exception: e) { e.message }
  abort
end
