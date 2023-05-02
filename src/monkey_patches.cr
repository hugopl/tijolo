# Temporaty monkey patches to GTK4 shard will live her euntil they mature and get upstreammed to gtk4 shard.

module Pango
  class Layout < GObject::Object
    def xy_to_index(x : Int32, y : Int32) : Int32
      retval = LibPango.pango_layout_xy_to_index(to_unsafe, x, y, out index, out trailing)
      return -1 unless retval > 0

      index
    end
  end
end
