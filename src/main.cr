require "log"
require "option_parser"

require "compiled_license"

require "./ui_builder_helper"
require "./observable"

require "./application"
require "./helper"

options = parse_args(ARGV)

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
unless options[:gc_enabled]
  GC.collect
  GC.disable
end

begin
  app = Application.new(options)
  app.run
rescue e : AppError
  Log.fatal { e.message }
  abort
end
