# This file is used as a macro to fill the LICENSE constant.
# It just reads all LICENSE files and outputs a string that wont offend Pango.
require "html"

def render_license(io : IO, title : String, license_file : Path | String)
  io << "<big>" << title << "</big>\n\n"
  io << "<tt>"
  HTML.escape(File.read(license_file), io)
  io << "</tt>\n\n"
end

license = String.build do |str|
  if File.exists?("./LICENSE")
    title = Dir.current.split("/").last.capitalize
    render_license(str, title, "./LICENSE")
  end

  Dir.glob("./lib/*/LICENSE", "./lib/*/license").each do |path|
    title = path.match(/^\.\/lib\/([^\/]+)\//).try(&.[1]).to_s.capitalize
    render_license(str, title, path)
  end
end

puts license
