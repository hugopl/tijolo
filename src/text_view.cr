module TextViewListener
  def escape_pressed
  end
end

class TextView
  include UiBuilderHelper

  observable_by TextViewListener

  property file_path : Path?
  getter? readonly = false
  getter label : String
  getter widget : Gtk::Widget
  getter! search_context : GtkSource::SearchContext?

  @id : String?
  @@untitled_count = -1

  @editor : GtkSource::View
  @buffer : GtkSource::Buffer
  @file_path_label : Gtk::Label

  Log = ::Log.for("TextView")

  delegate grab_focus, to: @editor

  def initialize(file_path : String?)
    builder = builder_for("text_view")
    @widget = Gtk::Widget.cast(builder["root"])
    @widget.ref
    @editor = GtkSource::View.cast(builder["editor"])
    @editor.on_key_press_event(&->key_pressed(Gtk::Widget, Gdk::EventKey))

    @buffer = GtkSource::Buffer.cast(@editor.buffer)
    @line_column = Gtk::Label.cast(builder["line_column"])
    @file_path_label = Gtk::Label.cast(builder["file_path"])

    @file_path = Path.new(file_path).expand unless file_path.nil?
    @label = @file_path.nil? ? untitled_name : File.basename(@file_path.not_nil!)
    @file_path_label.text = @label

    setup_editor
  ensure
    builder.try(&.unref)
  end

  private def untitled_name
    @@untitled_count += 1
    if @@untitled_count.zero?
      "Untitled"
    else
      "Untitled #{@@untitled_count}"
    end
  end

  def key_pressed(_widget : Gtk::Widget, event : Gdk::EventKey)
    if event.keyval == Gdk::KEY_Escape
      notify_escape_pressed
      true
    end
    false
  end

  def id : String
    @id ||= object_id.to_s
  end

  def save
    return if @readonly

    file_path = @file_path
    if file_path.nil?
      Log.warn { "Attempt to save a file without a name" }
      return
    end
    text = @buffer.text(@buffer.start_iter, @buffer.end_iter, false)
    File.write(file_path, text)
    @buffer.modified = false
  end

  private def setup_editor
    @buffer.begin_not_undoable_action

    @buffer.style_scheme = GtkSource::StyleSchemeManager.default.scheme(Config.instance.style_scheme)

    file_path = @file_path
    if file_path
      text = File.read(file_path)
      @buffer.set_text(text, -1)
      @buffer.modified = false

      lang = GtkSource::LanguageManager.default.guess_language(@label, mimetype(@label, text))
      @buffer.language = lang

      unless File.writable?(file_path)
        @editor.editable = false
        @file_path_label.text = "#{@label} 🔒"
        @readonly = true
      end
    end

    @buffer.connect("notify::cursor-position") { cursor_changed }
    @buffer.on_modified_changed do
      @file_path_label.text = @buffer.modified ? "#{@label} ✱" : @label
    end
    @buffer.place_cursor(0)
  ensure
    @buffer.end_not_undoable_action
  end

  private def mimetype(file_name, file_contents)
    contents, uncertain = Gio.content_type_guess(file_name, file_contents)
    uncertain ? nil : contents
  end

  private def cursor_changed
    iter = Gtk::TextIter.new
    @buffer.iter_at_offset(iter, @buffer.cursor_position)
    @line_column.label = "#{iter.line + 1}:#{iter.line_offset + 1}"
  end

  def create_search_context(settings : GtkSource::SearchSettings)
    @search_context ||= GtkSource::SearchContext.new(@buffer, settings)
  end

  def find
    find_impl(@buffer.cursor_position, true)
  end

  def find_next
    find_impl(@buffer.cursor_position + 1, true)
  end

  def find_prev
    find_impl(@buffer.cursor_position, false)
  end

  private def find_impl(offset, forward)
    search_context = @search_context
    return if search_context.nil?

    iter = Gtk::TextIter.new.tap do |iter|
      @buffer.iter_at_offset(iter, offset)
    end

    match_start = Gtk::TextIter.new
    match_end = Gtk::TextIter.new
    found, wrapped_around = if forward
                              search_context.forward(iter, match_start, match_end)
                            else
                              search_context.backward(iter, match_start, match_end)
                            end

    if found
      @buffer.place_cursor(match_start)
      @editor.scroll_to_iter(match_start, 0.0, true, 0.0, 0.5)
      @buffer.select_range(match_start, match_end)
    end
  end

  def goto(line, column)
    iter = Gtk::TextIter.new
    @buffer.iter_at_line(iter, line)
    iter.forward_chars(column)
    @buffer.place_cursor(iter)
    @editor.scroll_to_iter(iter, 0.0, true, 0.0, 0.5)
  end
end
