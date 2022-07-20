require_gobject("GObject", "2.0")
require_gobject("GdkPixbuf", "2.0")
require_gobject("Pango", "1.0")
require_gobject("cairo", "1.0")
require_gobject("GLib", "2.0")
require_gobject("GModule", "2.0")
require_gobject("Gio", "2.0")

@[Link("gdk-3", pkg_config: "gdk-3")]
lib LibGdk
  ###########################################
  # #    Flags
  ###########################################

  alias AnchorHints = UInt32

  alias AxisFlags = UInt32

  alias DragAction = UInt32

  alias EventMask = UInt32

  alias FrameClockPhase = UInt32

  alias ModifierType = UInt32

  alias SeatCapabilities = UInt32

  alias WMDecoration = UInt32

  alias WMFunction = UInt32

  alias WindowAttributesType = UInt32

  alias WindowHints = UInt32

  alias WindowState = UInt32

  ###########################################
  # #    Objects
  ###########################################

  struct AppLaunchContext # object
    _data : UInt8[0]
    # Property display : LibGdk::Display
  end

  fun _gdk_app_launch_context_get_type = gdk_app_launch_context_get_type : UInt64
  fun app_launch_context_new = gdk_app_launch_context_new : Pointer(LibGdk::AppLaunchContext)
  fun app_launch_context_set_desktop = gdk_app_launch_context_set_desktop(this : AppLaunchContext*, desktop : Int32) : Void
  fun app_launch_context_set_display = gdk_app_launch_context_set_display(this : AppLaunchContext*, display : Pointer(LibGdk::Display)) : Void
  fun app_launch_context_set_icon = gdk_app_launch_context_set_icon(this : AppLaunchContext*, icon : Pointer(LibGio::Icon)) : Void
  fun app_launch_context_set_icon_name = gdk_app_launch_context_set_icon_name(this : AppLaunchContext*, icon_name : Pointer(UInt8)) : Void
  fun app_launch_context_set_screen = gdk_app_launch_context_set_screen(this : AppLaunchContext*, screen : Pointer(LibGdk::Screen)) : Void
  fun app_launch_context_set_timestamp = gdk_app_launch_context_set_timestamp(this : AppLaunchContext*, timestamp : UInt32) : Void

  struct Cursor # object
    _data : UInt8[0]
    # Property cursor-type : LibGdk::CursorType
    # Property display : LibGdk::Display
  end

  fun _gdk_cursor_get_type = gdk_cursor_get_type : UInt64
  fun cursor_new = gdk_cursor_new(cursor_type : LibGdk::CursorType) : Pointer(LibGdk::Cursor)
  fun cursor_new_for_display = gdk_cursor_new_for_display(display : Pointer(LibGdk::Display), cursor_type : LibGdk::CursorType) : Pointer(LibGdk::Cursor)
  fun cursor_new_from_name = gdk_cursor_new_from_name(display : Pointer(LibGdk::Display), name : Pointer(UInt8)) : Pointer(LibGdk::Cursor)
  fun cursor_new_from_pixbuf = gdk_cursor_new_from_pixbuf(display : Pointer(LibGdk::Display), pixbuf : Pointer(LibGdkPixbuf::Pixbuf), x : Int32, y : Int32) : Pointer(LibGdk::Cursor)
  fun cursor_new_from_surface = gdk_cursor_new_from_surface(display : Pointer(LibGdk::Display), surface : Pointer(LibCairo::Surface), x : Float64, y : Float64) : Pointer(LibGdk::Cursor)
  fun cursor_get_cursor_type = gdk_cursor_get_cursor_type(this : Cursor*) : LibGdk::CursorType
  fun cursor_get_display = gdk_cursor_get_display(this : Cursor*) : Pointer(LibGdk::Display)
  fun cursor_get_image = gdk_cursor_get_image(this : Cursor*) : Pointer(LibGdkPixbuf::Pixbuf)
  fun cursor_get_surface = gdk_cursor_get_surface(this : Cursor*, x_hot : Float64*, y_hot : Float64*) : Pointer(LibCairo::Surface)
  fun cursor_ref = gdk_cursor_ref(this : Cursor*) : Pointer(LibGdk::Cursor)
  fun cursor_unref = gdk_cursor_unref(this : Cursor*) : Void

  struct Device # object
    _data : UInt8[0]
    # Signal changed
    # Signal tool-changed
    # Property associated-device : LibGdk::Device
    # Property axes : LibGdk::AxisFlags
    # Property device-manager : LibGdk::DeviceManager
    # Property display : LibGdk::Display
    # Property has-cursor : LibC::Int
    # Property input-mode : LibGdk::InputMode
    # Property input-source : LibGdk::InputSource
    # Property n-axes : UInt32
    # Property name : Pointer(UInt8)
    # Property num-touches : UInt32
    # Property product-id : Pointer(UInt8)
    # Property seat : LibGdk::Seat
    # Property tool : LibGdk::DeviceTool
    # Property type : LibGdk::DeviceType
    # Property vendor-id : Pointer(UInt8)
  end

  fun _gdk_device_get_type = gdk_device_get_type : UInt64
  fun device_grab_info_libgtk_only = gdk_device_grab_info_libgtk_only(display : Pointer(LibGdk::Display), device : Pointer(LibGdk::Device), grab_window : Pointer(LibGdk::Window)*, owner_events : LibC::Int*) : LibC::Int
  fun device_get_associated_device = gdk_device_get_associated_device(this : Device*) : Pointer(LibGdk::Device)
  fun device_get_axes = gdk_device_get_axes(this : Device*) : LibGdk::AxisFlags
  fun device_get_axis_use = gdk_device_get_axis_use(this : Device*, index_ : UInt32) : LibGdk::AxisUse
  fun device_get_device_type = gdk_device_get_device_type(this : Device*) : LibGdk::DeviceType
  fun device_get_display = gdk_device_get_display(this : Device*) : Pointer(LibGdk::Display)
  fun device_get_has_cursor = gdk_device_get_has_cursor(this : Device*) : LibC::Int
  fun device_get_key = gdk_device_get_key(this : Device*, index_ : UInt32, keyval : UInt32*, modifiers : LibGdk::ModifierType*) : LibC::Int
  fun device_get_last_event_window = gdk_device_get_last_event_window(this : Device*) : Pointer(LibGdk::Window)
  fun device_get_mode = gdk_device_get_mode(this : Device*) : LibGdk::InputMode
  fun device_get_n_axes = gdk_device_get_n_axes(this : Device*) : Int32
  fun device_get_n_keys = gdk_device_get_n_keys(this : Device*) : Int32
  fun device_get_name = gdk_device_get_name(this : Device*) : Pointer(UInt8)
  fun device_get_position = gdk_device_get_position(this : Device*, screen : Pointer(LibGdk::Screen)*, x : Int32*, y : Int32*) : Void
  fun device_get_position_double = gdk_device_get_position_double(this : Device*, screen : Pointer(LibGdk::Screen)*, x : Float64*, y : Float64*) : Void
  fun device_get_product_id = gdk_device_get_product_id(this : Device*) : Pointer(UInt8)
  fun device_get_seat = gdk_device_get_seat(this : Device*) : Pointer(LibGdk::Seat)
  fun device_get_source = gdk_device_get_source(this : Device*) : LibGdk::InputSource
  fun device_get_vendor_id = gdk_device_get_vendor_id(this : Device*) : Pointer(UInt8)
  fun device_get_window_at_position = gdk_device_get_window_at_position(this : Device*, win_x : Int32*, win_y : Int32*) : Pointer(LibGdk::Window)
  fun device_get_window_at_position_double = gdk_device_get_window_at_position_double(this : Device*, win_x : Float64*, win_y : Float64*) : Pointer(LibGdk::Window)
  fun device_grab = gdk_device_grab(this : Device*, window : Pointer(LibGdk::Window), grab_ownership : LibGdk::GrabOwnership, owner_events : LibC::Int, event_mask : LibGdk::EventMask, cursor : Pointer(LibGdk::Cursor), time_ : UInt32) : LibGdk::GrabStatus
  fun device_list_axes = gdk_device_list_axes(this : Device*) : Pointer(Void*)
  fun device_list_slave_devices = gdk_device_list_slave_devices(this : Device*) : Pointer(Void*)
  fun device_set_axis_use = gdk_device_set_axis_use(this : Device*, index_ : UInt32, use : LibGdk::AxisUse) : Void
  fun device_set_key = gdk_device_set_key(this : Device*, index_ : UInt32, keyval : UInt32, modifiers : LibGdk::ModifierType) : Void
  fun device_set_mode = gdk_device_set_mode(this : Device*, mode : LibGdk::InputMode) : LibC::Int
  fun device_ungrab = gdk_device_ungrab(this : Device*, time_ : UInt32) : Void
  fun device_warp = gdk_device_warp(this : Device*, screen : Pointer(LibGdk::Screen), x : Int32, y : Int32) : Void

  struct DeviceManager # object
    _data : UInt8[0]
    # Signal device-added
    # Signal device-changed
    # Signal device-removed
    # Property display : LibGdk::Display
  end

  fun _gdk_device_manager_get_type = gdk_device_manager_get_type : UInt64
  fun device_manager_get_client_pointer = gdk_device_manager_get_client_pointer(this : DeviceManager*) : Pointer(LibGdk::Device)
  fun device_manager_get_display = gdk_device_manager_get_display(this : DeviceManager*) : Pointer(LibGdk::Display)
  fun device_manager_list_devices = gdk_device_manager_list_devices(this : DeviceManager*, type : LibGdk::DeviceType) : Pointer(Void*)

  struct DeviceTool # object
    _data : UInt8[0]
    # Property axes : LibGdk::AxisFlags
    # Property hardware-id : UInt64
    # Property serial : UInt64
    # Property tool-type : LibGdk::DeviceToolType
  end

  fun _gdk_device_tool_get_type = gdk_device_tool_get_type : UInt64
  fun device_tool_get_hardware_id = gdk_device_tool_get_hardware_id(this : DeviceTool*) : UInt64
  fun device_tool_get_serial = gdk_device_tool_get_serial(this : DeviceTool*) : UInt64
  fun device_tool_get_tool_type = gdk_device_tool_get_tool_type(this : DeviceTool*) : LibGdk::DeviceToolType

  struct Display # object
    _data : UInt8[0]
    # Signal closed
    # Signal monitor-added
    # Signal monitor-removed
    # Signal opened
    # Signal seat-added
    # Signal seat-removed
  end

  fun _gdk_display_get_type = gdk_display_get_type : UInt64
  fun display_get_default = gdk_display_get_default : Pointer(LibGdk::Display)
  fun display_open = gdk_display_open(display_name : Pointer(UInt8)) : Pointer(LibGdk::Display)
  fun display_open_default_libgtk_only = gdk_display_open_default_libgtk_only : Pointer(LibGdk::Display)
  fun display_beep = gdk_display_beep(this : Display*) : Void
  fun display_close = gdk_display_close(this : Display*) : Void
  fun display_device_is_grabbed = gdk_display_device_is_grabbed(this : Display*, device : Pointer(LibGdk::Device)) : LibC::Int
  fun display_flush = gdk_display_flush(this : Display*) : Void
  fun display_get_app_launch_context = gdk_display_get_app_launch_context(this : Display*) : Pointer(LibGdk::AppLaunchContext)
  fun display_get_default_cursor_size = gdk_display_get_default_cursor_size(this : Display*) : UInt32
  fun display_get_default_group = gdk_display_get_default_group(this : Display*) : Pointer(LibGdk::Window)
  fun display_get_default_screen = gdk_display_get_default_screen(this : Display*) : Pointer(LibGdk::Screen)
  fun display_get_default_seat = gdk_display_get_default_seat(this : Display*) : Pointer(LibGdk::Seat)
  fun display_get_device_manager = gdk_display_get_device_manager(this : Display*) : Pointer(LibGdk::DeviceManager)
  fun display_get_event = gdk_display_get_event(this : Display*) : Pointer(LibGdk::Event)
  fun display_get_maximal_cursor_size = gdk_display_get_maximal_cursor_size(this : Display*, width : UInt32*, height : UInt32*) : Void
  fun display_get_monitor = gdk_display_get_monitor(this : Display*, monitor_num : Int32) : Pointer(LibGdk::Monitor)
  fun display_get_monitor_at_point = gdk_display_get_monitor_at_point(this : Display*, x : Int32, y : Int32) : Pointer(LibGdk::Monitor)
  fun display_get_monitor_at_window = gdk_display_get_monitor_at_window(this : Display*, window : Pointer(LibGdk::Window)) : Pointer(LibGdk::Monitor)
  fun display_get_n_monitors = gdk_display_get_n_monitors(this : Display*) : Int32
  fun display_get_n_screens = gdk_display_get_n_screens(this : Display*) : Int32
  fun display_get_name = gdk_display_get_name(this : Display*) : Pointer(UInt8)
  fun display_get_pointer = gdk_display_get_pointer(this : Display*, screen : Pointer(LibGdk::Screen)*, x : Int32*, y : Int32*, mask : LibGdk::ModifierType*) : Void
  fun display_get_primary_monitor = gdk_display_get_primary_monitor(this : Display*) : Pointer(LibGdk::Monitor)
  fun display_get_screen = gdk_display_get_screen(this : Display*, screen_num : Int32) : Pointer(LibGdk::Screen)
  fun display_get_window_at_pointer = gdk_display_get_window_at_pointer(this : Display*, win_x : Int32*, win_y : Int32*) : Pointer(LibGdk::Window)
  fun display_has_pending = gdk_display_has_pending(this : Display*) : LibC::Int
  fun display_is_closed = gdk_display_is_closed(this : Display*) : LibC::Int
  fun display_keyboard_ungrab = gdk_display_keyboard_ungrab(this : Display*, time_ : UInt32) : Void
  fun display_list_devices = gdk_display_list_devices(this : Display*) : Pointer(Void*)
  fun display_list_seats = gdk_display_list_seats(this : Display*) : Pointer(Void*)
  fun display_notify_startup_complete = gdk_display_notify_startup_complete(this : Display*, startup_id : Pointer(UInt8)) : Void
  fun display_peek_event = gdk_display_peek_event(this : Display*) : Pointer(LibGdk::Event)
  fun display_pointer_is_grabbed = gdk_display_pointer_is_grabbed(this : Display*) : LibC::Int
  fun display_pointer_ungrab = gdk_display_pointer_ungrab(this : Display*, time_ : UInt32) : Void
  fun display_put_event = gdk_display_put_event(this : Display*, event : Pointer(LibGdk::Event)) : Void
  fun display_request_selection_notification = gdk_display_request_selection_notification(this : Display*, selection : Pointer(LibGdk::Atom)) : LibC::Int
  fun display_set_double_click_distance = gdk_display_set_double_click_distance(this : Display*, distance : UInt32) : Void
  fun display_set_double_click_time = gdk_display_set_double_click_time(this : Display*, msec : UInt32) : Void
  fun display_store_clipboard = gdk_display_store_clipboard(this : Display*, clipboard_window : Pointer(LibGdk::Window), time_ : UInt32, targets : Pointer(Pointer(LibGdk::Atom)), n_targets : Int32) : Void
  fun display_supports_clipboard_persistence = gdk_display_supports_clipboard_persistence(this : Display*) : LibC::Int
  fun display_supports_composite = gdk_display_supports_composite(this : Display*) : LibC::Int
  fun display_supports_cursor_alpha = gdk_display_supports_cursor_alpha(this : Display*) : LibC::Int
  fun display_supports_cursor_color = gdk_display_supports_cursor_color(this : Display*) : LibC::Int
  fun display_supports_input_shapes = gdk_display_supports_input_shapes(this : Display*) : LibC::Int
  fun display_supports_selection_notification = gdk_display_supports_selection_notification(this : Display*) : LibC::Int
  fun display_supports_shapes = gdk_display_supports_shapes(this : Display*) : LibC::Int
  fun display_sync = gdk_display_sync(this : Display*) : Void
  fun display_warp_pointer = gdk_display_warp_pointer(this : Display*, screen : Pointer(LibGdk::Screen), x : Int32, y : Int32) : Void

  struct DisplayManager # object
    _data : UInt8[0]
    # Signal display-opened
    # Property default-display : LibGdk::Display
  end

  fun _gdk_display_manager_get_type = gdk_display_manager_get_type : UInt64
  fun display_manager_get = gdk_display_manager_get : Pointer(LibGdk::DisplayManager)
  fun display_manager_get_default_display = gdk_display_manager_get_default_display(this : DisplayManager*) : Pointer(LibGdk::Display)
  fun display_manager_list_displays = gdk_display_manager_list_displays(this : DisplayManager*) : Pointer(Void*)
  fun display_manager_open_display = gdk_display_manager_open_display(this : DisplayManager*, name : Pointer(UInt8)) : Pointer(LibGdk::Display)
  fun display_manager_set_default_display = gdk_display_manager_set_default_display(this : DisplayManager*, display : Pointer(LibGdk::Display)) : Void

  struct DragContext # object
    _data : UInt8[0]
    # Signal action-changed
    # Signal cancel
    # Signal dnd-finished
    # Signal drop-performed
  end

  fun _gdk_drag_context_get_type = gdk_drag_context_get_type : UInt64
  fun drag_context_get_actions = gdk_drag_context_get_actions(this : DragContext*) : LibGdk::DragAction
  fun drag_context_get_dest_window = gdk_drag_context_get_dest_window(this : DragContext*) : Pointer(LibGdk::Window)
  fun drag_context_get_device = gdk_drag_context_get_device(this : DragContext*) : Pointer(LibGdk::Device)
  fun drag_context_get_drag_window = gdk_drag_context_get_drag_window(this : DragContext*) : Pointer(LibGdk::Window)
  fun drag_context_get_protocol = gdk_drag_context_get_protocol(this : DragContext*) : LibGdk::DragProtocol
  fun drag_context_get_selected_action = gdk_drag_context_get_selected_action(this : DragContext*) : LibGdk::DragAction
  fun drag_context_get_source_window = gdk_drag_context_get_source_window(this : DragContext*) : Pointer(LibGdk::Window)
  fun drag_context_get_suggested_action = gdk_drag_context_get_suggested_action(this : DragContext*) : LibGdk::DragAction
  fun drag_context_list_targets = gdk_drag_context_list_targets(this : DragContext*) : Pointer(Void*)
  fun drag_context_manage_dnd = gdk_drag_context_manage_dnd(this : DragContext*, ipc_window : Pointer(LibGdk::Window), actions : LibGdk::DragAction) : LibC::Int
  fun drag_context_set_device = gdk_drag_context_set_device(this : DragContext*, device : Pointer(LibGdk::Device)) : Void
  fun drag_context_set_hotspot = gdk_drag_context_set_hotspot(this : DragContext*, hot_x : Int32, hot_y : Int32) : Void

  struct DrawingContext # object
    _data : UInt8[0]
    # Property clip : LibCairo::Region
    # Property window : LibGdk::Window
  end

  fun _gdk_drawing_context_get_type = gdk_drawing_context_get_type : UInt64
  fun drawing_context_get_cairo_context = gdk_drawing_context_get_cairo_context(this : DrawingContext*) : Pointer(LibCairo::Context)
  fun drawing_context_get_clip = gdk_drawing_context_get_clip(this : DrawingContext*) : Pointer(LibCairo::Region)
  fun drawing_context_get_window = gdk_drawing_context_get_window(this : DrawingContext*) : Pointer(LibGdk::Window)
  fun drawing_context_is_valid = gdk_drawing_context_is_valid(this : DrawingContext*) : LibC::Int

  struct FrameClock # object
    _data : UInt8[0]
    # Signal after-paint
    # Signal before-paint
    # Signal flush-events
    # Signal layout
    # Signal paint
    # Signal resume-events
    # Signal update
  end

  fun _gdk_frame_clock_get_type = gdk_frame_clock_get_type : UInt64
  fun frame_clock_begin_updating = gdk_frame_clock_begin_updating(this : FrameClock*) : Void
  fun frame_clock_end_updating = gdk_frame_clock_end_updating(this : FrameClock*) : Void
  fun frame_clock_get_current_timings = gdk_frame_clock_get_current_timings(this : FrameClock*) : Pointer(LibGdk::FrameTimings)
  fun frame_clock_get_frame_counter = gdk_frame_clock_get_frame_counter(this : FrameClock*) : Int64
  fun frame_clock_get_frame_time = gdk_frame_clock_get_frame_time(this : FrameClock*) : Int64
  fun frame_clock_get_history_start = gdk_frame_clock_get_history_start(this : FrameClock*) : Int64
  fun frame_clock_get_refresh_info = gdk_frame_clock_get_refresh_info(this : FrameClock*, base_time : Int64, refresh_interval_return : Int64*, presentation_time_return : Int64*) : Void
  fun frame_clock_get_timings = gdk_frame_clock_get_timings(this : FrameClock*, frame_counter : Int64) : Pointer(LibGdk::FrameTimings)
  fun frame_clock_request_phase = gdk_frame_clock_request_phase(this : FrameClock*, phase : LibGdk::FrameClockPhase) : Void

  struct GLContext # object
    _data : UInt8[0]
    # Property display : LibGdk::Display
    # Property shared-context : LibGdk::GLContext
    # Property window : LibGdk::Window
  end

  fun _gdk_gl_context_get_type = gdk_gl_context_get_type : UInt64
  fun g_l_context_clear_current = gdk_gl_context_clear_current : Void
  fun g_l_context_get_current = gdk_gl_context_get_current : Pointer(LibGdk::GLContext)
  fun g_l_context_get_debug_enabled = gdk_gl_context_get_debug_enabled(this : GLContext*) : LibC::Int
  fun g_l_context_get_display = gdk_gl_context_get_display(this : GLContext*) : Pointer(LibGdk::Display)
  fun g_l_context_get_forward_compatible = gdk_gl_context_get_forward_compatible(this : GLContext*) : LibC::Int
  fun g_l_context_get_required_version = gdk_gl_context_get_required_version(this : GLContext*, major : Int32*, minor : Int32*) : Void
  fun g_l_context_get_shared_context = gdk_gl_context_get_shared_context(this : GLContext*) : Pointer(LibGdk::GLContext)
  fun g_l_context_get_use_es = gdk_gl_context_get_use_es(this : GLContext*) : LibC::Int
  fun g_l_context_get_version = gdk_gl_context_get_version(this : GLContext*, major : Int32*, minor : Int32*) : Void
  fun g_l_context_get_window = gdk_gl_context_get_window(this : GLContext*) : Pointer(LibGdk::Window)
  fun g_l_context_is_legacy = gdk_gl_context_is_legacy(this : GLContext*) : LibC::Int
  fun g_l_context_make_current = gdk_gl_context_make_current(this : GLContext*) : Void
  fun g_l_context_realize = gdk_gl_context_realize(this : GLContext*, error : LibGLib::Error**) : LibC::Int
  fun g_l_context_set_debug_enabled = gdk_gl_context_set_debug_enabled(this : GLContext*, enabled : LibC::Int) : Void
  fun g_l_context_set_forward_compatible = gdk_gl_context_set_forward_compatible(this : GLContext*, compatible : LibC::Int) : Void
  fun g_l_context_set_required_version = gdk_gl_context_set_required_version(this : GLContext*, major : Int32, minor : Int32) : Void
  fun g_l_context_set_use_es = gdk_gl_context_set_use_es(this : GLContext*, use_es : Int32) : Void

  struct Keymap # object
    _data : UInt8[0]
    # Signal direction-changed
    # Signal keys-changed
    # Signal state-changed
  end

  fun _gdk_keymap_get_type = gdk_keymap_get_type : UInt64
  fun keymap_get_default = gdk_keymap_get_default : Pointer(LibGdk::Keymap)
  fun keymap_get_for_display = gdk_keymap_get_for_display(display : Pointer(LibGdk::Display)) : Pointer(LibGdk::Keymap)
  fun keymap_add_virtual_modifiers = gdk_keymap_add_virtual_modifiers(this : Keymap*, state : LibGdk::ModifierType*) : Void
  fun keymap_get_caps_lock_state = gdk_keymap_get_caps_lock_state(this : Keymap*) : LibC::Int
  fun keymap_get_direction = gdk_keymap_get_direction(this : Keymap*) : LibPango::Direction
  fun keymap_get_entries_for_keycode = gdk_keymap_get_entries_for_keycode(this : Keymap*, hardware_keycode : UInt32, keys : Pointer(LibGdk::KeymapKey)*, keyvals : Pointer(UInt32)*, n_entries : Int32*) : LibC::Int
  fun keymap_get_entries_for_keyval = gdk_keymap_get_entries_for_keyval(this : Keymap*, keyval : UInt32, keys : Pointer(LibGdk::KeymapKey)*, n_keys : Int32*) : LibC::Int
  fun keymap_get_modifier_mask = gdk_keymap_get_modifier_mask(this : Keymap*, intent : LibGdk::ModifierIntent) : LibGdk::ModifierType
  fun keymap_get_modifier_state = gdk_keymap_get_modifier_state(this : Keymap*) : UInt32
  fun keymap_get_num_lock_state = gdk_keymap_get_num_lock_state(this : Keymap*) : LibC::Int
  fun keymap_get_scroll_lock_state = gdk_keymap_get_scroll_lock_state(this : Keymap*) : LibC::Int
  fun keymap_have_bidi_layouts = gdk_keymap_have_bidi_layouts(this : Keymap*) : LibC::Int
  fun keymap_lookup_key = gdk_keymap_lookup_key(this : Keymap*, key : Pointer(LibGdk::KeymapKey)) : UInt32
  fun keymap_map_virtual_modifiers = gdk_keymap_map_virtual_modifiers(this : Keymap*, state : LibGdk::ModifierType*) : LibC::Int
  fun keymap_translate_keyboard_state = gdk_keymap_translate_keyboard_state(this : Keymap*, hardware_keycode : UInt32, state : LibGdk::ModifierType, group : Int32, keyval : UInt32*, effective_group : Int32*, level : Int32*, consumed_modifiers : LibGdk::ModifierType*) : LibC::Int

  struct Monitor # object
    _data : UInt8[0]
    # Signal invalidate
    # Property display : LibGdk::Display
    # Property geometry : LibGdk::Rectangle
    # Property height-mm : Int32
    # Property manufacturer : Pointer(UInt8)
    # Property model : Pointer(UInt8)
    # Property refresh-rate : Int32
    # Property scale-factor : Int32
    # Property subpixel-layout : LibGdk::SubpixelLayout
    # Property width-mm : Int32
    # Property workarea : LibGdk::Rectangle
  end

  fun _gdk_monitor_get_type = gdk_monitor_get_type : UInt64
  fun monitor_get_display = gdk_monitor_get_display(this : Monitor*) : Pointer(LibGdk::Display)
  fun monitor_get_geometry = gdk_monitor_get_geometry(this : Monitor*, geometry : LibGdk::Rectangle*) : Void
  fun monitor_get_height_mm = gdk_monitor_get_height_mm(this : Monitor*) : Int32
  fun monitor_get_manufacturer = gdk_monitor_get_manufacturer(this : Monitor*) : Pointer(UInt8)
  fun monitor_get_model = gdk_monitor_get_model(this : Monitor*) : Pointer(UInt8)
  fun monitor_get_refresh_rate = gdk_monitor_get_refresh_rate(this : Monitor*) : Int32
  fun monitor_get_scale_factor = gdk_monitor_get_scale_factor(this : Monitor*) : Int32
  fun monitor_get_subpixel_layout = gdk_monitor_get_subpixel_layout(this : Monitor*) : LibGdk::SubpixelLayout
  fun monitor_get_width_mm = gdk_monitor_get_width_mm(this : Monitor*) : Int32
  fun monitor_get_workarea = gdk_monitor_get_workarea(this : Monitor*, workarea : LibGdk::Rectangle*) : Void
  fun monitor_is_primary = gdk_monitor_is_primary(this : Monitor*) : LibC::Int

  struct Screen # object
    _data : UInt8[0]
    # Signal composited-changed
    # Signal monitors-changed
    # Signal size-changed
    # Property font-options : Pointer(Void)
    # Property resolution : Float64
  end

  fun _gdk_screen_get_type = gdk_screen_get_type : UInt64
  fun screen_get_default = gdk_screen_get_default : Pointer(LibGdk::Screen)
  fun screen_height = gdk_screen_height : Int32
  fun screen_height_mm = gdk_screen_height_mm : Int32
  fun screen_width = gdk_screen_width : Int32
  fun screen_width_mm = gdk_screen_width_mm : Int32
  fun screen_get_active_window = gdk_screen_get_active_window(this : Screen*) : Pointer(LibGdk::Window)
  fun screen_get_display = gdk_screen_get_display(this : Screen*) : Pointer(LibGdk::Display)
  fun screen_get_font_options = gdk_screen_get_font_options(this : Screen*) : Pointer(LibCairo::FontOptions)
  fun screen_get_height = gdk_screen_get_height(this : Screen*) : Int32
  fun screen_get_height_mm = gdk_screen_get_height_mm(this : Screen*) : Int32
  fun screen_get_monitor_at_point = gdk_screen_get_monitor_at_point(this : Screen*, x : Int32, y : Int32) : Int32
  fun screen_get_monitor_at_window = gdk_screen_get_monitor_at_window(this : Screen*, window : Pointer(LibGdk::Window)) : Int32
  fun screen_get_monitor_geometry = gdk_screen_get_monitor_geometry(this : Screen*, monitor_num : Int32, dest : LibGdk::Rectangle*) : Void
  fun screen_get_monitor_height_mm = gdk_screen_get_monitor_height_mm(this : Screen*, monitor_num : Int32) : Int32
  fun screen_get_monitor_plug_name = gdk_screen_get_monitor_plug_name(this : Screen*, monitor_num : Int32) : Pointer(UInt8)
  fun screen_get_monitor_scale_factor = gdk_screen_get_monitor_scale_factor(this : Screen*, monitor_num : Int32) : Int32
  fun screen_get_monitor_width_mm = gdk_screen_get_monitor_width_mm(this : Screen*, monitor_num : Int32) : Int32
  fun screen_get_monitor_workarea = gdk_screen_get_monitor_workarea(this : Screen*, monitor_num : Int32, dest : LibGdk::Rectangle*) : Void
  fun screen_get_n_monitors = gdk_screen_get_n_monitors(this : Screen*) : Int32
  fun screen_get_number = gdk_screen_get_number(this : Screen*) : Int32
  fun screen_get_primary_monitor = gdk_screen_get_primary_monitor(this : Screen*) : Int32
  fun screen_get_resolution = gdk_screen_get_resolution(this : Screen*) : Float64
  fun screen_get_rgba_visual = gdk_screen_get_rgba_visual(this : Screen*) : Pointer(LibGdk::Visual)
  fun screen_get_root_window = gdk_screen_get_root_window(this : Screen*) : Pointer(LibGdk::Window)
  fun screen_get_setting = gdk_screen_get_setting(this : Screen*, name : Pointer(UInt8), value : Pointer(LibGObject::Value)) : LibC::Int
  fun screen_get_system_visual = gdk_screen_get_system_visual(this : Screen*) : Pointer(LibGdk::Visual)
  fun screen_get_toplevel_windows = gdk_screen_get_toplevel_windows(this : Screen*) : Pointer(Void*)
  fun screen_get_width = gdk_screen_get_width(this : Screen*) : Int32
  fun screen_get_width_mm = gdk_screen_get_width_mm(this : Screen*) : Int32
  fun screen_get_window_stack = gdk_screen_get_window_stack(this : Screen*) : Pointer(Void*)
  fun screen_is_composited = gdk_screen_is_composited(this : Screen*) : LibC::Int
  fun screen_list_visuals = gdk_screen_list_visuals(this : Screen*) : Pointer(Void*)
  fun screen_make_display_name = gdk_screen_make_display_name(this : Screen*) : Pointer(UInt8)
  fun screen_set_font_options = gdk_screen_set_font_options(this : Screen*, options : Pointer(LibCairo::FontOptions)) : Void
  fun screen_set_resolution = gdk_screen_set_resolution(this : Screen*, dpi : Float64) : Void

  struct Seat # object
    parent_instance : LibGObject::Object
    # Signal device-added
    # Signal device-removed
    # Signal tool-added
    # Signal tool-removed
    # Property display : LibGdk::Display
  end

  fun _gdk_seat_get_type = gdk_seat_get_type : UInt64
  fun seat_get_capabilities = gdk_seat_get_capabilities(this : Seat*) : LibGdk::SeatCapabilities
  fun seat_get_display = gdk_seat_get_display(this : Seat*) : Pointer(LibGdk::Display)
  fun seat_get_keyboard = gdk_seat_get_keyboard(this : Seat*) : Pointer(LibGdk::Device)
  fun seat_get_pointer = gdk_seat_get_pointer(this : Seat*) : Pointer(LibGdk::Device)
  fun seat_get_slaves = gdk_seat_get_slaves(this : Seat*, capabilities : LibGdk::SeatCapabilities) : Pointer(Void*)
  fun seat_grab = gdk_seat_grab(this : Seat*, window : Pointer(LibGdk::Window), capabilities : LibGdk::SeatCapabilities, owner_events : LibC::Int, cursor : Pointer(LibGdk::Cursor), event : Pointer(LibGdk::Event), prepare_func : LibGdk::SeatGrabPrepareFunc, prepare_func_data : Pointer(Void)) : LibGdk::GrabStatus
  fun seat_ungrab = gdk_seat_ungrab(this : Seat*) : Void

  struct Visual # object
    _data : UInt8[0]
  end

  fun _gdk_visual_get_type = gdk_visual_get_type : UInt64
  fun visual_get_best = gdk_visual_get_best : Pointer(LibGdk::Visual)
  fun visual_get_best_depth = gdk_visual_get_best_depth : Int32
  fun visual_get_best_type = gdk_visual_get_best_type : LibGdk::VisualType
  fun visual_get_best_with_both = gdk_visual_get_best_with_both(depth : Int32, visual_type : LibGdk::VisualType) : Pointer(LibGdk::Visual)
  fun visual_get_best_with_depth = gdk_visual_get_best_with_depth(depth : Int32) : Pointer(LibGdk::Visual)
  fun visual_get_best_with_type = gdk_visual_get_best_with_type(visual_type : LibGdk::VisualType) : Pointer(LibGdk::Visual)
  fun visual_get_system = gdk_visual_get_system : Pointer(LibGdk::Visual)
  fun visual_get_bits_per_rgb = gdk_visual_get_bits_per_rgb(this : Visual*) : Int32
  fun visual_get_blue_pixel_details = gdk_visual_get_blue_pixel_details(this : Visual*, mask : UInt32*, shift : Int32*, precision : Int32*) : Void
  fun visual_get_byte_order = gdk_visual_get_byte_order(this : Visual*) : LibGdk::ByteOrder
  fun visual_get_colormap_size = gdk_visual_get_colormap_size(this : Visual*) : Int32
  fun visual_get_depth = gdk_visual_get_depth(this : Visual*) : Int32
  fun visual_get_green_pixel_details = gdk_visual_get_green_pixel_details(this : Visual*, mask : UInt32*, shift : Int32*, precision : Int32*) : Void
  fun visual_get_red_pixel_details = gdk_visual_get_red_pixel_details(this : Visual*, mask : UInt32*, shift : Int32*, precision : Int32*) : Void
  fun visual_get_screen = gdk_visual_get_screen(this : Visual*) : Pointer(LibGdk::Screen)
  fun visual_get_visual_type = gdk_visual_get_visual_type(this : Visual*) : LibGdk::VisualType

  struct Window # object
    _data : UInt8[0]
    # Signal create-surface
    # Signal from-embedder
    # Signal moved-to-rect
    # Signal pick-embedded-child
    # Signal to-embedder
    # Virtual function create_surface
    # Virtual function from_embedder
    # Virtual function to_embedder
    # Property cursor : LibGdk::Cursor
  end

  fun _gdk_window_get_type = gdk_window_get_type : UInt64
  fun window_new = gdk_window_new(parent : Pointer(LibGdk::Window), attributes : Pointer(LibGdk::WindowAttr), attributes_mask : LibGdk::WindowAttributesType) : Pointer(LibGdk::Window)
  fun window_at_pointer = gdk_window_at_pointer(win_x : Int32*, win_y : Int32*) : Pointer(LibGdk::Window)
  fun window_constrain_size = gdk_window_constrain_size(geometry : Pointer(LibGdk::Geometry), flags : LibGdk::WindowHints, width : Int32, height : Int32, new_width : Int32*, new_height : Int32*) : Void
  fun window_process_all_updates = gdk_window_process_all_updates : Void
  fun window_set_debug_updates = gdk_window_set_debug_updates(setting : LibC::Int) : Void
  fun window_beep = gdk_window_beep(this : Window*) : Void
  fun window_begin_draw_frame = gdk_window_begin_draw_frame(this : Window*, region : Pointer(LibCairo::Region)) : Pointer(LibGdk::DrawingContext)
  fun window_begin_move_drag = gdk_window_begin_move_drag(this : Window*, button : Int32, root_x : Int32, root_y : Int32, timestamp : UInt32) : Void
  fun window_begin_move_drag_for_device = gdk_window_begin_move_drag_for_device(this : Window*, device : Pointer(LibGdk::Device), button : Int32, root_x : Int32, root_y : Int32, timestamp : UInt32) : Void
  fun window_begin_paint_rect = gdk_window_begin_paint_rect(this : Window*, rectangle : Pointer(LibGdk::Rectangle)) : Void
  fun window_begin_paint_region = gdk_window_begin_paint_region(this : Window*, region : Pointer(LibCairo::Region)) : Void
  fun window_begin_resize_drag = gdk_window_begin_resize_drag(this : Window*, edge : LibGdk::WindowEdge, button : Int32, root_x : Int32, root_y : Int32, timestamp : UInt32) : Void
  fun window_begin_resize_drag_for_device = gdk_window_begin_resize_drag_for_device(this : Window*, edge : LibGdk::WindowEdge, device : Pointer(LibGdk::Device), button : Int32, root_x : Int32, root_y : Int32, timestamp : UInt32) : Void
  fun window_configure_finished = gdk_window_configure_finished(this : Window*) : Void
  fun window_coords_from_parent = gdk_window_coords_from_parent(this : Window*, parent_x : Float64, parent_y : Float64, x : Float64*, y : Float64*) : Void
  fun window_coords_to_parent = gdk_window_coords_to_parent(this : Window*, x : Float64, y : Float64, parent_x : Float64*, parent_y : Float64*) : Void
  fun window_create_gl_context = gdk_window_create_gl_context(this : Window*, error : LibGLib::Error**) : Pointer(LibGdk::GLContext)
  fun window_create_similar_image_surface = gdk_window_create_similar_image_surface(this : Window*, format : Int32, width : Int32, height : Int32, scale : Int32) : Pointer(LibCairo::Surface)
  fun window_create_similar_surface = gdk_window_create_similar_surface(this : Window*, content : LibCairo::Content, width : Int32, height : Int32) : Pointer(LibCairo::Surface)
  fun window_deiconify = gdk_window_deiconify(this : Window*) : Void
  fun window_destroy = gdk_window_destroy(this : Window*) : Void
  fun window_destroy_notify = gdk_window_destroy_notify(this : Window*) : Void
  fun window_enable_synchronized_configure = gdk_window_enable_synchronized_configure(this : Window*) : Void
  fun window_end_draw_frame = gdk_window_end_draw_frame(this : Window*, context : Pointer(LibGdk::DrawingContext)) : Void
  fun window_end_paint = gdk_window_end_paint(this : Window*) : Void
  fun window_ensure_native = gdk_window_ensure_native(this : Window*) : LibC::Int
  fun window_flush = gdk_window_flush(this : Window*) : Void
  fun window_focus = gdk_window_focus(this : Window*, timestamp : UInt32) : Void
  fun window_freeze_toplevel_updates_libgtk_only = gdk_window_freeze_toplevel_updates_libgtk_only(this : Window*) : Void
  fun window_freeze_updates = gdk_window_freeze_updates(this : Window*) : Void
  fun window_fullscreen = gdk_window_fullscreen(this : Window*) : Void
  fun window_fullscreen_on_monitor = gdk_window_fullscreen_on_monitor(this : Window*, monitor : Int32) : Void
  fun window_geometry_changed = gdk_window_geometry_changed(this : Window*) : Void
  fun window_get_accept_focus = gdk_window_get_accept_focus(this : Window*) : LibC::Int
  fun window_get_background_pattern = gdk_window_get_background_pattern(this : Window*) : Pointer(LibCairo::Pattern)
  fun window_get_children = gdk_window_get_children(this : Window*) : Pointer(Void*)
  fun window_get_children_with_user_data = gdk_window_get_children_with_user_data(this : Window*, user_data : Pointer(Void)) : Pointer(Void*)
  fun window_get_clip_region = gdk_window_get_clip_region(this : Window*) : Pointer(LibCairo::Region)
  fun window_get_composited = gdk_window_get_composited(this : Window*) : LibC::Int
  fun window_get_cursor = gdk_window_get_cursor(this : Window*) : Pointer(LibGdk::Cursor)
  fun window_get_decorations = gdk_window_get_decorations(this : Window*, decorations : LibGdk::WMDecoration*) : LibC::Int
  fun window_get_device_cursor = gdk_window_get_device_cursor(this : Window*, device : Pointer(LibGdk::Device)) : Pointer(LibGdk::Cursor)
  fun window_get_device_events = gdk_window_get_device_events(this : Window*, device : Pointer(LibGdk::Device)) : LibGdk::EventMask
  fun window_get_device_position = gdk_window_get_device_position(this : Window*, device : Pointer(LibGdk::Device), x : Int32*, y : Int32*, mask : LibGdk::ModifierType*) : Pointer(LibGdk::Window)
  fun window_get_device_position_double = gdk_window_get_device_position_double(this : Window*, device : Pointer(LibGdk::Device), x : Float64*, y : Float64*, mask : LibGdk::ModifierType*) : Pointer(LibGdk::Window)
  fun window_get_display = gdk_window_get_display(this : Window*) : Pointer(LibGdk::Display)
  fun window_get_drag_protocol = gdk_window_get_drag_protocol(this : Window*, target : Pointer(LibGdk::Window)*) : LibGdk::DragProtocol
  fun window_get_effective_parent = gdk_window_get_effective_parent(this : Window*) : Pointer(LibGdk::Window)
  fun window_get_effective_toplevel = gdk_window_get_effective_toplevel(this : Window*) : Pointer(LibGdk::Window)
  fun window_get_event_compression = gdk_window_get_event_compression(this : Window*) : LibC::Int
  fun window_get_events = gdk_window_get_events(this : Window*) : LibGdk::EventMask
  fun window_get_focus_on_map = gdk_window_get_focus_on_map(this : Window*) : LibC::Int
  fun window_get_frame_clock = gdk_window_get_frame_clock(this : Window*) : Pointer(LibGdk::FrameClock)
  fun window_get_frame_extents = gdk_window_get_frame_extents(this : Window*, rect : LibGdk::Rectangle*) : Void
  fun window_get_fullscreen_mode = gdk_window_get_fullscreen_mode(this : Window*) : LibGdk::FullscreenMode
  fun window_get_geometry = gdk_window_get_geometry(this : Window*, x : Int32*, y : Int32*, width : Int32*, height : Int32*) : Void
  fun window_get_group = gdk_window_get_group(this : Window*) : Pointer(LibGdk::Window)
  fun window_get_height = gdk_window_get_height(this : Window*) : Int32
  fun window_get_modal_hint = gdk_window_get_modal_hint(this : Window*) : LibC::Int
  fun window_get_origin = gdk_window_get_origin(this : Window*, x : Int32*, y : Int32*) : Int32
  fun window_get_parent = gdk_window_get_parent(this : Window*) : Pointer(LibGdk::Window)
  fun window_get_pass_through = gdk_window_get_pass_through(this : Window*) : LibC::Int
  fun window_get_pointer = gdk_window_get_pointer(this : Window*, x : Int32*, y : Int32*, mask : LibGdk::ModifierType*) : Pointer(LibGdk::Window)
  fun window_get_position = gdk_window_get_position(this : Window*, x : Int32*, y : Int32*) : Void
  fun window_get_root_coords = gdk_window_get_root_coords(this : Window*, x : Int32, y : Int32, root_x : Int32*, root_y : Int32*) : Void
  fun window_get_root_origin = gdk_window_get_root_origin(this : Window*, x : Int32*, y : Int32*) : Void
  fun window_get_scale_factor = gdk_window_get_scale_factor(this : Window*) : Int32
  fun window_get_screen = gdk_window_get_screen(this : Window*) : Pointer(LibGdk::Screen)
  fun window_get_source_events = gdk_window_get_source_events(this : Window*, source : LibGdk::InputSource) : LibGdk::EventMask
  fun window_get_state = gdk_window_get_state(this : Window*) : LibGdk::WindowState
  fun window_get_support_multidevice = gdk_window_get_support_multidevice(this : Window*) : LibC::Int
  fun window_get_toplevel = gdk_window_get_toplevel(this : Window*) : Pointer(LibGdk::Window)
  fun window_get_type_hint = gdk_window_get_type_hint(this : Window*) : LibGdk::WindowTypeHint
  fun window_get_update_area = gdk_window_get_update_area(this : Window*) : Pointer(LibCairo::Region)
  fun window_get_user_data = gdk_window_get_user_data(this : Window*, data : Pointer(Void)*) : Void
  fun window_get_visible_region = gdk_window_get_visible_region(this : Window*) : Pointer(LibCairo::Region)
  fun window_get_visual = gdk_window_get_visual(this : Window*) : Pointer(LibGdk::Visual)
  fun window_get_width = gdk_window_get_width(this : Window*) : Int32
  fun window_get_window_type = gdk_window_get_window_type(this : Window*) : LibGdk::WindowType
  fun window_has_native = gdk_window_has_native(this : Window*) : LibC::Int
  fun window_hide = gdk_window_hide(this : Window*) : Void
  fun window_iconify = gdk_window_iconify(this : Window*) : Void
  fun window_input_shape_combine_region = gdk_window_input_shape_combine_region(this : Window*, shape_region : Pointer(LibCairo::Region), offset_x : Int32, offset_y : Int32) : Void
  fun window_invalidate_maybe_recurse = gdk_window_invalidate_maybe_recurse(this : Window*, region : Pointer(LibCairo::Region), child_func : LibGdk::WindowChildFunc, user_data : Pointer(Void)) : Void
  fun window_invalidate_rect = gdk_window_invalidate_rect(this : Window*, rect : Pointer(LibGdk::Rectangle), invalidate_children : LibC::Int) : Void
  fun window_invalidate_region = gdk_window_invalidate_region(this : Window*, region : Pointer(LibCairo::Region), invalidate_children : LibC::Int) : Void
  fun window_is_destroyed = gdk_window_is_destroyed(this : Window*) : LibC::Int
  fun window_is_input_only = gdk_window_is_input_only(this : Window*) : LibC::Int
  fun window_is_shaped = gdk_window_is_shaped(this : Window*) : LibC::Int
  fun window_is_viewable = gdk_window_is_viewable(this : Window*) : LibC::Int
  fun window_is_visible = gdk_window_is_visible(this : Window*) : LibC::Int
  fun window_lower = gdk_window_lower(this : Window*) : Void
  fun window_mark_paint_from_clip = gdk_window_mark_paint_from_clip(this : Window*, cr : Pointer(LibCairo::Context)) : Void
  fun window_maximize = gdk_window_maximize(this : Window*) : Void
  fun window_merge_child_input_shapes = gdk_window_merge_child_input_shapes(this : Window*) : Void
  fun window_merge_child_shapes = gdk_window_merge_child_shapes(this : Window*) : Void
  fun window_move = gdk_window_move(this : Window*, x : Int32, y : Int32) : Void
  fun window_move_region = gdk_window_move_region(this : Window*, region : Pointer(LibCairo::Region), dx : Int32, dy : Int32) : Void
  fun window_move_resize = gdk_window_move_resize(this : Window*, x : Int32, y : Int32, width : Int32, height : Int32) : Void
  fun window_move_to_rect = gdk_window_move_to_rect(this : Window*, rect : Pointer(LibGdk::Rectangle), rect_anchor : LibGdk::Gravity, window_anchor : LibGdk::Gravity, anchor_hints : LibGdk::AnchorHints, rect_anchor_dx : Int32, rect_anchor_dy : Int32) : Void
  fun window_peek_children = gdk_window_peek_children(this : Window*) : Pointer(Void*)
  fun window_process_updates = gdk_window_process_updates(this : Window*, update_children : LibC::Int) : Void
  fun window_raise = gdk_window_raise(this : Window*) : Void
  fun window_register_dnd = gdk_window_register_dnd(this : Window*) : Void
  fun window_reparent = gdk_window_reparent(this : Window*, new_parent : Pointer(LibGdk::Window), x : Int32, y : Int32) : Void
  fun window_resize = gdk_window_resize(this : Window*, width : Int32, height : Int32) : Void
  fun window_restack = gdk_window_restack(this : Window*, sibling : Pointer(LibGdk::Window), above : LibC::Int) : Void
  fun window_scroll = gdk_window_scroll(this : Window*, dx : Int32, dy : Int32) : Void
  fun window_set_accept_focus = gdk_window_set_accept_focus(this : Window*, accept_focus : LibC::Int) : Void
  fun window_set_background = gdk_window_set_background(this : Window*, color : Pointer(LibGdk::Color)) : Void
  fun window_set_background_pattern = gdk_window_set_background_pattern(this : Window*, pattern : Pointer(LibCairo::Pattern)) : Void
  fun window_set_background_rgba = gdk_window_set_background_rgba(this : Window*, rgba : Pointer(LibGdk::RGBA)) : Void
  fun window_set_child_input_shapes = gdk_window_set_child_input_shapes(this : Window*) : Void
  fun window_set_child_shapes = gdk_window_set_child_shapes(this : Window*) : Void
  fun window_set_composited = gdk_window_set_composited(this : Window*, composited : LibC::Int) : Void
  fun window_set_cursor = gdk_window_set_cursor(this : Window*, cursor : Pointer(LibGdk::Cursor)) : Void
  fun window_set_decorations = gdk_window_set_decorations(this : Window*, decorations : LibGdk::WMDecoration) : Void
  fun window_set_device_cursor = gdk_window_set_device_cursor(this : Window*, device : Pointer(LibGdk::Device), cursor : Pointer(LibGdk::Cursor)) : Void
  fun window_set_device_events = gdk_window_set_device_events(this : Window*, device : Pointer(LibGdk::Device), event_mask : LibGdk::EventMask) : Void
  fun window_set_event_compression = gdk_window_set_event_compression(this : Window*, event_compression : LibC::Int) : Void
  fun window_set_events = gdk_window_set_events(this : Window*, event_mask : LibGdk::EventMask) : Void
  fun window_set_focus_on_map = gdk_window_set_focus_on_map(this : Window*, focus_on_map : LibC::Int) : Void
  fun window_set_fullscreen_mode = gdk_window_set_fullscreen_mode(this : Window*, mode : LibGdk::FullscreenMode) : Void
  fun window_set_functions = gdk_window_set_functions(this : Window*, functions : LibGdk::WMFunction) : Void
  fun window_set_geometry_hints = gdk_window_set_geometry_hints(this : Window*, geometry : Pointer(LibGdk::Geometry), geom_mask : LibGdk::WindowHints) : Void
  fun window_set_group = gdk_window_set_group(this : Window*, leader : Pointer(LibGdk::Window)) : Void
  fun window_set_icon_list = gdk_window_set_icon_list(this : Window*, pixbufs : Pointer(Void*)) : Void
  fun window_set_icon_name = gdk_window_set_icon_name(this : Window*, name : Pointer(UInt8)) : Void
  fun window_set_keep_above = gdk_window_set_keep_above(this : Window*, setting : LibC::Int) : Void
  fun window_set_keep_below = gdk_window_set_keep_below(this : Window*, setting : LibC::Int) : Void
  fun window_set_modal_hint = gdk_window_set_modal_hint(this : Window*, modal : LibC::Int) : Void
  fun window_set_opacity = gdk_window_set_opacity(this : Window*, opacity : Float64) : Void
  fun window_set_opaque_region = gdk_window_set_opaque_region(this : Window*, region : Pointer(LibCairo::Region)) : Void
  fun window_set_override_redirect = gdk_window_set_override_redirect(this : Window*, override_redirect : LibC::Int) : Void
  fun window_set_pass_through = gdk_window_set_pass_through(this : Window*, pass_through : LibC::Int) : Void
  fun window_set_role = gdk_window_set_role(this : Window*, role : Pointer(UInt8)) : Void
  fun window_set_shadow_width = gdk_window_set_shadow_width(this : Window*, left : Int32, right : Int32, top : Int32, bottom : Int32) : Void
  fun window_set_skip_pager_hint = gdk_window_set_skip_pager_hint(this : Window*, skips_pager : LibC::Int) : Void
  fun window_set_skip_taskbar_hint = gdk_window_set_skip_taskbar_hint(this : Window*, skips_taskbar : LibC::Int) : Void
  fun window_set_source_events = gdk_window_set_source_events(this : Window*, source : LibGdk::InputSource, event_mask : LibGdk::EventMask) : Void
  fun window_set_startup_id = gdk_window_set_startup_id(this : Window*, startup_id : Pointer(UInt8)) : Void
  fun window_set_static_gravities = gdk_window_set_static_gravities(this : Window*, use_static : LibC::Int) : LibC::Int
  fun window_set_support_multidevice = gdk_window_set_support_multidevice(this : Window*, support_multidevice : LibC::Int) : Void
  fun window_set_title = gdk_window_set_title(this : Window*, title : Pointer(UInt8)) : Void
  fun window_set_transient_for = gdk_window_set_transient_for(this : Window*, parent : Pointer(LibGdk::Window)) : Void
  fun window_set_type_hint = gdk_window_set_type_hint(this : Window*, hint : LibGdk::WindowTypeHint) : Void
  fun window_set_urgency_hint = gdk_window_set_urgency_hint(this : Window*, urgent : LibC::Int) : Void
  fun window_set_user_data = gdk_window_set_user_data(this : Window*, user_data : Pointer(LibGObject::Object)) : Void
  fun window_shape_combine_region = gdk_window_shape_combine_region(this : Window*, shape_region : Pointer(LibCairo::Region), offset_x : Int32, offset_y : Int32) : Void
  fun window_show = gdk_window_show(this : Window*) : Void
  fun window_show_unraised = gdk_window_show_unraised(this : Window*) : Void
  fun window_show_window_menu = gdk_window_show_window_menu(this : Window*, event : Pointer(LibGdk::Event)) : LibC::Int
  fun window_stick = gdk_window_stick(this : Window*) : Void
  fun window_thaw_toplevel_updates_libgtk_only = gdk_window_thaw_toplevel_updates_libgtk_only(this : Window*) : Void
  fun window_thaw_updates = gdk_window_thaw_updates(this : Window*) : Void
  fun window_unfullscreen = gdk_window_unfullscreen(this : Window*) : Void
  fun window_unmaximize = gdk_window_unmaximize(this : Window*) : Void
  fun window_unstick = gdk_window_unstick(this : Window*) : Void
  fun window_withdraw = gdk_window_withdraw(this : Window*) : Void

  ###########################################
  # #    Structs
  ###########################################

  struct Atom # struct
    _data : UInt8[0]
  end

  fun atom_name = gdk_atom_name(this : Atom*) : Pointer(UInt8)
  fun atom_intern = gdk_atom_intern(atom_name : Pointer(UInt8), only_if_exists : LibC::Int) : Pointer(LibGdk::Atom)
  fun atom_intern_static_string = gdk_atom_intern_static_string(atom_name : Pointer(UInt8)) : Pointer(LibGdk::Atom)

  struct Color # struct
    pixel : UInt32
    red : UInt16
    green : UInt16
    blue : UInt16
  end

  fun _gdk_color_get_type = gdk_color_get_type : UInt64
  fun color_copy = gdk_color_copy(this : Color*) : Pointer(LibGdk::Color)
  fun color_equal = gdk_color_equal(this : Color*, colorb : Pointer(LibGdk::Color)) : LibC::Int
  fun color_free = gdk_color_free(this : Color*) : Void
  fun color_hash = gdk_color_hash(this : Color*) : UInt32
  fun color_to_string = gdk_color_to_string(this : Color*) : Pointer(UInt8)
  fun color_parse = gdk_color_parse(spec : Pointer(UInt8), color : LibGdk::Color*) : LibC::Int

  struct DevicePadInterface # struct
    _data : UInt8[0]
  end

  struct DrawingContextClass # struct
    _data : UInt8[0]
  end

  struct EventAny # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
  end

  struct EventButton # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    time : UInt32
    x : Float64
    y : Float64
    axes : Pointer(Float64)
    state : LibGdk::ModifierType
    button : UInt32
    device : Pointer(LibGdk::Device)
    x_root : Float64
    y_root : Float64
  end

  struct EventConfigure # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    x : Int32
    y : Int32
    width : Int32
    height : Int32
  end

  struct EventCrossing # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    subwindow : Pointer(LibGdk::Window)
    time : UInt32
    x : Float64
    y : Float64
    x_root : Float64
    y_root : Float64
    mode : LibGdk::CrossingMode
    detail : LibGdk::NotifyType
    focus : LibC::Int
    state : LibGdk::ModifierType
  end

  struct EventDND # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    context : Pointer(LibGdk::DragContext)
    time : UInt32
    x_root : Int16
    y_root : Int16
  end

  struct EventExpose # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    area : LibGdk::Rectangle
    region : Pointer(LibCairo::Region)
    count : Int32
  end

  struct EventFocus # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    _in : Int16
  end

  struct EventGrabBroken # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    keyboard : LibC::Int
    implicit : LibC::Int
    grab_window : Pointer(LibGdk::Window)
  end

  struct EventKey # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    time : UInt32
    state : LibGdk::ModifierType
    keyval : UInt32
    length : Int32
    string : Pointer(UInt8)
    hardware_keycode : UInt16
    group : UInt8
    is_modifier : UInt32
  end

  struct EventMotion # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    time : UInt32
    x : Float64
    y : Float64
    axes : Pointer(Float64)
    state : LibGdk::ModifierType
    is_hint : Int16
    device : Pointer(LibGdk::Device)
    x_root : Float64
    y_root : Float64
  end

  struct EventOwnerChange # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    owner : Pointer(LibGdk::Window)
    reason : LibGdk::OwnerChange
    selection : Pointer(LibGdk::Atom)
    time : UInt32
    selection_time : UInt32
  end

  struct EventPadAxis # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    time : UInt32
    group : UInt32
    index : UInt32
    mode : UInt32
    value : Float64
  end

  struct EventPadButton # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    time : UInt32
    group : UInt32
    button : UInt32
    mode : UInt32
  end

  struct EventPadGroupMode # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    time : UInt32
    group : UInt32
    mode : UInt32
  end

  struct EventProperty # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    atom : Pointer(LibGdk::Atom)
    time : UInt32
    state : LibGdk::PropertyState
  end

  struct EventProximity # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    time : UInt32
    device : Pointer(LibGdk::Device)
  end

  struct EventScroll # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    time : UInt32
    x : Float64
    y : Float64
    state : LibGdk::ModifierType
    direction : LibGdk::ScrollDirection
    device : Pointer(LibGdk::Device)
    x_root : Float64
    y_root : Float64
    delta_x : Float64
    delta_y : Float64
    is_stop : UInt32
  end

  struct EventSelection # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    selection : Pointer(LibGdk::Atom)
    target : Pointer(LibGdk::Atom)
    property : Pointer(LibGdk::Atom)
    time : UInt32
    requestor : Pointer(LibGdk::Window)
  end

  struct EventSequence # struct
    _data : UInt8[0]
  end

  fun _gdk_event_sequence_get_type = gdk_event_sequence_get_type : UInt64

  struct EventSetting # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    action : LibGdk::SettingAction
    name : Pointer(UInt8)
  end

  struct EventTouch # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    time : UInt32
    x : Float64
    y : Float64
    axes : Pointer(Float64)
    state : LibGdk::ModifierType
    sequence : Pointer(LibGdk::EventSequence)
    emulating_pointer : LibC::Int
    device : Pointer(LibGdk::Device)
    x_root : Float64
    y_root : Float64
  end

  struct EventTouchpadPinch # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    phase : Int8
    n_fingers : Int8
    time : UInt32
    x : Float64
    y : Float64
    dx : Float64
    dy : Float64
    angle_delta : Float64
    scale : Float64
    x_root : Float64
    y_root : Float64
    state : LibGdk::ModifierType
  end

  struct EventTouchpadSwipe # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    phase : Int8
    n_fingers : Int8
    time : UInt32
    x : Float64
    y : Float64
    dx : Float64
    dy : Float64
    x_root : Float64
    y_root : Float64
    state : LibGdk::ModifierType
  end

  struct EventVisibility # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    state : LibGdk::VisibilityState
  end

  struct EventWindowState # struct
    type : LibGdk::EventType
    window : Pointer(LibGdk::Window)
    send_event : Int8
    changed_mask : LibGdk::WindowState
    new_window_state : LibGdk::WindowState
  end

  struct FrameClockClass # struct
    _data : UInt8[0]
  end

  struct FrameClockPrivate # struct
    _data : UInt8[0]
  end

  struct FrameTimings # struct
    _data : UInt8[0]
  end

  fun _gdk_frame_timings_get_type = gdk_frame_timings_get_type : UInt64
  fun frame_timings_get_complete = gdk_frame_timings_get_complete(this : FrameTimings*) : LibC::Int
  fun frame_timings_get_frame_counter = gdk_frame_timings_get_frame_counter(this : FrameTimings*) : Int64
  fun frame_timings_get_frame_time = gdk_frame_timings_get_frame_time(this : FrameTimings*) : Int64
  fun frame_timings_get_predicted_presentation_time = gdk_frame_timings_get_predicted_presentation_time(this : FrameTimings*) : Int64
  fun frame_timings_get_presentation_time = gdk_frame_timings_get_presentation_time(this : FrameTimings*) : Int64
  fun frame_timings_get_refresh_interval = gdk_frame_timings_get_refresh_interval(this : FrameTimings*) : Int64
  fun frame_timings_ref = gdk_frame_timings_ref(this : FrameTimings*) : Pointer(LibGdk::FrameTimings)
  fun frame_timings_unref = gdk_frame_timings_unref(this : FrameTimings*) : Void

  struct Geometry # struct
    min_width : Int32
    min_height : Int32
    max_width : Int32
    max_height : Int32
    base_width : Int32
    base_height : Int32
    width_inc : Int32
    height_inc : Int32
    min_aspect : Float64
    max_aspect : Float64
    win_gravity : LibGdk::Gravity
  end

  struct KeymapKey # struct
    keycode : UInt32
    group : Int32
    level : Int32
  end

  struct MonitorClass # struct
    _data : UInt8[0]
  end

  struct Point # struct
    x : Int32
    y : Int32
  end

  struct RGBA # struct
    red : Float64
    green : Float64
    blue : Float64
    alpha : Float64
  end

  fun _gdk_rgba_get_type = gdk_rgba_get_type : UInt64
  fun r_g_b_a_copy = gdk_rgba_copy(this : RGBA*) : Pointer(LibGdk::RGBA)
  fun r_g_b_a_equal = gdk_rgba_equal(this : RGBA*, p2 : Pointer(LibGdk::RGBA)) : LibC::Int
  fun r_g_b_a_free = gdk_rgba_free(this : RGBA*) : Void
  fun r_g_b_a_hash = gdk_rgba_hash(this : RGBA*) : UInt32
  fun r_g_b_a_parse = gdk_rgba_parse(this : RGBA*, spec : Pointer(UInt8)) : LibC::Int
  fun r_g_b_a_to_string = gdk_rgba_to_string(this : RGBA*) : Pointer(UInt8)

  struct Rectangle # struct
    x : Int32
    y : Int32
    width : Int32
    height : Int32
  end

  fun _gdk_rectangle_get_type = gdk_rectangle_get_type : UInt64
  fun rectangle_equal = gdk_rectangle_equal(this : Rectangle*, rect2 : Pointer(LibGdk::Rectangle)) : LibC::Int
  fun rectangle_intersect = gdk_rectangle_intersect(this : Rectangle*, src2 : Pointer(LibGdk::Rectangle), dest : LibGdk::Rectangle*) : LibC::Int
  fun rectangle_union = gdk_rectangle_union(this : Rectangle*, src2 : Pointer(LibGdk::Rectangle), dest : LibGdk::Rectangle*) : Void

  struct TimeCoord # struct
    time : UInt32
    axes : Float64[128]
  end

  struct WindowAttr # struct
    title : Pointer(UInt8)
    event_mask : Int32
    x : Int32
    y : Int32
    width : Int32
    height : Int32
    wclass : LibGdk::WindowWindowClass
    visual : Pointer(LibGdk::Visual)
    window_type : LibGdk::WindowType
    cursor : Pointer(LibGdk::Cursor)
    wmclass_name : Pointer(UInt8)
    wmclass_class : Pointer(UInt8)
    override_redirect : LibC::Int
    type_hint : LibGdk::WindowTypeHint
  end

  struct WindowClass # struct
    parent_class : LibGObject::ObjectClass
    pick_embedded_child : Pointer(Void)
    to_embedder : Pointer(LibGdk::Window), Float64, Float64, Pointer(Float64), Pointer(Float64) -> Void
    from_embedder : Pointer(LibGdk::Window), Float64, Float64, Pointer(Float64), Pointer(Float64) -> Void
    create_surface : Pointer(LibGdk::Window), Int32, Int32 -> Pointer(LibCairo::Surface)
    _gdk_reserved1 : Pointer(Void)
    _gdk_reserved2 : Pointer(Void)
    _gdk_reserved3 : Pointer(Void)
    _gdk_reserved4 : Pointer(Void)
    _gdk_reserved5 : Pointer(Void)
    _gdk_reserved6 : Pointer(Void)
    _gdk_reserved7 : Pointer(Void)
    _gdk_reserved8 : Pointer(Void)
  end

  struct WindowRedirect # struct
    _data : UInt8[0]
  end

  ###########################################
  # #    Enums
  ###########################################

  alias AxisUse = UInt32

  alias ByteOrder = UInt32

  alias CrossingMode = UInt32

  alias CursorType = Int32

  alias DevicePadFeature = UInt32

  alias DeviceToolType = UInt32

  alias DeviceType = UInt32

  alias DragCancelReason = UInt32

  alias DragProtocol = UInt32

  alias EventType = Int32

  alias FilterReturn = UInt32

  alias FullscreenMode = UInt32

  alias GLError = UInt32
  fun g_l_error_quark = gdk_gl_error_quark : UInt32

  alias GrabOwnership = UInt32

  alias GrabStatus = UInt32

  alias Gravity = UInt32

  alias InputMode = UInt32

  alias InputSource = UInt32

  alias ModifierIntent = UInt32

  alias NotifyType = UInt32

  alias OwnerChange = UInt32

  alias PropMode = UInt32

  alias PropertyState = UInt32

  alias ScrollDirection = UInt32

  alias SettingAction = UInt32

  alias Status = Int32

  alias SubpixelLayout = UInt32

  alias TouchpadGesturePhase = UInt32

  alias VisibilityState = UInt32

  alias VisualType = UInt32

  alias WindowEdge = UInt32

  alias WindowType = UInt32

  alias WindowTypeHint = UInt32

  alias WindowWindowClass = UInt32

  ###########################################
  # #    Constants
  ###########################################
  BUTTON_MIDDLE                   =         2 # : Int32
  BUTTON_PRIMARY                  =         1 # : Int32
  BUTTON_SECONDARY                =         3 # : Int32
  CURRENT_TIME                    =         0 # : Int32
  EVENT_PROPAGATE                 =         0 # : LibC::Int
  EVENT_STOP                      =         1 # : LibC::Int
  KEY_0                           =        48 # : Int32
  KEY_1                           =        49 # : Int32
  KEY_2                           =        50 # : Int32
  KEY_3                           =        51 # : Int32
  KEY_3270_AltCursor              =     64784 # : Int32
  KEY_3270_Attn                   =     64782 # : Int32
  KEY_3270_BackTab                =     64773 # : Int32
  KEY_3270_ChangeScreen           =     64793 # : Int32
  KEY_3270_Copy                   =     64789 # : Int32
  KEY_3270_CursorBlink            =     64783 # : Int32
  KEY_3270_CursorSelect           =     64796 # : Int32
  KEY_3270_DeleteWord             =     64794 # : Int32
  KEY_3270_Duplicate              =     64769 # : Int32
  KEY_3270_Enter                  =     64798 # : Int32
  KEY_3270_EraseEOF               =     64774 # : Int32
  KEY_3270_EraseInput             =     64775 # : Int32
  KEY_3270_ExSelect               =     64795 # : Int32
  KEY_3270_FieldMark              =     64770 # : Int32
  KEY_3270_Ident                  =     64787 # : Int32
  KEY_3270_Jump                   =     64786 # : Int32
  KEY_3270_KeyClick               =     64785 # : Int32
  KEY_3270_Left2                  =     64772 # : Int32
  KEY_3270_PA1                    =     64778 # : Int32
  KEY_3270_PA2                    =     64779 # : Int32
  KEY_3270_PA3                    =     64780 # : Int32
  KEY_3270_Play                   =     64790 # : Int32
  KEY_3270_PrintScreen            =     64797 # : Int32
  KEY_3270_Quit                   =     64777 # : Int32
  KEY_3270_Record                 =     64792 # : Int32
  KEY_3270_Reset                  =     64776 # : Int32
  KEY_3270_Right2                 =     64771 # : Int32
  KEY_3270_Rule                   =     64788 # : Int32
  KEY_3270_Setup                  =     64791 # : Int32
  KEY_3270_Test                   =     64781 # : Int32
  KEY_4                           =        52 # : Int32
  KEY_5                           =        53 # : Int32
  KEY_6                           =        54 # : Int32
  KEY_7                           =        55 # : Int32
  KEY_8                           =        56 # : Int32
  KEY_9                           =        57 # : Int32
  KEY_A                           =        65 # : Int32
  KEY_AE                          =       198 # : Int32
  KEY_Aacute                      =       193 # : Int32
  KEY_Abelowdot                   =  16785056 # : Int32
  KEY_Abreve                      =       451 # : Int32
  KEY_Abreveacute                 =  16785070 # : Int32
  KEY_Abrevebelowdot              =  16785078 # : Int32
  KEY_Abrevegrave                 =  16785072 # : Int32
  KEY_Abrevehook                  =  16785074 # : Int32
  KEY_Abrevetilde                 =  16785076 # : Int32
  KEY_AccessX_Enable              =     65136 # : Int32
  KEY_AccessX_Feedback_Enable     =     65137 # : Int32
  KEY_Acircumflex                 =       194 # : Int32
  KEY_Acircumflexacute            =  16785060 # : Int32
  KEY_Acircumflexbelowdot         =  16785068 # : Int32
  KEY_Acircumflexgrave            =  16785062 # : Int32
  KEY_Acircumflexhook             =  16785064 # : Int32
  KEY_Acircumflextilde            =  16785066 # : Int32
  KEY_AddFavorite                 = 269025081 # : Int32
  KEY_Adiaeresis                  =       196 # : Int32
  KEY_Agrave                      =       192 # : Int32
  KEY_Ahook                       =  16785058 # : Int32
  KEY_Alt_L                       =     65513 # : Int32
  KEY_Alt_R                       =     65514 # : Int32
  KEY_Amacron                     =       960 # : Int32
  KEY_Aogonek                     =       417 # : Int32
  KEY_ApplicationLeft             = 269025104 # : Int32
  KEY_ApplicationRight            = 269025105 # : Int32
  KEY_Arabic_0                    =  16778848 # : Int32
  KEY_Arabic_1                    =  16778849 # : Int32
  KEY_Arabic_2                    =  16778850 # : Int32
  KEY_Arabic_3                    =  16778851 # : Int32
  KEY_Arabic_4                    =  16778852 # : Int32
  KEY_Arabic_5                    =  16778853 # : Int32
  KEY_Arabic_6                    =  16778854 # : Int32
  KEY_Arabic_7                    =  16778855 # : Int32
  KEY_Arabic_8                    =  16778856 # : Int32
  KEY_Arabic_9                    =  16778857 # : Int32
  KEY_Arabic_ain                  =      1497 # : Int32
  KEY_Arabic_alef                 =      1479 # : Int32
  KEY_Arabic_alefmaksura          =      1513 # : Int32
  KEY_Arabic_beh                  =      1480 # : Int32
  KEY_Arabic_comma                =      1452 # : Int32
  KEY_Arabic_dad                  =      1494 # : Int32
  KEY_Arabic_dal                  =      1487 # : Int32
  KEY_Arabic_damma                =      1519 # : Int32
  KEY_Arabic_dammatan             =      1516 # : Int32
  KEY_Arabic_ddal                 =  16778888 # : Int32
  KEY_Arabic_farsi_yeh            =  16778956 # : Int32
  KEY_Arabic_fatha                =      1518 # : Int32
  KEY_Arabic_fathatan             =      1515 # : Int32
  KEY_Arabic_feh                  =      1505 # : Int32
  KEY_Arabic_fullstop             =  16778964 # : Int32
  KEY_Arabic_gaf                  =  16778927 # : Int32
  KEY_Arabic_ghain                =      1498 # : Int32
  KEY_Arabic_ha                   =      1511 # : Int32
  KEY_Arabic_hah                  =      1485 # : Int32
  KEY_Arabic_hamza                =      1473 # : Int32
  KEY_Arabic_hamza_above          =  16778836 # : Int32
  KEY_Arabic_hamza_below          =  16778837 # : Int32
  KEY_Arabic_hamzaonalef          =      1475 # : Int32
  KEY_Arabic_hamzaonwaw           =      1476 # : Int32
  KEY_Arabic_hamzaonyeh           =      1478 # : Int32
  KEY_Arabic_hamzaunderalef       =      1477 # : Int32
  KEY_Arabic_heh                  =      1511 # : Int32
  KEY_Arabic_heh_doachashmee      =  16778942 # : Int32
  KEY_Arabic_heh_goal             =  16778945 # : Int32
  KEY_Arabic_jeem                 =      1484 # : Int32
  KEY_Arabic_jeh                  =  16778904 # : Int32
  KEY_Arabic_kaf                  =      1507 # : Int32
  KEY_Arabic_kasra                =      1520 # : Int32
  KEY_Arabic_kasratan             =      1517 # : Int32
  KEY_Arabic_keheh                =  16778921 # : Int32
  KEY_Arabic_khah                 =      1486 # : Int32
  KEY_Arabic_lam                  =      1508 # : Int32
  KEY_Arabic_madda_above          =  16778835 # : Int32
  KEY_Arabic_maddaonalef          =      1474 # : Int32
  KEY_Arabic_meem                 =      1509 # : Int32
  KEY_Arabic_noon                 =      1510 # : Int32
  KEY_Arabic_noon_ghunna          =  16778938 # : Int32
  KEY_Arabic_peh                  =  16778878 # : Int32
  KEY_Arabic_percent              =  16778858 # : Int32
  KEY_Arabic_qaf                  =      1506 # : Int32
  KEY_Arabic_question_mark        =      1471 # : Int32
  KEY_Arabic_ra                   =      1489 # : Int32
  KEY_Arabic_rreh                 =  16778897 # : Int32
  KEY_Arabic_sad                  =      1493 # : Int32
  KEY_Arabic_seen                 =      1491 # : Int32
  KEY_Arabic_semicolon            =      1467 # : Int32
  KEY_Arabic_shadda               =      1521 # : Int32
  KEY_Arabic_sheen                =      1492 # : Int32
  KEY_Arabic_sukun                =      1522 # : Int32
  KEY_Arabic_superscript_alef     =  16778864 # : Int32
  KEY_Arabic_switch               =     65406 # : Int32
  KEY_Arabic_tah                  =      1495 # : Int32
  KEY_Arabic_tatweel              =      1504 # : Int32
  KEY_Arabic_tcheh                =  16778886 # : Int32
  KEY_Arabic_teh                  =      1482 # : Int32
  KEY_Arabic_tehmarbuta           =      1481 # : Int32
  KEY_Arabic_thal                 =      1488 # : Int32
  KEY_Arabic_theh                 =      1483 # : Int32
  KEY_Arabic_tteh                 =  16778873 # : Int32
  KEY_Arabic_veh                  =  16778916 # : Int32
  KEY_Arabic_waw                  =      1512 # : Int32
  KEY_Arabic_yeh                  =      1514 # : Int32
  KEY_Arabic_yeh_baree            =  16778962 # : Int32
  KEY_Arabic_zah                  =      1496 # : Int32
  KEY_Arabic_zain                 =      1490 # : Int32
  KEY_Aring                       =       197 # : Int32
  KEY_Armenian_AT                 =  16778552 # : Int32
  KEY_Armenian_AYB                =  16778545 # : Int32
  KEY_Armenian_BEN                =  16778546 # : Int32
  KEY_Armenian_CHA                =  16778569 # : Int32
  KEY_Armenian_DA                 =  16778548 # : Int32
  KEY_Armenian_DZA                =  16778561 # : Int32
  KEY_Armenian_E                  =  16778551 # : Int32
  KEY_Armenian_FE                 =  16778582 # : Int32
  KEY_Armenian_GHAT               =  16778562 # : Int32
  KEY_Armenian_GIM                =  16778547 # : Int32
  KEY_Armenian_HI                 =  16778565 # : Int32
  KEY_Armenian_HO                 =  16778560 # : Int32
  KEY_Armenian_INI                =  16778555 # : Int32
  KEY_Armenian_JE                 =  16778571 # : Int32
  KEY_Armenian_KE                 =  16778580 # : Int32
  KEY_Armenian_KEN                =  16778559 # : Int32
  KEY_Armenian_KHE                =  16778557 # : Int32
  KEY_Armenian_LYUN               =  16778556 # : Int32
  KEY_Armenian_MEN                =  16778564 # : Int32
  KEY_Armenian_NU                 =  16778566 # : Int32
  KEY_Armenian_O                  =  16778581 # : Int32
  KEY_Armenian_PE                 =  16778570 # : Int32
  KEY_Armenian_PYUR               =  16778579 # : Int32
  KEY_Armenian_RA                 =  16778572 # : Int32
  KEY_Armenian_RE                 =  16778576 # : Int32
  KEY_Armenian_SE                 =  16778573 # : Int32
  KEY_Armenian_SHA                =  16778567 # : Int32
  KEY_Armenian_TCHE               =  16778563 # : Int32
  KEY_Armenian_TO                 =  16778553 # : Int32
  KEY_Armenian_TSA                =  16778558 # : Int32
  KEY_Armenian_TSO                =  16778577 # : Int32
  KEY_Armenian_TYUN               =  16778575 # : Int32
  KEY_Armenian_VEV                =  16778574 # : Int32
  KEY_Armenian_VO                 =  16778568 # : Int32
  KEY_Armenian_VYUN               =  16778578 # : Int32
  KEY_Armenian_YECH               =  16778549 # : Int32
  KEY_Armenian_ZA                 =  16778550 # : Int32
  KEY_Armenian_ZHE                =  16778554 # : Int32
  KEY_Armenian_accent             =  16778587 # : Int32
  KEY_Armenian_amanak             =  16778588 # : Int32
  KEY_Armenian_apostrophe         =  16778586 # : Int32
  KEY_Armenian_at                 =  16778600 # : Int32
  KEY_Armenian_ayb                =  16778593 # : Int32
  KEY_Armenian_ben                =  16778594 # : Int32
  KEY_Armenian_but                =  16778589 # : Int32
  KEY_Armenian_cha                =  16778617 # : Int32
  KEY_Armenian_da                 =  16778596 # : Int32
  KEY_Armenian_dza                =  16778609 # : Int32
  KEY_Armenian_e                  =  16778599 # : Int32
  KEY_Armenian_exclam             =  16778588 # : Int32
  KEY_Armenian_fe                 =  16778630 # : Int32
  KEY_Armenian_full_stop          =  16778633 # : Int32
  KEY_Armenian_ghat               =  16778610 # : Int32
  KEY_Armenian_gim                =  16778595 # : Int32
  KEY_Armenian_hi                 =  16778613 # : Int32
  KEY_Armenian_ho                 =  16778608 # : Int32
  KEY_Armenian_hyphen             =  16778634 # : Int32
  KEY_Armenian_ini                =  16778603 # : Int32
  KEY_Armenian_je                 =  16778619 # : Int32
  KEY_Armenian_ke                 =  16778628 # : Int32
  KEY_Armenian_ken                =  16778607 # : Int32
  KEY_Armenian_khe                =  16778605 # : Int32
  KEY_Armenian_ligature_ew        =  16778631 # : Int32
  KEY_Armenian_lyun               =  16778604 # : Int32
  KEY_Armenian_men                =  16778612 # : Int32
  KEY_Armenian_nu                 =  16778614 # : Int32
  KEY_Armenian_o                  =  16778629 # : Int32
  KEY_Armenian_paruyk             =  16778590 # : Int32
  KEY_Armenian_pe                 =  16778618 # : Int32
  KEY_Armenian_pyur               =  16778627 # : Int32
  KEY_Armenian_question           =  16778590 # : Int32
  KEY_Armenian_ra                 =  16778620 # : Int32
  KEY_Armenian_re                 =  16778624 # : Int32
  KEY_Armenian_se                 =  16778621 # : Int32
  KEY_Armenian_separation_mark    =  16778589 # : Int32
  KEY_Armenian_sha                =  16778615 # : Int32
  KEY_Armenian_shesht             =  16778587 # : Int32
  KEY_Armenian_tche               =  16778611 # : Int32
  KEY_Armenian_to                 =  16778601 # : Int32
  KEY_Armenian_tsa                =  16778606 # : Int32
  KEY_Armenian_tso                =  16778625 # : Int32
  KEY_Armenian_tyun               =  16778623 # : Int32
  KEY_Armenian_verjaket           =  16778633 # : Int32
  KEY_Armenian_vev                =  16778622 # : Int32
  KEY_Armenian_vo                 =  16778616 # : Int32
  KEY_Armenian_vyun               =  16778626 # : Int32
  KEY_Armenian_yech               =  16778597 # : Int32
  KEY_Armenian_yentamna           =  16778634 # : Int32
  KEY_Armenian_za                 =  16778598 # : Int32
  KEY_Armenian_zhe                =  16778602 # : Int32
  KEY_Atilde                      =       195 # : Int32
  KEY_AudibleBell_Enable          =     65146 # : Int32
  KEY_AudioCycleTrack             = 269025179 # : Int32
  KEY_AudioForward                = 269025175 # : Int32
  KEY_AudioLowerVolume            = 269025041 # : Int32
  KEY_AudioMedia                  = 269025074 # : Int32
  KEY_AudioMicMute                = 269025202 # : Int32
  KEY_AudioMute                   = 269025042 # : Int32
  KEY_AudioNext                   = 269025047 # : Int32
  KEY_AudioPause                  = 269025073 # : Int32
  KEY_AudioPlay                   = 269025044 # : Int32
  KEY_AudioPrev                   = 269025046 # : Int32
  KEY_AudioRaiseVolume            = 269025043 # : Int32
  KEY_AudioRandomPlay             = 269025177 # : Int32
  KEY_AudioRecord                 = 269025052 # : Int32
  KEY_AudioRepeat                 = 269025176 # : Int32
  KEY_AudioRewind                 = 269025086 # : Int32
  KEY_AudioStop                   = 269025045 # : Int32
  KEY_Away                        = 269025165 # : Int32
  KEY_B                           =        66 # : Int32
  KEY_Babovedot                   =  16784898 # : Int32
  KEY_Back                        = 269025062 # : Int32
  KEY_BackForward                 = 269025087 # : Int32
  KEY_BackSpace                   =     65288 # : Int32
  KEY_Battery                     = 269025171 # : Int32
  KEY_Begin                       =     65368 # : Int32
  KEY_Blue                        = 269025190 # : Int32
  KEY_Bluetooth                   = 269025172 # : Int32
  KEY_Book                        = 269025106 # : Int32
  KEY_BounceKeys_Enable           =     65140 # : Int32
  KEY_Break                       =     65387 # : Int32
  KEY_BrightnessAdjust            = 269025083 # : Int32
  KEY_Byelorussian_SHORTU         =      1726 # : Int32
  KEY_Byelorussian_shortu         =      1710 # : Int32
  KEY_C                           =        67 # : Int32
  KEY_CD                          = 269025107 # : Int32
  KEY_CH                          =     65186 # : Int32
  KEY_C_H                         =     65189 # : Int32
  KEY_C_h                         =     65188 # : Int32
  KEY_Cabovedot                   =       709 # : Int32
  KEY_Cacute                      =       454 # : Int32
  KEY_Calculator                  = 269025053 # : Int32
  KEY_Calendar                    = 269025056 # : Int32
  KEY_Cancel                      =     65385 # : Int32
  KEY_Caps_Lock                   =     65509 # : Int32
  KEY_Ccaron                      =       456 # : Int32
  KEY_Ccedilla                    =       199 # : Int32
  KEY_Ccircumflex                 =       710 # : Int32
  KEY_Ch                          =     65185 # : Int32
  KEY_Clear                       =     65291 # : Int32
  KEY_ClearGrab                   = 269024801 # : Int32
  KEY_Close                       = 269025110 # : Int32
  KEY_Codeinput                   =     65335 # : Int32
  KEY_ColonSign                   =  16785569 # : Int32
  KEY_Community                   = 269025085 # : Int32
  KEY_ContrastAdjust              = 269025058 # : Int32
  KEY_Control_L                   =     65507 # : Int32
  KEY_Control_R                   =     65508 # : Int32
  KEY_Copy                        = 269025111 # : Int32
  KEY_CruzeiroSign                =  16785570 # : Int32
  KEY_Cut                         = 269025112 # : Int32
  KEY_CycleAngle                  = 269025180 # : Int32
  KEY_Cyrillic_A                  =      1761 # : Int32
  KEY_Cyrillic_BE                 =      1762 # : Int32
  KEY_Cyrillic_CHE                =      1790 # : Int32
  KEY_Cyrillic_CHE_descender      =  16778422 # : Int32
  KEY_Cyrillic_CHE_vertstroke     =  16778424 # : Int32
  KEY_Cyrillic_DE                 =      1764 # : Int32
  KEY_Cyrillic_DZHE               =      1727 # : Int32
  KEY_Cyrillic_E                  =      1788 # : Int32
  KEY_Cyrillic_EF                 =      1766 # : Int32
  KEY_Cyrillic_EL                 =      1772 # : Int32
  KEY_Cyrillic_EM                 =      1773 # : Int32
  KEY_Cyrillic_EN                 =      1774 # : Int32
  KEY_Cyrillic_EN_descender       =  16778402 # : Int32
  KEY_Cyrillic_ER                 =      1778 # : Int32
  KEY_Cyrillic_ES                 =      1779 # : Int32
  KEY_Cyrillic_GHE                =      1767 # : Int32
  KEY_Cyrillic_GHE_bar            =  16778386 # : Int32
  KEY_Cyrillic_HA                 =      1768 # : Int32
  KEY_Cyrillic_HARDSIGN           =      1791 # : Int32
  KEY_Cyrillic_HA_descender       =  16778418 # : Int32
  KEY_Cyrillic_I                  =      1769 # : Int32
  KEY_Cyrillic_IE                 =      1765 # : Int32
  KEY_Cyrillic_IO                 =      1715 # : Int32
  KEY_Cyrillic_I_macron           =  16778466 # : Int32
  KEY_Cyrillic_JE                 =      1720 # : Int32
  KEY_Cyrillic_KA                 =      1771 # : Int32
  KEY_Cyrillic_KA_descender       =  16778394 # : Int32
  KEY_Cyrillic_KA_vertstroke      =  16778396 # : Int32
  KEY_Cyrillic_LJE                =      1721 # : Int32
  KEY_Cyrillic_NJE                =      1722 # : Int32
  KEY_Cyrillic_O                  =      1775 # : Int32
  KEY_Cyrillic_O_bar              =  16778472 # : Int32
  KEY_Cyrillic_PE                 =      1776 # : Int32
  KEY_Cyrillic_SCHWA              =  16778456 # : Int32
  KEY_Cyrillic_SHA                =      1787 # : Int32
  KEY_Cyrillic_SHCHA              =      1789 # : Int32
  KEY_Cyrillic_SHHA               =  16778426 # : Int32
  KEY_Cyrillic_SHORTI             =      1770 # : Int32
  KEY_Cyrillic_SOFTSIGN           =      1784 # : Int32
  KEY_Cyrillic_TE                 =      1780 # : Int32
  KEY_Cyrillic_TSE                =      1763 # : Int32
  KEY_Cyrillic_U                  =      1781 # : Int32
  KEY_Cyrillic_U_macron           =  16778478 # : Int32
  KEY_Cyrillic_U_straight         =  16778414 # : Int32
  KEY_Cyrillic_U_straight_bar     =  16778416 # : Int32
  KEY_Cyrillic_VE                 =      1783 # : Int32
  KEY_Cyrillic_YA                 =      1777 # : Int32
  KEY_Cyrillic_YERU               =      1785 # : Int32
  KEY_Cyrillic_YU                 =      1760 # : Int32
  KEY_Cyrillic_ZE                 =      1786 # : Int32
  KEY_Cyrillic_ZHE                =      1782 # : Int32
  KEY_Cyrillic_ZHE_descender      =  16778390 # : Int32
  KEY_Cyrillic_a                  =      1729 # : Int32
  KEY_Cyrillic_be                 =      1730 # : Int32
  KEY_Cyrillic_che                =      1758 # : Int32
  KEY_Cyrillic_che_descender      =  16778423 # : Int32
  KEY_Cyrillic_che_vertstroke     =  16778425 # : Int32
  KEY_Cyrillic_de                 =      1732 # : Int32
  KEY_Cyrillic_dzhe               =      1711 # : Int32
  KEY_Cyrillic_e                  =      1756 # : Int32
  KEY_Cyrillic_ef                 =      1734 # : Int32
  KEY_Cyrillic_el                 =      1740 # : Int32
  KEY_Cyrillic_em                 =      1741 # : Int32
  KEY_Cyrillic_en                 =      1742 # : Int32
  KEY_Cyrillic_en_descender       =  16778403 # : Int32
  KEY_Cyrillic_er                 =      1746 # : Int32
  KEY_Cyrillic_es                 =      1747 # : Int32
  KEY_Cyrillic_ghe                =      1735 # : Int32
  KEY_Cyrillic_ghe_bar            =  16778387 # : Int32
  KEY_Cyrillic_ha                 =      1736 # : Int32
  KEY_Cyrillic_ha_descender       =  16778419 # : Int32
  KEY_Cyrillic_hardsign           =      1759 # : Int32
  KEY_Cyrillic_i                  =      1737 # : Int32
  KEY_Cyrillic_i_macron           =  16778467 # : Int32
  KEY_Cyrillic_ie                 =      1733 # : Int32
  KEY_Cyrillic_io                 =      1699 # : Int32
  KEY_Cyrillic_je                 =      1704 # : Int32
  KEY_Cyrillic_ka                 =      1739 # : Int32
  KEY_Cyrillic_ka_descender       =  16778395 # : Int32
  KEY_Cyrillic_ka_vertstroke      =  16778397 # : Int32
  KEY_Cyrillic_lje                =      1705 # : Int32
  KEY_Cyrillic_nje                =      1706 # : Int32
  KEY_Cyrillic_o                  =      1743 # : Int32
  KEY_Cyrillic_o_bar              =  16778473 # : Int32
  KEY_Cyrillic_pe                 =      1744 # : Int32
  KEY_Cyrillic_schwa              =  16778457 # : Int32
  KEY_Cyrillic_sha                =      1755 # : Int32
  KEY_Cyrillic_shcha              =      1757 # : Int32
  KEY_Cyrillic_shha               =  16778427 # : Int32
  KEY_Cyrillic_shorti             =      1738 # : Int32
  KEY_Cyrillic_softsign           =      1752 # : Int32
  KEY_Cyrillic_te                 =      1748 # : Int32
  KEY_Cyrillic_tse                =      1731 # : Int32
  KEY_Cyrillic_u                  =      1749 # : Int32
  KEY_Cyrillic_u_macron           =  16778479 # : Int32
  KEY_Cyrillic_u_straight         =  16778415 # : Int32
  KEY_Cyrillic_u_straight_bar     =  16778417 # : Int32
  KEY_Cyrillic_ve                 =      1751 # : Int32
  KEY_Cyrillic_ya                 =      1745 # : Int32
  KEY_Cyrillic_yeru               =      1753 # : Int32
  KEY_Cyrillic_yu                 =      1728 # : Int32
  KEY_Cyrillic_ze                 =      1754 # : Int32
  KEY_Cyrillic_zhe                =      1750 # : Int32
  KEY_Cyrillic_zhe_descender      =  16778391 # : Int32
  KEY_D                           =        68 # : Int32
  KEY_DOS                         = 269025114 # : Int32
  KEY_Dabovedot                   =  16784906 # : Int32
  KEY_Dcaron                      =       463 # : Int32
  KEY_Delete                      =     65535 # : Int32
  KEY_Display                     = 269025113 # : Int32
  KEY_Documents                   = 269025115 # : Int32
  KEY_DongSign                    =  16785579 # : Int32
  KEY_Down                        =     65364 # : Int32
  KEY_Dstroke                     =       464 # : Int32
  KEY_E                           =        69 # : Int32
  KEY_ENG                         =       957 # : Int32
  KEY_ETH                         =       208 # : Int32
  KEY_EZH                         =  16777655 # : Int32
  KEY_Eabovedot                   =       972 # : Int32
  KEY_Eacute                      =       201 # : Int32
  KEY_Ebelowdot                   =  16785080 # : Int32
  KEY_Ecaron                      =       460 # : Int32
  KEY_Ecircumflex                 =       202 # : Int32
  KEY_Ecircumflexacute            =  16785086 # : Int32
  KEY_Ecircumflexbelowdot         =  16785094 # : Int32
  KEY_Ecircumflexgrave            =  16785088 # : Int32
  KEY_Ecircumflexhook             =  16785090 # : Int32
  KEY_Ecircumflextilde            =  16785092 # : Int32
  KEY_EcuSign                     =  16785568 # : Int32
  KEY_Ediaeresis                  =       203 # : Int32
  KEY_Egrave                      =       200 # : Int32
  KEY_Ehook                       =  16785082 # : Int32
  KEY_Eisu_Shift                  =     65327 # : Int32
  KEY_Eisu_toggle                 =     65328 # : Int32
  KEY_Eject                       = 269025068 # : Int32
  KEY_Emacron                     =       938 # : Int32
  KEY_End                         =     65367 # : Int32
  KEY_Eogonek                     =       458 # : Int32
  KEY_Escape                      =     65307 # : Int32
  KEY_Eth                         =       208 # : Int32
  KEY_Etilde                      =  16785084 # : Int32
  KEY_EuroSign                    =      8364 # : Int32
  KEY_Excel                       = 269025116 # : Int32
  KEY_Execute                     =     65378 # : Int32
  KEY_Explorer                    = 269025117 # : Int32
  KEY_F                           =        70 # : Int32
  KEY_F1                          =     65470 # : Int32
  KEY_F10                         =     65479 # : Int32
  KEY_F11                         =     65480 # : Int32
  KEY_F12                         =     65481 # : Int32
  KEY_F13                         =     65482 # : Int32
  KEY_F14                         =     65483 # : Int32
  KEY_F15                         =     65484 # : Int32
  KEY_F16                         =     65485 # : Int32
  KEY_F17                         =     65486 # : Int32
  KEY_F18                         =     65487 # : Int32
  KEY_F19                         =     65488 # : Int32
  KEY_F2                          =     65471 # : Int32
  KEY_F20                         =     65489 # : Int32
  KEY_F21                         =     65490 # : Int32
  KEY_F22                         =     65491 # : Int32
  KEY_F23                         =     65492 # : Int32
  KEY_F24                         =     65493 # : Int32
  KEY_F25                         =     65494 # : Int32
  KEY_F26                         =     65495 # : Int32
  KEY_F27                         =     65496 # : Int32
  KEY_F28                         =     65497 # : Int32
  KEY_F29                         =     65498 # : Int32
  KEY_F3                          =     65472 # : Int32
  KEY_F30                         =     65499 # : Int32
  KEY_F31                         =     65500 # : Int32
  KEY_F32                         =     65501 # : Int32
  KEY_F33                         =     65502 # : Int32
  KEY_F34                         =     65503 # : Int32
  KEY_F35                         =     65504 # : Int32
  KEY_F4                          =     65473 # : Int32
  KEY_F5                          =     65474 # : Int32
  KEY_F6                          =     65475 # : Int32
  KEY_F7                          =     65476 # : Int32
  KEY_F8                          =     65477 # : Int32
  KEY_F9                          =     65478 # : Int32
  KEY_FFrancSign                  =  16785571 # : Int32
  KEY_Fabovedot                   =  16784926 # : Int32
  KEY_Farsi_0                     =  16778992 # : Int32
  KEY_Farsi_1                     =  16778993 # : Int32
  KEY_Farsi_2                     =  16778994 # : Int32
  KEY_Farsi_3                     =  16778995 # : Int32
  KEY_Farsi_4                     =  16778996 # : Int32
  KEY_Farsi_5                     =  16778997 # : Int32
  KEY_Farsi_6                     =  16778998 # : Int32
  KEY_Farsi_7                     =  16778999 # : Int32
  KEY_Farsi_8                     =  16779000 # : Int32
  KEY_Farsi_9                     =  16779001 # : Int32
  KEY_Farsi_yeh                   =  16778956 # : Int32
  KEY_Favorites                   = 269025072 # : Int32
  KEY_Finance                     = 269025084 # : Int32
  KEY_Find                        =     65384 # : Int32
  KEY_First_Virtual_Screen        =     65232 # : Int32
  KEY_Forward                     = 269025063 # : Int32
  KEY_FrameBack                   = 269025181 # : Int32
  KEY_FrameForward                = 269025182 # : Int32
  KEY_G                           =        71 # : Int32
  KEY_Gabovedot                   =       725 # : Int32
  KEY_Game                        = 269025118 # : Int32
  KEY_Gbreve                      =       683 # : Int32
  KEY_Gcaron                      =  16777702 # : Int32
  KEY_Gcedilla                    =       939 # : Int32
  KEY_Gcircumflex                 =       728 # : Int32
  KEY_Georgian_an                 =  16781520 # : Int32
  KEY_Georgian_ban                =  16781521 # : Int32
  KEY_Georgian_can                =  16781546 # : Int32
  KEY_Georgian_char               =  16781549 # : Int32
  KEY_Georgian_chin               =  16781545 # : Int32
  KEY_Georgian_cil                =  16781548 # : Int32
  KEY_Georgian_don                =  16781523 # : Int32
  KEY_Georgian_en                 =  16781524 # : Int32
  KEY_Georgian_fi                 =  16781558 # : Int32
  KEY_Georgian_gan                =  16781522 # : Int32
  KEY_Georgian_ghan               =  16781542 # : Int32
  KEY_Georgian_hae                =  16781552 # : Int32
  KEY_Georgian_har                =  16781556 # : Int32
  KEY_Georgian_he                 =  16781553 # : Int32
  KEY_Georgian_hie                =  16781554 # : Int32
  KEY_Georgian_hoe                =  16781557 # : Int32
  KEY_Georgian_in                 =  16781528 # : Int32
  KEY_Georgian_jhan               =  16781551 # : Int32
  KEY_Georgian_jil                =  16781547 # : Int32
  KEY_Georgian_kan                =  16781529 # : Int32
  KEY_Georgian_khar               =  16781541 # : Int32
  KEY_Georgian_las                =  16781530 # : Int32
  KEY_Georgian_man                =  16781531 # : Int32
  KEY_Georgian_nar                =  16781532 # : Int32
  KEY_Georgian_on                 =  16781533 # : Int32
  KEY_Georgian_par                =  16781534 # : Int32
  KEY_Georgian_phar               =  16781540 # : Int32
  KEY_Georgian_qar                =  16781543 # : Int32
  KEY_Georgian_rae                =  16781536 # : Int32
  KEY_Georgian_san                =  16781537 # : Int32
  KEY_Georgian_shin               =  16781544 # : Int32
  KEY_Georgian_tan                =  16781527 # : Int32
  KEY_Georgian_tar                =  16781538 # : Int32
  KEY_Georgian_un                 =  16781539 # : Int32
  KEY_Georgian_vin                =  16781525 # : Int32
  KEY_Georgian_we                 =  16781555 # : Int32
  KEY_Georgian_xan                =  16781550 # : Int32
  KEY_Georgian_zen                =  16781526 # : Int32
  KEY_Georgian_zhar               =  16781535 # : Int32
  KEY_Go                          = 269025119 # : Int32
  KEY_Greek_ALPHA                 =      1985 # : Int32
  KEY_Greek_ALPHAaccent           =      1953 # : Int32
  KEY_Greek_BETA                  =      1986 # : Int32
  KEY_Greek_CHI                   =      2007 # : Int32
  KEY_Greek_DELTA                 =      1988 # : Int32
  KEY_Greek_EPSILON               =      1989 # : Int32
  KEY_Greek_EPSILONaccent         =      1954 # : Int32
  KEY_Greek_ETA                   =      1991 # : Int32
  KEY_Greek_ETAaccent             =      1955 # : Int32
  KEY_Greek_GAMMA                 =      1987 # : Int32
  KEY_Greek_IOTA                  =      1993 # : Int32
  KEY_Greek_IOTAaccent            =      1956 # : Int32
  KEY_Greek_IOTAdiaeresis         =      1957 # : Int32
  KEY_Greek_IOTAdieresis          =      1957 # : Int32
  KEY_Greek_KAPPA                 =      1994 # : Int32
  KEY_Greek_LAMBDA                =      1995 # : Int32
  KEY_Greek_LAMDA                 =      1995 # : Int32
  KEY_Greek_MU                    =      1996 # : Int32
  KEY_Greek_NU                    =      1997 # : Int32
  KEY_Greek_OMEGA                 =      2009 # : Int32
  KEY_Greek_OMEGAaccent           =      1963 # : Int32
  KEY_Greek_OMICRON               =      1999 # : Int32
  KEY_Greek_OMICRONaccent         =      1959 # : Int32
  KEY_Greek_PHI                   =      2006 # : Int32
  KEY_Greek_PI                    =      2000 # : Int32
  KEY_Greek_PSI                   =      2008 # : Int32
  KEY_Greek_RHO                   =      2001 # : Int32
  KEY_Greek_SIGMA                 =      2002 # : Int32
  KEY_Greek_TAU                   =      2004 # : Int32
  KEY_Greek_THETA                 =      1992 # : Int32
  KEY_Greek_UPSILON               =      2005 # : Int32
  KEY_Greek_UPSILONaccent         =      1960 # : Int32
  KEY_Greek_UPSILONdieresis       =      1961 # : Int32
  KEY_Greek_XI                    =      1998 # : Int32
  KEY_Greek_ZETA                  =      1990 # : Int32
  KEY_Greek_accentdieresis        =      1966 # : Int32
  KEY_Greek_alpha                 =      2017 # : Int32
  KEY_Greek_alphaaccent           =      1969 # : Int32
  KEY_Greek_beta                  =      2018 # : Int32
  KEY_Greek_chi                   =      2039 # : Int32
  KEY_Greek_delta                 =      2020 # : Int32
  KEY_Greek_epsilon               =      2021 # : Int32
  KEY_Greek_epsilonaccent         =      1970 # : Int32
  KEY_Greek_eta                   =      2023 # : Int32
  KEY_Greek_etaaccent             =      1971 # : Int32
  KEY_Greek_finalsmallsigma       =      2035 # : Int32
  KEY_Greek_gamma                 =      2019 # : Int32
  KEY_Greek_horizbar              =      1967 # : Int32
  KEY_Greek_iota                  =      2025 # : Int32
  KEY_Greek_iotaaccent            =      1972 # : Int32
  KEY_Greek_iotaaccentdieresis    =      1974 # : Int32
  KEY_Greek_iotadieresis          =      1973 # : Int32
  KEY_Greek_kappa                 =      2026 # : Int32
  KEY_Greek_lambda                =      2027 # : Int32
  KEY_Greek_lamda                 =      2027 # : Int32
  KEY_Greek_mu                    =      2028 # : Int32
  KEY_Greek_nu                    =      2029 # : Int32
  KEY_Greek_omega                 =      2041 # : Int32
  KEY_Greek_omegaaccent           =      1979 # : Int32
  KEY_Greek_omicron               =      2031 # : Int32
  KEY_Greek_omicronaccent         =      1975 # : Int32
  KEY_Greek_phi                   =      2038 # : Int32
  KEY_Greek_pi                    =      2032 # : Int32
  KEY_Greek_psi                   =      2040 # : Int32
  KEY_Greek_rho                   =      2033 # : Int32
  KEY_Greek_sigma                 =      2034 # : Int32
  KEY_Greek_switch                =     65406 # : Int32
  KEY_Greek_tau                   =      2036 # : Int32
  KEY_Greek_theta                 =      2024 # : Int32
  KEY_Greek_upsilon               =      2037 # : Int32
  KEY_Greek_upsilonaccent         =      1976 # : Int32
  KEY_Greek_upsilonaccentdieresis =      1978 # : Int32
  KEY_Greek_upsilondieresis       =      1977 # : Int32
  KEY_Greek_xi                    =      2030 # : Int32
  KEY_Greek_zeta                  =      2022 # : Int32
  KEY_Green                       = 269025188 # : Int32
  KEY_H                           =        72 # : Int32
  KEY_Hangul                      =     65329 # : Int32
  KEY_Hangul_A                    =      3775 # : Int32
  KEY_Hangul_AE                   =      3776 # : Int32
  KEY_Hangul_AraeA                =      3830 # : Int32
  KEY_Hangul_AraeAE               =      3831 # : Int32
  KEY_Hangul_Banja                =     65337 # : Int32
  KEY_Hangul_Cieuc                =      3770 # : Int32
  KEY_Hangul_Codeinput            =     65335 # : Int32
  KEY_Hangul_Dikeud               =      3751 # : Int32
  KEY_Hangul_E                    =      3780 # : Int32
  KEY_Hangul_EO                   =      3779 # : Int32
  KEY_Hangul_EU                   =      3793 # : Int32
  KEY_Hangul_End                  =     65331 # : Int32
  KEY_Hangul_Hanja                =     65332 # : Int32
  KEY_Hangul_Hieuh                =      3774 # : Int32
  KEY_Hangul_I                    =      3795 # : Int32
  KEY_Hangul_Ieung                =      3767 # : Int32
  KEY_Hangul_J_Cieuc              =      3818 # : Int32
  KEY_Hangul_J_Dikeud             =      3802 # : Int32
  KEY_Hangul_J_Hieuh              =      3822 # : Int32
  KEY_Hangul_J_Ieung              =      3816 # : Int32
  KEY_Hangul_J_Jieuj              =      3817 # : Int32
  KEY_Hangul_J_Khieuq             =      3819 # : Int32
  KEY_Hangul_J_Kiyeog             =      3796 # : Int32
  KEY_Hangul_J_KiyeogSios         =      3798 # : Int32
  KEY_Hangul_J_KkogjiDalrinIeung  =      3833 # : Int32
  KEY_Hangul_J_Mieum              =      3811 # : Int32
  KEY_Hangul_J_Nieun              =      3799 # : Int32
  KEY_Hangul_J_NieunHieuh         =      3801 # : Int32
  KEY_Hangul_J_NieunJieuj         =      3800 # : Int32
  KEY_Hangul_J_PanSios            =      3832 # : Int32
  KEY_Hangul_J_Phieuf             =      3821 # : Int32
  KEY_Hangul_J_Pieub              =      3812 # : Int32
  KEY_Hangul_J_PieubSios          =      3813 # : Int32
  KEY_Hangul_J_Rieul              =      3803 # : Int32
  KEY_Hangul_J_RieulHieuh         =      3810 # : Int32
  KEY_Hangul_J_RieulKiyeog        =      3804 # : Int32
  KEY_Hangul_J_RieulMieum         =      3805 # : Int32
  KEY_Hangul_J_RieulPhieuf        =      3809 # : Int32
  KEY_Hangul_J_RieulPieub         =      3806 # : Int32
  KEY_Hangul_J_RieulSios          =      3807 # : Int32
  KEY_Hangul_J_RieulTieut         =      3808 # : Int32
  KEY_Hangul_J_Sios               =      3814 # : Int32
  KEY_Hangul_J_SsangKiyeog        =      3797 # : Int32
  KEY_Hangul_J_SsangSios          =      3815 # : Int32
  KEY_Hangul_J_Tieut              =      3820 # : Int32
  KEY_Hangul_J_YeorinHieuh        =      3834 # : Int32
  KEY_Hangul_Jamo                 =     65333 # : Int32
  KEY_Hangul_Jeonja               =     65336 # : Int32
  KEY_Hangul_Jieuj                =      3768 # : Int32
  KEY_Hangul_Khieuq               =      3771 # : Int32
  KEY_Hangul_Kiyeog               =      3745 # : Int32
  KEY_Hangul_KiyeogSios           =      3747 # : Int32
  KEY_Hangul_KkogjiDalrinIeung    =      3827 # : Int32
  KEY_Hangul_Mieum                =      3761 # : Int32
  KEY_Hangul_MultipleCandidate    =     65341 # : Int32
  KEY_Hangul_Nieun                =      3748 # : Int32
  KEY_Hangul_NieunHieuh           =      3750 # : Int32
  KEY_Hangul_NieunJieuj           =      3749 # : Int32
  KEY_Hangul_O                    =      3783 # : Int32
  KEY_Hangul_OE                   =      3786 # : Int32
  KEY_Hangul_PanSios              =      3826 # : Int32
  KEY_Hangul_Phieuf               =      3773 # : Int32
  KEY_Hangul_Pieub                =      3762 # : Int32
  KEY_Hangul_PieubSios            =      3764 # : Int32
  KEY_Hangul_PostHanja            =     65339 # : Int32
  KEY_Hangul_PreHanja             =     65338 # : Int32
  KEY_Hangul_PreviousCandidate    =     65342 # : Int32
  KEY_Hangul_Rieul                =      3753 # : Int32
  KEY_Hangul_RieulHieuh           =      3760 # : Int32
  KEY_Hangul_RieulKiyeog          =      3754 # : Int32
  KEY_Hangul_RieulMieum           =      3755 # : Int32
  KEY_Hangul_RieulPhieuf          =      3759 # : Int32
  KEY_Hangul_RieulPieub           =      3756 # : Int32
  KEY_Hangul_RieulSios            =      3757 # : Int32
  KEY_Hangul_RieulTieut           =      3758 # : Int32
  KEY_Hangul_RieulYeorinHieuh     =      3823 # : Int32
  KEY_Hangul_Romaja               =     65334 # : Int32
  KEY_Hangul_SingleCandidate      =     65340 # : Int32
  KEY_Hangul_Sios                 =      3765 # : Int32
  KEY_Hangul_Special              =     65343 # : Int32
  KEY_Hangul_SsangDikeud          =      3752 # : Int32
  KEY_Hangul_SsangJieuj           =      3769 # : Int32
  KEY_Hangul_SsangKiyeog          =      3746 # : Int32
  KEY_Hangul_SsangPieub           =      3763 # : Int32
  KEY_Hangul_SsangSios            =      3766 # : Int32
  KEY_Hangul_Start                =     65330 # : Int32
  KEY_Hangul_SunkyeongeumMieum    =      3824 # : Int32
  KEY_Hangul_SunkyeongeumPhieuf   =      3828 # : Int32
  KEY_Hangul_SunkyeongeumPieub    =      3825 # : Int32
  KEY_Hangul_Tieut                =      3772 # : Int32
  KEY_Hangul_U                    =      3788 # : Int32
  KEY_Hangul_WA                   =      3784 # : Int32
  KEY_Hangul_WAE                  =      3785 # : Int32
  KEY_Hangul_WE                   =      3790 # : Int32
  KEY_Hangul_WEO                  =      3789 # : Int32
  KEY_Hangul_WI                   =      3791 # : Int32
  KEY_Hangul_YA                   =      3777 # : Int32
  KEY_Hangul_YAE                  =      3778 # : Int32
  KEY_Hangul_YE                   =      3782 # : Int32
  KEY_Hangul_YEO                  =      3781 # : Int32
  KEY_Hangul_YI                   =      3794 # : Int32
  KEY_Hangul_YO                   =      3787 # : Int32
  KEY_Hangul_YU                   =      3792 # : Int32
  KEY_Hangul_YeorinHieuh          =      3829 # : Int32
  KEY_Hangul_switch               =     65406 # : Int32
  KEY_Hankaku                     =     65321 # : Int32
  KEY_Hcircumflex                 =       678 # : Int32
  KEY_Hebrew_switch               =     65406 # : Int32
  KEY_Help                        =     65386 # : Int32
  KEY_Henkan                      =     65315 # : Int32
  KEY_Henkan_Mode                 =     65315 # : Int32
  KEY_Hibernate                   = 269025192 # : Int32
  KEY_Hiragana                    =     65317 # : Int32
  KEY_Hiragana_Katakana           =     65319 # : Int32
  KEY_History                     = 269025079 # : Int32
  KEY_Home                        =     65360 # : Int32
  KEY_HomePage                    = 269025048 # : Int32
  KEY_HotLinks                    = 269025082 # : Int32
  KEY_Hstroke                     =       673 # : Int32
  KEY_Hyper_L                     =     65517 # : Int32
  KEY_Hyper_R                     =     65518 # : Int32
  KEY_I                           =        73 # : Int32
  KEY_ISO_Center_Object           =     65075 # : Int32
  KEY_ISO_Continuous_Underline    =     65072 # : Int32
  KEY_ISO_Discontinuous_Underline =     65073 # : Int32
  KEY_ISO_Emphasize               =     65074 # : Int32
  KEY_ISO_Enter                   =     65076 # : Int32
  KEY_ISO_Fast_Cursor_Down        =     65071 # : Int32
  KEY_ISO_Fast_Cursor_Left        =     65068 # : Int32
  KEY_ISO_Fast_Cursor_Right       =     65069 # : Int32
  KEY_ISO_Fast_Cursor_Up          =     65070 # : Int32
  KEY_ISO_First_Group             =     65036 # : Int32
  KEY_ISO_First_Group_Lock        =     65037 # : Int32
  KEY_ISO_Group_Latch             =     65030 # : Int32
  KEY_ISO_Group_Lock              =     65031 # : Int32
  KEY_ISO_Group_Shift             =     65406 # : Int32
  KEY_ISO_Last_Group              =     65038 # : Int32
  KEY_ISO_Last_Group_Lock         =     65039 # : Int32
  KEY_ISO_Left_Tab                =     65056 # : Int32
  KEY_ISO_Level2_Latch            =     65026 # : Int32
  KEY_ISO_Level3_Latch            =     65028 # : Int32
  KEY_ISO_Level3_Lock             =     65029 # : Int32
  KEY_ISO_Level3_Shift            =     65027 # : Int32
  KEY_ISO_Level5_Latch            =     65042 # : Int32
  KEY_ISO_Level5_Lock             =     65043 # : Int32
  KEY_ISO_Level5_Shift            =     65041 # : Int32
  KEY_ISO_Lock                    =     65025 # : Int32
  KEY_ISO_Move_Line_Down          =     65058 # : Int32
  KEY_ISO_Move_Line_Up            =     65057 # : Int32
  KEY_ISO_Next_Group              =     65032 # : Int32
  KEY_ISO_Next_Group_Lock         =     65033 # : Int32
  KEY_ISO_Partial_Line_Down       =     65060 # : Int32
  KEY_ISO_Partial_Line_Up         =     65059 # : Int32
  KEY_ISO_Partial_Space_Left      =     65061 # : Int32
  KEY_ISO_Partial_Space_Right     =     65062 # : Int32
  KEY_ISO_Prev_Group              =     65034 # : Int32
  KEY_ISO_Prev_Group_Lock         =     65035 # : Int32
  KEY_ISO_Release_Both_Margins    =     65067 # : Int32
  KEY_ISO_Release_Margin_Left     =     65065 # : Int32
  KEY_ISO_Release_Margin_Right    =     65066 # : Int32
  KEY_ISO_Set_Margin_Left         =     65063 # : Int32
  KEY_ISO_Set_Margin_Right        =     65064 # : Int32
  KEY_Iabovedot                   =       681 # : Int32
  KEY_Iacute                      =       205 # : Int32
  KEY_Ibelowdot                   =  16785098 # : Int32
  KEY_Ibreve                      =  16777516 # : Int32
  KEY_Icircumflex                 =       206 # : Int32
  KEY_Idiaeresis                  =       207 # : Int32
  KEY_Igrave                      =       204 # : Int32
  KEY_Ihook                       =  16785096 # : Int32
  KEY_Imacron                     =       975 # : Int32
  KEY_Insert                      =     65379 # : Int32
  KEY_Iogonek                     =       967 # : Int32
  KEY_Itilde                      =       933 # : Int32
  KEY_J                           =        74 # : Int32
  KEY_Jcircumflex                 =       684 # : Int32
  KEY_K                           =        75 # : Int32
  KEY_KP_0                        =     65456 # : Int32
  KEY_KP_1                        =     65457 # : Int32
  KEY_KP_2                        =     65458 # : Int32
  KEY_KP_3                        =     65459 # : Int32
  KEY_KP_4                        =     65460 # : Int32
  KEY_KP_5                        =     65461 # : Int32
  KEY_KP_6                        =     65462 # : Int32
  KEY_KP_7                        =     65463 # : Int32
  KEY_KP_8                        =     65464 # : Int32
  KEY_KP_9                        =     65465 # : Int32
  KEY_KP_Add                      =     65451 # : Int32
  KEY_KP_Begin                    =     65437 # : Int32
  KEY_KP_Decimal                  =     65454 # : Int32
  KEY_KP_Delete                   =     65439 # : Int32
  KEY_KP_Divide                   =     65455 # : Int32
  KEY_KP_Down                     =     65433 # : Int32
  KEY_KP_End                      =     65436 # : Int32
  KEY_KP_Enter                    =     65421 # : Int32
  KEY_KP_Equal                    =     65469 # : Int32
  KEY_KP_F1                       =     65425 # : Int32
  KEY_KP_F2                       =     65426 # : Int32
  KEY_KP_F3                       =     65427 # : Int32
  KEY_KP_F4                       =     65428 # : Int32
  KEY_KP_Home                     =     65429 # : Int32
  KEY_KP_Insert                   =     65438 # : Int32
  KEY_KP_Left                     =     65430 # : Int32
  KEY_KP_Multiply                 =     65450 # : Int32
  KEY_KP_Next                     =     65435 # : Int32
  KEY_KP_Page_Down                =     65435 # : Int32
  KEY_KP_Page_Up                  =     65434 # : Int32
  KEY_KP_Prior                    =     65434 # : Int32
  KEY_KP_Right                    =     65432 # : Int32
  KEY_KP_Separator                =     65452 # : Int32
  KEY_KP_Space                    =     65408 # : Int32
  KEY_KP_Subtract                 =     65453 # : Int32
  KEY_KP_Tab                      =     65417 # : Int32
  KEY_KP_Up                       =     65431 # : Int32
  KEY_Kana_Lock                   =     65325 # : Int32
  KEY_Kana_Shift                  =     65326 # : Int32
  KEY_Kanji                       =     65313 # : Int32
  KEY_Kanji_Bangou                =     65335 # : Int32
  KEY_Katakana                    =     65318 # : Int32
  KEY_KbdBrightnessDown           = 269025030 # : Int32
  KEY_KbdBrightnessUp             = 269025029 # : Int32
  KEY_KbdLightOnOff               = 269025028 # : Int32
  KEY_Kcedilla                    =       979 # : Int32
  KEY_Korean_Won                  =      3839 # : Int32
  KEY_L                           =        76 # : Int32
  KEY_L1                          =     65480 # : Int32
  KEY_L10                         =     65489 # : Int32
  KEY_L2                          =     65481 # : Int32
  KEY_L3                          =     65482 # : Int32
  KEY_L4                          =     65483 # : Int32
  KEY_L5                          =     65484 # : Int32
  KEY_L6                          =     65485 # : Int32
  KEY_L7                          =     65486 # : Int32
  KEY_L8                          =     65487 # : Int32
  KEY_L9                          =     65488 # : Int32
  KEY_Lacute                      =       453 # : Int32
  KEY_Last_Virtual_Screen         =     65236 # : Int32
  KEY_Launch0                     = 269025088 # : Int32
  KEY_Launch1                     = 269025089 # : Int32
  KEY_Launch2                     = 269025090 # : Int32
  KEY_Launch3                     = 269025091 # : Int32
  KEY_Launch4                     = 269025092 # : Int32
  KEY_Launch5                     = 269025093 # : Int32
  KEY_Launch6                     = 269025094 # : Int32
  KEY_Launch7                     = 269025095 # : Int32
  KEY_Launch8                     = 269025096 # : Int32
  KEY_Launch9                     = 269025097 # : Int32
  KEY_LaunchA                     = 269025098 # : Int32
  KEY_LaunchB                     = 269025099 # : Int32
  KEY_LaunchC                     = 269025100 # : Int32
  KEY_LaunchD                     = 269025101 # : Int32
  KEY_LaunchE                     = 269025102 # : Int32
  KEY_LaunchF                     = 269025103 # : Int32
  KEY_Lbelowdot                   =  16784950 # : Int32
  KEY_Lcaron                      =       421 # : Int32
  KEY_Lcedilla                    =       934 # : Int32
  KEY_Left                        =     65361 # : Int32
  KEY_LightBulb                   = 269025077 # : Int32
  KEY_Linefeed                    =     65290 # : Int32
  KEY_LiraSign                    =  16785572 # : Int32
  KEY_LogGrabInfo                 = 269024805 # : Int32
  KEY_LogOff                      = 269025121 # : Int32
  KEY_LogWindowTree               = 269024804 # : Int32
  KEY_Lstroke                     =       419 # : Int32
  KEY_M                           =        77 # : Int32
  KEY_Mabovedot                   =  16784960 # : Int32
  KEY_Macedonia_DSE               =      1717 # : Int32
  KEY_Macedonia_GJE               =      1714 # : Int32
  KEY_Macedonia_KJE               =      1724 # : Int32
  KEY_Macedonia_dse               =      1701 # : Int32
  KEY_Macedonia_gje               =      1698 # : Int32
  KEY_Macedonia_kje               =      1708 # : Int32
  KEY_Mae_Koho                    =     65342 # : Int32
  KEY_Mail                        = 269025049 # : Int32
  KEY_MailForward                 = 269025168 # : Int32
  KEY_Market                      = 269025122 # : Int32
  KEY_Massyo                      =     65324 # : Int32
  KEY_Meeting                     = 269025123 # : Int32
  KEY_Memo                        = 269025054 # : Int32
  KEY_Menu                        =     65383 # : Int32
  KEY_MenuKB                      = 269025125 # : Int32
  KEY_MenuPB                      = 269025126 # : Int32
  KEY_Messenger                   = 269025166 # : Int32
  KEY_Meta_L                      =     65511 # : Int32
  KEY_Meta_R                      =     65512 # : Int32
  KEY_MillSign                    =  16785573 # : Int32
  KEY_ModeLock                    = 269025025 # : Int32
  KEY_Mode_switch                 =     65406 # : Int32
  KEY_MonBrightnessDown           = 269025027 # : Int32
  KEY_MonBrightnessUp             = 269025026 # : Int32
  KEY_MouseKeys_Accel_Enable      =     65143 # : Int32
  KEY_MouseKeys_Enable            =     65142 # : Int32
  KEY_Muhenkan                    =     65314 # : Int32
  KEY_Multi_key                   =     65312 # : Int32
  KEY_MultipleCandidate           =     65341 # : Int32
  KEY_Music                       = 269025170 # : Int32
  KEY_MyComputer                  = 269025075 # : Int32
  KEY_MySites                     = 269025127 # : Int32
  KEY_N                           =        78 # : Int32
  KEY_Nacute                      =       465 # : Int32
  KEY_NairaSign                   =  16785574 # : Int32
  KEY_Ncaron                      =       466 # : Int32
  KEY_Ncedilla                    =       977 # : Int32
  KEY_New                         = 269025128 # : Int32
  KEY_NewSheqelSign               =  16785578 # : Int32
  KEY_News                        = 269025129 # : Int32
  KEY_Next                        =     65366 # : Int32
  KEY_Next_VMode                  = 269024802 # : Int32
  KEY_Next_Virtual_Screen         =     65234 # : Int32
  KEY_Ntilde                      =       209 # : Int32
  KEY_Num_Lock                    =     65407 # : Int32
  KEY_O                           =        79 # : Int32
  KEY_OE                          =      5052 # : Int32
  KEY_Oacute                      =       211 # : Int32
  KEY_Obarred                     =  16777631 # : Int32
  KEY_Obelowdot                   =  16785100 # : Int32
  KEY_Ocaron                      =  16777681 # : Int32
  KEY_Ocircumflex                 =       212 # : Int32
  KEY_Ocircumflexacute            =  16785104 # : Int32
  KEY_Ocircumflexbelowdot         =  16785112 # : Int32
  KEY_Ocircumflexgrave            =  16785106 # : Int32
  KEY_Ocircumflexhook             =  16785108 # : Int32
  KEY_Ocircumflextilde            =  16785110 # : Int32
  KEY_Odiaeresis                  =       214 # : Int32
  KEY_Odoubleacute                =       469 # : Int32
  KEY_OfficeHome                  = 269025130 # : Int32
  KEY_Ograve                      =       210 # : Int32
  KEY_Ohook                       =  16785102 # : Int32
  KEY_Ohorn                       =  16777632 # : Int32
  KEY_Ohornacute                  =  16785114 # : Int32
  KEY_Ohornbelowdot               =  16785122 # : Int32
  KEY_Ohorngrave                  =  16785116 # : Int32
  KEY_Ohornhook                   =  16785118 # : Int32
  KEY_Ohorntilde                  =  16785120 # : Int32
  KEY_Omacron                     =       978 # : Int32
  KEY_Ooblique                    =       216 # : Int32
  KEY_Open                        = 269025131 # : Int32
  KEY_OpenURL                     = 269025080 # : Int32
  KEY_Option                      = 269025132 # : Int32
  KEY_Oslash                      =       216 # : Int32
  KEY_Otilde                      =       213 # : Int32
  KEY_Overlay1_Enable             =     65144 # : Int32
  KEY_Overlay2_Enable             =     65145 # : Int32
  KEY_P                           =        80 # : Int32
  KEY_Pabovedot                   =  16784982 # : Int32
  KEY_Page_Down                   =     65366 # : Int32
  KEY_Page_Up                     =     65365 # : Int32
  KEY_Paste                       = 269025133 # : Int32
  KEY_Pause                       =     65299 # : Int32
  KEY_PesetaSign                  =  16785575 # : Int32
  KEY_Phone                       = 269025134 # : Int32
  KEY_Pictures                    = 269025169 # : Int32
  KEY_Pointer_Accelerate          =     65274 # : Int32
  KEY_Pointer_Button1             =     65257 # : Int32
  KEY_Pointer_Button2             =     65258 # : Int32
  KEY_Pointer_Button3             =     65259 # : Int32
  KEY_Pointer_Button4             =     65260 # : Int32
  KEY_Pointer_Button5             =     65261 # : Int32
  KEY_Pointer_Button_Dflt         =     65256 # : Int32
  KEY_Pointer_DblClick1           =     65263 # : Int32
  KEY_Pointer_DblClick2           =     65264 # : Int32
  KEY_Pointer_DblClick3           =     65265 # : Int32
  KEY_Pointer_DblClick4           =     65266 # : Int32
  KEY_Pointer_DblClick5           =     65267 # : Int32
  KEY_Pointer_DblClick_Dflt       =     65262 # : Int32
  KEY_Pointer_DfltBtnNext         =     65275 # : Int32
  KEY_Pointer_DfltBtnPrev         =     65276 # : Int32
  KEY_Pointer_Down                =     65251 # : Int32
  KEY_Pointer_DownLeft            =     65254 # : Int32
  KEY_Pointer_DownRight           =     65255 # : Int32
  KEY_Pointer_Drag1               =     65269 # : Int32
  KEY_Pointer_Drag2               =     65270 # : Int32
  KEY_Pointer_Drag3               =     65271 # : Int32
  KEY_Pointer_Drag4               =     65272 # : Int32
  KEY_Pointer_Drag5               =     65277 # : Int32
  KEY_Pointer_Drag_Dflt           =     65268 # : Int32
  KEY_Pointer_EnableKeys          =     65273 # : Int32
  KEY_Pointer_Left                =     65248 # : Int32
  KEY_Pointer_Right               =     65249 # : Int32
  KEY_Pointer_Up                  =     65250 # : Int32
  KEY_Pointer_UpLeft              =     65252 # : Int32
  KEY_Pointer_UpRight             =     65253 # : Int32
  KEY_PowerDown                   = 269025057 # : Int32
  KEY_PowerOff                    = 269025066 # : Int32
  KEY_Prev_VMode                  = 269024803 # : Int32
  KEY_Prev_Virtual_Screen         =     65233 # : Int32
  KEY_PreviousCandidate           =     65342 # : Int32
  KEY_Print                       =     65377 # : Int32
  KEY_Prior                       =     65365 # : Int32
  KEY_Q                           =        81 # : Int32
  KEY_R                           =        82 # : Int32
  KEY_R1                          =     65490 # : Int32
  KEY_R10                         =     65499 # : Int32
  KEY_R11                         =     65500 # : Int32
  KEY_R12                         =     65501 # : Int32
  KEY_R13                         =     65502 # : Int32
  KEY_R14                         =     65503 # : Int32
  KEY_R15                         =     65504 # : Int32
  KEY_R2                          =     65491 # : Int32
  KEY_R3                          =     65492 # : Int32
  KEY_R4                          =     65493 # : Int32
  KEY_R5                          =     65494 # : Int32
  KEY_R6                          =     65495 # : Int32
  KEY_R7                          =     65496 # : Int32
  KEY_R8                          =     65497 # : Int32
  KEY_R9                          =     65498 # : Int32
  KEY_Racute                      =       448 # : Int32
  KEY_Rcaron                      =       472 # : Int32
  KEY_Rcedilla                    =       931 # : Int32
  KEY_Red                         = 269025187 # : Int32
  KEY_Redo                        =     65382 # : Int32
  KEY_Refresh                     = 269025065 # : Int32
  KEY_Reload                      = 269025139 # : Int32
  KEY_RepeatKeys_Enable           =     65138 # : Int32
  KEY_Reply                       = 269025138 # : Int32
  KEY_Return                      =     65293 # : Int32
  KEY_Right                       =     65363 # : Int32
  KEY_RockerDown                  = 269025060 # : Int32
  KEY_RockerEnter                 = 269025061 # : Int32
  KEY_RockerUp                    = 269025059 # : Int32
  KEY_Romaji                      =     65316 # : Int32
  KEY_RotateWindows               = 269025140 # : Int32
  KEY_RotationKB                  = 269025142 # : Int32
  KEY_RotationPB                  = 269025141 # : Int32
  KEY_RupeeSign                   =  16785576 # : Int32
  KEY_S                           =        83 # : Int32
  KEY_SCHWA                       =  16777615 # : Int32
  KEY_Sabovedot                   =  16784992 # : Int32
  KEY_Sacute                      =       422 # : Int32
  KEY_Save                        = 269025143 # : Int32
  KEY_Scaron                      =       425 # : Int32
  KEY_Scedilla                    =       426 # : Int32
  KEY_Scircumflex                 =       734 # : Int32
  KEY_ScreenSaver                 = 269025069 # : Int32
  KEY_ScrollClick                 = 269025146 # : Int32
  KEY_ScrollDown                  = 269025145 # : Int32
  KEY_ScrollUp                    = 269025144 # : Int32
  KEY_Scroll_Lock                 =     65300 # : Int32
  KEY_Search                      = 269025051 # : Int32
  KEY_Select                      =     65376 # : Int32
  KEY_SelectButton                = 269025184 # : Int32
  KEY_Send                        = 269025147 # : Int32
  KEY_Serbian_DJE                 =      1713 # : Int32
  KEY_Serbian_DZE                 =      1727 # : Int32
  KEY_Serbian_JE                  =      1720 # : Int32
  KEY_Serbian_LJE                 =      1721 # : Int32
  KEY_Serbian_NJE                 =      1722 # : Int32
  KEY_Serbian_TSHE                =      1723 # : Int32
  KEY_Serbian_dje                 =      1697 # : Int32
  KEY_Serbian_dze                 =      1711 # : Int32
  KEY_Serbian_je                  =      1704 # : Int32
  KEY_Serbian_lje                 =      1705 # : Int32
  KEY_Serbian_nje                 =      1706 # : Int32
  KEY_Serbian_tshe                =      1707 # : Int32
  KEY_Shift_L                     =     65505 # : Int32
  KEY_Shift_Lock                  =     65510 # : Int32
  KEY_Shift_R                     =     65506 # : Int32
  KEY_Shop                        = 269025078 # : Int32
  KEY_SingleCandidate             =     65340 # : Int32
  KEY_Sinh_a                      =  16780677 # : Int32
  KEY_Sinh_aa                     =  16780678 # : Int32
  KEY_Sinh_aa2                    =  16780751 # : Int32
  KEY_Sinh_ae                     =  16780679 # : Int32
  KEY_Sinh_ae2                    =  16780752 # : Int32
  KEY_Sinh_aee                    =  16780680 # : Int32
  KEY_Sinh_aee2                   =  16780753 # : Int32
  KEY_Sinh_ai                     =  16780691 # : Int32
  KEY_Sinh_ai2                    =  16780763 # : Int32
  KEY_Sinh_al                     =  16780746 # : Int32
  KEY_Sinh_au                     =  16780694 # : Int32
  KEY_Sinh_au2                    =  16780766 # : Int32
  KEY_Sinh_ba                     =  16780726 # : Int32
  KEY_Sinh_bha                    =  16780727 # : Int32
  KEY_Sinh_ca                     =  16780704 # : Int32
  KEY_Sinh_cha                    =  16780705 # : Int32
  KEY_Sinh_dda                    =  16780713 # : Int32
  KEY_Sinh_ddha                   =  16780714 # : Int32
  KEY_Sinh_dha                    =  16780719 # : Int32
  KEY_Sinh_dhha                   =  16780720 # : Int32
  KEY_Sinh_e                      =  16780689 # : Int32
  KEY_Sinh_e2                     =  16780761 # : Int32
  KEY_Sinh_ee                     =  16780690 # : Int32
  KEY_Sinh_ee2                    =  16780762 # : Int32
  KEY_Sinh_fa                     =  16780742 # : Int32
  KEY_Sinh_ga                     =  16780700 # : Int32
  KEY_Sinh_gha                    =  16780701 # : Int32
  KEY_Sinh_h2                     =  16780675 # : Int32
  KEY_Sinh_ha                     =  16780740 # : Int32
  KEY_Sinh_i                      =  16780681 # : Int32
  KEY_Sinh_i2                     =  16780754 # : Int32
  KEY_Sinh_ii                     =  16780682 # : Int32
  KEY_Sinh_ii2                    =  16780755 # : Int32
  KEY_Sinh_ja                     =  16780706 # : Int32
  KEY_Sinh_jha                    =  16780707 # : Int32
  KEY_Sinh_jnya                   =  16780709 # : Int32
  KEY_Sinh_ka                     =  16780698 # : Int32
  KEY_Sinh_kha                    =  16780699 # : Int32
  KEY_Sinh_kunddaliya             =  16780788 # : Int32
  KEY_Sinh_la                     =  16780733 # : Int32
  KEY_Sinh_lla                    =  16780741 # : Int32
  KEY_Sinh_lu                     =  16780687 # : Int32
  KEY_Sinh_lu2                    =  16780767 # : Int32
  KEY_Sinh_luu                    =  16780688 # : Int32
  KEY_Sinh_luu2                   =  16780787 # : Int32
  KEY_Sinh_ma                     =  16780728 # : Int32
  KEY_Sinh_mba                    =  16780729 # : Int32
  KEY_Sinh_na                     =  16780721 # : Int32
  KEY_Sinh_ndda                   =  16780716 # : Int32
  KEY_Sinh_ndha                   =  16780723 # : Int32
  KEY_Sinh_ng                     =  16780674 # : Int32
  KEY_Sinh_ng2                    =  16780702 # : Int32
  KEY_Sinh_nga                    =  16780703 # : Int32
  KEY_Sinh_nja                    =  16780710 # : Int32
  KEY_Sinh_nna                    =  16780715 # : Int32
  KEY_Sinh_nya                    =  16780708 # : Int32
  KEY_Sinh_o                      =  16780692 # : Int32
  KEY_Sinh_o2                     =  16780764 # : Int32
  KEY_Sinh_oo                     =  16780693 # : Int32
  KEY_Sinh_oo2                    =  16780765 # : Int32
  KEY_Sinh_pa                     =  16780724 # : Int32
  KEY_Sinh_pha                    =  16780725 # : Int32
  KEY_Sinh_ra                     =  16780731 # : Int32
  KEY_Sinh_ri                     =  16780685 # : Int32
  KEY_Sinh_rii                    =  16780686 # : Int32
  KEY_Sinh_ru2                    =  16780760 # : Int32
  KEY_Sinh_ruu2                   =  16780786 # : Int32
  KEY_Sinh_sa                     =  16780739 # : Int32
  KEY_Sinh_sha                    =  16780737 # : Int32
  KEY_Sinh_ssha                   =  16780738 # : Int32
  KEY_Sinh_tha                    =  16780717 # : Int32
  KEY_Sinh_thha                   =  16780718 # : Int32
  KEY_Sinh_tta                    =  16780711 # : Int32
  KEY_Sinh_ttha                   =  16780712 # : Int32
  KEY_Sinh_u                      =  16780683 # : Int32
  KEY_Sinh_u2                     =  16780756 # : Int32
  KEY_Sinh_uu                     =  16780684 # : Int32
  KEY_Sinh_uu2                    =  16780758 # : Int32
  KEY_Sinh_va                     =  16780736 # : Int32
  KEY_Sinh_ya                     =  16780730 # : Int32
  KEY_Sleep                       = 269025071 # : Int32
  KEY_SlowKeys_Enable             =     65139 # : Int32
  KEY_Spell                       = 269025148 # : Int32
  KEY_SplitScreen                 = 269025149 # : Int32
  KEY_Standby                     = 269025040 # : Int32
  KEY_Start                       = 269025050 # : Int32
  KEY_StickyKeys_Enable           =     65141 # : Int32
  KEY_Stop                        = 269025064 # : Int32
  KEY_Subtitle                    = 269025178 # : Int32
  KEY_Super_L                     =     65515 # : Int32
  KEY_Super_R                     =     65516 # : Int32
  KEY_Support                     = 269025150 # : Int32
  KEY_Suspend                     = 269025191 # : Int32
  KEY_Switch_VT_1                 = 269024769 # : Int32
  KEY_Switch_VT_10                = 269024778 # : Int32
  KEY_Switch_VT_11                = 269024779 # : Int32
  KEY_Switch_VT_12                = 269024780 # : Int32
  KEY_Switch_VT_2                 = 269024770 # : Int32
  KEY_Switch_VT_3                 = 269024771 # : Int32
  KEY_Switch_VT_4                 = 269024772 # : Int32
  KEY_Switch_VT_5                 = 269024773 # : Int32
  KEY_Switch_VT_6                 = 269024774 # : Int32
  KEY_Switch_VT_7                 = 269024775 # : Int32
  KEY_Switch_VT_8                 = 269024776 # : Int32
  KEY_Switch_VT_9                 = 269024777 # : Int32
  KEY_Sys_Req                     =     65301 # : Int32
  KEY_T                           =        84 # : Int32
  KEY_THORN                       =       222 # : Int32
  KEY_Tab                         =     65289 # : Int32
  KEY_Tabovedot                   =  16785002 # : Int32
  KEY_TaskPane                    = 269025151 # : Int32
  KEY_Tcaron                      =       427 # : Int32
  KEY_Tcedilla                    =       478 # : Int32
  KEY_Terminal                    = 269025152 # : Int32
  KEY_Terminate_Server            =     65237 # : Int32
  KEY_Thai_baht                   =      3551 # : Int32
  KEY_Thai_bobaimai               =      3514 # : Int32
  KEY_Thai_chochan                =      3496 # : Int32
  KEY_Thai_chochang               =      3498 # : Int32
  KEY_Thai_choching               =      3497 # : Int32
  KEY_Thai_chochoe                =      3500 # : Int32
  KEY_Thai_dochada                =      3502 # : Int32
  KEY_Thai_dodek                  =      3508 # : Int32
  KEY_Thai_fofa                   =      3517 # : Int32
  KEY_Thai_fofan                  =      3519 # : Int32
  KEY_Thai_hohip                  =      3531 # : Int32
  KEY_Thai_honokhuk               =      3534 # : Int32
  KEY_Thai_khokhai                =      3490 # : Int32
  KEY_Thai_khokhon                =      3493 # : Int32
  KEY_Thai_khokhuat               =      3491 # : Int32
  KEY_Thai_khokhwai               =      3492 # : Int32
  KEY_Thai_khorakhang             =      3494 # : Int32
  KEY_Thai_kokai                  =      3489 # : Int32
  KEY_Thai_lakkhangyao            =      3557 # : Int32
  KEY_Thai_lekchet                =      3575 # : Int32
  KEY_Thai_lekha                  =      3573 # : Int32
  KEY_Thai_lekhok                 =      3574 # : Int32
  KEY_Thai_lekkao                 =      3577 # : Int32
  KEY_Thai_leknung                =      3569 # : Int32
  KEY_Thai_lekpaet                =      3576 # : Int32
  KEY_Thai_leksam                 =      3571 # : Int32
  KEY_Thai_leksi                  =      3572 # : Int32
  KEY_Thai_leksong                =      3570 # : Int32
  KEY_Thai_leksun                 =      3568 # : Int32
  KEY_Thai_lochula                =      3532 # : Int32
  KEY_Thai_loling                 =      3525 # : Int32
  KEY_Thai_lu                     =      3526 # : Int32
  KEY_Thai_maichattawa            =      3563 # : Int32
  KEY_Thai_maiek                  =      3560 # : Int32
  KEY_Thai_maihanakat             =      3537 # : Int32
  KEY_Thai_maihanakat_maitho      =      3550 # : Int32
  KEY_Thai_maitaikhu              =      3559 # : Int32
  KEY_Thai_maitho                 =      3561 # : Int32
  KEY_Thai_maitri                 =      3562 # : Int32
  KEY_Thai_maiyamok               =      3558 # : Int32
  KEY_Thai_moma                   =      3521 # : Int32
  KEY_Thai_ngongu                 =      3495 # : Int32
  KEY_Thai_nikhahit               =      3565 # : Int32
  KEY_Thai_nonen                  =      3507 # : Int32
  KEY_Thai_nonu                   =      3513 # : Int32
  KEY_Thai_oang                   =      3533 # : Int32
  KEY_Thai_paiyannoi              =      3535 # : Int32
  KEY_Thai_phinthu                =      3546 # : Int32
  KEY_Thai_phophan                =      3518 # : Int32
  KEY_Thai_phophung               =      3516 # : Int32
  KEY_Thai_phosamphao             =      3520 # : Int32
  KEY_Thai_popla                  =      3515 # : Int32
  KEY_Thai_rorua                  =      3523 # : Int32
  KEY_Thai_ru                     =      3524 # : Int32
  KEY_Thai_saraa                  =      3536 # : Int32
  KEY_Thai_saraaa                 =      3538 # : Int32
  KEY_Thai_saraae                 =      3553 # : Int32
  KEY_Thai_saraaimaimalai         =      3556 # : Int32
  KEY_Thai_saraaimaimuan          =      3555 # : Int32
  KEY_Thai_saraam                 =      3539 # : Int32
  KEY_Thai_sarae                  =      3552 # : Int32
  KEY_Thai_sarai                  =      3540 # : Int32
  KEY_Thai_saraii                 =      3541 # : Int32
  KEY_Thai_sarao                  =      3554 # : Int32
  KEY_Thai_sarau                  =      3544 # : Int32
  KEY_Thai_saraue                 =      3542 # : Int32
  KEY_Thai_sarauee                =      3543 # : Int32
  KEY_Thai_sarauu                 =      3545 # : Int32
  KEY_Thai_sorusi                 =      3529 # : Int32
  KEY_Thai_sosala                 =      3528 # : Int32
  KEY_Thai_soso                   =      3499 # : Int32
  KEY_Thai_sosua                  =      3530 # : Int32
  KEY_Thai_thanthakhat            =      3564 # : Int32
  KEY_Thai_thonangmontho          =      3505 # : Int32
  KEY_Thai_thophuthao             =      3506 # : Int32
  KEY_Thai_thothahan              =      3511 # : Int32
  KEY_Thai_thothan                =      3504 # : Int32
  KEY_Thai_thothong               =      3512 # : Int32
  KEY_Thai_thothung               =      3510 # : Int32
  KEY_Thai_topatak                =      3503 # : Int32
  KEY_Thai_totao                  =      3509 # : Int32
  KEY_Thai_wowaen                 =      3527 # : Int32
  KEY_Thai_yoyak                  =      3522 # : Int32
  KEY_Thai_yoying                 =      3501 # : Int32
  KEY_Thorn                       =       222 # : Int32
  KEY_Time                        = 269025183 # : Int32
  KEY_ToDoList                    = 269025055 # : Int32
  KEY_Tools                       = 269025153 # : Int32
  KEY_TopMenu                     = 269025186 # : Int32
  KEY_TouchpadOff                 = 269025201 # : Int32
  KEY_TouchpadOn                  = 269025200 # : Int32
  KEY_TouchpadToggle              = 269025193 # : Int32
  KEY_Touroku                     =     65323 # : Int32
  KEY_Travel                      = 269025154 # : Int32
  KEY_Tslash                      =       940 # : Int32
  KEY_U                           =        85 # : Int32
  KEY_UWB                         = 269025174 # : Int32
  KEY_Uacute                      =       218 # : Int32
  KEY_Ubelowdot                   =  16785124 # : Int32
  KEY_Ubreve                      =       733 # : Int32
  KEY_Ucircumflex                 =       219 # : Int32
  KEY_Udiaeresis                  =       220 # : Int32
  KEY_Udoubleacute                =       475 # : Int32
  KEY_Ugrave                      =       217 # : Int32
  KEY_Uhook                       =  16785126 # : Int32
  KEY_Uhorn                       =  16777647 # : Int32
  KEY_Uhornacute                  =  16785128 # : Int32
  KEY_Uhornbelowdot               =  16785136 # : Int32
  KEY_Uhorngrave                  =  16785130 # : Int32
  KEY_Uhornhook                   =  16785132 # : Int32
  KEY_Uhorntilde                  =  16785134 # : Int32
  KEY_Ukrainian_GHE_WITH_UPTURN   =      1725 # : Int32
  KEY_Ukrainian_I                 =      1718 # : Int32
  KEY_Ukrainian_IE                =      1716 # : Int32
  KEY_Ukrainian_YI                =      1719 # : Int32
  KEY_Ukrainian_ghe_with_upturn   =      1709 # : Int32
  KEY_Ukrainian_i                 =      1702 # : Int32
  KEY_Ukrainian_ie                =      1700 # : Int32
  KEY_Ukrainian_yi                =      1703 # : Int32
  KEY_Ukranian_I                  =      1718 # : Int32
  KEY_Ukranian_JE                 =      1716 # : Int32
  KEY_Ukranian_YI                 =      1719 # : Int32
  KEY_Ukranian_i                  =      1702 # : Int32
  KEY_Ukranian_je                 =      1700 # : Int32
  KEY_Ukranian_yi                 =      1703 # : Int32
  KEY_Umacron                     =       990 # : Int32
  KEY_Undo                        =     65381 # : Int32
  KEY_Ungrab                      = 269024800 # : Int32
  KEY_Uogonek                     =       985 # : Int32
  KEY_Up                          =     65362 # : Int32
  KEY_Uring                       =       473 # : Int32
  KEY_User1KB                     = 269025157 # : Int32
  KEY_User2KB                     = 269025158 # : Int32
  KEY_UserPB                      = 269025156 # : Int32
  KEY_Utilde                      =       989 # : Int32
  KEY_V                           =        86 # : Int32
  KEY_VendorHome                  = 269025076 # : Int32
  KEY_Video                       = 269025159 # : Int32
  KEY_View                        = 269025185 # : Int32
  KEY_VoidSymbol                  =  16777215 # : Int32
  KEY_W                           =        87 # : Int32
  KEY_WLAN                        = 269025173 # : Int32
  KEY_WWW                         = 269025070 # : Int32
  KEY_Wacute                      =  16785026 # : Int32
  KEY_WakeUp                      = 269025067 # : Int32
  KEY_Wcircumflex                 =  16777588 # : Int32
  KEY_Wdiaeresis                  =  16785028 # : Int32
  KEY_WebCam                      = 269025167 # : Int32
  KEY_Wgrave                      =  16785024 # : Int32
  KEY_WheelButton                 = 269025160 # : Int32
  KEY_WindowClear                 = 269025109 # : Int32
  KEY_WonSign                     =  16785577 # : Int32
  KEY_Word                        = 269025161 # : Int32
  KEY_X                           =        88 # : Int32
  KEY_Xabovedot                   =  16785034 # : Int32
  KEY_Xfer                        = 269025162 # : Int32
  KEY_Y                           =        89 # : Int32
  KEY_Yacute                      =       221 # : Int32
  KEY_Ybelowdot                   =  16785140 # : Int32
  KEY_Ycircumflex                 =  16777590 # : Int32
  KEY_Ydiaeresis                  =      5054 # : Int32
  KEY_Yellow                      = 269025189 # : Int32
  KEY_Ygrave                      =  16785138 # : Int32
  KEY_Yhook                       =  16785142 # : Int32
  KEY_Ytilde                      =  16785144 # : Int32
  KEY_Z                           =        90 # : Int32
  KEY_Zabovedot                   =       431 # : Int32
  KEY_Zacute                      =       428 # : Int32
  KEY_Zcaron                      =       430 # : Int32
  KEY_Zen_Koho                    =     65341 # : Int32
  KEY_Zenkaku                     =     65320 # : Int32
  KEY_Zenkaku_Hankaku             =     65322 # : Int32
  KEY_ZoomIn                      = 269025163 # : Int32
  KEY_ZoomOut                     = 269025164 # : Int32
  KEY_Zstroke                     =  16777653 # : Int32
  KEY_a                           =        97 # : Int32
  KEY_aacute                      =       225 # : Int32
  KEY_abelowdot                   =  16785057 # : Int32
  KEY_abovedot                    =       511 # : Int32
  KEY_abreve                      =       483 # : Int32
  KEY_abreveacute                 =  16785071 # : Int32
  KEY_abrevebelowdot              =  16785079 # : Int32
  KEY_abrevegrave                 =  16785073 # : Int32
  KEY_abrevehook                  =  16785075 # : Int32
  KEY_abrevetilde                 =  16785077 # : Int32
  KEY_acircumflex                 =       226 # : Int32
  KEY_acircumflexacute            =  16785061 # : Int32
  KEY_acircumflexbelowdot         =  16785069 # : Int32
  KEY_acircumflexgrave            =  16785063 # : Int32
  KEY_acircumflexhook             =  16785065 # : Int32
  KEY_acircumflextilde            =  16785067 # : Int32
  KEY_acute                       =       180 # : Int32
  KEY_adiaeresis                  =       228 # : Int32
  KEY_ae                          =       230 # : Int32
  KEY_agrave                      =       224 # : Int32
  KEY_ahook                       =  16785059 # : Int32
  KEY_amacron                     =       992 # : Int32
  KEY_ampersand                   =        38 # : Int32
  KEY_aogonek                     =       433 # : Int32
  KEY_apostrophe                  =        39 # : Int32
  KEY_approxeq                    =  16785992 # : Int32
  KEY_approximate                 =      2248 # : Int32
  KEY_aring                       =       229 # : Int32
  KEY_asciicircum                 =        94 # : Int32
  KEY_asciitilde                  =       126 # : Int32
  KEY_asterisk                    =        42 # : Int32
  KEY_at                          =        64 # : Int32
  KEY_atilde                      =       227 # : Int32
  KEY_b                           =        98 # : Int32
  KEY_babovedot                   =  16784899 # : Int32
  KEY_backslash                   =        92 # : Int32
  KEY_ballotcross                 =      2804 # : Int32
  KEY_bar                         =       124 # : Int32
  KEY_because                     =  16785973 # : Int32
  KEY_blank                       =      2527 # : Int32
  KEY_botintegral                 =      2213 # : Int32
  KEY_botleftparens               =      2220 # : Int32
  KEY_botleftsqbracket            =      2216 # : Int32
  KEY_botleftsummation            =      2226 # : Int32
  KEY_botrightparens              =      2222 # : Int32
  KEY_botrightsqbracket           =      2218 # : Int32
  KEY_botrightsummation           =      2230 # : Int32
  KEY_bott                        =      2550 # : Int32
  KEY_botvertsummationconnector   =      2228 # : Int32
  KEY_braceleft                   =       123 # : Int32
  KEY_braceright                  =       125 # : Int32
  KEY_bracketleft                 =        91 # : Int32
  KEY_bracketright                =        93 # : Int32
  KEY_braille_blank               =  16787456 # : Int32
  KEY_braille_dot_1               =     65521 # : Int32
  KEY_braille_dot_10              =     65530 # : Int32
  KEY_braille_dot_2               =     65522 # : Int32
  KEY_braille_dot_3               =     65523 # : Int32
  KEY_braille_dot_4               =     65524 # : Int32
  KEY_braille_dot_5               =     65525 # : Int32
  KEY_braille_dot_6               =     65526 # : Int32
  KEY_braille_dot_7               =     65527 # : Int32
  KEY_braille_dot_8               =     65528 # : Int32
  KEY_braille_dot_9               =     65529 # : Int32
  KEY_braille_dots_1              =  16787457 # : Int32
  KEY_braille_dots_12             =  16787459 # : Int32
  KEY_braille_dots_123            =  16787463 # : Int32
  KEY_braille_dots_1234           =  16787471 # : Int32
  KEY_braille_dots_12345          =  16787487 # : Int32
  KEY_braille_dots_123456         =  16787519 # : Int32
  KEY_braille_dots_1234567        =  16787583 # : Int32
  KEY_braille_dots_12345678       =  16787711 # : Int32
  KEY_braille_dots_1234568        =  16787647 # : Int32
  KEY_braille_dots_123457         =  16787551 # : Int32
  KEY_braille_dots_1234578        =  16787679 # : Int32
  KEY_braille_dots_123458         =  16787615 # : Int32
  KEY_braille_dots_12346          =  16787503 # : Int32
  KEY_braille_dots_123467         =  16787567 # : Int32
  KEY_braille_dots_1234678        =  16787695 # : Int32
  KEY_braille_dots_123468         =  16787631 # : Int32
  KEY_braille_dots_12347          =  16787535 # : Int32
  KEY_braille_dots_123478         =  16787663 # : Int32
  KEY_braille_dots_12348          =  16787599 # : Int32
  KEY_braille_dots_1235           =  16787479 # : Int32
  KEY_braille_dots_12356          =  16787511 # : Int32
  KEY_braille_dots_123567         =  16787575 # : Int32
  KEY_braille_dots_1235678        =  16787703 # : Int32
  KEY_braille_dots_123568         =  16787639 # : Int32
  KEY_braille_dots_12357          =  16787543 # : Int32
  KEY_braille_dots_123578         =  16787671 # : Int32
  KEY_braille_dots_12358          =  16787607 # : Int32
  KEY_braille_dots_1236           =  16787495 # : Int32
  KEY_braille_dots_12367          =  16787559 # : Int32
  KEY_braille_dots_123678         =  16787687 # : Int32
  KEY_braille_dots_12368          =  16787623 # : Int32
  KEY_braille_dots_1237           =  16787527 # : Int32
  KEY_braille_dots_12378          =  16787655 # : Int32
  KEY_braille_dots_1238           =  16787591 # : Int32
  KEY_braille_dots_124            =  16787467 # : Int32
  KEY_braille_dots_1245           =  16787483 # : Int32
  KEY_braille_dots_12456          =  16787515 # : Int32
  KEY_braille_dots_124567         =  16787579 # : Int32
  KEY_braille_dots_1245678        =  16787707 # : Int32
  KEY_braille_dots_124568         =  16787643 # : Int32
  KEY_braille_dots_12457          =  16787547 # : Int32
  KEY_braille_dots_124578         =  16787675 # : Int32
  KEY_braille_dots_12458          =  16787611 # : Int32
  KEY_braille_dots_1246           =  16787499 # : Int32
  KEY_braille_dots_12467          =  16787563 # : Int32
  KEY_braille_dots_124678         =  16787691 # : Int32
  KEY_braille_dots_12468          =  16787627 # : Int32
  KEY_braille_dots_1247           =  16787531 # : Int32
  KEY_braille_dots_12478          =  16787659 # : Int32
  KEY_braille_dots_1248           =  16787595 # : Int32
  KEY_braille_dots_125            =  16787475 # : Int32
  KEY_braille_dots_1256           =  16787507 # : Int32
  KEY_braille_dots_12567          =  16787571 # : Int32
  KEY_braille_dots_125678         =  16787699 # : Int32
  KEY_braille_dots_12568          =  16787635 # : Int32
  KEY_braille_dots_1257           =  16787539 # : Int32
  KEY_braille_dots_12578          =  16787667 # : Int32
  KEY_braille_dots_1258           =  16787603 # : Int32
  KEY_braille_dots_126            =  16787491 # : Int32
  KEY_braille_dots_1267           =  16787555 # : Int32
  KEY_braille_dots_12678          =  16787683 # : Int32
  KEY_braille_dots_1268           =  16787619 # : Int32
  KEY_braille_dots_127            =  16787523 # : Int32
  KEY_braille_dots_1278           =  16787651 # : Int32
  KEY_braille_dots_128            =  16787587 # : Int32
  KEY_braille_dots_13             =  16787461 # : Int32
  KEY_braille_dots_134            =  16787469 # : Int32
  KEY_braille_dots_1345           =  16787485 # : Int32
  KEY_braille_dots_13456          =  16787517 # : Int32
  KEY_braille_dots_134567         =  16787581 # : Int32
  KEY_braille_dots_1345678        =  16787709 # : Int32
  KEY_braille_dots_134568         =  16787645 # : Int32
  KEY_braille_dots_13457          =  16787549 # : Int32
  KEY_braille_dots_134578         =  16787677 # : Int32
  KEY_braille_dots_13458          =  16787613 # : Int32
  KEY_braille_dots_1346           =  16787501 # : Int32
  KEY_braille_dots_13467          =  16787565 # : Int32
  KEY_braille_dots_134678         =  16787693 # : Int32
  KEY_braille_dots_13468          =  16787629 # : Int32
  KEY_braille_dots_1347           =  16787533 # : Int32
  KEY_braille_dots_13478          =  16787661 # : Int32
  KEY_braille_dots_1348           =  16787597 # : Int32
  KEY_braille_dots_135            =  16787477 # : Int32
  KEY_braille_dots_1356           =  16787509 # : Int32
  KEY_braille_dots_13567          =  16787573 # : Int32
  KEY_braille_dots_135678         =  16787701 # : Int32
  KEY_braille_dots_13568          =  16787637 # : Int32
  KEY_braille_dots_1357           =  16787541 # : Int32
  KEY_braille_dots_13578          =  16787669 # : Int32
  KEY_braille_dots_1358           =  16787605 # : Int32
  KEY_braille_dots_136            =  16787493 # : Int32
  KEY_braille_dots_1367           =  16787557 # : Int32
  KEY_braille_dots_13678          =  16787685 # : Int32
  KEY_braille_dots_1368           =  16787621 # : Int32
  KEY_braille_dots_137            =  16787525 # : Int32
  KEY_braille_dots_1378           =  16787653 # : Int32
  KEY_braille_dots_138            =  16787589 # : Int32
  KEY_braille_dots_14             =  16787465 # : Int32
  KEY_braille_dots_145            =  16787481 # : Int32
  KEY_braille_dots_1456           =  16787513 # : Int32
  KEY_braille_dots_14567          =  16787577 # : Int32
  KEY_braille_dots_145678         =  16787705 # : Int32
  KEY_braille_dots_14568          =  16787641 # : Int32
  KEY_braille_dots_1457           =  16787545 # : Int32
  KEY_braille_dots_14578          =  16787673 # : Int32
  KEY_braille_dots_1458           =  16787609 # : Int32
  KEY_braille_dots_146            =  16787497 # : Int32
  KEY_braille_dots_1467           =  16787561 # : Int32
  KEY_braille_dots_14678          =  16787689 # : Int32
  KEY_braille_dots_1468           =  16787625 # : Int32
  KEY_braille_dots_147            =  16787529 # : Int32
  KEY_braille_dots_1478           =  16787657 # : Int32
  KEY_braille_dots_148            =  16787593 # : Int32
  KEY_braille_dots_15             =  16787473 # : Int32
  KEY_braille_dots_156            =  16787505 # : Int32
  KEY_braille_dots_1567           =  16787569 # : Int32
  KEY_braille_dots_15678          =  16787697 # : Int32
  KEY_braille_dots_1568           =  16787633 # : Int32
  KEY_braille_dots_157            =  16787537 # : Int32
  KEY_braille_dots_1578           =  16787665 # : Int32
  KEY_braille_dots_158            =  16787601 # : Int32
  KEY_braille_dots_16             =  16787489 # : Int32
  KEY_braille_dots_167            =  16787553 # : Int32
  KEY_braille_dots_1678           =  16787681 # : Int32
  KEY_braille_dots_168            =  16787617 # : Int32
  KEY_braille_dots_17             =  16787521 # : Int32
  KEY_braille_dots_178            =  16787649 # : Int32
  KEY_braille_dots_18             =  16787585 # : Int32
  KEY_braille_dots_2              =  16787458 # : Int32
  KEY_braille_dots_23             =  16787462 # : Int32
  KEY_braille_dots_234            =  16787470 # : Int32
  KEY_braille_dots_2345           =  16787486 # : Int32
  KEY_braille_dots_23456          =  16787518 # : Int32
  KEY_braille_dots_234567         =  16787582 # : Int32
  KEY_braille_dots_2345678        =  16787710 # : Int32
  KEY_braille_dots_234568         =  16787646 # : Int32
  KEY_braille_dots_23457          =  16787550 # : Int32
  KEY_braille_dots_234578         =  16787678 # : Int32
  KEY_braille_dots_23458          =  16787614 # : Int32
  KEY_braille_dots_2346           =  16787502 # : Int32
  KEY_braille_dots_23467          =  16787566 # : Int32
  KEY_braille_dots_234678         =  16787694 # : Int32
  KEY_braille_dots_23468          =  16787630 # : Int32
  KEY_braille_dots_2347           =  16787534 # : Int32
  KEY_braille_dots_23478          =  16787662 # : Int32
  KEY_braille_dots_2348           =  16787598 # : Int32
  KEY_braille_dots_235            =  16787478 # : Int32
  KEY_braille_dots_2356           =  16787510 # : Int32
  KEY_braille_dots_23567          =  16787574 # : Int32
  KEY_braille_dots_235678         =  16787702 # : Int32
  KEY_braille_dots_23568          =  16787638 # : Int32
  KEY_braille_dots_2357           =  16787542 # : Int32
  KEY_braille_dots_23578          =  16787670 # : Int32
  KEY_braille_dots_2358           =  16787606 # : Int32
  KEY_braille_dots_236            =  16787494 # : Int32
  KEY_braille_dots_2367           =  16787558 # : Int32
  KEY_braille_dots_23678          =  16787686 # : Int32
  KEY_braille_dots_2368           =  16787622 # : Int32
  KEY_braille_dots_237            =  16787526 # : Int32
  KEY_braille_dots_2378           =  16787654 # : Int32
  KEY_braille_dots_238            =  16787590 # : Int32
  KEY_braille_dots_24             =  16787466 # : Int32
  KEY_braille_dots_245            =  16787482 # : Int32
  KEY_braille_dots_2456           =  16787514 # : Int32
  KEY_braille_dots_24567          =  16787578 # : Int32
  KEY_braille_dots_245678         =  16787706 # : Int32
  KEY_braille_dots_24568          =  16787642 # : Int32
  KEY_braille_dots_2457           =  16787546 # : Int32
  KEY_braille_dots_24578          =  16787674 # : Int32
  KEY_braille_dots_2458           =  16787610 # : Int32
  KEY_braille_dots_246            =  16787498 # : Int32
  KEY_braille_dots_2467           =  16787562 # : Int32
  KEY_braille_dots_24678          =  16787690 # : Int32
  KEY_braille_dots_2468           =  16787626 # : Int32
  KEY_braille_dots_247            =  16787530 # : Int32
  KEY_braille_dots_2478           =  16787658 # : Int32
  KEY_braille_dots_248            =  16787594 # : Int32
  KEY_braille_dots_25             =  16787474 # : Int32
  KEY_braille_dots_256            =  16787506 # : Int32
  KEY_braille_dots_2567           =  16787570 # : Int32
  KEY_braille_dots_25678          =  16787698 # : Int32
  KEY_braille_dots_2568           =  16787634 # : Int32
  KEY_braille_dots_257            =  16787538 # : Int32
  KEY_braille_dots_2578           =  16787666 # : Int32
  KEY_braille_dots_258            =  16787602 # : Int32
  KEY_braille_dots_26             =  16787490 # : Int32
  KEY_braille_dots_267            =  16787554 # : Int32
  KEY_braille_dots_2678           =  16787682 # : Int32
  KEY_braille_dots_268            =  16787618 # : Int32
  KEY_braille_dots_27             =  16787522 # : Int32
  KEY_braille_dots_278            =  16787650 # : Int32
  KEY_braille_dots_28             =  16787586 # : Int32
  KEY_braille_dots_3              =  16787460 # : Int32
  KEY_braille_dots_34             =  16787468 # : Int32
  KEY_braille_dots_345            =  16787484 # : Int32
  KEY_braille_dots_3456           =  16787516 # : Int32
  KEY_braille_dots_34567          =  16787580 # : Int32
  KEY_braille_dots_345678         =  16787708 # : Int32
  KEY_braille_dots_34568          =  16787644 # : Int32
  KEY_braille_dots_3457           =  16787548 # : Int32
  KEY_braille_dots_34578          =  16787676 # : Int32
  KEY_braille_dots_3458           =  16787612 # : Int32
  KEY_braille_dots_346            =  16787500 # : Int32
  KEY_braille_dots_3467           =  16787564 # : Int32
  KEY_braille_dots_34678          =  16787692 # : Int32
  KEY_braille_dots_3468           =  16787628 # : Int32
  KEY_braille_dots_347            =  16787532 # : Int32
  KEY_braille_dots_3478           =  16787660 # : Int32
  KEY_braille_dots_348            =  16787596 # : Int32
  KEY_braille_dots_35             =  16787476 # : Int32
  KEY_braille_dots_356            =  16787508 # : Int32
  KEY_braille_dots_3567           =  16787572 # : Int32
  KEY_braille_dots_35678          =  16787700 # : Int32
  KEY_braille_dots_3568           =  16787636 # : Int32
  KEY_braille_dots_357            =  16787540 # : Int32
  KEY_braille_dots_3578           =  16787668 # : Int32
  KEY_braille_dots_358            =  16787604 # : Int32
  KEY_braille_dots_36             =  16787492 # : Int32
  KEY_braille_dots_367            =  16787556 # : Int32
  KEY_braille_dots_3678           =  16787684 # : Int32
  KEY_braille_dots_368            =  16787620 # : Int32
  KEY_braille_dots_37             =  16787524 # : Int32
  KEY_braille_dots_378            =  16787652 # : Int32
  KEY_braille_dots_38             =  16787588 # : Int32
  KEY_braille_dots_4              =  16787464 # : Int32
  KEY_braille_dots_45             =  16787480 # : Int32
  KEY_braille_dots_456            =  16787512 # : Int32
  KEY_braille_dots_4567           =  16787576 # : Int32
  KEY_braille_dots_45678          =  16787704 # : Int32
  KEY_braille_dots_4568           =  16787640 # : Int32
  KEY_braille_dots_457            =  16787544 # : Int32
  KEY_braille_dots_4578           =  16787672 # : Int32
  KEY_braille_dots_458            =  16787608 # : Int32
  KEY_braille_dots_46             =  16787496 # : Int32
  KEY_braille_dots_467            =  16787560 # : Int32
  KEY_braille_dots_4678           =  16787688 # : Int32
  KEY_braille_dots_468            =  16787624 # : Int32
  KEY_braille_dots_47             =  16787528 # : Int32
  KEY_braille_dots_478            =  16787656 # : Int32
  KEY_braille_dots_48             =  16787592 # : Int32
  KEY_braille_dots_5              =  16787472 # : Int32
  KEY_braille_dots_56             =  16787504 # : Int32
  KEY_braille_dots_567            =  16787568 # : Int32
  KEY_braille_dots_5678           =  16787696 # : Int32
  KEY_braille_dots_568            =  16787632 # : Int32
  KEY_braille_dots_57             =  16787536 # : Int32
  KEY_braille_dots_578            =  16787664 # : Int32
  KEY_braille_dots_58             =  16787600 # : Int32
  KEY_braille_dots_6              =  16787488 # : Int32
  KEY_braille_dots_67             =  16787552 # : Int32
  KEY_braille_dots_678            =  16787680 # : Int32
  KEY_braille_dots_68             =  16787616 # : Int32
  KEY_braille_dots_7              =  16787520 # : Int32
  KEY_braille_dots_78             =  16787648 # : Int32
  KEY_braille_dots_8              =  16787584 # : Int32
  KEY_breve                       =       418 # : Int32
  KEY_brokenbar                   =       166 # : Int32
  KEY_c                           =        99 # : Int32
  KEY_c_h                         =     65187 # : Int32
  KEY_cabovedot                   =       741 # : Int32
  KEY_cacute                      =       486 # : Int32
  KEY_careof                      =      2744 # : Int32
  KEY_caret                       =      2812 # : Int32
  KEY_caron                       =       439 # : Int32
  KEY_ccaron                      =       488 # : Int32
  KEY_ccedilla                    =       231 # : Int32
  KEY_ccircumflex                 =       742 # : Int32
  KEY_cedilla                     =       184 # : Int32
  KEY_cent                        =       162 # : Int32
  KEY_ch                          =     65184 # : Int32
  KEY_checkerboard                =      2529 # : Int32
  KEY_checkmark                   =      2803 # : Int32
  KEY_circle                      =      3023 # : Int32
  KEY_club                        =      2796 # : Int32
  KEY_colon                       =        58 # : Int32
  KEY_comma                       =        44 # : Int32
  KEY_containsas                  =  16785931 # : Int32
  KEY_copyright                   =       169 # : Int32
  KEY_cr                          =      2532 # : Int32
  KEY_crossinglines               =      2542 # : Int32
  KEY_cuberoot                    =  16785947 # : Int32
  KEY_currency                    =       164 # : Int32
  KEY_cursor                      =      2815 # : Int32
  KEY_d                           =       100 # : Int32
  KEY_dabovedot                   =  16784907 # : Int32
  KEY_dagger                      =      2801 # : Int32
  KEY_dcaron                      =       495 # : Int32
  KEY_dead_A                      =     65153 # : Int32
  KEY_dead_E                      =     65155 # : Int32
  KEY_dead_I                      =     65157 # : Int32
  KEY_dead_O                      =     65159 # : Int32
  KEY_dead_U                      =     65161 # : Int32
  KEY_dead_a                      =     65152 # : Int32
  KEY_dead_abovecomma             =     65124 # : Int32
  KEY_dead_abovedot               =     65110 # : Int32
  KEY_dead_abovereversedcomma     =     65125 # : Int32
  KEY_dead_abovering              =     65112 # : Int32
  KEY_dead_acute                  =     65105 # : Int32
  KEY_dead_belowbreve             =     65131 # : Int32
  KEY_dead_belowcircumflex        =     65129 # : Int32
  KEY_dead_belowcomma             =     65134 # : Int32
  KEY_dead_belowdiaeresis         =     65132 # : Int32
  KEY_dead_belowdot               =     65120 # : Int32
  KEY_dead_belowmacron            =     65128 # : Int32
  KEY_dead_belowring              =     65127 # : Int32
  KEY_dead_belowtilde             =     65130 # : Int32
  KEY_dead_breve                  =     65109 # : Int32
  KEY_dead_capital_schwa          =     65163 # : Int32
  KEY_dead_caron                  =     65114 # : Int32
  KEY_dead_cedilla                =     65115 # : Int32
  KEY_dead_circumflex             =     65106 # : Int32
  KEY_dead_currency               =     65135 # : Int32
  KEY_dead_dasia                  =     65125 # : Int32
  KEY_dead_diaeresis              =     65111 # : Int32
  KEY_dead_doubleacute            =     65113 # : Int32
  KEY_dead_doublegrave            =     65126 # : Int32
  KEY_dead_e                      =     65154 # : Int32
  KEY_dead_grave                  =     65104 # : Int32
  KEY_dead_greek                  =     65164 # : Int32
  KEY_dead_hook                   =     65121 # : Int32
  KEY_dead_horn                   =     65122 # : Int32
  KEY_dead_i                      =     65156 # : Int32
  KEY_dead_invertedbreve          =     65133 # : Int32
  KEY_dead_iota                   =     65117 # : Int32
  KEY_dead_macron                 =     65108 # : Int32
  KEY_dead_o                      =     65158 # : Int32
  KEY_dead_ogonek                 =     65116 # : Int32
  KEY_dead_perispomeni            =     65107 # : Int32
  KEY_dead_psili                  =     65124 # : Int32
  KEY_dead_semivoiced_sound       =     65119 # : Int32
  KEY_dead_small_schwa            =     65162 # : Int32
  KEY_dead_stroke                 =     65123 # : Int32
  KEY_dead_tilde                  =     65107 # : Int32
  KEY_dead_u                      =     65160 # : Int32
  KEY_dead_voiced_sound           =     65118 # : Int32
  KEY_decimalpoint                =      2749 # : Int32
  KEY_degree                      =       176 # : Int32
  KEY_diaeresis                   =       168 # : Int32
  KEY_diamond                     =      2797 # : Int32
  KEY_digitspace                  =      2725 # : Int32
  KEY_dintegral                   =  16785964 # : Int32
  KEY_division                    =       247 # : Int32
  KEY_dollar                      =        36 # : Int32
  KEY_doubbaselinedot             =      2735 # : Int32
  KEY_doubleacute                 =       445 # : Int32
  KEY_doubledagger                =      2802 # : Int32
  KEY_doublelowquotemark          =      2814 # : Int32
  KEY_downarrow                   =      2302 # : Int32
  KEY_downcaret                   =      2984 # : Int32
  KEY_downshoe                    =      3030 # : Int32
  KEY_downstile                   =      3012 # : Int32
  KEY_downtack                    =      3010 # : Int32
  KEY_dstroke                     =       496 # : Int32
  KEY_e                           =       101 # : Int32
  KEY_eabovedot                   =      1004 # : Int32
  KEY_eacute                      =       233 # : Int32
  KEY_ebelowdot                   =  16785081 # : Int32
  KEY_ecaron                      =       492 # : Int32
  KEY_ecircumflex                 =       234 # : Int32
  KEY_ecircumflexacute            =  16785087 # : Int32
  KEY_ecircumflexbelowdot         =  16785095 # : Int32
  KEY_ecircumflexgrave            =  16785089 # : Int32
  KEY_ecircumflexhook             =  16785091 # : Int32
  KEY_ecircumflextilde            =  16785093 # : Int32
  KEY_ediaeresis                  =       235 # : Int32
  KEY_egrave                      =       232 # : Int32
  KEY_ehook                       =  16785083 # : Int32
  KEY_eightsubscript              =  16785544 # : Int32
  KEY_eightsuperior               =  16785528 # : Int32
  KEY_elementof                   =  16785928 # : Int32
  KEY_ellipsis                    =      2734 # : Int32
  KEY_em3space                    =      2723 # : Int32
  KEY_em4space                    =      2724 # : Int32
  KEY_emacron                     =       954 # : Int32
  KEY_emdash                      =      2729 # : Int32
  KEY_emfilledcircle              =      2782 # : Int32
  KEY_emfilledrect                =      2783 # : Int32
  KEY_emopencircle                =      2766 # : Int32
  KEY_emopenrectangle             =      2767 # : Int32
  KEY_emptyset                    =  16785925 # : Int32
  KEY_emspace                     =      2721 # : Int32
  KEY_endash                      =      2730 # : Int32
  KEY_enfilledcircbullet          =      2790 # : Int32
  KEY_enfilledsqbullet            =      2791 # : Int32
  KEY_eng                         =       959 # : Int32
  KEY_enopencircbullet            =      2784 # : Int32
  KEY_enopensquarebullet          =      2785 # : Int32
  KEY_enspace                     =      2722 # : Int32
  KEY_eogonek                     =       490 # : Int32
  KEY_equal                       =        61 # : Int32
  KEY_eth                         =       240 # : Int32
  KEY_etilde                      =  16785085 # : Int32
  KEY_exclam                      =        33 # : Int32
  KEY_exclamdown                  =       161 # : Int32
  KEY_ezh                         =  16777874 # : Int32
  KEY_f                           =       102 # : Int32
  KEY_fabovedot                   =  16784927 # : Int32
  KEY_femalesymbol                =      2808 # : Int32
  KEY_ff                          =      2531 # : Int32
  KEY_figdash                     =      2747 # : Int32
  KEY_filledlefttribullet         =      2780 # : Int32
  KEY_filledrectbullet            =      2779 # : Int32
  KEY_filledrighttribullet        =      2781 # : Int32
  KEY_filledtribulletdown         =      2793 # : Int32
  KEY_filledtribulletup           =      2792 # : Int32
  KEY_fiveeighths                 =      2757 # : Int32
  KEY_fivesixths                  =      2743 # : Int32
  KEY_fivesubscript               =  16785541 # : Int32
  KEY_fivesuperior                =  16785525 # : Int32
  KEY_fourfifths                  =      2741 # : Int32
  KEY_foursubscript               =  16785540 # : Int32
  KEY_foursuperior                =  16785524 # : Int32
  KEY_fourthroot                  =  16785948 # : Int32
  KEY_function                    =      2294 # : Int32
  KEY_g                           =       103 # : Int32
  KEY_gabovedot                   =       757 # : Int32
  KEY_gbreve                      =       699 # : Int32
  KEY_gcaron                      =  16777703 # : Int32
  KEY_gcedilla                    =       955 # : Int32
  KEY_gcircumflex                 =       760 # : Int32
  KEY_grave                       =        96 # : Int32
  KEY_greater                     =        62 # : Int32
  KEY_greaterthanequal            =      2238 # : Int32
  KEY_guillemotleft               =       171 # : Int32
  KEY_guillemotright              =       187 # : Int32
  KEY_h                           =       104 # : Int32
  KEY_hairspace                   =      2728 # : Int32
  KEY_hcircumflex                 =       694 # : Int32
  KEY_heart                       =      2798 # : Int32
  KEY_hebrew_aleph                =      3296 # : Int32
  KEY_hebrew_ayin                 =      3314 # : Int32
  KEY_hebrew_bet                  =      3297 # : Int32
  KEY_hebrew_beth                 =      3297 # : Int32
  KEY_hebrew_chet                 =      3303 # : Int32
  KEY_hebrew_dalet                =      3299 # : Int32
  KEY_hebrew_daleth               =      3299 # : Int32
  KEY_hebrew_doublelowline        =      3295 # : Int32
  KEY_hebrew_finalkaph            =      3306 # : Int32
  KEY_hebrew_finalmem             =      3309 # : Int32
  KEY_hebrew_finalnun             =      3311 # : Int32
  KEY_hebrew_finalpe              =      3315 # : Int32
  KEY_hebrew_finalzade            =      3317 # : Int32
  KEY_hebrew_finalzadi            =      3317 # : Int32
  KEY_hebrew_gimel                =      3298 # : Int32
  KEY_hebrew_gimmel               =      3298 # : Int32
  KEY_hebrew_he                   =      3300 # : Int32
  KEY_hebrew_het                  =      3303 # : Int32
  KEY_hebrew_kaph                 =      3307 # : Int32
  KEY_hebrew_kuf                  =      3319 # : Int32
  KEY_hebrew_lamed                =      3308 # : Int32
  KEY_hebrew_mem                  =      3310 # : Int32
  KEY_hebrew_nun                  =      3312 # : Int32
  KEY_hebrew_pe                   =      3316 # : Int32
  KEY_hebrew_qoph                 =      3319 # : Int32
  KEY_hebrew_resh                 =      3320 # : Int32
  KEY_hebrew_samech               =      3313 # : Int32
  KEY_hebrew_samekh               =      3313 # : Int32
  KEY_hebrew_shin                 =      3321 # : Int32
  KEY_hebrew_taf                  =      3322 # : Int32
  KEY_hebrew_taw                  =      3322 # : Int32
  KEY_hebrew_tet                  =      3304 # : Int32
  KEY_hebrew_teth                 =      3304 # : Int32
  KEY_hebrew_waw                  =      3301 # : Int32
  KEY_hebrew_yod                  =      3305 # : Int32
  KEY_hebrew_zade                 =      3318 # : Int32
  KEY_hebrew_zadi                 =      3318 # : Int32
  KEY_hebrew_zain                 =      3302 # : Int32
  KEY_hebrew_zayin                =      3302 # : Int32
  KEY_hexagram                    =      2778 # : Int32
  KEY_horizconnector              =      2211 # : Int32
  KEY_horizlinescan1              =      2543 # : Int32
  KEY_horizlinescan3              =      2544 # : Int32
  KEY_horizlinescan5              =      2545 # : Int32
  KEY_horizlinescan7              =      2546 # : Int32
  KEY_horizlinescan9              =      2547 # : Int32
  KEY_hstroke                     =       689 # : Int32
  KEY_ht                          =      2530 # : Int32
  KEY_hyphen                      =       173 # : Int32
  KEY_i                           =       105 # : Int32
  KEY_iTouch                      = 269025120 # : Int32
  KEY_iacute                      =       237 # : Int32
  KEY_ibelowdot                   =  16785099 # : Int32
  KEY_ibreve                      =  16777517 # : Int32
  KEY_icircumflex                 =       238 # : Int32
  KEY_identical                   =      2255 # : Int32
  KEY_idiaeresis                  =       239 # : Int32
  KEY_idotless                    =       697 # : Int32
  KEY_ifonlyif                    =      2253 # : Int32
  KEY_igrave                      =       236 # : Int32
  KEY_ihook                       =  16785097 # : Int32
  KEY_imacron                     =      1007 # : Int32
  KEY_implies                     =      2254 # : Int32
  KEY_includedin                  =      2266 # : Int32
  KEY_includes                    =      2267 # : Int32
  KEY_infinity                    =      2242 # : Int32
  KEY_integral                    =      2239 # : Int32
  KEY_intersection                =      2268 # : Int32
  KEY_iogonek                     =       999 # : Int32
  KEY_itilde                      =       949 # : Int32
  KEY_j                           =       106 # : Int32
  KEY_jcircumflex                 =       700 # : Int32
  KEY_jot                         =      3018 # : Int32
  KEY_k                           =       107 # : Int32
  KEY_kana_A                      =      1201 # : Int32
  KEY_kana_CHI                    =      1217 # : Int32
  KEY_kana_E                      =      1204 # : Int32
  KEY_kana_FU                     =      1228 # : Int32
  KEY_kana_HA                     =      1226 # : Int32
  KEY_kana_HE                     =      1229 # : Int32
  KEY_kana_HI                     =      1227 # : Int32
  KEY_kana_HO                     =      1230 # : Int32
  KEY_kana_HU                     =      1228 # : Int32
  KEY_kana_I                      =      1202 # : Int32
  KEY_kana_KA                     =      1206 # : Int32
  KEY_kana_KE                     =      1209 # : Int32
  KEY_kana_KI                     =      1207 # : Int32
  KEY_kana_KO                     =      1210 # : Int32
  KEY_kana_KU                     =      1208 # : Int32
  KEY_kana_MA                     =      1231 # : Int32
  KEY_kana_ME                     =      1234 # : Int32
  KEY_kana_MI                     =      1232 # : Int32
  KEY_kana_MO                     =      1235 # : Int32
  KEY_kana_MU                     =      1233 # : Int32
  KEY_kana_N                      =      1245 # : Int32
  KEY_kana_NA                     =      1221 # : Int32
  KEY_kana_NE                     =      1224 # : Int32
  KEY_kana_NI                     =      1222 # : Int32
  KEY_kana_NO                     =      1225 # : Int32
  KEY_kana_NU                     =      1223 # : Int32
  KEY_kana_O                      =      1205 # : Int32
  KEY_kana_RA                     =      1239 # : Int32
  KEY_kana_RE                     =      1242 # : Int32
  KEY_kana_RI                     =      1240 # : Int32
  KEY_kana_RO                     =      1243 # : Int32
  KEY_kana_RU                     =      1241 # : Int32
  KEY_kana_SA                     =      1211 # : Int32
  KEY_kana_SE                     =      1214 # : Int32
  KEY_kana_SHI                    =      1212 # : Int32
  KEY_kana_SO                     =      1215 # : Int32
  KEY_kana_SU                     =      1213 # : Int32
  KEY_kana_TA                     =      1216 # : Int32
  KEY_kana_TE                     =      1219 # : Int32
  KEY_kana_TI                     =      1217 # : Int32
  KEY_kana_TO                     =      1220 # : Int32
  KEY_kana_TSU                    =      1218 # : Int32
  KEY_kana_TU                     =      1218 # : Int32
  KEY_kana_U                      =      1203 # : Int32
  KEY_kana_WA                     =      1244 # : Int32
  KEY_kana_WO                     =      1190 # : Int32
  KEY_kana_YA                     =      1236 # : Int32
  KEY_kana_YO                     =      1238 # : Int32
  KEY_kana_YU                     =      1237 # : Int32
  KEY_kana_a                      =      1191 # : Int32
  KEY_kana_closingbracket         =      1187 # : Int32
  KEY_kana_comma                  =      1188 # : Int32
  KEY_kana_conjunctive            =      1189 # : Int32
  KEY_kana_e                      =      1194 # : Int32
  KEY_kana_fullstop               =      1185 # : Int32
  KEY_kana_i                      =      1192 # : Int32
  KEY_kana_middledot              =      1189 # : Int32
  KEY_kana_o                      =      1195 # : Int32
  KEY_kana_openingbracket         =      1186 # : Int32
  KEY_kana_switch                 =     65406 # : Int32
  KEY_kana_tsu                    =      1199 # : Int32
  KEY_kana_tu                     =      1199 # : Int32
  KEY_kana_u                      =      1193 # : Int32
  KEY_kana_ya                     =      1196 # : Int32
  KEY_kana_yo                     =      1198 # : Int32
  KEY_kana_yu                     =      1197 # : Int32
  KEY_kappa                       =       930 # : Int32
  KEY_kcedilla                    =      1011 # : Int32
  KEY_kra                         =       930 # : Int32
  KEY_l                           =       108 # : Int32
  KEY_lacute                      =       485 # : Int32
  KEY_latincross                  =      2777 # : Int32
  KEY_lbelowdot                   =  16784951 # : Int32
  KEY_lcaron                      =       437 # : Int32
  KEY_lcedilla                    =       950 # : Int32
  KEY_leftanglebracket            =      2748 # : Int32
  KEY_leftarrow                   =      2299 # : Int32
  KEY_leftcaret                   =      2979 # : Int32
  KEY_leftdoublequotemark         =      2770 # : Int32
  KEY_leftmiddlecurlybrace        =      2223 # : Int32
  KEY_leftopentriangle            =      2764 # : Int32
  KEY_leftpointer                 =      2794 # : Int32
  KEY_leftradical                 =      2209 # : Int32
  KEY_leftshoe                    =      3034 # : Int32
  KEY_leftsinglequotemark         =      2768 # : Int32
  KEY_leftt                       =      2548 # : Int32
  KEY_lefttack                    =      3036 # : Int32
  KEY_less                        =        60 # : Int32
  KEY_lessthanequal               =      2236 # : Int32
  KEY_lf                          =      2533 # : Int32
  KEY_logicaland                  =      2270 # : Int32
  KEY_logicalor                   =      2271 # : Int32
  KEY_lowleftcorner               =      2541 # : Int32
  KEY_lowrightcorner              =      2538 # : Int32
  KEY_lstroke                     =       435 # : Int32
  KEY_m                           =       109 # : Int32
  KEY_mabovedot                   =  16784961 # : Int32
  KEY_macron                      =       175 # : Int32
  KEY_malesymbol                  =      2807 # : Int32
  KEY_maltesecross                =      2800 # : Int32
  KEY_marker                      =      2751 # : Int32
  KEY_masculine                   =       186 # : Int32
  KEY_minus                       =        45 # : Int32
  KEY_minutes                     =      2774 # : Int32
  KEY_mu                          =       181 # : Int32
  KEY_multiply                    =       215 # : Int32
  KEY_musicalflat                 =      2806 # : Int32
  KEY_musicalsharp                =      2805 # : Int32
  KEY_n                           =       110 # : Int32
  KEY_nabla                       =      2245 # : Int32
  KEY_nacute                      =       497 # : Int32
  KEY_ncaron                      =       498 # : Int32
  KEY_ncedilla                    =      1009 # : Int32
  KEY_ninesubscript               =  16785545 # : Int32
  KEY_ninesuperior                =  16785529 # : Int32
  KEY_nl                          =      2536 # : Int32
  KEY_nobreakspace                =       160 # : Int32
  KEY_notapproxeq                 =  16785991 # : Int32
  KEY_notelementof                =  16785929 # : Int32
  KEY_notequal                    =      2237 # : Int32
  KEY_notidentical                =  16786018 # : Int32
  KEY_notsign                     =       172 # : Int32
  KEY_ntilde                      =       241 # : Int32
  KEY_numbersign                  =        35 # : Int32
  KEY_numerosign                  =      1712 # : Int32
  KEY_o                           =       111 # : Int32
  KEY_oacute                      =       243 # : Int32
  KEY_obarred                     =  16777845 # : Int32
  KEY_obelowdot                   =  16785101 # : Int32
  KEY_ocaron                      =  16777682 # : Int32
  KEY_ocircumflex                 =       244 # : Int32
  KEY_ocircumflexacute            =  16785105 # : Int32
  KEY_ocircumflexbelowdot         =  16785113 # : Int32
  KEY_ocircumflexgrave            =  16785107 # : Int32
  KEY_ocircumflexhook             =  16785109 # : Int32
  KEY_ocircumflextilde            =  16785111 # : Int32
  KEY_odiaeresis                  =       246 # : Int32
  KEY_odoubleacute                =       501 # : Int32
  KEY_oe                          =      5053 # : Int32
  KEY_ogonek                      =       434 # : Int32
  KEY_ograve                      =       242 # : Int32
  KEY_ohook                       =  16785103 # : Int32
  KEY_ohorn                       =  16777633 # : Int32
  KEY_ohornacute                  =  16785115 # : Int32
  KEY_ohornbelowdot               =  16785123 # : Int32
  KEY_ohorngrave                  =  16785117 # : Int32
  KEY_ohornhook                   =  16785119 # : Int32
  KEY_ohorntilde                  =  16785121 # : Int32
  KEY_omacron                     =      1010 # : Int32
  KEY_oneeighth                   =      2755 # : Int32
  KEY_onefifth                    =      2738 # : Int32
  KEY_onehalf                     =       189 # : Int32
  KEY_onequarter                  =       188 # : Int32
  KEY_onesixth                    =      2742 # : Int32
  KEY_onesubscript                =  16785537 # : Int32
  KEY_onesuperior                 =       185 # : Int32
  KEY_onethird                    =      2736 # : Int32
  KEY_ooblique                    =       248 # : Int32
  KEY_openrectbullet              =      2786 # : Int32
  KEY_openstar                    =      2789 # : Int32
  KEY_opentribulletdown           =      2788 # : Int32
  KEY_opentribulletup             =      2787 # : Int32
  KEY_ordfeminine                 =       170 # : Int32
  KEY_oslash                      =       248 # : Int32
  KEY_otilde                      =       245 # : Int32
  KEY_overbar                     =      3008 # : Int32
  KEY_overline                    =      1150 # : Int32
  KEY_p                           =       112 # : Int32
  KEY_pabovedot                   =  16784983 # : Int32
  KEY_paragraph                   =       182 # : Int32
  KEY_parenleft                   =        40 # : Int32
  KEY_parenright                  =        41 # : Int32
  KEY_partdifferential            =  16785922 # : Int32
  KEY_partialderivative           =      2287 # : Int32
  KEY_percent                     =        37 # : Int32
  KEY_period                      =        46 # : Int32
  KEY_periodcentered              =       183 # : Int32
  KEY_permille                    =      2773 # : Int32
  KEY_phonographcopyright         =      2811 # : Int32
  KEY_plus                        =        43 # : Int32
  KEY_plusminus                   =       177 # : Int32
  KEY_prescription                =      2772 # : Int32
  KEY_prolongedsound              =      1200 # : Int32
  KEY_punctspace                  =      2726 # : Int32
  KEY_q                           =       113 # : Int32
  KEY_quad                        =      3020 # : Int32
  KEY_question                    =        63 # : Int32
  KEY_questiondown                =       191 # : Int32
  KEY_quotedbl                    =        34 # : Int32
  KEY_quoteleft                   =        96 # : Int32
  KEY_quoteright                  =        39 # : Int32
  KEY_r                           =       114 # : Int32
  KEY_racute                      =       480 # : Int32
  KEY_radical                     =      2262 # : Int32
  KEY_rcaron                      =       504 # : Int32
  KEY_rcedilla                    =       947 # : Int32
  KEY_registered                  =       174 # : Int32
  KEY_rightanglebracket           =      2750 # : Int32
  KEY_rightarrow                  =      2301 # : Int32
  KEY_rightcaret                  =      2982 # : Int32
  KEY_rightdoublequotemark        =      2771 # : Int32
  KEY_rightmiddlecurlybrace       =      2224 # : Int32
  KEY_rightmiddlesummation        =      2231 # : Int32
  KEY_rightopentriangle           =      2765 # : Int32
  KEY_rightpointer                =      2795 # : Int32
  KEY_rightshoe                   =      3032 # : Int32
  KEY_rightsinglequotemark        =      2769 # : Int32
  KEY_rightt                      =      2549 # : Int32
  KEY_righttack                   =      3068 # : Int32
  KEY_s                           =       115 # : Int32
  KEY_sabovedot                   =  16784993 # : Int32
  KEY_sacute                      =       438 # : Int32
  KEY_scaron                      =       441 # : Int32
  KEY_scedilla                    =       442 # : Int32
  KEY_schwa                       =  16777817 # : Int32
  KEY_scircumflex                 =       766 # : Int32
  KEY_script_switch               =     65406 # : Int32
  KEY_seconds                     =      2775 # : Int32
  KEY_section                     =       167 # : Int32
  KEY_semicolon                   =        59 # : Int32
  KEY_semivoicedsound             =      1247 # : Int32
  KEY_seveneighths                =      2758 # : Int32
  KEY_sevensubscript              =  16785543 # : Int32
  KEY_sevensuperior               =  16785527 # : Int32
  KEY_signaturemark               =      2762 # : Int32
  KEY_signifblank                 =      2732 # : Int32
  KEY_similarequal                =      2249 # : Int32
  KEY_singlelowquotemark          =      2813 # : Int32
  KEY_sixsubscript                =  16785542 # : Int32
  KEY_sixsuperior                 =  16785526 # : Int32
  KEY_slash                       =        47 # : Int32
  KEY_soliddiamond                =      2528 # : Int32
  KEY_space                       =        32 # : Int32
  KEY_squareroot                  =  16785946 # : Int32
  KEY_ssharp                      =       223 # : Int32
  KEY_sterling                    =       163 # : Int32
  KEY_stricteq                    =  16786019 # : Int32
  KEY_t                           =       116 # : Int32
  KEY_tabovedot                   =  16785003 # : Int32
  KEY_tcaron                      =       443 # : Int32
  KEY_tcedilla                    =       510 # : Int32
  KEY_telephone                   =      2809 # : Int32
  KEY_telephonerecorder           =      2810 # : Int32
  KEY_therefore                   =      2240 # : Int32
  KEY_thinspace                   =      2727 # : Int32
  KEY_thorn                       =       254 # : Int32
  KEY_threeeighths                =      2756 # : Int32
  KEY_threefifths                 =      2740 # : Int32
  KEY_threequarters               =       190 # : Int32
  KEY_threesubscript              =  16785539 # : Int32
  KEY_threesuperior               =       179 # : Int32
  KEY_tintegral                   =  16785965 # : Int32
  KEY_topintegral                 =      2212 # : Int32
  KEY_topleftparens               =      2219 # : Int32
  KEY_topleftradical              =      2210 # : Int32
  KEY_topleftsqbracket            =      2215 # : Int32
  KEY_topleftsummation            =      2225 # : Int32
  KEY_toprightparens              =      2221 # : Int32
  KEY_toprightsqbracket           =      2217 # : Int32
  KEY_toprightsummation           =      2229 # : Int32
  KEY_topt                        =      2551 # : Int32
  KEY_topvertsummationconnector   =      2227 # : Int32
  KEY_trademark                   =      2761 # : Int32
  KEY_trademarkincircle           =      2763 # : Int32
  KEY_tslash                      =       956 # : Int32
  KEY_twofifths                   =      2739 # : Int32
  KEY_twosubscript                =  16785538 # : Int32
  KEY_twosuperior                 =       178 # : Int32
  KEY_twothirds                   =      2737 # : Int32
  KEY_u                           =       117 # : Int32
  KEY_uacute                      =       250 # : Int32
  KEY_ubelowdot                   =  16785125 # : Int32
  KEY_ubreve                      =       765 # : Int32
  KEY_ucircumflex                 =       251 # : Int32
  KEY_udiaeresis                  =       252 # : Int32
  KEY_udoubleacute                =       507 # : Int32
  KEY_ugrave                      =       249 # : Int32
  KEY_uhook                       =  16785127 # : Int32
  KEY_uhorn                       =  16777648 # : Int32
  KEY_uhornacute                  =  16785129 # : Int32
  KEY_uhornbelowdot               =  16785137 # : Int32
  KEY_uhorngrave                  =  16785131 # : Int32
  KEY_uhornhook                   =  16785133 # : Int32
  KEY_uhorntilde                  =  16785135 # : Int32
  KEY_umacron                     =      1022 # : Int32
  KEY_underbar                    =      3014 # : Int32
  KEY_underscore                  =        95 # : Int32
  KEY_union                       =      2269 # : Int32
  KEY_uogonek                     =      1017 # : Int32
  KEY_uparrow                     =      2300 # : Int32
  KEY_upcaret                     =      2985 # : Int32
  KEY_upleftcorner                =      2540 # : Int32
  KEY_uprightcorner               =      2539 # : Int32
  KEY_upshoe                      =      3011 # : Int32
  KEY_upstile                     =      3027 # : Int32
  KEY_uptack                      =      3022 # : Int32
  KEY_uring                       =       505 # : Int32
  KEY_utilde                      =      1021 # : Int32
  KEY_v                           =       118 # : Int32
  KEY_variation                   =      2241 # : Int32
  KEY_vertbar                     =      2552 # : Int32
  KEY_vertconnector               =      2214 # : Int32
  KEY_voicedsound                 =      1246 # : Int32
  KEY_vt                          =      2537 # : Int32
  KEY_w                           =       119 # : Int32
  KEY_wacute                      =  16785027 # : Int32
  KEY_wcircumflex                 =  16777589 # : Int32
  KEY_wdiaeresis                  =  16785029 # : Int32
  KEY_wgrave                      =  16785025 # : Int32
  KEY_x                           =       120 # : Int32
  KEY_xabovedot                   =  16785035 # : Int32
  KEY_y                           =       121 # : Int32
  KEY_yacute                      =       253 # : Int32
  KEY_ybelowdot                   =  16785141 # : Int32
  KEY_ycircumflex                 =  16777591 # : Int32
  KEY_ydiaeresis                  =       255 # : Int32
  KEY_yen                         =       165 # : Int32
  KEY_ygrave                      =  16785139 # : Int32
  KEY_yhook                       =  16785143 # : Int32
  KEY_ytilde                      =  16785145 # : Int32
  KEY_z                           =       122 # : Int32
  KEY_zabovedot                   =       447 # : Int32
  KEY_zacute                      =       444 # : Int32
  KEY_zcaron                      =       446 # : Int32
  KEY_zerosubscript               =  16785536 # : Int32
  KEY_zerosuperior                =  16785520 # : Int32
  KEY_zstroke                     =  16777654 # : Int32
  MAJOR_VERSION                   =         3 # : Int32
  MAX_TIMECOORD_AXES              =       128 # : Int32
  MICRO_VERSION                   =        20 # : Int32
  MINOR_VERSION                   =        24 # : Int32
  PARENT_RELATIVE                 =         1 # : Int32
  PRIORITY_REDRAW                 =       120 # : Int32

  ###########################################
  # #    Interfaces
  ###########################################

  struct DevicePad # interface
    _data : UInt8[0]
    # Requires Device
  end

  fun _gdk_device_pad_get_type = gdk_device_pad_get_type : UInt64
  fun device_pad_get_feature_group = gdk_device_pad_get_feature_group(this : DevicePad*, feature : LibGdk::DevicePadFeature, feature_idx : Int32) : Int32
  fun device_pad_get_group_n_modes = gdk_device_pad_get_group_n_modes(this : DevicePad*, group_idx : Int32) : Int32
  fun device_pad_get_n_features = gdk_device_pad_get_n_features(this : DevicePad*, feature : LibGdk::DevicePadFeature) : Int32
  fun device_pad_get_n_groups = gdk_device_pad_get_n_groups(this : DevicePad*) : Int32

  ###########################################
  # #    Unions
  ###########################################

  union Event
    type : LibGdk::EventType
    any : LibGdk::EventAny
    expose : LibGdk::EventExpose
    visibility : LibGdk::EventVisibility
    motion : LibGdk::EventMotion
    button : LibGdk::EventButton
    touch : LibGdk::EventTouch
    scroll : LibGdk::EventScroll
    key : LibGdk::EventKey
    crossing : LibGdk::EventCrossing
    focus_change : LibGdk::EventFocus
    configure : LibGdk::EventConfigure
    property : LibGdk::EventProperty
    selection : LibGdk::EventSelection
    owner_change : LibGdk::EventOwnerChange
    proximity : LibGdk::EventProximity
    dnd : LibGdk::EventDND
    window_state : LibGdk::EventWindowState
    setting : LibGdk::EventSetting
    grab_broken : LibGdk::EventGrabBroken
    touchpad_swipe : LibGdk::EventTouchpadSwipe
    touchpad_pinch : LibGdk::EventTouchpadPinch
    pad_button : LibGdk::EventPadButton
    pad_axis : LibGdk::EventPadAxis
    pad_group_mode : LibGdk::EventPadGroupMode
  end

  fun event_new = gdk_event_new(type : LibGdk::EventType) : Pointer(LibGdk::Event)
  fun event_get_angle = gdk_events_get_angle(this : Event*, event2 : Pointer(LibGdk::Event), angle : Float64*) : LibC::Int
  fun event_get_center = gdk_events_get_center(this : Event*, event2 : Pointer(LibGdk::Event), x : Float64*, y : Float64*) : LibC::Int
  fun event_get_distance = gdk_events_get_distance(this : Event*, event2 : Pointer(LibGdk::Event), distance : Float64*) : LibC::Int
  fun event_copy = gdk_event_copy(this : Event*) : Pointer(LibGdk::Event)
  fun event_free = gdk_event_free(this : Event*) : Void
  fun event_get_axis = gdk_event_get_axis(this : Event*, axis_use : LibGdk::AxisUse, value : Float64*) : LibC::Int
  fun event_get_button = gdk_event_get_button(this : Event*, button : UInt32*) : LibC::Int
  fun event_get_click_count = gdk_event_get_click_count(this : Event*, click_count : UInt32*) : LibC::Int
  fun event_get_coords = gdk_event_get_coords(this : Event*, x_win : Float64*, y_win : Float64*) : LibC::Int
  fun event_get_device = gdk_event_get_device(this : Event*) : Pointer(LibGdk::Device)
  fun event_get_device_tool = gdk_event_get_device_tool(this : Event*) : Pointer(LibGdk::DeviceTool)
  fun event_get_event_sequence = gdk_event_get_event_sequence(this : Event*) : Pointer(LibGdk::EventSequence)
  fun event_get_event_type = gdk_event_get_event_type(this : Event*) : LibGdk::EventType
  fun event_get_keycode = gdk_event_get_keycode(this : Event*, keycode : UInt16*) : LibC::Int
  fun event_get_keyval = gdk_event_get_keyval(this : Event*, keyval : UInt32*) : LibC::Int
  fun event_get_pointer_emulated = gdk_event_get_pointer_emulated(this : Event*) : LibC::Int
  fun event_get_root_coords = gdk_event_get_root_coords(this : Event*, x_root : Float64*, y_root : Float64*) : LibC::Int
  fun event_get_scancode = gdk_event_get_scancode(this : Event*) : Int32
  fun event_get_screen = gdk_event_get_screen(this : Event*) : Pointer(LibGdk::Screen)
  fun event_get_scroll_deltas = gdk_event_get_scroll_deltas(this : Event*, delta_x : Float64*, delta_y : Float64*) : LibC::Int
  fun event_get_scroll_direction = gdk_event_get_scroll_direction(this : Event*, direction : LibGdk::ScrollDirection*) : LibC::Int
  fun event_get_seat = gdk_event_get_seat(this : Event*) : Pointer(LibGdk::Seat)
  fun event_get_source_device = gdk_event_get_source_device(this : Event*) : Pointer(LibGdk::Device)
  fun event_get_state = gdk_event_get_state(this : Event*, state : LibGdk::ModifierType*) : LibC::Int
  fun event_get_time = gdk_event_get_time(this : Event*) : UInt32
  fun event_get_window = gdk_event_get_window(this : Event*) : Pointer(LibGdk::Window)
  fun event_is_scroll_stop_event = gdk_event_is_scroll_stop_event(this : Event*) : LibC::Int
  fun event_put = gdk_event_put(this : Event*) : Void
  fun event_set_device = gdk_event_set_device(this : Event*, device : Pointer(LibGdk::Device)) : Void
  fun event_set_device_tool = gdk_event_set_device_tool(this : Event*, tool : Pointer(LibGdk::DeviceTool)) : Void
  fun event_set_screen = gdk_event_set_screen(this : Event*, screen : Pointer(LibGdk::Screen)) : Void
  fun event_set_source_device = gdk_event_set_source_device(this : Event*, device : Pointer(LibGdk::Device)) : Void
  fun event_triggers_context_menu = gdk_event_triggers_context_menu(this : Event*) : LibC::Int
  fun event_get = gdk_event_get : Pointer(LibGdk::Event)
  fun event_handler_set = gdk_event_handler_set(func : LibGdk::EventFunc, data : Pointer(Void), notify : LibGLib::DestroyNotify) : Void
  fun event_peek = gdk_event_peek : Pointer(LibGdk::Event)
  fun event_request_motions = gdk_event_request_motions(event : Pointer(LibGdk::EventMotion)) : Void

  ###########################################
  # #    Functions
  ###########################################
  fun add_option_entries_libgtk_only = gdk_add_option_entries_libgtk_only(group : Pointer(LibGLib::OptionGroup)) : Void
  fun atom_intern = gdk_atom_intern(atom_name : Pointer(UInt8), only_if_exists : LibC::Int) : Pointer(LibGdk::Atom)
  fun atom_intern_static_string = gdk_atom_intern_static_string(atom_name : Pointer(UInt8)) : Pointer(LibGdk::Atom)
  fun beep = gdk_beep : Void
  fun cairo_create = gdk_cairo_create(window : Pointer(LibGdk::Window)) : Pointer(LibCairo::Context)
  fun cairo_draw_from_gl = gdk_cairo_draw_from_gl(cr : Pointer(LibCairo::Context), window : Pointer(LibGdk::Window), source : Int32, source_type : Int32, buffer_scale : Int32, x : Int32, y : Int32, width : Int32, height : Int32) : Void
  fun cairo_get_clip_rectangle = gdk_cairo_get_clip_rectangle(cr : Pointer(LibCairo::Context), rect : LibGdk::Rectangle*) : LibC::Int
  fun cairo_get_drawing_context = gdk_cairo_get_drawing_context(cr : Pointer(LibCairo::Context)) : Pointer(LibGdk::DrawingContext)
  fun cairo_rectangle = gdk_cairo_rectangle(cr : Pointer(LibCairo::Context), rectangle : Pointer(LibGdk::Rectangle)) : Void
  fun cairo_region = gdk_cairo_region(cr : Pointer(LibCairo::Context), region : Pointer(LibCairo::Region)) : Void
  fun cairo_region_create_from_surface = gdk_cairo_region_create_from_surface(surface : Pointer(LibCairo::Surface)) : Pointer(LibCairo::Region)
  fun cairo_set_source_color = gdk_cairo_set_source_color(cr : Pointer(LibCairo::Context), color : Pointer(LibGdk::Color)) : Void
  fun cairo_set_source_pixbuf = gdk_cairo_set_source_pixbuf(cr : Pointer(LibCairo::Context), pixbuf : Pointer(LibGdkPixbuf::Pixbuf), pixbuf_x : Float64, pixbuf_y : Float64) : Void
  fun cairo_set_source_rgba = gdk_cairo_set_source_rgba(cr : Pointer(LibCairo::Context), rgba : Pointer(LibGdk::RGBA)) : Void
  fun cairo_set_source_window = gdk_cairo_set_source_window(cr : Pointer(LibCairo::Context), window : Pointer(LibGdk::Window), x : Float64, y : Float64) : Void
  fun cairo_surface_create_from_pixbuf = gdk_cairo_surface_create_from_pixbuf(pixbuf : Pointer(LibGdkPixbuf::Pixbuf), scale : Int32, for_window : Pointer(LibGdk::Window)) : Pointer(LibCairo::Surface)
  fun color_parse = gdk_color_parse(spec : Pointer(UInt8), color : LibGdk::Color*) : LibC::Int
  fun disable_multidevice = gdk_disable_multidevice : Void
  fun drag_abort = gdk_drag_abort(context : Pointer(LibGdk::DragContext), time_ : UInt32) : Void
  fun drag_begin = gdk_drag_begin(window : Pointer(LibGdk::Window), targets : Pointer(Void*)) : Pointer(LibGdk::DragContext)
  fun drag_begin_for_device = gdk_drag_begin_for_device(window : Pointer(LibGdk::Window), device : Pointer(LibGdk::Device), targets : Pointer(Void*)) : Pointer(LibGdk::DragContext)
  fun drag_begin_from_point = gdk_drag_begin_from_point(window : Pointer(LibGdk::Window), device : Pointer(LibGdk::Device), targets : Pointer(Void*), x_root : Int32, y_root : Int32) : Pointer(LibGdk::DragContext)
  fun drag_drop = gdk_drag_drop(context : Pointer(LibGdk::DragContext), time_ : UInt32) : Void
  fun drag_drop_done = gdk_drag_drop_done(context : Pointer(LibGdk::DragContext), success : LibC::Int) : Void
  fun drag_drop_succeeded = gdk_drag_drop_succeeded(context : Pointer(LibGdk::DragContext)) : LibC::Int
  fun drag_find_window_for_screen = gdk_drag_find_window_for_screen(context : Pointer(LibGdk::DragContext), drag_window : Pointer(LibGdk::Window), screen : Pointer(LibGdk::Screen), x_root : Int32, y_root : Int32, dest_window : Pointer(LibGdk::Window)*, protocol : LibGdk::DragProtocol*) : Void
  fun drag_get_selection = gdk_drag_get_selection(context : Pointer(LibGdk::DragContext)) : Pointer(LibGdk::Atom)
  fun drag_motion = gdk_drag_motion(context : Pointer(LibGdk::DragContext), dest_window : Pointer(LibGdk::Window), protocol : LibGdk::DragProtocol, x_root : Int32, y_root : Int32, suggested_action : LibGdk::DragAction, possible_actions : LibGdk::DragAction, time_ : UInt32) : LibC::Int
  fun drag_status = gdk_drag_status(context : Pointer(LibGdk::DragContext), action : LibGdk::DragAction, time_ : UInt32) : Void
  fun drop_finish = gdk_drop_finish(context : Pointer(LibGdk::DragContext), success : LibC::Int, time_ : UInt32) : Void
  fun drop_reply = gdk_drop_reply(context : Pointer(LibGdk::DragContext), accepted : LibC::Int, time_ : UInt32) : Void
  fun error_trap_pop = gdk_error_trap_pop : Int32
  fun error_trap_pop_ignored = gdk_error_trap_pop_ignored : Void
  fun error_trap_push = gdk_error_trap_push : Void
  fun event_get = gdk_event_get : Pointer(LibGdk::Event)
  fun event_handler_set = gdk_event_handler_set(func : LibGdk::EventFunc, data : Pointer(Void), notify : LibGLib::DestroyNotify) : Void
  fun event_peek = gdk_event_peek : Pointer(LibGdk::Event)
  fun event_request_motions = gdk_event_request_motions(event : Pointer(LibGdk::EventMotion)) : Void
  fun events_get_angle = gdk_events_get_angle(event1 : Pointer(LibGdk::Event), event2 : Pointer(LibGdk::Event), angle : Float64*) : LibC::Int
  fun events_get_center = gdk_events_get_center(event1 : Pointer(LibGdk::Event), event2 : Pointer(LibGdk::Event), x : Float64*, y : Float64*) : LibC::Int
  fun events_get_distance = gdk_events_get_distance(event1 : Pointer(LibGdk::Event), event2 : Pointer(LibGdk::Event), distance : Float64*) : LibC::Int
  fun events_pending = gdk_events_pending : LibC::Int
  fun flush = gdk_flush : Void
  fun get_default_root_window = gdk_get_default_root_window : Pointer(LibGdk::Window)
  fun get_display = gdk_get_display : Pointer(UInt8)
  fun get_display_arg_name = gdk_get_display_arg_name : Pointer(UInt8)
  fun get_program_class = gdk_get_program_class : Pointer(UInt8)
  fun get_show_events = gdk_get_show_events : LibC::Int
  fun gl_error_quark = gdk_gl_error_quark : UInt32
  fun init = gdk_init(argc : Int32*, argv : Pointer(Pointer(UInt8))*) : Void
  fun init_check = gdk_init_check(argc : Int32*, argv : Pointer(Pointer(UInt8))*) : LibC::Int
  fun keyboard_grab = gdk_keyboard_grab(window : Pointer(LibGdk::Window), owner_events : LibC::Int, time_ : UInt32) : LibGdk::GrabStatus
  fun keyboard_ungrab = gdk_keyboard_ungrab(time_ : UInt32) : Void
  fun keyval_convert_case = gdk_keyval_convert_case(symbol : UInt32, lower : UInt32*, upper : UInt32*) : Void
  fun keyval_from_name = gdk_keyval_from_name(keyval_name : Pointer(UInt8)) : UInt32
  fun keyval_is_lower = gdk_keyval_is_lower(keyval : UInt32) : LibC::Int
  fun keyval_is_upper = gdk_keyval_is_upper(keyval : UInt32) : LibC::Int
  fun keyval_name = gdk_keyval_name(keyval : UInt32) : Pointer(UInt8)
  fun keyval_to_lower = gdk_keyval_to_lower(keyval : UInt32) : UInt32
  fun keyval_to_unicode = gdk_keyval_to_unicode(keyval : UInt32) : UInt32
  fun keyval_to_upper = gdk_keyval_to_upper(keyval : UInt32) : UInt32
  fun list_visuals = gdk_list_visuals : Pointer(Void*)
  fun notify_startup_complete = gdk_notify_startup_complete : Void
  fun notify_startup_complete_with_id = gdk_notify_startup_complete_with_id(startup_id : Pointer(UInt8)) : Void
  fun offscreen_window_get_embedder = gdk_offscreen_window_get_embedder(window : Pointer(LibGdk::Window)) : Pointer(LibGdk::Window)
  fun offscreen_window_get_surface = gdk_offscreen_window_get_surface(window : Pointer(LibGdk::Window)) : Pointer(LibCairo::Surface)
  fun offscreen_window_set_embedder = gdk_offscreen_window_set_embedder(window : Pointer(LibGdk::Window), embedder : Pointer(LibGdk::Window)) : Void
  fun pango_context_get = gdk_pango_context_get : Pointer(LibPango::Context)
  fun pango_context_get_for_display = gdk_pango_context_get_for_display(display : Pointer(LibGdk::Display)) : Pointer(LibPango::Context)
  fun pango_context_get_for_screen = gdk_pango_context_get_for_screen(screen : Pointer(LibGdk::Screen)) : Pointer(LibPango::Context)
  fun parse_args = gdk_parse_args(argc : Int32*, argv : Pointer(Pointer(UInt8))*) : Void
  fun pixbuf_get_from_surface = gdk_pixbuf_get_from_surface(surface : Pointer(LibCairo::Surface), src_x : Int32, src_y : Int32, width : Int32, height : Int32) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_get_from_window = gdk_pixbuf_get_from_window(window : Pointer(LibGdk::Window), src_x : Int32, src_y : Int32, width : Int32, height : Int32) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pointer_grab = gdk_pointer_grab(window : Pointer(LibGdk::Window), owner_events : LibC::Int, event_mask : LibGdk::EventMask, confine_to : Pointer(LibGdk::Window), cursor : Pointer(LibGdk::Cursor), time_ : UInt32) : LibGdk::GrabStatus
  fun pointer_is_grabbed = gdk_pointer_is_grabbed : LibC::Int
  fun pointer_ungrab = gdk_pointer_ungrab(time_ : UInt32) : Void
  fun pre_parse_libgtk_only = gdk_pre_parse_libgtk_only : Void
  fun property_delete = gdk_property_delete(window : Pointer(LibGdk::Window), property : Pointer(LibGdk::Atom)) : Void
  fun property_get = gdk_property_get(window : Pointer(LibGdk::Window), property : Pointer(LibGdk::Atom), type : Pointer(LibGdk::Atom), offset : UInt64, length : UInt64, pdelete : Int32, actual_property_type : Pointer(LibGdk::Atom)*, actual_format : Int32*, actual_length : Int32*, data : Pointer(UInt8)*) : LibC::Int
  fun query_depths = gdk_query_depths(depths : Pointer(Int32)*, count : Int32*) : Void
  fun query_visual_types = gdk_query_visual_types(visual_types : Pointer(LibGdk::VisualType)*, count : Int32*) : Void
  fun selection_convert = gdk_selection_convert(requestor : Pointer(LibGdk::Window), selection : Pointer(LibGdk::Atom), target : Pointer(LibGdk::Atom), time_ : UInt32) : Void
  fun selection_owner_get = gdk_selection_owner_get(selection : Pointer(LibGdk::Atom)) : Pointer(LibGdk::Window)
  fun selection_owner_get_for_display = gdk_selection_owner_get_for_display(display : Pointer(LibGdk::Display), selection : Pointer(LibGdk::Atom)) : Pointer(LibGdk::Window)
  fun selection_owner_set = gdk_selection_owner_set(owner : Pointer(LibGdk::Window), selection : Pointer(LibGdk::Atom), time_ : UInt32, send_event : LibC::Int) : LibC::Int
  fun selection_owner_set_for_display = gdk_selection_owner_set_for_display(display : Pointer(LibGdk::Display), owner : Pointer(LibGdk::Window), selection : Pointer(LibGdk::Atom), time_ : UInt32, send_event : LibC::Int) : LibC::Int
  fun selection_send_notify = gdk_selection_send_notify(requestor : Pointer(LibGdk::Window), selection : Pointer(LibGdk::Atom), target : Pointer(LibGdk::Atom), property : Pointer(LibGdk::Atom), time_ : UInt32) : Void
  fun selection_send_notify_for_display = gdk_selection_send_notify_for_display(display : Pointer(LibGdk::Display), requestor : Pointer(LibGdk::Window), selection : Pointer(LibGdk::Atom), target : Pointer(LibGdk::Atom), property : Pointer(LibGdk::Atom), time_ : UInt32) : Void
  fun set_allowed_backends = gdk_set_allowed_backends(backends : Pointer(UInt8)) : Void
  fun set_double_click_time = gdk_set_double_click_time(msec : UInt32) : Void
  fun set_program_class = gdk_set_program_class(program_class : Pointer(UInt8)) : Void
  fun set_show_events = gdk_set_show_events(show_events : LibC::Int) : Void
  fun setting_get = gdk_setting_get(name : Pointer(UInt8), value : Pointer(LibGObject::Value)) : LibC::Int
  fun synthesize_window_state = gdk_synthesize_window_state(window : Pointer(LibGdk::Window), unset_flags : LibGdk::WindowState, set_flags : LibGdk::WindowState) : Void
  fun test_render_sync = gdk_test_render_sync(window : Pointer(LibGdk::Window)) : Void
  fun test_simulate_button = gdk_test_simulate_button(window : Pointer(LibGdk::Window), x : Int32, y : Int32, button : UInt32, modifiers : LibGdk::ModifierType, button_pressrelease : LibGdk::EventType) : LibC::Int
  fun test_simulate_key = gdk_test_simulate_key(window : Pointer(LibGdk::Window), x : Int32, y : Int32, keyval : UInt32, modifiers : LibGdk::ModifierType, key_pressrelease : LibGdk::EventType) : LibC::Int
  fun text_property_to_utf8_list_for_display = gdk_text_property_to_utf8_list_for_display(display : Pointer(LibGdk::Display), encoding : Pointer(LibGdk::Atom), format : Int32, text : Pointer(UInt8), length : Int32, list : Pointer(Pointer(UInt8))*) : Int32
  fun threads_add_idle = gdk_threads_add_idle_full(priority : Int32, function : LibGLib::SourceFunc, data : Pointer(Void), notify : LibGLib::DestroyNotify) : UInt32
  fun threads_add_timeout = gdk_threads_add_timeout_full(priority : Int32, interval : UInt32, function : LibGLib::SourceFunc, data : Pointer(Void), notify : LibGLib::DestroyNotify) : UInt32
  fun threads_add_timeout_seconds = gdk_threads_add_timeout_seconds_full(priority : Int32, interval : UInt32, function : LibGLib::SourceFunc, data : Pointer(Void), notify : LibGLib::DestroyNotify) : UInt32
  fun threads_enter = gdk_threads_enter : Void
  fun threads_init = gdk_threads_init : Void
  fun threads_leave = gdk_threads_leave : Void
  fun unicode_to_keyval = gdk_unicode_to_keyval(wc : UInt32) : UInt32
  fun utf8_to_string_target = gdk_utf8_to_string_target(str : Pointer(UInt8)) : Pointer(UInt8)

  ###########################################
  # #    Callbacks
  ###########################################
  alias EventFunc = Pointer(LibGdk::Event), Pointer(Void) -> Void
  alias FilterFunc = Pointer(Void), Pointer(LibGdk::Event), Pointer(Void) -> LibGdk::FilterReturn
  alias SeatGrabPrepareFunc = Pointer(LibGdk::Seat), Pointer(LibGdk::Window), Pointer(Void) -> Void
  alias WindowChildFunc = Pointer(LibGdk::Window), Pointer(Void) -> LibC::Int
  alias WindowInvalidateHandlerFunc = Pointer(LibGdk::Window), Pointer(LibCairo::Region) -> Void
end

module Gdk
  BUTTON_MIDDLE                   = LibGdk::BUTTON_MIDDLE
  BUTTON_PRIMARY                  = LibGdk::BUTTON_PRIMARY
  BUTTON_SECONDARY                = LibGdk::BUTTON_SECONDARY
  CURRENT_TIME                    = LibGdk::CURRENT_TIME
  EVENT_PROPAGATE                 = LibGdk::EVENT_PROPAGATE
  EVENT_STOP                      = LibGdk::EVENT_STOP
  KEY_0                           = LibGdk::KEY_0
  KEY_1                           = LibGdk::KEY_1
  KEY_2                           = LibGdk::KEY_2
  KEY_3                           = LibGdk::KEY_3
  KEY_3270_AltCursor              = LibGdk::KEY_3270_AltCursor
  KEY_3270_Attn                   = LibGdk::KEY_3270_Attn
  KEY_3270_BackTab                = LibGdk::KEY_3270_BackTab
  KEY_3270_ChangeScreen           = LibGdk::KEY_3270_ChangeScreen
  KEY_3270_Copy                   = LibGdk::KEY_3270_Copy
  KEY_3270_CursorBlink            = LibGdk::KEY_3270_CursorBlink
  KEY_3270_CursorSelect           = LibGdk::KEY_3270_CursorSelect
  KEY_3270_DeleteWord             = LibGdk::KEY_3270_DeleteWord
  KEY_3270_Duplicate              = LibGdk::KEY_3270_Duplicate
  KEY_3270_Enter                  = LibGdk::KEY_3270_Enter
  KEY_3270_EraseEOF               = LibGdk::KEY_3270_EraseEOF
  KEY_3270_EraseInput             = LibGdk::KEY_3270_EraseInput
  KEY_3270_ExSelect               = LibGdk::KEY_3270_ExSelect
  KEY_3270_FieldMark              = LibGdk::KEY_3270_FieldMark
  KEY_3270_Ident                  = LibGdk::KEY_3270_Ident
  KEY_3270_Jump                   = LibGdk::KEY_3270_Jump
  KEY_3270_KeyClick               = LibGdk::KEY_3270_KeyClick
  KEY_3270_Left2                  = LibGdk::KEY_3270_Left2
  KEY_3270_PA1                    = LibGdk::KEY_3270_PA1
  KEY_3270_PA2                    = LibGdk::KEY_3270_PA2
  KEY_3270_PA3                    = LibGdk::KEY_3270_PA3
  KEY_3270_Play                   = LibGdk::KEY_3270_Play
  KEY_3270_PrintScreen            = LibGdk::KEY_3270_PrintScreen
  KEY_3270_Quit                   = LibGdk::KEY_3270_Quit
  KEY_3270_Record                 = LibGdk::KEY_3270_Record
  KEY_3270_Reset                  = LibGdk::KEY_3270_Reset
  KEY_3270_Right2                 = LibGdk::KEY_3270_Right2
  KEY_3270_Rule                   = LibGdk::KEY_3270_Rule
  KEY_3270_Setup                  = LibGdk::KEY_3270_Setup
  KEY_3270_Test                   = LibGdk::KEY_3270_Test
  KEY_4                           = LibGdk::KEY_4
  KEY_5                           = LibGdk::KEY_5
  KEY_6                           = LibGdk::KEY_6
  KEY_7                           = LibGdk::KEY_7
  KEY_8                           = LibGdk::KEY_8
  KEY_9                           = LibGdk::KEY_9
  KEY_A                           = LibGdk::KEY_A
  KEY_AE                          = LibGdk::KEY_AE
  KEY_Aacute                      = LibGdk::KEY_Aacute
  KEY_Abelowdot                   = LibGdk::KEY_Abelowdot
  KEY_Abreve                      = LibGdk::KEY_Abreve
  KEY_Abreveacute                 = LibGdk::KEY_Abreveacute
  KEY_Abrevebelowdot              = LibGdk::KEY_Abrevebelowdot
  KEY_Abrevegrave                 = LibGdk::KEY_Abrevegrave
  KEY_Abrevehook                  = LibGdk::KEY_Abrevehook
  KEY_Abrevetilde                 = LibGdk::KEY_Abrevetilde
  KEY_AccessX_Enable              = LibGdk::KEY_AccessX_Enable
  KEY_AccessX_Feedback_Enable     = LibGdk::KEY_AccessX_Feedback_Enable
  KEY_Acircumflex                 = LibGdk::KEY_Acircumflex
  KEY_Acircumflexacute            = LibGdk::KEY_Acircumflexacute
  KEY_Acircumflexbelowdot         = LibGdk::KEY_Acircumflexbelowdot
  KEY_Acircumflexgrave            = LibGdk::KEY_Acircumflexgrave
  KEY_Acircumflexhook             = LibGdk::KEY_Acircumflexhook
  KEY_Acircumflextilde            = LibGdk::KEY_Acircumflextilde
  KEY_AddFavorite                 = LibGdk::KEY_AddFavorite
  KEY_Adiaeresis                  = LibGdk::KEY_Adiaeresis
  KEY_Agrave                      = LibGdk::KEY_Agrave
  KEY_Ahook                       = LibGdk::KEY_Ahook
  KEY_Alt_L                       = LibGdk::KEY_Alt_L
  KEY_Alt_R                       = LibGdk::KEY_Alt_R
  KEY_Amacron                     = LibGdk::KEY_Amacron
  KEY_Aogonek                     = LibGdk::KEY_Aogonek
  KEY_ApplicationLeft             = LibGdk::KEY_ApplicationLeft
  KEY_ApplicationRight            = LibGdk::KEY_ApplicationRight
  KEY_Arabic_0                    = LibGdk::KEY_Arabic_0
  KEY_Arabic_1                    = LibGdk::KEY_Arabic_1
  KEY_Arabic_2                    = LibGdk::KEY_Arabic_2
  KEY_Arabic_3                    = LibGdk::KEY_Arabic_3
  KEY_Arabic_4                    = LibGdk::KEY_Arabic_4
  KEY_Arabic_5                    = LibGdk::KEY_Arabic_5
  KEY_Arabic_6                    = LibGdk::KEY_Arabic_6
  KEY_Arabic_7                    = LibGdk::KEY_Arabic_7
  KEY_Arabic_8                    = LibGdk::KEY_Arabic_8
  KEY_Arabic_9                    = LibGdk::KEY_Arabic_9
  KEY_Arabic_ain                  = LibGdk::KEY_Arabic_ain
  KEY_Arabic_alef                 = LibGdk::KEY_Arabic_alef
  KEY_Arabic_alefmaksura          = LibGdk::KEY_Arabic_alefmaksura
  KEY_Arabic_beh                  = LibGdk::KEY_Arabic_beh
  KEY_Arabic_comma                = LibGdk::KEY_Arabic_comma
  KEY_Arabic_dad                  = LibGdk::KEY_Arabic_dad
  KEY_Arabic_dal                  = LibGdk::KEY_Arabic_dal
  KEY_Arabic_damma                = LibGdk::KEY_Arabic_damma
  KEY_Arabic_dammatan             = LibGdk::KEY_Arabic_dammatan
  KEY_Arabic_ddal                 = LibGdk::KEY_Arabic_ddal
  KEY_Arabic_farsi_yeh            = LibGdk::KEY_Arabic_farsi_yeh
  KEY_Arabic_fatha                = LibGdk::KEY_Arabic_fatha
  KEY_Arabic_fathatan             = LibGdk::KEY_Arabic_fathatan
  KEY_Arabic_feh                  = LibGdk::KEY_Arabic_feh
  KEY_Arabic_fullstop             = LibGdk::KEY_Arabic_fullstop
  KEY_Arabic_gaf                  = LibGdk::KEY_Arabic_gaf
  KEY_Arabic_ghain                = LibGdk::KEY_Arabic_ghain
  KEY_Arabic_ha                   = LibGdk::KEY_Arabic_ha
  KEY_Arabic_hah                  = LibGdk::KEY_Arabic_hah
  KEY_Arabic_hamza                = LibGdk::KEY_Arabic_hamza
  KEY_Arabic_hamza_above          = LibGdk::KEY_Arabic_hamza_above
  KEY_Arabic_hamza_below          = LibGdk::KEY_Arabic_hamza_below
  KEY_Arabic_hamzaonalef          = LibGdk::KEY_Arabic_hamzaonalef
  KEY_Arabic_hamzaonwaw           = LibGdk::KEY_Arabic_hamzaonwaw
  KEY_Arabic_hamzaonyeh           = LibGdk::KEY_Arabic_hamzaonyeh
  KEY_Arabic_hamzaunderalef       = LibGdk::KEY_Arabic_hamzaunderalef
  KEY_Arabic_heh                  = LibGdk::KEY_Arabic_heh
  KEY_Arabic_heh_doachashmee      = LibGdk::KEY_Arabic_heh_doachashmee
  KEY_Arabic_heh_goal             = LibGdk::KEY_Arabic_heh_goal
  KEY_Arabic_jeem                 = LibGdk::KEY_Arabic_jeem
  KEY_Arabic_jeh                  = LibGdk::KEY_Arabic_jeh
  KEY_Arabic_kaf                  = LibGdk::KEY_Arabic_kaf
  KEY_Arabic_kasra                = LibGdk::KEY_Arabic_kasra
  KEY_Arabic_kasratan             = LibGdk::KEY_Arabic_kasratan
  KEY_Arabic_keheh                = LibGdk::KEY_Arabic_keheh
  KEY_Arabic_khah                 = LibGdk::KEY_Arabic_khah
  KEY_Arabic_lam                  = LibGdk::KEY_Arabic_lam
  KEY_Arabic_madda_above          = LibGdk::KEY_Arabic_madda_above
  KEY_Arabic_maddaonalef          = LibGdk::KEY_Arabic_maddaonalef
  KEY_Arabic_meem                 = LibGdk::KEY_Arabic_meem
  KEY_Arabic_noon                 = LibGdk::KEY_Arabic_noon
  KEY_Arabic_noon_ghunna          = LibGdk::KEY_Arabic_noon_ghunna
  KEY_Arabic_peh                  = LibGdk::KEY_Arabic_peh
  KEY_Arabic_percent              = LibGdk::KEY_Arabic_percent
  KEY_Arabic_qaf                  = LibGdk::KEY_Arabic_qaf
  KEY_Arabic_question_mark        = LibGdk::KEY_Arabic_question_mark
  KEY_Arabic_ra                   = LibGdk::KEY_Arabic_ra
  KEY_Arabic_rreh                 = LibGdk::KEY_Arabic_rreh
  KEY_Arabic_sad                  = LibGdk::KEY_Arabic_sad
  KEY_Arabic_seen                 = LibGdk::KEY_Arabic_seen
  KEY_Arabic_semicolon            = LibGdk::KEY_Arabic_semicolon
  KEY_Arabic_shadda               = LibGdk::KEY_Arabic_shadda
  KEY_Arabic_sheen                = LibGdk::KEY_Arabic_sheen
  KEY_Arabic_sukun                = LibGdk::KEY_Arabic_sukun
  KEY_Arabic_superscript_alef     = LibGdk::KEY_Arabic_superscript_alef
  KEY_Arabic_switch               = LibGdk::KEY_Arabic_switch
  KEY_Arabic_tah                  = LibGdk::KEY_Arabic_tah
  KEY_Arabic_tatweel              = LibGdk::KEY_Arabic_tatweel
  KEY_Arabic_tcheh                = LibGdk::KEY_Arabic_tcheh
  KEY_Arabic_teh                  = LibGdk::KEY_Arabic_teh
  KEY_Arabic_tehmarbuta           = LibGdk::KEY_Arabic_tehmarbuta
  KEY_Arabic_thal                 = LibGdk::KEY_Arabic_thal
  KEY_Arabic_theh                 = LibGdk::KEY_Arabic_theh
  KEY_Arabic_tteh                 = LibGdk::KEY_Arabic_tteh
  KEY_Arabic_veh                  = LibGdk::KEY_Arabic_veh
  KEY_Arabic_waw                  = LibGdk::KEY_Arabic_waw
  KEY_Arabic_yeh                  = LibGdk::KEY_Arabic_yeh
  KEY_Arabic_yeh_baree            = LibGdk::KEY_Arabic_yeh_baree
  KEY_Arabic_zah                  = LibGdk::KEY_Arabic_zah
  KEY_Arabic_zain                 = LibGdk::KEY_Arabic_zain
  KEY_Aring                       = LibGdk::KEY_Aring
  KEY_Armenian_AT                 = LibGdk::KEY_Armenian_AT
  KEY_Armenian_AYB                = LibGdk::KEY_Armenian_AYB
  KEY_Armenian_BEN                = LibGdk::KEY_Armenian_BEN
  KEY_Armenian_CHA                = LibGdk::KEY_Armenian_CHA
  KEY_Armenian_DA                 = LibGdk::KEY_Armenian_DA
  KEY_Armenian_DZA                = LibGdk::KEY_Armenian_DZA
  KEY_Armenian_E                  = LibGdk::KEY_Armenian_E
  KEY_Armenian_FE                 = LibGdk::KEY_Armenian_FE
  KEY_Armenian_GHAT               = LibGdk::KEY_Armenian_GHAT
  KEY_Armenian_GIM                = LibGdk::KEY_Armenian_GIM
  KEY_Armenian_HI                 = LibGdk::KEY_Armenian_HI
  KEY_Armenian_HO                 = LibGdk::KEY_Armenian_HO
  KEY_Armenian_INI                = LibGdk::KEY_Armenian_INI
  KEY_Armenian_JE                 = LibGdk::KEY_Armenian_JE
  KEY_Armenian_KE                 = LibGdk::KEY_Armenian_KE
  KEY_Armenian_KEN                = LibGdk::KEY_Armenian_KEN
  KEY_Armenian_KHE                = LibGdk::KEY_Armenian_KHE
  KEY_Armenian_LYUN               = LibGdk::KEY_Armenian_LYUN
  KEY_Armenian_MEN                = LibGdk::KEY_Armenian_MEN
  KEY_Armenian_NU                 = LibGdk::KEY_Armenian_NU
  KEY_Armenian_O                  = LibGdk::KEY_Armenian_O
  KEY_Armenian_PE                 = LibGdk::KEY_Armenian_PE
  KEY_Armenian_PYUR               = LibGdk::KEY_Armenian_PYUR
  KEY_Armenian_RA                 = LibGdk::KEY_Armenian_RA
  KEY_Armenian_RE                 = LibGdk::KEY_Armenian_RE
  KEY_Armenian_SE                 = LibGdk::KEY_Armenian_SE
  KEY_Armenian_SHA                = LibGdk::KEY_Armenian_SHA
  KEY_Armenian_TCHE               = LibGdk::KEY_Armenian_TCHE
  KEY_Armenian_TO                 = LibGdk::KEY_Armenian_TO
  KEY_Armenian_TSA                = LibGdk::KEY_Armenian_TSA
  KEY_Armenian_TSO                = LibGdk::KEY_Armenian_TSO
  KEY_Armenian_TYUN               = LibGdk::KEY_Armenian_TYUN
  KEY_Armenian_VEV                = LibGdk::KEY_Armenian_VEV
  KEY_Armenian_VO                 = LibGdk::KEY_Armenian_VO
  KEY_Armenian_VYUN               = LibGdk::KEY_Armenian_VYUN
  KEY_Armenian_YECH               = LibGdk::KEY_Armenian_YECH
  KEY_Armenian_ZA                 = LibGdk::KEY_Armenian_ZA
  KEY_Armenian_ZHE                = LibGdk::KEY_Armenian_ZHE
  KEY_Armenian_accent             = LibGdk::KEY_Armenian_accent
  KEY_Armenian_amanak             = LibGdk::KEY_Armenian_amanak
  KEY_Armenian_apostrophe         = LibGdk::KEY_Armenian_apostrophe
  KEY_Armenian_at                 = LibGdk::KEY_Armenian_at
  KEY_Armenian_ayb                = LibGdk::KEY_Armenian_ayb
  KEY_Armenian_ben                = LibGdk::KEY_Armenian_ben
  KEY_Armenian_but                = LibGdk::KEY_Armenian_but
  KEY_Armenian_cha                = LibGdk::KEY_Armenian_cha
  KEY_Armenian_da                 = LibGdk::KEY_Armenian_da
  KEY_Armenian_dza                = LibGdk::KEY_Armenian_dza
  KEY_Armenian_e                  = LibGdk::KEY_Armenian_e
  KEY_Armenian_exclam             = LibGdk::KEY_Armenian_exclam
  KEY_Armenian_fe                 = LibGdk::KEY_Armenian_fe
  KEY_Armenian_full_stop          = LibGdk::KEY_Armenian_full_stop
  KEY_Armenian_ghat               = LibGdk::KEY_Armenian_ghat
  KEY_Armenian_gim                = LibGdk::KEY_Armenian_gim
  KEY_Armenian_hi                 = LibGdk::KEY_Armenian_hi
  KEY_Armenian_ho                 = LibGdk::KEY_Armenian_ho
  KEY_Armenian_hyphen             = LibGdk::KEY_Armenian_hyphen
  KEY_Armenian_ini                = LibGdk::KEY_Armenian_ini
  KEY_Armenian_je                 = LibGdk::KEY_Armenian_je
  KEY_Armenian_ke                 = LibGdk::KEY_Armenian_ke
  KEY_Armenian_ken                = LibGdk::KEY_Armenian_ken
  KEY_Armenian_khe                = LibGdk::KEY_Armenian_khe
  KEY_Armenian_ligature_ew        = LibGdk::KEY_Armenian_ligature_ew
  KEY_Armenian_lyun               = LibGdk::KEY_Armenian_lyun
  KEY_Armenian_men                = LibGdk::KEY_Armenian_men
  KEY_Armenian_nu                 = LibGdk::KEY_Armenian_nu
  KEY_Armenian_o                  = LibGdk::KEY_Armenian_o
  KEY_Armenian_paruyk             = LibGdk::KEY_Armenian_paruyk
  KEY_Armenian_pe                 = LibGdk::KEY_Armenian_pe
  KEY_Armenian_pyur               = LibGdk::KEY_Armenian_pyur
  KEY_Armenian_question           = LibGdk::KEY_Armenian_question
  KEY_Armenian_ra                 = LibGdk::KEY_Armenian_ra
  KEY_Armenian_re                 = LibGdk::KEY_Armenian_re
  KEY_Armenian_se                 = LibGdk::KEY_Armenian_se
  KEY_Armenian_separation_mark    = LibGdk::KEY_Armenian_separation_mark
  KEY_Armenian_sha                = LibGdk::KEY_Armenian_sha
  KEY_Armenian_shesht             = LibGdk::KEY_Armenian_shesht
  KEY_Armenian_tche               = LibGdk::KEY_Armenian_tche
  KEY_Armenian_to                 = LibGdk::KEY_Armenian_to
  KEY_Armenian_tsa                = LibGdk::KEY_Armenian_tsa
  KEY_Armenian_tso                = LibGdk::KEY_Armenian_tso
  KEY_Armenian_tyun               = LibGdk::KEY_Armenian_tyun
  KEY_Armenian_verjaket           = LibGdk::KEY_Armenian_verjaket
  KEY_Armenian_vev                = LibGdk::KEY_Armenian_vev
  KEY_Armenian_vo                 = LibGdk::KEY_Armenian_vo
  KEY_Armenian_vyun               = LibGdk::KEY_Armenian_vyun
  KEY_Armenian_yech               = LibGdk::KEY_Armenian_yech
  KEY_Armenian_yentamna           = LibGdk::KEY_Armenian_yentamna
  KEY_Armenian_za                 = LibGdk::KEY_Armenian_za
  KEY_Armenian_zhe                = LibGdk::KEY_Armenian_zhe
  KEY_Atilde                      = LibGdk::KEY_Atilde
  KEY_AudibleBell_Enable          = LibGdk::KEY_AudibleBell_Enable
  KEY_AudioCycleTrack             = LibGdk::KEY_AudioCycleTrack
  KEY_AudioForward                = LibGdk::KEY_AudioForward
  KEY_AudioLowerVolume            = LibGdk::KEY_AudioLowerVolume
  KEY_AudioMedia                  = LibGdk::KEY_AudioMedia
  KEY_AudioMicMute                = LibGdk::KEY_AudioMicMute
  KEY_AudioMute                   = LibGdk::KEY_AudioMute
  KEY_AudioNext                   = LibGdk::KEY_AudioNext
  KEY_AudioPause                  = LibGdk::KEY_AudioPause
  KEY_AudioPlay                   = LibGdk::KEY_AudioPlay
  KEY_AudioPrev                   = LibGdk::KEY_AudioPrev
  KEY_AudioRaiseVolume            = LibGdk::KEY_AudioRaiseVolume
  KEY_AudioRandomPlay             = LibGdk::KEY_AudioRandomPlay
  KEY_AudioRecord                 = LibGdk::KEY_AudioRecord
  KEY_AudioRepeat                 = LibGdk::KEY_AudioRepeat
  KEY_AudioRewind                 = LibGdk::KEY_AudioRewind
  KEY_AudioStop                   = LibGdk::KEY_AudioStop
  KEY_Away                        = LibGdk::KEY_Away
  KEY_B                           = LibGdk::KEY_B
  KEY_Babovedot                   = LibGdk::KEY_Babovedot
  KEY_Back                        = LibGdk::KEY_Back
  KEY_BackForward                 = LibGdk::KEY_BackForward
  KEY_BackSpace                   = LibGdk::KEY_BackSpace
  KEY_Battery                     = LibGdk::KEY_Battery
  KEY_Begin                       = LibGdk::KEY_Begin
  KEY_Blue                        = LibGdk::KEY_Blue
  KEY_Bluetooth                   = LibGdk::KEY_Bluetooth
  KEY_Book                        = LibGdk::KEY_Book
  KEY_BounceKeys_Enable           = LibGdk::KEY_BounceKeys_Enable
  KEY_Break                       = LibGdk::KEY_Break
  KEY_BrightnessAdjust            = LibGdk::KEY_BrightnessAdjust
  KEY_Byelorussian_SHORTU         = LibGdk::KEY_Byelorussian_SHORTU
  KEY_Byelorussian_shortu         = LibGdk::KEY_Byelorussian_shortu
  KEY_C                           = LibGdk::KEY_C
  KEY_CD                          = LibGdk::KEY_CD
  KEY_CH                          = LibGdk::KEY_CH
  KEY_C_H                         = LibGdk::KEY_C_H
  KEY_C_h                         = LibGdk::KEY_C_h
  KEY_Cabovedot                   = LibGdk::KEY_Cabovedot
  KEY_Cacute                      = LibGdk::KEY_Cacute
  KEY_Calculator                  = LibGdk::KEY_Calculator
  KEY_Calendar                    = LibGdk::KEY_Calendar
  KEY_Cancel                      = LibGdk::KEY_Cancel
  KEY_Caps_Lock                   = LibGdk::KEY_Caps_Lock
  KEY_Ccaron                      = LibGdk::KEY_Ccaron
  KEY_Ccedilla                    = LibGdk::KEY_Ccedilla
  KEY_Ccircumflex                 = LibGdk::KEY_Ccircumflex
  KEY_Ch                          = LibGdk::KEY_Ch
  KEY_Clear                       = LibGdk::KEY_Clear
  KEY_ClearGrab                   = LibGdk::KEY_ClearGrab
  KEY_Close                       = LibGdk::KEY_Close
  KEY_Codeinput                   = LibGdk::KEY_Codeinput
  KEY_ColonSign                   = LibGdk::KEY_ColonSign
  KEY_Community                   = LibGdk::KEY_Community
  KEY_ContrastAdjust              = LibGdk::KEY_ContrastAdjust
  KEY_Control_L                   = LibGdk::KEY_Control_L
  KEY_Control_R                   = LibGdk::KEY_Control_R
  KEY_Copy                        = LibGdk::KEY_Copy
  KEY_CruzeiroSign                = LibGdk::KEY_CruzeiroSign
  KEY_Cut                         = LibGdk::KEY_Cut
  KEY_CycleAngle                  = LibGdk::KEY_CycleAngle
  KEY_Cyrillic_A                  = LibGdk::KEY_Cyrillic_A
  KEY_Cyrillic_BE                 = LibGdk::KEY_Cyrillic_BE
  KEY_Cyrillic_CHE                = LibGdk::KEY_Cyrillic_CHE
  KEY_Cyrillic_CHE_descender      = LibGdk::KEY_Cyrillic_CHE_descender
  KEY_Cyrillic_CHE_vertstroke     = LibGdk::KEY_Cyrillic_CHE_vertstroke
  KEY_Cyrillic_DE                 = LibGdk::KEY_Cyrillic_DE
  KEY_Cyrillic_DZHE               = LibGdk::KEY_Cyrillic_DZHE
  KEY_Cyrillic_E                  = LibGdk::KEY_Cyrillic_E
  KEY_Cyrillic_EF                 = LibGdk::KEY_Cyrillic_EF
  KEY_Cyrillic_EL                 = LibGdk::KEY_Cyrillic_EL
  KEY_Cyrillic_EM                 = LibGdk::KEY_Cyrillic_EM
  KEY_Cyrillic_EN                 = LibGdk::KEY_Cyrillic_EN
  KEY_Cyrillic_EN_descender       = LibGdk::KEY_Cyrillic_EN_descender
  KEY_Cyrillic_ER                 = LibGdk::KEY_Cyrillic_ER
  KEY_Cyrillic_ES                 = LibGdk::KEY_Cyrillic_ES
  KEY_Cyrillic_GHE                = LibGdk::KEY_Cyrillic_GHE
  KEY_Cyrillic_GHE_bar            = LibGdk::KEY_Cyrillic_GHE_bar
  KEY_Cyrillic_HA                 = LibGdk::KEY_Cyrillic_HA
  KEY_Cyrillic_HARDSIGN           = LibGdk::KEY_Cyrillic_HARDSIGN
  KEY_Cyrillic_HA_descender       = LibGdk::KEY_Cyrillic_HA_descender
  KEY_Cyrillic_I                  = LibGdk::KEY_Cyrillic_I
  KEY_Cyrillic_IE                 = LibGdk::KEY_Cyrillic_IE
  KEY_Cyrillic_IO                 = LibGdk::KEY_Cyrillic_IO
  KEY_Cyrillic_I_macron           = LibGdk::KEY_Cyrillic_I_macron
  KEY_Cyrillic_JE                 = LibGdk::KEY_Cyrillic_JE
  KEY_Cyrillic_KA                 = LibGdk::KEY_Cyrillic_KA
  KEY_Cyrillic_KA_descender       = LibGdk::KEY_Cyrillic_KA_descender
  KEY_Cyrillic_KA_vertstroke      = LibGdk::KEY_Cyrillic_KA_vertstroke
  KEY_Cyrillic_LJE                = LibGdk::KEY_Cyrillic_LJE
  KEY_Cyrillic_NJE                = LibGdk::KEY_Cyrillic_NJE
  KEY_Cyrillic_O                  = LibGdk::KEY_Cyrillic_O
  KEY_Cyrillic_O_bar              = LibGdk::KEY_Cyrillic_O_bar
  KEY_Cyrillic_PE                 = LibGdk::KEY_Cyrillic_PE
  KEY_Cyrillic_SCHWA              = LibGdk::KEY_Cyrillic_SCHWA
  KEY_Cyrillic_SHA                = LibGdk::KEY_Cyrillic_SHA
  KEY_Cyrillic_SHCHA              = LibGdk::KEY_Cyrillic_SHCHA
  KEY_Cyrillic_SHHA               = LibGdk::KEY_Cyrillic_SHHA
  KEY_Cyrillic_SHORTI             = LibGdk::KEY_Cyrillic_SHORTI
  KEY_Cyrillic_SOFTSIGN           = LibGdk::KEY_Cyrillic_SOFTSIGN
  KEY_Cyrillic_TE                 = LibGdk::KEY_Cyrillic_TE
  KEY_Cyrillic_TSE                = LibGdk::KEY_Cyrillic_TSE
  KEY_Cyrillic_U                  = LibGdk::KEY_Cyrillic_U
  KEY_Cyrillic_U_macron           = LibGdk::KEY_Cyrillic_U_macron
  KEY_Cyrillic_U_straight         = LibGdk::KEY_Cyrillic_U_straight
  KEY_Cyrillic_U_straight_bar     = LibGdk::KEY_Cyrillic_U_straight_bar
  KEY_Cyrillic_VE                 = LibGdk::KEY_Cyrillic_VE
  KEY_Cyrillic_YA                 = LibGdk::KEY_Cyrillic_YA
  KEY_Cyrillic_YERU               = LibGdk::KEY_Cyrillic_YERU
  KEY_Cyrillic_YU                 = LibGdk::KEY_Cyrillic_YU
  KEY_Cyrillic_ZE                 = LibGdk::KEY_Cyrillic_ZE
  KEY_Cyrillic_ZHE                = LibGdk::KEY_Cyrillic_ZHE
  KEY_Cyrillic_ZHE_descender      = LibGdk::KEY_Cyrillic_ZHE_descender
  KEY_Cyrillic_a                  = LibGdk::KEY_Cyrillic_a
  KEY_Cyrillic_be                 = LibGdk::KEY_Cyrillic_be
  KEY_Cyrillic_che                = LibGdk::KEY_Cyrillic_che
  KEY_Cyrillic_che_descender      = LibGdk::KEY_Cyrillic_che_descender
  KEY_Cyrillic_che_vertstroke     = LibGdk::KEY_Cyrillic_che_vertstroke
  KEY_Cyrillic_de                 = LibGdk::KEY_Cyrillic_de
  KEY_Cyrillic_dzhe               = LibGdk::KEY_Cyrillic_dzhe
  KEY_Cyrillic_e                  = LibGdk::KEY_Cyrillic_e
  KEY_Cyrillic_ef                 = LibGdk::KEY_Cyrillic_ef
  KEY_Cyrillic_el                 = LibGdk::KEY_Cyrillic_el
  KEY_Cyrillic_em                 = LibGdk::KEY_Cyrillic_em
  KEY_Cyrillic_en                 = LibGdk::KEY_Cyrillic_en
  KEY_Cyrillic_en_descender       = LibGdk::KEY_Cyrillic_en_descender
  KEY_Cyrillic_er                 = LibGdk::KEY_Cyrillic_er
  KEY_Cyrillic_es                 = LibGdk::KEY_Cyrillic_es
  KEY_Cyrillic_ghe                = LibGdk::KEY_Cyrillic_ghe
  KEY_Cyrillic_ghe_bar            = LibGdk::KEY_Cyrillic_ghe_bar
  KEY_Cyrillic_ha                 = LibGdk::KEY_Cyrillic_ha
  KEY_Cyrillic_ha_descender       = LibGdk::KEY_Cyrillic_ha_descender
  KEY_Cyrillic_hardsign           = LibGdk::KEY_Cyrillic_hardsign
  KEY_Cyrillic_i                  = LibGdk::KEY_Cyrillic_i
  KEY_Cyrillic_i_macron           = LibGdk::KEY_Cyrillic_i_macron
  KEY_Cyrillic_ie                 = LibGdk::KEY_Cyrillic_ie
  KEY_Cyrillic_io                 = LibGdk::KEY_Cyrillic_io
  KEY_Cyrillic_je                 = LibGdk::KEY_Cyrillic_je
  KEY_Cyrillic_ka                 = LibGdk::KEY_Cyrillic_ka
  KEY_Cyrillic_ka_descender       = LibGdk::KEY_Cyrillic_ka_descender
  KEY_Cyrillic_ka_vertstroke      = LibGdk::KEY_Cyrillic_ka_vertstroke
  KEY_Cyrillic_lje                = LibGdk::KEY_Cyrillic_lje
  KEY_Cyrillic_nje                = LibGdk::KEY_Cyrillic_nje
  KEY_Cyrillic_o                  = LibGdk::KEY_Cyrillic_o
  KEY_Cyrillic_o_bar              = LibGdk::KEY_Cyrillic_o_bar
  KEY_Cyrillic_pe                 = LibGdk::KEY_Cyrillic_pe
  KEY_Cyrillic_schwa              = LibGdk::KEY_Cyrillic_schwa
  KEY_Cyrillic_sha                = LibGdk::KEY_Cyrillic_sha
  KEY_Cyrillic_shcha              = LibGdk::KEY_Cyrillic_shcha
  KEY_Cyrillic_shha               = LibGdk::KEY_Cyrillic_shha
  KEY_Cyrillic_shorti             = LibGdk::KEY_Cyrillic_shorti
  KEY_Cyrillic_softsign           = LibGdk::KEY_Cyrillic_softsign
  KEY_Cyrillic_te                 = LibGdk::KEY_Cyrillic_te
  KEY_Cyrillic_tse                = LibGdk::KEY_Cyrillic_tse
  KEY_Cyrillic_u                  = LibGdk::KEY_Cyrillic_u
  KEY_Cyrillic_u_macron           = LibGdk::KEY_Cyrillic_u_macron
  KEY_Cyrillic_u_straight         = LibGdk::KEY_Cyrillic_u_straight
  KEY_Cyrillic_u_straight_bar     = LibGdk::KEY_Cyrillic_u_straight_bar
  KEY_Cyrillic_ve                 = LibGdk::KEY_Cyrillic_ve
  KEY_Cyrillic_ya                 = LibGdk::KEY_Cyrillic_ya
  KEY_Cyrillic_yeru               = LibGdk::KEY_Cyrillic_yeru
  KEY_Cyrillic_yu                 = LibGdk::KEY_Cyrillic_yu
  KEY_Cyrillic_ze                 = LibGdk::KEY_Cyrillic_ze
  KEY_Cyrillic_zhe                = LibGdk::KEY_Cyrillic_zhe
  KEY_Cyrillic_zhe_descender      = LibGdk::KEY_Cyrillic_zhe_descender
  KEY_D                           = LibGdk::KEY_D
  KEY_DOS                         = LibGdk::KEY_DOS
  KEY_Dabovedot                   = LibGdk::KEY_Dabovedot
  KEY_Dcaron                      = LibGdk::KEY_Dcaron
  KEY_Delete                      = LibGdk::KEY_Delete
  KEY_Display                     = LibGdk::KEY_Display
  KEY_Documents                   = LibGdk::KEY_Documents
  KEY_DongSign                    = LibGdk::KEY_DongSign
  KEY_Down                        = LibGdk::KEY_Down
  KEY_Dstroke                     = LibGdk::KEY_Dstroke
  KEY_E                           = LibGdk::KEY_E
  KEY_ENG                         = LibGdk::KEY_ENG
  KEY_ETH                         = LibGdk::KEY_ETH
  KEY_EZH                         = LibGdk::KEY_EZH
  KEY_Eabovedot                   = LibGdk::KEY_Eabovedot
  KEY_Eacute                      = LibGdk::KEY_Eacute
  KEY_Ebelowdot                   = LibGdk::KEY_Ebelowdot
  KEY_Ecaron                      = LibGdk::KEY_Ecaron
  KEY_Ecircumflex                 = LibGdk::KEY_Ecircumflex
  KEY_Ecircumflexacute            = LibGdk::KEY_Ecircumflexacute
  KEY_Ecircumflexbelowdot         = LibGdk::KEY_Ecircumflexbelowdot
  KEY_Ecircumflexgrave            = LibGdk::KEY_Ecircumflexgrave
  KEY_Ecircumflexhook             = LibGdk::KEY_Ecircumflexhook
  KEY_Ecircumflextilde            = LibGdk::KEY_Ecircumflextilde
  KEY_EcuSign                     = LibGdk::KEY_EcuSign
  KEY_Ediaeresis                  = LibGdk::KEY_Ediaeresis
  KEY_Egrave                      = LibGdk::KEY_Egrave
  KEY_Ehook                       = LibGdk::KEY_Ehook
  KEY_Eisu_Shift                  = LibGdk::KEY_Eisu_Shift
  KEY_Eisu_toggle                 = LibGdk::KEY_Eisu_toggle
  KEY_Eject                       = LibGdk::KEY_Eject
  KEY_Emacron                     = LibGdk::KEY_Emacron
  KEY_End                         = LibGdk::KEY_End
  KEY_Eogonek                     = LibGdk::KEY_Eogonek
  KEY_Escape                      = LibGdk::KEY_Escape
  KEY_Eth                         = LibGdk::KEY_Eth
  KEY_Etilde                      = LibGdk::KEY_Etilde
  KEY_EuroSign                    = LibGdk::KEY_EuroSign
  KEY_Excel                       = LibGdk::KEY_Excel
  KEY_Execute                     = LibGdk::KEY_Execute
  KEY_Explorer                    = LibGdk::KEY_Explorer
  KEY_F                           = LibGdk::KEY_F
  KEY_F1                          = LibGdk::KEY_F1
  KEY_F10                         = LibGdk::KEY_F10
  KEY_F11                         = LibGdk::KEY_F11
  KEY_F12                         = LibGdk::KEY_F12
  KEY_F13                         = LibGdk::KEY_F13
  KEY_F14                         = LibGdk::KEY_F14
  KEY_F15                         = LibGdk::KEY_F15
  KEY_F16                         = LibGdk::KEY_F16
  KEY_F17                         = LibGdk::KEY_F17
  KEY_F18                         = LibGdk::KEY_F18
  KEY_F19                         = LibGdk::KEY_F19
  KEY_F2                          = LibGdk::KEY_F2
  KEY_F20                         = LibGdk::KEY_F20
  KEY_F21                         = LibGdk::KEY_F21
  KEY_F22                         = LibGdk::KEY_F22
  KEY_F23                         = LibGdk::KEY_F23
  KEY_F24                         = LibGdk::KEY_F24
  KEY_F25                         = LibGdk::KEY_F25
  KEY_F26                         = LibGdk::KEY_F26
  KEY_F27                         = LibGdk::KEY_F27
  KEY_F28                         = LibGdk::KEY_F28
  KEY_F29                         = LibGdk::KEY_F29
  KEY_F3                          = LibGdk::KEY_F3
  KEY_F30                         = LibGdk::KEY_F30
  KEY_F31                         = LibGdk::KEY_F31
  KEY_F32                         = LibGdk::KEY_F32
  KEY_F33                         = LibGdk::KEY_F33
  KEY_F34                         = LibGdk::KEY_F34
  KEY_F35                         = LibGdk::KEY_F35
  KEY_F4                          = LibGdk::KEY_F4
  KEY_F5                          = LibGdk::KEY_F5
  KEY_F6                          = LibGdk::KEY_F6
  KEY_F7                          = LibGdk::KEY_F7
  KEY_F8                          = LibGdk::KEY_F8
  KEY_F9                          = LibGdk::KEY_F9
  KEY_FFrancSign                  = LibGdk::KEY_FFrancSign
  KEY_Fabovedot                   = LibGdk::KEY_Fabovedot
  KEY_Farsi_0                     = LibGdk::KEY_Farsi_0
  KEY_Farsi_1                     = LibGdk::KEY_Farsi_1
  KEY_Farsi_2                     = LibGdk::KEY_Farsi_2
  KEY_Farsi_3                     = LibGdk::KEY_Farsi_3
  KEY_Farsi_4                     = LibGdk::KEY_Farsi_4
  KEY_Farsi_5                     = LibGdk::KEY_Farsi_5
  KEY_Farsi_6                     = LibGdk::KEY_Farsi_6
  KEY_Farsi_7                     = LibGdk::KEY_Farsi_7
  KEY_Farsi_8                     = LibGdk::KEY_Farsi_8
  KEY_Farsi_9                     = LibGdk::KEY_Farsi_9
  KEY_Farsi_yeh                   = LibGdk::KEY_Farsi_yeh
  KEY_Favorites                   = LibGdk::KEY_Favorites
  KEY_Finance                     = LibGdk::KEY_Finance
  KEY_Find                        = LibGdk::KEY_Find
  KEY_First_Virtual_Screen        = LibGdk::KEY_First_Virtual_Screen
  KEY_Forward                     = LibGdk::KEY_Forward
  KEY_FrameBack                   = LibGdk::KEY_FrameBack
  KEY_FrameForward                = LibGdk::KEY_FrameForward
  KEY_G                           = LibGdk::KEY_G
  KEY_Gabovedot                   = LibGdk::KEY_Gabovedot
  KEY_Game                        = LibGdk::KEY_Game
  KEY_Gbreve                      = LibGdk::KEY_Gbreve
  KEY_Gcaron                      = LibGdk::KEY_Gcaron
  KEY_Gcedilla                    = LibGdk::KEY_Gcedilla
  KEY_Gcircumflex                 = LibGdk::KEY_Gcircumflex
  KEY_Georgian_an                 = LibGdk::KEY_Georgian_an
  KEY_Georgian_ban                = LibGdk::KEY_Georgian_ban
  KEY_Georgian_can                = LibGdk::KEY_Georgian_can
  KEY_Georgian_char               = LibGdk::KEY_Georgian_char
  KEY_Georgian_chin               = LibGdk::KEY_Georgian_chin
  KEY_Georgian_cil                = LibGdk::KEY_Georgian_cil
  KEY_Georgian_don                = LibGdk::KEY_Georgian_don
  KEY_Georgian_en                 = LibGdk::KEY_Georgian_en
  KEY_Georgian_fi                 = LibGdk::KEY_Georgian_fi
  KEY_Georgian_gan                = LibGdk::KEY_Georgian_gan
  KEY_Georgian_ghan               = LibGdk::KEY_Georgian_ghan
  KEY_Georgian_hae                = LibGdk::KEY_Georgian_hae
  KEY_Georgian_har                = LibGdk::KEY_Georgian_har
  KEY_Georgian_he                 = LibGdk::KEY_Georgian_he
  KEY_Georgian_hie                = LibGdk::KEY_Georgian_hie
  KEY_Georgian_hoe                = LibGdk::KEY_Georgian_hoe
  KEY_Georgian_in                 = LibGdk::KEY_Georgian_in
  KEY_Georgian_jhan               = LibGdk::KEY_Georgian_jhan
  KEY_Georgian_jil                = LibGdk::KEY_Georgian_jil
  KEY_Georgian_kan                = LibGdk::KEY_Georgian_kan
  KEY_Georgian_khar               = LibGdk::KEY_Georgian_khar
  KEY_Georgian_las                = LibGdk::KEY_Georgian_las
  KEY_Georgian_man                = LibGdk::KEY_Georgian_man
  KEY_Georgian_nar                = LibGdk::KEY_Georgian_nar
  KEY_Georgian_on                 = LibGdk::KEY_Georgian_on
  KEY_Georgian_par                = LibGdk::KEY_Georgian_par
  KEY_Georgian_phar               = LibGdk::KEY_Georgian_phar
  KEY_Georgian_qar                = LibGdk::KEY_Georgian_qar
  KEY_Georgian_rae                = LibGdk::KEY_Georgian_rae
  KEY_Georgian_san                = LibGdk::KEY_Georgian_san
  KEY_Georgian_shin               = LibGdk::KEY_Georgian_shin
  KEY_Georgian_tan                = LibGdk::KEY_Georgian_tan
  KEY_Georgian_tar                = LibGdk::KEY_Georgian_tar
  KEY_Georgian_un                 = LibGdk::KEY_Georgian_un
  KEY_Georgian_vin                = LibGdk::KEY_Georgian_vin
  KEY_Georgian_we                 = LibGdk::KEY_Georgian_we
  KEY_Georgian_xan                = LibGdk::KEY_Georgian_xan
  KEY_Georgian_zen                = LibGdk::KEY_Georgian_zen
  KEY_Georgian_zhar               = LibGdk::KEY_Georgian_zhar
  KEY_Go                          = LibGdk::KEY_Go
  KEY_Greek_ALPHA                 = LibGdk::KEY_Greek_ALPHA
  KEY_Greek_ALPHAaccent           = LibGdk::KEY_Greek_ALPHAaccent
  KEY_Greek_BETA                  = LibGdk::KEY_Greek_BETA
  KEY_Greek_CHI                   = LibGdk::KEY_Greek_CHI
  KEY_Greek_DELTA                 = LibGdk::KEY_Greek_DELTA
  KEY_Greek_EPSILON               = LibGdk::KEY_Greek_EPSILON
  KEY_Greek_EPSILONaccent         = LibGdk::KEY_Greek_EPSILONaccent
  KEY_Greek_ETA                   = LibGdk::KEY_Greek_ETA
  KEY_Greek_ETAaccent             = LibGdk::KEY_Greek_ETAaccent
  KEY_Greek_GAMMA                 = LibGdk::KEY_Greek_GAMMA
  KEY_Greek_IOTA                  = LibGdk::KEY_Greek_IOTA
  KEY_Greek_IOTAaccent            = LibGdk::KEY_Greek_IOTAaccent
  KEY_Greek_IOTAdiaeresis         = LibGdk::KEY_Greek_IOTAdiaeresis
  KEY_Greek_IOTAdieresis          = LibGdk::KEY_Greek_IOTAdieresis
  KEY_Greek_KAPPA                 = LibGdk::KEY_Greek_KAPPA
  KEY_Greek_LAMBDA                = LibGdk::KEY_Greek_LAMBDA
  KEY_Greek_LAMDA                 = LibGdk::KEY_Greek_LAMDA
  KEY_Greek_MU                    = LibGdk::KEY_Greek_MU
  KEY_Greek_NU                    = LibGdk::KEY_Greek_NU
  KEY_Greek_OMEGA                 = LibGdk::KEY_Greek_OMEGA
  KEY_Greek_OMEGAaccent           = LibGdk::KEY_Greek_OMEGAaccent
  KEY_Greek_OMICRON               = LibGdk::KEY_Greek_OMICRON
  KEY_Greek_OMICRONaccent         = LibGdk::KEY_Greek_OMICRONaccent
  KEY_Greek_PHI                   = LibGdk::KEY_Greek_PHI
  KEY_Greek_PI                    = LibGdk::KEY_Greek_PI
  KEY_Greek_PSI                   = LibGdk::KEY_Greek_PSI
  KEY_Greek_RHO                   = LibGdk::KEY_Greek_RHO
  KEY_Greek_SIGMA                 = LibGdk::KEY_Greek_SIGMA
  KEY_Greek_TAU                   = LibGdk::KEY_Greek_TAU
  KEY_Greek_THETA                 = LibGdk::KEY_Greek_THETA
  KEY_Greek_UPSILON               = LibGdk::KEY_Greek_UPSILON
  KEY_Greek_UPSILONaccent         = LibGdk::KEY_Greek_UPSILONaccent
  KEY_Greek_UPSILONdieresis       = LibGdk::KEY_Greek_UPSILONdieresis
  KEY_Greek_XI                    = LibGdk::KEY_Greek_XI
  KEY_Greek_ZETA                  = LibGdk::KEY_Greek_ZETA
  KEY_Greek_accentdieresis        = LibGdk::KEY_Greek_accentdieresis
  KEY_Greek_alpha                 = LibGdk::KEY_Greek_alpha
  KEY_Greek_alphaaccent           = LibGdk::KEY_Greek_alphaaccent
  KEY_Greek_beta                  = LibGdk::KEY_Greek_beta
  KEY_Greek_chi                   = LibGdk::KEY_Greek_chi
  KEY_Greek_delta                 = LibGdk::KEY_Greek_delta
  KEY_Greek_epsilon               = LibGdk::KEY_Greek_epsilon
  KEY_Greek_epsilonaccent         = LibGdk::KEY_Greek_epsilonaccent
  KEY_Greek_eta                   = LibGdk::KEY_Greek_eta
  KEY_Greek_etaaccent             = LibGdk::KEY_Greek_etaaccent
  KEY_Greek_finalsmallsigma       = LibGdk::KEY_Greek_finalsmallsigma
  KEY_Greek_gamma                 = LibGdk::KEY_Greek_gamma
  KEY_Greek_horizbar              = LibGdk::KEY_Greek_horizbar
  KEY_Greek_iota                  = LibGdk::KEY_Greek_iota
  KEY_Greek_iotaaccent            = LibGdk::KEY_Greek_iotaaccent
  KEY_Greek_iotaaccentdieresis    = LibGdk::KEY_Greek_iotaaccentdieresis
  KEY_Greek_iotadieresis          = LibGdk::KEY_Greek_iotadieresis
  KEY_Greek_kappa                 = LibGdk::KEY_Greek_kappa
  KEY_Greek_lambda                = LibGdk::KEY_Greek_lambda
  KEY_Greek_lamda                 = LibGdk::KEY_Greek_lamda
  KEY_Greek_mu                    = LibGdk::KEY_Greek_mu
  KEY_Greek_nu                    = LibGdk::KEY_Greek_nu
  KEY_Greek_omega                 = LibGdk::KEY_Greek_omega
  KEY_Greek_omegaaccent           = LibGdk::KEY_Greek_omegaaccent
  KEY_Greek_omicron               = LibGdk::KEY_Greek_omicron
  KEY_Greek_omicronaccent         = LibGdk::KEY_Greek_omicronaccent
  KEY_Greek_phi                   = LibGdk::KEY_Greek_phi
  KEY_Greek_pi                    = LibGdk::KEY_Greek_pi
  KEY_Greek_psi                   = LibGdk::KEY_Greek_psi
  KEY_Greek_rho                   = LibGdk::KEY_Greek_rho
  KEY_Greek_sigma                 = LibGdk::KEY_Greek_sigma
  KEY_Greek_switch                = LibGdk::KEY_Greek_switch
  KEY_Greek_tau                   = LibGdk::KEY_Greek_tau
  KEY_Greek_theta                 = LibGdk::KEY_Greek_theta
  KEY_Greek_upsilon               = LibGdk::KEY_Greek_upsilon
  KEY_Greek_upsilonaccent         = LibGdk::KEY_Greek_upsilonaccent
  KEY_Greek_upsilonaccentdieresis = LibGdk::KEY_Greek_upsilonaccentdieresis
  KEY_Greek_upsilondieresis       = LibGdk::KEY_Greek_upsilondieresis
  KEY_Greek_xi                    = LibGdk::KEY_Greek_xi
  KEY_Greek_zeta                  = LibGdk::KEY_Greek_zeta
  KEY_Green                       = LibGdk::KEY_Green
  KEY_H                           = LibGdk::KEY_H
  KEY_Hangul                      = LibGdk::KEY_Hangul
  KEY_Hangul_A                    = LibGdk::KEY_Hangul_A
  KEY_Hangul_AE                   = LibGdk::KEY_Hangul_AE
  KEY_Hangul_AraeA                = LibGdk::KEY_Hangul_AraeA
  KEY_Hangul_AraeAE               = LibGdk::KEY_Hangul_AraeAE
  KEY_Hangul_Banja                = LibGdk::KEY_Hangul_Banja
  KEY_Hangul_Cieuc                = LibGdk::KEY_Hangul_Cieuc
  KEY_Hangul_Codeinput            = LibGdk::KEY_Hangul_Codeinput
  KEY_Hangul_Dikeud               = LibGdk::KEY_Hangul_Dikeud
  KEY_Hangul_E                    = LibGdk::KEY_Hangul_E
  KEY_Hangul_EO                   = LibGdk::KEY_Hangul_EO
  KEY_Hangul_EU                   = LibGdk::KEY_Hangul_EU
  KEY_Hangul_End                  = LibGdk::KEY_Hangul_End
  KEY_Hangul_Hanja                = LibGdk::KEY_Hangul_Hanja
  KEY_Hangul_Hieuh                = LibGdk::KEY_Hangul_Hieuh
  KEY_Hangul_I                    = LibGdk::KEY_Hangul_I
  KEY_Hangul_Ieung                = LibGdk::KEY_Hangul_Ieung
  KEY_Hangul_J_Cieuc              = LibGdk::KEY_Hangul_J_Cieuc
  KEY_Hangul_J_Dikeud             = LibGdk::KEY_Hangul_J_Dikeud
  KEY_Hangul_J_Hieuh              = LibGdk::KEY_Hangul_J_Hieuh
  KEY_Hangul_J_Ieung              = LibGdk::KEY_Hangul_J_Ieung
  KEY_Hangul_J_Jieuj              = LibGdk::KEY_Hangul_J_Jieuj
  KEY_Hangul_J_Khieuq             = LibGdk::KEY_Hangul_J_Khieuq
  KEY_Hangul_J_Kiyeog             = LibGdk::KEY_Hangul_J_Kiyeog
  KEY_Hangul_J_KiyeogSios         = LibGdk::KEY_Hangul_J_KiyeogSios
  KEY_Hangul_J_KkogjiDalrinIeung  = LibGdk::KEY_Hangul_J_KkogjiDalrinIeung
  KEY_Hangul_J_Mieum              = LibGdk::KEY_Hangul_J_Mieum
  KEY_Hangul_J_Nieun              = LibGdk::KEY_Hangul_J_Nieun
  KEY_Hangul_J_NieunHieuh         = LibGdk::KEY_Hangul_J_NieunHieuh
  KEY_Hangul_J_NieunJieuj         = LibGdk::KEY_Hangul_J_NieunJieuj
  KEY_Hangul_J_PanSios            = LibGdk::KEY_Hangul_J_PanSios
  KEY_Hangul_J_Phieuf             = LibGdk::KEY_Hangul_J_Phieuf
  KEY_Hangul_J_Pieub              = LibGdk::KEY_Hangul_J_Pieub
  KEY_Hangul_J_PieubSios          = LibGdk::KEY_Hangul_J_PieubSios
  KEY_Hangul_J_Rieul              = LibGdk::KEY_Hangul_J_Rieul
  KEY_Hangul_J_RieulHieuh         = LibGdk::KEY_Hangul_J_RieulHieuh
  KEY_Hangul_J_RieulKiyeog        = LibGdk::KEY_Hangul_J_RieulKiyeog
  KEY_Hangul_J_RieulMieum         = LibGdk::KEY_Hangul_J_RieulMieum
  KEY_Hangul_J_RieulPhieuf        = LibGdk::KEY_Hangul_J_RieulPhieuf
  KEY_Hangul_J_RieulPieub         = LibGdk::KEY_Hangul_J_RieulPieub
  KEY_Hangul_J_RieulSios          = LibGdk::KEY_Hangul_J_RieulSios
  KEY_Hangul_J_RieulTieut         = LibGdk::KEY_Hangul_J_RieulTieut
  KEY_Hangul_J_Sios               = LibGdk::KEY_Hangul_J_Sios
  KEY_Hangul_J_SsangKiyeog        = LibGdk::KEY_Hangul_J_SsangKiyeog
  KEY_Hangul_J_SsangSios          = LibGdk::KEY_Hangul_J_SsangSios
  KEY_Hangul_J_Tieut              = LibGdk::KEY_Hangul_J_Tieut
  KEY_Hangul_J_YeorinHieuh        = LibGdk::KEY_Hangul_J_YeorinHieuh
  KEY_Hangul_Jamo                 = LibGdk::KEY_Hangul_Jamo
  KEY_Hangul_Jeonja               = LibGdk::KEY_Hangul_Jeonja
  KEY_Hangul_Jieuj                = LibGdk::KEY_Hangul_Jieuj
  KEY_Hangul_Khieuq               = LibGdk::KEY_Hangul_Khieuq
  KEY_Hangul_Kiyeog               = LibGdk::KEY_Hangul_Kiyeog
  KEY_Hangul_KiyeogSios           = LibGdk::KEY_Hangul_KiyeogSios
  KEY_Hangul_KkogjiDalrinIeung    = LibGdk::KEY_Hangul_KkogjiDalrinIeung
  KEY_Hangul_Mieum                = LibGdk::KEY_Hangul_Mieum
  KEY_Hangul_MultipleCandidate    = LibGdk::KEY_Hangul_MultipleCandidate
  KEY_Hangul_Nieun                = LibGdk::KEY_Hangul_Nieun
  KEY_Hangul_NieunHieuh           = LibGdk::KEY_Hangul_NieunHieuh
  KEY_Hangul_NieunJieuj           = LibGdk::KEY_Hangul_NieunJieuj
  KEY_Hangul_O                    = LibGdk::KEY_Hangul_O
  KEY_Hangul_OE                   = LibGdk::KEY_Hangul_OE
  KEY_Hangul_PanSios              = LibGdk::KEY_Hangul_PanSios
  KEY_Hangul_Phieuf               = LibGdk::KEY_Hangul_Phieuf
  KEY_Hangul_Pieub                = LibGdk::KEY_Hangul_Pieub
  KEY_Hangul_PieubSios            = LibGdk::KEY_Hangul_PieubSios
  KEY_Hangul_PostHanja            = LibGdk::KEY_Hangul_PostHanja
  KEY_Hangul_PreHanja             = LibGdk::KEY_Hangul_PreHanja
  KEY_Hangul_PreviousCandidate    = LibGdk::KEY_Hangul_PreviousCandidate
  KEY_Hangul_Rieul                = LibGdk::KEY_Hangul_Rieul
  KEY_Hangul_RieulHieuh           = LibGdk::KEY_Hangul_RieulHieuh
  KEY_Hangul_RieulKiyeog          = LibGdk::KEY_Hangul_RieulKiyeog
  KEY_Hangul_RieulMieum           = LibGdk::KEY_Hangul_RieulMieum
  KEY_Hangul_RieulPhieuf          = LibGdk::KEY_Hangul_RieulPhieuf
  KEY_Hangul_RieulPieub           = LibGdk::KEY_Hangul_RieulPieub
  KEY_Hangul_RieulSios            = LibGdk::KEY_Hangul_RieulSios
  KEY_Hangul_RieulTieut           = LibGdk::KEY_Hangul_RieulTieut
  KEY_Hangul_RieulYeorinHieuh     = LibGdk::KEY_Hangul_RieulYeorinHieuh
  KEY_Hangul_Romaja               = LibGdk::KEY_Hangul_Romaja
  KEY_Hangul_SingleCandidate      = LibGdk::KEY_Hangul_SingleCandidate
  KEY_Hangul_Sios                 = LibGdk::KEY_Hangul_Sios
  KEY_Hangul_Special              = LibGdk::KEY_Hangul_Special
  KEY_Hangul_SsangDikeud          = LibGdk::KEY_Hangul_SsangDikeud
  KEY_Hangul_SsangJieuj           = LibGdk::KEY_Hangul_SsangJieuj
  KEY_Hangul_SsangKiyeog          = LibGdk::KEY_Hangul_SsangKiyeog
  KEY_Hangul_SsangPieub           = LibGdk::KEY_Hangul_SsangPieub
  KEY_Hangul_SsangSios            = LibGdk::KEY_Hangul_SsangSios
  KEY_Hangul_Start                = LibGdk::KEY_Hangul_Start
  KEY_Hangul_SunkyeongeumMieum    = LibGdk::KEY_Hangul_SunkyeongeumMieum
  KEY_Hangul_SunkyeongeumPhieuf   = LibGdk::KEY_Hangul_SunkyeongeumPhieuf
  KEY_Hangul_SunkyeongeumPieub    = LibGdk::KEY_Hangul_SunkyeongeumPieub
  KEY_Hangul_Tieut                = LibGdk::KEY_Hangul_Tieut
  KEY_Hangul_U                    = LibGdk::KEY_Hangul_U
  KEY_Hangul_WA                   = LibGdk::KEY_Hangul_WA
  KEY_Hangul_WAE                  = LibGdk::KEY_Hangul_WAE
  KEY_Hangul_WE                   = LibGdk::KEY_Hangul_WE
  KEY_Hangul_WEO                  = LibGdk::KEY_Hangul_WEO
  KEY_Hangul_WI                   = LibGdk::KEY_Hangul_WI
  KEY_Hangul_YA                   = LibGdk::KEY_Hangul_YA
  KEY_Hangul_YAE                  = LibGdk::KEY_Hangul_YAE
  KEY_Hangul_YE                   = LibGdk::KEY_Hangul_YE
  KEY_Hangul_YEO                  = LibGdk::KEY_Hangul_YEO
  KEY_Hangul_YI                   = LibGdk::KEY_Hangul_YI
  KEY_Hangul_YO                   = LibGdk::KEY_Hangul_YO
  KEY_Hangul_YU                   = LibGdk::KEY_Hangul_YU
  KEY_Hangul_YeorinHieuh          = LibGdk::KEY_Hangul_YeorinHieuh
  KEY_Hangul_switch               = LibGdk::KEY_Hangul_switch
  KEY_Hankaku                     = LibGdk::KEY_Hankaku
  KEY_Hcircumflex                 = LibGdk::KEY_Hcircumflex
  KEY_Hebrew_switch               = LibGdk::KEY_Hebrew_switch
  KEY_Help                        = LibGdk::KEY_Help
  KEY_Henkan                      = LibGdk::KEY_Henkan
  KEY_Henkan_Mode                 = LibGdk::KEY_Henkan_Mode
  KEY_Hibernate                   = LibGdk::KEY_Hibernate
  KEY_Hiragana                    = LibGdk::KEY_Hiragana
  KEY_Hiragana_Katakana           = LibGdk::KEY_Hiragana_Katakana
  KEY_History                     = LibGdk::KEY_History
  KEY_Home                        = LibGdk::KEY_Home
  KEY_HomePage                    = LibGdk::KEY_HomePage
  KEY_HotLinks                    = LibGdk::KEY_HotLinks
  KEY_Hstroke                     = LibGdk::KEY_Hstroke
  KEY_Hyper_L                     = LibGdk::KEY_Hyper_L
  KEY_Hyper_R                     = LibGdk::KEY_Hyper_R
  KEY_I                           = LibGdk::KEY_I
  KEY_ISO_Center_Object           = LibGdk::KEY_ISO_Center_Object
  KEY_ISO_Continuous_Underline    = LibGdk::KEY_ISO_Continuous_Underline
  KEY_ISO_Discontinuous_Underline = LibGdk::KEY_ISO_Discontinuous_Underline
  KEY_ISO_Emphasize               = LibGdk::KEY_ISO_Emphasize
  KEY_ISO_Enter                   = LibGdk::KEY_ISO_Enter
  KEY_ISO_Fast_Cursor_Down        = LibGdk::KEY_ISO_Fast_Cursor_Down
  KEY_ISO_Fast_Cursor_Left        = LibGdk::KEY_ISO_Fast_Cursor_Left
  KEY_ISO_Fast_Cursor_Right       = LibGdk::KEY_ISO_Fast_Cursor_Right
  KEY_ISO_Fast_Cursor_Up          = LibGdk::KEY_ISO_Fast_Cursor_Up
  KEY_ISO_First_Group             = LibGdk::KEY_ISO_First_Group
  KEY_ISO_First_Group_Lock        = LibGdk::KEY_ISO_First_Group_Lock
  KEY_ISO_Group_Latch             = LibGdk::KEY_ISO_Group_Latch
  KEY_ISO_Group_Lock              = LibGdk::KEY_ISO_Group_Lock
  KEY_ISO_Group_Shift             = LibGdk::KEY_ISO_Group_Shift
  KEY_ISO_Last_Group              = LibGdk::KEY_ISO_Last_Group
  KEY_ISO_Last_Group_Lock         = LibGdk::KEY_ISO_Last_Group_Lock
  KEY_ISO_Left_Tab                = LibGdk::KEY_ISO_Left_Tab
  KEY_ISO_Level2_Latch            = LibGdk::KEY_ISO_Level2_Latch
  KEY_ISO_Level3_Latch            = LibGdk::KEY_ISO_Level3_Latch
  KEY_ISO_Level3_Lock             = LibGdk::KEY_ISO_Level3_Lock
  KEY_ISO_Level3_Shift            = LibGdk::KEY_ISO_Level3_Shift
  KEY_ISO_Level5_Latch            = LibGdk::KEY_ISO_Level5_Latch
  KEY_ISO_Level5_Lock             = LibGdk::KEY_ISO_Level5_Lock
  KEY_ISO_Level5_Shift            = LibGdk::KEY_ISO_Level5_Shift
  KEY_ISO_Lock                    = LibGdk::KEY_ISO_Lock
  KEY_ISO_Move_Line_Down          = LibGdk::KEY_ISO_Move_Line_Down
  KEY_ISO_Move_Line_Up            = LibGdk::KEY_ISO_Move_Line_Up
  KEY_ISO_Next_Group              = LibGdk::KEY_ISO_Next_Group
  KEY_ISO_Next_Group_Lock         = LibGdk::KEY_ISO_Next_Group_Lock
  KEY_ISO_Partial_Line_Down       = LibGdk::KEY_ISO_Partial_Line_Down
  KEY_ISO_Partial_Line_Up         = LibGdk::KEY_ISO_Partial_Line_Up
  KEY_ISO_Partial_Space_Left      = LibGdk::KEY_ISO_Partial_Space_Left
  KEY_ISO_Partial_Space_Right     = LibGdk::KEY_ISO_Partial_Space_Right
  KEY_ISO_Prev_Group              = LibGdk::KEY_ISO_Prev_Group
  KEY_ISO_Prev_Group_Lock         = LibGdk::KEY_ISO_Prev_Group_Lock
  KEY_ISO_Release_Both_Margins    = LibGdk::KEY_ISO_Release_Both_Margins
  KEY_ISO_Release_Margin_Left     = LibGdk::KEY_ISO_Release_Margin_Left
  KEY_ISO_Release_Margin_Right    = LibGdk::KEY_ISO_Release_Margin_Right
  KEY_ISO_Set_Margin_Left         = LibGdk::KEY_ISO_Set_Margin_Left
  KEY_ISO_Set_Margin_Right        = LibGdk::KEY_ISO_Set_Margin_Right
  KEY_Iabovedot                   = LibGdk::KEY_Iabovedot
  KEY_Iacute                      = LibGdk::KEY_Iacute
  KEY_Ibelowdot                   = LibGdk::KEY_Ibelowdot
  KEY_Ibreve                      = LibGdk::KEY_Ibreve
  KEY_Icircumflex                 = LibGdk::KEY_Icircumflex
  KEY_Idiaeresis                  = LibGdk::KEY_Idiaeresis
  KEY_Igrave                      = LibGdk::KEY_Igrave
  KEY_Ihook                       = LibGdk::KEY_Ihook
  KEY_Imacron                     = LibGdk::KEY_Imacron
  KEY_Insert                      = LibGdk::KEY_Insert
  KEY_Iogonek                     = LibGdk::KEY_Iogonek
  KEY_Itilde                      = LibGdk::KEY_Itilde
  KEY_J                           = LibGdk::KEY_J
  KEY_Jcircumflex                 = LibGdk::KEY_Jcircumflex
  KEY_K                           = LibGdk::KEY_K
  KEY_KP_0                        = LibGdk::KEY_KP_0
  KEY_KP_1                        = LibGdk::KEY_KP_1
  KEY_KP_2                        = LibGdk::KEY_KP_2
  KEY_KP_3                        = LibGdk::KEY_KP_3
  KEY_KP_4                        = LibGdk::KEY_KP_4
  KEY_KP_5                        = LibGdk::KEY_KP_5
  KEY_KP_6                        = LibGdk::KEY_KP_6
  KEY_KP_7                        = LibGdk::KEY_KP_7
  KEY_KP_8                        = LibGdk::KEY_KP_8
  KEY_KP_9                        = LibGdk::KEY_KP_9
  KEY_KP_Add                      = LibGdk::KEY_KP_Add
  KEY_KP_Begin                    = LibGdk::KEY_KP_Begin
  KEY_KP_Decimal                  = LibGdk::KEY_KP_Decimal
  KEY_KP_Delete                   = LibGdk::KEY_KP_Delete
  KEY_KP_Divide                   = LibGdk::KEY_KP_Divide
  KEY_KP_Down                     = LibGdk::KEY_KP_Down
  KEY_KP_End                      = LibGdk::KEY_KP_End
  KEY_KP_Enter                    = LibGdk::KEY_KP_Enter
  KEY_KP_Equal                    = LibGdk::KEY_KP_Equal
  KEY_KP_F1                       = LibGdk::KEY_KP_F1
  KEY_KP_F2                       = LibGdk::KEY_KP_F2
  KEY_KP_F3                       = LibGdk::KEY_KP_F3
  KEY_KP_F4                       = LibGdk::KEY_KP_F4
  KEY_KP_Home                     = LibGdk::KEY_KP_Home
  KEY_KP_Insert                   = LibGdk::KEY_KP_Insert
  KEY_KP_Left                     = LibGdk::KEY_KP_Left
  KEY_KP_Multiply                 = LibGdk::KEY_KP_Multiply
  KEY_KP_Next                     = LibGdk::KEY_KP_Next
  KEY_KP_Page_Down                = LibGdk::KEY_KP_Page_Down
  KEY_KP_Page_Up                  = LibGdk::KEY_KP_Page_Up
  KEY_KP_Prior                    = LibGdk::KEY_KP_Prior
  KEY_KP_Right                    = LibGdk::KEY_KP_Right
  KEY_KP_Separator                = LibGdk::KEY_KP_Separator
  KEY_KP_Space                    = LibGdk::KEY_KP_Space
  KEY_KP_Subtract                 = LibGdk::KEY_KP_Subtract
  KEY_KP_Tab                      = LibGdk::KEY_KP_Tab
  KEY_KP_Up                       = LibGdk::KEY_KP_Up
  KEY_Kana_Lock                   = LibGdk::KEY_Kana_Lock
  KEY_Kana_Shift                  = LibGdk::KEY_Kana_Shift
  KEY_Kanji                       = LibGdk::KEY_Kanji
  KEY_Kanji_Bangou                = LibGdk::KEY_Kanji_Bangou
  KEY_Katakana                    = LibGdk::KEY_Katakana
  KEY_KbdBrightnessDown           = LibGdk::KEY_KbdBrightnessDown
  KEY_KbdBrightnessUp             = LibGdk::KEY_KbdBrightnessUp
  KEY_KbdLightOnOff               = LibGdk::KEY_KbdLightOnOff
  KEY_Kcedilla                    = LibGdk::KEY_Kcedilla
  KEY_Korean_Won                  = LibGdk::KEY_Korean_Won
  KEY_L                           = LibGdk::KEY_L
  KEY_L1                          = LibGdk::KEY_L1
  KEY_L10                         = LibGdk::KEY_L10
  KEY_L2                          = LibGdk::KEY_L2
  KEY_L3                          = LibGdk::KEY_L3
  KEY_L4                          = LibGdk::KEY_L4
  KEY_L5                          = LibGdk::KEY_L5
  KEY_L6                          = LibGdk::KEY_L6
  KEY_L7                          = LibGdk::KEY_L7
  KEY_L8                          = LibGdk::KEY_L8
  KEY_L9                          = LibGdk::KEY_L9
  KEY_Lacute                      = LibGdk::KEY_Lacute
  KEY_Last_Virtual_Screen         = LibGdk::KEY_Last_Virtual_Screen
  KEY_Launch0                     = LibGdk::KEY_Launch0
  KEY_Launch1                     = LibGdk::KEY_Launch1
  KEY_Launch2                     = LibGdk::KEY_Launch2
  KEY_Launch3                     = LibGdk::KEY_Launch3
  KEY_Launch4                     = LibGdk::KEY_Launch4
  KEY_Launch5                     = LibGdk::KEY_Launch5
  KEY_Launch6                     = LibGdk::KEY_Launch6
  KEY_Launch7                     = LibGdk::KEY_Launch7
  KEY_Launch8                     = LibGdk::KEY_Launch8
  KEY_Launch9                     = LibGdk::KEY_Launch9
  KEY_LaunchA                     = LibGdk::KEY_LaunchA
  KEY_LaunchB                     = LibGdk::KEY_LaunchB
  KEY_LaunchC                     = LibGdk::KEY_LaunchC
  KEY_LaunchD                     = LibGdk::KEY_LaunchD
  KEY_LaunchE                     = LibGdk::KEY_LaunchE
  KEY_LaunchF                     = LibGdk::KEY_LaunchF
  KEY_Lbelowdot                   = LibGdk::KEY_Lbelowdot
  KEY_Lcaron                      = LibGdk::KEY_Lcaron
  KEY_Lcedilla                    = LibGdk::KEY_Lcedilla
  KEY_Left                        = LibGdk::KEY_Left
  KEY_LightBulb                   = LibGdk::KEY_LightBulb
  KEY_Linefeed                    = LibGdk::KEY_Linefeed
  KEY_LiraSign                    = LibGdk::KEY_LiraSign
  KEY_LogGrabInfo                 = LibGdk::KEY_LogGrabInfo
  KEY_LogOff                      = LibGdk::KEY_LogOff
  KEY_LogWindowTree               = LibGdk::KEY_LogWindowTree
  KEY_Lstroke                     = LibGdk::KEY_Lstroke
  KEY_M                           = LibGdk::KEY_M
  KEY_Mabovedot                   = LibGdk::KEY_Mabovedot
  KEY_Macedonia_DSE               = LibGdk::KEY_Macedonia_DSE
  KEY_Macedonia_GJE               = LibGdk::KEY_Macedonia_GJE
  KEY_Macedonia_KJE               = LibGdk::KEY_Macedonia_KJE
  KEY_Macedonia_dse               = LibGdk::KEY_Macedonia_dse
  KEY_Macedonia_gje               = LibGdk::KEY_Macedonia_gje
  KEY_Macedonia_kje               = LibGdk::KEY_Macedonia_kje
  KEY_Mae_Koho                    = LibGdk::KEY_Mae_Koho
  KEY_Mail                        = LibGdk::KEY_Mail
  KEY_MailForward                 = LibGdk::KEY_MailForward
  KEY_Market                      = LibGdk::KEY_Market
  KEY_Massyo                      = LibGdk::KEY_Massyo
  KEY_Meeting                     = LibGdk::KEY_Meeting
  KEY_Memo                        = LibGdk::KEY_Memo
  KEY_Menu                        = LibGdk::KEY_Menu
  KEY_MenuKB                      = LibGdk::KEY_MenuKB
  KEY_MenuPB                      = LibGdk::KEY_MenuPB
  KEY_Messenger                   = LibGdk::KEY_Messenger
  KEY_Meta_L                      = LibGdk::KEY_Meta_L
  KEY_Meta_R                      = LibGdk::KEY_Meta_R
  KEY_MillSign                    = LibGdk::KEY_MillSign
  KEY_ModeLock                    = LibGdk::KEY_ModeLock
  KEY_Mode_switch                 = LibGdk::KEY_Mode_switch
  KEY_MonBrightnessDown           = LibGdk::KEY_MonBrightnessDown
  KEY_MonBrightnessUp             = LibGdk::KEY_MonBrightnessUp
  KEY_MouseKeys_Accel_Enable      = LibGdk::KEY_MouseKeys_Accel_Enable
  KEY_MouseKeys_Enable            = LibGdk::KEY_MouseKeys_Enable
  KEY_Muhenkan                    = LibGdk::KEY_Muhenkan
  KEY_Multi_key                   = LibGdk::KEY_Multi_key
  KEY_MultipleCandidate           = LibGdk::KEY_MultipleCandidate
  KEY_Music                       = LibGdk::KEY_Music
  KEY_MyComputer                  = LibGdk::KEY_MyComputer
  KEY_MySites                     = LibGdk::KEY_MySites
  KEY_N                           = LibGdk::KEY_N
  KEY_Nacute                      = LibGdk::KEY_Nacute
  KEY_NairaSign                   = LibGdk::KEY_NairaSign
  KEY_Ncaron                      = LibGdk::KEY_Ncaron
  KEY_Ncedilla                    = LibGdk::KEY_Ncedilla
  KEY_New                         = LibGdk::KEY_New
  KEY_NewSheqelSign               = LibGdk::KEY_NewSheqelSign
  KEY_News                        = LibGdk::KEY_News
  KEY_Next                        = LibGdk::KEY_Next
  KEY_Next_VMode                  = LibGdk::KEY_Next_VMode
  KEY_Next_Virtual_Screen         = LibGdk::KEY_Next_Virtual_Screen
  KEY_Ntilde                      = LibGdk::KEY_Ntilde
  KEY_Num_Lock                    = LibGdk::KEY_Num_Lock
  KEY_O                           = LibGdk::KEY_O
  KEY_OE                          = LibGdk::KEY_OE
  KEY_Oacute                      = LibGdk::KEY_Oacute
  KEY_Obarred                     = LibGdk::KEY_Obarred
  KEY_Obelowdot                   = LibGdk::KEY_Obelowdot
  KEY_Ocaron                      = LibGdk::KEY_Ocaron
  KEY_Ocircumflex                 = LibGdk::KEY_Ocircumflex
  KEY_Ocircumflexacute            = LibGdk::KEY_Ocircumflexacute
  KEY_Ocircumflexbelowdot         = LibGdk::KEY_Ocircumflexbelowdot
  KEY_Ocircumflexgrave            = LibGdk::KEY_Ocircumflexgrave
  KEY_Ocircumflexhook             = LibGdk::KEY_Ocircumflexhook
  KEY_Ocircumflextilde            = LibGdk::KEY_Ocircumflextilde
  KEY_Odiaeresis                  = LibGdk::KEY_Odiaeresis
  KEY_Odoubleacute                = LibGdk::KEY_Odoubleacute
  KEY_OfficeHome                  = LibGdk::KEY_OfficeHome
  KEY_Ograve                      = LibGdk::KEY_Ograve
  KEY_Ohook                       = LibGdk::KEY_Ohook
  KEY_Ohorn                       = LibGdk::KEY_Ohorn
  KEY_Ohornacute                  = LibGdk::KEY_Ohornacute
  KEY_Ohornbelowdot               = LibGdk::KEY_Ohornbelowdot
  KEY_Ohorngrave                  = LibGdk::KEY_Ohorngrave
  KEY_Ohornhook                   = LibGdk::KEY_Ohornhook
  KEY_Ohorntilde                  = LibGdk::KEY_Ohorntilde
  KEY_Omacron                     = LibGdk::KEY_Omacron
  KEY_Ooblique                    = LibGdk::KEY_Ooblique
  KEY_Open                        = LibGdk::KEY_Open
  KEY_OpenURL                     = LibGdk::KEY_OpenURL
  KEY_Option                      = LibGdk::KEY_Option
  KEY_Oslash                      = LibGdk::KEY_Oslash
  KEY_Otilde                      = LibGdk::KEY_Otilde
  KEY_Overlay1_Enable             = LibGdk::KEY_Overlay1_Enable
  KEY_Overlay2_Enable             = LibGdk::KEY_Overlay2_Enable
  KEY_P                           = LibGdk::KEY_P
  KEY_Pabovedot                   = LibGdk::KEY_Pabovedot
  KEY_Page_Down                   = LibGdk::KEY_Page_Down
  KEY_Page_Up                     = LibGdk::KEY_Page_Up
  KEY_Paste                       = LibGdk::KEY_Paste
  KEY_Pause                       = LibGdk::KEY_Pause
  KEY_PesetaSign                  = LibGdk::KEY_PesetaSign
  KEY_Phone                       = LibGdk::KEY_Phone
  KEY_Pictures                    = LibGdk::KEY_Pictures
  KEY_Pointer_Accelerate          = LibGdk::KEY_Pointer_Accelerate
  KEY_Pointer_Button1             = LibGdk::KEY_Pointer_Button1
  KEY_Pointer_Button2             = LibGdk::KEY_Pointer_Button2
  KEY_Pointer_Button3             = LibGdk::KEY_Pointer_Button3
  KEY_Pointer_Button4             = LibGdk::KEY_Pointer_Button4
  KEY_Pointer_Button5             = LibGdk::KEY_Pointer_Button5
  KEY_Pointer_Button_Dflt         = LibGdk::KEY_Pointer_Button_Dflt
  KEY_Pointer_DblClick1           = LibGdk::KEY_Pointer_DblClick1
  KEY_Pointer_DblClick2           = LibGdk::KEY_Pointer_DblClick2
  KEY_Pointer_DblClick3           = LibGdk::KEY_Pointer_DblClick3
  KEY_Pointer_DblClick4           = LibGdk::KEY_Pointer_DblClick4
  KEY_Pointer_DblClick5           = LibGdk::KEY_Pointer_DblClick5
  KEY_Pointer_DblClick_Dflt       = LibGdk::KEY_Pointer_DblClick_Dflt
  KEY_Pointer_DfltBtnNext         = LibGdk::KEY_Pointer_DfltBtnNext
  KEY_Pointer_DfltBtnPrev         = LibGdk::KEY_Pointer_DfltBtnPrev
  KEY_Pointer_Down                = LibGdk::KEY_Pointer_Down
  KEY_Pointer_DownLeft            = LibGdk::KEY_Pointer_DownLeft
  KEY_Pointer_DownRight           = LibGdk::KEY_Pointer_DownRight
  KEY_Pointer_Drag1               = LibGdk::KEY_Pointer_Drag1
  KEY_Pointer_Drag2               = LibGdk::KEY_Pointer_Drag2
  KEY_Pointer_Drag3               = LibGdk::KEY_Pointer_Drag3
  KEY_Pointer_Drag4               = LibGdk::KEY_Pointer_Drag4
  KEY_Pointer_Drag5               = LibGdk::KEY_Pointer_Drag5
  KEY_Pointer_Drag_Dflt           = LibGdk::KEY_Pointer_Drag_Dflt
  KEY_Pointer_EnableKeys          = LibGdk::KEY_Pointer_EnableKeys
  KEY_Pointer_Left                = LibGdk::KEY_Pointer_Left
  KEY_Pointer_Right               = LibGdk::KEY_Pointer_Right
  KEY_Pointer_Up                  = LibGdk::KEY_Pointer_Up
  KEY_Pointer_UpLeft              = LibGdk::KEY_Pointer_UpLeft
  KEY_Pointer_UpRight             = LibGdk::KEY_Pointer_UpRight
  KEY_PowerDown                   = LibGdk::KEY_PowerDown
  KEY_PowerOff                    = LibGdk::KEY_PowerOff
  KEY_Prev_VMode                  = LibGdk::KEY_Prev_VMode
  KEY_Prev_Virtual_Screen         = LibGdk::KEY_Prev_Virtual_Screen
  KEY_PreviousCandidate           = LibGdk::KEY_PreviousCandidate
  KEY_Print                       = LibGdk::KEY_Print
  KEY_Prior                       = LibGdk::KEY_Prior
  KEY_Q                           = LibGdk::KEY_Q
  KEY_R                           = LibGdk::KEY_R
  KEY_R1                          = LibGdk::KEY_R1
  KEY_R10                         = LibGdk::KEY_R10
  KEY_R11                         = LibGdk::KEY_R11
  KEY_R12                         = LibGdk::KEY_R12
  KEY_R13                         = LibGdk::KEY_R13
  KEY_R14                         = LibGdk::KEY_R14
  KEY_R15                         = LibGdk::KEY_R15
  KEY_R2                          = LibGdk::KEY_R2
  KEY_R3                          = LibGdk::KEY_R3
  KEY_R4                          = LibGdk::KEY_R4
  KEY_R5                          = LibGdk::KEY_R5
  KEY_R6                          = LibGdk::KEY_R6
  KEY_R7                          = LibGdk::KEY_R7
  KEY_R8                          = LibGdk::KEY_R8
  KEY_R9                          = LibGdk::KEY_R9
  KEY_Racute                      = LibGdk::KEY_Racute
  KEY_Rcaron                      = LibGdk::KEY_Rcaron
  KEY_Rcedilla                    = LibGdk::KEY_Rcedilla
  KEY_Red                         = LibGdk::KEY_Red
  KEY_Redo                        = LibGdk::KEY_Redo
  KEY_Refresh                     = LibGdk::KEY_Refresh
  KEY_Reload                      = LibGdk::KEY_Reload
  KEY_RepeatKeys_Enable           = LibGdk::KEY_RepeatKeys_Enable
  KEY_Reply                       = LibGdk::KEY_Reply
  KEY_Return                      = LibGdk::KEY_Return
  KEY_Right                       = LibGdk::KEY_Right
  KEY_RockerDown                  = LibGdk::KEY_RockerDown
  KEY_RockerEnter                 = LibGdk::KEY_RockerEnter
  KEY_RockerUp                    = LibGdk::KEY_RockerUp
  KEY_Romaji                      = LibGdk::KEY_Romaji
  KEY_RotateWindows               = LibGdk::KEY_RotateWindows
  KEY_RotationKB                  = LibGdk::KEY_RotationKB
  KEY_RotationPB                  = LibGdk::KEY_RotationPB
  KEY_RupeeSign                   = LibGdk::KEY_RupeeSign
  KEY_S                           = LibGdk::KEY_S
  KEY_SCHWA                       = LibGdk::KEY_SCHWA
  KEY_Sabovedot                   = LibGdk::KEY_Sabovedot
  KEY_Sacute                      = LibGdk::KEY_Sacute
  KEY_Save                        = LibGdk::KEY_Save
  KEY_Scaron                      = LibGdk::KEY_Scaron
  KEY_Scedilla                    = LibGdk::KEY_Scedilla
  KEY_Scircumflex                 = LibGdk::KEY_Scircumflex
  KEY_ScreenSaver                 = LibGdk::KEY_ScreenSaver
  KEY_ScrollClick                 = LibGdk::KEY_ScrollClick
  KEY_ScrollDown                  = LibGdk::KEY_ScrollDown
  KEY_ScrollUp                    = LibGdk::KEY_ScrollUp
  KEY_Scroll_Lock                 = LibGdk::KEY_Scroll_Lock
  KEY_Search                      = LibGdk::KEY_Search
  KEY_Select                      = LibGdk::KEY_Select
  KEY_SelectButton                = LibGdk::KEY_SelectButton
  KEY_Send                        = LibGdk::KEY_Send
  KEY_Serbian_DJE                 = LibGdk::KEY_Serbian_DJE
  KEY_Serbian_DZE                 = LibGdk::KEY_Serbian_DZE
  KEY_Serbian_JE                  = LibGdk::KEY_Serbian_JE
  KEY_Serbian_LJE                 = LibGdk::KEY_Serbian_LJE
  KEY_Serbian_NJE                 = LibGdk::KEY_Serbian_NJE
  KEY_Serbian_TSHE                = LibGdk::KEY_Serbian_TSHE
  KEY_Serbian_dje                 = LibGdk::KEY_Serbian_dje
  KEY_Serbian_dze                 = LibGdk::KEY_Serbian_dze
  KEY_Serbian_je                  = LibGdk::KEY_Serbian_je
  KEY_Serbian_lje                 = LibGdk::KEY_Serbian_lje
  KEY_Serbian_nje                 = LibGdk::KEY_Serbian_nje
  KEY_Serbian_tshe                = LibGdk::KEY_Serbian_tshe
  KEY_Shift_L                     = LibGdk::KEY_Shift_L
  KEY_Shift_Lock                  = LibGdk::KEY_Shift_Lock
  KEY_Shift_R                     = LibGdk::KEY_Shift_R
  KEY_Shop                        = LibGdk::KEY_Shop
  KEY_SingleCandidate             = LibGdk::KEY_SingleCandidate
  KEY_Sinh_a                      = LibGdk::KEY_Sinh_a
  KEY_Sinh_aa                     = LibGdk::KEY_Sinh_aa
  KEY_Sinh_aa2                    = LibGdk::KEY_Sinh_aa2
  KEY_Sinh_ae                     = LibGdk::KEY_Sinh_ae
  KEY_Sinh_ae2                    = LibGdk::KEY_Sinh_ae2
  KEY_Sinh_aee                    = LibGdk::KEY_Sinh_aee
  KEY_Sinh_aee2                   = LibGdk::KEY_Sinh_aee2
  KEY_Sinh_ai                     = LibGdk::KEY_Sinh_ai
  KEY_Sinh_ai2                    = LibGdk::KEY_Sinh_ai2
  KEY_Sinh_al                     = LibGdk::KEY_Sinh_al
  KEY_Sinh_au                     = LibGdk::KEY_Sinh_au
  KEY_Sinh_au2                    = LibGdk::KEY_Sinh_au2
  KEY_Sinh_ba                     = LibGdk::KEY_Sinh_ba
  KEY_Sinh_bha                    = LibGdk::KEY_Sinh_bha
  KEY_Sinh_ca                     = LibGdk::KEY_Sinh_ca
  KEY_Sinh_cha                    = LibGdk::KEY_Sinh_cha
  KEY_Sinh_dda                    = LibGdk::KEY_Sinh_dda
  KEY_Sinh_ddha                   = LibGdk::KEY_Sinh_ddha
  KEY_Sinh_dha                    = LibGdk::KEY_Sinh_dha
  KEY_Sinh_dhha                   = LibGdk::KEY_Sinh_dhha
  KEY_Sinh_e                      = LibGdk::KEY_Sinh_e
  KEY_Sinh_e2                     = LibGdk::KEY_Sinh_e2
  KEY_Sinh_ee                     = LibGdk::KEY_Sinh_ee
  KEY_Sinh_ee2                    = LibGdk::KEY_Sinh_ee2
  KEY_Sinh_fa                     = LibGdk::KEY_Sinh_fa
  KEY_Sinh_ga                     = LibGdk::KEY_Sinh_ga
  KEY_Sinh_gha                    = LibGdk::KEY_Sinh_gha
  KEY_Sinh_h2                     = LibGdk::KEY_Sinh_h2
  KEY_Sinh_ha                     = LibGdk::KEY_Sinh_ha
  KEY_Sinh_i                      = LibGdk::KEY_Sinh_i
  KEY_Sinh_i2                     = LibGdk::KEY_Sinh_i2
  KEY_Sinh_ii                     = LibGdk::KEY_Sinh_ii
  KEY_Sinh_ii2                    = LibGdk::KEY_Sinh_ii2
  KEY_Sinh_ja                     = LibGdk::KEY_Sinh_ja
  KEY_Sinh_jha                    = LibGdk::KEY_Sinh_jha
  KEY_Sinh_jnya                   = LibGdk::KEY_Sinh_jnya
  KEY_Sinh_ka                     = LibGdk::KEY_Sinh_ka
  KEY_Sinh_kha                    = LibGdk::KEY_Sinh_kha
  KEY_Sinh_kunddaliya             = LibGdk::KEY_Sinh_kunddaliya
  KEY_Sinh_la                     = LibGdk::KEY_Sinh_la
  KEY_Sinh_lla                    = LibGdk::KEY_Sinh_lla
  KEY_Sinh_lu                     = LibGdk::KEY_Sinh_lu
  KEY_Sinh_lu2                    = LibGdk::KEY_Sinh_lu2
  KEY_Sinh_luu                    = LibGdk::KEY_Sinh_luu
  KEY_Sinh_luu2                   = LibGdk::KEY_Sinh_luu2
  KEY_Sinh_ma                     = LibGdk::KEY_Sinh_ma
  KEY_Sinh_mba                    = LibGdk::KEY_Sinh_mba
  KEY_Sinh_na                     = LibGdk::KEY_Sinh_na
  KEY_Sinh_ndda                   = LibGdk::KEY_Sinh_ndda
  KEY_Sinh_ndha                   = LibGdk::KEY_Sinh_ndha
  KEY_Sinh_ng                     = LibGdk::KEY_Sinh_ng
  KEY_Sinh_ng2                    = LibGdk::KEY_Sinh_ng2
  KEY_Sinh_nga                    = LibGdk::KEY_Sinh_nga
  KEY_Sinh_nja                    = LibGdk::KEY_Sinh_nja
  KEY_Sinh_nna                    = LibGdk::KEY_Sinh_nna
  KEY_Sinh_nya                    = LibGdk::KEY_Sinh_nya
  KEY_Sinh_o                      = LibGdk::KEY_Sinh_o
  KEY_Sinh_o2                     = LibGdk::KEY_Sinh_o2
  KEY_Sinh_oo                     = LibGdk::KEY_Sinh_oo
  KEY_Sinh_oo2                    = LibGdk::KEY_Sinh_oo2
  KEY_Sinh_pa                     = LibGdk::KEY_Sinh_pa
  KEY_Sinh_pha                    = LibGdk::KEY_Sinh_pha
  KEY_Sinh_ra                     = LibGdk::KEY_Sinh_ra
  KEY_Sinh_ri                     = LibGdk::KEY_Sinh_ri
  KEY_Sinh_rii                    = LibGdk::KEY_Sinh_rii
  KEY_Sinh_ru2                    = LibGdk::KEY_Sinh_ru2
  KEY_Sinh_ruu2                   = LibGdk::KEY_Sinh_ruu2
  KEY_Sinh_sa                     = LibGdk::KEY_Sinh_sa
  KEY_Sinh_sha                    = LibGdk::KEY_Sinh_sha
  KEY_Sinh_ssha                   = LibGdk::KEY_Sinh_ssha
  KEY_Sinh_tha                    = LibGdk::KEY_Sinh_tha
  KEY_Sinh_thha                   = LibGdk::KEY_Sinh_thha
  KEY_Sinh_tta                    = LibGdk::KEY_Sinh_tta
  KEY_Sinh_ttha                   = LibGdk::KEY_Sinh_ttha
  KEY_Sinh_u                      = LibGdk::KEY_Sinh_u
  KEY_Sinh_u2                     = LibGdk::KEY_Sinh_u2
  KEY_Sinh_uu                     = LibGdk::KEY_Sinh_uu
  KEY_Sinh_uu2                    = LibGdk::KEY_Sinh_uu2
  KEY_Sinh_va                     = LibGdk::KEY_Sinh_va
  KEY_Sinh_ya                     = LibGdk::KEY_Sinh_ya
  KEY_Sleep                       = LibGdk::KEY_Sleep
  KEY_SlowKeys_Enable             = LibGdk::KEY_SlowKeys_Enable
  KEY_Spell                       = LibGdk::KEY_Spell
  KEY_SplitScreen                 = LibGdk::KEY_SplitScreen
  KEY_Standby                     = LibGdk::KEY_Standby
  KEY_Start                       = LibGdk::KEY_Start
  KEY_StickyKeys_Enable           = LibGdk::KEY_StickyKeys_Enable
  KEY_Stop                        = LibGdk::KEY_Stop
  KEY_Subtitle                    = LibGdk::KEY_Subtitle
  KEY_Super_L                     = LibGdk::KEY_Super_L
  KEY_Super_R                     = LibGdk::KEY_Super_R
  KEY_Support                     = LibGdk::KEY_Support
  KEY_Suspend                     = LibGdk::KEY_Suspend
  KEY_Switch_VT_1                 = LibGdk::KEY_Switch_VT_1
  KEY_Switch_VT_10                = LibGdk::KEY_Switch_VT_10
  KEY_Switch_VT_11                = LibGdk::KEY_Switch_VT_11
  KEY_Switch_VT_12                = LibGdk::KEY_Switch_VT_12
  KEY_Switch_VT_2                 = LibGdk::KEY_Switch_VT_2
  KEY_Switch_VT_3                 = LibGdk::KEY_Switch_VT_3
  KEY_Switch_VT_4                 = LibGdk::KEY_Switch_VT_4
  KEY_Switch_VT_5                 = LibGdk::KEY_Switch_VT_5
  KEY_Switch_VT_6                 = LibGdk::KEY_Switch_VT_6
  KEY_Switch_VT_7                 = LibGdk::KEY_Switch_VT_7
  KEY_Switch_VT_8                 = LibGdk::KEY_Switch_VT_8
  KEY_Switch_VT_9                 = LibGdk::KEY_Switch_VT_9
  KEY_Sys_Req                     = LibGdk::KEY_Sys_Req
  KEY_T                           = LibGdk::KEY_T
  KEY_THORN                       = LibGdk::KEY_THORN
  KEY_Tab                         = LibGdk::KEY_Tab
  KEY_Tabovedot                   = LibGdk::KEY_Tabovedot
  KEY_TaskPane                    = LibGdk::KEY_TaskPane
  KEY_Tcaron                      = LibGdk::KEY_Tcaron
  KEY_Tcedilla                    = LibGdk::KEY_Tcedilla
  KEY_Terminal                    = LibGdk::KEY_Terminal
  KEY_Terminate_Server            = LibGdk::KEY_Terminate_Server
  KEY_Thai_baht                   = LibGdk::KEY_Thai_baht
  KEY_Thai_bobaimai               = LibGdk::KEY_Thai_bobaimai
  KEY_Thai_chochan                = LibGdk::KEY_Thai_chochan
  KEY_Thai_chochang               = LibGdk::KEY_Thai_chochang
  KEY_Thai_choching               = LibGdk::KEY_Thai_choching
  KEY_Thai_chochoe                = LibGdk::KEY_Thai_chochoe
  KEY_Thai_dochada                = LibGdk::KEY_Thai_dochada
  KEY_Thai_dodek                  = LibGdk::KEY_Thai_dodek
  KEY_Thai_fofa                   = LibGdk::KEY_Thai_fofa
  KEY_Thai_fofan                  = LibGdk::KEY_Thai_fofan
  KEY_Thai_hohip                  = LibGdk::KEY_Thai_hohip
  KEY_Thai_honokhuk               = LibGdk::KEY_Thai_honokhuk
  KEY_Thai_khokhai                = LibGdk::KEY_Thai_khokhai
  KEY_Thai_khokhon                = LibGdk::KEY_Thai_khokhon
  KEY_Thai_khokhuat               = LibGdk::KEY_Thai_khokhuat
  KEY_Thai_khokhwai               = LibGdk::KEY_Thai_khokhwai
  KEY_Thai_khorakhang             = LibGdk::KEY_Thai_khorakhang
  KEY_Thai_kokai                  = LibGdk::KEY_Thai_kokai
  KEY_Thai_lakkhangyao            = LibGdk::KEY_Thai_lakkhangyao
  KEY_Thai_lekchet                = LibGdk::KEY_Thai_lekchet
  KEY_Thai_lekha                  = LibGdk::KEY_Thai_lekha
  KEY_Thai_lekhok                 = LibGdk::KEY_Thai_lekhok
  KEY_Thai_lekkao                 = LibGdk::KEY_Thai_lekkao
  KEY_Thai_leknung                = LibGdk::KEY_Thai_leknung
  KEY_Thai_lekpaet                = LibGdk::KEY_Thai_lekpaet
  KEY_Thai_leksam                 = LibGdk::KEY_Thai_leksam
  KEY_Thai_leksi                  = LibGdk::KEY_Thai_leksi
  KEY_Thai_leksong                = LibGdk::KEY_Thai_leksong
  KEY_Thai_leksun                 = LibGdk::KEY_Thai_leksun
  KEY_Thai_lochula                = LibGdk::KEY_Thai_lochula
  KEY_Thai_loling                 = LibGdk::KEY_Thai_loling
  KEY_Thai_lu                     = LibGdk::KEY_Thai_lu
  KEY_Thai_maichattawa            = LibGdk::KEY_Thai_maichattawa
  KEY_Thai_maiek                  = LibGdk::KEY_Thai_maiek
  KEY_Thai_maihanakat             = LibGdk::KEY_Thai_maihanakat
  KEY_Thai_maihanakat_maitho      = LibGdk::KEY_Thai_maihanakat_maitho
  KEY_Thai_maitaikhu              = LibGdk::KEY_Thai_maitaikhu
  KEY_Thai_maitho                 = LibGdk::KEY_Thai_maitho
  KEY_Thai_maitri                 = LibGdk::KEY_Thai_maitri
  KEY_Thai_maiyamok               = LibGdk::KEY_Thai_maiyamok
  KEY_Thai_moma                   = LibGdk::KEY_Thai_moma
  KEY_Thai_ngongu                 = LibGdk::KEY_Thai_ngongu
  KEY_Thai_nikhahit               = LibGdk::KEY_Thai_nikhahit
  KEY_Thai_nonen                  = LibGdk::KEY_Thai_nonen
  KEY_Thai_nonu                   = LibGdk::KEY_Thai_nonu
  KEY_Thai_oang                   = LibGdk::KEY_Thai_oang
  KEY_Thai_paiyannoi              = LibGdk::KEY_Thai_paiyannoi
  KEY_Thai_phinthu                = LibGdk::KEY_Thai_phinthu
  KEY_Thai_phophan                = LibGdk::KEY_Thai_phophan
  KEY_Thai_phophung               = LibGdk::KEY_Thai_phophung
  KEY_Thai_phosamphao             = LibGdk::KEY_Thai_phosamphao
  KEY_Thai_popla                  = LibGdk::KEY_Thai_popla
  KEY_Thai_rorua                  = LibGdk::KEY_Thai_rorua
  KEY_Thai_ru                     = LibGdk::KEY_Thai_ru
  KEY_Thai_saraa                  = LibGdk::KEY_Thai_saraa
  KEY_Thai_saraaa                 = LibGdk::KEY_Thai_saraaa
  KEY_Thai_saraae                 = LibGdk::KEY_Thai_saraae
  KEY_Thai_saraaimaimalai         = LibGdk::KEY_Thai_saraaimaimalai
  KEY_Thai_saraaimaimuan          = LibGdk::KEY_Thai_saraaimaimuan
  KEY_Thai_saraam                 = LibGdk::KEY_Thai_saraam
  KEY_Thai_sarae                  = LibGdk::KEY_Thai_sarae
  KEY_Thai_sarai                  = LibGdk::KEY_Thai_sarai
  KEY_Thai_saraii                 = LibGdk::KEY_Thai_saraii
  KEY_Thai_sarao                  = LibGdk::KEY_Thai_sarao
  KEY_Thai_sarau                  = LibGdk::KEY_Thai_sarau
  KEY_Thai_saraue                 = LibGdk::KEY_Thai_saraue
  KEY_Thai_sarauee                = LibGdk::KEY_Thai_sarauee
  KEY_Thai_sarauu                 = LibGdk::KEY_Thai_sarauu
  KEY_Thai_sorusi                 = LibGdk::KEY_Thai_sorusi
  KEY_Thai_sosala                 = LibGdk::KEY_Thai_sosala
  KEY_Thai_soso                   = LibGdk::KEY_Thai_soso
  KEY_Thai_sosua                  = LibGdk::KEY_Thai_sosua
  KEY_Thai_thanthakhat            = LibGdk::KEY_Thai_thanthakhat
  KEY_Thai_thonangmontho          = LibGdk::KEY_Thai_thonangmontho
  KEY_Thai_thophuthao             = LibGdk::KEY_Thai_thophuthao
  KEY_Thai_thothahan              = LibGdk::KEY_Thai_thothahan
  KEY_Thai_thothan                = LibGdk::KEY_Thai_thothan
  KEY_Thai_thothong               = LibGdk::KEY_Thai_thothong
  KEY_Thai_thothung               = LibGdk::KEY_Thai_thothung
  KEY_Thai_topatak                = LibGdk::KEY_Thai_topatak
  KEY_Thai_totao                  = LibGdk::KEY_Thai_totao
  KEY_Thai_wowaen                 = LibGdk::KEY_Thai_wowaen
  KEY_Thai_yoyak                  = LibGdk::KEY_Thai_yoyak
  KEY_Thai_yoying                 = LibGdk::KEY_Thai_yoying
  KEY_Thorn                       = LibGdk::KEY_Thorn
  KEY_Time                        = LibGdk::KEY_Time
  KEY_ToDoList                    = LibGdk::KEY_ToDoList
  KEY_Tools                       = LibGdk::KEY_Tools
  KEY_TopMenu                     = LibGdk::KEY_TopMenu
  KEY_TouchpadOff                 = LibGdk::KEY_TouchpadOff
  KEY_TouchpadOn                  = LibGdk::KEY_TouchpadOn
  KEY_TouchpadToggle              = LibGdk::KEY_TouchpadToggle
  KEY_Touroku                     = LibGdk::KEY_Touroku
  KEY_Travel                      = LibGdk::KEY_Travel
  KEY_Tslash                      = LibGdk::KEY_Tslash
  KEY_U                           = LibGdk::KEY_U
  KEY_UWB                         = LibGdk::KEY_UWB
  KEY_Uacute                      = LibGdk::KEY_Uacute
  KEY_Ubelowdot                   = LibGdk::KEY_Ubelowdot
  KEY_Ubreve                      = LibGdk::KEY_Ubreve
  KEY_Ucircumflex                 = LibGdk::KEY_Ucircumflex
  KEY_Udiaeresis                  = LibGdk::KEY_Udiaeresis
  KEY_Udoubleacute                = LibGdk::KEY_Udoubleacute
  KEY_Ugrave                      = LibGdk::KEY_Ugrave
  KEY_Uhook                       = LibGdk::KEY_Uhook
  KEY_Uhorn                       = LibGdk::KEY_Uhorn
  KEY_Uhornacute                  = LibGdk::KEY_Uhornacute
  KEY_Uhornbelowdot               = LibGdk::KEY_Uhornbelowdot
  KEY_Uhorngrave                  = LibGdk::KEY_Uhorngrave
  KEY_Uhornhook                   = LibGdk::KEY_Uhornhook
  KEY_Uhorntilde                  = LibGdk::KEY_Uhorntilde
  KEY_Ukrainian_GHE_WITH_UPTURN   = LibGdk::KEY_Ukrainian_GHE_WITH_UPTURN
  KEY_Ukrainian_I                 = LibGdk::KEY_Ukrainian_I
  KEY_Ukrainian_IE                = LibGdk::KEY_Ukrainian_IE
  KEY_Ukrainian_YI                = LibGdk::KEY_Ukrainian_YI
  KEY_Ukrainian_ghe_with_upturn   = LibGdk::KEY_Ukrainian_ghe_with_upturn
  KEY_Ukrainian_i                 = LibGdk::KEY_Ukrainian_i
  KEY_Ukrainian_ie                = LibGdk::KEY_Ukrainian_ie
  KEY_Ukrainian_yi                = LibGdk::KEY_Ukrainian_yi
  KEY_Ukranian_I                  = LibGdk::KEY_Ukranian_I
  KEY_Ukranian_JE                 = LibGdk::KEY_Ukranian_JE
  KEY_Ukranian_YI                 = LibGdk::KEY_Ukranian_YI
  KEY_Ukranian_i                  = LibGdk::KEY_Ukranian_i
  KEY_Ukranian_je                 = LibGdk::KEY_Ukranian_je
  KEY_Ukranian_yi                 = LibGdk::KEY_Ukranian_yi
  KEY_Umacron                     = LibGdk::KEY_Umacron
  KEY_Undo                        = LibGdk::KEY_Undo
  KEY_Ungrab                      = LibGdk::KEY_Ungrab
  KEY_Uogonek                     = LibGdk::KEY_Uogonek
  KEY_Up                          = LibGdk::KEY_Up
  KEY_Uring                       = LibGdk::KEY_Uring
  KEY_User1KB                     = LibGdk::KEY_User1KB
  KEY_User2KB                     = LibGdk::KEY_User2KB
  KEY_UserPB                      = LibGdk::KEY_UserPB
  KEY_Utilde                      = LibGdk::KEY_Utilde
  KEY_V                           = LibGdk::KEY_V
  KEY_VendorHome                  = LibGdk::KEY_VendorHome
  KEY_Video                       = LibGdk::KEY_Video
  KEY_View                        = LibGdk::KEY_View
  KEY_VoidSymbol                  = LibGdk::KEY_VoidSymbol
  KEY_W                           = LibGdk::KEY_W
  KEY_WLAN                        = LibGdk::KEY_WLAN
  KEY_WWW                         = LibGdk::KEY_WWW
  KEY_Wacute                      = LibGdk::KEY_Wacute
  KEY_WakeUp                      = LibGdk::KEY_WakeUp
  KEY_Wcircumflex                 = LibGdk::KEY_Wcircumflex
  KEY_Wdiaeresis                  = LibGdk::KEY_Wdiaeresis
  KEY_WebCam                      = LibGdk::KEY_WebCam
  KEY_Wgrave                      = LibGdk::KEY_Wgrave
  KEY_WheelButton                 = LibGdk::KEY_WheelButton
  KEY_WindowClear                 = LibGdk::KEY_WindowClear
  KEY_WonSign                     = LibGdk::KEY_WonSign
  KEY_Word                        = LibGdk::KEY_Word
  KEY_X                           = LibGdk::KEY_X
  KEY_Xabovedot                   = LibGdk::KEY_Xabovedot
  KEY_Xfer                        = LibGdk::KEY_Xfer
  KEY_Y                           = LibGdk::KEY_Y
  KEY_Yacute                      = LibGdk::KEY_Yacute
  KEY_Ybelowdot                   = LibGdk::KEY_Ybelowdot
  KEY_Ycircumflex                 = LibGdk::KEY_Ycircumflex
  KEY_Ydiaeresis                  = LibGdk::KEY_Ydiaeresis
  KEY_Yellow                      = LibGdk::KEY_Yellow
  KEY_Ygrave                      = LibGdk::KEY_Ygrave
  KEY_Yhook                       = LibGdk::KEY_Yhook
  KEY_Ytilde                      = LibGdk::KEY_Ytilde
  KEY_Z                           = LibGdk::KEY_Z
  KEY_Zabovedot                   = LibGdk::KEY_Zabovedot
  KEY_Zacute                      = LibGdk::KEY_Zacute
  KEY_Zcaron                      = LibGdk::KEY_Zcaron
  KEY_Zen_Koho                    = LibGdk::KEY_Zen_Koho
  KEY_Zenkaku                     = LibGdk::KEY_Zenkaku
  KEY_Zenkaku_Hankaku             = LibGdk::KEY_Zenkaku_Hankaku
  KEY_ZoomIn                      = LibGdk::KEY_ZoomIn
  KEY_ZoomOut                     = LibGdk::KEY_ZoomOut
  KEY_Zstroke                     = LibGdk::KEY_Zstroke
  KEY_a                           = LibGdk::KEY_a
  KEY_aacute                      = LibGdk::KEY_aacute
  KEY_abelowdot                   = LibGdk::KEY_abelowdot
  KEY_abovedot                    = LibGdk::KEY_abovedot
  KEY_abreve                      = LibGdk::KEY_abreve
  KEY_abreveacute                 = LibGdk::KEY_abreveacute
  KEY_abrevebelowdot              = LibGdk::KEY_abrevebelowdot
  KEY_abrevegrave                 = LibGdk::KEY_abrevegrave
  KEY_abrevehook                  = LibGdk::KEY_abrevehook
  KEY_abrevetilde                 = LibGdk::KEY_abrevetilde
  KEY_acircumflex                 = LibGdk::KEY_acircumflex
  KEY_acircumflexacute            = LibGdk::KEY_acircumflexacute
  KEY_acircumflexbelowdot         = LibGdk::KEY_acircumflexbelowdot
  KEY_acircumflexgrave            = LibGdk::KEY_acircumflexgrave
  KEY_acircumflexhook             = LibGdk::KEY_acircumflexhook
  KEY_acircumflextilde            = LibGdk::KEY_acircumflextilde
  KEY_acute                       = LibGdk::KEY_acute
  KEY_adiaeresis                  = LibGdk::KEY_adiaeresis
  KEY_ae                          = LibGdk::KEY_ae
  KEY_agrave                      = LibGdk::KEY_agrave
  KEY_ahook                       = LibGdk::KEY_ahook
  KEY_amacron                     = LibGdk::KEY_amacron
  KEY_ampersand                   = LibGdk::KEY_ampersand
  KEY_aogonek                     = LibGdk::KEY_aogonek
  KEY_apostrophe                  = LibGdk::KEY_apostrophe
  KEY_approxeq                    = LibGdk::KEY_approxeq
  KEY_approximate                 = LibGdk::KEY_approximate
  KEY_aring                       = LibGdk::KEY_aring
  KEY_asciicircum                 = LibGdk::KEY_asciicircum
  KEY_asciitilde                  = LibGdk::KEY_asciitilde
  KEY_asterisk                    = LibGdk::KEY_asterisk
  KEY_at                          = LibGdk::KEY_at
  KEY_atilde                      = LibGdk::KEY_atilde
  KEY_b                           = LibGdk::KEY_b
  KEY_babovedot                   = LibGdk::KEY_babovedot
  KEY_backslash                   = LibGdk::KEY_backslash
  KEY_ballotcross                 = LibGdk::KEY_ballotcross
  KEY_bar                         = LibGdk::KEY_bar
  KEY_because                     = LibGdk::KEY_because
  KEY_blank                       = LibGdk::KEY_blank
  KEY_botintegral                 = LibGdk::KEY_botintegral
  KEY_botleftparens               = LibGdk::KEY_botleftparens
  KEY_botleftsqbracket            = LibGdk::KEY_botleftsqbracket
  KEY_botleftsummation            = LibGdk::KEY_botleftsummation
  KEY_botrightparens              = LibGdk::KEY_botrightparens
  KEY_botrightsqbracket           = LibGdk::KEY_botrightsqbracket
  KEY_botrightsummation           = LibGdk::KEY_botrightsummation
  KEY_bott                        = LibGdk::KEY_bott
  KEY_botvertsummationconnector   = LibGdk::KEY_botvertsummationconnector
  KEY_braceleft                   = LibGdk::KEY_braceleft
  KEY_braceright                  = LibGdk::KEY_braceright
  KEY_bracketleft                 = LibGdk::KEY_bracketleft
  KEY_bracketright                = LibGdk::KEY_bracketright
  KEY_braille_blank               = LibGdk::KEY_braille_blank
  KEY_braille_dot_1               = LibGdk::KEY_braille_dot_1
  KEY_braille_dot_10              = LibGdk::KEY_braille_dot_10
  KEY_braille_dot_2               = LibGdk::KEY_braille_dot_2
  KEY_braille_dot_3               = LibGdk::KEY_braille_dot_3
  KEY_braille_dot_4               = LibGdk::KEY_braille_dot_4
  KEY_braille_dot_5               = LibGdk::KEY_braille_dot_5
  KEY_braille_dot_6               = LibGdk::KEY_braille_dot_6
  KEY_braille_dot_7               = LibGdk::KEY_braille_dot_7
  KEY_braille_dot_8               = LibGdk::KEY_braille_dot_8
  KEY_braille_dot_9               = LibGdk::KEY_braille_dot_9
  KEY_braille_dots_1              = LibGdk::KEY_braille_dots_1
  KEY_braille_dots_12             = LibGdk::KEY_braille_dots_12
  KEY_braille_dots_123            = LibGdk::KEY_braille_dots_123
  KEY_braille_dots_1234           = LibGdk::KEY_braille_dots_1234
  KEY_braille_dots_12345          = LibGdk::KEY_braille_dots_12345
  KEY_braille_dots_123456         = LibGdk::KEY_braille_dots_123456
  KEY_braille_dots_1234567        = LibGdk::KEY_braille_dots_1234567
  KEY_braille_dots_12345678       = LibGdk::KEY_braille_dots_12345678
  KEY_braille_dots_1234568        = LibGdk::KEY_braille_dots_1234568
  KEY_braille_dots_123457         = LibGdk::KEY_braille_dots_123457
  KEY_braille_dots_1234578        = LibGdk::KEY_braille_dots_1234578
  KEY_braille_dots_123458         = LibGdk::KEY_braille_dots_123458
  KEY_braille_dots_12346          = LibGdk::KEY_braille_dots_12346
  KEY_braille_dots_123467         = LibGdk::KEY_braille_dots_123467
  KEY_braille_dots_1234678        = LibGdk::KEY_braille_dots_1234678
  KEY_braille_dots_123468         = LibGdk::KEY_braille_dots_123468
  KEY_braille_dots_12347          = LibGdk::KEY_braille_dots_12347
  KEY_braille_dots_123478         = LibGdk::KEY_braille_dots_123478
  KEY_braille_dots_12348          = LibGdk::KEY_braille_dots_12348
  KEY_braille_dots_1235           = LibGdk::KEY_braille_dots_1235
  KEY_braille_dots_12356          = LibGdk::KEY_braille_dots_12356
  KEY_braille_dots_123567         = LibGdk::KEY_braille_dots_123567
  KEY_braille_dots_1235678        = LibGdk::KEY_braille_dots_1235678
  KEY_braille_dots_123568         = LibGdk::KEY_braille_dots_123568
  KEY_braille_dots_12357          = LibGdk::KEY_braille_dots_12357
  KEY_braille_dots_123578         = LibGdk::KEY_braille_dots_123578
  KEY_braille_dots_12358          = LibGdk::KEY_braille_dots_12358
  KEY_braille_dots_1236           = LibGdk::KEY_braille_dots_1236
  KEY_braille_dots_12367          = LibGdk::KEY_braille_dots_12367
  KEY_braille_dots_123678         = LibGdk::KEY_braille_dots_123678
  KEY_braille_dots_12368          = LibGdk::KEY_braille_dots_12368
  KEY_braille_dots_1237           = LibGdk::KEY_braille_dots_1237
  KEY_braille_dots_12378          = LibGdk::KEY_braille_dots_12378
  KEY_braille_dots_1238           = LibGdk::KEY_braille_dots_1238
  KEY_braille_dots_124            = LibGdk::KEY_braille_dots_124
  KEY_braille_dots_1245           = LibGdk::KEY_braille_dots_1245
  KEY_braille_dots_12456          = LibGdk::KEY_braille_dots_12456
  KEY_braille_dots_124567         = LibGdk::KEY_braille_dots_124567
  KEY_braille_dots_1245678        = LibGdk::KEY_braille_dots_1245678
  KEY_braille_dots_124568         = LibGdk::KEY_braille_dots_124568
  KEY_braille_dots_12457          = LibGdk::KEY_braille_dots_12457
  KEY_braille_dots_124578         = LibGdk::KEY_braille_dots_124578
  KEY_braille_dots_12458          = LibGdk::KEY_braille_dots_12458
  KEY_braille_dots_1246           = LibGdk::KEY_braille_dots_1246
  KEY_braille_dots_12467          = LibGdk::KEY_braille_dots_12467
  KEY_braille_dots_124678         = LibGdk::KEY_braille_dots_124678
  KEY_braille_dots_12468          = LibGdk::KEY_braille_dots_12468
  KEY_braille_dots_1247           = LibGdk::KEY_braille_dots_1247
  KEY_braille_dots_12478          = LibGdk::KEY_braille_dots_12478
  KEY_braille_dots_1248           = LibGdk::KEY_braille_dots_1248
  KEY_braille_dots_125            = LibGdk::KEY_braille_dots_125
  KEY_braille_dots_1256           = LibGdk::KEY_braille_dots_1256
  KEY_braille_dots_12567          = LibGdk::KEY_braille_dots_12567
  KEY_braille_dots_125678         = LibGdk::KEY_braille_dots_125678
  KEY_braille_dots_12568          = LibGdk::KEY_braille_dots_12568
  KEY_braille_dots_1257           = LibGdk::KEY_braille_dots_1257
  KEY_braille_dots_12578          = LibGdk::KEY_braille_dots_12578
  KEY_braille_dots_1258           = LibGdk::KEY_braille_dots_1258
  KEY_braille_dots_126            = LibGdk::KEY_braille_dots_126
  KEY_braille_dots_1267           = LibGdk::KEY_braille_dots_1267
  KEY_braille_dots_12678          = LibGdk::KEY_braille_dots_12678
  KEY_braille_dots_1268           = LibGdk::KEY_braille_dots_1268
  KEY_braille_dots_127            = LibGdk::KEY_braille_dots_127
  KEY_braille_dots_1278           = LibGdk::KEY_braille_dots_1278
  KEY_braille_dots_128            = LibGdk::KEY_braille_dots_128
  KEY_braille_dots_13             = LibGdk::KEY_braille_dots_13
  KEY_braille_dots_134            = LibGdk::KEY_braille_dots_134
  KEY_braille_dots_1345           = LibGdk::KEY_braille_dots_1345
  KEY_braille_dots_13456          = LibGdk::KEY_braille_dots_13456
  KEY_braille_dots_134567         = LibGdk::KEY_braille_dots_134567
  KEY_braille_dots_1345678        = LibGdk::KEY_braille_dots_1345678
  KEY_braille_dots_134568         = LibGdk::KEY_braille_dots_134568
  KEY_braille_dots_13457          = LibGdk::KEY_braille_dots_13457
  KEY_braille_dots_134578         = LibGdk::KEY_braille_dots_134578
  KEY_braille_dots_13458          = LibGdk::KEY_braille_dots_13458
  KEY_braille_dots_1346           = LibGdk::KEY_braille_dots_1346
  KEY_braille_dots_13467          = LibGdk::KEY_braille_dots_13467
  KEY_braille_dots_134678         = LibGdk::KEY_braille_dots_134678
  KEY_braille_dots_13468          = LibGdk::KEY_braille_dots_13468
  KEY_braille_dots_1347           = LibGdk::KEY_braille_dots_1347
  KEY_braille_dots_13478          = LibGdk::KEY_braille_dots_13478
  KEY_braille_dots_1348           = LibGdk::KEY_braille_dots_1348
  KEY_braille_dots_135            = LibGdk::KEY_braille_dots_135
  KEY_braille_dots_1356           = LibGdk::KEY_braille_dots_1356
  KEY_braille_dots_13567          = LibGdk::KEY_braille_dots_13567
  KEY_braille_dots_135678         = LibGdk::KEY_braille_dots_135678
  KEY_braille_dots_13568          = LibGdk::KEY_braille_dots_13568
  KEY_braille_dots_1357           = LibGdk::KEY_braille_dots_1357
  KEY_braille_dots_13578          = LibGdk::KEY_braille_dots_13578
  KEY_braille_dots_1358           = LibGdk::KEY_braille_dots_1358
  KEY_braille_dots_136            = LibGdk::KEY_braille_dots_136
  KEY_braille_dots_1367           = LibGdk::KEY_braille_dots_1367
  KEY_braille_dots_13678          = LibGdk::KEY_braille_dots_13678
  KEY_braille_dots_1368           = LibGdk::KEY_braille_dots_1368
  KEY_braille_dots_137            = LibGdk::KEY_braille_dots_137
  KEY_braille_dots_1378           = LibGdk::KEY_braille_dots_1378
  KEY_braille_dots_138            = LibGdk::KEY_braille_dots_138
  KEY_braille_dots_14             = LibGdk::KEY_braille_dots_14
  KEY_braille_dots_145            = LibGdk::KEY_braille_dots_145
  KEY_braille_dots_1456           = LibGdk::KEY_braille_dots_1456
  KEY_braille_dots_14567          = LibGdk::KEY_braille_dots_14567
  KEY_braille_dots_145678         = LibGdk::KEY_braille_dots_145678
  KEY_braille_dots_14568          = LibGdk::KEY_braille_dots_14568
  KEY_braille_dots_1457           = LibGdk::KEY_braille_dots_1457
  KEY_braille_dots_14578          = LibGdk::KEY_braille_dots_14578
  KEY_braille_dots_1458           = LibGdk::KEY_braille_dots_1458
  KEY_braille_dots_146            = LibGdk::KEY_braille_dots_146
  KEY_braille_dots_1467           = LibGdk::KEY_braille_dots_1467
  KEY_braille_dots_14678          = LibGdk::KEY_braille_dots_14678
  KEY_braille_dots_1468           = LibGdk::KEY_braille_dots_1468
  KEY_braille_dots_147            = LibGdk::KEY_braille_dots_147
  KEY_braille_dots_1478           = LibGdk::KEY_braille_dots_1478
  KEY_braille_dots_148            = LibGdk::KEY_braille_dots_148
  KEY_braille_dots_15             = LibGdk::KEY_braille_dots_15
  KEY_braille_dots_156            = LibGdk::KEY_braille_dots_156
  KEY_braille_dots_1567           = LibGdk::KEY_braille_dots_1567
  KEY_braille_dots_15678          = LibGdk::KEY_braille_dots_15678
  KEY_braille_dots_1568           = LibGdk::KEY_braille_dots_1568
  KEY_braille_dots_157            = LibGdk::KEY_braille_dots_157
  KEY_braille_dots_1578           = LibGdk::KEY_braille_dots_1578
  KEY_braille_dots_158            = LibGdk::KEY_braille_dots_158
  KEY_braille_dots_16             = LibGdk::KEY_braille_dots_16
  KEY_braille_dots_167            = LibGdk::KEY_braille_dots_167
  KEY_braille_dots_1678           = LibGdk::KEY_braille_dots_1678
  KEY_braille_dots_168            = LibGdk::KEY_braille_dots_168
  KEY_braille_dots_17             = LibGdk::KEY_braille_dots_17
  KEY_braille_dots_178            = LibGdk::KEY_braille_dots_178
  KEY_braille_dots_18             = LibGdk::KEY_braille_dots_18
  KEY_braille_dots_2              = LibGdk::KEY_braille_dots_2
  KEY_braille_dots_23             = LibGdk::KEY_braille_dots_23
  KEY_braille_dots_234            = LibGdk::KEY_braille_dots_234
  KEY_braille_dots_2345           = LibGdk::KEY_braille_dots_2345
  KEY_braille_dots_23456          = LibGdk::KEY_braille_dots_23456
  KEY_braille_dots_234567         = LibGdk::KEY_braille_dots_234567
  KEY_braille_dots_2345678        = LibGdk::KEY_braille_dots_2345678
  KEY_braille_dots_234568         = LibGdk::KEY_braille_dots_234568
  KEY_braille_dots_23457          = LibGdk::KEY_braille_dots_23457
  KEY_braille_dots_234578         = LibGdk::KEY_braille_dots_234578
  KEY_braille_dots_23458          = LibGdk::KEY_braille_dots_23458
  KEY_braille_dots_2346           = LibGdk::KEY_braille_dots_2346
  KEY_braille_dots_23467          = LibGdk::KEY_braille_dots_23467
  KEY_braille_dots_234678         = LibGdk::KEY_braille_dots_234678
  KEY_braille_dots_23468          = LibGdk::KEY_braille_dots_23468
  KEY_braille_dots_2347           = LibGdk::KEY_braille_dots_2347
  KEY_braille_dots_23478          = LibGdk::KEY_braille_dots_23478
  KEY_braille_dots_2348           = LibGdk::KEY_braille_dots_2348
  KEY_braille_dots_235            = LibGdk::KEY_braille_dots_235
  KEY_braille_dots_2356           = LibGdk::KEY_braille_dots_2356
  KEY_braille_dots_23567          = LibGdk::KEY_braille_dots_23567
  KEY_braille_dots_235678         = LibGdk::KEY_braille_dots_235678
  KEY_braille_dots_23568          = LibGdk::KEY_braille_dots_23568
  KEY_braille_dots_2357           = LibGdk::KEY_braille_dots_2357
  KEY_braille_dots_23578          = LibGdk::KEY_braille_dots_23578
  KEY_braille_dots_2358           = LibGdk::KEY_braille_dots_2358
  KEY_braille_dots_236            = LibGdk::KEY_braille_dots_236
  KEY_braille_dots_2367           = LibGdk::KEY_braille_dots_2367
  KEY_braille_dots_23678          = LibGdk::KEY_braille_dots_23678
  KEY_braille_dots_2368           = LibGdk::KEY_braille_dots_2368
  KEY_braille_dots_237            = LibGdk::KEY_braille_dots_237
  KEY_braille_dots_2378           = LibGdk::KEY_braille_dots_2378
  KEY_braille_dots_238            = LibGdk::KEY_braille_dots_238
  KEY_braille_dots_24             = LibGdk::KEY_braille_dots_24
  KEY_braille_dots_245            = LibGdk::KEY_braille_dots_245
  KEY_braille_dots_2456           = LibGdk::KEY_braille_dots_2456
  KEY_braille_dots_24567          = LibGdk::KEY_braille_dots_24567
  KEY_braille_dots_245678         = LibGdk::KEY_braille_dots_245678
  KEY_braille_dots_24568          = LibGdk::KEY_braille_dots_24568
  KEY_braille_dots_2457           = LibGdk::KEY_braille_dots_2457
  KEY_braille_dots_24578          = LibGdk::KEY_braille_dots_24578
  KEY_braille_dots_2458           = LibGdk::KEY_braille_dots_2458
  KEY_braille_dots_246            = LibGdk::KEY_braille_dots_246
  KEY_braille_dots_2467           = LibGdk::KEY_braille_dots_2467
  KEY_braille_dots_24678          = LibGdk::KEY_braille_dots_24678
  KEY_braille_dots_2468           = LibGdk::KEY_braille_dots_2468
  KEY_braille_dots_247            = LibGdk::KEY_braille_dots_247
  KEY_braille_dots_2478           = LibGdk::KEY_braille_dots_2478
  KEY_braille_dots_248            = LibGdk::KEY_braille_dots_248
  KEY_braille_dots_25             = LibGdk::KEY_braille_dots_25
  KEY_braille_dots_256            = LibGdk::KEY_braille_dots_256
  KEY_braille_dots_2567           = LibGdk::KEY_braille_dots_2567
  KEY_braille_dots_25678          = LibGdk::KEY_braille_dots_25678
  KEY_braille_dots_2568           = LibGdk::KEY_braille_dots_2568
  KEY_braille_dots_257            = LibGdk::KEY_braille_dots_257
  KEY_braille_dots_2578           = LibGdk::KEY_braille_dots_2578
  KEY_braille_dots_258            = LibGdk::KEY_braille_dots_258
  KEY_braille_dots_26             = LibGdk::KEY_braille_dots_26
  KEY_braille_dots_267            = LibGdk::KEY_braille_dots_267
  KEY_braille_dots_2678           = LibGdk::KEY_braille_dots_2678
  KEY_braille_dots_268            = LibGdk::KEY_braille_dots_268
  KEY_braille_dots_27             = LibGdk::KEY_braille_dots_27
  KEY_braille_dots_278            = LibGdk::KEY_braille_dots_278
  KEY_braille_dots_28             = LibGdk::KEY_braille_dots_28
  KEY_braille_dots_3              = LibGdk::KEY_braille_dots_3
  KEY_braille_dots_34             = LibGdk::KEY_braille_dots_34
  KEY_braille_dots_345            = LibGdk::KEY_braille_dots_345
  KEY_braille_dots_3456           = LibGdk::KEY_braille_dots_3456
  KEY_braille_dots_34567          = LibGdk::KEY_braille_dots_34567
  KEY_braille_dots_345678         = LibGdk::KEY_braille_dots_345678
  KEY_braille_dots_34568          = LibGdk::KEY_braille_dots_34568
  KEY_braille_dots_3457           = LibGdk::KEY_braille_dots_3457
  KEY_braille_dots_34578          = LibGdk::KEY_braille_dots_34578
  KEY_braille_dots_3458           = LibGdk::KEY_braille_dots_3458
  KEY_braille_dots_346            = LibGdk::KEY_braille_dots_346
  KEY_braille_dots_3467           = LibGdk::KEY_braille_dots_3467
  KEY_braille_dots_34678          = LibGdk::KEY_braille_dots_34678
  KEY_braille_dots_3468           = LibGdk::KEY_braille_dots_3468
  KEY_braille_dots_347            = LibGdk::KEY_braille_dots_347
  KEY_braille_dots_3478           = LibGdk::KEY_braille_dots_3478
  KEY_braille_dots_348            = LibGdk::KEY_braille_dots_348
  KEY_braille_dots_35             = LibGdk::KEY_braille_dots_35
  KEY_braille_dots_356            = LibGdk::KEY_braille_dots_356
  KEY_braille_dots_3567           = LibGdk::KEY_braille_dots_3567
  KEY_braille_dots_35678          = LibGdk::KEY_braille_dots_35678
  KEY_braille_dots_3568           = LibGdk::KEY_braille_dots_3568
  KEY_braille_dots_357            = LibGdk::KEY_braille_dots_357
  KEY_braille_dots_3578           = LibGdk::KEY_braille_dots_3578
  KEY_braille_dots_358            = LibGdk::KEY_braille_dots_358
  KEY_braille_dots_36             = LibGdk::KEY_braille_dots_36
  KEY_braille_dots_367            = LibGdk::KEY_braille_dots_367
  KEY_braille_dots_3678           = LibGdk::KEY_braille_dots_3678
  KEY_braille_dots_368            = LibGdk::KEY_braille_dots_368
  KEY_braille_dots_37             = LibGdk::KEY_braille_dots_37
  KEY_braille_dots_378            = LibGdk::KEY_braille_dots_378
  KEY_braille_dots_38             = LibGdk::KEY_braille_dots_38
  KEY_braille_dots_4              = LibGdk::KEY_braille_dots_4
  KEY_braille_dots_45             = LibGdk::KEY_braille_dots_45
  KEY_braille_dots_456            = LibGdk::KEY_braille_dots_456
  KEY_braille_dots_4567           = LibGdk::KEY_braille_dots_4567
  KEY_braille_dots_45678          = LibGdk::KEY_braille_dots_45678
  KEY_braille_dots_4568           = LibGdk::KEY_braille_dots_4568
  KEY_braille_dots_457            = LibGdk::KEY_braille_dots_457
  KEY_braille_dots_4578           = LibGdk::KEY_braille_dots_4578
  KEY_braille_dots_458            = LibGdk::KEY_braille_dots_458
  KEY_braille_dots_46             = LibGdk::KEY_braille_dots_46
  KEY_braille_dots_467            = LibGdk::KEY_braille_dots_467
  KEY_braille_dots_4678           = LibGdk::KEY_braille_dots_4678
  KEY_braille_dots_468            = LibGdk::KEY_braille_dots_468
  KEY_braille_dots_47             = LibGdk::KEY_braille_dots_47
  KEY_braille_dots_478            = LibGdk::KEY_braille_dots_478
  KEY_braille_dots_48             = LibGdk::KEY_braille_dots_48
  KEY_braille_dots_5              = LibGdk::KEY_braille_dots_5
  KEY_braille_dots_56             = LibGdk::KEY_braille_dots_56
  KEY_braille_dots_567            = LibGdk::KEY_braille_dots_567
  KEY_braille_dots_5678           = LibGdk::KEY_braille_dots_5678
  KEY_braille_dots_568            = LibGdk::KEY_braille_dots_568
  KEY_braille_dots_57             = LibGdk::KEY_braille_dots_57
  KEY_braille_dots_578            = LibGdk::KEY_braille_dots_578
  KEY_braille_dots_58             = LibGdk::KEY_braille_dots_58
  KEY_braille_dots_6              = LibGdk::KEY_braille_dots_6
  KEY_braille_dots_67             = LibGdk::KEY_braille_dots_67
  KEY_braille_dots_678            = LibGdk::KEY_braille_dots_678
  KEY_braille_dots_68             = LibGdk::KEY_braille_dots_68
  KEY_braille_dots_7              = LibGdk::KEY_braille_dots_7
  KEY_braille_dots_78             = LibGdk::KEY_braille_dots_78
  KEY_braille_dots_8              = LibGdk::KEY_braille_dots_8
  KEY_breve                       = LibGdk::KEY_breve
  KEY_brokenbar                   = LibGdk::KEY_brokenbar
  KEY_c                           = LibGdk::KEY_c
  KEY_c_h                         = LibGdk::KEY_c_h
  KEY_cabovedot                   = LibGdk::KEY_cabovedot
  KEY_cacute                      = LibGdk::KEY_cacute
  KEY_careof                      = LibGdk::KEY_careof
  KEY_caret                       = LibGdk::KEY_caret
  KEY_caron                       = LibGdk::KEY_caron
  KEY_ccaron                      = LibGdk::KEY_ccaron
  KEY_ccedilla                    = LibGdk::KEY_ccedilla
  KEY_ccircumflex                 = LibGdk::KEY_ccircumflex
  KEY_cedilla                     = LibGdk::KEY_cedilla
  KEY_cent                        = LibGdk::KEY_cent
  KEY_ch                          = LibGdk::KEY_ch
  KEY_checkerboard                = LibGdk::KEY_checkerboard
  KEY_checkmark                   = LibGdk::KEY_checkmark
  KEY_circle                      = LibGdk::KEY_circle
  KEY_club                        = LibGdk::KEY_club
  KEY_colon                       = LibGdk::KEY_colon
  KEY_comma                       = LibGdk::KEY_comma
  KEY_containsas                  = LibGdk::KEY_containsas
  KEY_copyright                   = LibGdk::KEY_copyright
  KEY_cr                          = LibGdk::KEY_cr
  KEY_crossinglines               = LibGdk::KEY_crossinglines
  KEY_cuberoot                    = LibGdk::KEY_cuberoot
  KEY_currency                    = LibGdk::KEY_currency
  KEY_cursor                      = LibGdk::KEY_cursor
  KEY_d                           = LibGdk::KEY_d
  KEY_dabovedot                   = LibGdk::KEY_dabovedot
  KEY_dagger                      = LibGdk::KEY_dagger
  KEY_dcaron                      = LibGdk::KEY_dcaron
  KEY_dead_A                      = LibGdk::KEY_dead_A
  KEY_dead_E                      = LibGdk::KEY_dead_E
  KEY_dead_I                      = LibGdk::KEY_dead_I
  KEY_dead_O                      = LibGdk::KEY_dead_O
  KEY_dead_U                      = LibGdk::KEY_dead_U
  KEY_dead_a                      = LibGdk::KEY_dead_a
  KEY_dead_abovecomma             = LibGdk::KEY_dead_abovecomma
  KEY_dead_abovedot               = LibGdk::KEY_dead_abovedot
  KEY_dead_abovereversedcomma     = LibGdk::KEY_dead_abovereversedcomma
  KEY_dead_abovering              = LibGdk::KEY_dead_abovering
  KEY_dead_acute                  = LibGdk::KEY_dead_acute
  KEY_dead_belowbreve             = LibGdk::KEY_dead_belowbreve
  KEY_dead_belowcircumflex        = LibGdk::KEY_dead_belowcircumflex
  KEY_dead_belowcomma             = LibGdk::KEY_dead_belowcomma
  KEY_dead_belowdiaeresis         = LibGdk::KEY_dead_belowdiaeresis
  KEY_dead_belowdot               = LibGdk::KEY_dead_belowdot
  KEY_dead_belowmacron            = LibGdk::KEY_dead_belowmacron
  KEY_dead_belowring              = LibGdk::KEY_dead_belowring
  KEY_dead_belowtilde             = LibGdk::KEY_dead_belowtilde
  KEY_dead_breve                  = LibGdk::KEY_dead_breve
  KEY_dead_capital_schwa          = LibGdk::KEY_dead_capital_schwa
  KEY_dead_caron                  = LibGdk::KEY_dead_caron
  KEY_dead_cedilla                = LibGdk::KEY_dead_cedilla
  KEY_dead_circumflex             = LibGdk::KEY_dead_circumflex
  KEY_dead_currency               = LibGdk::KEY_dead_currency
  KEY_dead_dasia                  = LibGdk::KEY_dead_dasia
  KEY_dead_diaeresis              = LibGdk::KEY_dead_diaeresis
  KEY_dead_doubleacute            = LibGdk::KEY_dead_doubleacute
  KEY_dead_doublegrave            = LibGdk::KEY_dead_doublegrave
  KEY_dead_e                      = LibGdk::KEY_dead_e
  KEY_dead_grave                  = LibGdk::KEY_dead_grave
  KEY_dead_greek                  = LibGdk::KEY_dead_greek
  KEY_dead_hook                   = LibGdk::KEY_dead_hook
  KEY_dead_horn                   = LibGdk::KEY_dead_horn
  KEY_dead_i                      = LibGdk::KEY_dead_i
  KEY_dead_invertedbreve          = LibGdk::KEY_dead_invertedbreve
  KEY_dead_iota                   = LibGdk::KEY_dead_iota
  KEY_dead_macron                 = LibGdk::KEY_dead_macron
  KEY_dead_o                      = LibGdk::KEY_dead_o
  KEY_dead_ogonek                 = LibGdk::KEY_dead_ogonek
  KEY_dead_perispomeni            = LibGdk::KEY_dead_perispomeni
  KEY_dead_psili                  = LibGdk::KEY_dead_psili
  KEY_dead_semivoiced_sound       = LibGdk::KEY_dead_semivoiced_sound
  KEY_dead_small_schwa            = LibGdk::KEY_dead_small_schwa
  KEY_dead_stroke                 = LibGdk::KEY_dead_stroke
  KEY_dead_tilde                  = LibGdk::KEY_dead_tilde
  KEY_dead_u                      = LibGdk::KEY_dead_u
  KEY_dead_voiced_sound           = LibGdk::KEY_dead_voiced_sound
  KEY_decimalpoint                = LibGdk::KEY_decimalpoint
  KEY_degree                      = LibGdk::KEY_degree
  KEY_diaeresis                   = LibGdk::KEY_diaeresis
  KEY_diamond                     = LibGdk::KEY_diamond
  KEY_digitspace                  = LibGdk::KEY_digitspace
  KEY_dintegral                   = LibGdk::KEY_dintegral
  KEY_division                    = LibGdk::KEY_division
  KEY_dollar                      = LibGdk::KEY_dollar
  KEY_doubbaselinedot             = LibGdk::KEY_doubbaselinedot
  KEY_doubleacute                 = LibGdk::KEY_doubleacute
  KEY_doubledagger                = LibGdk::KEY_doubledagger
  KEY_doublelowquotemark          = LibGdk::KEY_doublelowquotemark
  KEY_downarrow                   = LibGdk::KEY_downarrow
  KEY_downcaret                   = LibGdk::KEY_downcaret
  KEY_downshoe                    = LibGdk::KEY_downshoe
  KEY_downstile                   = LibGdk::KEY_downstile
  KEY_downtack                    = LibGdk::KEY_downtack
  KEY_dstroke                     = LibGdk::KEY_dstroke
  KEY_e                           = LibGdk::KEY_e
  KEY_eabovedot                   = LibGdk::KEY_eabovedot
  KEY_eacute                      = LibGdk::KEY_eacute
  KEY_ebelowdot                   = LibGdk::KEY_ebelowdot
  KEY_ecaron                      = LibGdk::KEY_ecaron
  KEY_ecircumflex                 = LibGdk::KEY_ecircumflex
  KEY_ecircumflexacute            = LibGdk::KEY_ecircumflexacute
  KEY_ecircumflexbelowdot         = LibGdk::KEY_ecircumflexbelowdot
  KEY_ecircumflexgrave            = LibGdk::KEY_ecircumflexgrave
  KEY_ecircumflexhook             = LibGdk::KEY_ecircumflexhook
  KEY_ecircumflextilde            = LibGdk::KEY_ecircumflextilde
  KEY_ediaeresis                  = LibGdk::KEY_ediaeresis
  KEY_egrave                      = LibGdk::KEY_egrave
  KEY_ehook                       = LibGdk::KEY_ehook
  KEY_eightsubscript              = LibGdk::KEY_eightsubscript
  KEY_eightsuperior               = LibGdk::KEY_eightsuperior
  KEY_elementof                   = LibGdk::KEY_elementof
  KEY_ellipsis                    = LibGdk::KEY_ellipsis
  KEY_em3space                    = LibGdk::KEY_em3space
  KEY_em4space                    = LibGdk::KEY_em4space
  KEY_emacron                     = LibGdk::KEY_emacron
  KEY_emdash                      = LibGdk::KEY_emdash
  KEY_emfilledcircle              = LibGdk::KEY_emfilledcircle
  KEY_emfilledrect                = LibGdk::KEY_emfilledrect
  KEY_emopencircle                = LibGdk::KEY_emopencircle
  KEY_emopenrectangle             = LibGdk::KEY_emopenrectangle
  KEY_emptyset                    = LibGdk::KEY_emptyset
  KEY_emspace                     = LibGdk::KEY_emspace
  KEY_endash                      = LibGdk::KEY_endash
  KEY_enfilledcircbullet          = LibGdk::KEY_enfilledcircbullet
  KEY_enfilledsqbullet            = LibGdk::KEY_enfilledsqbullet
  KEY_eng                         = LibGdk::KEY_eng
  KEY_enopencircbullet            = LibGdk::KEY_enopencircbullet
  KEY_enopensquarebullet          = LibGdk::KEY_enopensquarebullet
  KEY_enspace                     = LibGdk::KEY_enspace
  KEY_eogonek                     = LibGdk::KEY_eogonek
  KEY_equal                       = LibGdk::KEY_equal
  KEY_eth                         = LibGdk::KEY_eth
  KEY_etilde                      = LibGdk::KEY_etilde
  KEY_exclam                      = LibGdk::KEY_exclam
  KEY_exclamdown                  = LibGdk::KEY_exclamdown
  KEY_ezh                         = LibGdk::KEY_ezh
  KEY_f                           = LibGdk::KEY_f
  KEY_fabovedot                   = LibGdk::KEY_fabovedot
  KEY_femalesymbol                = LibGdk::KEY_femalesymbol
  KEY_ff                          = LibGdk::KEY_ff
  KEY_figdash                     = LibGdk::KEY_figdash
  KEY_filledlefttribullet         = LibGdk::KEY_filledlefttribullet
  KEY_filledrectbullet            = LibGdk::KEY_filledrectbullet
  KEY_filledrighttribullet        = LibGdk::KEY_filledrighttribullet
  KEY_filledtribulletdown         = LibGdk::KEY_filledtribulletdown
  KEY_filledtribulletup           = LibGdk::KEY_filledtribulletup
  KEY_fiveeighths                 = LibGdk::KEY_fiveeighths
  KEY_fivesixths                  = LibGdk::KEY_fivesixths
  KEY_fivesubscript               = LibGdk::KEY_fivesubscript
  KEY_fivesuperior                = LibGdk::KEY_fivesuperior
  KEY_fourfifths                  = LibGdk::KEY_fourfifths
  KEY_foursubscript               = LibGdk::KEY_foursubscript
  KEY_foursuperior                = LibGdk::KEY_foursuperior
  KEY_fourthroot                  = LibGdk::KEY_fourthroot
  KEY_function                    = LibGdk::KEY_function
  KEY_g                           = LibGdk::KEY_g
  KEY_gabovedot                   = LibGdk::KEY_gabovedot
  KEY_gbreve                      = LibGdk::KEY_gbreve
  KEY_gcaron                      = LibGdk::KEY_gcaron
  KEY_gcedilla                    = LibGdk::KEY_gcedilla
  KEY_gcircumflex                 = LibGdk::KEY_gcircumflex
  KEY_grave                       = LibGdk::KEY_grave
  KEY_greater                     = LibGdk::KEY_greater
  KEY_greaterthanequal            = LibGdk::KEY_greaterthanequal
  KEY_guillemotleft               = LibGdk::KEY_guillemotleft
  KEY_guillemotright              = LibGdk::KEY_guillemotright
  KEY_h                           = LibGdk::KEY_h
  KEY_hairspace                   = LibGdk::KEY_hairspace
  KEY_hcircumflex                 = LibGdk::KEY_hcircumflex
  KEY_heart                       = LibGdk::KEY_heart
  KEY_hebrew_aleph                = LibGdk::KEY_hebrew_aleph
  KEY_hebrew_ayin                 = LibGdk::KEY_hebrew_ayin
  KEY_hebrew_bet                  = LibGdk::KEY_hebrew_bet
  KEY_hebrew_beth                 = LibGdk::KEY_hebrew_beth
  KEY_hebrew_chet                 = LibGdk::KEY_hebrew_chet
  KEY_hebrew_dalet                = LibGdk::KEY_hebrew_dalet
  KEY_hebrew_daleth               = LibGdk::KEY_hebrew_daleth
  KEY_hebrew_doublelowline        = LibGdk::KEY_hebrew_doublelowline
  KEY_hebrew_finalkaph            = LibGdk::KEY_hebrew_finalkaph
  KEY_hebrew_finalmem             = LibGdk::KEY_hebrew_finalmem
  KEY_hebrew_finalnun             = LibGdk::KEY_hebrew_finalnun
  KEY_hebrew_finalpe              = LibGdk::KEY_hebrew_finalpe
  KEY_hebrew_finalzade            = LibGdk::KEY_hebrew_finalzade
  KEY_hebrew_finalzadi            = LibGdk::KEY_hebrew_finalzadi
  KEY_hebrew_gimel                = LibGdk::KEY_hebrew_gimel
  KEY_hebrew_gimmel               = LibGdk::KEY_hebrew_gimmel
  KEY_hebrew_he                   = LibGdk::KEY_hebrew_he
  KEY_hebrew_het                  = LibGdk::KEY_hebrew_het
  KEY_hebrew_kaph                 = LibGdk::KEY_hebrew_kaph
  KEY_hebrew_kuf                  = LibGdk::KEY_hebrew_kuf
  KEY_hebrew_lamed                = LibGdk::KEY_hebrew_lamed
  KEY_hebrew_mem                  = LibGdk::KEY_hebrew_mem
  KEY_hebrew_nun                  = LibGdk::KEY_hebrew_nun
  KEY_hebrew_pe                   = LibGdk::KEY_hebrew_pe
  KEY_hebrew_qoph                 = LibGdk::KEY_hebrew_qoph
  KEY_hebrew_resh                 = LibGdk::KEY_hebrew_resh
  KEY_hebrew_samech               = LibGdk::KEY_hebrew_samech
  KEY_hebrew_samekh               = LibGdk::KEY_hebrew_samekh
  KEY_hebrew_shin                 = LibGdk::KEY_hebrew_shin
  KEY_hebrew_taf                  = LibGdk::KEY_hebrew_taf
  KEY_hebrew_taw                  = LibGdk::KEY_hebrew_taw
  KEY_hebrew_tet                  = LibGdk::KEY_hebrew_tet
  KEY_hebrew_teth                 = LibGdk::KEY_hebrew_teth
  KEY_hebrew_waw                  = LibGdk::KEY_hebrew_waw
  KEY_hebrew_yod                  = LibGdk::KEY_hebrew_yod
  KEY_hebrew_zade                 = LibGdk::KEY_hebrew_zade
  KEY_hebrew_zadi                 = LibGdk::KEY_hebrew_zadi
  KEY_hebrew_zain                 = LibGdk::KEY_hebrew_zain
  KEY_hebrew_zayin                = LibGdk::KEY_hebrew_zayin
  KEY_hexagram                    = LibGdk::KEY_hexagram
  KEY_horizconnector              = LibGdk::KEY_horizconnector
  KEY_horizlinescan1              = LibGdk::KEY_horizlinescan1
  KEY_horizlinescan3              = LibGdk::KEY_horizlinescan3
  KEY_horizlinescan5              = LibGdk::KEY_horizlinescan5
  KEY_horizlinescan7              = LibGdk::KEY_horizlinescan7
  KEY_horizlinescan9              = LibGdk::KEY_horizlinescan9
  KEY_hstroke                     = LibGdk::KEY_hstroke
  KEY_ht                          = LibGdk::KEY_ht
  KEY_hyphen                      = LibGdk::KEY_hyphen
  KEY_i                           = LibGdk::KEY_i
  KEY_iTouch                      = LibGdk::KEY_iTouch
  KEY_iacute                      = LibGdk::KEY_iacute
  KEY_ibelowdot                   = LibGdk::KEY_ibelowdot
  KEY_ibreve                      = LibGdk::KEY_ibreve
  KEY_icircumflex                 = LibGdk::KEY_icircumflex
  KEY_identical                   = LibGdk::KEY_identical
  KEY_idiaeresis                  = LibGdk::KEY_idiaeresis
  KEY_idotless                    = LibGdk::KEY_idotless
  KEY_ifonlyif                    = LibGdk::KEY_ifonlyif
  KEY_igrave                      = LibGdk::KEY_igrave
  KEY_ihook                       = LibGdk::KEY_ihook
  KEY_imacron                     = LibGdk::KEY_imacron
  KEY_implies                     = LibGdk::KEY_implies
  KEY_includedin                  = LibGdk::KEY_includedin
  KEY_includes                    = LibGdk::KEY_includes
  KEY_infinity                    = LibGdk::KEY_infinity
  KEY_integral                    = LibGdk::KEY_integral
  KEY_intersection                = LibGdk::KEY_intersection
  KEY_iogonek                     = LibGdk::KEY_iogonek
  KEY_itilde                      = LibGdk::KEY_itilde
  KEY_j                           = LibGdk::KEY_j
  KEY_jcircumflex                 = LibGdk::KEY_jcircumflex
  KEY_jot                         = LibGdk::KEY_jot
  KEY_k                           = LibGdk::KEY_k
  KEY_kana_A                      = LibGdk::KEY_kana_A
  KEY_kana_CHI                    = LibGdk::KEY_kana_CHI
  KEY_kana_E                      = LibGdk::KEY_kana_E
  KEY_kana_FU                     = LibGdk::KEY_kana_FU
  KEY_kana_HA                     = LibGdk::KEY_kana_HA
  KEY_kana_HE                     = LibGdk::KEY_kana_HE
  KEY_kana_HI                     = LibGdk::KEY_kana_HI
  KEY_kana_HO                     = LibGdk::KEY_kana_HO
  KEY_kana_HU                     = LibGdk::KEY_kana_HU
  KEY_kana_I                      = LibGdk::KEY_kana_I
  KEY_kana_KA                     = LibGdk::KEY_kana_KA
  KEY_kana_KE                     = LibGdk::KEY_kana_KE
  KEY_kana_KI                     = LibGdk::KEY_kana_KI
  KEY_kana_KO                     = LibGdk::KEY_kana_KO
  KEY_kana_KU                     = LibGdk::KEY_kana_KU
  KEY_kana_MA                     = LibGdk::KEY_kana_MA
  KEY_kana_ME                     = LibGdk::KEY_kana_ME
  KEY_kana_MI                     = LibGdk::KEY_kana_MI
  KEY_kana_MO                     = LibGdk::KEY_kana_MO
  KEY_kana_MU                     = LibGdk::KEY_kana_MU
  KEY_kana_N                      = LibGdk::KEY_kana_N
  KEY_kana_NA                     = LibGdk::KEY_kana_NA
  KEY_kana_NE                     = LibGdk::KEY_kana_NE
  KEY_kana_NI                     = LibGdk::KEY_kana_NI
  KEY_kana_NO                     = LibGdk::KEY_kana_NO
  KEY_kana_NU                     = LibGdk::KEY_kana_NU
  KEY_kana_O                      = LibGdk::KEY_kana_O
  KEY_kana_RA                     = LibGdk::KEY_kana_RA
  KEY_kana_RE                     = LibGdk::KEY_kana_RE
  KEY_kana_RI                     = LibGdk::KEY_kana_RI
  KEY_kana_RO                     = LibGdk::KEY_kana_RO
  KEY_kana_RU                     = LibGdk::KEY_kana_RU
  KEY_kana_SA                     = LibGdk::KEY_kana_SA
  KEY_kana_SE                     = LibGdk::KEY_kana_SE
  KEY_kana_SHI                    = LibGdk::KEY_kana_SHI
  KEY_kana_SO                     = LibGdk::KEY_kana_SO
  KEY_kana_SU                     = LibGdk::KEY_kana_SU
  KEY_kana_TA                     = LibGdk::KEY_kana_TA
  KEY_kana_TE                     = LibGdk::KEY_kana_TE
  KEY_kana_TI                     = LibGdk::KEY_kana_TI
  KEY_kana_TO                     = LibGdk::KEY_kana_TO
  KEY_kana_TSU                    = LibGdk::KEY_kana_TSU
  KEY_kana_TU                     = LibGdk::KEY_kana_TU
  KEY_kana_U                      = LibGdk::KEY_kana_U
  KEY_kana_WA                     = LibGdk::KEY_kana_WA
  KEY_kana_WO                     = LibGdk::KEY_kana_WO
  KEY_kana_YA                     = LibGdk::KEY_kana_YA
  KEY_kana_YO                     = LibGdk::KEY_kana_YO
  KEY_kana_YU                     = LibGdk::KEY_kana_YU
  KEY_kana_a                      = LibGdk::KEY_kana_a
  KEY_kana_closingbracket         = LibGdk::KEY_kana_closingbracket
  KEY_kana_comma                  = LibGdk::KEY_kana_comma
  KEY_kana_conjunctive            = LibGdk::KEY_kana_conjunctive
  KEY_kana_e                      = LibGdk::KEY_kana_e
  KEY_kana_fullstop               = LibGdk::KEY_kana_fullstop
  KEY_kana_i                      = LibGdk::KEY_kana_i
  KEY_kana_middledot              = LibGdk::KEY_kana_middledot
  KEY_kana_o                      = LibGdk::KEY_kana_o
  KEY_kana_openingbracket         = LibGdk::KEY_kana_openingbracket
  KEY_kana_switch                 = LibGdk::KEY_kana_switch
  KEY_kana_tsu                    = LibGdk::KEY_kana_tsu
  KEY_kana_tu                     = LibGdk::KEY_kana_tu
  KEY_kana_u                      = LibGdk::KEY_kana_u
  KEY_kana_ya                     = LibGdk::KEY_kana_ya
  KEY_kana_yo                     = LibGdk::KEY_kana_yo
  KEY_kana_yu                     = LibGdk::KEY_kana_yu
  KEY_kappa                       = LibGdk::KEY_kappa
  KEY_kcedilla                    = LibGdk::KEY_kcedilla
  KEY_kra                         = LibGdk::KEY_kra
  KEY_l                           = LibGdk::KEY_l
  KEY_lacute                      = LibGdk::KEY_lacute
  KEY_latincross                  = LibGdk::KEY_latincross
  KEY_lbelowdot                   = LibGdk::KEY_lbelowdot
  KEY_lcaron                      = LibGdk::KEY_lcaron
  KEY_lcedilla                    = LibGdk::KEY_lcedilla
  KEY_leftanglebracket            = LibGdk::KEY_leftanglebracket
  KEY_leftarrow                   = LibGdk::KEY_leftarrow
  KEY_leftcaret                   = LibGdk::KEY_leftcaret
  KEY_leftdoublequotemark         = LibGdk::KEY_leftdoublequotemark
  KEY_leftmiddlecurlybrace        = LibGdk::KEY_leftmiddlecurlybrace
  KEY_leftopentriangle            = LibGdk::KEY_leftopentriangle
  KEY_leftpointer                 = LibGdk::KEY_leftpointer
  KEY_leftradical                 = LibGdk::KEY_leftradical
  KEY_leftshoe                    = LibGdk::KEY_leftshoe
  KEY_leftsinglequotemark         = LibGdk::KEY_leftsinglequotemark
  KEY_leftt                       = LibGdk::KEY_leftt
  KEY_lefttack                    = LibGdk::KEY_lefttack
  KEY_less                        = LibGdk::KEY_less
  KEY_lessthanequal               = LibGdk::KEY_lessthanequal
  KEY_lf                          = LibGdk::KEY_lf
  KEY_logicaland                  = LibGdk::KEY_logicaland
  KEY_logicalor                   = LibGdk::KEY_logicalor
  KEY_lowleftcorner               = LibGdk::KEY_lowleftcorner
  KEY_lowrightcorner              = LibGdk::KEY_lowrightcorner
  KEY_lstroke                     = LibGdk::KEY_lstroke
  KEY_m                           = LibGdk::KEY_m
  KEY_mabovedot                   = LibGdk::KEY_mabovedot
  KEY_macron                      = LibGdk::KEY_macron
  KEY_malesymbol                  = LibGdk::KEY_malesymbol
  KEY_maltesecross                = LibGdk::KEY_maltesecross
  KEY_marker                      = LibGdk::KEY_marker
  KEY_masculine                   = LibGdk::KEY_masculine
  KEY_minus                       = LibGdk::KEY_minus
  KEY_minutes                     = LibGdk::KEY_minutes
  KEY_mu                          = LibGdk::KEY_mu
  KEY_multiply                    = LibGdk::KEY_multiply
  KEY_musicalflat                 = LibGdk::KEY_musicalflat
  KEY_musicalsharp                = LibGdk::KEY_musicalsharp
  KEY_n                           = LibGdk::KEY_n
  KEY_nabla                       = LibGdk::KEY_nabla
  KEY_nacute                      = LibGdk::KEY_nacute
  KEY_ncaron                      = LibGdk::KEY_ncaron
  KEY_ncedilla                    = LibGdk::KEY_ncedilla
  KEY_ninesubscript               = LibGdk::KEY_ninesubscript
  KEY_ninesuperior                = LibGdk::KEY_ninesuperior
  KEY_nl                          = LibGdk::KEY_nl
  KEY_nobreakspace                = LibGdk::KEY_nobreakspace
  KEY_notapproxeq                 = LibGdk::KEY_notapproxeq
  KEY_notelementof                = LibGdk::KEY_notelementof
  KEY_notequal                    = LibGdk::KEY_notequal
  KEY_notidentical                = LibGdk::KEY_notidentical
  KEY_notsign                     = LibGdk::KEY_notsign
  KEY_ntilde                      = LibGdk::KEY_ntilde
  KEY_numbersign                  = LibGdk::KEY_numbersign
  KEY_numerosign                  = LibGdk::KEY_numerosign
  KEY_o                           = LibGdk::KEY_o
  KEY_oacute                      = LibGdk::KEY_oacute
  KEY_obarred                     = LibGdk::KEY_obarred
  KEY_obelowdot                   = LibGdk::KEY_obelowdot
  KEY_ocaron                      = LibGdk::KEY_ocaron
  KEY_ocircumflex                 = LibGdk::KEY_ocircumflex
  KEY_ocircumflexacute            = LibGdk::KEY_ocircumflexacute
  KEY_ocircumflexbelowdot         = LibGdk::KEY_ocircumflexbelowdot
  KEY_ocircumflexgrave            = LibGdk::KEY_ocircumflexgrave
  KEY_ocircumflexhook             = LibGdk::KEY_ocircumflexhook
  KEY_ocircumflextilde            = LibGdk::KEY_ocircumflextilde
  KEY_odiaeresis                  = LibGdk::KEY_odiaeresis
  KEY_odoubleacute                = LibGdk::KEY_odoubleacute
  KEY_oe                          = LibGdk::KEY_oe
  KEY_ogonek                      = LibGdk::KEY_ogonek
  KEY_ograve                      = LibGdk::KEY_ograve
  KEY_ohook                       = LibGdk::KEY_ohook
  KEY_ohorn                       = LibGdk::KEY_ohorn
  KEY_ohornacute                  = LibGdk::KEY_ohornacute
  KEY_ohornbelowdot               = LibGdk::KEY_ohornbelowdot
  KEY_ohorngrave                  = LibGdk::KEY_ohorngrave
  KEY_ohornhook                   = LibGdk::KEY_ohornhook
  KEY_ohorntilde                  = LibGdk::KEY_ohorntilde
  KEY_omacron                     = LibGdk::KEY_omacron
  KEY_oneeighth                   = LibGdk::KEY_oneeighth
  KEY_onefifth                    = LibGdk::KEY_onefifth
  KEY_onehalf                     = LibGdk::KEY_onehalf
  KEY_onequarter                  = LibGdk::KEY_onequarter
  KEY_onesixth                    = LibGdk::KEY_onesixth
  KEY_onesubscript                = LibGdk::KEY_onesubscript
  KEY_onesuperior                 = LibGdk::KEY_onesuperior
  KEY_onethird                    = LibGdk::KEY_onethird
  KEY_ooblique                    = LibGdk::KEY_ooblique
  KEY_openrectbullet              = LibGdk::KEY_openrectbullet
  KEY_openstar                    = LibGdk::KEY_openstar
  KEY_opentribulletdown           = LibGdk::KEY_opentribulletdown
  KEY_opentribulletup             = LibGdk::KEY_opentribulletup
  KEY_ordfeminine                 = LibGdk::KEY_ordfeminine
  KEY_oslash                      = LibGdk::KEY_oslash
  KEY_otilde                      = LibGdk::KEY_otilde
  KEY_overbar                     = LibGdk::KEY_overbar
  KEY_overline                    = LibGdk::KEY_overline
  KEY_p                           = LibGdk::KEY_p
  KEY_pabovedot                   = LibGdk::KEY_pabovedot
  KEY_paragraph                   = LibGdk::KEY_paragraph
  KEY_parenleft                   = LibGdk::KEY_parenleft
  KEY_parenright                  = LibGdk::KEY_parenright
  KEY_partdifferential            = LibGdk::KEY_partdifferential
  KEY_partialderivative           = LibGdk::KEY_partialderivative
  KEY_percent                     = LibGdk::KEY_percent
  KEY_period                      = LibGdk::KEY_period
  KEY_periodcentered              = LibGdk::KEY_periodcentered
  KEY_permille                    = LibGdk::KEY_permille
  KEY_phonographcopyright         = LibGdk::KEY_phonographcopyright
  KEY_plus                        = LibGdk::KEY_plus
  KEY_plusminus                   = LibGdk::KEY_plusminus
  KEY_prescription                = LibGdk::KEY_prescription
  KEY_prolongedsound              = LibGdk::KEY_prolongedsound
  KEY_punctspace                  = LibGdk::KEY_punctspace
  KEY_q                           = LibGdk::KEY_q
  KEY_quad                        = LibGdk::KEY_quad
  KEY_question                    = LibGdk::KEY_question
  KEY_questiondown                = LibGdk::KEY_questiondown
  KEY_quotedbl                    = LibGdk::KEY_quotedbl
  KEY_quoteleft                   = LibGdk::KEY_quoteleft
  KEY_quoteright                  = LibGdk::KEY_quoteright
  KEY_r                           = LibGdk::KEY_r
  KEY_racute                      = LibGdk::KEY_racute
  KEY_radical                     = LibGdk::KEY_radical
  KEY_rcaron                      = LibGdk::KEY_rcaron
  KEY_rcedilla                    = LibGdk::KEY_rcedilla
  KEY_registered                  = LibGdk::KEY_registered
  KEY_rightanglebracket           = LibGdk::KEY_rightanglebracket
  KEY_rightarrow                  = LibGdk::KEY_rightarrow
  KEY_rightcaret                  = LibGdk::KEY_rightcaret
  KEY_rightdoublequotemark        = LibGdk::KEY_rightdoublequotemark
  KEY_rightmiddlecurlybrace       = LibGdk::KEY_rightmiddlecurlybrace
  KEY_rightmiddlesummation        = LibGdk::KEY_rightmiddlesummation
  KEY_rightopentriangle           = LibGdk::KEY_rightopentriangle
  KEY_rightpointer                = LibGdk::KEY_rightpointer
  KEY_rightshoe                   = LibGdk::KEY_rightshoe
  KEY_rightsinglequotemark        = LibGdk::KEY_rightsinglequotemark
  KEY_rightt                      = LibGdk::KEY_rightt
  KEY_righttack                   = LibGdk::KEY_righttack
  KEY_s                           = LibGdk::KEY_s
  KEY_sabovedot                   = LibGdk::KEY_sabovedot
  KEY_sacute                      = LibGdk::KEY_sacute
  KEY_scaron                      = LibGdk::KEY_scaron
  KEY_scedilla                    = LibGdk::KEY_scedilla
  KEY_schwa                       = LibGdk::KEY_schwa
  KEY_scircumflex                 = LibGdk::KEY_scircumflex
  KEY_script_switch               = LibGdk::KEY_script_switch
  KEY_seconds                     = LibGdk::KEY_seconds
  KEY_section                     = LibGdk::KEY_section
  KEY_semicolon                   = LibGdk::KEY_semicolon
  KEY_semivoicedsound             = LibGdk::KEY_semivoicedsound
  KEY_seveneighths                = LibGdk::KEY_seveneighths
  KEY_sevensubscript              = LibGdk::KEY_sevensubscript
  KEY_sevensuperior               = LibGdk::KEY_sevensuperior
  KEY_signaturemark               = LibGdk::KEY_signaturemark
  KEY_signifblank                 = LibGdk::KEY_signifblank
  KEY_similarequal                = LibGdk::KEY_similarequal
  KEY_singlelowquotemark          = LibGdk::KEY_singlelowquotemark
  KEY_sixsubscript                = LibGdk::KEY_sixsubscript
  KEY_sixsuperior                 = LibGdk::KEY_sixsuperior
  KEY_slash                       = LibGdk::KEY_slash
  KEY_soliddiamond                = LibGdk::KEY_soliddiamond
  KEY_space                       = LibGdk::KEY_space
  KEY_squareroot                  = LibGdk::KEY_squareroot
  KEY_ssharp                      = LibGdk::KEY_ssharp
  KEY_sterling                    = LibGdk::KEY_sterling
  KEY_stricteq                    = LibGdk::KEY_stricteq
  KEY_t                           = LibGdk::KEY_t
  KEY_tabovedot                   = LibGdk::KEY_tabovedot
  KEY_tcaron                      = LibGdk::KEY_tcaron
  KEY_tcedilla                    = LibGdk::KEY_tcedilla
  KEY_telephone                   = LibGdk::KEY_telephone
  KEY_telephonerecorder           = LibGdk::KEY_telephonerecorder
  KEY_therefore                   = LibGdk::KEY_therefore
  KEY_thinspace                   = LibGdk::KEY_thinspace
  KEY_thorn                       = LibGdk::KEY_thorn
  KEY_threeeighths                = LibGdk::KEY_threeeighths
  KEY_threefifths                 = LibGdk::KEY_threefifths
  KEY_threequarters               = LibGdk::KEY_threequarters
  KEY_threesubscript              = LibGdk::KEY_threesubscript
  KEY_threesuperior               = LibGdk::KEY_threesuperior
  KEY_tintegral                   = LibGdk::KEY_tintegral
  KEY_topintegral                 = LibGdk::KEY_topintegral
  KEY_topleftparens               = LibGdk::KEY_topleftparens
  KEY_topleftradical              = LibGdk::KEY_topleftradical
  KEY_topleftsqbracket            = LibGdk::KEY_topleftsqbracket
  KEY_topleftsummation            = LibGdk::KEY_topleftsummation
  KEY_toprightparens              = LibGdk::KEY_toprightparens
  KEY_toprightsqbracket           = LibGdk::KEY_toprightsqbracket
  KEY_toprightsummation           = LibGdk::KEY_toprightsummation
  KEY_topt                        = LibGdk::KEY_topt
  KEY_topvertsummationconnector   = LibGdk::KEY_topvertsummationconnector
  KEY_trademark                   = LibGdk::KEY_trademark
  KEY_trademarkincircle           = LibGdk::KEY_trademarkincircle
  KEY_tslash                      = LibGdk::KEY_tslash
  KEY_twofifths                   = LibGdk::KEY_twofifths
  KEY_twosubscript                = LibGdk::KEY_twosubscript
  KEY_twosuperior                 = LibGdk::KEY_twosuperior
  KEY_twothirds                   = LibGdk::KEY_twothirds
  KEY_u                           = LibGdk::KEY_u
  KEY_uacute                      = LibGdk::KEY_uacute
  KEY_ubelowdot                   = LibGdk::KEY_ubelowdot
  KEY_ubreve                      = LibGdk::KEY_ubreve
  KEY_ucircumflex                 = LibGdk::KEY_ucircumflex
  KEY_udiaeresis                  = LibGdk::KEY_udiaeresis
  KEY_udoubleacute                = LibGdk::KEY_udoubleacute
  KEY_ugrave                      = LibGdk::KEY_ugrave
  KEY_uhook                       = LibGdk::KEY_uhook
  KEY_uhorn                       = LibGdk::KEY_uhorn
  KEY_uhornacute                  = LibGdk::KEY_uhornacute
  KEY_uhornbelowdot               = LibGdk::KEY_uhornbelowdot
  KEY_uhorngrave                  = LibGdk::KEY_uhorngrave
  KEY_uhornhook                   = LibGdk::KEY_uhornhook
  KEY_uhorntilde                  = LibGdk::KEY_uhorntilde
  KEY_umacron                     = LibGdk::KEY_umacron
  KEY_underbar                    = LibGdk::KEY_underbar
  KEY_underscore                  = LibGdk::KEY_underscore
  KEY_union                       = LibGdk::KEY_union
  KEY_uogonek                     = LibGdk::KEY_uogonek
  KEY_uparrow                     = LibGdk::KEY_uparrow
  KEY_upcaret                     = LibGdk::KEY_upcaret
  KEY_upleftcorner                = LibGdk::KEY_upleftcorner
  KEY_uprightcorner               = LibGdk::KEY_uprightcorner
  KEY_upshoe                      = LibGdk::KEY_upshoe
  KEY_upstile                     = LibGdk::KEY_upstile
  KEY_uptack                      = LibGdk::KEY_uptack
  KEY_uring                       = LibGdk::KEY_uring
  KEY_utilde                      = LibGdk::KEY_utilde
  KEY_v                           = LibGdk::KEY_v
  KEY_variation                   = LibGdk::KEY_variation
  KEY_vertbar                     = LibGdk::KEY_vertbar
  KEY_vertconnector               = LibGdk::KEY_vertconnector
  KEY_voicedsound                 = LibGdk::KEY_voicedsound
  KEY_vt                          = LibGdk::KEY_vt
  KEY_w                           = LibGdk::KEY_w
  KEY_wacute                      = LibGdk::KEY_wacute
  KEY_wcircumflex                 = LibGdk::KEY_wcircumflex
  KEY_wdiaeresis                  = LibGdk::KEY_wdiaeresis
  KEY_wgrave                      = LibGdk::KEY_wgrave
  KEY_x                           = LibGdk::KEY_x
  KEY_xabovedot                   = LibGdk::KEY_xabovedot
  KEY_y                           = LibGdk::KEY_y
  KEY_yacute                      = LibGdk::KEY_yacute
  KEY_ybelowdot                   = LibGdk::KEY_ybelowdot
  KEY_ycircumflex                 = LibGdk::KEY_ycircumflex
  KEY_ydiaeresis                  = LibGdk::KEY_ydiaeresis
  KEY_yen                         = LibGdk::KEY_yen
  KEY_ygrave                      = LibGdk::KEY_ygrave
  KEY_yhook                       = LibGdk::KEY_yhook
  KEY_ytilde                      = LibGdk::KEY_ytilde
  KEY_z                           = LibGdk::KEY_z
  KEY_zabovedot                   = LibGdk::KEY_zabovedot
  KEY_zacute                      = LibGdk::KEY_zacute
  KEY_zcaron                      = LibGdk::KEY_zcaron
  KEY_zerosubscript               = LibGdk::KEY_zerosubscript
  KEY_zerosuperior                = LibGdk::KEY_zerosuperior
  KEY_zstroke                     = LibGdk::KEY_zstroke
  MAJOR_VERSION                   = LibGdk::MAJOR_VERSION
  MAX_TIMECOORD_AXES              = LibGdk::MAX_TIMECOORD_AXES
  MICRO_VERSION                   = LibGdk::MICRO_VERSION
  MINOR_VERSION                   = LibGdk::MINOR_VERSION
  PARENT_RELATIVE                 = LibGdk::PARENT_RELATIVE
  PRIORITY_REDRAW                 = LibGdk::PRIORITY_REDRAW

  def self.add_option_entries_libgtk_only(group : GLib::OptionGroup)
    LibGdk.add_option_entries_libgtk_only(group.to_unsafe.as(LibGLib::OptionGroup*))
    nil
  end

  def self.atom_intern(atom_name : ::String, only_if_exists : ::Bool)
    __var0 = LibGdk.atom_intern(atom_name.to_unsafe, LibC::Int.new(only_if_exists ? 1 : 0))
    GObject.raise_unexpected_null("gdk_atom_intern") if __var0.null?
    Gdk::Atom.new(__var0)
  end

  def self.atom_intern_static_string(atom_name : ::String)
    __var0 = LibGdk.atom_intern_static_string(atom_name.to_unsafe)
    GObject.raise_unexpected_null("gdk_atom_intern_static_string") if __var0.null?
    Gdk::Atom.new(__var0)
  end

  def self.beep
    LibGdk.beep
    nil
  end

  def self.cairo_create(window : Gdk::Window)
    __var0 = LibGdk.cairo_create(window.to_unsafe_window)
    GObject.raise_unexpected_null("gdk_cairo_create") if __var0.null?
    Cairo::Context.new(__var0)
  end

  def self.cairo_draw_from_gl(cr : Cairo::Context, window : Gdk::Window, source : ::Int, source_type : ::Int, buffer_scale : ::Int, x : ::Int, y : ::Int, width : ::Int, height : ::Int)
    LibGdk.cairo_draw_from_gl(cr.to_unsafe.as(LibCairo::Context*), window.to_unsafe_window, Int32.new(source), Int32.new(source_type), Int32.new(buffer_scale), Int32.new(x), Int32.new(y), Int32.new(width), Int32.new(height))
    nil
  end

  def self.cairo_get_clip_rectangle(cr : Cairo::Context, rect : Gdk::Rectangle?)
    __var0 = LibGdk.cairo_get_clip_rectangle(cr.to_unsafe.as(LibCairo::Context*), rect)
    (__var0 == 1)
  end

  def self.cairo_get_drawing_context(cr : Cairo::Context)
    __var0 = LibGdk.cairo_get_drawing_context(cr.to_unsafe.as(LibCairo::Context*))
    __var1 = Gdk::DrawingContext.new(__var0) if __var0
    __var1
  end

  def self.cairo_rectangle(cr : Cairo::Context, rectangle : Gdk::Rectangle)
    LibGdk.cairo_rectangle(cr.to_unsafe.as(LibCairo::Context*), rectangle.to_unsafe.as(LibGdk::Rectangle*))
    nil
  end

  def self.cairo_region(cr : Cairo::Context, region : Cairo::Region)
    LibGdk.cairo_region(cr.to_unsafe.as(LibCairo::Context*), region.to_unsafe.as(LibCairo::Region*))
    nil
  end

  def self.cairo_region_create_from_surface(surface : Cairo::Surface)
    __var0 = LibGdk.cairo_region_create_from_surface(surface.to_unsafe.as(LibCairo::Surface*))
    GObject.raise_unexpected_null("gdk_cairo_region_create_from_surface") if __var0.null?
    Cairo::Region.new(__var0)
  end

  def self.cairo_set_source_color(cr : Cairo::Context, color : Gdk::Color)
    LibGdk.cairo_set_source_color(cr.to_unsafe.as(LibCairo::Context*), color.to_unsafe.as(LibGdk::Color*))
    nil
  end

  def self.cairo_set_source_pixbuf(cr : Cairo::Context, pixbuf : GdkPixbuf::Pixbuf, pixbuf_x : ::Float, pixbuf_y : ::Float)
    LibGdk.cairo_set_source_pixbuf(cr.to_unsafe.as(LibCairo::Context*), pixbuf.to_unsafe_pixbuf, Float64.new(pixbuf_x), Float64.new(pixbuf_y))
    nil
  end

  def self.cairo_set_source_rgba(cr : Cairo::Context, rgba : Gdk::RGBA)
    LibGdk.cairo_set_source_rgba(cr.to_unsafe.as(LibCairo::Context*), rgba.to_unsafe.as(LibGdk::RGBA*))
    nil
  end

  def self.cairo_set_source_window(cr : Cairo::Context, window : Gdk::Window, x : ::Float, y : ::Float)
    LibGdk.cairo_set_source_window(cr.to_unsafe.as(LibCairo::Context*), window.to_unsafe_window, Float64.new(x), Float64.new(y))
    nil
  end

  def self.cairo_surface_create_from_pixbuf(pixbuf : GdkPixbuf::Pixbuf, scale : ::Int, for_window : Gdk::Window?)
    __var0 = LibGdk.cairo_surface_create_from_pixbuf(pixbuf.to_unsafe_pixbuf, Int32.new(scale), for_window ? for_window.to_unsafe_window : Pointer(LibGdk::Window).null)
    GObject.raise_unexpected_null("gdk_cairo_surface_create_from_pixbuf") if __var0.null?
    Cairo::Surface.new(__var0)
  end

  def self.color_parse(spec : ::String, color : Gdk::Color)
    __var0 = LibGdk.color_parse(spec.to_unsafe, color)
    (__var0 == 1)
  end

  def self.disable_multidevice
    LibGdk.disable_multidevice
    nil
  end

  def self.drag_abort(context : Gdk::DragContext, time_ : ::Int)
    LibGdk.drag_abort(context.to_unsafe_dragcontext, UInt32.new(time_))
    nil
  end

  def self.drag_begin(window : Gdk::Window, targets : Void*)
    __var0 = LibGdk.drag_begin(window.to_unsafe_window, targets)
    GObject.raise_unexpected_null("gdk_drag_begin") if __var0.null?
    Gdk::DragContext.new(__var0)
  end

  def self.drag_begin_for_device(window : Gdk::Window, device : Gdk::Device, targets : Void*)
    __var0 = LibGdk.drag_begin_for_device(window.to_unsafe_window, device.to_unsafe_device, targets)
    GObject.raise_unexpected_null("gdk_drag_begin_for_device") if __var0.null?
    Gdk::DragContext.new(__var0)
  end

  def self.drag_begin_from_point(window : Gdk::Window, device : Gdk::Device, targets : Void*, x_root : ::Int, y_root : ::Int)
    __var0 = LibGdk.drag_begin_from_point(window.to_unsafe_window, device.to_unsafe_device, targets, Int32.new(x_root), Int32.new(y_root))
    GObject.raise_unexpected_null("gdk_drag_begin_from_point") if __var0.null?
    Gdk::DragContext.new(__var0)
  end

  def self.drag_drop(context : Gdk::DragContext, time_ : ::Int)
    LibGdk.drag_drop(context.to_unsafe_dragcontext, UInt32.new(time_))
    nil
  end

  def self.drag_drop_done(context : Gdk::DragContext, success : ::Bool)
    LibGdk.drag_drop_done(context.to_unsafe_dragcontext, LibC::Int.new(success ? 1 : 0))
    nil
  end

  def self.drag_drop_succeeded(context : Gdk::DragContext)
    __var0 = LibGdk.drag_drop_succeeded(context.to_unsafe_dragcontext)
    (__var0 == 1)
  end

  def self.drag_find_window_for_screen(context : Gdk::DragContext, drag_window : Gdk::Window, screen : Gdk::Screen, x_root : ::Int, y_root : ::Int, dest_window : Gdk::Window, protocol : Gdk::DragProtocol)
    LibGdk.drag_find_window_for_screen(context.to_unsafe_dragcontext, drag_window.to_unsafe_window, screen.to_unsafe_screen, Int32.new(x_root), Int32.new(y_root), dest_window, protocol)
    nil
  end

  def self.drag_get_selection(context : Gdk::DragContext)
    __var0 = LibGdk.drag_get_selection(context.to_unsafe_dragcontext)
    GObject.raise_unexpected_null("gdk_drag_get_selection") if __var0.null?
    Gdk::Atom.new(__var0)
  end

  def self.drag_motion(context : Gdk::DragContext, dest_window : Gdk::Window, protocol : Gdk::DragProtocol, x_root : ::Int, y_root : ::Int, suggested_action : Gdk::DragAction, possible_actions : Gdk::DragAction, time_ : ::Int)
    __var0 = LibGdk.drag_motion(context.to_unsafe_dragcontext, dest_window.to_unsafe_window, protocol, Int32.new(x_root), Int32.new(y_root), suggested_action, possible_actions, UInt32.new(time_))
    (__var0 == 1)
  end

  def self.drag_status(context : Gdk::DragContext, action : Gdk::DragAction, time_ : ::Int)
    LibGdk.drag_status(context.to_unsafe_dragcontext, action, UInt32.new(time_))
    nil
  end

  def self.drop_finish(context : Gdk::DragContext, success : ::Bool, time_ : ::Int)
    LibGdk.drop_finish(context.to_unsafe_dragcontext, LibC::Int.new(success ? 1 : 0), UInt32.new(time_))
    nil
  end

  def self.drop_reply(context : Gdk::DragContext, accepted : ::Bool, time_ : ::Int)
    LibGdk.drop_reply(context.to_unsafe_dragcontext, LibC::Int.new(accepted ? 1 : 0), UInt32.new(time_))
    nil
  end

  def self.error_trap_pop
    __var0 = LibGdk.error_trap_pop
    __var0
  end

  def self.error_trap_pop_ignored
    LibGdk.error_trap_pop_ignored
    nil
  end

  def self.error_trap_push
    LibGdk.error_trap_push
    nil
  end

  def self.event_get
    __var0 = LibGdk.event_get
    __var1 = Gdk::Event.new(__var0) if __var0
    __var1
  end

  def self.event_handler_set(func : Gdk::EventFunc, data : Void*?, notify : GLib::DestroyNotify)
    LibGdk.event_handler_set(func, data ? data : Pointer(Void).null, notify)
    nil
  end

  def self.event_peek
    __var0 = LibGdk.event_peek
    __var1 = Gdk::Event.new(__var0) if __var0
    __var1
  end

  def self.event_request_motions(event : Gdk::EventMotion)
    LibGdk.event_request_motions(event.to_unsafe.as(LibGdk::EventMotion*))
    nil
  end

  def self.events_get_angle(event1 : Gdk::Event::Union, event2 : Gdk::Event::Union)
    __var0 = LibGdk.events_get_angle(event1.to_unsafe.as(LibGdk::Event*), event2.to_unsafe.as(LibGdk::Event*), out angle)
    {(__var0 == 1), angle}
  end

  def self.events_get_center(event1 : Gdk::Event::Union, event2 : Gdk::Event::Union)
    __var0 = LibGdk.events_get_center(event1.to_unsafe.as(LibGdk::Event*), event2.to_unsafe.as(LibGdk::Event*), out x, out y)
    {(__var0 == 1), x, y}
  end

  def self.events_get_distance(event1 : Gdk::Event::Union, event2 : Gdk::Event::Union)
    __var0 = LibGdk.events_get_distance(event1.to_unsafe.as(LibGdk::Event*), event2.to_unsafe.as(LibGdk::Event*), out distance)
    {(__var0 == 1), distance}
  end

  def self.events_pending
    __var0 = LibGdk.events_pending
    (__var0 == 1)
  end

  def self.flush
    LibGdk.flush
    nil
  end

  def self.default_root_window
    __var0 = LibGdk.get_default_root_window
    GObject.raise_unexpected_null("gdk_get_default_root_window") if __var0.null?
    Gdk::Window.new(__var0)
  end

  def self.display
    __var0 = LibGdk.get_display
    GObject.raise_unexpected_null("gdk_get_display") if __var0.null?
    ::String.new(__var0)
  end

  def self.display_arg_name
    __var0 = LibGdk.get_display_arg_name
    __var1 = ::String.new(__var0) if __var0
    __var1
  end

  def self.program_class
    __var0 = LibGdk.get_program_class
    GObject.raise_unexpected_null("gdk_get_program_class") if __var0.null?
    ::String.new(__var0)
  end

  def self.show_events
    __var0 = LibGdk.get_show_events
    (__var0 == 1)
  end

  def self.gl_error_quark
    __var0 = LibGdk.gl_error_quark
    __var0
  end

  def self.init(argc : ::Int, argv : ::Enumerable)
    LibGdk.init(argc, argv)
    nil
  end

  def self.init_check(argc : ::Int, argv : ::Enumerable)
    __var0 = LibGdk.init_check(argc, argv)
    (__var0 == 1)
  end

  def self.keyboard_grab(window : Gdk::Window, owner_events : ::Bool, time_ : ::Int)
    __var0 = LibGdk.keyboard_grab(window.to_unsafe_window, LibC::Int.new(owner_events ? 1 : 0), UInt32.new(time_))
    Gdk::GrabStatus.new(__var0)
  end

  def self.keyboard_ungrab(time_ : ::Int)
    LibGdk.keyboard_ungrab(UInt32.new(time_))
    nil
  end

  def self.keyval_convert_case(symbol : ::Int)
    LibGdk.keyval_convert_case(UInt32.new(symbol), out lower, out upper)
    {lower, upper}
  end

  def self.keyval_from_name(keyval_name : ::String)
    __var0 = LibGdk.keyval_from_name(keyval_name.to_unsafe)
    __var0
  end

  def self.keyval_is_lower(keyval : ::Int)
    __var0 = LibGdk.keyval_is_lower(UInt32.new(keyval))
    (__var0 == 1)
  end

  def self.keyval_is_upper(keyval : ::Int)
    __var0 = LibGdk.keyval_is_upper(UInt32.new(keyval))
    (__var0 == 1)
  end

  def self.keyval_name(keyval : ::Int)
    __var0 = LibGdk.keyval_name(UInt32.new(keyval))
    __var1 = ::String.new(__var0) if __var0
    __var1
  end

  def self.keyval_to_lower(keyval : ::Int)
    __var0 = LibGdk.keyval_to_lower(UInt32.new(keyval))
    __var0
  end

  def self.keyval_to_unicode(keyval : ::Int)
    __var0 = LibGdk.keyval_to_unicode(UInt32.new(keyval))
    __var0
  end

  def self.keyval_to_upper(keyval : ::Int)
    __var0 = LibGdk.keyval_to_upper(UInt32.new(keyval))
    __var0
  end

  def self.list_visuals
    __var0 = LibGdk.list_visuals
    GObject.raise_unexpected_null("gdk_list_visuals") if __var0.null?
    GLib::ListIterator(Gdk::Visual, LibGdk::Visual*).new(GLib::List.new(__var0.as(LibGLib::List*)))
  end

  def self.notify_startup_complete
    LibGdk.notify_startup_complete
    nil
  end

  def self.notify_startup_complete_with_id(startup_id : ::String)
    LibGdk.notify_startup_complete_with_id(startup_id.to_unsafe)
    nil
  end

  def self.offscreen_window_get_embedder(window : Gdk::Window)
    __var0 = LibGdk.offscreen_window_get_embedder(window.to_unsafe_window)
    __var1 = Gdk::Window.new(__var0) if __var0
    __var1
  end

  def self.offscreen_window_get_surface(window : Gdk::Window)
    __var0 = LibGdk.offscreen_window_get_surface(window.to_unsafe_window)
    __var1 = Cairo::Surface.new(__var0) if __var0
    __var1
  end

  def self.offscreen_window_set_embedder(window : Gdk::Window, embedder : Gdk::Window)
    LibGdk.offscreen_window_set_embedder(window.to_unsafe_window, embedder.to_unsafe_window)
    nil
  end

  def self.pango_context_get
    __var0 = LibGdk.pango_context_get
    GObject.raise_unexpected_null("gdk_pango_context_get") if __var0.null?
    Pango::Context.new(__var0)
  end

  def self.pango_context_get_for_display(display : Gdk::Display)
    __var0 = LibGdk.pango_context_get_for_display(display.to_unsafe_display)
    GObject.raise_unexpected_null("gdk_pango_context_get_for_display") if __var0.null?
    Pango::Context.new(__var0)
  end

  def self.pango_context_get_for_screen(screen : Gdk::Screen)
    __var0 = LibGdk.pango_context_get_for_screen(screen.to_unsafe_screen)
    GObject.raise_unexpected_null("gdk_pango_context_get_for_screen") if __var0.null?
    Pango::Context.new(__var0)
  end

  def self.parse_args(argc : ::Int, argv : ::Enumerable)
    LibGdk.parse_args(argc, argv)
    nil
  end

  def self.pixbuf_get_from_surface(surface : Cairo::Surface, src_x : ::Int, src_y : ::Int, width : ::Int, height : ::Int)
    __var0 = LibGdk.pixbuf_get_from_surface(surface.to_unsafe.as(LibCairo::Surface*), Int32.new(src_x), Int32.new(src_y), Int32.new(width), Int32.new(height))
    __var1 = GdkPixbuf::Pixbuf.new(__var0) if __var0
    __var1
  end

  def self.pixbuf_get_from_window(window : Gdk::Window, src_x : ::Int, src_y : ::Int, width : ::Int, height : ::Int)
    __var0 = LibGdk.pixbuf_get_from_window(window.to_unsafe_window, Int32.new(src_x), Int32.new(src_y), Int32.new(width), Int32.new(height))
    __var1 = GdkPixbuf::Pixbuf.new(__var0) if __var0
    __var1
  end

  def self.pointer_grab(window : Gdk::Window, owner_events : ::Bool, event_mask : Gdk::EventMask, confine_to : Gdk::Window?, cursor : Gdk::Cursor?, time_ : ::Int)
    __var0 = LibGdk.pointer_grab(window.to_unsafe_window, LibC::Int.new(owner_events ? 1 : 0), event_mask, confine_to ? confine_to.to_unsafe_window : Pointer(LibGdk::Window).null, cursor ? cursor.to_unsafe_cursor : Pointer(LibGdk::Cursor).null, UInt32.new(time_))
    Gdk::GrabStatus.new(__var0)
  end

  def self.pointer_is_grabbed
    __var0 = LibGdk.pointer_is_grabbed
    (__var0 == 1)
  end

  def self.pointer_ungrab(time_ : ::Int)
    LibGdk.pointer_ungrab(UInt32.new(time_))
    nil
  end

  def self.pre_parse_libgtk_only
    LibGdk.pre_parse_libgtk_only
    nil
  end

  def self.property_delete(window : Gdk::Window, property : Gdk::Atom)
    LibGdk.property_delete(window.to_unsafe_window, property.to_unsafe.as(LibGdk::Atom*))
    nil
  end

  def self.property_get(window : Gdk::Window, property : Gdk::Atom, type : Gdk::Atom, offset : ::Int, length : ::Int, pdelete : ::Int, actual_property_type : Gdk::Atom, data : ::Bytes)
    __var0 = LibGdk.property_get(window.to_unsafe_window, property.to_unsafe.as(LibGdk::Atom*), type.to_unsafe.as(LibGdk::Atom*), UInt64.new(offset), UInt64.new(length), Int32.new(pdelete), actual_property_type, out actual_format, out actual_length, data)
    {(__var0 == 1), actual_format, actual_length}
  end

  def self.query_depths(depths : ::Enumerable)
    LibGdk.query_depths(depths, out count)
    count
  end

  def self.query_visual_types(visual_types : ::Enumerable)
    LibGdk.query_visual_types(visual_types, out count)
    count
  end

  def self.selection_convert(requestor : Gdk::Window, selection : Gdk::Atom, target : Gdk::Atom, time_ : ::Int)
    LibGdk.selection_convert(requestor.to_unsafe_window, selection.to_unsafe.as(LibGdk::Atom*), target.to_unsafe.as(LibGdk::Atom*), UInt32.new(time_))
    nil
  end

  def self.selection_owner_get(selection : Gdk::Atom)
    __var0 = LibGdk.selection_owner_get(selection.to_unsafe.as(LibGdk::Atom*))
    __var1 = Gdk::Window.new(__var0) if __var0
    __var1
  end

  def self.selection_owner_get_for_display(display : Gdk::Display, selection : Gdk::Atom)
    __var0 = LibGdk.selection_owner_get_for_display(display.to_unsafe_display, selection.to_unsafe.as(LibGdk::Atom*))
    __var1 = Gdk::Window.new(__var0) if __var0
    __var1
  end

  def self.selection_owner_set(owner : Gdk::Window?, selection : Gdk::Atom, time_ : ::Int, send_event : ::Bool)
    __var0 = LibGdk.selection_owner_set(owner ? owner.to_unsafe_window : Pointer(LibGdk::Window).null, selection.to_unsafe.as(LibGdk::Atom*), UInt32.new(time_), LibC::Int.new(send_event ? 1 : 0))
    (__var0 == 1)
  end

  def self.selection_owner_set_for_display(display : Gdk::Display, owner : Gdk::Window?, selection : Gdk::Atom, time_ : ::Int, send_event : ::Bool)
    __var0 = LibGdk.selection_owner_set_for_display(display.to_unsafe_display, owner ? owner.to_unsafe_window : Pointer(LibGdk::Window).null, selection.to_unsafe.as(LibGdk::Atom*), UInt32.new(time_), LibC::Int.new(send_event ? 1 : 0))
    (__var0 == 1)
  end

  def self.selection_send_notify(requestor : Gdk::Window, selection : Gdk::Atom, target : Gdk::Atom, property : Gdk::Atom, time_ : ::Int)
    LibGdk.selection_send_notify(requestor.to_unsafe_window, selection.to_unsafe.as(LibGdk::Atom*), target.to_unsafe.as(LibGdk::Atom*), property.to_unsafe.as(LibGdk::Atom*), UInt32.new(time_))
    nil
  end

  def self.selection_send_notify_for_display(display : Gdk::Display, requestor : Gdk::Window, selection : Gdk::Atom, target : Gdk::Atom, property : Gdk::Atom, time_ : ::Int)
    LibGdk.selection_send_notify_for_display(display.to_unsafe_display, requestor.to_unsafe_window, selection.to_unsafe.as(LibGdk::Atom*), target.to_unsafe.as(LibGdk::Atom*), property.to_unsafe.as(LibGdk::Atom*), UInt32.new(time_))
    nil
  end

  def self.set_allowed_backends(backends : ::String)
    LibGdk.set_allowed_backends(backends.to_unsafe)
    nil
  end

  def self.set_double_click_time(msec : ::Int)
    LibGdk.set_double_click_time(UInt32.new(msec))
    nil
  end

  def self.set_program_class(program_class : ::String)
    LibGdk.set_program_class(program_class.to_unsafe)
    nil
  end

  def self.set_show_events(show_events : ::Bool)
    LibGdk.set_show_events(LibC::Int.new(show_events ? 1 : 0))
    nil
  end

  def self.setting_get(name : ::String, value)
    __var0 = LibGdk.setting_get(name.to_unsafe, value.to_gvalue.to_unsafe)
    (__var0 == 1)
  end

  def self.synthesize_window_state(window : Gdk::Window, unset_flags : Gdk::WindowState, set_flags : Gdk::WindowState)
    LibGdk.synthesize_window_state(window.to_unsafe_window, unset_flags, set_flags)
    nil
  end

  def self.test_render_sync(window : Gdk::Window)
    LibGdk.test_render_sync(window.to_unsafe_window)
    nil
  end

  def self.test_simulate_button(window : Gdk::Window, x : ::Int, y : ::Int, button : ::Int, modifiers : Gdk::ModifierType, button_pressrelease : Gdk::EventType)
    __var0 = LibGdk.test_simulate_button(window.to_unsafe_window, Int32.new(x), Int32.new(y), UInt32.new(button), modifiers, button_pressrelease)
    (__var0 == 1)
  end

  def self.test_simulate_key(window : Gdk::Window, x : ::Int, y : ::Int, keyval : ::Int, modifiers : Gdk::ModifierType, key_pressrelease : Gdk::EventType)
    __var0 = LibGdk.test_simulate_key(window.to_unsafe_window, Int32.new(x), Int32.new(y), UInt32.new(keyval), modifiers, key_pressrelease)
    (__var0 == 1)
  end

  def self.text_property_to_utf8_list_for_display(display : Gdk::Display, encoding : Gdk::Atom, format : ::Int, text : ::Bytes, list : ::Enumerable)
    length = text.size
    __var0 = LibGdk.text_property_to_utf8_list_for_display(display.to_unsafe_display, encoding.to_unsafe.as(LibGdk::Atom*), Int32.new(format), text.to_unsafe, Int32.new(length), list)
    __var0
  end

  def self.threads_add_idle(priority : ::Int, function : GLib::SourceFunc, data : Void*?, notify : GLib::DestroyNotify?)
    __var0 = LibGdk.threads_add_idle(Int32.new(priority), function, data ? data : Pointer(Void).null, notify ? notify : nil)
    __var0
  end

  def self.threads_add_timeout(priority : ::Int, interval : ::Int, function : GLib::SourceFunc, data : Void*?, notify : GLib::DestroyNotify?)
    __var0 = LibGdk.threads_add_timeout(Int32.new(priority), UInt32.new(interval), function, data ? data : Pointer(Void).null, notify ? notify : nil)
    __var0
  end

  def self.threads_add_timeout_seconds(priority : ::Int, interval : ::Int, function : GLib::SourceFunc, data : Void*?, notify : GLib::DestroyNotify?)
    __var0 = LibGdk.threads_add_timeout_seconds(Int32.new(priority), UInt32.new(interval), function, data ? data : Pointer(Void).null, notify ? notify : nil)
    __var0
  end

  def self.threads_enter
    LibGdk.threads_enter
    nil
  end

  def self.threads_init
    LibGdk.threads_init
    nil
  end

  def self.threads_leave
    LibGdk.threads_leave
    nil
  end

  def self.unicode_to_keyval(wc : ::Int)
    __var0 = LibGdk.unicode_to_keyval(UInt32.new(wc))
    __var0
  end

  def self.utf8_to_string_target(str : ::String)
    __var0 = LibGdk.utf8_to_string_target(str.to_unsafe)
    __var1 = ::String.new(__var0) if __var0
    __var1
  end

  @[Flags]
  enum AnchorHints : UInt32
    ZERO_NONE =  0
    FLIP_X    =  1
    FLIP_Y    =  2
    SLIDE_X   =  4
    SLIDE_Y   =  8
    RESIZE_X  = 16
    RESIZE_Y  = 32
    FLIP      =  3
    SLIDE     = 12
    RESIZE    = 48
  end

  class AppLaunchContext < Gio::AppLaunchContext
    @pointer : Void*

    def initialize(pointer : LibGdk::AppLaunchContext*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkAppLaunchContext")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdk._gdk_app_launch_context_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::AppLaunchContext*)
    end

    def to_unsafe_applaunchcontext
      @pointer.not_nil!.as(LibGdk::AppLaunchContext*)
    end

    def initialize(*, display : Gdk::Display? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless display.nil?
        __var0 << "display".to_unsafe
        __var1 << display.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGdk._gdk_app_launch_context_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new : self
      __var0 = LibGdk.app_launch_context_new
      GObject.raise_unexpected_null("gdk_app_launch_context_new") if __var0.null?
      cast(Gdk::AppLaunchContext.new(__var0))
    end

    def desktop=(desktop : ::Int)
      LibGdk.app_launch_context_set_desktop(@pointer.as(LibGdk::AppLaunchContext*), Int32.new(desktop))
      nil
    end

    def display=(display : Gdk::Display)
      LibGdk.app_launch_context_set_display(@pointer.as(LibGdk::AppLaunchContext*), display.to_unsafe_display)
      nil
    end

    def icon=(icon : Gio::Icon?)
      LibGdk.app_launch_context_set_icon(@pointer.as(LibGdk::AppLaunchContext*), icon ? icon.to_unsafe_icon : Pointer(LibGio::Icon).null)
      nil
    end

    def icon_name=(icon_name : ::String?)
      LibGdk.app_launch_context_set_icon_name(@pointer.as(LibGdk::AppLaunchContext*), icon_name ? icon_name.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def screen=(screen : Gdk::Screen)
      LibGdk.app_launch_context_set_screen(@pointer.as(LibGdk::AppLaunchContext*), screen.to_unsafe_screen)
      nil
    end

    def timestamp=(timestamp : ::Int)
      LibGdk.app_launch_context_set_timestamp(@pointer.as(LibGdk::AppLaunchContext*), UInt32.new(timestamp))
      nil
    end
  end

  class Atom
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGdk::Atom*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::Atom*)
    end

    def to_unsafe_atom
      @pointer.not_nil!.as(LibGdk::Atom*)
    end

    def name
      __var0 = LibGdk.atom_name(@pointer.as(LibGdk::Atom*))
      GObject.raise_unexpected_null("gdk_atom_name") if __var0.null?
      ::String.new(__var0)
    end

    def self.intern(atom_name : ::String, only_if_exists : ::Bool)
      __var0 = LibGdk.atom_intern(atom_name.to_unsafe, LibC::Int.new(only_if_exists ? 1 : 0))
      GObject.raise_unexpected_null("gdk_atom_intern") if __var0.null?
      Gdk::Atom.new(__var0)
    end

    def self.intern_static_string(atom_name : ::String)
      __var0 = LibGdk.atom_intern_static_string(atom_name.to_unsafe)
      GObject.raise_unexpected_null("gdk_atom_intern_static_string") if __var0.null?
      Gdk::Atom.new(__var0)
    end
  end

  @[Flags]
  enum AxisFlags : UInt32
    ZERO_NONE =   0
    X         =   2
    Y         =   4
    PRESSURE  =   8
    XTILT     =  16
    YTILT     =  32
    WHEEL     =  64
    DISTANCE  = 128
    ROTATION  = 256
    SLIDER    = 512
  end

  enum AxisUse : UInt32
    IGNORE   =  0
    X        =  1
    Y        =  2
    PRESSURE =  3
    XTILT    =  4
    YTILT    =  5
    WHEEL    =  6
    DISTANCE =  7
    ROTATION =  8
    SLIDER   =  9
    LAST     = 10
  end

  enum ByteOrder : UInt32
    LSB_FIRST = 0
    MSB_FIRST = 1
  end

  class Color
    include GObject::WrappedType

    def self.new(pixel : UInt32? = nil, red : UInt16? = nil, green : UInt16? = nil, blue : UInt16? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(12u64, 0u8).as(LibGdk::Color*))
      __var0.pixel = pixel unless pixel.nil?
      __var0.red = red unless red.nil?
      __var0.green = green unless green.nil?
      __var0.blue = blue unless blue.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::Color*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::Color*)
    end

    def to_unsafe_color
      @pointer.not_nil!.as(LibGdk::Color*)
    end

    def copy
      __var0 = LibGdk.color_copy(@pointer.as(LibGdk::Color*))
      GObject.raise_unexpected_null("gdk_color_copy") if __var0.null?
      Gdk::Color.new(__var0)
    end

    def equal(colorb : Gdk::Color)
      __var0 = LibGdk.color_equal(@pointer.as(LibGdk::Color*), colorb.to_unsafe.as(LibGdk::Color*))
      (__var0 == 1)
    end

    def free
      LibGdk.color_free(@pointer.as(LibGdk::Color*))
      nil
    end

    def hash
      __var0 = LibGdk.color_hash(@pointer.as(LibGdk::Color*))
      __var0
    end

    def to_string
      __var0 = LibGdk.color_to_string(@pointer.as(LibGdk::Color*))
      GObject.raise_unexpected_null("gdk_color_to_string") if __var0.null?
      ::String.new(__var0)
    end

    def self.parse(spec : ::String, color : Gdk::Color)
      __var0 = LibGdk.color_parse(spec.to_unsafe, color)
      (__var0 == 1)
    end

    def pixel
      to_unsafe.as(LibGdk::Color*).value.pixel
    end

    def pixel=(value : UInt32)
      to_unsafe.as(LibGdk::Color*).value.pixel = UInt32.new(value)
    end

    def red
      to_unsafe.as(LibGdk::Color*).value.red
    end

    def red=(value : UInt16)
      to_unsafe.as(LibGdk::Color*).value.red = UInt16.new(value)
    end

    def green
      to_unsafe.as(LibGdk::Color*).value.green
    end

    def green=(value : UInt16)
      to_unsafe.as(LibGdk::Color*).value.green = UInt16.new(value)
    end

    def blue
      to_unsafe.as(LibGdk::Color*).value.blue
    end

    def blue=(value : UInt16)
      to_unsafe.as(LibGdk::Color*).value.blue = UInt16.new(value)
    end
  end

  enum CrossingMode : UInt32
    NORMAL        = 0
    GRAB          = 1
    UNGRAB        = 2
    GTK_GRAB      = 3
    GTK_UNGRAB    = 4
    STATE_CHANGED = 5
    TOUCH_BEGIN   = 6
    TOUCH_END     = 7
    DEVICE_SWITCH = 8
  end

  class Cursor < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdk::Cursor*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkCursor")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdk._gdk_cursor_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::Cursor*)
    end

    def to_unsafe_cursor
      @pointer.not_nil!.as(LibGdk::Cursor*)
    end

    def self.new(cursor_type : Gdk::CursorType) : self
      __var0 = LibGdk.cursor_new(cursor_type)
      GObject.raise_unexpected_null("gdk_cursor_new") if __var0.null?
      cast(Gdk::Cursor.new(__var0))
    end

    def self.new_for_display(display : Gdk::Display, cursor_type : Gdk::CursorType) : self
      __var0 = LibGdk.cursor_new_for_display(display.to_unsafe_display, cursor_type)
      GObject.raise_unexpected_null("gdk_cursor_new_for_display") if __var0.null?
      cast(Gdk::Cursor.new(__var0))
    end

    def self.new_from_name(display : Gdk::Display, name : ::String) : self
      __var0 = LibGdk.cursor_new_from_name(display.to_unsafe_display, name.to_unsafe)
      __var1 = cast(Gdk::Cursor.new(__var0)) if __var0
      __var1
    end

    def self.new_from_pixbuf(display : Gdk::Display, pixbuf : GdkPixbuf::Pixbuf, x : ::Int, y : ::Int) : self
      __var0 = LibGdk.cursor_new_from_pixbuf(display.to_unsafe_display, pixbuf.to_unsafe_pixbuf, Int32.new(x), Int32.new(y))
      GObject.raise_unexpected_null("gdk_cursor_new_from_pixbuf") if __var0.null?
      cast(Gdk::Cursor.new(__var0))
    end

    def self.new_from_surface(display : Gdk::Display, surface : Cairo::Surface, x : ::Float, y : ::Float) : self
      __var0 = LibGdk.cursor_new_from_surface(display.to_unsafe_display, surface.to_unsafe.as(LibCairo::Surface*), Float64.new(x), Float64.new(y))
      GObject.raise_unexpected_null("gdk_cursor_new_from_surface") if __var0.null?
      cast(Gdk::Cursor.new(__var0))
    end

    def cursor_type
      __var0 = LibGdk.cursor_get_cursor_type(@pointer.as(LibGdk::Cursor*))
      Gdk::CursorType.new(__var0)
    end

    def display
      __var0 = LibGdk.cursor_get_display(@pointer.as(LibGdk::Cursor*))
      GObject.raise_unexpected_null("gdk_cursor_get_display") if __var0.null?
      Gdk::Display.new(__var0)
    end

    def image
      __var0 = LibGdk.cursor_get_image(@pointer.as(LibGdk::Cursor*))
      __var1 = GdkPixbuf::Pixbuf.new(__var0) if __var0
      __var1
    end

    def surface
      __var0 = LibGdk.cursor_get_surface(@pointer.as(LibGdk::Cursor*), out x_hot, out y_hot)
      __var1 = Cairo::Surface.new(__var0) if __var0
      {__var1, x_hot, y_hot}
    end

    def ref
      __var0 = LibGdk.cursor_ref(@pointer.as(LibGdk::Cursor*))
      GObject.raise_unexpected_null("gdk_cursor_ref") if __var0.null?
      Gdk::Cursor.new(__var0)
    end

    def unref
      LibGdk.cursor_unref(@pointer.as(LibGdk::Cursor*))
      nil
    end
  end

  enum CursorType : Int32
    X_CURSOR            =   0
    ARROW               =   2
    BASED_ARROW_DOWN    =   4
    BASED_ARROW_UP      =   6
    BOAT                =   8
    BOGOSITY            =  10
    BOTTOM_LEFT_CORNER  =  12
    BOTTOM_RIGHT_CORNER =  14
    BOTTOM_SIDE         =  16
    BOTTOM_TEE          =  18
    BOX_SPIRAL          =  20
    CENTER_PTR          =  22
    CIRCLE              =  24
    CLOCK               =  26
    COFFEE_MUG          =  28
    CROSS               =  30
    CROSS_REVERSE       =  32
    CROSSHAIR           =  34
    DIAMOND_CROSS       =  36
    DOT                 =  38
    DOTBOX              =  40
    DOUBLE_ARROW        =  42
    DRAFT_LARGE         =  44
    DRAFT_SMALL         =  46
    DRAPED_BOX          =  48
    EXCHANGE            =  50
    FLEUR               =  52
    GOBBLER             =  54
    GUMBY               =  56
    HAND1               =  58
    HAND2               =  60
    HEART               =  62
    ICON                =  64
    IRON_CROSS          =  66
    LEFT_PTR            =  68
    LEFT_SIDE           =  70
    LEFT_TEE            =  72
    LEFTBUTTON          =  74
    LL_ANGLE            =  76
    LR_ANGLE            =  78
    MAN                 =  80
    MIDDLEBUTTON        =  82
    MOUSE               =  84
    PENCIL              =  86
    PIRATE              =  88
    PLUS                =  90
    QUESTION_ARROW      =  92
    RIGHT_PTR           =  94
    RIGHT_SIDE          =  96
    RIGHT_TEE           =  98
    RIGHTBUTTON         = 100
    RTL_LOGO            = 102
    SAILBOAT            = 104
    SB_DOWN_ARROW       = 106
    SB_H_DOUBLE_ARROW   = 108
    SB_LEFT_ARROW       = 110
    SB_RIGHT_ARROW      = 112
    SB_UP_ARROW         = 114
    SB_V_DOUBLE_ARROW   = 116
    SHUTTLE             = 118
    SIZING              = 120
    SPIDER              = 122
    SPRAYCAN            = 124
    STAR                = 126
    TARGET              = 128
    TCROSS              = 130
    TOP_LEFT_ARROW      = 132
    TOP_LEFT_CORNER     = 134
    TOP_RIGHT_CORNER    = 136
    TOP_SIDE            = 138
    TOP_TEE             = 140
    TREK                = 142
    UL_ANGLE            = 144
    UMBRELLA            = 146
    UR_ANGLE            = 148
    WATCH               = 150
    XTERM               = 152
    LAST_CURSOR         = 153
    BLANK_CURSOR        =  -2
    CURSOR_IS_PIXMAP    =  -1
  end

  class Device < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdk::Device*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkDevice")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdk._gdk_device_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::Device*)
    end

    def to_unsafe_device
      @pointer.not_nil!.as(LibGdk::Device*)
    end

    def self.grab_info_libgtk_only(display : Gdk::Display, device : Gdk::Device, grab_window : Gdk::Window)
      __var0 = LibGdk.device_grab_info_libgtk_only(display.to_unsafe_display, device.to_unsafe_device, grab_window, out owner_events)
      {(__var0 == 1), (owner_events == 1)}
    end

    def associated_device
      __var0 = LibGdk.device_get_associated_device(@pointer.as(LibGdk::Device*))
      __var1 = Gdk::Device.new(__var0) if __var0
      __var1
    end

    def axes
      __var0 = LibGdk.device_get_axes(@pointer.as(LibGdk::Device*))
      Gdk::AxisFlags.new(__var0)
    end

    def axis_use(index_ : ::Int)
      __var0 = LibGdk.device_get_axis_use(@pointer.as(LibGdk::Device*), UInt32.new(index_))
      Gdk::AxisUse.new(__var0)
    end

    def device_type
      __var0 = LibGdk.device_get_device_type(@pointer.as(LibGdk::Device*))
      Gdk::DeviceType.new(__var0)
    end

    def display
      __var0 = LibGdk.device_get_display(@pointer.as(LibGdk::Device*))
      GObject.raise_unexpected_null("gdk_device_get_display") if __var0.null?
      Gdk::Display.new(__var0)
    end

    def has_cursor
      __var0 = LibGdk.device_get_has_cursor(@pointer.as(LibGdk::Device*))
      (__var0 == 1)
    end

    def key(index_ : ::Int, modifiers : Gdk::ModifierType)
      __var0 = LibGdk.device_get_key(@pointer.as(LibGdk::Device*), UInt32.new(index_), out keyval, modifiers)
      {(__var0 == 1), keyval}
    end

    def last_event_window
      __var0 = LibGdk.device_get_last_event_window(@pointer.as(LibGdk::Device*))
      __var1 = Gdk::Window.new(__var0) if __var0
      __var1
    end

    def mode
      __var0 = LibGdk.device_get_mode(@pointer.as(LibGdk::Device*))
      Gdk::InputMode.new(__var0)
    end

    def n_axes
      __var0 = LibGdk.device_get_n_axes(@pointer.as(LibGdk::Device*))
      __var0
    end

    def n_keys
      __var0 = LibGdk.device_get_n_keys(@pointer.as(LibGdk::Device*))
      __var0
    end

    def name
      __var0 = LibGdk.device_get_name(@pointer.as(LibGdk::Device*))
      GObject.raise_unexpected_null("gdk_device_get_name") if __var0.null?
      ::String.new(__var0)
    end

    def position(screen : Gdk::Screen?)
      LibGdk.device_get_position(@pointer.as(LibGdk::Device*), screen, out x, out y)
      {x, y}
    end

    def position_double(screen : Gdk::Screen?)
      LibGdk.device_get_position_double(@pointer.as(LibGdk::Device*), screen, out x, out y)
      {x, y}
    end

    def product_id
      __var0 = LibGdk.device_get_product_id(@pointer.as(LibGdk::Device*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def seat
      __var0 = LibGdk.device_get_seat(@pointer.as(LibGdk::Device*))
      GObject.raise_unexpected_null("gdk_device_get_seat") if __var0.null?
      Gdk::Seat.new(__var0)
    end

    def source
      __var0 = LibGdk.device_get_source(@pointer.as(LibGdk::Device*))
      Gdk::InputSource.new(__var0)
    end

    def vendor_id
      __var0 = LibGdk.device_get_vendor_id(@pointer.as(LibGdk::Device*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def window_at_position
      __var0 = LibGdk.device_get_window_at_position(@pointer.as(LibGdk::Device*), out win_x, out win_y)
      __var1 = Gdk::Window.new(__var0) if __var0
      {__var1, win_x, win_y}
    end

    def window_at_position_double
      __var0 = LibGdk.device_get_window_at_position_double(@pointer.as(LibGdk::Device*), out win_x, out win_y)
      __var1 = Gdk::Window.new(__var0) if __var0
      {__var1, win_x, win_y}
    end

    def grab(window : Gdk::Window, grab_ownership : Gdk::GrabOwnership, owner_events : ::Bool, event_mask : Gdk::EventMask, cursor : Gdk::Cursor?, time_ : ::Int)
      __var0 = LibGdk.device_grab(@pointer.as(LibGdk::Device*), window.to_unsafe_window, grab_ownership, LibC::Int.new(owner_events ? 1 : 0), event_mask, cursor ? cursor.to_unsafe_cursor : Pointer(LibGdk::Cursor).null, UInt32.new(time_))
      Gdk::GrabStatus.new(__var0)
    end

    def list_axes
      __var0 = LibGdk.device_list_axes(@pointer.as(LibGdk::Device*))
      GObject.raise_unexpected_null("gdk_device_list_axes") if __var0.null?
      GLib::ListIterator(Gdk::Atom, Pointer(LibGdk::Atom)*).new(GLib::List.new(__var0.as(LibGLib::List*)))
    end

    def list_slave_devices
      __var0 = LibGdk.device_list_slave_devices(@pointer.as(LibGdk::Device*))
      __var1 = GLib::ListIterator(Gdk::Device, LibGdk::Device*).new(GLib::List.new(__var0.as(LibGLib::List*))) if __var0
      __var1
    end

    def set_axis_use(index_ : ::Int, use : Gdk::AxisUse)
      LibGdk.device_set_axis_use(@pointer.as(LibGdk::Device*), UInt32.new(index_), use)
      nil
    end

    def set_key(index_ : ::Int, keyval : ::Int, modifiers : Gdk::ModifierType)
      LibGdk.device_set_key(@pointer.as(LibGdk::Device*), UInt32.new(index_), UInt32.new(keyval), modifiers)
      nil
    end

    def mode=(mode : Gdk::InputMode)
      __var0 = LibGdk.device_set_mode(@pointer.as(LibGdk::Device*), mode)
      (__var0 == 1)
    end

    def ungrab(time_ : ::Int)
      LibGdk.device_ungrab(@pointer.as(LibGdk::Device*), UInt32.new(time_))
      nil
    end

    def warp(screen : Gdk::Screen, x : ::Int, y : ::Int)
      LibGdk.device_warp(@pointer.as(LibGdk::Device*), screen.to_unsafe_screen, Int32.new(x), Int32.new(y))
      nil
    end

    def device_manager : Gdk::DeviceManager
      __var0 = GObject::Value.new(type: GObject::Type::OBJECT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "device-manager", __var0)
      Gdk::DeviceManager.cast(__var0.object)
    end

    def input_mode : Gdk::InputMode
      __var0 = GObject::Value.new(type: GObject::Type::ENUM)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "input-mode", __var0)
      Gdk::InputMode.new(UInt32.new(__var0.enum))
    end

    def input_mode=(value : Gdk::InputMode)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "input-mode", value.to_gvalue)
    end

    def input_source : Gdk::InputSource
      __var0 = GObject::Value.new(type: GObject::Type::ENUM)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "input-source", __var0)
      Gdk::InputSource.new(UInt32.new(__var0.enum))
    end

    def num_touches : UInt32
      __var0 = GObject::Value.new(type: GObject::Type::UINT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "num-touches", __var0)
      __var0.uint
    end

    def tool : Gdk::DeviceTool
      __var0 = GObject::Value.new(type: GObject::Type::OBJECT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "tool", __var0)
      Gdk::DeviceTool.cast(__var0.object)
    end

    def type : Gdk::DeviceType
      __var0 = GObject::Value.new(type: GObject::Type::ENUM)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "type", __var0)
      Gdk::DeviceType.new(UInt32.new(__var0.enum))
    end

    alias ChangedSignal = Device -> Nil

    def on_changed(*, after = false, &block : ChangedSignal)
      __var0 = ->(arg0 : LibGdk::Device*, box : Void*) {
        ::Box(ChangedSignal).unbox(box).call(Device.new(arg0))
      }

      __var1 = ::Box.box(ChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_changed(&block : ChangedSignal)
      on_changed(after: true, &block)
    end

    alias ToolChangedSignal = Device, Gdk::DeviceTool -> Nil

    def on_tool_changed(*, after = false, &block : ToolChangedSignal)
      __var0 = ->(arg0 : LibGdk::Device*, arg1 : LibGdk::DeviceTool*, box : Void*) {
        ::Box(ToolChangedSignal).unbox(box).call(Device.new(arg0), arg1.null? ? GObject.raise_unexpected_null("tool in tool_changed") : Gdk::DeviceTool.new(arg1))
      }

      __var1 = ::Box.box(ToolChangedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "tool-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_tool_changed(&block : ToolChangedSignal)
      on_tool_changed(after: true, &block)
    end
  end

  class DeviceManager < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdk::DeviceManager*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkDeviceManager")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdk._gdk_device_manager_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::DeviceManager*)
    end

    def to_unsafe_devicemanager
      @pointer.not_nil!.as(LibGdk::DeviceManager*)
    end

    def client_pointer
      __var0 = LibGdk.device_manager_get_client_pointer(@pointer.as(LibGdk::DeviceManager*))
      GObject.raise_unexpected_null("gdk_device_manager_get_client_pointer") if __var0.null?
      Gdk::Device.new(__var0)
    end

    def display
      __var0 = LibGdk.device_manager_get_display(@pointer.as(LibGdk::DeviceManager*))
      __var1 = Gdk::Display.new(__var0) if __var0
      __var1
    end

    def list_devices(type : Gdk::DeviceType)
      __var0 = LibGdk.device_manager_list_devices(@pointer.as(LibGdk::DeviceManager*), type)
      GObject.raise_unexpected_null("gdk_device_manager_list_devices") if __var0.null?
      GLib::ListIterator(Gdk::Device, LibGdk::Device*).new(GLib::List.new(__var0.as(LibGLib::List*)))
    end

    alias DeviceAddedSignal = DeviceManager, Gdk::Device -> Nil

    def on_device_added(*, after = false, &block : DeviceAddedSignal)
      __var0 = ->(arg0 : LibGdk::DeviceManager*, arg1 : LibGdk::Device*, box : Void*) {
        ::Box(DeviceAddedSignal).unbox(box).call(DeviceManager.new(arg0), arg1.null? ? GObject.raise_unexpected_null("device in device_added") : Gdk::Device.new(arg1))
      }

      __var1 = ::Box.box(DeviceAddedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "device-added", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_device_added(&block : DeviceAddedSignal)
      on_device_added(after: true, &block)
    end

    alias DeviceChangedSignal = DeviceManager, Gdk::Device -> Nil

    def on_device_changed(*, after = false, &block : DeviceChangedSignal)
      __var0 = ->(arg0 : LibGdk::DeviceManager*, arg1 : LibGdk::Device*, box : Void*) {
        ::Box(DeviceChangedSignal).unbox(box).call(DeviceManager.new(arg0), arg1.null? ? GObject.raise_unexpected_null("device in device_changed") : Gdk::Device.new(arg1))
      }

      __var1 = ::Box.box(DeviceChangedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "device-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_device_changed(&block : DeviceChangedSignal)
      on_device_changed(after: true, &block)
    end

    alias DeviceRemovedSignal = DeviceManager, Gdk::Device -> Nil

    def on_device_removed(*, after = false, &block : DeviceRemovedSignal)
      __var0 = ->(arg0 : LibGdk::DeviceManager*, arg1 : LibGdk::Device*, box : Void*) {
        ::Box(DeviceRemovedSignal).unbox(box).call(DeviceManager.new(arg0), arg1.null? ? GObject.raise_unexpected_null("device in device_removed") : Gdk::Device.new(arg1))
      }

      __var1 = ::Box.box(DeviceRemovedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "device-removed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_device_removed(&block : DeviceRemovedSignal)
      on_device_removed(after: true, &block)
    end
  end

  module DevicePad
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include DevicePad
      @pointer : Void*

      def initialize(pointer : LibGdk::DevicePad*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a GdkDevicePad")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdk._gdk_device_pad_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibGdk::DevicePad*)
      end

      def to_unsafe_devicepad
        @pointer.not_nil!.as(LibGdk::DevicePad*)
      end
    end

    def to_unsafe_devicepad
      @pointer.not_nil!.as(LibGdk::DevicePad*)
    end

    def feature_group(feature : Gdk::DevicePadFeature, feature_idx : ::Int)
      __var0 = LibGdk.device_pad_get_feature_group(@pointer.as(LibGdk::DevicePad*), feature, Int32.new(feature_idx))
      __var0
    end

    def group_n_modes(group_idx : ::Int)
      __var0 = LibGdk.device_pad_get_group_n_modes(@pointer.as(LibGdk::DevicePad*), Int32.new(group_idx))
      __var0
    end

    def n_features(feature : Gdk::DevicePadFeature)
      __var0 = LibGdk.device_pad_get_n_features(@pointer.as(LibGdk::DevicePad*), feature)
      __var0
    end

    def n_groups
      __var0 = LibGdk.device_pad_get_n_groups(@pointer.as(LibGdk::DevicePad*))
      __var0
    end
  end

  enum DevicePadFeature : UInt32
    BUTTON = 0
    RING   = 1
    STRIP  = 2
  end

  class DevicePadInterface
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGdk::DevicePadInterface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::DevicePadInterface*)
    end

    def to_unsafe_devicepadinterface
      @pointer.not_nil!.as(LibGdk::DevicePadInterface*)
    end
  end

  class DeviceTool < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdk::DeviceTool*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkDeviceTool")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdk._gdk_device_tool_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::DeviceTool*)
    end

    def to_unsafe_devicetool
      @pointer.not_nil!.as(LibGdk::DeviceTool*)
    end

    def initialize(*, axes : Gdk::AxisFlags? = nil, hardware_id : UInt64? = nil, serial : UInt64? = nil, tool_type : Gdk::DeviceToolType? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless axes.nil?
        __var0 << "axes".to_unsafe
        __var1 << axes.to_gvalue.to_unsafe.value
      end

      unless hardware_id.nil?
        __var0 << "hardware-id".to_unsafe
        __var1 << hardware_id.to_gvalue.to_unsafe.value
      end

      unless serial.nil?
        __var0 << "serial".to_unsafe
        __var1 << serial.to_gvalue.to_unsafe.value
      end

      unless tool_type.nil?
        __var0 << "tool-type".to_unsafe
        __var1 << tool_type.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGdk._gdk_device_tool_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def hardware_id
      __var0 = LibGdk.device_tool_get_hardware_id(@pointer.as(LibGdk::DeviceTool*))
      __var0
    end

    def serial
      __var0 = LibGdk.device_tool_get_serial(@pointer.as(LibGdk::DeviceTool*))
      __var0
    end

    def tool_type
      __var0 = LibGdk.device_tool_get_tool_type(@pointer.as(LibGdk::DeviceTool*))
      Gdk::DeviceToolType.new(__var0)
    end

    def axes : Gdk::AxisFlags
      __var0 = GObject::Value.new(type: GObject::Type::ENUM)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "axes", __var0)
      Gdk::AxisFlags.new(UInt32.new(__var0.flags))
    end
  end

  enum DeviceToolType : UInt32
    UNKNOWN  = 0
    PEN      = 1
    ERASER   = 2
    BRUSH    = 3
    PENCIL   = 4
    AIRBRUSH = 5
    MOUSE    = 6
    LENS     = 7
  end

  enum DeviceType : UInt32
    MASTER   = 0
    SLAVE    = 1
    FLOATING = 2
  end

  class Display < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdk::Display*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkDisplay")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdk._gdk_display_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::Display*)
    end

    def to_unsafe_display
      @pointer.not_nil!.as(LibGdk::Display*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(LibGdk._gdk_display_get_type, 0, nil, nil).as(Void*)
    end

    def self.default
      __var0 = LibGdk.display_get_default
      __var1 = Gdk::Display.new(__var0) if __var0
      __var1
    end

    def self.open(display_name : ::String)
      __var0 = LibGdk.display_open(display_name.to_unsafe)
      __var1 = Gdk::Display.new(__var0) if __var0
      __var1
    end

    def self.open_default_libgtk_only
      __var0 = LibGdk.display_open_default_libgtk_only
      __var1 = Gdk::Display.new(__var0) if __var0
      __var1
    end

    def beep
      LibGdk.display_beep(@pointer.as(LibGdk::Display*))
      nil
    end

    def close
      LibGdk.display_close(@pointer.as(LibGdk::Display*))
      nil
    end

    def device_is_grabbed(device : Gdk::Device)
      __var0 = LibGdk.display_device_is_grabbed(@pointer.as(LibGdk::Display*), device.to_unsafe_device)
      (__var0 == 1)
    end

    def flush
      LibGdk.display_flush(@pointer.as(LibGdk::Display*))
      nil
    end

    def app_launch_context
      __var0 = LibGdk.display_get_app_launch_context(@pointer.as(LibGdk::Display*))
      GObject.raise_unexpected_null("gdk_display_get_app_launch_context") if __var0.null?
      Gdk::AppLaunchContext.new(__var0)
    end

    def default_cursor_size
      __var0 = LibGdk.display_get_default_cursor_size(@pointer.as(LibGdk::Display*))
      __var0
    end

    def default_group
      __var0 = LibGdk.display_get_default_group(@pointer.as(LibGdk::Display*))
      GObject.raise_unexpected_null("gdk_display_get_default_group") if __var0.null?
      Gdk::Window.new(__var0)
    end

    def default_screen
      __var0 = LibGdk.display_get_default_screen(@pointer.as(LibGdk::Display*))
      GObject.raise_unexpected_null("gdk_display_get_default_screen") if __var0.null?
      Gdk::Screen.new(__var0)
    end

    def default_seat
      __var0 = LibGdk.display_get_default_seat(@pointer.as(LibGdk::Display*))
      GObject.raise_unexpected_null("gdk_display_get_default_seat") if __var0.null?
      Gdk::Seat.new(__var0)
    end

    def device_manager
      __var0 = LibGdk.display_get_device_manager(@pointer.as(LibGdk::Display*))
      __var1 = Gdk::DeviceManager.new(__var0) if __var0
      __var1
    end

    def event
      __var0 = LibGdk.display_get_event(@pointer.as(LibGdk::Display*))
      __var1 = Gdk::Event.new(__var0) if __var0
      __var1
    end

    def maximal_cursor_size
      LibGdk.display_get_maximal_cursor_size(@pointer.as(LibGdk::Display*), out width, out height)
      {width, height}
    end

    def monitor(monitor_num : ::Int)
      __var0 = LibGdk.display_get_monitor(@pointer.as(LibGdk::Display*), Int32.new(monitor_num))
      __var1 = Gdk::Monitor.new(__var0) if __var0
      __var1
    end

    def monitor_at_point(x : ::Int, y : ::Int)
      __var0 = LibGdk.display_get_monitor_at_point(@pointer.as(LibGdk::Display*), Int32.new(x), Int32.new(y))
      GObject.raise_unexpected_null("gdk_display_get_monitor_at_point") if __var0.null?
      Gdk::Monitor.new(__var0)
    end

    def monitor_at_window(window : Gdk::Window)
      __var0 = LibGdk.display_get_monitor_at_window(@pointer.as(LibGdk::Display*), window.to_unsafe_window)
      GObject.raise_unexpected_null("gdk_display_get_monitor_at_window") if __var0.null?
      Gdk::Monitor.new(__var0)
    end

    def n_monitors
      __var0 = LibGdk.display_get_n_monitors(@pointer.as(LibGdk::Display*))
      __var0
    end

    def n_screens
      __var0 = LibGdk.display_get_n_screens(@pointer.as(LibGdk::Display*))
      __var0
    end

    def name
      __var0 = LibGdk.display_get_name(@pointer.as(LibGdk::Display*))
      GObject.raise_unexpected_null("gdk_display_get_name") if __var0.null?
      ::String.new(__var0)
    end

    def pointer(screen : Gdk::Screen?, mask : Gdk::ModifierType?)
      LibGdk.display_get_pointer(@pointer.as(LibGdk::Display*), screen, out x, out y, mask)
      {x, y}
    end

    def primary_monitor
      __var0 = LibGdk.display_get_primary_monitor(@pointer.as(LibGdk::Display*))
      __var1 = Gdk::Monitor.new(__var0) if __var0
      __var1
    end

    def screen(screen_num : ::Int)
      __var0 = LibGdk.display_get_screen(@pointer.as(LibGdk::Display*), Int32.new(screen_num))
      GObject.raise_unexpected_null("gdk_display_get_screen") if __var0.null?
      Gdk::Screen.new(__var0)
    end

    def window_at_pointer
      __var0 = LibGdk.display_get_window_at_pointer(@pointer.as(LibGdk::Display*), out win_x, out win_y)
      __var1 = Gdk::Window.new(__var0) if __var0
      {__var1, win_x, win_y}
    end

    def has_pending
      __var0 = LibGdk.display_has_pending(@pointer.as(LibGdk::Display*))
      (__var0 == 1)
    end

    def closed?
      __var0 = LibGdk.display_is_closed(@pointer.as(LibGdk::Display*))
      (__var0 == 1)
    end

    def keyboard_ungrab(time_ : ::Int)
      LibGdk.display_keyboard_ungrab(@pointer.as(LibGdk::Display*), UInt32.new(time_))
      nil
    end

    def list_devices
      __var0 = LibGdk.display_list_devices(@pointer.as(LibGdk::Display*))
      GObject.raise_unexpected_null("gdk_display_list_devices") if __var0.null?
      GLib::ListIterator(Gdk::Device, LibGdk::Device*).new(GLib::List.new(__var0.as(LibGLib::List*)))
    end

    def list_seats
      __var0 = LibGdk.display_list_seats(@pointer.as(LibGdk::Display*))
      GObject.raise_unexpected_null("gdk_display_list_seats") if __var0.null?
      GLib::ListIterator(Gdk::Seat, LibGdk::Seat*).new(GLib::List.new(__var0.as(LibGLib::List*)))
    end

    def notify_startup_complete(startup_id : ::String)
      LibGdk.display_notify_startup_complete(@pointer.as(LibGdk::Display*), startup_id.to_unsafe)
      nil
    end

    def peek_event
      __var0 = LibGdk.display_peek_event(@pointer.as(LibGdk::Display*))
      __var1 = Gdk::Event.new(__var0) if __var0
      __var1
    end

    def pointer_is_grabbed
      __var0 = LibGdk.display_pointer_is_grabbed(@pointer.as(LibGdk::Display*))
      (__var0 == 1)
    end

    def pointer_ungrab(time_ : ::Int)
      LibGdk.display_pointer_ungrab(@pointer.as(LibGdk::Display*), UInt32.new(time_))
      nil
    end

    def put_event(event : Gdk::Event::Union)
      LibGdk.display_put_event(@pointer.as(LibGdk::Display*), event.to_unsafe.as(LibGdk::Event*))
      nil
    end

    def request_selection_notification(selection : Gdk::Atom)
      __var0 = LibGdk.display_request_selection_notification(@pointer.as(LibGdk::Display*), selection.to_unsafe.as(LibGdk::Atom*))
      (__var0 == 1)
    end

    def double_click_distance=(distance : ::Int)
      LibGdk.display_set_double_click_distance(@pointer.as(LibGdk::Display*), UInt32.new(distance))
      nil
    end

    def double_click_time=(msec : ::Int)
      LibGdk.display_set_double_click_time(@pointer.as(LibGdk::Display*), UInt32.new(msec))
      nil
    end

    def store_clipboard(clipboard_window : Gdk::Window, time_ : ::Int, targets : ::Enumerable?)
      n_targets = targets ? targets.size : 0
      if targets
        __targets = targets ? (__targets_ary = targets.map { |__item| __item.to_unsafe.as(LibGdk::Atom*) }.to_a).to_unsafe : Pointer(Pointer(LibGdk::Atom)).null
        n_targets = __targets_ary.size
      else
        n_targets = 0
      end

      LibGdk.display_store_clipboard(@pointer.as(LibGdk::Display*), clipboard_window.to_unsafe_window, UInt32.new(time_), __targets, Int32.new(n_targets))
      nil
    end

    def supports_clipboard_persistence
      __var0 = LibGdk.display_supports_clipboard_persistence(@pointer.as(LibGdk::Display*))
      (__var0 == 1)
    end

    def supports_composite
      __var0 = LibGdk.display_supports_composite(@pointer.as(LibGdk::Display*))
      (__var0 == 1)
    end

    def supports_cursor_alpha
      __var0 = LibGdk.display_supports_cursor_alpha(@pointer.as(LibGdk::Display*))
      (__var0 == 1)
    end

    def supports_cursor_color
      __var0 = LibGdk.display_supports_cursor_color(@pointer.as(LibGdk::Display*))
      (__var0 == 1)
    end

    def supports_input_shapes
      __var0 = LibGdk.display_supports_input_shapes(@pointer.as(LibGdk::Display*))
      (__var0 == 1)
    end

    def supports_selection_notification
      __var0 = LibGdk.display_supports_selection_notification(@pointer.as(LibGdk::Display*))
      (__var0 == 1)
    end

    def supports_shapes
      __var0 = LibGdk.display_supports_shapes(@pointer.as(LibGdk::Display*))
      (__var0 == 1)
    end

    def sync
      LibGdk.display_sync(@pointer.as(LibGdk::Display*))
      nil
    end

    def warp_pointer(screen : Gdk::Screen, x : ::Int, y : ::Int)
      LibGdk.display_warp_pointer(@pointer.as(LibGdk::Display*), screen.to_unsafe_screen, Int32.new(x), Int32.new(y))
      nil
    end

    alias ClosedSignal = Display, ::Bool -> Nil

    def on_closed(*, after = false, &block : ClosedSignal)
      __var0 = ->(arg0 : LibGdk::Display*, arg1 : LibC::Int, box : Void*) {
        ::Box(ClosedSignal).unbox(box).call(Display.new(arg0), (arg1 == 1))
      }

      __var1 = ::Box.box(ClosedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "closed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_closed(&block : ClosedSignal)
      on_closed(after: true, &block)
    end

    alias MonitorAddedSignal = Display, Gdk::Monitor -> Nil

    def on_monitor_added(*, after = false, &block : MonitorAddedSignal)
      __var0 = ->(arg0 : LibGdk::Display*, arg1 : LibGdk::Monitor*, box : Void*) {
        ::Box(MonitorAddedSignal).unbox(box).call(Display.new(arg0), arg1.null? ? GObject.raise_unexpected_null("monitor in monitor_added") : Gdk::Monitor.new(arg1))
      }

      __var1 = ::Box.box(MonitorAddedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "monitor-added", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_monitor_added(&block : MonitorAddedSignal)
      on_monitor_added(after: true, &block)
    end

    alias MonitorRemovedSignal = Display, Gdk::Monitor -> Nil

    def on_monitor_removed(*, after = false, &block : MonitorRemovedSignal)
      __var0 = ->(arg0 : LibGdk::Display*, arg1 : LibGdk::Monitor*, box : Void*) {
        ::Box(MonitorRemovedSignal).unbox(box).call(Display.new(arg0), arg1.null? ? GObject.raise_unexpected_null("monitor in monitor_removed") : Gdk::Monitor.new(arg1))
      }

      __var1 = ::Box.box(MonitorRemovedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "monitor-removed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_monitor_removed(&block : MonitorRemovedSignal)
      on_monitor_removed(after: true, &block)
    end

    alias OpenedSignal = Display -> Nil

    def on_opened(*, after = false, &block : OpenedSignal)
      __var0 = ->(arg0 : LibGdk::Display*, box : Void*) {
        ::Box(OpenedSignal).unbox(box).call(Display.new(arg0))
      }

      __var1 = ::Box.box(OpenedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "opened", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_opened(&block : OpenedSignal)
      on_opened(after: true, &block)
    end

    alias SeatAddedSignal = Display, Gdk::Seat -> Nil

    def on_seat_added(*, after = false, &block : SeatAddedSignal)
      __var0 = ->(arg0 : LibGdk::Display*, arg1 : LibGdk::Seat*, box : Void*) {
        ::Box(SeatAddedSignal).unbox(box).call(Display.new(arg0), arg1.null? ? GObject.raise_unexpected_null("seat in seat_added") : Gdk::Seat.new(arg1))
      }

      __var1 = ::Box.box(SeatAddedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "seat-added", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_seat_added(&block : SeatAddedSignal)
      on_seat_added(after: true, &block)
    end

    alias SeatRemovedSignal = Display, Gdk::Seat -> Nil

    def on_seat_removed(*, after = false, &block : SeatRemovedSignal)
      __var0 = ->(arg0 : LibGdk::Display*, arg1 : LibGdk::Seat*, box : Void*) {
        ::Box(SeatRemovedSignal).unbox(box).call(Display.new(arg0), arg1.null? ? GObject.raise_unexpected_null("seat in seat_removed") : Gdk::Seat.new(arg1))
      }

      __var1 = ::Box.box(SeatRemovedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "seat-removed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_seat_removed(&block : SeatRemovedSignal)
      on_seat_removed(after: true, &block)
    end
  end

  class DisplayManager < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdk::DisplayManager*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkDisplayManager")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdk._gdk_display_manager_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::DisplayManager*)
    end

    def to_unsafe_displaymanager
      @pointer.not_nil!.as(LibGdk::DisplayManager*)
    end

    def initialize(*, default_display : Gdk::Display? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless default_display.nil?
        __var0 << "default-display".to_unsafe
        __var1 << default_display.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGdk._gdk_display_manager_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.get
      __var0 = LibGdk.display_manager_get
      GObject.raise_unexpected_null("gdk_display_manager_get") if __var0.null?
      Gdk::DisplayManager.new(__var0)
    end

    def default_display
      __var0 = LibGdk.display_manager_get_default_display(@pointer.as(LibGdk::DisplayManager*))
      __var1 = Gdk::Display.new(__var0) if __var0
      __var1
    end

    def list_displays
      __var0 = LibGdk.display_manager_list_displays(@pointer.as(LibGdk::DisplayManager*))
      GObject.raise_unexpected_null("gdk_display_manager_list_displays") if __var0.null?
      GLib::SListIterator(Gdk::Display, LibGdk::Display*).new(GLib::SList.new(__var0.as(LibGLib::SList*)))
    end

    def open_display(name : ::String)
      __var0 = LibGdk.display_manager_open_display(@pointer.as(LibGdk::DisplayManager*), name.to_unsafe)
      __var1 = Gdk::Display.new(__var0) if __var0
      __var1
    end

    def default_display=(display : Gdk::Display)
      LibGdk.display_manager_set_default_display(@pointer.as(LibGdk::DisplayManager*), display.to_unsafe_display)
      nil
    end

    alias DisplayOpenedSignal = DisplayManager, Gdk::Display -> Nil

    def on_display_opened(*, after = false, &block : DisplayOpenedSignal)
      __var0 = ->(arg0 : LibGdk::DisplayManager*, arg1 : LibGdk::Display*, box : Void*) {
        ::Box(DisplayOpenedSignal).unbox(box).call(DisplayManager.new(arg0), arg1.null? ? GObject.raise_unexpected_null("display in display_opened") : Gdk::Display.new(arg1))
      }

      __var1 = ::Box.box(DisplayOpenedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "display-opened", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_display_opened(&block : DisplayOpenedSignal)
      on_display_opened(after: true, &block)
    end
  end

  @[Flags]
  enum DragAction : UInt32
    ZERO_NONE =  0
    DEFAULT   =  1
    COPY      =  2
    MOVE      =  4
    LINK      =  8
    PRIVATE   = 16
    ASK       = 32
  end

  enum DragCancelReason : UInt32
    NO_TARGET      = 0
    USER_CANCELLED = 1
    ERROR          = 2
  end

  class DragContext < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdk::DragContext*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkDragContext")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdk._gdk_drag_context_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::DragContext*)
    end

    def to_unsafe_dragcontext
      @pointer.not_nil!.as(LibGdk::DragContext*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(LibGdk._gdk_drag_context_get_type, 0, nil, nil).as(Void*)
    end

    def actions
      __var0 = LibGdk.drag_context_get_actions(@pointer.as(LibGdk::DragContext*))
      Gdk::DragAction.new(__var0)
    end

    def dest_window
      __var0 = LibGdk.drag_context_get_dest_window(@pointer.as(LibGdk::DragContext*))
      GObject.raise_unexpected_null("gdk_drag_context_get_dest_window") if __var0.null?
      Gdk::Window.new(__var0)
    end

    def device
      __var0 = LibGdk.drag_context_get_device(@pointer.as(LibGdk::DragContext*))
      GObject.raise_unexpected_null("gdk_drag_context_get_device") if __var0.null?
      Gdk::Device.new(__var0)
    end

    def drag_window
      __var0 = LibGdk.drag_context_get_drag_window(@pointer.as(LibGdk::DragContext*))
      __var1 = Gdk::Window.new(__var0) if __var0
      __var1
    end

    def protocol
      __var0 = LibGdk.drag_context_get_protocol(@pointer.as(LibGdk::DragContext*))
      Gdk::DragProtocol.new(__var0)
    end

    def selected_action
      __var0 = LibGdk.drag_context_get_selected_action(@pointer.as(LibGdk::DragContext*))
      Gdk::DragAction.new(__var0)
    end

    def source_window
      __var0 = LibGdk.drag_context_get_source_window(@pointer.as(LibGdk::DragContext*))
      GObject.raise_unexpected_null("gdk_drag_context_get_source_window") if __var0.null?
      Gdk::Window.new(__var0)
    end

    def suggested_action
      __var0 = LibGdk.drag_context_get_suggested_action(@pointer.as(LibGdk::DragContext*))
      Gdk::DragAction.new(__var0)
    end

    def list_targets
      __var0 = LibGdk.drag_context_list_targets(@pointer.as(LibGdk::DragContext*))
      GObject.raise_unexpected_null("gdk_drag_context_list_targets") if __var0.null?
      GLib::ListIterator(Gdk::Atom, Pointer(LibGdk::Atom)*).new(GLib::List.new(__var0.as(LibGLib::List*)))
    end

    def manage_dnd(ipc_window : Gdk::Window, actions : Gdk::DragAction)
      __var0 = LibGdk.drag_context_manage_dnd(@pointer.as(LibGdk::DragContext*), ipc_window.to_unsafe_window, actions)
      (__var0 == 1)
    end

    def device=(device : Gdk::Device)
      LibGdk.drag_context_set_device(@pointer.as(LibGdk::DragContext*), device.to_unsafe_device)
      nil
    end

    def set_hotspot(hot_x : ::Int, hot_y : ::Int)
      LibGdk.drag_context_set_hotspot(@pointer.as(LibGdk::DragContext*), Int32.new(hot_x), Int32.new(hot_y))
      nil
    end

    alias ActionChangedSignal = DragContext, Gdk::DragAction -> Nil

    def on_action_changed(*, after = false, &block : ActionChangedSignal)
      __var0 = ->(arg0 : LibGdk::DragContext*, arg1 : LibGdk::DragAction, box : Void*) {
        ::Box(ActionChangedSignal).unbox(box).call(DragContext.new(arg0), Gdk::DragAction.new(arg1))
      }

      __var1 = ::Box.box(ActionChangedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "action-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_action_changed(&block : ActionChangedSignal)
      on_action_changed(after: true, &block)
    end

    alias CancelSignal = DragContext, Gdk::DragCancelReason -> Nil

    def on_cancel(*, after = false, &block : CancelSignal)
      __var0 = ->(arg0 : LibGdk::DragContext*, arg1 : LibGdk::DragCancelReason, box : Void*) {
        ::Box(CancelSignal).unbox(box).call(DragContext.new(arg0), Gdk::DragCancelReason.new(arg1))
      }

      __var1 = ::Box.box(CancelSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "cancel", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_cancel(&block : CancelSignal)
      on_cancel(after: true, &block)
    end

    alias DndFinishedSignal = DragContext -> Nil

    def on_dnd_finished(*, after = false, &block : DndFinishedSignal)
      __var0 = ->(arg0 : LibGdk::DragContext*, box : Void*) {
        ::Box(DndFinishedSignal).unbox(box).call(DragContext.new(arg0))
      }

      __var1 = ::Box.box(DndFinishedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "dnd-finished", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_dnd_finished(&block : DndFinishedSignal)
      on_dnd_finished(after: true, &block)
    end

    alias DropPerformedSignal = DragContext, Int32 -> Nil

    def on_drop_performed(*, after = false, &block : DropPerformedSignal)
      __var0 = ->(arg0 : LibGdk::DragContext*, arg1 : Int32, box : Void*) {
        ::Box(DropPerformedSignal).unbox(box).call(DragContext.new(arg0), arg1)
      }

      __var1 = ::Box.box(DropPerformedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "drop-performed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_drop_performed(&block : DropPerformedSignal)
      on_drop_performed(after: true, &block)
    end
  end

  enum DragProtocol : UInt32
    NONE            = 0
    MOTIF           = 1
    XDND            = 2
    ROOTWIN         = 3
    WIN32_DROPFILES = 4
    OLE2            = 5
    LOCAL           = 6
    WAYLAND         = 7
  end

  class DrawingContext < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdk::DrawingContext*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkDrawingContext")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdk._gdk_drawing_context_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::DrawingContext*)
    end

    def to_unsafe_drawingcontext
      @pointer.not_nil!.as(LibGdk::DrawingContext*)
    end

    def initialize(*, clip : Cairo::Region? = nil, window : Gdk::Window? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless clip.nil?
        __var0 << "clip".to_unsafe
        __var1 << clip.to_gvalue.to_unsafe.value
      end

      unless window.nil?
        __var0 << "window".to_unsafe
        __var1 << window.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGdk._gdk_drawing_context_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def cairo_context
      __var0 = LibGdk.drawing_context_get_cairo_context(@pointer.as(LibGdk::DrawingContext*))
      GObject.raise_unexpected_null("gdk_drawing_context_get_cairo_context") if __var0.null?
      Cairo::Context.new(__var0)
    end

    def clip
      __var0 = LibGdk.drawing_context_get_clip(@pointer.as(LibGdk::DrawingContext*))
      __var1 = Cairo::Region.new(__var0) if __var0
      __var1
    end

    def window
      __var0 = LibGdk.drawing_context_get_window(@pointer.as(LibGdk::DrawingContext*))
      GObject.raise_unexpected_null("gdk_drawing_context_get_window") if __var0.null?
      Gdk::Window.new(__var0)
    end

    def valid?
      __var0 = LibGdk.drawing_context_is_valid(@pointer.as(LibGdk::DrawingContext*))
      (__var0 == 1)
    end
  end

  class DrawingContextClass
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGdk::DrawingContextClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::DrawingContextClass*)
    end

    def to_unsafe_drawingcontextclass
      @pointer.not_nil!.as(LibGdk::DrawingContextClass*)
    end
  end

  class Event
    include GObject::WrappedType
    alias Union = Event | Gdk::EventType | Gdk::EventAny | Gdk::EventExpose | Gdk::EventVisibility | Gdk::EventMotion | Gdk::EventButton | Gdk::EventTouch | Gdk::EventScroll | Gdk::EventKey | Gdk::EventCrossing | Gdk::EventFocus | Gdk::EventConfigure | Gdk::EventProperty | Gdk::EventSelection | Gdk::EventOwnerChange | Gdk::EventProximity | Gdk::EventDND | Gdk::EventWindowState | Gdk::EventSetting | Gdk::EventGrabBroken | Gdk::EventTouchpadSwipe | Gdk::EventTouchpadPinch | Gdk::EventPadButton | Gdk::EventPadAxis | Gdk::EventPadGroupMode

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventType*))
    end

    def any
      Gdk::EventAny.new(to_unsafe.as(LibGdk::EventAny*))
    end

    def expose
      Gdk::EventExpose.new(to_unsafe.as(LibGdk::EventExpose*))
    end

    def visibility
      Gdk::EventVisibility.new(to_unsafe.as(LibGdk::EventVisibility*))
    end

    def motion
      Gdk::EventMotion.new(to_unsafe.as(LibGdk::EventMotion*))
    end

    def button
      Gdk::EventButton.new(to_unsafe.as(LibGdk::EventButton*))
    end

    def touch
      Gdk::EventTouch.new(to_unsafe.as(LibGdk::EventTouch*))
    end

    def scroll
      Gdk::EventScroll.new(to_unsafe.as(LibGdk::EventScroll*))
    end

    def key
      Gdk::EventKey.new(to_unsafe.as(LibGdk::EventKey*))
    end

    def crossing
      Gdk::EventCrossing.new(to_unsafe.as(LibGdk::EventCrossing*))
    end

    def focus_change
      Gdk::EventFocus.new(to_unsafe.as(LibGdk::EventFocus*))
    end

    def configure
      Gdk::EventConfigure.new(to_unsafe.as(LibGdk::EventConfigure*))
    end

    def property
      Gdk::EventProperty.new(to_unsafe.as(LibGdk::EventProperty*))
    end

    def selection
      Gdk::EventSelection.new(to_unsafe.as(LibGdk::EventSelection*))
    end

    def owner_change
      Gdk::EventOwnerChange.new(to_unsafe.as(LibGdk::EventOwnerChange*))
    end

    def proximity
      Gdk::EventProximity.new(to_unsafe.as(LibGdk::EventProximity*))
    end

    def dnd
      Gdk::EventDND.new(to_unsafe.as(LibGdk::EventDND*))
    end

    def window_state
      Gdk::EventWindowState.new(to_unsafe.as(LibGdk::EventWindowState*))
    end

    def setting
      Gdk::EventSetting.new(to_unsafe.as(LibGdk::EventSetting*))
    end

    def grab_broken
      Gdk::EventGrabBroken.new(to_unsafe.as(LibGdk::EventGrabBroken*))
    end

    def touchpad_swipe
      Gdk::EventTouchpadSwipe.new(to_unsafe.as(LibGdk::EventTouchpadSwipe*))
    end

    def touchpad_pinch
      Gdk::EventTouchpadPinch.new(to_unsafe.as(LibGdk::EventTouchpadPinch*))
    end

    def pad_button
      Gdk::EventPadButton.new(to_unsafe.as(LibGdk::EventPadButton*))
    end

    def pad_axis
      Gdk::EventPadAxis.new(to_unsafe.as(LibGdk::EventPadAxis*))
    end

    def pad_group_mode
      Gdk::EventPadGroupMode.new(to_unsafe.as(LibGdk::EventPadGroupMode*))
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::Event*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::Event*)
    end

    def to_unsafe_event
      @pointer.not_nil!.as(LibGdk::Event*)
    end

    def self.new(type : Gdk::EventType) : self
      __var0 = LibGdk.event_new(type)
      GObject.raise_unexpected_null("gdk_event_new") if __var0.null?
      cast(Gdk::Event.new(__var0))
    end

    def angle(event2 : Gdk::Event::Union)
      __var0 = LibGdk.event_get_angle(@pointer.as(LibGdk::Event*), event2.to_unsafe.as(LibGdk::Event*), out angle)
      {(__var0 == 1), angle}
    end

    def center(event2 : Gdk::Event::Union)
      __var0 = LibGdk.event_get_center(@pointer.as(LibGdk::Event*), event2.to_unsafe.as(LibGdk::Event*), out x, out y)
      {(__var0 == 1), x, y}
    end

    def distance(event2 : Gdk::Event::Union)
      __var0 = LibGdk.event_get_distance(@pointer.as(LibGdk::Event*), event2.to_unsafe.as(LibGdk::Event*), out distance)
      {(__var0 == 1), distance}
    end

    def copy
      __var0 = LibGdk.event_copy(@pointer.as(LibGdk::Event*))
      GObject.raise_unexpected_null("gdk_event_copy") if __var0.null?
      Gdk::Event.new(__var0)
    end

    def free
      LibGdk.event_free(@pointer.as(LibGdk::Event*))
      nil
    end

    def axis(axis_use : Gdk::AxisUse)
      __var0 = LibGdk.event_get_axis(@pointer.as(LibGdk::Event*), axis_use, out value)
      {(__var0 == 1), value}
    end

    def button
      __var0 = LibGdk.event_get_button(@pointer.as(LibGdk::Event*), out button)
      {(__var0 == 1), button}
    end

    def click_count
      __var0 = LibGdk.event_get_click_count(@pointer.as(LibGdk::Event*), out click_count)
      {(__var0 == 1), click_count}
    end

    def coords
      __var0 = LibGdk.event_get_coords(@pointer.as(LibGdk::Event*), out x_win, out y_win)
      {(__var0 == 1), x_win, y_win}
    end

    def device
      __var0 = LibGdk.event_get_device(@pointer.as(LibGdk::Event*))
      __var1 = Gdk::Device.new(__var0) if __var0
      __var1
    end

    def device_tool
      __var0 = LibGdk.event_get_device_tool(@pointer.as(LibGdk::Event*))
      GObject.raise_unexpected_null("gdk_event_get_device_tool") if __var0.null?
      Gdk::DeviceTool.new(__var0)
    end

    def event_sequence
      __var0 = LibGdk.event_get_event_sequence(@pointer.as(LibGdk::Event*))
      GObject.raise_unexpected_null("gdk_event_get_event_sequence") if __var0.null?
      Gdk::EventSequence.new(__var0)
    end

    def event_type
      __var0 = LibGdk.event_get_event_type(@pointer.as(LibGdk::Event*))
      Gdk::EventType.new(__var0)
    end

    def keycode
      __var0 = LibGdk.event_get_keycode(@pointer.as(LibGdk::Event*), out keycode)
      {(__var0 == 1), keycode}
    end

    def keyval
      __var0 = LibGdk.event_get_keyval(@pointer.as(LibGdk::Event*), out keyval)
      {(__var0 == 1), keyval}
    end

    def pointer_emulated
      __var0 = LibGdk.event_get_pointer_emulated(@pointer.as(LibGdk::Event*))
      (__var0 == 1)
    end

    def root_coords
      __var0 = LibGdk.event_get_root_coords(@pointer.as(LibGdk::Event*), out x_root, out y_root)
      {(__var0 == 1), x_root, y_root}
    end

    def scancode
      __var0 = LibGdk.event_get_scancode(@pointer.as(LibGdk::Event*))
      __var0
    end

    def screen
      __var0 = LibGdk.event_get_screen(@pointer.as(LibGdk::Event*))
      GObject.raise_unexpected_null("gdk_event_get_screen") if __var0.null?
      Gdk::Screen.new(__var0)
    end

    def scroll_deltas
      __var0 = LibGdk.event_get_scroll_deltas(@pointer.as(LibGdk::Event*), out delta_x, out delta_y)
      {(__var0 == 1), delta_x, delta_y}
    end

    def scroll_direction(direction : Gdk::ScrollDirection)
      __var0 = LibGdk.event_get_scroll_direction(@pointer.as(LibGdk::Event*), direction)
      (__var0 == 1)
    end

    def seat
      __var0 = LibGdk.event_get_seat(@pointer.as(LibGdk::Event*))
      GObject.raise_unexpected_null("gdk_event_get_seat") if __var0.null?
      Gdk::Seat.new(__var0)
    end

    def source_device
      __var0 = LibGdk.event_get_source_device(@pointer.as(LibGdk::Event*))
      __var1 = Gdk::Device.new(__var0) if __var0
      __var1
    end

    def state(state : Gdk::ModifierType)
      __var0 = LibGdk.event_get_state(@pointer.as(LibGdk::Event*), state)
      (__var0 == 1)
    end

    def time
      __var0 = LibGdk.event_get_time(@pointer.as(LibGdk::Event*))
      __var0
    end

    def window
      __var0 = LibGdk.event_get_window(@pointer.as(LibGdk::Event*))
      GObject.raise_unexpected_null("gdk_event_get_window") if __var0.null?
      Gdk::Window.new(__var0)
    end

    def scroll_stop_event?
      __var0 = LibGdk.event_is_scroll_stop_event(@pointer.as(LibGdk::Event*))
      (__var0 == 1)
    end

    def put
      LibGdk.event_put(@pointer.as(LibGdk::Event*))
      nil
    end

    def device=(device : Gdk::Device)
      LibGdk.event_set_device(@pointer.as(LibGdk::Event*), device.to_unsafe_device)
      nil
    end

    def device_tool=(tool : Gdk::DeviceTool?)
      LibGdk.event_set_device_tool(@pointer.as(LibGdk::Event*), tool ? tool.to_unsafe_devicetool : Pointer(LibGdk::DeviceTool).null)
      nil
    end

    def screen=(screen : Gdk::Screen)
      LibGdk.event_set_screen(@pointer.as(LibGdk::Event*), screen.to_unsafe_screen)
      nil
    end

    def source_device=(device : Gdk::Device)
      LibGdk.event_set_source_device(@pointer.as(LibGdk::Event*), device.to_unsafe_device)
      nil
    end

    def triggers_context_menu
      __var0 = LibGdk.event_triggers_context_menu(@pointer.as(LibGdk::Event*))
      (__var0 == 1)
    end

    def self.get
      __var0 = LibGdk.event_get
      __var1 = Gdk::Event.new(__var0) if __var0
      __var1
    end

    def self.handler_set(func : Gdk::EventFunc, data : Void*?, notify : GLib::DestroyNotify)
      LibGdk.event_handler_set(func, data ? data : Pointer(Void).null, notify)
      nil
    end

    def self.peek
      __var0 = LibGdk.event_peek
      __var1 = Gdk::Event.new(__var0) if __var0
      __var1
    end

    def self.request_motions(event : Gdk::EventMotion)
      LibGdk.event_request_motions(event.to_unsafe.as(LibGdk::EventMotion*))
      nil
    end
  end

  class EventAny
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGdk::EventAny*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventAny*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventAny*)
    end

    def to_unsafe_eventany
      @pointer.not_nil!.as(LibGdk::EventAny*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventAny*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventAny*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventAny*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventAny*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventAny*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventAny*).value.send_event = Int8.new(value)
    end
  end

  class EventButton
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, time : UInt32? = nil, x : Float64? = nil, y : Float64? = nil, axes : Float64? = nil, state : Gdk::ModifierType? = nil, button : UInt32? = nil, device : Gdk::Device? = nil, x_root : Float64? = nil, y_root : Float64? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(80u64, 0u8).as(LibGdk::EventButton*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.time = time unless time.nil?
      __var0.x = x unless x.nil?
      __var0.y = y unless y.nil?
      __var0.axes = axes unless axes.nil?
      __var0.state = state unless state.nil?
      __var0.button = button unless button.nil?
      __var0.device = device unless device.nil?
      __var0.x_root = x_root unless x_root.nil?
      __var0.y_root = y_root unless y_root.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventButton*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventButton*)
    end

    def to_unsafe_eventbutton
      @pointer.not_nil!.as(LibGdk::EventButton*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventButton*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventButton*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventButton*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventButton*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventButton*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventButton*).value.send_event = Int8.new(value)
    end

    def time
      to_unsafe.as(LibGdk::EventButton*).value.time
    end

    def time=(value : UInt32)
      to_unsafe.as(LibGdk::EventButton*).value.time = UInt32.new(value)
    end

    def x
      to_unsafe.as(LibGdk::EventButton*).value.x
    end

    def x=(value : Float64)
      to_unsafe.as(LibGdk::EventButton*).value.x = Float64.new(value)
    end

    def y
      to_unsafe.as(LibGdk::EventButton*).value.y
    end

    def y=(value : Float64)
      to_unsafe.as(LibGdk::EventButton*).value.y = Float64.new(value)
    end

    def axes
      to_unsafe.as(LibGdk::EventButton*).value.axes
    end

    def axes=(value : Float64)
      to_unsafe.as(LibGdk::EventButton*).value.axes = value
    end

    def state
      Gdk::ModifierType.new(to_unsafe.as(LibGdk::EventButton*).value.state)
    end

    def state=(value : Gdk::ModifierType)
      to_unsafe.as(LibGdk::EventButton*).value.state = value
    end

    def button
      to_unsafe.as(LibGdk::EventButton*).value.button
    end

    def button=(value : UInt32)
      to_unsafe.as(LibGdk::EventButton*).value.button = UInt32.new(value)
    end

    def device
      Gdk::Device.new(to_unsafe.as(LibGdk::EventButton*).value.device)
    end

    def device=(value : Gdk::Device)
      to_unsafe.as(LibGdk::EventButton*).value.device = value.to_unsafe_device
    end

    def x_root
      to_unsafe.as(LibGdk::EventButton*).value.x_root
    end

    def x_root=(value : Float64)
      to_unsafe.as(LibGdk::EventButton*).value.x_root = Float64.new(value)
    end

    def y_root
      to_unsafe.as(LibGdk::EventButton*).value.y_root
    end

    def y_root=(value : Float64)
      to_unsafe.as(LibGdk::EventButton*).value.y_root = Float64.new(value)
    end
  end

  class EventConfigure
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, x : Int32? = nil, y : Int32? = nil, width : Int32? = nil, height : Int32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(40u64, 0u8).as(LibGdk::EventConfigure*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.x = x unless x.nil?
      __var0.y = y unless y.nil?
      __var0.width = width unless width.nil?
      __var0.height = height unless height.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventConfigure*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventConfigure*)
    end

    def to_unsafe_eventconfigure
      @pointer.not_nil!.as(LibGdk::EventConfigure*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventConfigure*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventConfigure*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventConfigure*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventConfigure*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventConfigure*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventConfigure*).value.send_event = Int8.new(value)
    end

    def x
      to_unsafe.as(LibGdk::EventConfigure*).value.x
    end

    def x=(value : Int32)
      to_unsafe.as(LibGdk::EventConfigure*).value.x = Int32.new(value)
    end

    def y
      to_unsafe.as(LibGdk::EventConfigure*).value.y
    end

    def y=(value : Int32)
      to_unsafe.as(LibGdk::EventConfigure*).value.y = Int32.new(value)
    end

    def width
      to_unsafe.as(LibGdk::EventConfigure*).value.width
    end

    def width=(value : Int32)
      to_unsafe.as(LibGdk::EventConfigure*).value.width = Int32.new(value)
    end

    def height
      to_unsafe.as(LibGdk::EventConfigure*).value.height
    end

    def height=(value : Int32)
      to_unsafe.as(LibGdk::EventConfigure*).value.height = Int32.new(value)
    end
  end

  class EventCrossing
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, subwindow : Gdk::Window? = nil, time : UInt32? = nil, x : Float64? = nil, y : Float64? = nil, x_root : Float64? = nil, y_root : Float64? = nil, mode : Gdk::CrossingMode? = nil, detail : Gdk::NotifyType? = nil, focus : ::Bool? = nil, state : Gdk::ModifierType? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(88u64, 0u8).as(LibGdk::EventCrossing*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.subwindow = subwindow unless subwindow.nil?
      __var0.time = time unless time.nil?
      __var0.x = x unless x.nil?
      __var0.y = y unless y.nil?
      __var0.x_root = x_root unless x_root.nil?
      __var0.y_root = y_root unless y_root.nil?
      __var0.mode = mode unless mode.nil?
      __var0.detail = detail unless detail.nil?
      __var0.focus = focus unless focus.nil?
      __var0.state = state unless state.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventCrossing*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventCrossing*)
    end

    def to_unsafe_eventcrossing
      @pointer.not_nil!.as(LibGdk::EventCrossing*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventCrossing*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventCrossing*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventCrossing*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventCrossing*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventCrossing*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventCrossing*).value.send_event = Int8.new(value)
    end

    def subwindow
      Gdk::Window.new(to_unsafe.as(LibGdk::EventCrossing*).value.subwindow)
    end

    def subwindow=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventCrossing*).value.subwindow = value.to_unsafe_window
    end

    def time
      to_unsafe.as(LibGdk::EventCrossing*).value.time
    end

    def time=(value : UInt32)
      to_unsafe.as(LibGdk::EventCrossing*).value.time = UInt32.new(value)
    end

    def x
      to_unsafe.as(LibGdk::EventCrossing*).value.x
    end

    def x=(value : Float64)
      to_unsafe.as(LibGdk::EventCrossing*).value.x = Float64.new(value)
    end

    def y
      to_unsafe.as(LibGdk::EventCrossing*).value.y
    end

    def y=(value : Float64)
      to_unsafe.as(LibGdk::EventCrossing*).value.y = Float64.new(value)
    end

    def x_root
      to_unsafe.as(LibGdk::EventCrossing*).value.x_root
    end

    def x_root=(value : Float64)
      to_unsafe.as(LibGdk::EventCrossing*).value.x_root = Float64.new(value)
    end

    def y_root
      to_unsafe.as(LibGdk::EventCrossing*).value.y_root
    end

    def y_root=(value : Float64)
      to_unsafe.as(LibGdk::EventCrossing*).value.y_root = Float64.new(value)
    end

    def mode
      Gdk::CrossingMode.new(to_unsafe.as(LibGdk::EventCrossing*).value.mode)
    end

    def mode=(value : Gdk::CrossingMode)
      to_unsafe.as(LibGdk::EventCrossing*).value.mode = value
    end

    def detail
      Gdk::NotifyType.new(to_unsafe.as(LibGdk::EventCrossing*).value.detail)
    end

    def detail=(value : Gdk::NotifyType)
      to_unsafe.as(LibGdk::EventCrossing*).value.detail = value
    end

    def focus
      (to_unsafe.as(LibGdk::EventCrossing*).value.focus == 1)
    end

    def focus=(value : ::Bool)
      to_unsafe.as(LibGdk::EventCrossing*).value.focus = LibC::Int.new(value ? 1 : 0)
    end

    def state
      Gdk::ModifierType.new(to_unsafe.as(LibGdk::EventCrossing*).value.state)
    end

    def state=(value : Gdk::ModifierType)
      to_unsafe.as(LibGdk::EventCrossing*).value.state = value
    end
  end

  class EventDND
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, context : Gdk::DragContext? = nil, time : UInt32? = nil, x_root : Int16? = nil, y_root : Int16? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(40u64, 0u8).as(LibGdk::EventDND*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.context = context unless context.nil?
      __var0.time = time unless time.nil?
      __var0.x_root = x_root unless x_root.nil?
      __var0.y_root = y_root unless y_root.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventDND*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventDND*)
    end

    def to_unsafe_eventdnd
      @pointer.not_nil!.as(LibGdk::EventDND*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventDND*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventDND*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventDND*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventDND*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventDND*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventDND*).value.send_event = Int8.new(value)
    end

    def context
      Gdk::DragContext.new(to_unsafe.as(LibGdk::EventDND*).value.context)
    end

    def context=(value : Gdk::DragContext)
      to_unsafe.as(LibGdk::EventDND*).value.context = value.to_unsafe_dragcontext
    end

    def time
      to_unsafe.as(LibGdk::EventDND*).value.time
    end

    def time=(value : UInt32)
      to_unsafe.as(LibGdk::EventDND*).value.time = UInt32.new(value)
    end

    def x_root
      to_unsafe.as(LibGdk::EventDND*).value.x_root
    end

    def x_root=(value : Int16)
      to_unsafe.as(LibGdk::EventDND*).value.x_root = Int16.new(value)
    end

    def y_root
      to_unsafe.as(LibGdk::EventDND*).value.y_root
    end

    def y_root=(value : Int16)
      to_unsafe.as(LibGdk::EventDND*).value.y_root = Int16.new(value)
    end
  end

  class EventExpose
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, area : Gdk::Rectangle? = nil, region : Cairo::Region? = nil, count : Int32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(56u64, 0u8).as(LibGdk::EventExpose*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.area = area unless area.nil?
      __var0.region = region unless region.nil?
      __var0.count = count unless count.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventExpose*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventExpose*)
    end

    def to_unsafe_eventexpose
      @pointer.not_nil!.as(LibGdk::EventExpose*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventExpose*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventExpose*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventExpose*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventExpose*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventExpose*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventExpose*).value.send_event = Int8.new(value)
    end

    def area
      Gdk::Rectangle.new(to_unsafe.as(LibGdk::EventExpose*).value.area)
    end

    def area=(value : Gdk::Rectangle)
      to_unsafe.as(LibGdk::EventExpose*).value.area = value
    end

    def region
      Cairo::Region.new(to_unsafe.as(LibGdk::EventExpose*).value.region)
    end

    def region=(value : Cairo::Region)
      to_unsafe.as(LibGdk::EventExpose*).value.region = value.to_unsafe.as(LibCairo::Region*)
    end

    def count
      to_unsafe.as(LibGdk::EventExpose*).value.count
    end

    def count=(value : Int32)
      to_unsafe.as(LibGdk::EventExpose*).value.count = Int32.new(value)
    end
  end

  class EventFocus
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, in _in : Int16? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGdk::EventFocus*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.in = _in unless _in.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventFocus*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventFocus*)
    end

    def to_unsafe_eventfocus
      @pointer.not_nil!.as(LibGdk::EventFocus*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventFocus*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventFocus*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventFocus*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventFocus*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventFocus*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventFocus*).value.send_event = Int8.new(value)
    end

    def in
      to_unsafe.as(LibGdk::EventFocus*).value._in
    end

    def in=(value : Int16)
      to_unsafe.as(LibGdk::EventFocus*).value._in = Int16.new(value)
    end
  end

  alias EventFunc = LibGdk::EventFunc

  class EventGrabBroken
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, keyboard : ::Bool? = nil, implicit : ::Bool? = nil, grab_window : Gdk::Window? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(40u64, 0u8).as(LibGdk::EventGrabBroken*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.keyboard = keyboard unless keyboard.nil?
      __var0.implicit = implicit unless implicit.nil?
      __var0.grab_window = grab_window unless grab_window.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventGrabBroken*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventGrabBroken*)
    end

    def to_unsafe_eventgrabbroken
      @pointer.not_nil!.as(LibGdk::EventGrabBroken*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventGrabBroken*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventGrabBroken*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventGrabBroken*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventGrabBroken*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventGrabBroken*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventGrabBroken*).value.send_event = Int8.new(value)
    end

    def keyboard
      (to_unsafe.as(LibGdk::EventGrabBroken*).value.keyboard == 1)
    end

    def keyboard=(value : ::Bool)
      to_unsafe.as(LibGdk::EventGrabBroken*).value.keyboard = LibC::Int.new(value ? 1 : 0)
    end

    def implicit
      (to_unsafe.as(LibGdk::EventGrabBroken*).value.implicit == 1)
    end

    def implicit=(value : ::Bool)
      to_unsafe.as(LibGdk::EventGrabBroken*).value.implicit = LibC::Int.new(value ? 1 : 0)
    end

    def grab_window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventGrabBroken*).value.grab_window)
    end

    def grab_window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventGrabBroken*).value.grab_window = value.to_unsafe_window
    end
  end

  class EventKey
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, time : UInt32? = nil, state : Gdk::ModifierType? = nil, keyval : UInt32? = nil, length : Int32? = nil, string : ::String? = nil, hardware_keycode : UInt16? = nil, group : UInt8? = nil, is_modifier : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(56u64, 0u8).as(LibGdk::EventKey*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.time = time unless time.nil?
      __var0.state = state unless state.nil?
      __var0.keyval = keyval unless keyval.nil?
      __var0.length = length unless length.nil?
      __var0.string = string unless string.nil?
      __var0.hardware_keycode = hardware_keycode unless hardware_keycode.nil?
      __var0.group = group unless group.nil?
      __var0.is_modifier = is_modifier unless is_modifier.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventKey*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventKey*)
    end

    def to_unsafe_eventkey
      @pointer.not_nil!.as(LibGdk::EventKey*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventKey*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventKey*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventKey*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventKey*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventKey*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventKey*).value.send_event = Int8.new(value)
    end

    def time
      to_unsafe.as(LibGdk::EventKey*).value.time
    end

    def time=(value : UInt32)
      to_unsafe.as(LibGdk::EventKey*).value.time = UInt32.new(value)
    end

    def state
      Gdk::ModifierType.new(to_unsafe.as(LibGdk::EventKey*).value.state)
    end

    def state=(value : Gdk::ModifierType)
      to_unsafe.as(LibGdk::EventKey*).value.state = value
    end

    def keyval
      to_unsafe.as(LibGdk::EventKey*).value.keyval
    end

    def keyval=(value : UInt32)
      to_unsafe.as(LibGdk::EventKey*).value.keyval = UInt32.new(value)
    end

    def length
      to_unsafe.as(LibGdk::EventKey*).value.length
    end

    def length=(value : Int32)
      to_unsafe.as(LibGdk::EventKey*).value.length = Int32.new(value)
    end

    def string
      ::String.new(to_unsafe.as(LibGdk::EventKey*).value.string)
    end

    def string=(value : ::String)
      to_unsafe.as(LibGdk::EventKey*).value.string = value.to_unsafe
    end

    def hardware_keycode
      to_unsafe.as(LibGdk::EventKey*).value.hardware_keycode
    end

    def hardware_keycode=(value : UInt16)
      to_unsafe.as(LibGdk::EventKey*).value.hardware_keycode = UInt16.new(value)
    end

    def group
      to_unsafe.as(LibGdk::EventKey*).value.group
    end

    def group=(value : UInt8)
      to_unsafe.as(LibGdk::EventKey*).value.group = UInt8.new(value)
    end

    def is_modifier
      to_unsafe.as(LibGdk::EventKey*).value.is_modifier
    end

    def is_modifier=(value : UInt32)
      to_unsafe.as(LibGdk::EventKey*).value.is_modifier = UInt32.new(value)
    end
  end

  @[Flags]
  enum EventMask : UInt32
    ZERO_NONE                =        0
    EXPOSURE_MASK            =        2
    POINTER_MOTION_MASK      =        4
    POINTER_MOTION_HINT_MASK =        8
    BUTTON_MOTION_MASK       =       16
    BUTTON1_MOTION_MASK      =       32
    BUTTON2_MOTION_MASK      =       64
    BUTTON3_MOTION_MASK      =      128
    BUTTON_PRESS_MASK        =      256
    BUTTON_RELEASE_MASK      =      512
    KEY_PRESS_MASK           =     1024
    KEY_RELEASE_MASK         =     2048
    ENTER_NOTIFY_MASK        =     4096
    LEAVE_NOTIFY_MASK        =     8192
    FOCUS_CHANGE_MASK        =    16384
    STRUCTURE_MASK           =    32768
    PROPERTY_CHANGE_MASK     =    65536
    VISIBILITY_NOTIFY_MASK   =   131072
    PROXIMITY_IN_MASK        =   262144
    PROXIMITY_OUT_MASK       =   524288
    SUBSTRUCTURE_MASK        =  1048576
    SCROLL_MASK              =  2097152
    TOUCH_MASK               =  4194304
    SMOOTH_SCROLL_MASK       =  8388608
    TOUCHPAD_GESTURE_MASK    = 16777216
    TABLET_PAD_MASK          = 33554432
    ALL_EVENTS_MASK          = 67108862
  end

  class EventMotion
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, time : UInt32? = nil, x : Float64? = nil, y : Float64? = nil, axes : Float64? = nil, state : Gdk::ModifierType? = nil, is_hint : Int16? = nil, device : Gdk::Device? = nil, x_root : Float64? = nil, y_root : Float64? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(80u64, 0u8).as(LibGdk::EventMotion*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.time = time unless time.nil?
      __var0.x = x unless x.nil?
      __var0.y = y unless y.nil?
      __var0.axes = axes unless axes.nil?
      __var0.state = state unless state.nil?
      __var0.is_hint = is_hint unless is_hint.nil?
      __var0.device = device unless device.nil?
      __var0.x_root = x_root unless x_root.nil?
      __var0.y_root = y_root unless y_root.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventMotion*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventMotion*)
    end

    def to_unsafe_eventmotion
      @pointer.not_nil!.as(LibGdk::EventMotion*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventMotion*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventMotion*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventMotion*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventMotion*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventMotion*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventMotion*).value.send_event = Int8.new(value)
    end

    def time
      to_unsafe.as(LibGdk::EventMotion*).value.time
    end

    def time=(value : UInt32)
      to_unsafe.as(LibGdk::EventMotion*).value.time = UInt32.new(value)
    end

    def x
      to_unsafe.as(LibGdk::EventMotion*).value.x
    end

    def x=(value : Float64)
      to_unsafe.as(LibGdk::EventMotion*).value.x = Float64.new(value)
    end

    def y
      to_unsafe.as(LibGdk::EventMotion*).value.y
    end

    def y=(value : Float64)
      to_unsafe.as(LibGdk::EventMotion*).value.y = Float64.new(value)
    end

    def axes
      to_unsafe.as(LibGdk::EventMotion*).value.axes
    end

    def axes=(value : Float64)
      to_unsafe.as(LibGdk::EventMotion*).value.axes = value
    end

    def state
      Gdk::ModifierType.new(to_unsafe.as(LibGdk::EventMotion*).value.state)
    end

    def state=(value : Gdk::ModifierType)
      to_unsafe.as(LibGdk::EventMotion*).value.state = value
    end

    def is_hint
      to_unsafe.as(LibGdk::EventMotion*).value.is_hint
    end

    def is_hint=(value : Int16)
      to_unsafe.as(LibGdk::EventMotion*).value.is_hint = Int16.new(value)
    end

    def device
      Gdk::Device.new(to_unsafe.as(LibGdk::EventMotion*).value.device)
    end

    def device=(value : Gdk::Device)
      to_unsafe.as(LibGdk::EventMotion*).value.device = value.to_unsafe_device
    end

    def x_root
      to_unsafe.as(LibGdk::EventMotion*).value.x_root
    end

    def x_root=(value : Float64)
      to_unsafe.as(LibGdk::EventMotion*).value.x_root = Float64.new(value)
    end

    def y_root
      to_unsafe.as(LibGdk::EventMotion*).value.y_root
    end

    def y_root=(value : Float64)
      to_unsafe.as(LibGdk::EventMotion*).value.y_root = Float64.new(value)
    end
  end

  class EventOwnerChange
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, owner : Gdk::Window? = nil, reason : Gdk::OwnerChange? = nil, selection : Gdk::Atom? = nil, time : UInt32? = nil, selection_time : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(56u64, 0u8).as(LibGdk::EventOwnerChange*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.owner = owner unless owner.nil?
      __var0.reason = reason unless reason.nil?
      __var0.selection = selection unless selection.nil?
      __var0.time = time unless time.nil?
      __var0.selection_time = selection_time unless selection_time.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventOwnerChange*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventOwnerChange*)
    end

    def to_unsafe_eventownerchange
      @pointer.not_nil!.as(LibGdk::EventOwnerChange*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventOwnerChange*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventOwnerChange*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventOwnerChange*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventOwnerChange*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventOwnerChange*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventOwnerChange*).value.send_event = Int8.new(value)
    end

    def owner
      Gdk::Window.new(to_unsafe.as(LibGdk::EventOwnerChange*).value.owner)
    end

    def owner=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventOwnerChange*).value.owner = value.to_unsafe_window
    end

    def reason
      Gdk::OwnerChange.new(to_unsafe.as(LibGdk::EventOwnerChange*).value.reason)
    end

    def reason=(value : Gdk::OwnerChange)
      to_unsafe.as(LibGdk::EventOwnerChange*).value.reason = value
    end

    def selection
      Gdk::Atom.new(to_unsafe.as(LibGdk::EventOwnerChange*).value.selection)
    end

    def selection=(value : Gdk::Atom)
      to_unsafe.as(LibGdk::EventOwnerChange*).value.selection = value.to_unsafe.as(LibGdk::Atom*)
    end

    def time
      to_unsafe.as(LibGdk::EventOwnerChange*).value.time
    end

    def time=(value : UInt32)
      to_unsafe.as(LibGdk::EventOwnerChange*).value.time = UInt32.new(value)
    end

    def selection_time
      to_unsafe.as(LibGdk::EventOwnerChange*).value.selection_time
    end

    def selection_time=(value : UInt32)
      to_unsafe.as(LibGdk::EventOwnerChange*).value.selection_time = UInt32.new(value)
    end
  end

  class EventPadAxis
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, time : UInt32? = nil, group : UInt32? = nil, index : UInt32? = nil, mode : UInt32? = nil, value : Float64? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(48u64, 0u8).as(LibGdk::EventPadAxis*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.time = time unless time.nil?
      __var0.group = group unless group.nil?
      __var0.index = index unless index.nil?
      __var0.mode = mode unless mode.nil?
      __var0.value = value unless value.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventPadAxis*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventPadAxis*)
    end

    def to_unsafe_eventpadaxis
      @pointer.not_nil!.as(LibGdk::EventPadAxis*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventPadAxis*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventPadAxis*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventPadAxis*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventPadAxis*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventPadAxis*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventPadAxis*).value.send_event = Int8.new(value)
    end

    def time
      to_unsafe.as(LibGdk::EventPadAxis*).value.time
    end

    def time=(value : UInt32)
      to_unsafe.as(LibGdk::EventPadAxis*).value.time = UInt32.new(value)
    end

    def group
      to_unsafe.as(LibGdk::EventPadAxis*).value.group
    end

    def group=(value : UInt32)
      to_unsafe.as(LibGdk::EventPadAxis*).value.group = UInt32.new(value)
    end

    def index
      to_unsafe.as(LibGdk::EventPadAxis*).value.index
    end

    def index=(value : UInt32)
      to_unsafe.as(LibGdk::EventPadAxis*).value.index = UInt32.new(value)
    end

    def mode
      to_unsafe.as(LibGdk::EventPadAxis*).value.mode
    end

    def mode=(value : UInt32)
      to_unsafe.as(LibGdk::EventPadAxis*).value.mode = UInt32.new(value)
    end

    def value
      to_unsafe.as(LibGdk::EventPadAxis*).value.value
    end

    def value=(value : Float64)
      to_unsafe.as(LibGdk::EventPadAxis*).value.value = Float64.new(value)
    end
  end

  class EventPadButton
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, time : UInt32? = nil, group : UInt32? = nil, button : UInt32? = nil, mode : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(40u64, 0u8).as(LibGdk::EventPadButton*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.time = time unless time.nil?
      __var0.group = group unless group.nil?
      __var0.button = button unless button.nil?
      __var0.mode = mode unless mode.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventPadButton*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventPadButton*)
    end

    def to_unsafe_eventpadbutton
      @pointer.not_nil!.as(LibGdk::EventPadButton*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventPadButton*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventPadButton*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventPadButton*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventPadButton*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventPadButton*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventPadButton*).value.send_event = Int8.new(value)
    end

    def time
      to_unsafe.as(LibGdk::EventPadButton*).value.time
    end

    def time=(value : UInt32)
      to_unsafe.as(LibGdk::EventPadButton*).value.time = UInt32.new(value)
    end

    def group
      to_unsafe.as(LibGdk::EventPadButton*).value.group
    end

    def group=(value : UInt32)
      to_unsafe.as(LibGdk::EventPadButton*).value.group = UInt32.new(value)
    end

    def button
      to_unsafe.as(LibGdk::EventPadButton*).value.button
    end

    def button=(value : UInt32)
      to_unsafe.as(LibGdk::EventPadButton*).value.button = UInt32.new(value)
    end

    def mode
      to_unsafe.as(LibGdk::EventPadButton*).value.mode
    end

    def mode=(value : UInt32)
      to_unsafe.as(LibGdk::EventPadButton*).value.mode = UInt32.new(value)
    end
  end

  class EventPadGroupMode
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, time : UInt32? = nil, group : UInt32? = nil, mode : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(32u64, 0u8).as(LibGdk::EventPadGroupMode*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.time = time unless time.nil?
      __var0.group = group unless group.nil?
      __var0.mode = mode unless mode.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventPadGroupMode*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventPadGroupMode*)
    end

    def to_unsafe_eventpadgroupmode
      @pointer.not_nil!.as(LibGdk::EventPadGroupMode*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventPadGroupMode*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventPadGroupMode*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventPadGroupMode*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventPadGroupMode*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventPadGroupMode*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventPadGroupMode*).value.send_event = Int8.new(value)
    end

    def time
      to_unsafe.as(LibGdk::EventPadGroupMode*).value.time
    end

    def time=(value : UInt32)
      to_unsafe.as(LibGdk::EventPadGroupMode*).value.time = UInt32.new(value)
    end

    def group
      to_unsafe.as(LibGdk::EventPadGroupMode*).value.group
    end

    def group=(value : UInt32)
      to_unsafe.as(LibGdk::EventPadGroupMode*).value.group = UInt32.new(value)
    end

    def mode
      to_unsafe.as(LibGdk::EventPadGroupMode*).value.mode
    end

    def mode=(value : UInt32)
      to_unsafe.as(LibGdk::EventPadGroupMode*).value.mode = UInt32.new(value)
    end
  end

  class EventProperty
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, atom : Gdk::Atom? = nil, time : UInt32? = nil, state : Gdk::PropertyState? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(40u64, 0u8).as(LibGdk::EventProperty*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.atom = atom unless atom.nil?
      __var0.time = time unless time.nil?
      __var0.state = state unless state.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventProperty*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventProperty*)
    end

    def to_unsafe_eventproperty
      @pointer.not_nil!.as(LibGdk::EventProperty*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventProperty*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventProperty*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventProperty*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventProperty*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventProperty*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventProperty*).value.send_event = Int8.new(value)
    end

    def atom
      Gdk::Atom.new(to_unsafe.as(LibGdk::EventProperty*).value.atom)
    end

    def atom=(value : Gdk::Atom)
      to_unsafe.as(LibGdk::EventProperty*).value.atom = value.to_unsafe.as(LibGdk::Atom*)
    end

    def time
      to_unsafe.as(LibGdk::EventProperty*).value.time
    end

    def time=(value : UInt32)
      to_unsafe.as(LibGdk::EventProperty*).value.time = UInt32.new(value)
    end

    def state
      Gdk::PropertyState.new(to_unsafe.as(LibGdk::EventProperty*).value.state)
    end

    def state=(value : Gdk::PropertyState)
      to_unsafe.as(LibGdk::EventProperty*).value.state = value
    end
  end

  class EventProximity
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, time : UInt32? = nil, device : Gdk::Device? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(32u64, 0u8).as(LibGdk::EventProximity*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.time = time unless time.nil?
      __var0.device = device unless device.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventProximity*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventProximity*)
    end

    def to_unsafe_eventproximity
      @pointer.not_nil!.as(LibGdk::EventProximity*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventProximity*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventProximity*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventProximity*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventProximity*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventProximity*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventProximity*).value.send_event = Int8.new(value)
    end

    def time
      to_unsafe.as(LibGdk::EventProximity*).value.time
    end

    def time=(value : UInt32)
      to_unsafe.as(LibGdk::EventProximity*).value.time = UInt32.new(value)
    end

    def device
      Gdk::Device.new(to_unsafe.as(LibGdk::EventProximity*).value.device)
    end

    def device=(value : Gdk::Device)
      to_unsafe.as(LibGdk::EventProximity*).value.device = value.to_unsafe_device
    end
  end

  class EventScroll
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, time : UInt32? = nil, x : Float64? = nil, y : Float64? = nil, state : Gdk::ModifierType? = nil, direction : Gdk::ScrollDirection? = nil, device : Gdk::Device? = nil, x_root : Float64? = nil, y_root : Float64? = nil, delta_x : Float64? = nil, delta_y : Float64? = nil, is_stop : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(96u64, 0u8).as(LibGdk::EventScroll*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.time = time unless time.nil?
      __var0.x = x unless x.nil?
      __var0.y = y unless y.nil?
      __var0.state = state unless state.nil?
      __var0.direction = direction unless direction.nil?
      __var0.device = device unless device.nil?
      __var0.x_root = x_root unless x_root.nil?
      __var0.y_root = y_root unless y_root.nil?
      __var0.delta_x = delta_x unless delta_x.nil?
      __var0.delta_y = delta_y unless delta_y.nil?
      __var0.is_stop = is_stop unless is_stop.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventScroll*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventScroll*)
    end

    def to_unsafe_eventscroll
      @pointer.not_nil!.as(LibGdk::EventScroll*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventScroll*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventScroll*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventScroll*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventScroll*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventScroll*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventScroll*).value.send_event = Int8.new(value)
    end

    def time
      to_unsafe.as(LibGdk::EventScroll*).value.time
    end

    def time=(value : UInt32)
      to_unsafe.as(LibGdk::EventScroll*).value.time = UInt32.new(value)
    end

    def x
      to_unsafe.as(LibGdk::EventScroll*).value.x
    end

    def x=(value : Float64)
      to_unsafe.as(LibGdk::EventScroll*).value.x = Float64.new(value)
    end

    def y
      to_unsafe.as(LibGdk::EventScroll*).value.y
    end

    def y=(value : Float64)
      to_unsafe.as(LibGdk::EventScroll*).value.y = Float64.new(value)
    end

    def state
      Gdk::ModifierType.new(to_unsafe.as(LibGdk::EventScroll*).value.state)
    end

    def state=(value : Gdk::ModifierType)
      to_unsafe.as(LibGdk::EventScroll*).value.state = value
    end

    def direction
      Gdk::ScrollDirection.new(to_unsafe.as(LibGdk::EventScroll*).value.direction)
    end

    def direction=(value : Gdk::ScrollDirection)
      to_unsafe.as(LibGdk::EventScroll*).value.direction = value
    end

    def device
      Gdk::Device.new(to_unsafe.as(LibGdk::EventScroll*).value.device)
    end

    def device=(value : Gdk::Device)
      to_unsafe.as(LibGdk::EventScroll*).value.device = value.to_unsafe_device
    end

    def x_root
      to_unsafe.as(LibGdk::EventScroll*).value.x_root
    end

    def x_root=(value : Float64)
      to_unsafe.as(LibGdk::EventScroll*).value.x_root = Float64.new(value)
    end

    def y_root
      to_unsafe.as(LibGdk::EventScroll*).value.y_root
    end

    def y_root=(value : Float64)
      to_unsafe.as(LibGdk::EventScroll*).value.y_root = Float64.new(value)
    end

    def delta_x
      to_unsafe.as(LibGdk::EventScroll*).value.delta_x
    end

    def delta_x=(value : Float64)
      to_unsafe.as(LibGdk::EventScroll*).value.delta_x = Float64.new(value)
    end

    def delta_y
      to_unsafe.as(LibGdk::EventScroll*).value.delta_y
    end

    def delta_y=(value : Float64)
      to_unsafe.as(LibGdk::EventScroll*).value.delta_y = Float64.new(value)
    end

    def is_stop
      to_unsafe.as(LibGdk::EventScroll*).value.is_stop
    end

    def is_stop=(value : UInt32)
      to_unsafe.as(LibGdk::EventScroll*).value.is_stop = UInt32.new(value)
    end
  end

  class EventSelection
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, selection : Gdk::Atom? = nil, target : Gdk::Atom? = nil, property : Gdk::Atom? = nil, time : UInt32? = nil, requestor : Gdk::Window? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(64u64, 0u8).as(LibGdk::EventSelection*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.selection = selection unless selection.nil?
      __var0.target = target unless target.nil?
      __var0.property = property unless property.nil?
      __var0.time = time unless time.nil?
      __var0.requestor = requestor unless requestor.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventSelection*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventSelection*)
    end

    def to_unsafe_eventselection
      @pointer.not_nil!.as(LibGdk::EventSelection*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventSelection*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventSelection*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventSelection*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventSelection*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventSelection*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventSelection*).value.send_event = Int8.new(value)
    end

    def selection
      Gdk::Atom.new(to_unsafe.as(LibGdk::EventSelection*).value.selection)
    end

    def selection=(value : Gdk::Atom)
      to_unsafe.as(LibGdk::EventSelection*).value.selection = value.to_unsafe.as(LibGdk::Atom*)
    end

    def target
      Gdk::Atom.new(to_unsafe.as(LibGdk::EventSelection*).value.target)
    end

    def target=(value : Gdk::Atom)
      to_unsafe.as(LibGdk::EventSelection*).value.target = value.to_unsafe.as(LibGdk::Atom*)
    end

    def property
      Gdk::Atom.new(to_unsafe.as(LibGdk::EventSelection*).value.property)
    end

    def property=(value : Gdk::Atom)
      to_unsafe.as(LibGdk::EventSelection*).value.property = value.to_unsafe.as(LibGdk::Atom*)
    end

    def time
      to_unsafe.as(LibGdk::EventSelection*).value.time
    end

    def time=(value : UInt32)
      to_unsafe.as(LibGdk::EventSelection*).value.time = UInt32.new(value)
    end

    def requestor
      Gdk::Window.new(to_unsafe.as(LibGdk::EventSelection*).value.requestor)
    end

    def requestor=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventSelection*).value.requestor = value.to_unsafe_window
    end
  end

  class EventSequence
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGdk::EventSequence*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventSequence*)
    end

    def to_unsafe_eventsequence
      @pointer.not_nil!.as(LibGdk::EventSequence*)
    end
  end

  class EventSetting
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, action : Gdk::SettingAction? = nil, name : ::String? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(32u64, 0u8).as(LibGdk::EventSetting*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.action = action unless action.nil?
      __var0.name = name unless name.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventSetting*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventSetting*)
    end

    def to_unsafe_eventsetting
      @pointer.not_nil!.as(LibGdk::EventSetting*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventSetting*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventSetting*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventSetting*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventSetting*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventSetting*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventSetting*).value.send_event = Int8.new(value)
    end

    def action
      Gdk::SettingAction.new(to_unsafe.as(LibGdk::EventSetting*).value.action)
    end

    def action=(value : Gdk::SettingAction)
      to_unsafe.as(LibGdk::EventSetting*).value.action = value
    end

    def name
      ::String.new(to_unsafe.as(LibGdk::EventSetting*).value.name)
    end

    def name=(value : ::String)
      to_unsafe.as(LibGdk::EventSetting*).value.name = value.to_unsafe
    end
  end

  class EventTouch
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, time : UInt32? = nil, x : Float64? = nil, y : Float64? = nil, axes : Float64? = nil, state : Gdk::ModifierType? = nil, sequence : Gdk::EventSequence? = nil, emulating_pointer : ::Bool? = nil, device : Gdk::Device? = nil, x_root : Float64? = nil, y_root : Float64? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(96u64, 0u8).as(LibGdk::EventTouch*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.time = time unless time.nil?
      __var0.x = x unless x.nil?
      __var0.y = y unless y.nil?
      __var0.axes = axes unless axes.nil?
      __var0.state = state unless state.nil?
      __var0.sequence = sequence unless sequence.nil?
      __var0.emulating_pointer = emulating_pointer unless emulating_pointer.nil?
      __var0.device = device unless device.nil?
      __var0.x_root = x_root unless x_root.nil?
      __var0.y_root = y_root unless y_root.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventTouch*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventTouch*)
    end

    def to_unsafe_eventtouch
      @pointer.not_nil!.as(LibGdk::EventTouch*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventTouch*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventTouch*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventTouch*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventTouch*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventTouch*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventTouch*).value.send_event = Int8.new(value)
    end

    def time
      to_unsafe.as(LibGdk::EventTouch*).value.time
    end

    def time=(value : UInt32)
      to_unsafe.as(LibGdk::EventTouch*).value.time = UInt32.new(value)
    end

    def x
      to_unsafe.as(LibGdk::EventTouch*).value.x
    end

    def x=(value : Float64)
      to_unsafe.as(LibGdk::EventTouch*).value.x = Float64.new(value)
    end

    def y
      to_unsafe.as(LibGdk::EventTouch*).value.y
    end

    def y=(value : Float64)
      to_unsafe.as(LibGdk::EventTouch*).value.y = Float64.new(value)
    end

    def axes
      to_unsafe.as(LibGdk::EventTouch*).value.axes
    end

    def axes=(value : Float64)
      to_unsafe.as(LibGdk::EventTouch*).value.axes = value
    end

    def state
      Gdk::ModifierType.new(to_unsafe.as(LibGdk::EventTouch*).value.state)
    end

    def state=(value : Gdk::ModifierType)
      to_unsafe.as(LibGdk::EventTouch*).value.state = value
    end

    def sequence
      Gdk::EventSequence.new(to_unsafe.as(LibGdk::EventTouch*).value.sequence)
    end

    def sequence=(value : Gdk::EventSequence)
      to_unsafe.as(LibGdk::EventTouch*).value.sequence = value.to_unsafe.as(LibGdk::EventSequence*)
    end

    def emulating_pointer
      (to_unsafe.as(LibGdk::EventTouch*).value.emulating_pointer == 1)
    end

    def emulating_pointer=(value : ::Bool)
      to_unsafe.as(LibGdk::EventTouch*).value.emulating_pointer = LibC::Int.new(value ? 1 : 0)
    end

    def device
      Gdk::Device.new(to_unsafe.as(LibGdk::EventTouch*).value.device)
    end

    def device=(value : Gdk::Device)
      to_unsafe.as(LibGdk::EventTouch*).value.device = value.to_unsafe_device
    end

    def x_root
      to_unsafe.as(LibGdk::EventTouch*).value.x_root
    end

    def x_root=(value : Float64)
      to_unsafe.as(LibGdk::EventTouch*).value.x_root = Float64.new(value)
    end

    def y_root
      to_unsafe.as(LibGdk::EventTouch*).value.y_root
    end

    def y_root=(value : Float64)
      to_unsafe.as(LibGdk::EventTouch*).value.y_root = Float64.new(value)
    end
  end

  class EventTouchpadPinch
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, phase : Int8? = nil, n_fingers : Int8? = nil, time : UInt32? = nil, x : Float64? = nil, y : Float64? = nil, dx : Float64? = nil, dy : Float64? = nil, angle_delta : Float64? = nil, scale : Float64? = nil, x_root : Float64? = nil, y_root : Float64? = nil, state : Gdk::ModifierType? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(96u64, 0u8).as(LibGdk::EventTouchpadPinch*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.phase = phase unless phase.nil?
      __var0.n_fingers = n_fingers unless n_fingers.nil?
      __var0.time = time unless time.nil?
      __var0.x = x unless x.nil?
      __var0.y = y unless y.nil?
      __var0.dx = dx unless dx.nil?
      __var0.dy = dy unless dy.nil?
      __var0.angle_delta = angle_delta unless angle_delta.nil?
      __var0.scale = scale unless scale.nil?
      __var0.x_root = x_root unless x_root.nil?
      __var0.y_root = y_root unless y_root.nil?
      __var0.state = state unless state.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventTouchpadPinch*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventTouchpadPinch*)
    end

    def to_unsafe_eventtouchpadpinch
      @pointer.not_nil!.as(LibGdk::EventTouchpadPinch*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventTouchpadPinch*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventTouchpadPinch*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.send_event = Int8.new(value)
    end

    def phase
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.phase
    end

    def phase=(value : Int8)
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.phase = Int8.new(value)
    end

    def n_fingers
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.n_fingers
    end

    def n_fingers=(value : Int8)
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.n_fingers = Int8.new(value)
    end

    def time
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.time
    end

    def time=(value : UInt32)
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.time = UInt32.new(value)
    end

    def x
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.x
    end

    def x=(value : Float64)
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.x = Float64.new(value)
    end

    def y
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.y
    end

    def y=(value : Float64)
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.y = Float64.new(value)
    end

    def dx
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.dx
    end

    def dx=(value : Float64)
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.dx = Float64.new(value)
    end

    def dy
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.dy
    end

    def dy=(value : Float64)
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.dy = Float64.new(value)
    end

    def angle_delta
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.angle_delta
    end

    def angle_delta=(value : Float64)
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.angle_delta = Float64.new(value)
    end

    def scale
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.scale
    end

    def scale=(value : Float64)
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.scale = Float64.new(value)
    end

    def x_root
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.x_root
    end

    def x_root=(value : Float64)
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.x_root = Float64.new(value)
    end

    def y_root
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.y_root
    end

    def y_root=(value : Float64)
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.y_root = Float64.new(value)
    end

    def state
      Gdk::ModifierType.new(to_unsafe.as(LibGdk::EventTouchpadPinch*).value.state)
    end

    def state=(value : Gdk::ModifierType)
      to_unsafe.as(LibGdk::EventTouchpadPinch*).value.state = value
    end
  end

  class EventTouchpadSwipe
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, phase : Int8? = nil, n_fingers : Int8? = nil, time : UInt32? = nil, x : Float64? = nil, y : Float64? = nil, dx : Float64? = nil, dy : Float64? = nil, x_root : Float64? = nil, y_root : Float64? = nil, state : Gdk::ModifierType? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(80u64, 0u8).as(LibGdk::EventTouchpadSwipe*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.phase = phase unless phase.nil?
      __var0.n_fingers = n_fingers unless n_fingers.nil?
      __var0.time = time unless time.nil?
      __var0.x = x unless x.nil?
      __var0.y = y unless y.nil?
      __var0.dx = dx unless dx.nil?
      __var0.dy = dy unless dy.nil?
      __var0.x_root = x_root unless x_root.nil?
      __var0.y_root = y_root unless y_root.nil?
      __var0.state = state unless state.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventTouchpadSwipe*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventTouchpadSwipe*)
    end

    def to_unsafe_eventtouchpadswipe
      @pointer.not_nil!.as(LibGdk::EventTouchpadSwipe*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.send_event = Int8.new(value)
    end

    def phase
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.phase
    end

    def phase=(value : Int8)
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.phase = Int8.new(value)
    end

    def n_fingers
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.n_fingers
    end

    def n_fingers=(value : Int8)
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.n_fingers = Int8.new(value)
    end

    def time
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.time
    end

    def time=(value : UInt32)
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.time = UInt32.new(value)
    end

    def x
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.x
    end

    def x=(value : Float64)
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.x = Float64.new(value)
    end

    def y
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.y
    end

    def y=(value : Float64)
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.y = Float64.new(value)
    end

    def dx
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.dx
    end

    def dx=(value : Float64)
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.dx = Float64.new(value)
    end

    def dy
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.dy
    end

    def dy=(value : Float64)
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.dy = Float64.new(value)
    end

    def x_root
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.x_root
    end

    def x_root=(value : Float64)
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.x_root = Float64.new(value)
    end

    def y_root
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.y_root
    end

    def y_root=(value : Float64)
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.y_root = Float64.new(value)
    end

    def state
      Gdk::ModifierType.new(to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.state)
    end

    def state=(value : Gdk::ModifierType)
      to_unsafe.as(LibGdk::EventTouchpadSwipe*).value.state = value
    end
  end

  enum EventType : Int32
    NOTHING       = -1
    DELETE        =  0
    DESTROY       =  1
    EXPOSE        =  2
    MOTION_NOTIFY =  3
    BUTTON_PRESS  =  4
    # 2BUTTON_PRESS = 5
    DOUBLE_BUTTON_PRESS = 5
    # 3BUTTON_PRESS = 6
    TRIPLE_BUTTON_PRESS =  6
    BUTTON_RELEASE      =  7
    KEY_PRESS           =  8
    KEY_RELEASE         =  9
    ENTER_NOTIFY        = 10
    LEAVE_NOTIFY        = 11
    FOCUS_CHANGE        = 12
    CONFIGURE           = 13
    MAP                 = 14
    UNMAP               = 15
    PROPERTY_NOTIFY     = 16
    SELECTION_CLEAR     = 17
    SELECTION_REQUEST   = 18
    SELECTION_NOTIFY    = 19
    PROXIMITY_IN        = 20
    PROXIMITY_OUT       = 21
    DRAG_ENTER          = 22
    DRAG_LEAVE          = 23
    DRAG_MOTION         = 24
    DRAG_STATUS         = 25
    DROP_START          = 26
    DROP_FINISHED       = 27
    CLIENT_EVENT        = 28
    VISIBILITY_NOTIFY   = 29
    SCROLL              = 31
    WINDOW_STATE        = 32
    SETTING             = 33
    OWNER_CHANGE        = 34
    GRAB_BROKEN         = 35
    DAMAGE              = 36
    TOUCH_BEGIN         = 37
    TOUCH_UPDATE        = 38
    TOUCH_END           = 39
    TOUCH_CANCEL        = 40
    TOUCHPAD_SWIPE      = 41
    TOUCHPAD_PINCH      = 42
    PAD_BUTTON_PRESS    = 43
    PAD_BUTTON_RELEASE  = 44
    PAD_RING            = 45
    PAD_STRIP           = 46
    PAD_GROUP_MODE      = 47
    EVENT_LAST          = 48
  end

  class EventVisibility
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, state : Gdk::VisibilityState? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGdk::EventVisibility*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.state = state unless state.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventVisibility*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventVisibility*)
    end

    def to_unsafe_eventvisibility
      @pointer.not_nil!.as(LibGdk::EventVisibility*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventVisibility*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventVisibility*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventVisibility*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventVisibility*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventVisibility*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventVisibility*).value.send_event = Int8.new(value)
    end

    def state
      Gdk::VisibilityState.new(to_unsafe.as(LibGdk::EventVisibility*).value.state)
    end

    def state=(value : Gdk::VisibilityState)
      to_unsafe.as(LibGdk::EventVisibility*).value.state = value
    end
  end

  class EventWindowState
    include GObject::WrappedType

    def self.new(type : Gdk::EventType? = nil, window : Gdk::Window? = nil, send_event : Int8? = nil, changed_mask : Gdk::WindowState? = nil, new_window_state : Gdk::WindowState? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(32u64, 0u8).as(LibGdk::EventWindowState*))
      __var0.type = type unless type.nil?
      __var0.window = window unless window.nil?
      __var0.send_event = send_event unless send_event.nil?
      __var0.changed_mask = changed_mask unless changed_mask.nil?
      __var0.new_window_state = new_window_state unless new_window_state.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::EventWindowState*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::EventWindowState*)
    end

    def to_unsafe_eventwindowstate
      @pointer.not_nil!.as(LibGdk::EventWindowState*)
    end

    def type
      Gdk::EventType.new(to_unsafe.as(LibGdk::EventWindowState*).value.type)
    end

    def type=(value : Gdk::EventType)
      to_unsafe.as(LibGdk::EventWindowState*).value.type = value
    end

    def window
      Gdk::Window.new(to_unsafe.as(LibGdk::EventWindowState*).value.window)
    end

    def window=(value : Gdk::Window)
      to_unsafe.as(LibGdk::EventWindowState*).value.window = value.to_unsafe_window
    end

    def send_event
      to_unsafe.as(LibGdk::EventWindowState*).value.send_event
    end

    def send_event=(value : Int8)
      to_unsafe.as(LibGdk::EventWindowState*).value.send_event = Int8.new(value)
    end

    def changed_mask
      Gdk::WindowState.new(to_unsafe.as(LibGdk::EventWindowState*).value.changed_mask)
    end

    def changed_mask=(value : Gdk::WindowState)
      to_unsafe.as(LibGdk::EventWindowState*).value.changed_mask = value
    end

    def new_window_state
      Gdk::WindowState.new(to_unsafe.as(LibGdk::EventWindowState*).value.new_window_state)
    end

    def new_window_state=(value : Gdk::WindowState)
      to_unsafe.as(LibGdk::EventWindowState*).value.new_window_state = value
    end
  end

  alias FilterFunc = LibGdk::FilterFunc

  enum FilterReturn : UInt32
    CONTINUE  = 0
    TRANSLATE = 1
    REMOVE    = 2
  end

  class FrameClock < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdk::FrameClock*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkFrameClock")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdk._gdk_frame_clock_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::FrameClock*)
    end

    def to_unsafe_frameclock
      @pointer.not_nil!.as(LibGdk::FrameClock*)
    end

    def begin_updating
      LibGdk.frame_clock_begin_updating(@pointer.as(LibGdk::FrameClock*))
      nil
    end

    def end_updating
      LibGdk.frame_clock_end_updating(@pointer.as(LibGdk::FrameClock*))
      nil
    end

    def current_timings
      __var0 = LibGdk.frame_clock_get_current_timings(@pointer.as(LibGdk::FrameClock*))
      __var1 = Gdk::FrameTimings.new(__var0) if __var0
      __var1
    end

    def frame_counter
      __var0 = LibGdk.frame_clock_get_frame_counter(@pointer.as(LibGdk::FrameClock*))
      __var0
    end

    def frame_time
      __var0 = LibGdk.frame_clock_get_frame_time(@pointer.as(LibGdk::FrameClock*))
      __var0
    end

    def history_start
      __var0 = LibGdk.frame_clock_get_history_start(@pointer.as(LibGdk::FrameClock*))
      __var0
    end

    def refresh_info(base_time : ::Int)
      LibGdk.frame_clock_get_refresh_info(@pointer.as(LibGdk::FrameClock*), Int64.new(base_time), out refresh_interval_return, out presentation_time_return)
      {refresh_interval_return, presentation_time_return}
    end

    def timings(frame_counter : ::Int)
      __var0 = LibGdk.frame_clock_get_timings(@pointer.as(LibGdk::FrameClock*), Int64.new(frame_counter))
      __var1 = Gdk::FrameTimings.new(__var0) if __var0
      __var1
    end

    def request_phase(phase : Gdk::FrameClockPhase)
      LibGdk.frame_clock_request_phase(@pointer.as(LibGdk::FrameClock*), phase)
      nil
    end

    alias AfterPaintSignal = FrameClock -> Nil

    def on_after_paint(*, after = false, &block : AfterPaintSignal)
      __var0 = ->(arg0 : LibGdk::FrameClock*, box : Void*) {
        ::Box(AfterPaintSignal).unbox(box).call(FrameClock.new(arg0))
      }

      __var1 = ::Box.box(AfterPaintSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "after-paint", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_after_paint(&block : AfterPaintSignal)
      on_after_paint(after: true, &block)
    end

    alias BeforePaintSignal = FrameClock -> Nil

    def on_before_paint(*, after = false, &block : BeforePaintSignal)
      __var0 = ->(arg0 : LibGdk::FrameClock*, box : Void*) {
        ::Box(BeforePaintSignal).unbox(box).call(FrameClock.new(arg0))
      }

      __var1 = ::Box.box(BeforePaintSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "before-paint", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_before_paint(&block : BeforePaintSignal)
      on_before_paint(after: true, &block)
    end

    alias FlushEventsSignal = FrameClock -> Nil

    def on_flush_events(*, after = false, &block : FlushEventsSignal)
      __var0 = ->(arg0 : LibGdk::FrameClock*, box : Void*) {
        ::Box(FlushEventsSignal).unbox(box).call(FrameClock.new(arg0))
      }

      __var1 = ::Box.box(FlushEventsSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "flush-events", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_flush_events(&block : FlushEventsSignal)
      on_flush_events(after: true, &block)
    end

    alias LayoutSignal = FrameClock -> Nil

    def on_layout(*, after = false, &block : LayoutSignal)
      __var0 = ->(arg0 : LibGdk::FrameClock*, box : Void*) {
        ::Box(LayoutSignal).unbox(box).call(FrameClock.new(arg0))
      }

      __var1 = ::Box.box(LayoutSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "layout", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_layout(&block : LayoutSignal)
      on_layout(after: true, &block)
    end

    alias PaintSignal = FrameClock -> Nil

    def on_paint(*, after = false, &block : PaintSignal)
      __var0 = ->(arg0 : LibGdk::FrameClock*, box : Void*) {
        ::Box(PaintSignal).unbox(box).call(FrameClock.new(arg0))
      }

      __var1 = ::Box.box(PaintSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "paint", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_paint(&block : PaintSignal)
      on_paint(after: true, &block)
    end

    alias ResumeEventsSignal = FrameClock -> Nil

    def on_resume_events(*, after = false, &block : ResumeEventsSignal)
      __var0 = ->(arg0 : LibGdk::FrameClock*, box : Void*) {
        ::Box(ResumeEventsSignal).unbox(box).call(FrameClock.new(arg0))
      }

      __var1 = ::Box.box(ResumeEventsSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "resume-events", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_resume_events(&block : ResumeEventsSignal)
      on_resume_events(after: true, &block)
    end

    alias UpdateSignal = FrameClock -> Nil

    def on_update(*, after = false, &block : UpdateSignal)
      __var0 = ->(arg0 : LibGdk::FrameClock*, box : Void*) {
        ::Box(UpdateSignal).unbox(box).call(FrameClock.new(arg0))
      }

      __var1 = ::Box.box(UpdateSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "update", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_update(&block : UpdateSignal)
      on_update(after: true, &block)
    end
  end

  class FrameClockClass
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGdk::FrameClockClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::FrameClockClass*)
    end

    def to_unsafe_frameclockclass
      @pointer.not_nil!.as(LibGdk::FrameClockClass*)
    end
  end

  @[Flags]
  enum FrameClockPhase : UInt32
    NONE          =  0
    FLUSH_EVENTS  =  1
    BEFORE_PAINT  =  2
    UPDATE        =  4
    LAYOUT        =  8
    PAINT         = 16
    RESUME_EVENTS = 32
    AFTER_PAINT   = 64
  end

  class FrameClockPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGdk::FrameClockPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::FrameClockPrivate*)
    end

    def to_unsafe_frameclockprivate
      @pointer.not_nil!.as(LibGdk::FrameClockPrivate*)
    end
  end

  class FrameTimings
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGdk::FrameTimings*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::FrameTimings*)
    end

    def to_unsafe_frametimings
      @pointer.not_nil!.as(LibGdk::FrameTimings*)
    end

    def complete
      __var0 = LibGdk.frame_timings_get_complete(@pointer.as(LibGdk::FrameTimings*))
      (__var0 == 1)
    end

    def frame_counter
      __var0 = LibGdk.frame_timings_get_frame_counter(@pointer.as(LibGdk::FrameTimings*))
      __var0
    end

    def frame_time
      __var0 = LibGdk.frame_timings_get_frame_time(@pointer.as(LibGdk::FrameTimings*))
      __var0
    end

    def predicted_presentation_time
      __var0 = LibGdk.frame_timings_get_predicted_presentation_time(@pointer.as(LibGdk::FrameTimings*))
      __var0
    end

    def presentation_time
      __var0 = LibGdk.frame_timings_get_presentation_time(@pointer.as(LibGdk::FrameTimings*))
      __var0
    end

    def refresh_interval
      __var0 = LibGdk.frame_timings_get_refresh_interval(@pointer.as(LibGdk::FrameTimings*))
      __var0
    end

    def ref
      __var0 = LibGdk.frame_timings_ref(@pointer.as(LibGdk::FrameTimings*))
      GObject.raise_unexpected_null("gdk_frame_timings_ref") if __var0.null?
      Gdk::FrameTimings.new(__var0)
    end

    def unref
      LibGdk.frame_timings_unref(@pointer.as(LibGdk::FrameTimings*))
      nil
    end
  end

  enum FullscreenMode : UInt32
    CURRENT_MONITOR = 0
    ALL_MONITORS    = 1
  end

  class GLContext < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdk::GLContext*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkGLContext")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdk._gdk_gl_context_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::GLContext*)
    end

    def to_unsafe_glcontext
      @pointer.not_nil!.as(LibGdk::GLContext*)
    end

    def self.clear_current
      LibGdk.g_l_context_clear_current
      nil
    end

    def self.current
      __var0 = LibGdk.g_l_context_get_current
      __var1 = Gdk::GLContext.new(__var0) if __var0
      __var1
    end

    def debug_enabled
      __var0 = LibGdk.g_l_context_get_debug_enabled(@pointer.as(LibGdk::GLContext*))
      (__var0 == 1)
    end

    def display
      __var0 = LibGdk.g_l_context_get_display(@pointer.as(LibGdk::GLContext*))
      __var1 = Gdk::Display.new(__var0) if __var0
      __var1
    end

    def forward_compatible
      __var0 = LibGdk.g_l_context_get_forward_compatible(@pointer.as(LibGdk::GLContext*))
      (__var0 == 1)
    end

    def required_version
      LibGdk.g_l_context_get_required_version(@pointer.as(LibGdk::GLContext*), out major, out minor)
      {major, minor}
    end

    def shared_context
      __var0 = LibGdk.g_l_context_get_shared_context(@pointer.as(LibGdk::GLContext*))
      __var1 = Gdk::GLContext.new(__var0) if __var0
      __var1
    end

    def use_es
      __var0 = LibGdk.g_l_context_get_use_es(@pointer.as(LibGdk::GLContext*))
      (__var0 == 1)
    end

    def version
      LibGdk.g_l_context_get_version(@pointer.as(LibGdk::GLContext*), out major, out minor)
      {major, minor}
    end

    def window
      __var0 = LibGdk.g_l_context_get_window(@pointer.as(LibGdk::GLContext*))
      __var1 = Gdk::Window.new(__var0) if __var0
      __var1
    end

    def legacy?
      __var0 = LibGdk.g_l_context_is_legacy(@pointer.as(LibGdk::GLContext*))
      (__var0 == 1)
    end

    def make_current
      LibGdk.g_l_context_make_current(@pointer.as(LibGdk::GLContext*))
      nil
    end

    def realize
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdk.g_l_context_realize(@pointer.as(LibGdk::GLContext*), pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def debug_enabled=(enabled : ::Bool)
      LibGdk.g_l_context_set_debug_enabled(@pointer.as(LibGdk::GLContext*), LibC::Int.new(enabled ? 1 : 0))
      nil
    end

    def forward_compatible=(compatible : ::Bool)
      LibGdk.g_l_context_set_forward_compatible(@pointer.as(LibGdk::GLContext*), LibC::Int.new(compatible ? 1 : 0))
      nil
    end

    def set_required_version(major : ::Int, minor : ::Int)
      LibGdk.g_l_context_set_required_version(@pointer.as(LibGdk::GLContext*), Int32.new(major), Int32.new(minor))
      nil
    end

    def use_es=(use_es : ::Int)
      LibGdk.g_l_context_set_use_es(@pointer.as(LibGdk::GLContext*), Int32.new(use_es))
      nil
    end
  end

  enum GLError : UInt32
    NOT_AVAILABLE       = 0
    UNSUPPORTED_FORMAT  = 1
    UNSUPPORTED_PROFILE = 2
  end

  # Function quark

  class Geometry
    include GObject::WrappedType

    def self.new(min_width : Int32? = nil, min_height : Int32? = nil, max_width : Int32? = nil, max_height : Int32? = nil, base_width : Int32? = nil, base_height : Int32? = nil, width_inc : Int32? = nil, height_inc : Int32? = nil, min_aspect : Float64? = nil, max_aspect : Float64? = nil, win_gravity : Gdk::Gravity? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(56u64, 0u8).as(LibGdk::Geometry*))
      __var0.min_width = min_width unless min_width.nil?
      __var0.min_height = min_height unless min_height.nil?
      __var0.max_width = max_width unless max_width.nil?
      __var0.max_height = max_height unless max_height.nil?
      __var0.base_width = base_width unless base_width.nil?
      __var0.base_height = base_height unless base_height.nil?
      __var0.width_inc = width_inc unless width_inc.nil?
      __var0.height_inc = height_inc unless height_inc.nil?
      __var0.min_aspect = min_aspect unless min_aspect.nil?
      __var0.max_aspect = max_aspect unless max_aspect.nil?
      __var0.win_gravity = win_gravity unless win_gravity.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::Geometry*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::Geometry*)
    end

    def to_unsafe_geometry
      @pointer.not_nil!.as(LibGdk::Geometry*)
    end

    def min_width
      to_unsafe.as(LibGdk::Geometry*).value.min_width
    end

    def min_width=(value : Int32)
      to_unsafe.as(LibGdk::Geometry*).value.min_width = Int32.new(value)
    end

    def min_height
      to_unsafe.as(LibGdk::Geometry*).value.min_height
    end

    def min_height=(value : Int32)
      to_unsafe.as(LibGdk::Geometry*).value.min_height = Int32.new(value)
    end

    def max_width
      to_unsafe.as(LibGdk::Geometry*).value.max_width
    end

    def max_width=(value : Int32)
      to_unsafe.as(LibGdk::Geometry*).value.max_width = Int32.new(value)
    end

    def max_height
      to_unsafe.as(LibGdk::Geometry*).value.max_height
    end

    def max_height=(value : Int32)
      to_unsafe.as(LibGdk::Geometry*).value.max_height = Int32.new(value)
    end

    def base_width
      to_unsafe.as(LibGdk::Geometry*).value.base_width
    end

    def base_width=(value : Int32)
      to_unsafe.as(LibGdk::Geometry*).value.base_width = Int32.new(value)
    end

    def base_height
      to_unsafe.as(LibGdk::Geometry*).value.base_height
    end

    def base_height=(value : Int32)
      to_unsafe.as(LibGdk::Geometry*).value.base_height = Int32.new(value)
    end

    def width_inc
      to_unsafe.as(LibGdk::Geometry*).value.width_inc
    end

    def width_inc=(value : Int32)
      to_unsafe.as(LibGdk::Geometry*).value.width_inc = Int32.new(value)
    end

    def height_inc
      to_unsafe.as(LibGdk::Geometry*).value.height_inc
    end

    def height_inc=(value : Int32)
      to_unsafe.as(LibGdk::Geometry*).value.height_inc = Int32.new(value)
    end

    def min_aspect
      to_unsafe.as(LibGdk::Geometry*).value.min_aspect
    end

    def min_aspect=(value : Float64)
      to_unsafe.as(LibGdk::Geometry*).value.min_aspect = Float64.new(value)
    end

    def max_aspect
      to_unsafe.as(LibGdk::Geometry*).value.max_aspect
    end

    def max_aspect=(value : Float64)
      to_unsafe.as(LibGdk::Geometry*).value.max_aspect = Float64.new(value)
    end

    def win_gravity
      Gdk::Gravity.new(to_unsafe.as(LibGdk::Geometry*).value.win_gravity)
    end

    def win_gravity=(value : Gdk::Gravity)
      to_unsafe.as(LibGdk::Geometry*).value.win_gravity = value
    end
  end

  enum GrabOwnership : UInt32
    NONE        = 0
    WINDOW      = 1
    APPLICATION = 2
  end

  enum GrabStatus : UInt32
    SUCCESS         = 0
    ALREADY_GRABBED = 1
    INVALID_TIME    = 2
    NOT_VIEWABLE    = 3
    FROZEN          = 4
    FAILED          = 5
  end

  enum Gravity : UInt32
    ZERO_NONE  =  0
    NORTH_WEST =  1
    NORTH      =  2
    NORTH_EAST =  3
    WEST       =  4
    CENTER     =  5
    EAST       =  6
    SOUTH_WEST =  7
    SOUTH      =  8
    SOUTH_EAST =  9
    STATIC     = 10
  end

  enum InputMode : UInt32
    DISABLED = 0
    SCREEN   = 1
    WINDOW   = 2
  end

  enum InputSource : UInt32
    MOUSE       = 0
    PEN         = 1
    ERASER      = 2
    CURSOR      = 3
    KEYBOARD    = 4
    TOUCHSCREEN = 5
    TOUCHPAD    = 6
    TRACKPOINT  = 7
    TABLET_PAD  = 8
  end

  class Keymap < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdk::Keymap*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkKeymap")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdk._gdk_keymap_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::Keymap*)
    end

    def to_unsafe_keymap
      @pointer.not_nil!.as(LibGdk::Keymap*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(LibGdk._gdk_keymap_get_type, 0, nil, nil).as(Void*)
    end

    def self.default
      __var0 = LibGdk.keymap_get_default
      GObject.raise_unexpected_null("gdk_keymap_get_default") if __var0.null?
      Gdk::Keymap.new(__var0)
    end

    def self.for_display(display : Gdk::Display)
      __var0 = LibGdk.keymap_get_for_display(display.to_unsafe_display)
      GObject.raise_unexpected_null("gdk_keymap_get_for_display") if __var0.null?
      Gdk::Keymap.new(__var0)
    end

    def add_virtual_modifiers(state : Gdk::ModifierType)
      LibGdk.keymap_add_virtual_modifiers(@pointer.as(LibGdk::Keymap*), state)
      nil
    end

    def caps_lock_state
      __var0 = LibGdk.keymap_get_caps_lock_state(@pointer.as(LibGdk::Keymap*))
      (__var0 == 1)
    end

    def direction
      __var0 = LibGdk.keymap_get_direction(@pointer.as(LibGdk::Keymap*))
      Pango::Direction.new(__var0)
    end

    def entries_for_keycode(hardware_keycode : ::Int, keys : ::Enumerable?, keyvals : ::Enumerable?)
      __var0 = LibGdk.keymap_get_entries_for_keycode(@pointer.as(LibGdk::Keymap*), UInt32.new(hardware_keycode), keys, keyvals, out n_entries)
      {(__var0 == 1), n_entries}
    end

    def entries_for_keyval(keyval : ::Int, keys : ::Enumerable)
      __var0 = LibGdk.keymap_get_entries_for_keyval(@pointer.as(LibGdk::Keymap*), UInt32.new(keyval), keys, out n_keys)
      {(__var0 == 1), n_keys}
    end

    def modifier_mask(intent : Gdk::ModifierIntent)
      __var0 = LibGdk.keymap_get_modifier_mask(@pointer.as(LibGdk::Keymap*), intent)
      Gdk::ModifierType.new(__var0)
    end

    def modifier_state
      __var0 = LibGdk.keymap_get_modifier_state(@pointer.as(LibGdk::Keymap*))
      __var0
    end

    def num_lock_state
      __var0 = LibGdk.keymap_get_num_lock_state(@pointer.as(LibGdk::Keymap*))
      (__var0 == 1)
    end

    def scroll_lock_state
      __var0 = LibGdk.keymap_get_scroll_lock_state(@pointer.as(LibGdk::Keymap*))
      (__var0 == 1)
    end

    def have_bidi_layouts
      __var0 = LibGdk.keymap_have_bidi_layouts(@pointer.as(LibGdk::Keymap*))
      (__var0 == 1)
    end

    def lookup_key(key : Gdk::KeymapKey)
      __var0 = LibGdk.keymap_lookup_key(@pointer.as(LibGdk::Keymap*), key.to_unsafe.as(LibGdk::KeymapKey*))
      __var0
    end

    def map_virtual_modifiers(state : Gdk::ModifierType)
      __var0 = LibGdk.keymap_map_virtual_modifiers(@pointer.as(LibGdk::Keymap*), state)
      (__var0 == 1)
    end

    def translate_keyboard_state(hardware_keycode : ::Int, state : Gdk::ModifierType, group : ::Int, consumed_modifiers : Gdk::ModifierType?)
      __var0 = LibGdk.keymap_translate_keyboard_state(@pointer.as(LibGdk::Keymap*), UInt32.new(hardware_keycode), state, Int32.new(group), out keyval, out effective_group, out level, consumed_modifiers)
      {(__var0 == 1), keyval, effective_group, level}
    end

    alias DirectionChangedSignal = Keymap -> Nil

    def on_direction_changed(*, after = false, &block : DirectionChangedSignal)
      __var0 = ->(arg0 : LibGdk::Keymap*, box : Void*) {
        ::Box(DirectionChangedSignal).unbox(box).call(Keymap.new(arg0))
      }

      __var1 = ::Box.box(DirectionChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "direction-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_direction_changed(&block : DirectionChangedSignal)
      on_direction_changed(after: true, &block)
    end

    alias KeysChangedSignal = Keymap -> Nil

    def on_keys_changed(*, after = false, &block : KeysChangedSignal)
      __var0 = ->(arg0 : LibGdk::Keymap*, box : Void*) {
        ::Box(KeysChangedSignal).unbox(box).call(Keymap.new(arg0))
      }

      __var1 = ::Box.box(KeysChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "keys-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_keys_changed(&block : KeysChangedSignal)
      on_keys_changed(after: true, &block)
    end

    alias StateChangedSignal = Keymap -> Nil

    def on_state_changed(*, after = false, &block : StateChangedSignal)
      __var0 = ->(arg0 : LibGdk::Keymap*, box : Void*) {
        ::Box(StateChangedSignal).unbox(box).call(Keymap.new(arg0))
      }

      __var1 = ::Box.box(StateChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "state-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_state_changed(&block : StateChangedSignal)
      on_state_changed(after: true, &block)
    end
  end

  class KeymapKey
    include GObject::WrappedType

    def self.new(keycode : UInt32? = nil, group : Int32? = nil, level : Int32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(12u64, 0u8).as(LibGdk::KeymapKey*))
      __var0.keycode = keycode unless keycode.nil?
      __var0.group = group unless group.nil?
      __var0.level = level unless level.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::KeymapKey*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::KeymapKey*)
    end

    def to_unsafe_keymapkey
      @pointer.not_nil!.as(LibGdk::KeymapKey*)
    end

    def keycode
      to_unsafe.as(LibGdk::KeymapKey*).value.keycode
    end

    def keycode=(value : UInt32)
      to_unsafe.as(LibGdk::KeymapKey*).value.keycode = UInt32.new(value)
    end

    def group
      to_unsafe.as(LibGdk::KeymapKey*).value.group
    end

    def group=(value : Int32)
      to_unsafe.as(LibGdk::KeymapKey*).value.group = Int32.new(value)
    end

    def level
      to_unsafe.as(LibGdk::KeymapKey*).value.level
    end

    def level=(value : Int32)
      to_unsafe.as(LibGdk::KeymapKey*).value.level = Int32.new(value)
    end
  end

  enum ModifierIntent : UInt32
    PRIMARY_ACCELERATOR = 0
    CONTEXT_MENU        = 1
    EXTEND_SELECTION    = 2
    MODIFY_SELECTION    = 3
    NO_TEXT_INPUT       = 4
    SHIFT_GROUP         = 5
    DEFAULT_MOD_MASK    = 6
  end

  @[Flags]
  enum ModifierType : UInt32
    ZERO_NONE                 =          0
    SHIFT_MASK                =          1
    LOCK_MASK                 =          2
    CONTROL_MASK              =          4
    MOD1_MASK                 =          8
    MOD2_MASK                 =         16
    MOD3_MASK                 =         32
    MOD4_MASK                 =         64
    MOD5_MASK                 =        128
    BUTTON1_MASK              =        256
    BUTTON2_MASK              =        512
    BUTTON3_MASK              =       1024
    BUTTON4_MASK              =       2048
    BUTTON5_MASK              =       4096
    MODIFIER_RESERVED_13_MASK =       8192
    MODIFIER_RESERVED_14_MASK =      16384
    MODIFIER_RESERVED_15_MASK =      32768
    MODIFIER_RESERVED_16_MASK =      65536
    MODIFIER_RESERVED_17_MASK =     131072
    MODIFIER_RESERVED_18_MASK =     262144
    MODIFIER_RESERVED_19_MASK =     524288
    MODIFIER_RESERVED_20_MASK =    1048576
    MODIFIER_RESERVED_21_MASK =    2097152
    MODIFIER_RESERVED_22_MASK =    4194304
    MODIFIER_RESERVED_23_MASK =    8388608
    MODIFIER_RESERVED_24_MASK =   16777216
    MODIFIER_RESERVED_25_MASK =   33554432
    SUPER_MASK                =   67108864
    HYPER_MASK                =  134217728
    META_MASK                 =  268435456
    MODIFIER_RESERVED_29_MASK =  536870912
    RELEASE_MASK              = 1073741824
    MODIFIER_MASK             = 1543512063
  end

  class Monitor < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdk::Monitor*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkMonitor")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdk._gdk_monitor_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::Monitor*)
    end

    def to_unsafe_monitor
      @pointer.not_nil!.as(LibGdk::Monitor*)
    end

    def initialize(*, display : Gdk::Display? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless display.nil?
        __var0 << "display".to_unsafe
        __var1 << display.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGdk._gdk_monitor_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def display
      __var0 = LibGdk.monitor_get_display(@pointer.as(LibGdk::Monitor*))
      GObject.raise_unexpected_null("gdk_monitor_get_display") if __var0.null?
      Gdk::Display.new(__var0)
    end

    def geometry(geometry : Gdk::Rectangle)
      LibGdk.monitor_get_geometry(@pointer.as(LibGdk::Monitor*), geometry)
      nil
    end

    def height_mm
      __var0 = LibGdk.monitor_get_height_mm(@pointer.as(LibGdk::Monitor*))
      __var0
    end

    def manufacturer
      __var0 = LibGdk.monitor_get_manufacturer(@pointer.as(LibGdk::Monitor*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def model
      __var0 = LibGdk.monitor_get_model(@pointer.as(LibGdk::Monitor*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def refresh_rate
      __var0 = LibGdk.monitor_get_refresh_rate(@pointer.as(LibGdk::Monitor*))
      __var0
    end

    def scale_factor
      __var0 = LibGdk.monitor_get_scale_factor(@pointer.as(LibGdk::Monitor*))
      __var0
    end

    def subpixel_layout
      __var0 = LibGdk.monitor_get_subpixel_layout(@pointer.as(LibGdk::Monitor*))
      Gdk::SubpixelLayout.new(__var0)
    end

    def width_mm
      __var0 = LibGdk.monitor_get_width_mm(@pointer.as(LibGdk::Monitor*))
      __var0
    end

    def workarea(workarea : Gdk::Rectangle)
      LibGdk.monitor_get_workarea(@pointer.as(LibGdk::Monitor*), workarea)
      nil
    end

    def primary?
      __var0 = LibGdk.monitor_is_primary(@pointer.as(LibGdk::Monitor*))
      (__var0 == 1)
    end

    alias InvalidateSignal = Monitor -> Nil

    def on_invalidate(*, after = false, &block : InvalidateSignal)
      __var0 = ->(arg0 : LibGdk::Monitor*, box : Void*) {
        ::Box(InvalidateSignal).unbox(box).call(Monitor.new(arg0))
      }

      __var1 = ::Box.box(InvalidateSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "invalidate", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_invalidate(&block : InvalidateSignal)
      on_invalidate(after: true, &block)
    end
  end

  class MonitorClass
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGdk::MonitorClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::MonitorClass*)
    end

    def to_unsafe_monitorclass
      @pointer.not_nil!.as(LibGdk::MonitorClass*)
    end
  end

  enum NotifyType : UInt32
    ANCESTOR          = 0
    VIRTUAL           = 1
    INFERIOR          = 2
    NONLINEAR         = 3
    NONLINEAR_VIRTUAL = 4
    UNKNOWN           = 5
  end

  enum OwnerChange : UInt32
    NEW_OWNER = 0
    DESTROY   = 1
    CLOSE     = 2
  end

  class Point
    include GObject::WrappedType

    def self.new(x : Int32? = nil, y : Int32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(8u64, 0u8).as(LibGdk::Point*))
      __var0.x = x unless x.nil?
      __var0.y = y unless y.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::Point*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::Point*)
    end

    def to_unsafe_point
      @pointer.not_nil!.as(LibGdk::Point*)
    end

    def x
      to_unsafe.as(LibGdk::Point*).value.x
    end

    def x=(value : Int32)
      to_unsafe.as(LibGdk::Point*).value.x = Int32.new(value)
    end

    def y
      to_unsafe.as(LibGdk::Point*).value.y
    end

    def y=(value : Int32)
      to_unsafe.as(LibGdk::Point*).value.y = Int32.new(value)
    end
  end

  enum PropMode : UInt32
    REPLACE = 0
    PREPEND = 1
    APPEND  = 2
  end

  enum PropertyState : UInt32
    NEW_VALUE = 0
    DELETE    = 1
  end

  class RGBA
    include GObject::WrappedType

    def self.new(red : Float64? = nil, green : Float64? = nil, blue : Float64? = nil, alpha : Float64? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(32u64, 0u8).as(LibGdk::RGBA*))
      __var0.red = red unless red.nil?
      __var0.green = green unless green.nil?
      __var0.blue = blue unless blue.nil?
      __var0.alpha = alpha unless alpha.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::RGBA*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::RGBA*)
    end

    def to_unsafe_rgba
      @pointer.not_nil!.as(LibGdk::RGBA*)
    end

    def copy
      __var0 = LibGdk.r_g_b_a_copy(@pointer.as(LibGdk::RGBA*))
      GObject.raise_unexpected_null("gdk_rgba_copy") if __var0.null?
      Gdk::RGBA.new(__var0)
    end

    def equal(p2 : Gdk::RGBA)
      __var0 = LibGdk.r_g_b_a_equal(@pointer.as(LibGdk::RGBA*), p2.to_unsafe.as(LibGdk::RGBA*))
      (__var0 == 1)
    end

    def free
      LibGdk.r_g_b_a_free(@pointer.as(LibGdk::RGBA*))
      nil
    end

    def hash
      __var0 = LibGdk.r_g_b_a_hash(@pointer.as(LibGdk::RGBA*))
      __var0
    end

    def parse(spec : ::String)
      __var0 = LibGdk.r_g_b_a_parse(@pointer.as(LibGdk::RGBA*), spec.to_unsafe)
      (__var0 == 1)
    end

    def to_string
      __var0 = LibGdk.r_g_b_a_to_string(@pointer.as(LibGdk::RGBA*))
      GObject.raise_unexpected_null("gdk_rgba_to_string") if __var0.null?
      ::String.new(__var0)
    end

    def red
      to_unsafe.as(LibGdk::RGBA*).value.red
    end

    def red=(value : Float64)
      to_unsafe.as(LibGdk::RGBA*).value.red = Float64.new(value)
    end

    def green
      to_unsafe.as(LibGdk::RGBA*).value.green
    end

    def green=(value : Float64)
      to_unsafe.as(LibGdk::RGBA*).value.green = Float64.new(value)
    end

    def blue
      to_unsafe.as(LibGdk::RGBA*).value.blue
    end

    def blue=(value : Float64)
      to_unsafe.as(LibGdk::RGBA*).value.blue = Float64.new(value)
    end

    def alpha
      to_unsafe.as(LibGdk::RGBA*).value.alpha
    end

    def alpha=(value : Float64)
      to_unsafe.as(LibGdk::RGBA*).value.alpha = Float64.new(value)
    end
  end

  class Rectangle
    include GObject::WrappedType

    def self.new(x : Int32? = nil, y : Int32? = nil, width : Int32? = nil, height : Int32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibGdk::Rectangle*))
      __var0.x = x unless x.nil?
      __var0.y = y unless y.nil?
      __var0.width = width unless width.nil?
      __var0.height = height unless height.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::Rectangle*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::Rectangle*)
    end

    def to_unsafe_rectangle
      @pointer.not_nil!.as(LibGdk::Rectangle*)
    end

    def equal(rect2 : Gdk::Rectangle)
      __var0 = LibGdk.rectangle_equal(@pointer.as(LibGdk::Rectangle*), rect2.to_unsafe.as(LibGdk::Rectangle*))
      (__var0 == 1)
    end

    def intersect(src2 : Gdk::Rectangle, dest : Gdk::Rectangle?)
      __var0 = LibGdk.rectangle_intersect(@pointer.as(LibGdk::Rectangle*), src2.to_unsafe.as(LibGdk::Rectangle*), dest)
      (__var0 == 1)
    end

    def union(src2 : Gdk::Rectangle, dest : Gdk::Rectangle)
      LibGdk.rectangle_union(@pointer.as(LibGdk::Rectangle*), src2.to_unsafe.as(LibGdk::Rectangle*), dest)
      nil
    end

    def x
      to_unsafe.as(LibGdk::Rectangle*).value.x
    end

    def x=(value : Int32)
      to_unsafe.as(LibGdk::Rectangle*).value.x = Int32.new(value)
    end

    def y
      to_unsafe.as(LibGdk::Rectangle*).value.y
    end

    def y=(value : Int32)
      to_unsafe.as(LibGdk::Rectangle*).value.y = Int32.new(value)
    end

    def width
      to_unsafe.as(LibGdk::Rectangle*).value.width
    end

    def width=(value : Int32)
      to_unsafe.as(LibGdk::Rectangle*).value.width = Int32.new(value)
    end

    def height
      to_unsafe.as(LibGdk::Rectangle*).value.height
    end

    def height=(value : Int32)
      to_unsafe.as(LibGdk::Rectangle*).value.height = Int32.new(value)
    end
  end

  class Screen < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdk::Screen*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkScreen")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdk._gdk_screen_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::Screen*)
    end

    def to_unsafe_screen
      @pointer.not_nil!.as(LibGdk::Screen*)
    end

    def initialize(*, font_options : Void*? = nil, resolution : Float64? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless font_options.nil?
        __var0 << "font-options".to_unsafe
        __var1 << font_options.to_gvalue.to_unsafe.value
      end

      unless resolution.nil?
        __var0 << "resolution".to_unsafe
        __var1 << resolution.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGdk._gdk_screen_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.default
      __var0 = LibGdk.screen_get_default
      __var1 = Gdk::Screen.new(__var0) if __var0
      __var1
    end

    def self.height
      __var0 = LibGdk.screen_height
      __var0
    end

    def self.height_mm
      __var0 = LibGdk.screen_height_mm
      __var0
    end

    def self.width
      __var0 = LibGdk.screen_width
      __var0
    end

    def self.width_mm
      __var0 = LibGdk.screen_width_mm
      __var0
    end

    def active_window
      __var0 = LibGdk.screen_get_active_window(@pointer.as(LibGdk::Screen*))
      __var1 = Gdk::Window.new(__var0) if __var0
      __var1
    end

    def display
      __var0 = LibGdk.screen_get_display(@pointer.as(LibGdk::Screen*))
      GObject.raise_unexpected_null("gdk_screen_get_display") if __var0.null?
      Gdk::Display.new(__var0)
    end

    def font_options
      __var0 = LibGdk.screen_get_font_options(@pointer.as(LibGdk::Screen*))
      __var1 = Cairo::FontOptions.new(__var0) if __var0
      __var1
    end

    def height
      __var0 = LibGdk.screen_get_height(@pointer.as(LibGdk::Screen*))
      __var0
    end

    def height_mm
      __var0 = LibGdk.screen_get_height_mm(@pointer.as(LibGdk::Screen*))
      __var0
    end

    def monitor_at_point(x : ::Int, y : ::Int)
      __var0 = LibGdk.screen_get_monitor_at_point(@pointer.as(LibGdk::Screen*), Int32.new(x), Int32.new(y))
      __var0
    end

    def monitor_at_window(window : Gdk::Window)
      __var0 = LibGdk.screen_get_monitor_at_window(@pointer.as(LibGdk::Screen*), window.to_unsafe_window)
      __var0
    end

    def monitor_geometry(monitor_num : ::Int, dest : Gdk::Rectangle?)
      LibGdk.screen_get_monitor_geometry(@pointer.as(LibGdk::Screen*), Int32.new(monitor_num), dest)
      nil
    end

    def monitor_height_mm(monitor_num : ::Int)
      __var0 = LibGdk.screen_get_monitor_height_mm(@pointer.as(LibGdk::Screen*), Int32.new(monitor_num))
      __var0
    end

    def monitor_plug_name(monitor_num : ::Int)
      __var0 = LibGdk.screen_get_monitor_plug_name(@pointer.as(LibGdk::Screen*), Int32.new(monitor_num))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def monitor_scale_factor(monitor_num : ::Int)
      __var0 = LibGdk.screen_get_monitor_scale_factor(@pointer.as(LibGdk::Screen*), Int32.new(monitor_num))
      __var0
    end

    def monitor_width_mm(monitor_num : ::Int)
      __var0 = LibGdk.screen_get_monitor_width_mm(@pointer.as(LibGdk::Screen*), Int32.new(monitor_num))
      __var0
    end

    def monitor_workarea(monitor_num : ::Int, dest : Gdk::Rectangle?)
      LibGdk.screen_get_monitor_workarea(@pointer.as(LibGdk::Screen*), Int32.new(monitor_num), dest)
      nil
    end

    def n_monitors
      __var0 = LibGdk.screen_get_n_monitors(@pointer.as(LibGdk::Screen*))
      __var0
    end

    def number
      __var0 = LibGdk.screen_get_number(@pointer.as(LibGdk::Screen*))
      __var0
    end

    def primary_monitor
      __var0 = LibGdk.screen_get_primary_monitor(@pointer.as(LibGdk::Screen*))
      __var0
    end

    def resolution
      __var0 = LibGdk.screen_get_resolution(@pointer.as(LibGdk::Screen*))
      __var0
    end

    def rgba_visual
      __var0 = LibGdk.screen_get_rgba_visual(@pointer.as(LibGdk::Screen*))
      __var1 = Gdk::Visual.new(__var0) if __var0
      __var1
    end

    def root_window
      __var0 = LibGdk.screen_get_root_window(@pointer.as(LibGdk::Screen*))
      GObject.raise_unexpected_null("gdk_screen_get_root_window") if __var0.null?
      Gdk::Window.new(__var0)
    end

    def setting(name : ::String, value)
      __var0 = LibGdk.screen_get_setting(@pointer.as(LibGdk::Screen*), name.to_unsafe, value.to_gvalue.to_unsafe)
      (__var0 == 1)
    end

    def system_visual
      __var0 = LibGdk.screen_get_system_visual(@pointer.as(LibGdk::Screen*))
      GObject.raise_unexpected_null("gdk_screen_get_system_visual") if __var0.null?
      Gdk::Visual.new(__var0)
    end

    def toplevel_windows
      __var0 = LibGdk.screen_get_toplevel_windows(@pointer.as(LibGdk::Screen*))
      GObject.raise_unexpected_null("gdk_screen_get_toplevel_windows") if __var0.null?
      GLib::ListIterator(Gdk::Window, LibGdk::Window*).new(GLib::List.new(__var0.as(LibGLib::List*)))
    end

    def width
      __var0 = LibGdk.screen_get_width(@pointer.as(LibGdk::Screen*))
      __var0
    end

    def width_mm
      __var0 = LibGdk.screen_get_width_mm(@pointer.as(LibGdk::Screen*))
      __var0
    end

    def window_stack
      __var0 = LibGdk.screen_get_window_stack(@pointer.as(LibGdk::Screen*))
      __var1 = GLib::ListIterator(Gdk::Window, LibGdk::Window*).new(GLib::List.new(__var0.as(LibGLib::List*))) if __var0
      __var1
    end

    def composited?
      __var0 = LibGdk.screen_is_composited(@pointer.as(LibGdk::Screen*))
      (__var0 == 1)
    end

    def list_visuals
      __var0 = LibGdk.screen_list_visuals(@pointer.as(LibGdk::Screen*))
      GObject.raise_unexpected_null("gdk_screen_list_visuals") if __var0.null?
      GLib::ListIterator(Gdk::Visual, LibGdk::Visual*).new(GLib::List.new(__var0.as(LibGLib::List*)))
    end

    def make_display_name
      __var0 = LibGdk.screen_make_display_name(@pointer.as(LibGdk::Screen*))
      GObject.raise_unexpected_null("gdk_screen_make_display_name") if __var0.null?
      ::String.new(__var0)
    end

    def font_options=(options : Cairo::FontOptions?)
      LibGdk.screen_set_font_options(@pointer.as(LibGdk::Screen*), options ? options.to_unsafe.as(LibCairo::FontOptions*) : Pointer(LibCairo::FontOptions).null)
      nil
    end

    def resolution=(dpi : ::Float)
      LibGdk.screen_set_resolution(@pointer.as(LibGdk::Screen*), Float64.new(dpi))
      nil
    end

    alias CompositedChangedSignal = Screen -> Nil

    def on_composited_changed(*, after = false, &block : CompositedChangedSignal)
      __var0 = ->(arg0 : LibGdk::Screen*, box : Void*) {
        ::Box(CompositedChangedSignal).unbox(box).call(Screen.new(arg0))
      }

      __var1 = ::Box.box(CompositedChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "composited-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_composited_changed(&block : CompositedChangedSignal)
      on_composited_changed(after: true, &block)
    end

    alias MonitorsChangedSignal = Screen -> Nil

    def on_monitors_changed(*, after = false, &block : MonitorsChangedSignal)
      __var0 = ->(arg0 : LibGdk::Screen*, box : Void*) {
        ::Box(MonitorsChangedSignal).unbox(box).call(Screen.new(arg0))
      }

      __var1 = ::Box.box(MonitorsChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "monitors-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_monitors_changed(&block : MonitorsChangedSignal)
      on_monitors_changed(after: true, &block)
    end

    alias SizeChangedSignal = Screen -> Nil

    def on_size_changed(*, after = false, &block : SizeChangedSignal)
      __var0 = ->(arg0 : LibGdk::Screen*, box : Void*) {
        ::Box(SizeChangedSignal).unbox(box).call(Screen.new(arg0))
      }

      __var1 = ::Box.box(SizeChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "size-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_size_changed(&block : SizeChangedSignal)
      on_size_changed(after: true, &block)
    end
  end

  enum ScrollDirection : UInt32
    UP     = 0
    DOWN   = 1
    LEFT   = 2
    RIGHT  = 3
    SMOOTH = 4
  end

  class Seat < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdk::Seat*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkSeat")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdk._gdk_seat_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::Seat*)
    end

    def to_unsafe_seat
      @pointer.not_nil!.as(LibGdk::Seat*)
    end

    def capabilities
      __var0 = LibGdk.seat_get_capabilities(@pointer.as(LibGdk::Seat*))
      Gdk::SeatCapabilities.new(__var0)
    end

    def display
      __var0 = LibGdk.seat_get_display(@pointer.as(LibGdk::Seat*))
      GObject.raise_unexpected_null("gdk_seat_get_display") if __var0.null?
      Gdk::Display.new(__var0)
    end

    def keyboard
      __var0 = LibGdk.seat_get_keyboard(@pointer.as(LibGdk::Seat*))
      __var1 = Gdk::Device.new(__var0) if __var0
      __var1
    end

    def pointer
      __var0 = LibGdk.seat_get_pointer(@pointer.as(LibGdk::Seat*))
      __var1 = Gdk::Device.new(__var0) if __var0
      __var1
    end

    def slaves(capabilities : Gdk::SeatCapabilities)
      __var0 = LibGdk.seat_get_slaves(@pointer.as(LibGdk::Seat*), capabilities)
      GObject.raise_unexpected_null("gdk_seat_get_slaves") if __var0.null?
      GLib::ListIterator(Gdk::Device, LibGdk::Device*).new(GLib::List.new(__var0.as(LibGLib::List*)))
    end

    def grab(window : Gdk::Window, capabilities : Gdk::SeatCapabilities, owner_events : ::Bool, cursor : Gdk::Cursor?, event : Gdk::Event::Union?, prepare_func : Gdk::SeatGrabPrepareFunc?, prepare_func_data : Void*?)
      __var0 = LibGdk.seat_grab(@pointer.as(LibGdk::Seat*), window.to_unsafe_window, capabilities, LibC::Int.new(owner_events ? 1 : 0), cursor ? cursor.to_unsafe_cursor : Pointer(LibGdk::Cursor).null, event ? event.to_unsafe.as(LibGdk::Event*) : Pointer(LibGdk::Event).null, prepare_func ? prepare_func : nil, prepare_func_data ? prepare_func_data : Pointer(Void).null)
      Gdk::GrabStatus.new(__var0)
    end

    def ungrab
      LibGdk.seat_ungrab(@pointer.as(LibGdk::Seat*))
      nil
    end

    alias DeviceAddedSignal = Seat, Gdk::Device -> Nil

    def on_device_added(*, after = false, &block : DeviceAddedSignal)
      __var0 = ->(arg0 : LibGdk::Seat*, arg1 : LibGdk::Device*, box : Void*) {
        ::Box(DeviceAddedSignal).unbox(box).call(Seat.new(arg0), arg1.null? ? GObject.raise_unexpected_null("device in device_added") : Gdk::Device.new(arg1))
      }

      __var1 = ::Box.box(DeviceAddedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "device-added", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_device_added(&block : DeviceAddedSignal)
      on_device_added(after: true, &block)
    end

    alias DeviceRemovedSignal = Seat, Gdk::Device -> Nil

    def on_device_removed(*, after = false, &block : DeviceRemovedSignal)
      __var0 = ->(arg0 : LibGdk::Seat*, arg1 : LibGdk::Device*, box : Void*) {
        ::Box(DeviceRemovedSignal).unbox(box).call(Seat.new(arg0), arg1.null? ? GObject.raise_unexpected_null("device in device_removed") : Gdk::Device.new(arg1))
      }

      __var1 = ::Box.box(DeviceRemovedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "device-removed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_device_removed(&block : DeviceRemovedSignal)
      on_device_removed(after: true, &block)
    end

    alias ToolAddedSignal = Seat, Gdk::DeviceTool -> Nil

    def on_tool_added(*, after = false, &block : ToolAddedSignal)
      __var0 = ->(arg0 : LibGdk::Seat*, arg1 : LibGdk::DeviceTool*, box : Void*) {
        ::Box(ToolAddedSignal).unbox(box).call(Seat.new(arg0), arg1.null? ? GObject.raise_unexpected_null("tool in tool_added") : Gdk::DeviceTool.new(arg1))
      }

      __var1 = ::Box.box(ToolAddedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "tool-added", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_tool_added(&block : ToolAddedSignal)
      on_tool_added(after: true, &block)
    end

    alias ToolRemovedSignal = Seat, Gdk::DeviceTool -> Nil

    def on_tool_removed(*, after = false, &block : ToolRemovedSignal)
      __var0 = ->(arg0 : LibGdk::Seat*, arg1 : LibGdk::DeviceTool*, box : Void*) {
        ::Box(ToolRemovedSignal).unbox(box).call(Seat.new(arg0), arg1.null? ? GObject.raise_unexpected_null("tool in tool_removed") : Gdk::DeviceTool.new(arg1))
      }

      __var1 = ::Box.box(ToolRemovedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "tool-removed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_tool_removed(&block : ToolRemovedSignal)
      on_tool_removed(after: true, &block)
    end
  end

  @[Flags]
  enum SeatCapabilities : UInt32
    NONE          =  0
    POINTER       =  1
    TOUCH         =  2
    TABLET_STYLUS =  4
    KEYBOARD      =  8
    ALL_POINTING  =  7
    ALL           = 15
  end
  alias SeatGrabPrepareFunc = LibGdk::SeatGrabPrepareFunc

  enum SettingAction : UInt32
    NEW     = 0
    CHANGED = 1
    DELETED = 2
  end

  enum Status : Int32
    OK          =  0
    ERROR       = -1
    ERROR_PARAM = -2
    ERROR_FILE  = -3
    ERROR_MEM   = -4
  end

  enum SubpixelLayout : UInt32
    UNKNOWN        = 0
    NONE           = 1
    HORIZONTAL_RGB = 2
    HORIZONTAL_BGR = 3
    VERTICAL_RGB   = 4
    VERTICAL_BGR   = 5
  end

  class TimeCoord
    include GObject::WrappedType

    def self.new(time : UInt32? = nil, axes : ::Enumerable(Float64)? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(1032u64, 0u8).as(LibGdk::TimeCoord*))
      __var0.time = time unless time.nil?
      __var0.axes = axes unless axes.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::TimeCoord*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::TimeCoord*)
    end

    def to_unsafe_timecoord
      @pointer.not_nil!.as(LibGdk::TimeCoord*)
    end

    def time
      to_unsafe.as(LibGdk::TimeCoord*).value.time
    end

    def time=(value : UInt32)
      to_unsafe.as(LibGdk::TimeCoord*).value.time = UInt32.new(value)
    end

    def axes
      GObject::PointerIterator.new(to_unsafe.as(LibGdk::TimeCoord*).value.axes) { |__var0|
        __var0
      }
    end

    def axes=(value : ::Enumerable(Float64))
      to_unsafe.as(LibGdk::TimeCoord*).value.axes = (__value_ary = value.map { |__item| Float64.new(__item) }.to_a).to_unsafe
    end
  end

  enum TouchpadGesturePhase : UInt32
    BEGIN  = 0
    UPDATE = 1
    END    = 2
    CANCEL = 3
  end

  enum VisibilityState : UInt32
    UNOBSCURED     = 0
    PARTIAL        = 1
    FULLY_OBSCURED = 2
  end

  class Visual < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdk::Visual*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkVisual")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdk._gdk_visual_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::Visual*)
    end

    def to_unsafe_visual
      @pointer.not_nil!.as(LibGdk::Visual*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(LibGdk._gdk_visual_get_type, 0, nil, nil).as(Void*)
    end

    def self.best
      __var0 = LibGdk.visual_get_best
      GObject.raise_unexpected_null("gdk_visual_get_best") if __var0.null?
      Gdk::Visual.new(__var0)
    end

    def self.best_depth
      __var0 = LibGdk.visual_get_best_depth
      __var0
    end

    def self.best_type
      __var0 = LibGdk.visual_get_best_type
      Gdk::VisualType.new(__var0)
    end

    def self.best_with_both(depth : ::Int, visual_type : Gdk::VisualType)
      __var0 = LibGdk.visual_get_best_with_both(Int32.new(depth), visual_type)
      __var1 = Gdk::Visual.new(__var0) if __var0
      __var1
    end

    def self.best_with_depth(depth : ::Int)
      __var0 = LibGdk.visual_get_best_with_depth(Int32.new(depth))
      GObject.raise_unexpected_null("gdk_visual_get_best_with_depth") if __var0.null?
      Gdk::Visual.new(__var0)
    end

    def self.best_with_type(visual_type : Gdk::VisualType)
      __var0 = LibGdk.visual_get_best_with_type(visual_type)
      GObject.raise_unexpected_null("gdk_visual_get_best_with_type") if __var0.null?
      Gdk::Visual.new(__var0)
    end

    def self.system
      __var0 = LibGdk.visual_get_system
      GObject.raise_unexpected_null("gdk_visual_get_system") if __var0.null?
      Gdk::Visual.new(__var0)
    end

    def bits_per_rgb
      __var0 = LibGdk.visual_get_bits_per_rgb(@pointer.as(LibGdk::Visual*))
      __var0
    end

    def blue_pixel_details
      LibGdk.visual_get_blue_pixel_details(@pointer.as(LibGdk::Visual*), out mask, out shift, out precision)
      {mask, shift, precision}
    end

    def byte_order
      __var0 = LibGdk.visual_get_byte_order(@pointer.as(LibGdk::Visual*))
      Gdk::ByteOrder.new(__var0)
    end

    def colormap_size
      __var0 = LibGdk.visual_get_colormap_size(@pointer.as(LibGdk::Visual*))
      __var0
    end

    def depth
      __var0 = LibGdk.visual_get_depth(@pointer.as(LibGdk::Visual*))
      __var0
    end

    def green_pixel_details
      LibGdk.visual_get_green_pixel_details(@pointer.as(LibGdk::Visual*), out mask, out shift, out precision)
      {mask, shift, precision}
    end

    def red_pixel_details
      LibGdk.visual_get_red_pixel_details(@pointer.as(LibGdk::Visual*), out mask, out shift, out precision)
      {mask, shift, precision}
    end

    def screen
      __var0 = LibGdk.visual_get_screen(@pointer.as(LibGdk::Visual*))
      GObject.raise_unexpected_null("gdk_visual_get_screen") if __var0.null?
      Gdk::Screen.new(__var0)
    end

    def visual_type
      __var0 = LibGdk.visual_get_visual_type(@pointer.as(LibGdk::Visual*))
      Gdk::VisualType.new(__var0)
    end
  end

  enum VisualType : UInt32
    STATIC_GRAY  = 0
    GRAYSCALE    = 1
    STATIC_COLOR = 2
    PSEUDO_COLOR = 3
    TRUE_COLOR   = 4
    DIRECT_COLOR = 5
  end

  @[Flags]
  enum WMDecoration : UInt32
    ZERO_NONE =  0
    ALL       =  1
    BORDER    =  2
    RESIZEH   =  4
    TITLE     =  8
    MENU      = 16
    MINIMIZE  = 32
    MAXIMIZE  = 64
  end

  @[Flags]
  enum WMFunction : UInt32
    ZERO_NONE =  0
    ALL       =  1
    RESIZE    =  2
    MOVE      =  4
    MINIMIZE  =  8
    MAXIMIZE  = 16
    CLOSE     = 32
  end

  class Window < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdk::Window*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkWindow")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdk._gdk_window_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::Window*)
    end

    def to_unsafe_window
      @pointer.not_nil!.as(LibGdk::Window*)
    end

    def self.new(parent : Gdk::Window?, attributes : Gdk::WindowAttr, attributes_mask : Gdk::WindowAttributesType) : self
      __var0 = LibGdk.window_new(parent ? parent.to_unsafe_window : Pointer(LibGdk::Window).null, attributes.to_unsafe.as(LibGdk::WindowAttr*), attributes_mask)
      GObject.raise_unexpected_null("gdk_window_new") if __var0.null?
      cast(Gdk::Window.new(__var0))
    end

    def self.at_pointer
      __var0 = LibGdk.window_at_pointer(out win_x, out win_y)
      GObject.raise_unexpected_null("gdk_window_at_pointer") if __var0.null?
      {Gdk::Window.new(__var0), win_x, win_y}
    end

    def self.constrain_size(geometry : Gdk::Geometry, flags : Gdk::WindowHints, width : ::Int, height : ::Int)
      LibGdk.window_constrain_size(geometry.to_unsafe.as(LibGdk::Geometry*), flags, Int32.new(width), Int32.new(height), out new_width, out new_height)
      {new_width, new_height}
    end

    def self.process_all_updates
      LibGdk.window_process_all_updates
      nil
    end

    def self.set_debug_updates(setting : ::Bool)
      LibGdk.window_set_debug_updates(LibC::Int.new(setting ? 1 : 0))
      nil
    end

    def beep
      LibGdk.window_beep(@pointer.as(LibGdk::Window*))
      nil
    end

    def begin_draw_frame(region : Cairo::Region)
      __var0 = LibGdk.window_begin_draw_frame(@pointer.as(LibGdk::Window*), region.to_unsafe.as(LibCairo::Region*))
      GObject.raise_unexpected_null("gdk_window_begin_draw_frame") if __var0.null?
      Gdk::DrawingContext.new(__var0)
    end

    def begin_move_drag(button : ::Int, root_x : ::Int, root_y : ::Int, timestamp : ::Int)
      LibGdk.window_begin_move_drag(@pointer.as(LibGdk::Window*), Int32.new(button), Int32.new(root_x), Int32.new(root_y), UInt32.new(timestamp))
      nil
    end

    def begin_move_drag_for_device(device : Gdk::Device, button : ::Int, root_x : ::Int, root_y : ::Int, timestamp : ::Int)
      LibGdk.window_begin_move_drag_for_device(@pointer.as(LibGdk::Window*), device.to_unsafe_device, Int32.new(button), Int32.new(root_x), Int32.new(root_y), UInt32.new(timestamp))
      nil
    end

    def begin_paint_rect(rectangle : Gdk::Rectangle)
      LibGdk.window_begin_paint_rect(@pointer.as(LibGdk::Window*), rectangle.to_unsafe.as(LibGdk::Rectangle*))
      nil
    end

    def begin_paint_region(region : Cairo::Region)
      LibGdk.window_begin_paint_region(@pointer.as(LibGdk::Window*), region.to_unsafe.as(LibCairo::Region*))
      nil
    end

    def begin_resize_drag(edge : Gdk::WindowEdge, button : ::Int, root_x : ::Int, root_y : ::Int, timestamp : ::Int)
      LibGdk.window_begin_resize_drag(@pointer.as(LibGdk::Window*), edge, Int32.new(button), Int32.new(root_x), Int32.new(root_y), UInt32.new(timestamp))
      nil
    end

    def begin_resize_drag_for_device(edge : Gdk::WindowEdge, device : Gdk::Device, button : ::Int, root_x : ::Int, root_y : ::Int, timestamp : ::Int)
      LibGdk.window_begin_resize_drag_for_device(@pointer.as(LibGdk::Window*), edge, device.to_unsafe_device, Int32.new(button), Int32.new(root_x), Int32.new(root_y), UInt32.new(timestamp))
      nil
    end

    def configure_finished
      LibGdk.window_configure_finished(@pointer.as(LibGdk::Window*))
      nil
    end

    def coords_from_parent(parent_x : ::Float, parent_y : ::Float)
      LibGdk.window_coords_from_parent(@pointer.as(LibGdk::Window*), Float64.new(parent_x), Float64.new(parent_y), out x, out y)
      {x, y}
    end

    def coords_to_parent(x : ::Float, y : ::Float)
      LibGdk.window_coords_to_parent(@pointer.as(LibGdk::Window*), Float64.new(x), Float64.new(y), out parent_x, out parent_y)
      {parent_x, parent_y}
    end

    def create_gl_context
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdk.window_create_gl_context(@pointer.as(LibGdk::Window*), pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("gdk_window_create_gl_context") if __var1.null?
      Gdk::GLContext.new(__var1)
    end

    def create_similar_image_surface(format : ::Int, width : ::Int, height : ::Int, scale : ::Int)
      __var0 = LibGdk.window_create_similar_image_surface(@pointer.as(LibGdk::Window*), Int32.new(format), Int32.new(width), Int32.new(height), Int32.new(scale))
      GObject.raise_unexpected_null("gdk_window_create_similar_image_surface") if __var0.null?
      Cairo::Surface.new(__var0)
    end

    def create_similar_surface(content : Cairo::Content, width : ::Int, height : ::Int)
      __var0 = LibGdk.window_create_similar_surface(@pointer.as(LibGdk::Window*), content, Int32.new(width), Int32.new(height))
      GObject.raise_unexpected_null("gdk_window_create_similar_surface") if __var0.null?
      Cairo::Surface.new(__var0)
    end

    def deiconify
      LibGdk.window_deiconify(@pointer.as(LibGdk::Window*))
      nil
    end

    def destroy
      LibGdk.window_destroy(@pointer.as(LibGdk::Window*))
      nil
    end

    def destroy_notify
      LibGdk.window_destroy_notify(@pointer.as(LibGdk::Window*))
      nil
    end

    def enable_synchronized_configure
      LibGdk.window_enable_synchronized_configure(@pointer.as(LibGdk::Window*))
      nil
    end

    def end_draw_frame(context : Gdk::DrawingContext)
      LibGdk.window_end_draw_frame(@pointer.as(LibGdk::Window*), context.to_unsafe_drawingcontext)
      nil
    end

    def end_paint
      LibGdk.window_end_paint(@pointer.as(LibGdk::Window*))
      nil
    end

    def ensure_native
      __var0 = LibGdk.window_ensure_native(@pointer.as(LibGdk::Window*))
      (__var0 == 1)
    end

    def flush
      LibGdk.window_flush(@pointer.as(LibGdk::Window*))
      nil
    end

    def focus(timestamp : ::Int)
      LibGdk.window_focus(@pointer.as(LibGdk::Window*), UInt32.new(timestamp))
      nil
    end

    def freeze_toplevel_updates_libgtk_only
      LibGdk.window_freeze_toplevel_updates_libgtk_only(@pointer.as(LibGdk::Window*))
      nil
    end

    def freeze_updates
      LibGdk.window_freeze_updates(@pointer.as(LibGdk::Window*))
      nil
    end

    def fullscreen
      LibGdk.window_fullscreen(@pointer.as(LibGdk::Window*))
      nil
    end

    def fullscreen_on_monitor(monitor : ::Int)
      LibGdk.window_fullscreen_on_monitor(@pointer.as(LibGdk::Window*), Int32.new(monitor))
      nil
    end

    def geometry_changed
      LibGdk.window_geometry_changed(@pointer.as(LibGdk::Window*))
      nil
    end

    def accept_focus
      __var0 = LibGdk.window_get_accept_focus(@pointer.as(LibGdk::Window*))
      (__var0 == 1)
    end

    def background_pattern
      __var0 = LibGdk.window_get_background_pattern(@pointer.as(LibGdk::Window*))
      __var1 = Cairo::Pattern.new(__var0) if __var0
      __var1
    end

    def children
      __var0 = LibGdk.window_get_children(@pointer.as(LibGdk::Window*))
      GObject.raise_unexpected_null("gdk_window_get_children") if __var0.null?
      GLib::ListIterator(Gdk::Window, LibGdk::Window*).new(GLib::List.new(__var0.as(LibGLib::List*)))
    end

    def children_with_user_data(user_data : Void*?)
      __var0 = LibGdk.window_get_children_with_user_data(@pointer.as(LibGdk::Window*), user_data ? user_data : Pointer(Void).null)
      GObject.raise_unexpected_null("gdk_window_get_children_with_user_data") if __var0.null?
      GLib::ListIterator(Gdk::Window, LibGdk::Window*).new(GLib::List.new(__var0.as(LibGLib::List*)))
    end

    def clip_region
      __var0 = LibGdk.window_get_clip_region(@pointer.as(LibGdk::Window*))
      GObject.raise_unexpected_null("gdk_window_get_clip_region") if __var0.null?
      Cairo::Region.new(__var0)
    end

    def composited
      __var0 = LibGdk.window_get_composited(@pointer.as(LibGdk::Window*))
      (__var0 == 1)
    end

    def cursor
      __var0 = LibGdk.window_get_cursor(@pointer.as(LibGdk::Window*))
      __var1 = Gdk::Cursor.new(__var0) if __var0
      __var1
    end

    def decorations(decorations : Gdk::WMDecoration)
      __var0 = LibGdk.window_get_decorations(@pointer.as(LibGdk::Window*), decorations)
      (__var0 == 1)
    end

    def device_cursor(device : Gdk::Device)
      __var0 = LibGdk.window_get_device_cursor(@pointer.as(LibGdk::Window*), device.to_unsafe_device)
      __var1 = Gdk::Cursor.new(__var0) if __var0
      __var1
    end

    def device_events(device : Gdk::Device)
      __var0 = LibGdk.window_get_device_events(@pointer.as(LibGdk::Window*), device.to_unsafe_device)
      Gdk::EventMask.new(__var0)
    end

    def device_position(device : Gdk::Device, mask : Gdk::ModifierType?)
      __var0 = LibGdk.window_get_device_position(@pointer.as(LibGdk::Window*), device.to_unsafe_device, out x, out y, mask)
      __var1 = Gdk::Window.new(__var0) if __var0
      {__var1, x, y}
    end

    def device_position_double(device : Gdk::Device, mask : Gdk::ModifierType?)
      __var0 = LibGdk.window_get_device_position_double(@pointer.as(LibGdk::Window*), device.to_unsafe_device, out x, out y, mask)
      __var1 = Gdk::Window.new(__var0) if __var0
      {__var1, x, y}
    end

    def display
      __var0 = LibGdk.window_get_display(@pointer.as(LibGdk::Window*))
      GObject.raise_unexpected_null("gdk_window_get_display") if __var0.null?
      Gdk::Display.new(__var0)
    end

    def drag_protocol(target : Gdk::Window?)
      __var0 = LibGdk.window_get_drag_protocol(@pointer.as(LibGdk::Window*), target)
      Gdk::DragProtocol.new(__var0)
    end

    def effective_parent
      __var0 = LibGdk.window_get_effective_parent(@pointer.as(LibGdk::Window*))
      GObject.raise_unexpected_null("gdk_window_get_effective_parent") if __var0.null?
      Gdk::Window.new(__var0)
    end

    def effective_toplevel
      __var0 = LibGdk.window_get_effective_toplevel(@pointer.as(LibGdk::Window*))
      GObject.raise_unexpected_null("gdk_window_get_effective_toplevel") if __var0.null?
      Gdk::Window.new(__var0)
    end

    def event_compression
      __var0 = LibGdk.window_get_event_compression(@pointer.as(LibGdk::Window*))
      (__var0 == 1)
    end

    def events
      __var0 = LibGdk.window_get_events(@pointer.as(LibGdk::Window*))
      Gdk::EventMask.new(__var0)
    end

    def focus_on_map
      __var0 = LibGdk.window_get_focus_on_map(@pointer.as(LibGdk::Window*))
      (__var0 == 1)
    end

    def frame_clock
      __var0 = LibGdk.window_get_frame_clock(@pointer.as(LibGdk::Window*))
      GObject.raise_unexpected_null("gdk_window_get_frame_clock") if __var0.null?
      Gdk::FrameClock.new(__var0)
    end

    def frame_extents(rect : Gdk::Rectangle)
      LibGdk.window_get_frame_extents(@pointer.as(LibGdk::Window*), rect)
      nil
    end

    def fullscreen_mode
      __var0 = LibGdk.window_get_fullscreen_mode(@pointer.as(LibGdk::Window*))
      Gdk::FullscreenMode.new(__var0)
    end

    def geometry
      LibGdk.window_get_geometry(@pointer.as(LibGdk::Window*), out x, out y, out width, out height)
      {x, y, width, height}
    end

    def group
      __var0 = LibGdk.window_get_group(@pointer.as(LibGdk::Window*))
      GObject.raise_unexpected_null("gdk_window_get_group") if __var0.null?
      Gdk::Window.new(__var0)
    end

    def height
      __var0 = LibGdk.window_get_height(@pointer.as(LibGdk::Window*))
      __var0
    end

    def modal_hint
      __var0 = LibGdk.window_get_modal_hint(@pointer.as(LibGdk::Window*))
      (__var0 == 1)
    end

    def origin
      __var0 = LibGdk.window_get_origin(@pointer.as(LibGdk::Window*), out x, out y)
      {__var0, x, y}
    end

    def parent
      __var0 = LibGdk.window_get_parent(@pointer.as(LibGdk::Window*))
      GObject.raise_unexpected_null("gdk_window_get_parent") if __var0.null?
      Gdk::Window.new(__var0)
    end

    def pass_through
      __var0 = LibGdk.window_get_pass_through(@pointer.as(LibGdk::Window*))
      (__var0 == 1)
    end

    def pointer(mask : Gdk::ModifierType?)
      __var0 = LibGdk.window_get_pointer(@pointer.as(LibGdk::Window*), out x, out y, mask)
      __var1 = Gdk::Window.new(__var0) if __var0
      {__var1, x, y}
    end

    def position
      LibGdk.window_get_position(@pointer.as(LibGdk::Window*), out x, out y)
      {x, y}
    end

    def root_coords(x : ::Int, y : ::Int)
      LibGdk.window_get_root_coords(@pointer.as(LibGdk::Window*), Int32.new(x), Int32.new(y), out root_x, out root_y)
      {root_x, root_y}
    end

    def root_origin
      LibGdk.window_get_root_origin(@pointer.as(LibGdk::Window*), out x, out y)
      {x, y}
    end

    def scale_factor
      __var0 = LibGdk.window_get_scale_factor(@pointer.as(LibGdk::Window*))
      __var0
    end

    def screen
      __var0 = LibGdk.window_get_screen(@pointer.as(LibGdk::Window*))
      GObject.raise_unexpected_null("gdk_window_get_screen") if __var0.null?
      Gdk::Screen.new(__var0)
    end

    def source_events(source : Gdk::InputSource)
      __var0 = LibGdk.window_get_source_events(@pointer.as(LibGdk::Window*), source)
      Gdk::EventMask.new(__var0)
    end

    def state
      __var0 = LibGdk.window_get_state(@pointer.as(LibGdk::Window*))
      Gdk::WindowState.new(__var0)
    end

    def support_multidevice
      __var0 = LibGdk.window_get_support_multidevice(@pointer.as(LibGdk::Window*))
      (__var0 == 1)
    end

    def toplevel
      __var0 = LibGdk.window_get_toplevel(@pointer.as(LibGdk::Window*))
      GObject.raise_unexpected_null("gdk_window_get_toplevel") if __var0.null?
      Gdk::Window.new(__var0)
    end

    def type_hint
      __var0 = LibGdk.window_get_type_hint(@pointer.as(LibGdk::Window*))
      Gdk::WindowTypeHint.new(__var0)
    end

    def update_area
      __var0 = LibGdk.window_get_update_area(@pointer.as(LibGdk::Window*))
      GObject.raise_unexpected_null("gdk_window_get_update_area") if __var0.null?
      Cairo::Region.new(__var0)
    end

    def user_data(data : Void*?)
      LibGdk.window_get_user_data(@pointer.as(LibGdk::Window*), data)
      nil
    end

    def visible_region
      __var0 = LibGdk.window_get_visible_region(@pointer.as(LibGdk::Window*))
      GObject.raise_unexpected_null("gdk_window_get_visible_region") if __var0.null?
      Cairo::Region.new(__var0)
    end

    def visual
      __var0 = LibGdk.window_get_visual(@pointer.as(LibGdk::Window*))
      GObject.raise_unexpected_null("gdk_window_get_visual") if __var0.null?
      Gdk::Visual.new(__var0)
    end

    def width
      __var0 = LibGdk.window_get_width(@pointer.as(LibGdk::Window*))
      __var0
    end

    def window_type
      __var0 = LibGdk.window_get_window_type(@pointer.as(LibGdk::Window*))
      Gdk::WindowType.new(__var0)
    end

    def has_native
      __var0 = LibGdk.window_has_native(@pointer.as(LibGdk::Window*))
      (__var0 == 1)
    end

    def hide
      LibGdk.window_hide(@pointer.as(LibGdk::Window*))
      nil
    end

    def iconify
      LibGdk.window_iconify(@pointer.as(LibGdk::Window*))
      nil
    end

    def input_shape_combine_region(shape_region : Cairo::Region, offset_x : ::Int, offset_y : ::Int)
      LibGdk.window_input_shape_combine_region(@pointer.as(LibGdk::Window*), shape_region.to_unsafe.as(LibCairo::Region*), Int32.new(offset_x), Int32.new(offset_y))
      nil
    end

    def invalidate_maybe_recurse(region : Cairo::Region, child_func : Gdk::WindowChildFunc?, user_data : Void*?)
      LibGdk.window_invalidate_maybe_recurse(@pointer.as(LibGdk::Window*), region.to_unsafe.as(LibCairo::Region*), child_func ? child_func : nil, user_data ? user_data : Pointer(Void).null)
      nil
    end

    def invalidate_rect(rect : Gdk::Rectangle?, invalidate_children : ::Bool)
      LibGdk.window_invalidate_rect(@pointer.as(LibGdk::Window*), rect ? rect.to_unsafe.as(LibGdk::Rectangle*) : Pointer(LibGdk::Rectangle).null, LibC::Int.new(invalidate_children ? 1 : 0))
      nil
    end

    def invalidate_region(region : Cairo::Region, invalidate_children : ::Bool)
      LibGdk.window_invalidate_region(@pointer.as(LibGdk::Window*), region.to_unsafe.as(LibCairo::Region*), LibC::Int.new(invalidate_children ? 1 : 0))
      nil
    end

    def destroyed?
      __var0 = LibGdk.window_is_destroyed(@pointer.as(LibGdk::Window*))
      (__var0 == 1)
    end

    def input_only?
      __var0 = LibGdk.window_is_input_only(@pointer.as(LibGdk::Window*))
      (__var0 == 1)
    end

    def shaped?
      __var0 = LibGdk.window_is_shaped(@pointer.as(LibGdk::Window*))
      (__var0 == 1)
    end

    def viewable?
      __var0 = LibGdk.window_is_viewable(@pointer.as(LibGdk::Window*))
      (__var0 == 1)
    end

    def visible?
      __var0 = LibGdk.window_is_visible(@pointer.as(LibGdk::Window*))
      (__var0 == 1)
    end

    def lower
      LibGdk.window_lower(@pointer.as(LibGdk::Window*))
      nil
    end

    def mark_paint_from_clip(cr : Cairo::Context)
      LibGdk.window_mark_paint_from_clip(@pointer.as(LibGdk::Window*), cr.to_unsafe.as(LibCairo::Context*))
      nil
    end

    def maximize
      LibGdk.window_maximize(@pointer.as(LibGdk::Window*))
      nil
    end

    def merge_child_input_shapes
      LibGdk.window_merge_child_input_shapes(@pointer.as(LibGdk::Window*))
      nil
    end

    def merge_child_shapes
      LibGdk.window_merge_child_shapes(@pointer.as(LibGdk::Window*))
      nil
    end

    def move(x : ::Int, y : ::Int)
      LibGdk.window_move(@pointer.as(LibGdk::Window*), Int32.new(x), Int32.new(y))
      nil
    end

    def move_region(region : Cairo::Region, dx : ::Int, dy : ::Int)
      LibGdk.window_move_region(@pointer.as(LibGdk::Window*), region.to_unsafe.as(LibCairo::Region*), Int32.new(dx), Int32.new(dy))
      nil
    end

    def move_resize(x : ::Int, y : ::Int, width : ::Int, height : ::Int)
      LibGdk.window_move_resize(@pointer.as(LibGdk::Window*), Int32.new(x), Int32.new(y), Int32.new(width), Int32.new(height))
      nil
    end

    def move_to_rect(rect : Gdk::Rectangle, rect_anchor : Gdk::Gravity, window_anchor : Gdk::Gravity, anchor_hints : Gdk::AnchorHints, rect_anchor_dx : ::Int, rect_anchor_dy : ::Int)
      LibGdk.window_move_to_rect(@pointer.as(LibGdk::Window*), rect.to_unsafe.as(LibGdk::Rectangle*), rect_anchor, window_anchor, anchor_hints, Int32.new(rect_anchor_dx), Int32.new(rect_anchor_dy))
      nil
    end

    def peek_children
      __var0 = LibGdk.window_peek_children(@pointer.as(LibGdk::Window*))
      GObject.raise_unexpected_null("gdk_window_peek_children") if __var0.null?
      GLib::ListIterator(Gdk::Window, LibGdk::Window*).new(GLib::List.new(__var0.as(LibGLib::List*)))
    end

    def process_updates(update_children : ::Bool)
      LibGdk.window_process_updates(@pointer.as(LibGdk::Window*), LibC::Int.new(update_children ? 1 : 0))
      nil
    end

    def raise
      LibGdk.window_raise(@pointer.as(LibGdk::Window*))
      nil
    end

    def register_dnd
      LibGdk.window_register_dnd(@pointer.as(LibGdk::Window*))
      nil
    end

    def reparent(new_parent : Gdk::Window, x : ::Int, y : ::Int)
      LibGdk.window_reparent(@pointer.as(LibGdk::Window*), new_parent.to_unsafe_window, Int32.new(x), Int32.new(y))
      nil
    end

    def resize(width : ::Int, height : ::Int)
      LibGdk.window_resize(@pointer.as(LibGdk::Window*), Int32.new(width), Int32.new(height))
      nil
    end

    def restack(sibling : Gdk::Window?, above : ::Bool)
      LibGdk.window_restack(@pointer.as(LibGdk::Window*), sibling ? sibling.to_unsafe_window : Pointer(LibGdk::Window).null, LibC::Int.new(above ? 1 : 0))
      nil
    end

    def scroll(dx : ::Int, dy : ::Int)
      LibGdk.window_scroll(@pointer.as(LibGdk::Window*), Int32.new(dx), Int32.new(dy))
      nil
    end

    def accept_focus=(accept_focus : ::Bool)
      LibGdk.window_set_accept_focus(@pointer.as(LibGdk::Window*), LibC::Int.new(accept_focus ? 1 : 0))
      nil
    end

    def background=(color : Gdk::Color)
      LibGdk.window_set_background(@pointer.as(LibGdk::Window*), color.to_unsafe.as(LibGdk::Color*))
      nil
    end

    def background_pattern=(pattern : Cairo::Pattern?)
      LibGdk.window_set_background_pattern(@pointer.as(LibGdk::Window*), pattern ? pattern.to_unsafe.as(LibCairo::Pattern*) : Pointer(LibCairo::Pattern).null)
      nil
    end

    def background_rgba=(rgba : Gdk::RGBA)
      LibGdk.window_set_background_rgba(@pointer.as(LibGdk::Window*), rgba.to_unsafe.as(LibGdk::RGBA*))
      nil
    end

    def set_child_input_shapes
      LibGdk.window_set_child_input_shapes(@pointer.as(LibGdk::Window*))
      nil
    end

    def set_child_shapes
      LibGdk.window_set_child_shapes(@pointer.as(LibGdk::Window*))
      nil
    end

    def composited=(composited : ::Bool)
      LibGdk.window_set_composited(@pointer.as(LibGdk::Window*), LibC::Int.new(composited ? 1 : 0))
      nil
    end

    def cursor=(cursor : Gdk::Cursor?)
      LibGdk.window_set_cursor(@pointer.as(LibGdk::Window*), cursor ? cursor.to_unsafe_cursor : Pointer(LibGdk::Cursor).null)
      nil
    end

    def decorations=(decorations : Gdk::WMDecoration)
      LibGdk.window_set_decorations(@pointer.as(LibGdk::Window*), decorations)
      nil
    end

    def set_device_cursor(device : Gdk::Device, cursor : Gdk::Cursor)
      LibGdk.window_set_device_cursor(@pointer.as(LibGdk::Window*), device.to_unsafe_device, cursor.to_unsafe_cursor)
      nil
    end

    def set_device_events(device : Gdk::Device, event_mask : Gdk::EventMask)
      LibGdk.window_set_device_events(@pointer.as(LibGdk::Window*), device.to_unsafe_device, event_mask)
      nil
    end

    def event_compression=(event_compression : ::Bool)
      LibGdk.window_set_event_compression(@pointer.as(LibGdk::Window*), LibC::Int.new(event_compression ? 1 : 0))
      nil
    end

    def events=(event_mask : Gdk::EventMask)
      LibGdk.window_set_events(@pointer.as(LibGdk::Window*), event_mask)
      nil
    end

    def focus_on_map=(focus_on_map : ::Bool)
      LibGdk.window_set_focus_on_map(@pointer.as(LibGdk::Window*), LibC::Int.new(focus_on_map ? 1 : 0))
      nil
    end

    def fullscreen_mode=(mode : Gdk::FullscreenMode)
      LibGdk.window_set_fullscreen_mode(@pointer.as(LibGdk::Window*), mode)
      nil
    end

    def functions=(functions : Gdk::WMFunction)
      LibGdk.window_set_functions(@pointer.as(LibGdk::Window*), functions)
      nil
    end

    def set_geometry_hints(geometry : Gdk::Geometry, geom_mask : Gdk::WindowHints)
      LibGdk.window_set_geometry_hints(@pointer.as(LibGdk::Window*), geometry.to_unsafe.as(LibGdk::Geometry*), geom_mask)
      nil
    end

    def group=(leader : Gdk::Window?)
      LibGdk.window_set_group(@pointer.as(LibGdk::Window*), leader ? leader.to_unsafe_window : Pointer(LibGdk::Window).null)
      nil
    end

    def icon_list=(pixbufs : Void*)
      LibGdk.window_set_icon_list(@pointer.as(LibGdk::Window*), pixbufs)
      nil
    end

    def icon_name=(name : ::String?)
      LibGdk.window_set_icon_name(@pointer.as(LibGdk::Window*), name ? name.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def keep_above=(setting : ::Bool)
      LibGdk.window_set_keep_above(@pointer.as(LibGdk::Window*), LibC::Int.new(setting ? 1 : 0))
      nil
    end

    def keep_below=(setting : ::Bool)
      LibGdk.window_set_keep_below(@pointer.as(LibGdk::Window*), LibC::Int.new(setting ? 1 : 0))
      nil
    end

    def modal_hint=(modal : ::Bool)
      LibGdk.window_set_modal_hint(@pointer.as(LibGdk::Window*), LibC::Int.new(modal ? 1 : 0))
      nil
    end

    def opacity=(opacity : ::Float)
      LibGdk.window_set_opacity(@pointer.as(LibGdk::Window*), Float64.new(opacity))
      nil
    end

    def opaque_region=(region : Cairo::Region?)
      LibGdk.window_set_opaque_region(@pointer.as(LibGdk::Window*), region ? region.to_unsafe.as(LibCairo::Region*) : Pointer(LibCairo::Region).null)
      nil
    end

    def override_redirect=(override_redirect : ::Bool)
      LibGdk.window_set_override_redirect(@pointer.as(LibGdk::Window*), LibC::Int.new(override_redirect ? 1 : 0))
      nil
    end

    def pass_through=(pass_through : ::Bool)
      LibGdk.window_set_pass_through(@pointer.as(LibGdk::Window*), LibC::Int.new(pass_through ? 1 : 0))
      nil
    end

    def role=(role : ::String)
      LibGdk.window_set_role(@pointer.as(LibGdk::Window*), role.to_unsafe)
      nil
    end

    def set_shadow_width(left : ::Int, right : ::Int, top : ::Int, bottom : ::Int)
      LibGdk.window_set_shadow_width(@pointer.as(LibGdk::Window*), Int32.new(left), Int32.new(right), Int32.new(top), Int32.new(bottom))
      nil
    end

    def skip_pager_hint=(skips_pager : ::Bool)
      LibGdk.window_set_skip_pager_hint(@pointer.as(LibGdk::Window*), LibC::Int.new(skips_pager ? 1 : 0))
      nil
    end

    def skip_taskbar_hint=(skips_taskbar : ::Bool)
      LibGdk.window_set_skip_taskbar_hint(@pointer.as(LibGdk::Window*), LibC::Int.new(skips_taskbar ? 1 : 0))
      nil
    end

    def set_source_events(source : Gdk::InputSource, event_mask : Gdk::EventMask)
      LibGdk.window_set_source_events(@pointer.as(LibGdk::Window*), source, event_mask)
      nil
    end

    def startup_id=(startup_id : ::String)
      LibGdk.window_set_startup_id(@pointer.as(LibGdk::Window*), startup_id.to_unsafe)
      nil
    end

    def static_gravities=(use_static : ::Bool)
      __var0 = LibGdk.window_set_static_gravities(@pointer.as(LibGdk::Window*), LibC::Int.new(use_static ? 1 : 0))
      (__var0 == 1)
    end

    def support_multidevice=(support_multidevice : ::Bool)
      LibGdk.window_set_support_multidevice(@pointer.as(LibGdk::Window*), LibC::Int.new(support_multidevice ? 1 : 0))
      nil
    end

    def title=(title : ::String)
      LibGdk.window_set_title(@pointer.as(LibGdk::Window*), title.to_unsafe)
      nil
    end

    def transient_for=(parent : Gdk::Window)
      LibGdk.window_set_transient_for(@pointer.as(LibGdk::Window*), parent.to_unsafe_window)
      nil
    end

    def type_hint=(hint : Gdk::WindowTypeHint)
      LibGdk.window_set_type_hint(@pointer.as(LibGdk::Window*), hint)
      nil
    end

    def urgency_hint=(urgent : ::Bool)
      LibGdk.window_set_urgency_hint(@pointer.as(LibGdk::Window*), LibC::Int.new(urgent ? 1 : 0))
      nil
    end

    def user_data=(user_data : GObject::Object?)
      LibGdk.window_set_user_data(@pointer.as(LibGdk::Window*), user_data ? user_data.to_unsafe_object : Pointer(LibGObject::Object).null)
      nil
    end

    def shape_combine_region(shape_region : Cairo::Region?, offset_x : ::Int, offset_y : ::Int)
      LibGdk.window_shape_combine_region(@pointer.as(LibGdk::Window*), shape_region ? shape_region.to_unsafe.as(LibCairo::Region*) : Pointer(LibCairo::Region).null, Int32.new(offset_x), Int32.new(offset_y))
      nil
    end

    def show
      LibGdk.window_show(@pointer.as(LibGdk::Window*))
      nil
    end

    def show_unraised
      LibGdk.window_show_unraised(@pointer.as(LibGdk::Window*))
      nil
    end

    def show_window_menu(event : Gdk::Event::Union)
      __var0 = LibGdk.window_show_window_menu(@pointer.as(LibGdk::Window*), event.to_unsafe.as(LibGdk::Event*))
      (__var0 == 1)
    end

    def stick
      LibGdk.window_stick(@pointer.as(LibGdk::Window*))
      nil
    end

    def thaw_toplevel_updates_libgtk_only
      LibGdk.window_thaw_toplevel_updates_libgtk_only(@pointer.as(LibGdk::Window*))
      nil
    end

    def thaw_updates
      LibGdk.window_thaw_updates(@pointer.as(LibGdk::Window*))
      nil
    end

    def unfullscreen
      LibGdk.window_unfullscreen(@pointer.as(LibGdk::Window*))
      nil
    end

    def unmaximize
      LibGdk.window_unmaximize(@pointer.as(LibGdk::Window*))
      nil
    end

    def unstick
      LibGdk.window_unstick(@pointer.as(LibGdk::Window*))
      nil
    end

    def withdraw
      LibGdk.window_withdraw(@pointer.as(LibGdk::Window*))
      nil
    end

    alias CreateSurfaceSignal = Window, Int32, Int32 -> Cairo::Surface

    def on_create_surface(*, after = false, &block : CreateSurfaceSignal)
      __var0 = ->(arg0 : LibGdk::Window*, arg1 : Int32, arg2 : Int32, box : Void*) {
        ::Box(CreateSurfaceSignal).unbox(box).call(Window.new(arg0), arg1, arg2)
      }

      __var1 = ::Box.box(CreateSurfaceSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "create-surface", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_create_surface(&block : CreateSurfaceSignal)
      on_create_surface(after: true, &block)
    end

    alias FromEmbedderSignal = Window, Float64, Float64, Float64, Float64 -> Nil

    def on_from_embedder(*, after = false, &block : FromEmbedderSignal)
      __var0 = ->(arg0 : LibGdk::Window*, arg1 : Float64, arg2 : Float64, arg3 : Float64, arg4 : Float64, box : Void*) {
        ::Box(FromEmbedderSignal).unbox(box).call(Window.new(arg0), arg1, arg2, arg3, arg4)
      }

      __var1 = ::Box.box(FromEmbedderSignal.new { |arg0, arg1, arg2, arg3, arg4|
        block.call(arg0, arg1, arg2, arg3, arg4)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "from-embedder", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_from_embedder(&block : FromEmbedderSignal)
      on_from_embedder(after: true, &block)
    end

    alias MovedToRectSignal = Window, Void*?, Void*?, ::Bool, ::Bool -> Nil

    def on_moved_to_rect(*, after = false, &block : MovedToRectSignal)
      __var0 = ->(arg0 : LibGdk::Window*, arg1 : Pointer(Void), arg2 : Pointer(Void), arg3 : LibC::Int, arg4 : LibC::Int, box : Void*) {
        ::Box(MovedToRectSignal).unbox(box).call(Window.new(arg0), arg1, arg2, (arg3 == 1), (arg4 == 1))
      }

      __var1 = ::Box.box(MovedToRectSignal.new { |arg0, arg1, arg2, arg3, arg4|
        block.call(arg0, arg1, arg2, arg3, arg4)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "moved-to-rect", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_moved_to_rect(&block : MovedToRectSignal)
      on_moved_to_rect(after: true, &block)
    end

    alias PickEmbeddedChildSignal = Window, Float64, Float64 -> Gdk::Window

    def on_pick_embedded_child(*, after = false, &block : PickEmbeddedChildSignal)
      __var0 = ->(arg0 : LibGdk::Window*, arg1 : Float64, arg2 : Float64, box : Void*) {
        ::Box(PickEmbeddedChildSignal).unbox(box).call(Window.new(arg0), arg1, arg2)
      }

      __var1 = ::Box.box(PickEmbeddedChildSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "pick-embedded-child", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_pick_embedded_child(&block : PickEmbeddedChildSignal)
      on_pick_embedded_child(after: true, &block)
    end

    alias ToEmbedderSignal = Window, Float64, Float64, Float64, Float64 -> Nil

    def on_to_embedder(*, after = false, &block : ToEmbedderSignal)
      __var0 = ->(arg0 : LibGdk::Window*, arg1 : Float64, arg2 : Float64, arg3 : Float64, arg4 : Float64, box : Void*) {
        ::Box(ToEmbedderSignal).unbox(box).call(Window.new(arg0), arg1, arg2, arg3, arg4)
      }

      __var1 = ::Box.box(ToEmbedderSignal.new { |arg0, arg1, arg2, arg3, arg4|
        block.call(arg0, arg1, arg2, arg3, arg4)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "to-embedder", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_to_embedder(&block : ToEmbedderSignal)
      on_to_embedder(after: true, &block)
    end
  end

  class WindowAttr
    include GObject::WrappedType

    def self.new(title : ::String? = nil, event_mask : Int32? = nil, x : Int32? = nil, y : Int32? = nil, width : Int32? = nil, height : Int32? = nil, wclass : Gdk::WindowWindowClass? = nil, visual : Gdk::Visual? = nil, window_type : Gdk::WindowType? = nil, cursor : Gdk::Cursor? = nil, wmclass_name : ::String? = nil, wmclass_class : ::String? = nil, override_redirect : ::Bool? = nil, type_hint : Gdk::WindowTypeHint? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(80u64, 0u8).as(LibGdk::WindowAttr*))
      __var0.title = title unless title.nil?
      __var0.event_mask = event_mask unless event_mask.nil?
      __var0.x = x unless x.nil?
      __var0.y = y unless y.nil?
      __var0.width = width unless width.nil?
      __var0.height = height unless height.nil?
      __var0.wclass = wclass unless wclass.nil?
      __var0.visual = visual unless visual.nil?
      __var0.window_type = window_type unless window_type.nil?
      __var0.cursor = cursor unless cursor.nil?
      __var0.wmclass_name = wmclass_name unless wmclass_name.nil?
      __var0.wmclass_class = wmclass_class unless wmclass_class.nil?
      __var0.override_redirect = override_redirect unless override_redirect.nil?
      __var0.type_hint = type_hint unless type_hint.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::WindowAttr*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::WindowAttr*)
    end

    def to_unsafe_windowattr
      @pointer.not_nil!.as(LibGdk::WindowAttr*)
    end

    def title
      ::String.new(to_unsafe.as(LibGdk::WindowAttr*).value.title)
    end

    def title=(value : ::String)
      to_unsafe.as(LibGdk::WindowAttr*).value.title = value.to_unsafe
    end

    def event_mask
      to_unsafe.as(LibGdk::WindowAttr*).value.event_mask
    end

    def event_mask=(value : Int32)
      to_unsafe.as(LibGdk::WindowAttr*).value.event_mask = Int32.new(value)
    end

    def x
      to_unsafe.as(LibGdk::WindowAttr*).value.x
    end

    def x=(value : Int32)
      to_unsafe.as(LibGdk::WindowAttr*).value.x = Int32.new(value)
    end

    def y
      to_unsafe.as(LibGdk::WindowAttr*).value.y
    end

    def y=(value : Int32)
      to_unsafe.as(LibGdk::WindowAttr*).value.y = Int32.new(value)
    end

    def width
      to_unsafe.as(LibGdk::WindowAttr*).value.width
    end

    def width=(value : Int32)
      to_unsafe.as(LibGdk::WindowAttr*).value.width = Int32.new(value)
    end

    def height
      to_unsafe.as(LibGdk::WindowAttr*).value.height
    end

    def height=(value : Int32)
      to_unsafe.as(LibGdk::WindowAttr*).value.height = Int32.new(value)
    end

    def wclass
      Gdk::WindowWindowClass.new(to_unsafe.as(LibGdk::WindowAttr*).value.wclass)
    end

    def wclass=(value : Gdk::WindowWindowClass)
      to_unsafe.as(LibGdk::WindowAttr*).value.wclass = value
    end

    def visual
      Gdk::Visual.new(to_unsafe.as(LibGdk::WindowAttr*).value.visual)
    end

    def visual=(value : Gdk::Visual)
      to_unsafe.as(LibGdk::WindowAttr*).value.visual = value.to_unsafe_visual
    end

    def window_type
      Gdk::WindowType.new(to_unsafe.as(LibGdk::WindowAttr*).value.window_type)
    end

    def window_type=(value : Gdk::WindowType)
      to_unsafe.as(LibGdk::WindowAttr*).value.window_type = value
    end

    def cursor
      Gdk::Cursor.new(to_unsafe.as(LibGdk::WindowAttr*).value.cursor)
    end

    def cursor=(value : Gdk::Cursor)
      to_unsafe.as(LibGdk::WindowAttr*).value.cursor = value.to_unsafe_cursor
    end

    def wmclass_name
      ::String.new(to_unsafe.as(LibGdk::WindowAttr*).value.wmclass_name)
    end

    def wmclass_name=(value : ::String)
      to_unsafe.as(LibGdk::WindowAttr*).value.wmclass_name = value.to_unsafe
    end

    def wmclass_class
      ::String.new(to_unsafe.as(LibGdk::WindowAttr*).value.wmclass_class)
    end

    def wmclass_class=(value : ::String)
      to_unsafe.as(LibGdk::WindowAttr*).value.wmclass_class = value.to_unsafe
    end

    def override_redirect
      (to_unsafe.as(LibGdk::WindowAttr*).value.override_redirect == 1)
    end

    def override_redirect=(value : ::Bool)
      to_unsafe.as(LibGdk::WindowAttr*).value.override_redirect = LibC::Int.new(value ? 1 : 0)
    end

    def type_hint
      Gdk::WindowTypeHint.new(to_unsafe.as(LibGdk::WindowAttr*).value.type_hint)
    end

    def type_hint=(value : Gdk::WindowTypeHint)
      to_unsafe.as(LibGdk::WindowAttr*).value.type_hint = value
    end
  end

  @[Flags]
  enum WindowAttributesType : UInt32
    ZERO_NONE =   0
    TITLE     =   2
    X         =   4
    Y         =   8
    CURSOR    =  16
    VISUAL    =  32
    WMCLASS   =  64
    NOREDIR   = 128
    TYPE_HINT = 256
  end
  alias WindowChildFunc = LibGdk::WindowChildFunc

  class WindowClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(232u64, 0u8).as(LibGdk::WindowClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGdk::WindowClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::WindowClass*)
    end

    def to_unsafe_windowclass
      @pointer.not_nil!.as(LibGdk::WindowClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGdk::WindowClass*).value.parent_class)
    end

    def pick_embedded_child
      to_unsafe.as(LibGdk::WindowClass*).value.pick_embedded_child
    end

    def to_embedder
      to_unsafe.as(LibGdk::WindowClass*).value.to_embedder
    end

    def from_embedder
      to_unsafe.as(LibGdk::WindowClass*).value.from_embedder
    end

    def create_surface
      to_unsafe.as(LibGdk::WindowClass*).value.create_surface
    end

    def _gdk_reserved1
      to_unsafe.as(LibGdk::WindowClass*).value._gdk_reserved1
    end

    def _gdk_reserved2
      to_unsafe.as(LibGdk::WindowClass*).value._gdk_reserved2
    end

    def _gdk_reserved3
      to_unsafe.as(LibGdk::WindowClass*).value._gdk_reserved3
    end

    def _gdk_reserved4
      to_unsafe.as(LibGdk::WindowClass*).value._gdk_reserved4
    end

    def _gdk_reserved5
      to_unsafe.as(LibGdk::WindowClass*).value._gdk_reserved5
    end

    def _gdk_reserved6
      to_unsafe.as(LibGdk::WindowClass*).value._gdk_reserved6
    end

    def _gdk_reserved7
      to_unsafe.as(LibGdk::WindowClass*).value._gdk_reserved7
    end

    def _gdk_reserved8
      to_unsafe.as(LibGdk::WindowClass*).value._gdk_reserved8
    end
  end

  enum WindowEdge : UInt32
    NORTH_WEST = 0
    NORTH      = 1
    NORTH_EAST = 2
    WEST       = 3
    EAST       = 4
    SOUTH_WEST = 5
    SOUTH      = 6
    SOUTH_EAST = 7
  end

  @[Flags]
  enum WindowHints : UInt32
    ZERO_NONE   =   0
    POS         =   1
    MIN_SIZE    =   2
    MAX_SIZE    =   4
    BASE_SIZE   =   8
    ASPECT      =  16
    RESIZE_INC  =  32
    WIN_GRAVITY =  64
    USER_POS    = 128
    USER_SIZE   = 256
  end
  alias WindowInvalidateHandlerFunc = LibGdk::WindowInvalidateHandlerFunc

  class WindowRedirect
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGdk::WindowRedirect*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::WindowRedirect*)
    end

    def to_unsafe_windowredirect
      @pointer.not_nil!.as(LibGdk::WindowRedirect*)
    end
  end

  @[Flags]
  enum WindowState : UInt32
    ZERO_NONE        =     0
    WITHDRAWN        =     1
    ICONIFIED        =     2
    MAXIMIZED        =     4
    STICKY           =     8
    FULLSCREEN       =    16
    ABOVE            =    32
    BELOW            =    64
    FOCUSED          =   128
    TILED            =   256
    TOP_TILED        =   512
    TOP_RESIZABLE    =  1024
    RIGHT_TILED      =  2048
    RIGHT_RESIZABLE  =  4096
    BOTTOM_TILED     =  8192
    BOTTOM_RESIZABLE = 16384
    LEFT_TILED       = 32768
    LEFT_RESIZABLE   = 65536
  end

  enum WindowType : UInt32
    ROOT       = 0
    TOPLEVEL   = 1
    CHILD      = 2
    TEMP       = 3
    FOREIGN    = 4
    OFFSCREEN  = 5
    SUBSURFACE = 6
  end

  enum WindowTypeHint : UInt32
    NORMAL        =  0
    DIALOG        =  1
    MENU          =  2
    TOOLBAR       =  3
    SPLASHSCREEN  =  4
    UTILITY       =  5
    DOCK          =  6
    DESKTOP       =  7
    DROPDOWN_MENU =  8
    POPUP_MENU    =  9
    TOOLTIP       = 10
    NOTIFICATION  = 11
    COMBO         = 12
    DND           = 13
  end

  enum WindowWindowClass : UInt32
    INPUT_OUTPUT = 0
    INPUT_ONLY   = 1
  end
end
