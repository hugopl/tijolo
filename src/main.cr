require "libadwaita"
require "log"

require "./tijolo_application"
require "./monkey_patches"

{% raise "Tijolo requires GTK >= 4.8, found: #{Gtk::MAJOR_VERSION}.#{Gtk::MINOR_VERSION}" if Gtk::MINOR_VERSION < 8 %}

Gio.register_resource("data/resources.xml", source_dir: "data")

app = TijoloApplication.new
exit(app.run)
