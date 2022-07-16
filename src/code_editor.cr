require "./code_buffer"
require "./code_cursor"

# Current state of text widget: Far from done.
#
# All code here still a proof of concept, things are done just the enough to be able to advance to the next step and
# check if I did the right choices. When I see that the things I want are possible with the current code then I stop and
# fill the (many) missing bits.
#
# TODO list:
# - [ ] Fix pango metrics crash on gi-crystal
# - [ ] Implement `gtk_widget_class_add_binding_signal` on gtk4 shard
# - [x] Add a bunch of overloads to Gtk::Snapshot to avoid keep creating graphene points on stack
# - [x] Draw grid
# - [x] Draw cursors
# - [ ] Make cursors blink
# - [ ] Hide mouse when typing
# - [x] Move cursors
# - [ ] Multiple cursors
# - [x] Add feature to implement interface properties on gi-crystal
# - [x] Implement Scrollable interface
# - [x] Study tree-sitter
# - [ ] Highlight code with tree sitter
# - [x] Handle text input (just really basic stuff to be able to test few things)
# - [ ] Refactor the code editor and cursors code that must be a mess at this point.
# - [ ] Replace dummy text buffer by a piece table 🔥️
class CodeEditor < Gtk::Widget
  private MARGIN        = 4.0_f32
  private DOUBLE_MARGIN = 8.0_f32

  @pango_ctx : Pango::Context
  @[GObject::Property]
  getter buffer : CodeBuffer

  property? draw_grid = true
  signal cursor_changed(line : Int32, col : Int32)

  # Colors
  @bg_color : Gdk::RGBA
  @text_color : Gdk::RGBA
  @grid_color : Gdk::RGBA

  @font_height : Float32
  @font_width : Float32

  @cursors : CodeCursors
  @line_offset = 0

  # Widget width/height
  @width = 0.0_f32
  @height = 0.0_f32

  def initialize(resource : Path? = nil)
    super(focusable: true)
    @buffer = CodeBuffer.new(resource)

    @pango_ctx = create_pango_context
    @pango_ctx.font_description = Pango::FontDescription.from_string("JetBrainsMono Nerd Font 9")

    # Colors
    @bg_color = Gdk::RGBA.new(0.157, 0.161, 0.137, 1.0)
    @text_color = Gdk::RGBA.new(0.922, 0.922, 0.898, 1.0)
    @grid_color = Gdk::RGBA.new(0.188, 0.188, 0.161, 1.0)

    # FIXME: Pango::FontMetrics is crashing with a double free!
    # metric = @pango_ctx.metrics(nil, nil)
    # @font_height = (metric.height / Pango::SCALE).to_f32
    # @font_width = (metric.approximate_char_width / Pango::SCALE).to_f32
    @font_height = 14.639648
    @font_width = 7.2001953

    @cursors = CodeCursors.new(@buffer)
    @cursors.on_cursor_change do |line, col|
      cursor_changed_signal.emit(line, col)
    end

    im_context = Gtk::IMMulticontext.new
    im_context.commit_signal.connect(&->commit_text(String))
    key_controller = Gtk::EventControllerKey.new(propagation_phase: :target)
    key_controller.im_context = im_context
    add_controller(key_controller)
    key_controller.key_pressed_signal.connect(&->key_pressed(UInt32, UInt32, Gdk::ModifierType))
  end

  private def commit_text(text : String)
    Log.info { "commit text: #{text}" }
    @cursors.commit_text(text)

    queue_draw
  end

  private def key_pressed(keyval : UInt32, keycode : UInt32, state : Gdk::ModifierType) : Bool
    Log.info { "key pressed!" }
    return false unless state.none?

    case keyval
    when Gdk::KEY_Up, Gdk::KEY_KP_Up       then @cursors.move(:display_lines, -1)
    when Gdk::KEY_Down, Gdk::KEY_KP_Down   then @cursors.move(:display_lines, 1)
    when Gdk::KEY_Right, Gdk::KEY_KP_Right then @cursors.move(:visual_positions, 1)
    when Gdk::KEY_Left, Gdk::KEY_KP_Left   then @cursors.move(:visual_positions, -1)
    else
      return false
    end

    queue_draw
    true
  end

  @[GObject::Virtual]
  def snapshot(snapshot : Gtk::Snapshot)
    render_time = Time.measure do
      snapshot.append_color(@bg_color, 0.0_f32, 0.0_f32, @width, @height)

      draw_gutter(snapshot)
      draw_line_numbers(snapshot)
      draw_grid(snapshot) if draw_grid?
      draw_text(snapshot)
    end
    Log.notice { "text rendered in #{render_time}" }
  end

  @[GObject::Virtual]
  def size_allocate(width : Int32, height : Int32, baseline : Int32)
    Log.notice { "size_allocate! #{width}, #{height}, #{baseline}" }
    @width = width.to_f32
    @height = height.to_f32
  end

  private def digits_count(n : Int32) : Int32
    (Math.log(n.to_f + 1) / Math::LOG10).ceil.to_i
  end

  private def draw_grid(snapshot : Gtk::Snapshot)
    digits = digits_count(@buffer.line_count)
    snapshot.save do
      snapshot.translate(digits * @font_width + DOUBLE_MARGIN, 0.0)
      # FIXME: grid_height is not aligned
      grid_height = @font_height / 2.0_f32
      snapshot.push_repeat(0.0, 0.0, @width, @height, 0.0, 0.0, @width, grid_height)
      snapshot.append_color(@grid_color, 0.0_f32, 0.0_f32, @width, 1)
      snapshot.pop
      snapshot.push_repeat(0.0, 0.0, @width, @height, 0.0, 0.0, grid_height, @height)
      snapshot.append_color(@grid_color, 0.0_f32, 0.0_f32, 1, @height)
      snapshot.pop
    end
  end

  private def draw_line_numbers(snapshot : Gtk::Snapshot)
    snapshot.save do
      layout = Pango::Layout.new(@pango_ctx)

      snapshot.translate(MARGIN, 0.0_f32)
      trans = Graphene::Point.new(0.0, @font_height)

      height_trans = 0.0_f32
      @line_offset.upto(@buffer.line_count - 1) do |i|
        i += 1
        layout.set_text(i.to_s, i.to_s.bytesize) # Maybe is worth to cache the strings with line numbers?
        snapshot.append_layout(layout, @text_color)
        snapshot.translate(trans)
        height_trans += @font_height
        break if height_trans > @height
      end
    end
  end

  private def draw_gutter(snapshot : Gtk::Snapshot)
  end

  private def draw_text(snapshot : Gtk::Snapshot)
    digits = digits_count(@buffer.line_count)
    snapshot.translate(digits * @font_width + DOUBLE_MARGIN, 0.0)

    layout = Pango::Layout.new(@pango_ctx)

    height_trans = 0.0_f32
    @buffer.each_line(offset: @line_offset) do |text, line|
      layout.set_text(text)
      snapshot.append_layout(layout, @text_color)

      @cursors.at_line(line) do |cursor|
        snapshot.render_insertion_cursor(style_context, 0.0, 0.0, layout, cursor.column_byte, :ltr)
      end

      snapshot.translate(0.0, @font_height)
      height_trans += @font_height
      break if height_trans > @height
    end
  end
end
