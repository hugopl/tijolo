lib LibGtk
  fun tree_store_reorder = gtk_tree_store_reorder(this : TreeStore*, iter : LibGtk::TreeIter*, new_order : Int32*) : Void
end

module Gio
  def self.content_type_guess(filename : ::String, data : ::String)
    __return_value = LibGio.content_type_guess(filename, data, data.size, out result_uncertain)
    GObject.raise_unexpected_null("g_content_type_guess") if __return_value.null?
    {::String.new(__return_value), result_uncertain}
  end
end

module Gtk
  class TreeView
    def value(path : TreePath, column : Int32) : GObject::Value
      view_model = model.not_nil!
      iter = Gtk::TreeIter.new
      view_model.iter(iter, path)
      view_model.value(iter, column)
    end

    def set_cursor(row : Int32, start_edit : Bool = false)
      tree_path = Gtk::TreePath.new_from_indices({row})
      set_cursor(tree_path, nil, start_edit)
    end
  end

  class TreeSelection
    def select_row(row) : Nil
      tree_path = Gtk::TreePath.new_from_indices({row})
      select_path(tree_path)
    end
  end

  class TreeStore
    def append(parent : TreeIter?, columns : Tuple, values : Tuple) : TreeIter
      TreeIter.new.tap do |iter|
        append(iter, parent)
        set(iter, columns, values)
      end
    end

    def insert(parent : TreeIter?, columns : Tuple, values : Tuple, position : Int32)
      TreeIter.new.tap do |iter|
        insert(iter, parent, position)
        set(iter, columns, values)
      end
    end

    def value(indices : Enumerable(Int32), column : Int32)
      path = TreePath.new_from_indices(indices)
      iter = Gtk::TreeIter.new
      self.iter(iter, path)
      value(iter, column)
    end

    def reorder(parent : TreeIter?, new_order : Array(Int32))
      LibGtk.tree_store_reorder(@pointer.as(LibGtk::TreeStore*), parent ? parent.to_unsafe.as(LibGtk::TreeIter*) : nil, new_order)
      nil
    end
  end

  class ListStore
    def append(columns : Tuple, values : Tuple) : TreeIter
      TreeIter.new.tap do |iter|
        append(iter)
        set(iter, columns, values)
      end
    end

    def value(row : Int32, column : Int32)
      iter = Gtk::TreeIter.new
      path = TreePath.new_from_indices({row})
      iter(iter, path)
      value(iter, column)
    end

    def set(row : Int32, columns : Tuple, values : Tuple) : TreeIter
      iter = Gtk::TreeIter.new
      tree_path = Gtk::TreePath.new_from_indices({row})
      iter(iter, tree_path)
      set(iter, columns, values)
      iter
    end

    def remove_row(row : Int32)
      iter = Gtk::TreeIter.new
      tree_path = Gtk::TreePath.new_from_indices({row})
      iter(iter, tree_path)
      remove(iter)
    end
  end

  class TextBuffer
    def place_cursor(pos : Int32)
      iter = Gtk::TextIter.new
      iter_at_offset(iter, pos)
      place_cursor(iter)
    end

    def start_iter
      Gtk::TextIter.new.tap do |iter|
        start_iter(iter)
      end
    end

    def end_iter
      Gtk::TextIter.new.tap do |iter|
        end_iter(iter)
      end
    end

    def iter_at_offset(offset : Int32)
      Gtk::TextIter.new.tap do |iter|
        iter_at_offset(iter, offset)
      end
    end

    def iter_at_line_offset(line : Int32, offset : Int32)
      Gtk::TextIter.new.tap do |iter|
        iter_at_line_offset(iter, line, offset)
      end
    end

    def cursor_iter
      iter_at_offset(cursor_position)
    end

    def iter_at_line(line : Int32)
      Gtk::TextIter.new.tap do |iter|
        iter_at_line(iter, line)
      end
    end

    def text
      text(start_iter, end_iter)
    end

    def text=(text : String)
      set_text(text, text.bytesize)
    end

    def each_line(from, to, &block) : Nil
      return if to < from

      from_iter = TextIter.new
      iter_at_line(from_iter, from)
      to_iter = TextIter.new
      iter_at_line(to_iter, to)

      to_line = to_iter.line
      while from_iter.line < to_line
        yield(from_iter)
        from_iter.forward_line
      end
      yield(to_iter)
    end

    def select_lines(from : Int32, to : Int32)
      select_range(iter_at_line(from), iter_at_line(to))
    end

    def select_range(start_offset : Int32, end_offset : Int32)
      select_range(iter_at_offset(start_offset), iter_at_offset(end_offset))
    end

    def selection_bounds
      start_iter = Gtk::TextIter.new
      end_iter = Gtk::TextIter.new
      selection_bounds(start_iter, end_iter)
      {start_iter, end_iter}
    end

    def lines(from, to)
      return [] of String if to < from

      lines = Array(String).new(to - from)
      end_line_iter = TextIter.new
      each_line(from, to) do |iter|
        iter_at_line_offset(end_line_iter, iter.line, Int32::MAX)
        lines << iter.text(end_line_iter)
      end
      lines
    end

    def insert(iter : TextIter, text : String)
      insert(iter, text, text.size)
    end
  end

  class TextIter
    def forward_to_after_line_end
      self.line_index = bytes_in_line
    end
  end
end

module GtkSource
  class StyleSchemeManager
    # TODO: Remove this workaround until https://gitlab.gnome.org/GNOME/gtksourceview/-/issues/133 get released.
    def scheme2(name : String) : StyleScheme?
      scheme(name)
    rescue
      nil
    end
  end
end
