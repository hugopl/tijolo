require "./code_buffer"
require "./code_cursor"
require "./code_layout"

# Current state of text widget: Far from done.
#
# All code here still a proof of concept, things are done just the enough to be able to advance to the next step and
# check if I did the right choices. When I see that the things I want are possible with the current code then I stop and
# fill the (many) missing bits.
class CodeEditor < Gtk::Widget
  include Gtk::Scrollable

  @[GObject::Property]
  property hadjustment : Gtk::Adjustment?
  @[GObject::Property]
  property vadjustment : Gtk::Adjustment?
  @[GObject::Property]
  getter vscroll_policy : Gtk::ScrollablePolicy
  @[GObject::Property]
  getter hscroll_policy : Gtk::ScrollablePolicy
  @[GObject::Property]
  getter buffer : CodeBuffer
  @[GObject::Property]
  property editable = true

  # FIXME: Fix this bug in gi-crystal, property declared with property? macro doesn't compile
  # @[GObject::Property]
  property? draw_grid = true

  signal cursor_changed(line : Int32, col : Int32)

  # Text rendering
  @pango_ctx : Pango::Context
  @code_layout : CodeLayout

  # Colors
  @bg_color : Gdk::RGBA
  @text_color : Gdk::RGBA
  @grid_color : Gdk::RGBA

  @line_height : Float64

  @cursors : CodeCursors

  # Widget width/height
  @width = 0_f32
  @height = 0_f32

  def initialize(resource : Path? = nil)
    super(focusable: true)
    @buffer = CodeBuffer.new(file: resource)

    @pango_ctx = create_pango_context
    @pango_ctx.font_description = Pango::FontDescription.from_string("JetBrainsMono Nerd Font 9")
    @code_layout = CodeLayout.new(@pango_ctx, @buffer)

    metric = @pango_ctx.metrics(nil, nil)
    @line_height = (metric.height / Pango::SCALE).ceil

    # Colors
    @bg_color = Gdk::RGBA.new(0.157, 0.161, 0.137, 1.0)
    @text_color = Gdk::RGBA.new(0.922, 0.922, 0.898, 1.0)
    @grid_color = Gdk::RGBA.new(0.188, 0.188, 0.161, 1.0)

    metric = @pango_ctx.metrics(nil, nil)

    @cursors = CodeCursors.new(@buffer)
    @cursors.on_cursor_change do |line, col|
      cursor_changed_signal.emit(line, col)
    end

    @vscroll_policy = @hscroll_policy = Gtk::ScrollablePolicy::Natural

    im_context = Gtk::IMMulticontext.new
    im_context.commit_signal.connect(&->commit_text(String))
    key_controller = Gtk::EventControllerKey.new(propagation_phase: :target)
    key_controller.im_context = im_context
    add_controller(key_controller)
    key_controller.key_pressed_signal.connect(&->key_pressed(UInt32, UInt32, Gdk::ModifierType))
  end

  def vadjustment=(vadjustment : Gtk::Adjustment?)
    Log.error { "vadjustment for code editor double initiated, a gobject will leak." } unless @vadjustment.nil?
    previous_def

    # FIXME: Disconnect value_changed_signal from old @vadjustment
    vadjustment.value_changed_signal.connect(&->queue_draw) if vadjustment
  end

  private def commit_text(text : String)
    return unless @editable

    @cursors.commit_text(text)
    queue_draw
  end

  private def key_pressed(keyval : UInt32, keycode : UInt32, state : Gdk::ModifierType) : Bool
    return false unless state.none?

    case keyval
    when Gdk::KEY_Up, Gdk::KEY_KP_Up                            then @cursors.move(:display_lines, -1)
    when Gdk::KEY_Down, Gdk::KEY_KP_Down                        then @cursors.move(:display_lines, 1)
    when Gdk::KEY_Right, Gdk::KEY_KP_Right                      then @cursors.move(:visual_positions, 1)
    when Gdk::KEY_Left, Gdk::KEY_KP_Left                        then @cursors.move(:visual_positions, -1)
    when Gdk::KEY_Return, Gdk::KEY_ISO_Enter, Gdk::KEY_KP_Enter then commit_text("\n")
    when Gdk::KEY_BackSpace                                     then @cursors.backspace
    when Gdk::KEY_Delete, Gdk::KEY_KP_Delete                    then @cursors.delete_chars(1)
    when Gdk::KEY_Tab, Gdk::KEY_KP_Tab, Gdk::KEY_ISO_Left_Tab
      Log.error { "Tab insertion not implemented yet" }
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

      draw_grid(snapshot) if draw_grid?
      draw_text(snapshot)
    end
    Log.notice { "Text rendered in #{render_time}" }
  end

  @[GObject::Virtual]
  def size_allocate(width : Int32, height : Int32, baseline : Int32)
    vadjustment = @vadjustment
    return if vadjustment.nil?

    @width = width.to_f32
    @height = height.to_f32
    visible_lines = @height / @line_height

    @code_layout.width = width
    upper = @buffer.line_count.to_f64
    page_size = @code_layout.visible_lines_count
    vadjustment.configure(line_offset.to_f64, 0.0, upper, 1.0, 0.0, visible_lines)
  end

  private def line_offset : Int32
    vadjustment = @vadjustment
    return 0 if vadjustment.nil?

    vadjustment.value.to_i
  end

  private def draw_grid(snapshot : Gtk::Snapshot)
    snapshot.save do
      snapshot.translate(@code_layout.text_left_margin, 0.0)
      width = @code_layout.text_area_width
      # FIXME: grid_height is not aligned
      grid_height = @code_layout.font_height / 2.0_f32
      snapshot.push_repeat(0.0, 0.0, width, @height, 0.0, 0.0, width, grid_height)
      snapshot.append_color(@grid_color, 0.0_f32, 0.0_f32, width, 1)
      snapshot.pop
      snapshot.push_repeat(0.0, 0.0, width, @height, 0.0, 0.0, grid_height, @height)
      snapshot.append_color(@grid_color, 0.0_f32, 0.0_f32, 1, @height)
      snapshot.pop
    end
  end

  private def draw_text(snapshot : Gtk::Snapshot)
    snapshot.save do
      @code_layout.line_offset = line_offset
      @code_layout.render(snapshot, height) do |layout, n|
        @cursors.at_line(n) do |cursor|
          snapshot.render_insertion_cursor(style_context, 0.0, 0.0, layout, cursor.column_byte, :ltr)
        end
      end
    end
  end
end
