module Gtk
  # FIXME: Upstream this to gtk4 shard.
  class TextBuffer
    def selection_bounds
      start_iter = Gtk::TextIter.new
      end_iter = Gtk::TextIter.new
      LibGtk.gtk_text_buffer_get_selection_bounds(to_unsafe, start_iter, end_iter)
      {start_iter, end_iter}
    end
  end
end
