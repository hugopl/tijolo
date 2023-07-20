# Temporaty monkey patches to GTK4 shard will live her euntil they mature and get upstreammed to gtk4 shard.
module Gtk
  class Widget
    # :ditto:
    def size_allocate(x : Int32, y : Int32, width : Int32, height : Int32, baseline : Int32)
      size_allocate(Gdk::Rectangle.new(x, y, width, height), baseline)
    end
  end
end

module Pango
  class Layout < GObject::Object
    def xy_to_index(x : Int32, y : Int32) : NamedTuple(index: Int32, inside_text: Bool, trailing: Int32)
      inside_text = LibPango.pango_layout_xy_to_index(to_unsafe, x, y, out index, out trailing)
      {index: index, inside_text: GICrystal.to_bool(inside_text), trailing: trailing}
    end
  end

  class AttrList
    def initialize
      @pointer = LibPango.pango_attr_list_new
    end

    def <<(attr : Pango::Attribute) : self
      insert(attr)
      self
    end
  end
end
