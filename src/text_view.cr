require "./document_view"
require "./code_editor"
require "./find_replace"

class TextView < DocumentView
  Log = ::Log.for(self)

  getter editor : CodeEditor
  @line_column = Gtk::Label.new
  @find_replace : FindReplace
  @source_file : GtkSource::File

  def initialize(resource : Path? = nil, project : Project? = nil)
    @editor = CodeEditor.new(resource)
    super(@editor, resource, project)

    @source_file = GtkSource::File.new
    @source_file.location = Gio::File.new_for_path(resource) if resource

    @find_replace = FindReplace.new(@editor)
    @find_replace.bind_property("active", bottom_revealer, "reveal_child", :none)

    @header_end_box.prepend(@line_column)
    bottom_revealer.child = @find_replace

    @editor.buffer.modified_changed_signal.connect do
      self.modified = @editor.buffer.modified
    end

    connect(@editor.cursor_changed_signal) do
      set_cursor_label(*@editor.cursor_line_col)
    end
    update_title
    set_cursor_label(*@editor.cursor_line_col)

    setup_editor_preferences
    code_model.file_opened(resource) if resource
    @editor.buffer.insert_text_signal.connect do |iter, text, len|
      if res = @resource
        code_model.insert_text(res, text, iter.offset, len)
      end
    end
    @editor.buffer.delete_range_signal.connect do |start_iter, end_iter|
      if res = @resource
        offset = start_iter.offset
        code_model.delete_text(res, offset, end_iter.offset - offset)
      end
    end

    load(0) if resource
  end

  delegate :color_scheme=, to: @editor.buffer
  delegate :language, to: @editor
  delegate :code_model, to: language

  def close
    super
    resource = @resource
    code_model.file_closed(resource) if resource
  end

  private def highlight
    resource = @resource
    if resource
      lang = CodeLanguage.detect(resource)
      @editor.language = lang
    end
  end

  def reload_contents : Nil
    load(@editor.buffer.cursor_position)
    self.externally_modified = false
  end

  def do_check_for_external_changes : Nil
    return if !@source_file.is_local || @source_file.location.nil?

    @source_file.check_file_on_disk
    self.deleted = @source_file.is_deleted
    unless @deleted
      self.externally_modified = @source_file.is_externally_modified
      self.readonly = @source_file.is_readonly
    end
  end

  private def setup_editor_preferences
    config = Config.instance
    resource = self.resource
    is_make_file = resource.try(&.basename) == "Makefile"

    @editor.wrap_mode = config.wrap_mode
    @editor.tab_width = is_make_file ? 4 : config.editor_tab_width
    @editor.insert_spaces_instead_of_tabs = is_make_file ? false : config.editor_insert_spaces_instead_of_tabs?
    @editor.show_right_margin = config.editor_show_right_margin?
    @editor.right_margin_position = config.editor_right_margin_position
    @editor.highlight_current_line = config.editor_highlight_current_line?
  end

  # Line and col starts at zero in code, but at 1 in UI
  private def set_cursor_label(line : Int32, col : Int32)
    @line_column.label = line.negative? ? "?" : "#{line + 1}:#{col + 1}"
  end

  def current_line : Int32
    @editor.cursor_line_col[0]
  end

  private def load(cursor_offset : Int32)
    buffer = @editor.buffer
    loader = GtkSource::FileLoader.new(buffer, @source_file)
    loader.load_async(:default) do |_source, result|
      loader.load_finish(result)
      iter = buffer.iter_at_offset(cursor_offset)
      buffer.place_cursor(iter)
      highlight
      nil
    rescue ex
      Log.error(exception: ex) { "Error loading file: #{ex.message}" }
    end
  end

  def save : Nil
    buffer = @editor.buffer
    buffer.remove_trailing_spaces!

    saver = GtkSource::FileSaver.new(buffer: buffer, file: @source_file, flags: :ignore_modification_time)
    saver.save_async(:default) do |_, result|
      saver.save_finish(result)
      buffer.modified = false
      self.externally_modified = false
    rescue ex
      Log.error(exception: ex) { "Error saving file: #{ex.message}" }
    end
  end

  def save_as(resource : Path) : Nil
    buffer = @editor.buffer
    buffer.remove_trailing_spaces!

    saver = GtkSource::FileSaver.new_with_target(buffer: buffer, file: @source_file,
      target_location: Gio::File.new_for_path(resource.to_s))
    saver.flags = :ignore_modification_time
    saver.save_async(:default) do |_, result|
      saver.save_finish(result)
      buffer.modified = false
      self.externally_modified = false
    rescue ex
      Log.error(exception: ex) { "Error saving file: #{ex.message}" }
    end
  end

  def find
    @find_replace.find(@editor.selection_or_identifier_at_cursor)
    bottom_revealer.reveal_child = true
  end

  def find_next
    @find_replace.find_next
    bottom_revealer.reveal_child = true
  end

  def find_prev
    @find_replace.find_prev
    bottom_revealer.reveal_child = true
  end

  def goto_definition
    word = @editor.identifier_at_cursor
    return if word.empty?

    model = @editor.language.code_model
    symbols = model.find_symbols(word)

    if symbols.empty?
      add_toast("Symbol \"#{word}\" not found.")
    else
      add_toast("More than one symbol found, going to first one found.") if symbols.size > 1

      location = symbols.first.location
      activate_action("win.goto_line", "#{location.line}:#{location.column}:#{location.source}")
    end
  end

  delegate sort_lines, to: @editor
  delegate comment_code, to: @editor
  delegate move_lines_up, to: @editor
  delegate move_lines_down, to: @editor
  delegate move_viewport_line_up, to: @editor
  delegate move_viewport_line_down, to: @editor
  delegate move_viewport_page_up, to: @editor
  delegate move_viewport_page_down, to: @editor
  delegate goto_line, to: @editor
end
