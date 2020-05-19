require "./ui_builder_helper"

class TextView
  include UiBuilderHelper

  property file_path : Path?
  getter label : String
  getter widget : Gtk::Widget

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

  def id : String
    @id ||= object_id.to_s
  end

  def save
    file_path = @file_path
    if file_path.nil?
      Log.warn { "Attempt to save a file without a name" }
      return
    end
    puts "saving #{file_path}"
    text = @buffer.text(@buffer.start_iter, @buffer.end_iter, false)
    File.write(file_path, text)
    @buffer.modified = false
  end

  private def setup_editor
    @buffer.begin_not_undoable_action

    @buffer.style_scheme = GtkSource::StyleSchemeManager.default.scheme(Config.instance.style_scheme)

    if @file_path
      text = File.read(@file_path.not_nil!)
      @buffer.set_text(text, -1)
      @buffer.modified = false

      lang = GtkSource::LanguageManager.default.guess_language(@label, mimetype(@label, text))
      @buffer.language = lang
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
end
