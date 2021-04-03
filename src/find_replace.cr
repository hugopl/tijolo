class FindReplaceError < RuntimeError
end

class FindReplace
  include UiBuilderHelper

  property text_view : TextView?

  @revealer : Gtk::Revealer
  @entry : Gtk::Entry
  @label : Gtk::Label
  @find_message : Gtk::Label
  @mode = Mode::FindByText

  # Value used on search/replace
  @replacement = ""

  private FIND_REPLACE_SYNTAX = %r{^\/(.*[^\\])\/(.*)$}

  enum Mode
    FindByText
    FindByRegexp
    FindReplace
  end

  def initialize
    builder = builder_for("find_replace")
    @revealer = Gtk::Revealer.cast(builder["find_revealer"])
    @entry = Gtk::Entry.cast(builder["find_entry"])
    @label = Gtk::Label.cast(builder["find_label"])
    @find_message = Gtk::Label.cast(builder["find_message"])

    @entry.on_key_press_event(&->entry_key_pressed(Gtk::Widget, Gdk::EventKey))
    @entry.connect("notify::text") { find(@text_view) }
    @entry.on_activate { activate }
  end

  def widget
    @revealer
  end

  def show(text_view : TextView, mode : Mode) : Nil
    @text_view = text_view
    setup_context(text_view.search_context, mode)

    setup_ui(text_view, mode)
    @revealer.reveal_child = true
    @mode = mode
  end

  private def setup_context(context : Editor::SearchContext, mode : Mode)
    context.regexp_enabled = !mode.find_by_text?
    context.on_find_finish { update_message_bar(context) }
  end

  private def setup_ui(text_view : TextView, mode : Mode)
    text_view.search_context.highlight = true
    # Setup labels
    old_mode = @mode
    @mode = mode
    if mode != old_mode
      @label.label = case mode
                     in .find_by_text?   then "Find text:"
                     in .find_by_regexp? then "Find text by Regexp:"
                     in .find_replace?   then "Search/Replace:"
                     end
    end

    # Setup entry text
    already_visible = @revealer.reveal_child
    if already_visible
      entry_text = @entry.text
      cursor_position = @entry.position
      if old_mode.find_replace? && entry_text.size > 1 && entry_text.starts_with?("/")
        res = extract_search_and_replacement(entry_text)
        @entry.text = res[0] unless res.nil?
        cursor_position -= 1
      elsif mode.find_replace? && !entry_text.starts_with?("/")
        @entry.text = "/#{entry_text}/"
        cursor_position += 1
      end
      @entry.position = cursor_position
      @entry.grab_focus_without_selecting
    else # brand new find/feplace widget.
      selected_text = text_view.selected_text
      if mode.find_replace?
        @entry.text = "/#{selected_text}/"
      else
        @entry.text = selected_text
      end
      @entry.grab_focus
    end
  end

  def hide : Nil
    if @revealer.reveal_child
      @revealer.reveal_child = false
    else
      remove_highlighting
    end
  end

  # Called when user press enter on text entry.
  def activate
    if @mode.find_replace?
      find_replace(@text_view)
    else
      find(@text_view)
      grab_editor_focus
    end
  end

  def search_text=(value : String)
    @entry.text = value
  end

  private def search_text : String
    entry_text = @entry.text
    return entry_text if @mode.find_by_text? || @mode.find_by_regexp?
    return "" if entry_text.size < 2

    res = extract_search_and_replacement(entry_text)
    raise FindReplaceError.new("Bad find/replace string, expected /search/replacement expression, hit F1 for help.") if res.nil?

    search, @replacement = res
    search
  end

  private def extract_search_and_replacement(text : String) : {String, String}?
    match = text =~ FIND_REPLACE_SYNTAX
    return if match.nil?

    {$1, $2}
  end

  def find(text_view : TextView?) : Bool
    return false if text_view.nil? || text_view != @text_view

    ctx = text_view.search_context
    match = ctx.find(search_text)
    return false if match.nil?

    text_view.scroll_to(match[0])
    update_message_bar(ctx)
    true
  rescue e : FindReplaceError
    update_message_bar(e.message.to_s)
    false
  end

  def find_replace(text_view : TextView?) : Bool
    return false if text_view.nil? || text_view != @text_view

    ctx = text_view.search_context
    match = ctx.find(search_text)
    return false if match.nil?

    text_view.buffer.replace(match, @replacement)
    text_view.scroll_to(match[0]) if match
    update_message_bar(ctx)
    true
  end

  def find_next(text_view : TextView?)
    return if text_view.nil? || text_view != @text_view

    match = text_view.search_context.find_next
    text_view.scroll_to(match[0]) if match
  end

  def find_prev(text_view : TextView?)
    return if text_view.nil? || text_view != @text_view

    match = text_view.search_context.find_prev
    text_view.scroll_to(match[0]) if match
  end

  def remove_highlighting
    text_view = @text_view
    return if text_view.nil?

    text_view.search_context.highlight = false
  end

  private def grab_editor_focus
    text_view = @text_view
    return if text_view.nil? || text_view.has_focus?

    text_view.grab_focus
  end

  private def entry_key_pressed(_widget : Gtk::Widget, event : Gdk::EventKey) : Bool
    if event.keyval == Gdk::KEY_F1
      show_help
      return true
    end
    false
  end

  private def update_message_bar(message : String)
    @find_message.label = message
  end

  private def update_message_bar(context : Editor::SearchContext)
    n = context.occurrences_count
    message = if context.has_error?
                %Q(<span foreground="#E2246B">#{context.error_message}</span>) # Red monokai
              elsif n < 0
                return
              elsif n == 0
                "No matches found."
              elsif n == 1
                "Found 1 match."
              else
                "Found #{n} matches"
              end
    @find_message.label = message
  end

  private def show_help
    # FIXME: These text should reflect shortcuts configured by the user.
    header = case @mode
             in .find_by_text?   then "Just start typing for interactive search."
             in .find_by_regexp? then "Just start typing a regular expression without delimiters for interactive search."
             in .find_replace? then "Use the syntax: <i>/match/replacement</i>\n" \
                                    "On replacement you can use <i>\\1</i>, <i>\\2</i> for matched groups"
             end
    mode_shortcuts = {"\nCtrl + F    — Switch to find by text.",
                      "\nCtrl + R    — Switch to find by regular expression.",
                      "\nCtrl + H    — Switch to find/replace."}
    help = String.build do |str|
      str << header << "\n"
      str << "\nEsc         — Hide search box and put focus back into editor," \
             "\n              hit Esc again to remove results highlight." \
             "\nF3          — Next entry." \
             "\nShift + F3  — Previous entry."
      str << "\nEnter       — Toggle replacement in the current match." if @mode.find_replace?
      Mode.each do |mode|
        str << mode_shortcuts[mode.to_i] if mode != @mode
      end
    end
    dialog = Gtk::MessageDialog.new(text: "Help", secondary_text: help, secondary_use_markup: true, message_type: :info, buttons: :close)
    dialog.on_response { dialog.close }
    dialog.run
    dialog.destroy
  end
end
