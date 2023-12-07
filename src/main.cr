{% if flag?(:unix) && flag?(:release) %}
  # If in release mode we fork and exit before doing anything, this will make possible to
  # open tijolo from terminals without blocking the terminal.
  # In debug mode we don't do this, because everybody loves printf debug style
  fun main(argc : Int32, argv : UInt8**) : Int32
    if pid = LibC.fork.zero?
      Crystal.main(argc, argv)
    else
      LibC.printf("Tijolo running 🚀️\n")
      0
    end
  end
{% end %}

require "log"

macro not_implemented!
  Log.warn { {{ "#{@type.name}.#{@def.name} method not implemented!" }} }
end

require "libadwaita"
require "./application"
require "./monkey_patches"

{% raise "Tijolo requires GTK >= 4.8, found: #{Gtk::MAJOR_VERSION}.#{Gtk::MINOR_VERSION}" if Gtk::MINOR_VERSION < 8 %}
{% raise "Tijolo requires lib Adwaita >= 1.4, found: #{Adw::VERSION_S}" if compare_versions("1.4.0", Adw::VERSION_S) > 0 %}

Gio.register_resource("data/resources.xml", source_dir: "data")

begin
  init_gtk_source_view
  app = Application.new
  code = app.run
  Log.info { "Tijolo quiting with exit code #{code}." }
  exit(code)
rescue ex
  Log.error(exception: ex) { ex.message }
  Log.info { "Tijolo quiting due to #{ex.class.name} exception." }
  abort
end
