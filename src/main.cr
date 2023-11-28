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

require "libadwaita"
require "log"

require "./application"
require "./monkey_patches"

{% raise "Tijolo requires GTK >= 4.8, found: #{Gtk::MAJOR_VERSION}.#{Gtk::MINOR_VERSION}" if Gtk::MINOR_VERSION < 8 %}

Gio.register_resource("data/resources.xml", source_dir: "data")

app = Application.new
exit(app.run)
