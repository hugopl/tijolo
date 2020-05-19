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
  end

  class TreeSelection
    def select_row(row) : Nil
      tree_path = Gtk::TreePath.new_from_indices({row}, 1)
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
      path = TreePath.new_from_indices({row}, 1)
      iter(iter, path)
      value(iter, column)
    end

    def set(row : Int32, columns : Tuple, values : Tuple) : TreeIter
      iter = Gtk::TreeIter.new
      tree_path = Gtk::TreePath.new_from_indices({row}, 1)
      iter(iter, tree_path)
      set(iter, columns, values)
      iter
    end

    def remove_row(row : Int32)
      iter = Gtk::TreeIter.new
      tree_path = Gtk::TreePath.new_from_indices({row}, 1)
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
  end
end
