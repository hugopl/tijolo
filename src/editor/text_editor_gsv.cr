require "./text_buffer_gsv"

alias TextIter = Gtk::TextIter

# Wrapper class for GTKSourceView, so we can replace the text editor for a home made solution in the future
class Editor::TextEditor
  @editor = GtkSource::View.new
  getter buffer : TextBuffer

  def initialize
    @editor.smart_home_end = :before
    @editor.monospace = true
    @editor.auto_indent = true
    @editor.smart_backspace = true

    @buffer = TextBuffer.new(GtkSource::Buffer.cast(@editor.buffer))
  end

  def widget
    @editor
  end

  getter font_size = -1
  delegate :wrap_mode=, to: @editor
  delegate :show_line_numbers=, to: @editor
  delegate :tab_width=, to: @editor
  delegate :insert_spaces_instead_of_tabs=, to: @editor
  delegate :show_right_margin=, to: @editor
  delegate :right_margin_position=, to: @editor
  delegate :highlight_current_line=, to: @editor
  delegate :tab_width=, to: @editor

  delegate focus?, to: @editor

  def background_pattern=(pattern : BackgroundPattern)
    @editor.background_pattern = GtkSource::BackgroundPatternType.from_value(pattern.to_i)
  end

  def wrap_mode=(mode : WrapMode)
    @editor.wrap_mode = Gtk::WrapMode.from_value(mode.to_i)
  end

  def scroll_to(iter : TextIter) : Nil
    @editor.scroll_to_iter(iter, 0.0, true, 0.0, 0.5)
  end

  def readonly=(value : Bool) : Nil
    @editor.editable = !value
  end

  def font_size=(size : Int32) : Nil
    size = size.clamp(1, 50)
    return if size == @font_size

    style_ctx = @editor.style_context
    font_descr = style_ctx.font(:normal)
    font_descr.size = size * Pango::SCALE
    # This is a deprecated func call... but the proposed GTK3 API to do this is stupid...
    @editor.override_font(font_descr)
    @font_size = size
  end

  def visible?(iter : TextIter) : Bool
    visible_rect = @editor.visible_rect
    iter_rect = @editor.iter_location(iter)
    result = visible_rect.intersect(iter_rect)

    result.width > 0 && result.height > 0 && result.height >= @editor.line_height(iter)
  end
end
