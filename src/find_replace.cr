require "./find_replace_options"

@[Gtk::UiTemplate(file: "#{__DIR__}/ui/find_replace.ui", children: %w(entry case_btn regex_btn))]
class FindReplace < Gtk::Box
  include Gtk::WidgetTemplate

  @entry : Gtk::Entry
  @search_context : GtkSource::SearchContext
  @search_settings : GtkSource::SearchSettings
  @editor : CodeEditor
  @buffer : CodeBuffer
  @force_case_sensitive = false
  @replace_term : String?
  @offset_when_show : Int32 = 0

  @[GObject::Property]
  property active : Bool = false

  def initialize(@editor : CodeEditor)
    super()

    @buffer = @editor.buffer
    @search_settings = GtkSource::SearchSettings.new(wrap_around: true)
    @search_context = GtkSource::SearchContext.new(@buffer, @search_settings)
    @regex_btn = Gtk::ToggleButton.cast(template_child("regex_btn"))
    @case_btn = Gtk::ToggleButton.cast(template_child("case_btn"))
    @search_context.notify_signal["occurrences-count"].connect(->on_notify_occurences_count(GObject::ParamSpec))

    @entry = Gtk::Entry.cast(template_child("entry"))
    @entry.changed_signal.connect(->search_changed)
    @entry.activate_signal.connect(->activate)
    @regex_btn.clicked_signal.connect(->regex_btn_clicked)
    @case_btn.clicked_signal.connect(->case_btn_clicked)

    key_ctl = Gtk::EventControllerKey.new(propagation_phase: :capture)
    key_ctl.key_pressed_signal.connect(->key_pressed(UInt32, UInt32, Gdk::ModifierType))
    add_controller(key_ctl)
  end

  def find(text : String) : Nil
    return if @entry.has_focus?

    @entry.text = text
    @entry.grab_focus
    @offset_when_show = @buffer.iter_at_mark(@buffer.insert).offset
    search_changed(text)
  end

  def find_prev
    @search_context.highlight = true
    not_implemented!
  end

  def find_next
    @search_context.highlight = true

    start, end_ = @buffer.selection_bounds
    start.order(end_)
    found, start, end_, _wrap = @search_context.forward(end_)
    return unless found

    @buffer.select_range(start, end_)
    mark = @buffer.insert
    @editor.scroll_mark_onscreen(mark)
  end

  def activate
    if @replace_term.nil?
      @search_context.highlight = false
      mark = @buffer.insert
      @editor.goto(@buffer.iter_at_mark(mark))
      @editor.grab_focus
      self.active = false
    else
      # Replace term
      not_implemented!
    end
  end

  def restore_cursor
    puts "restore cursor from #{@offset_when_show}"
    iter = @buffer.iter_at_offset(@offset_when_show)
    @editor.goto(iter)
  end

  private def key_pressed(key_val : UInt32, key_code : UInt32, modifier : Gdk::ModifierType) : Bool
    if key_val == Gdk::KEY_Up
      find_prev
    elsif key_val == Gdk::KEY_Down
      find_next
    elsif key_val == Gdk::KEY_Escape
      restore_cursor
      self.active = false
      @editor.grab_focus
    else
      return false
    end
    true
  end

  private def regex_btn_clicked
    text = @entry.text
    text = if text.starts_with?(FindReplaceParser::SEPARATOR)
             text.lchop
           else
             text.insert(0, FindReplaceParser::SEPARATOR)
           end
    @entry.text = text
    @entry.grab_focus_without_selecting
  end

  private def case_btn_clicked
    @force_case_sensitive = @regex_btn.active
    @entry.grab_focus_without_selecting
    search_changed
  end

  private def search_changed(text : String? = nil) : Nil
    text ||= @entry.text
    options = FindReplaceOptions.parse(text)
    return if options.nil?

    @search_settings.search_text = options.find_term
    @search_settings.case_sensitive = @force_case_sensitive ? true : options.case_sensitive?
    @search_settings.regex_enabled = options.regex?
    @search_context.highlight = true
    @regex_btn.active = options.regex?
    @case_btn.active = options.case_sensitive? unless @force_case_sensitive
    @replace_term = options.replace_term
    @entry.primary_icon_name = @replace_term.nil? ? "edit-find-symbolic" : "edit-find-replace-symbolic"

    restore_cursor
    find_next
  end

  private def on_notify_occurences_count(_param_spec)
    occurrence_count = @search_context.occurrences_count
    scroll_to_first_match if occurrence_count.positive?
  end

  private def scroll_to_first_match
    iter = @buffer.iter_at_offset(@offset_when_show)
    found, match_begin, match_end, _wrapper = @search_context.forward(iter)
    @editor.scroll_to_iter(match_begin) if found
  end

  private def current_match_iter
  end
end
