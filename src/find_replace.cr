class FindReplace
  property text_view : TextView?

  @settings : GtkSource::SearchSettings

  def initialize(@revealer : Gtk::Revealer, @entry : Gtk::Entry)
    @entry.on_key_press_event(&->entry_key_pressed(Gtk::Widget, Gdk::EventKey))
    @entry.connect("notify::text") { find }
    @entry.on_activate { on_entry_activated }

    @settings = GtkSource::SearchSettings.new
    @settings.wrap_around = true
  end

  def show(text_view : TextView) : Nil
    @text_view = text_view
    @revealer.reveal_child = true
    @entry.text = text_view.selected_text
    @entry.grab_focus

    text_view.create_search_context(@settings)
    text_view.search_context.highlight = true
  end

  def hide : Nil
    if @revealer.reveal_child
      @revealer.reveal_child = false
    else
      remove_highlighting
    end
    @text_view.try(&.grab_focus)
  end

  private def on_entry_activated
    find
    @text_view.try(&.grab_focus)
    hide
  end

  def find : Nil
    @settings.search_text = @entry.text

    @text_view.try(&.find)
  end

  def find_next
    @text_view.try(&.find_next)
  end

  def find_prev
    @text_view.try(&.find_prev)
  end

  def remove_highlighting
    text_view = @text_view
    return if text_view.nil?

    text_view.search_context.highlight = false
  end

  private def entry_key_pressed(_widget : Gtk::Widget, event : Gdk::EventKey)
    if event.keyval == Gdk::KEY_Escape
      hide
      true
    end
    false
  end
end
