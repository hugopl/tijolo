require "libadwaita"
require "log"

require "./tijolo_application"

{% raise "This branch isn't ready yet, try the latest tag (v0.7.1) instead." unless flag?(:i_know_what_im_doing) %}

Gio.register_resource("data/resources.xml", source_dir: "data")
app = TijoloApplication.new
exit(app.run)
