class Editor::SearchContext
  @buffer : TextBuffer
  @context : GtkSource::SearchContext
  @settings : GtkSource::SearchSettings
  @on_find_finish_connected = false

  def initialize(@buffer : TextBuffer)
    @settings = GtkSource::SearchSettings.new
    @settings.wrap_around = true
    @context = GtkSource::SearchContext.new(buffer.gobject, @settings)
  end

  def regexp_enabled=(value : Bool)
    @settings.regex_enabled = value
  end

  delegate :highlight=, to: @context
  delegate :occurrences_count, to: @context

  # delegate :search_text=, to: @settings

  def forward(iter : TextIter) : {TextIter, TextIter}?
    match_start = Gtk::TextIter.new
    match_end = Gtk::TextIter.new
    found, _wrapped_around = @context.forward(iter, match_start, match_end)
    return unless found

    {match_start, match_end}
  end

  def backward(iter : TextIter) : {TextIter, TextIter}?
    match_start = Gtk::TextIter.new
    match_end = Gtk::TextIter.new
    found, _wrapped_around = @context.backward(iter, match_start, match_end)
    return unless found

    {match_start, match_end}
  end

  def on_find_finish(&block)
    return if @on_find_finish_connected

    @context.connect("notify::occurrences-count") do
      block.call
    end
  end

  def find(text : String) : TextRange?
    @settings.search_text = text
    find_impl(@buffer.cursor_position, forward: true)
  end

  def find_next : TextRange?
    find_impl(@buffer.cursor_position + 1, forward: true)
  end

  def find_prev : TextRange?
    find_impl(@buffer.cursor_position, forward: false)
  end

  private def find_impl(offset : Int32, forward : Bool)
    iter = @buffer.iter_at_offset(offset)
    match_pos = forward ? forward(iter) : backward(iter)
    return if match_pos.nil?

    match_start, match_end = match_pos
    @buffer.place_cursor(match_start)
    @buffer.select_range(match_start, match_end)
    match_pos
  end

  def has_error? : Bool
    !@context.regex_error.empty?
  end

  def error_message : String
    error = @context.regex_error
    return "" if error.nil?

    error
  end
end
