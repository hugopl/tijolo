# Temporaty monkey patches to GTK4 shard will live her euntil they mature and get upstreammed to gtk4 shard.
module Gio
  module File
    def self.new_for_path(path : ::Path) : Gio::File
      new_for_path(path.to_s)
    end
  end
end

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

    def user_action
      begin_user_action
      yield
    ensure
      end_user_action
    end
  end

  class TextIter
    # Forward whitespaces characters
    # Returns false if reach end of file, true otherwise
    def forward_whitespaces : Bool
      while char.whitespace?
        return false if ends_line || !forward_char
      end
      true
    end

    # Forward while characters matches *text*.
    # return true on 100% match, false otherwise.
    def find_text_forward(text : String) : Bool
      text.each_char do |chr|
        return false if char != chr

        forward_char
      end
      true
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
  class FileLoader
    def load_async(io_priority : GLib::Priority, cancellable : Gio::Cancellable? = nil, &callback : Gio::AsyncReadyCallback) : Nil
      c_callback = Pointer(Void).null
      if callback
        c_callback = ->(gobj : Void*, result : Void*, box : Void*) {
          unboxed_callback = Box(Gio::AsyncReadyCallback).unbox(box)
          unboxed_callback.call(GObject::Object.new(gobj, :none), Gio::AbstractAsyncResult.new(result, :none))

          GICrystal::ClosureDataManager.deregister(box)
          nil
        }.pointer
      end

      # C call
      box = Box.box(callback)
      GICrystal::ClosureDataManager.register(box)
      LibGtkSource.gtk_source_file_loader_load_async(to_unsafe, io_priority, cancellable, Pointer(Void).null, Pointer(Void).null, Pointer(Void).null, c_callback, box)
    end
  end

  class FileSaver
    def save_async(io_priority : GLib::Priority, cancellable : Gio::Cancellable? = nil, &callback : Gio::AsyncReadyCallback) : Nil
      c_callback = Pointer(Void).null
      if callback
        c_callback = ->(gobj : Void*, result : Void*, box : Void*) {
          unboxed_callback = Box(Gio::AsyncReadyCallback).unbox(box)
          unboxed_callback.call(GObject::Object.new(gobj, :none), Gio::AbstractAsyncResult.new(result, :none))

          GICrystal::ClosureDataManager.deregister(box)
          nil
        }.pointer
      end

      # C call
      box = Box.box(callback)
      GICrystal::ClosureDataManager.register(box)
      LibGtkSource.gtk_source_file_saver_save_async(to_unsafe, io_priority, cancellable, Pointer(Void).null, Pointer(Void).null, Pointer(Void).null, c_callback, box)
    end
  end

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
