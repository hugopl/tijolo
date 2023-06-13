require "./code_buffer"
require "./code_cursor"
require "./code_layout"
require "./code_line_number_gutter"
require "./code_snapshot"
require "./code_theme"

# Current state of text widget: Far from done.
#
# All code here still a proof of concept, things are done just the enough to be able to advance to the next step and
# check if I did the right choices. When I see that the things I want are possible with the current code then I stop and
# fill the (many) missing bits.
class CodeEditor < Gtk::Widget
  include Gtk::Scrollable

  MARGIN        = 4.0_f32
  DOUBLE_MARGIN = 8.0_f32

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
  @code_layout : CodeLayout
  @code_gutters : Array(CodeGutter)
  @code_gutters_width : Float32
  @code_width : Float32
  @line_height : Float32
  @font_width : Float32

  @cursors : CodeCursors

  # Widget width/height
  @width = 0_f32
  @height = 0_f32

  def initialize(source : IO?, language : String?)
    super(focusable: true, cursor: Gdk::Cursor.new_from_name("text", nil), css_name: "codeeditor")

    @buffer = CodeBuffer.new(source, language)
    pango_ctx = pango_context

    metric = pango_ctx.metrics(nil, nil)
    @line_height = (metric.height / Pango::SCALE).ceil.to_f32
    @font_width = (metric.approximate_char_width / Pango::SCALE).to_f32

    @code_layout = CodeLayout.new(pango_ctx, @buffer)
    @code_gutters = [CodeLineNumberGutter.new(pango_ctx)] of CodeGutter
    @code_gutters_width = 0.0
    @code_width = 0.0

    @cursors = CodeCursors.new(@buffer)
    @cursors.on_cursor_change do |line, col|
      cursor_changed_signal.emit(line, col)
      queue_draw
    end

    @vscroll_policy = @hscroll_policy = Gtk::ScrollablePolicy::Natural

    im_context = Gtk::IMMulticontext.new
    im_context.commit_signal.connect(&->commit_text(String))
    key_controller = Gtk::EventControllerKey.new(propagation_phase: :target)
    key_controller.im_context = im_context
    add_controller(key_controller)
    key_controller.key_pressed_signal.connect(&->key_pressed(UInt32, UInt32, Gdk::ModifierType))

    gesture_controller = Gtk::GestureClick.new
    gesture_controller.pressed_signal.connect(&->clicked(Int32, Float64, Float64))
    add_controller(gesture_controller)
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
    when Gdk::KEY_Home                                          then @cursors.move(:paragraph_ends, -1)
    when Gdk::KEY_End                                           then @cursors.move(:paragraph_ends, 1)
    when Gdk::KEY_Page_Up, Gdk::KEY_KP_Page_Up                  then @cursors.move(:display_lines, -page_size // 2)
    when Gdk::KEY_Page_Down, Gdk::KEY_KP_Page_Down              then @cursors.move(:display_lines, page_size // 2)
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

  private def clicked(n_press : Int32, x : Float64, y : Float64)
    line, column = x_y_to_line_column(x, y)
    @cursors.keep_just_one_cursor_at(line, column)
  end

  private def x_y_to_line_column(x : Float64, y : Float64) : {Int32, Int32}
    line = (y / @line_height).floor.to_i + line_offset
    code_line = @code_layout[line]?

    # Probably clicking bellow last line
    return {line, 0} if code_line.nil?

    byteindex = code_line.byte_at(x)
    column = @buffer.line_byte_index_to_char_index(line, byteindex)
    {line, column}
  end

  # Page size in lines
  private def page_size : Int32
    (@height / @line_height).to_i
  end

  @[GObject::Virtual]
  def snapshot(snapshot : Gtk::Snapshot)
    snapshot = CodeSnapshot.new(snapshot, @width, @height, @font_width, @line_height)
    render_time = Time.measure do
      snapshot.append_color(CodeTheme.instance.background_color, 0.0_f32, 0.0_f32, @width, @height)

      render_code_gutters(snapshot)
      render_grid(snapshot) if draw_grid?

      snapshot.translate(MARGIN, 0.0_f32)
      render_selections(snapshot)
      render_text(snapshot)
      render_cursors(snapshot)
    end
    Log.notice { "render time: #{render_time}" }
  end

  @[GObject::Virtual]
  def size_allocate(width : Int32, height : Int32, baseline : Int32)
    vadjustment = @vadjustment
    return if vadjustment.nil?

    @width = width.to_f32
    @height = height.to_f32

    upper = @buffer.line_count + page_size / 2
    vadjustment.configure(line_offset.to_f64, 0.0, upper, 1.0, 0.0, page_size)
  end

  private def line_offset : Int32
    vadjustment = @vadjustment
    return 0 if vadjustment.nil?

    vadjustment.value.to_i
  end

  private def render_code_gutters(snapshot : CodeSnapshot)
    @code_gutters_width = 0.0
    @code_gutters.each do |gutter|
      gutter.render(snapshot, @buffer, line_offset)
      @code_gutters_width += gutter.width
      snapshot.translate(gutter.width, 0.0_f32)
    end
    @code_width = snapshot.viewport_width - @code_gutters_width - DOUBLE_MARGIN
  end

  private def render_grid(snapshot : CodeSnapshot)
    grid_width = @code_width + DOUBLE_MARGIN
    grid_height = @line_height / 2.0_f32
    grid_color = CodeTheme.instance.grid_color

    snapshot.save do
      snapshot.push_repeat(0.0_f32, 0.0_f32, grid_width, @height, 0.0_f32, 0.0_f32, grid_width, grid_height)
      snapshot.append_color(grid_color, 0.0_f32, 0.0_f32, grid_width, 1_f32)
      snapshot.pop
      snapshot.push_repeat(0.0_f32, 0.0_f32, grid_width, @height, 0.0_f32, 0.0_f32, grid_height, @height)
      snapshot.append_color(grid_color, 0.0_f32, 0.0_f32, 1_f32, @height)
      snapshot.pop
    end
  end

  private def render_selections(snapshot : CodeSnapshot)
  end

  private def render_text(snapshot : CodeSnapshot)
    snapshot.save do
      @code_layout.render(snapshot, line_offset, @code_width)
    end
  end

  private def render_cursors(snapshot : CodeSnapshot)
    @cursors.each do |cursor|
      next unless @code_layout.line_visible?(cursor.line)

      layout = @code_layout.line_layout(cursor.line)
      next if layout.nil?

      y_offset = snapshot.line_height * (cursor.line - line_offset)
      snapshot.translate(0.0_f32, y_offset)
      snapshot.render_insertion_cursor(style_context, 0.0, 0.0, layout, cursor.column_byte_index, Pango::Direction::Ltr)
      snapshot.translate(0.0_f32, -y_offset)
    end
  end
end
