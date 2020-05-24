# Try to make glib and Boehm-CG friends
ENV["G_SLICE"] = "always-malloc"
ENV["G_DEBUG"] = "gc-friendly"

require "log"
require "option_parser"

require "compiled_license"
require "malloc_pthread_shim"

require "./application"
require "./helper"

app = Application.new(parse_args(ARGV))
app.run
