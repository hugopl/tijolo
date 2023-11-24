module Gtk
  # FIXME: Upstream this to gtk4 shard.
  class TextBuffer
    def selection_bounds
      start_iter = Gtk::TextIter.new
      end_iter = Gtk::TextIter.new
      LibGtk.gtk_text_buffer_get_selection_bounds(to_unsafe, start_iter, end_iter)
      {start_iter, end_iter}
    end

    def user_action
      begin_user_action
      yield
    ensure
      end_user_action
    end

    def not_undoable_action
      begin_not_undoable_action
      yield
    ensure
      end_not_undoable_action
    end

    def insert(iter : TextIter, text : String)
      insert(iter, text, text.bytesize)
    end
  end
end
