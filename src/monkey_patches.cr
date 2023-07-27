# Temporaty monkey patches to GTK4 shard will live her euntil they mature and get upstreammed to gtk4 shard.
module Gtk
  class Widget
    # :ditto:
    def size_allocate(x : Int32, y : Int32, width : Int32, height : Int32, baseline : Int32)
      size_allocate(Gdk::Rectangle.new(x, y, width, height), baseline)
    end
  end

  class TextBuffer
    def selection_bounds : {Gtk::TextIter, Gtk::TextIter}
      # gtk_text_buffer_get_selection_bounds: (Method)
      # @start: (out) (caller-allocates)
      # @end: (out) (caller-allocates)
      # Returns: (transfer none)

      start = Gtk::TextIter.new
      _end = Gtk::TextIter.new
      _retval = LibGtk.gtk_text_buffer_get_selection_bounds(to_unsafe, start, _end)
      {start, _end}
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

module GtkSource
  class SearchContext < GObject::Object
    def forward(iter : Gtk::TextIter) : {Bool, Gtk::TextIter, Gtk::TextIter, Bool}
      # gtk_source_search_context_forward: (Method)
      # @iter:
      # @match_start: (out) (caller-allocates) (optional)
      # @match_end: (out) (caller-allocates) (optional)
      # @has_wrapped_around: (out) (transfer full) (optional)
      # Returns: (transfer none)

      match_start = Gtk::TextIter.new
      match_end = Gtk::TextIter.new
      # C call
      ok = LibGtkSource.gtk_source_search_context_forward(to_unsafe, iter, match_start, match_end, out has_wrapped_around)
      {GICrystal.to_bool(ok), match_start, match_end, GICrystal.to_bool(has_wrapped_around)}
    end

    def backward(iter : Gtk::TextIter) : {Bool, Gtk::TextIter, Gtk::TextIter, Bool}
      # gtk_source_search_context_backward: (Method)
      # @iter:
      # @match_start: (out) (caller-allocates) (optional)
      # @match_end: (out) (caller-allocates) (optional)
      # @has_wrapped_around: (out) (transfer full) (optional)
      # Returns: (transfer none)

      match_start = Gtk::TextIter.new # Generator::OutArgUsedInReturnPlan
      match_end = Gtk::TextIter.new   # Generator::OutArgUsedInReturnPlan
      # C call
      ok = LibGtkSource.gtk_source_search_context_backward(to_unsafe, iter, match_start, match_end, out has_wrapped_around)

      {GICrystal.to_bool(ok), match_start, match_end, GICrystal.to_bool(has_wrapped_around)}
    end
  end
end
