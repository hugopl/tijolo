require_gobject("xlib", "2.0")
require_gobject("GLib", "2.0")
require_gobject("Gdk", "3.0")
require_gobject("GdkPixbuf", "2.0")
require_gobject("cairo", "1.0")
require_gobject("Gtk", "3.0")
require_gobject("GObject", "2.0")
require_gobject("Pango", "1.0")
require_gobject("Gio", "2.0")
require_gobject("GModule", "2.0")
require_gobject("Atk", "1.0")

@[Link("vte-2.91", pkg_config: "vte-2.91")]
lib LibVte
  ###########################################
  # #    Structs
  ###########################################

  struct CharAttributes # struct
    row : Int64
    column : Int64
    fore : LibPango::Color
    back : LibPango::Color
    underline : UInt32
    strikethrough : UInt32
    columns : UInt32
  end

  struct PtyClass # struct
    _data : UInt8[0]
  end

  struct Regex # struct
    _data : UInt8[0]
  end

  fun _vte_regex_get_type = vte_regex_get_type : UInt64
  fun regex_new_for_match = vte_regex_new_for_match(pattern : Pointer(UInt8), pattern_length : Int64, flags : UInt32, error : LibGLib::Error**) : Pointer(LibVte::Regex)
  fun regex_new_for_search = vte_regex_new_for_search(pattern : Pointer(UInt8), pattern_length : Int64, flags : UInt32, error : LibGLib::Error**) : Pointer(LibVte::Regex)
  fun regex_jit = vte_regex_jit(this : Regex*, flags : UInt32, error : LibGLib::Error**) : LibC::Int
  fun regex_ref = vte_regex_ref(this : Regex*) : Pointer(LibVte::Regex)
  fun regex_substitute = vte_regex_substitute(this : Regex*, subject : Pointer(UInt8), replacement : Pointer(UInt8), flags : UInt32, error : LibGLib::Error**) : Pointer(UInt8)
  fun regex_unref = vte_regex_unref(this : Regex*) : Pointer(LibVte::Regex)

  struct TerminalClass # struct
    parent_class : LibGtk::WidgetClass
    eof : Pointer(LibVte::Terminal) -> Void
    child_exited : Pointer(LibVte::Terminal), Int32 -> Void
    encoding_changed : Pointer(LibVte::Terminal) -> Void
    char_size_changed : Pointer(LibVte::Terminal), UInt32, UInt32 -> Void
    window_title_changed : Pointer(LibVte::Terminal) -> Void
    icon_title_changed : Pointer(LibVte::Terminal) -> Void
    selection_changed : Pointer(LibVte::Terminal) -> Void
    contents_changed : Pointer(LibVte::Terminal) -> Void
    cursor_moved : Pointer(LibVte::Terminal) -> Void
    commit : Pointer(LibVte::Terminal), Pointer(UInt8), UInt32 -> Void
    deiconify_window : Pointer(LibVte::Terminal) -> Void
    iconify_window : Pointer(LibVte::Terminal) -> Void
    raise_window : Pointer(LibVte::Terminal) -> Void
    lower_window : Pointer(LibVte::Terminal) -> Void
    refresh_window : Pointer(LibVte::Terminal) -> Void
    restore_window : Pointer(LibVte::Terminal) -> Void
    maximize_window : Pointer(LibVte::Terminal) -> Void
    resize_window : Pointer(LibVte::Terminal), UInt32, UInt32 -> Void
    move_window : Pointer(LibVte::Terminal), UInt32, UInt32 -> Void
    increase_font_size : Pointer(LibVte::Terminal) -> Void
    decrease_font_size : Pointer(LibVte::Terminal) -> Void
    text_modified : Pointer(LibVte::Terminal) -> Void
    text_inserted : Pointer(LibVte::Terminal) -> Void
    text_deleted : Pointer(LibVte::Terminal) -> Void
    text_scrolled : Pointer(LibVte::Terminal), Int32 -> Void
    copy_clipboard : Pointer(LibVte::Terminal) -> Void
    paste_clipboard : Pointer(LibVte::Terminal) -> Void
    bell : Pointer(LibVte::Terminal) -> Void
    padding : Pointer(Void)[16]
    priv : Pointer(LibVte::TerminalClassPrivate)
  end

  struct TerminalClassPrivate # struct
    _data : UInt8[0]
  end

  ###########################################
  # #    Enums
  ###########################################

  alias CursorBlinkMode = UInt32

  alias CursorShape = UInt32

  alias EraseBinding = UInt32

  alias Format = UInt32

  alias PtyError = UInt32
  fun pty_error_quark = vte_pty_error_quark : UInt32

  alias RegexError = UInt32
  fun regex_error_quark = vte_regex_error_quark : UInt32

  alias TextBlinkMode = UInt32

  alias WriteFlags = UInt32

  ###########################################
  # #    Constants
  ###########################################
  MAJOR_VERSION               =                       0 # : Int32
  MICRO_VERSION               =                       3 # : Int32
  MINOR_VERSION               =                      60 # : Int32
  REGEX_FLAGS_DEFAULT         =              1075314688 # : Int32
  SPAWN_NO_PARENT_ENVV        =                33554432 # : Int32
  SPAWN_NO_SYSTEMD_SCOPE      =                67108864 # : Int32
  SPAWN_REQUIRE_SYSTEMD_SCOPE =               134217728 # : Int32
  TEST_FLAGS_ALL              = 18446744073709551615u64 # : UInt64
  TEST_FLAGS_NONE             =                    0u64 # : UInt64

  ###########################################
  # #    Objects
  ###########################################

  struct Pty # object
    _data : UInt8[0]
    # Property fd : Int32
    # Property flags : LibVte::PtyFlags
  end

  fun _vte_pty_get_type = vte_pty_get_type : UInt64
  fun pty_new_foreign_sync = vte_pty_new_foreign_sync(fd : Int32, cancellable : Pointer(LibGio::Cancellable), error : LibGLib::Error**) : Pointer(LibVte::Pty)
  fun pty_new_sync = vte_pty_new_sync(flags : LibVte::PtyFlags, cancellable : Pointer(LibGio::Cancellable), error : LibGLib::Error**) : Pointer(LibVte::Pty)
  fun pty_child_setup = vte_pty_child_setup(this : Pty*) : Void
  fun pty_close = vte_pty_close(this : Pty*) : Void
  fun pty_get_fd = vte_pty_get_fd(this : Pty*) : Int32
  fun pty_get_size = vte_pty_get_size(this : Pty*, rows : Int32*, columns : Int32*, error : LibGLib::Error**) : LibC::Int
  fun pty_set_size = vte_pty_set_size(this : Pty*, rows : Int32, columns : Int32, error : LibGLib::Error**) : LibC::Int
  fun pty_set_utf8 = vte_pty_set_utf8(this : Pty*, utf8 : LibC::Int, error : LibGLib::Error**) : LibC::Int
  fun pty_spawn_async = vte_pty_spawn_async(this : Pty*, working_directory : Pointer(UInt8), argv : Pointer(Pointer(UInt8)), envv : Pointer(Pointer(UInt8)), spawn_flags : LibGLib::SpawnFlags, child_setup : LibGLib::SpawnChildSetupFunc, child_setup_data : Pointer(Void), child_setup_data_destroy : LibGLib::DestroyNotify, timeout : Int32, cancellable : Pointer(LibGio::Cancellable), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun pty_spawn_finish = vte_pty_spawn_finish(this : Pty*, result : Pointer(LibGio::AsyncResult), child_pid : Int32*, error : LibGLib::Error**) : LibC::Int

  struct Terminal # object
    widget : LibGtk::Widget
    _unused_padding : Pointer(Void)
    # Signal bell
    # Signal char-size-changed
    # Signal child-exited
    # Signal commit
    # Signal contents-changed
    # Signal copy-clipboard
    # Signal current-directory-uri-changed
    # Signal current-file-uri-changed
    # Signal cursor-moved
    # Signal decrease-font-size
    # Signal deiconify-window
    # Signal encoding-changed
    # Signal eof
    # Signal hyperlink-hover-uri-changed
    # Signal icon-title-changed
    # Signal iconify-window
    # Signal increase-font-size
    # Signal lower-window
    # Signal maximize-window
    # Signal move-window
    # Signal paste-clipboard
    # Signal raise-window
    # Signal refresh-window
    # Signal resize-window
    # Signal restore-window
    # Signal selection-changed
    # Signal text-deleted
    # Signal text-inserted
    # Signal text-modified
    # Signal text-scrolled
    # Signal window-title-changed
    # Virtual function bell
    # Virtual function char_size_changed
    # Virtual function child_exited
    # Virtual function commit
    # Virtual function contents_changed
    # Virtual function copy_clipboard
    # Virtual function cursor_moved
    # Virtual function decrease_font_size
    # Virtual function deiconify_window
    # Virtual function encoding_changed
    # Virtual function eof
    # Virtual function icon_title_changed
    # Virtual function iconify_window
    # Virtual function increase_font_size
    # Virtual function lower_window
    # Virtual function maximize_window
    # Virtual function move_window
    # Virtual function paste_clipboard
    # Virtual function raise_window
    # Virtual function refresh_window
    # Virtual function resize_window
    # Virtual function restore_window
    # Virtual function selection_changed
    # Virtual function text_deleted
    # Virtual function text_inserted
    # Virtual function text_modified
    # Virtual function text_scrolled
    # Virtual function window_title_changed
    # Property allow-bold : LibC::Int
    # Property allow-hyperlink : LibC::Int
    # Property audible-bell : LibC::Int
    # Property backspace-binding : LibVte::EraseBinding
    # Property bold-is-bright : LibC::Int
    # Property cell-height-scale : Float64
    # Property cell-width-scale : Float64
    # Property cjk-ambiguous-width : Int32
    # Property current-directory-uri : Pointer(UInt8)
    # Property current-file-uri : Pointer(UInt8)
    # Property cursor-blink-mode : LibVte::CursorBlinkMode
    # Property cursor-shape : LibVte::CursorShape
    # Property delete-binding : LibVte::EraseBinding
    # Property enable-bidi : LibC::Int
    # Property enable-shaping : LibC::Int
    # Property encoding : Pointer(UInt8)
    # Property font-desc : LibPango::FontDescription
    # Property font-scale : Float64
    # Property hyperlink-hover-uri : Pointer(UInt8)
    # Property icon-title : Pointer(UInt8)
    # Property input-enabled : LibC::Int
    # Property pointer-autohide : LibC::Int
    # Property pty : LibVte::Pty
    # Property rewrap-on-resize : LibC::Int
    # Property scroll-on-keystroke : LibC::Int
    # Property scroll-on-output : LibC::Int
    # Property scrollback-lines : UInt32
    # Property text-blink-mode : LibVte::TextBlinkMode
    # Property window-title : Pointer(UInt8)
    # Property word-char-exceptions : Pointer(UInt8)
  end

  fun _vte_terminal_get_type = vte_terminal_get_type : UInt64
  fun terminal_new = vte_terminal_new : Pointer(LibVte::Terminal)
  fun terminal_copy_clipboard = vte_terminal_copy_clipboard(this : Terminal*) : Void
  fun terminal_copy_clipboard_format = vte_terminal_copy_clipboard_format(this : Terminal*, format : LibVte::Format) : Void
  fun terminal_copy_primary = vte_terminal_copy_primary(this : Terminal*) : Void
  fun terminal_event_check_gregex_simple = vte_terminal_event_check_gregex_simple(this : Terminal*, event : Pointer(LibGdk::Event), regexes : Pointer(Pointer(LibGLib::Regex)), n_regexes : UInt64*, match_flags : LibGLib::RegexMatchFlags, matches : Pointer(Pointer(UInt8))*) : LibC::Int
  fun terminal_event_check_regex_simple = vte_terminal_event_check_regex_simple(this : Terminal*, event : Pointer(LibGdk::Event), regexes : Pointer(Pointer(LibVte::Regex)), n_regexes : UInt64*, match_flags : UInt32, matches : Pointer(Pointer(UInt8))*) : LibC::Int
  fun terminal_feed = vte_terminal_feed(this : Terminal*, data : Pointer(UInt8), length : Int64) : Void
  fun terminal_feed_child = vte_terminal_feed_child(this : Terminal*, text : Pointer(UInt8), length : Int64) : Void
  fun terminal_feed_child_binary = vte_terminal_feed_child_binary(this : Terminal*, data : Pointer(UInt8), length : UInt64) : Void
  fun terminal_get_allow_bold = vte_terminal_get_allow_bold(this : Terminal*) : LibC::Int
  fun terminal_get_allow_hyperlink = vte_terminal_get_allow_hyperlink(this : Terminal*) : LibC::Int
  fun terminal_get_audible_bell = vte_terminal_get_audible_bell(this : Terminal*) : LibC::Int
  fun terminal_get_bold_is_bright = vte_terminal_get_bold_is_bright(this : Terminal*) : LibC::Int
  fun terminal_get_cell_height_scale = vte_terminal_get_cell_height_scale(this : Terminal*) : Float64
  fun terminal_get_cell_width_scale = vte_terminal_get_cell_width_scale(this : Terminal*) : Float64
  fun terminal_get_char_height = vte_terminal_get_char_height(this : Terminal*) : Int64
  fun terminal_get_char_width = vte_terminal_get_char_width(this : Terminal*) : Int64
  fun terminal_get_cjk_ambiguous_width = vte_terminal_get_cjk_ambiguous_width(this : Terminal*) : Int32
  fun terminal_get_color_background_for_draw = vte_terminal_get_color_background_for_draw(this : Terminal*, color : LibGdk::RGBA*) : Void
  fun terminal_get_column_count = vte_terminal_get_column_count(this : Terminal*) : Int64
  fun terminal_get_current_directory_uri = vte_terminal_get_current_directory_uri(this : Terminal*) : Pointer(UInt8)
  fun terminal_get_current_file_uri = vte_terminal_get_current_file_uri(this : Terminal*) : Pointer(UInt8)
  fun terminal_get_cursor_blink_mode = vte_terminal_get_cursor_blink_mode(this : Terminal*) : LibVte::CursorBlinkMode
  fun terminal_get_cursor_position = vte_terminal_get_cursor_position(this : Terminal*, column : Int64*, row : Int64*) : Void
  fun terminal_get_cursor_shape = vte_terminal_get_cursor_shape(this : Terminal*) : LibVte::CursorShape
  fun terminal_get_enable_bidi = vte_terminal_get_enable_bidi(this : Terminal*) : LibC::Int
  fun terminal_get_enable_shaping = vte_terminal_get_enable_shaping(this : Terminal*) : LibC::Int
  fun terminal_get_encoding = vte_terminal_get_encoding(this : Terminal*) : Pointer(UInt8)
  fun terminal_get_font = vte_terminal_get_font(this : Terminal*) : Pointer(LibPango::FontDescription)
  fun terminal_get_font_scale = vte_terminal_get_font_scale(this : Terminal*) : Float64
  fun terminal_get_geometry_hints = vte_terminal_get_geometry_hints(this : Terminal*, hints : LibGdk::Geometry*, min_rows : Int32, min_columns : Int32) : Void
  fun terminal_get_has_selection = vte_terminal_get_has_selection(this : Terminal*) : LibC::Int
  fun terminal_get_icon_title = vte_terminal_get_icon_title(this : Terminal*) : Pointer(UInt8)
  fun terminal_get_input_enabled = vte_terminal_get_input_enabled(this : Terminal*) : LibC::Int
  fun terminal_get_mouse_autohide = vte_terminal_get_mouse_autohide(this : Terminal*) : LibC::Int
  fun terminal_get_pty = vte_terminal_get_pty(this : Terminal*) : Pointer(LibVte::Pty)
  fun terminal_get_rewrap_on_resize = vte_terminal_get_rewrap_on_resize(this : Terminal*) : LibC::Int
  fun terminal_get_row_count = vte_terminal_get_row_count(this : Terminal*) : Int64
  fun terminal_get_scroll_on_keystroke = vte_terminal_get_scroll_on_keystroke(this : Terminal*) : LibC::Int
  fun terminal_get_scroll_on_output = vte_terminal_get_scroll_on_output(this : Terminal*) : LibC::Int
  fun terminal_get_scrollback_lines = vte_terminal_get_scrollback_lines(this : Terminal*) : Int64
  fun terminal_get_text = vte_terminal_get_text(this : Terminal*, is_selected : LibVte::SelectionFunc, user_data : Pointer(Void), attributes : Pointer(Void)*) : Pointer(UInt8)
  fun terminal_get_text_blink_mode = vte_terminal_get_text_blink_mode(this : Terminal*) : LibVte::TextBlinkMode
  fun terminal_get_text_include_trailing_spaces = vte_terminal_get_text_include_trailing_spaces(this : Terminal*, is_selected : LibVte::SelectionFunc, user_data : Pointer(Void), attributes : Pointer(Void)*) : Pointer(UInt8)
  fun terminal_get_text_range = vte_terminal_get_text_range(this : Terminal*, start_row : Int64, start_col : Int64, end_row : Int64, end_col : Int64, is_selected : LibVte::SelectionFunc, user_data : Pointer(Void), attributes : Pointer(Void)*) : Pointer(UInt8)
  fun terminal_get_window_title = vte_terminal_get_window_title(this : Terminal*) : Pointer(UInt8)
  fun terminal_get_word_char_exceptions = vte_terminal_get_word_char_exceptions(this : Terminal*) : Pointer(UInt8)
  fun terminal_hyperlink_check_event = vte_terminal_hyperlink_check_event(this : Terminal*, event : Pointer(LibGdk::Event)) : Pointer(UInt8)
  fun terminal_match_add_gregex = vte_terminal_match_add_gregex(this : Terminal*, gregex : Pointer(LibGLib::Regex), gflags : LibGLib::RegexMatchFlags) : Int32
  fun terminal_match_add_regex = vte_terminal_match_add_regex(this : Terminal*, regex : Pointer(LibVte::Regex), flags : UInt32) : Int32
  fun terminal_match_check = vte_terminal_match_check(this : Terminal*, column : Int64, row : Int64, tag : Int32*) : Pointer(UInt8)
  fun terminal_match_check_event = vte_terminal_match_check_event(this : Terminal*, event : Pointer(LibGdk::Event), tag : Int32*) : Pointer(UInt8)
  fun terminal_match_remove = vte_terminal_match_remove(this : Terminal*, tag : Int32) : Void
  fun terminal_match_remove_all = vte_terminal_match_remove_all(this : Terminal*) : Void
  fun terminal_match_set_cursor = vte_terminal_match_set_cursor(this : Terminal*, tag : Int32, cursor : Pointer(LibGdk::Cursor)) : Void
  fun terminal_match_set_cursor_name = vte_terminal_match_set_cursor_name(this : Terminal*, tag : Int32, cursor_name : Pointer(UInt8)) : Void
  fun terminal_match_set_cursor_type = vte_terminal_match_set_cursor_type(this : Terminal*, tag : Int32, cursor_type : LibGdk::CursorType) : Void
  fun terminal_paste_clipboard = vte_terminal_paste_clipboard(this : Terminal*) : Void
  fun terminal_paste_primary = vte_terminal_paste_primary(this : Terminal*) : Void
  fun terminal_pty_new_sync = vte_terminal_pty_new_sync(this : Terminal*, flags : LibVte::PtyFlags, cancellable : Pointer(LibGio::Cancellable), error : LibGLib::Error**) : Pointer(LibVte::Pty)
  fun terminal_reset = vte_terminal_reset(this : Terminal*, clear_tabstops : LibC::Int, clear_history : LibC::Int) : Void
  fun terminal_search_find_next = vte_terminal_search_find_next(this : Terminal*) : LibC::Int
  fun terminal_search_find_previous = vte_terminal_search_find_previous(this : Terminal*) : LibC::Int
  fun terminal_search_get_gregex = vte_terminal_search_get_gregex(this : Terminal*) : Pointer(LibGLib::Regex)
  fun terminal_search_get_regex = vte_terminal_search_get_regex(this : Terminal*) : Pointer(LibVte::Regex)
  fun terminal_search_get_wrap_around = vte_terminal_search_get_wrap_around(this : Terminal*) : LibC::Int
  fun terminal_search_set_gregex = vte_terminal_search_set_gregex(this : Terminal*, gregex : Pointer(LibGLib::Regex), gflags : LibGLib::RegexMatchFlags) : Void
  fun terminal_search_set_regex = vte_terminal_search_set_regex(this : Terminal*, regex : Pointer(LibVte::Regex), flags : UInt32) : Void
  fun terminal_search_set_wrap_around = vte_terminal_search_set_wrap_around(this : Terminal*, wrap_around : LibC::Int) : Void
  fun terminal_select_all = vte_terminal_select_all(this : Terminal*) : Void
  fun terminal_set_allow_bold = vte_terminal_set_allow_bold(this : Terminal*, allow_bold : LibC::Int) : Void
  fun terminal_set_allow_hyperlink = vte_terminal_set_allow_hyperlink(this : Terminal*, allow_hyperlink : LibC::Int) : Void
  fun terminal_set_audible_bell = vte_terminal_set_audible_bell(this : Terminal*, is_audible : LibC::Int) : Void
  fun terminal_set_backspace_binding = vte_terminal_set_backspace_binding(this : Terminal*, binding : LibVte::EraseBinding) : Void
  fun terminal_set_bold_is_bright = vte_terminal_set_bold_is_bright(this : Terminal*, bold_is_bright : LibC::Int) : Void
  fun terminal_set_cell_height_scale = vte_terminal_set_cell_height_scale(this : Terminal*, scale : Float64) : Void
  fun terminal_set_cell_width_scale = vte_terminal_set_cell_width_scale(this : Terminal*, scale : Float64) : Void
  fun terminal_set_cjk_ambiguous_width = vte_terminal_set_cjk_ambiguous_width(this : Terminal*, width : Int32) : Void
  fun terminal_set_clear_background = vte_terminal_set_clear_background(this : Terminal*, setting : LibC::Int) : Void
  fun terminal_set_color_background = vte_terminal_set_color_background(this : Terminal*, background : Pointer(LibGdk::RGBA)) : Void
  fun terminal_set_color_bold = vte_terminal_set_color_bold(this : Terminal*, bold : Pointer(LibGdk::RGBA)) : Void
  fun terminal_set_color_cursor = vte_terminal_set_color_cursor(this : Terminal*, cursor_background : Pointer(LibGdk::RGBA)) : Void
  fun terminal_set_color_cursor_foreground = vte_terminal_set_color_cursor_foreground(this : Terminal*, cursor_foreground : Pointer(LibGdk::RGBA)) : Void
  fun terminal_set_color_foreground = vte_terminal_set_color_foreground(this : Terminal*, foreground : Pointer(LibGdk::RGBA)) : Void
  fun terminal_set_color_highlight = vte_terminal_set_color_highlight(this : Terminal*, highlight_background : Pointer(LibGdk::RGBA)) : Void
  fun terminal_set_color_highlight_foreground = vte_terminal_set_color_highlight_foreground(this : Terminal*, highlight_foreground : Pointer(LibGdk::RGBA)) : Void
  fun terminal_set_colors = vte_terminal_set_colors(this : Terminal*, foreground : Pointer(LibGdk::RGBA), background : Pointer(LibGdk::RGBA), palette : Pointer(LibGdk::RGBA), palette_size : UInt64) : Void
  fun terminal_set_cursor_blink_mode = vte_terminal_set_cursor_blink_mode(this : Terminal*, mode : LibVte::CursorBlinkMode) : Void
  fun terminal_set_cursor_shape = vte_terminal_set_cursor_shape(this : Terminal*, shape : LibVte::CursorShape) : Void
  fun terminal_set_default_colors = vte_terminal_set_default_colors(this : Terminal*) : Void
  fun terminal_set_delete_binding = vte_terminal_set_delete_binding(this : Terminal*, binding : LibVte::EraseBinding) : Void
  fun terminal_set_enable_bidi = vte_terminal_set_enable_bidi(this : Terminal*, enable_bidi : LibC::Int) : Void
  fun terminal_set_enable_shaping = vte_terminal_set_enable_shaping(this : Terminal*, enable_shaping : LibC::Int) : Void
  fun terminal_set_encoding = vte_terminal_set_encoding(this : Terminal*, codeset : Pointer(UInt8), error : LibGLib::Error**) : LibC::Int
  fun terminal_set_font = vte_terminal_set_font(this : Terminal*, font_desc : Pointer(LibPango::FontDescription)) : Void
  fun terminal_set_font_scale = vte_terminal_set_font_scale(this : Terminal*, scale : Float64) : Void
  fun terminal_set_geometry_hints_for_window = vte_terminal_set_geometry_hints_for_window(this : Terminal*, window : Pointer(LibGtk::Window)) : Void
  fun terminal_set_input_enabled = vte_terminal_set_input_enabled(this : Terminal*, enabled : LibC::Int) : Void
  fun terminal_set_mouse_autohide = vte_terminal_set_mouse_autohide(this : Terminal*, setting : LibC::Int) : Void
  fun terminal_set_pty = vte_terminal_set_pty(this : Terminal*, pty : Pointer(LibVte::Pty)) : Void
  fun terminal_set_rewrap_on_resize = vte_terminal_set_rewrap_on_resize(this : Terminal*, rewrap : LibC::Int) : Void
  fun terminal_set_scroll_on_keystroke = vte_terminal_set_scroll_on_keystroke(this : Terminal*, scroll : LibC::Int) : Void
  fun terminal_set_scroll_on_output = vte_terminal_set_scroll_on_output(this : Terminal*, scroll : LibC::Int) : Void
  fun terminal_set_scrollback_lines = vte_terminal_set_scrollback_lines(this : Terminal*, lines : Int64) : Void
  fun terminal_set_size = vte_terminal_set_size(this : Terminal*, columns : Int64, rows : Int64) : Void
  fun terminal_set_text_blink_mode = vte_terminal_set_text_blink_mode(this : Terminal*, text_blink_mode : LibVte::TextBlinkMode) : Void
  fun terminal_set_word_char_exceptions = vte_terminal_set_word_char_exceptions(this : Terminal*, exceptions : Pointer(UInt8)) : Void
  fun terminal_spawn_async = vte_terminal_spawn_async(this : Terminal*, pty_flags : LibVte::PtyFlags, working_directory : Pointer(UInt8), argv : Pointer(Pointer(UInt8)), envv : Pointer(Pointer(UInt8)), spawn_flags_ : LibGLib::SpawnFlags, child_setup : LibGLib::SpawnChildSetupFunc, child_setup_data : Pointer(Void), child_setup_data_destroy : LibGLib::DestroyNotify, timeout : Int32, cancellable : Pointer(LibGio::Cancellable), callback : LibVte::TerminalSpawnAsyncCallback, user_data : Pointer(Void)) : Void
  fun terminal_spawn_sync = vte_terminal_spawn_sync(this : Terminal*, pty_flags : LibVte::PtyFlags, working_directory : Pointer(UInt8), argv : Pointer(Pointer(UInt8)), envv : Pointer(Pointer(UInt8)), spawn_flags : LibGLib::SpawnFlags, child_setup : LibGLib::SpawnChildSetupFunc, child_setup_data : Pointer(Void), child_pid : Int32*, cancellable : Pointer(LibGio::Cancellable), error : LibGLib::Error**) : LibC::Int
  fun terminal_unselect_all = vte_terminal_unselect_all(this : Terminal*) : Void
  fun terminal_watch_child = vte_terminal_watch_child(this : Terminal*, child_pid : Int32) : Void
  fun terminal_write_contents_sync = vte_terminal_write_contents_sync(this : Terminal*, stream : Pointer(LibGio::OutputStream), flags : LibVte::WriteFlags, cancellable : Pointer(LibGio::Cancellable), error : LibGLib::Error**) : LibC::Int

  ###########################################
  # #    Flags
  ###########################################

  alias PtyFlags = UInt32

  ###########################################
  # #    Functions
  ###########################################
  fun get_encoding_supported = vte_get_encoding_supported(encoding : Pointer(UInt8)) : LibC::Int
  fun get_encodings = vte_get_encodings(include_aliases : LibC::Int) : Pointer(Pointer(UInt8))
  fun get_features = vte_get_features : Pointer(UInt8)
  fun get_major_version = vte_get_major_version : UInt32
  fun get_micro_version = vte_get_micro_version : UInt32
  fun get_minor_version = vte_get_minor_version : UInt32
  fun get_user_shell = vte_get_user_shell : Pointer(UInt8)
  fun pty_error_quark = vte_pty_error_quark : UInt32
  fun regex_error_quark = vte_regex_error_quark : UInt32

  ###########################################
  # #    Callbacks
  ###########################################
  alias SelectionFunc = Pointer(LibVte::Terminal), Int64, Int64, Pointer(Void) -> LibC::Int
  alias TerminalSpawnAsyncCallback = Pointer(LibVte::Terminal), Int32, Pointer(LibGLib::Error*), Pointer(Void) -> Void
end

module Vte
  MAJOR_VERSION               = LibVte::MAJOR_VERSION
  MICRO_VERSION               = LibVte::MICRO_VERSION
  MINOR_VERSION               = LibVte::MINOR_VERSION
  REGEX_FLAGS_DEFAULT         = LibVte::REGEX_FLAGS_DEFAULT
  SPAWN_NO_PARENT_ENVV        = LibVte::SPAWN_NO_PARENT_ENVV
  SPAWN_NO_SYSTEMD_SCOPE      = LibVte::SPAWN_NO_SYSTEMD_SCOPE
  SPAWN_REQUIRE_SYSTEMD_SCOPE = LibVte::SPAWN_REQUIRE_SYSTEMD_SCOPE
  TEST_FLAGS_ALL              = LibVte::TEST_FLAGS_ALL
  TEST_FLAGS_NONE             = LibVte::TEST_FLAGS_NONE

  def self.encoding_supported(encoding : ::String)
    __var0 = LibVte.get_encoding_supported(encoding.to_unsafe)
    (__var0 == 1)
  end

  def self.encodings(include_aliases : ::Bool)
    __var0 = LibVte.get_encodings(LibC::Int.new(include_aliases ? 1 : 0))
    GObject.raise_unexpected_null("vte_get_encodings") if __var0.null?
    GObject::PointerIterator.new(__var0) { |__var1|
      ::String.new(__var1)
    }
  end

  def self.features
    __var0 = LibVte.get_features
    GObject.raise_unexpected_null("vte_get_features") if __var0.null?
    ::String.new(__var0)
  end

  def self.major_version
    __var0 = LibVte.get_major_version
    __var0
  end

  def self.micro_version
    __var0 = LibVte.get_micro_version
    __var0
  end

  def self.minor_version
    __var0 = LibVte.get_minor_version
    __var0
  end

  def self.user_shell
    __var0 = LibVte.get_user_shell
    GObject.raise_unexpected_null("vte_get_user_shell") if __var0.null?
    ::String.new(__var0)
  end

  def self.pty_error_quark
    __var0 = LibVte.pty_error_quark
    __var0
  end

  def self.regex_error_quark
    __var0 = LibVte.regex_error_quark
    __var0
  end

  class CharAttributes
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(40u64, 0u8).as(LibVte::CharAttributes*))
    end

    @pointer : Void*

    def initialize(pointer : LibVte::CharAttributes*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibVte::CharAttributes*)
    end

    def to_unsafe_charattributes
      @pointer.not_nil!.as(LibVte::CharAttributes*)
    end

    def row
      to_unsafe.as(LibVte::CharAttributes*).value.row
    end

    def column
      to_unsafe.as(LibVte::CharAttributes*).value.column
    end

    def fore
      Pango::Color.new(to_unsafe.as(LibVte::CharAttributes*).value.fore)
    end

    def back
      Pango::Color.new(to_unsafe.as(LibVte::CharAttributes*).value.back)
    end

    def underline
      to_unsafe.as(LibVte::CharAttributes*).value.underline
    end

    def strikethrough
      to_unsafe.as(LibVte::CharAttributes*).value.strikethrough
    end

    def columns
      to_unsafe.as(LibVte::CharAttributes*).value.columns
    end
  end

  enum CursorBlinkMode : UInt32
    SYSTEM = 0
    ON     = 1
    OFF    = 2
  end

  enum CursorShape : UInt32
    BLOCK     = 0
    IBEAM     = 1
    UNDERLINE = 2
  end

  enum EraseBinding : UInt32
    AUTO            = 0
    ASCII_BACKSPACE = 1
    ASCII_DELETE    = 2
    DELETE_SEQUENCE = 3
    TTY             = 4
  end

  enum Format : UInt32
    ZERO_NONE = 0
    TEXT      = 1
    HTML      = 2
  end

  class Pty < GObject::Object
    include Gio::Initable

    @pointer : Void*

    def initialize(pointer : LibVte::Pty*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a VtePty")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibVte._vte_pty_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibVte::Pty*)
    end

    def to_unsafe_pty
      @pointer.not_nil!.as(LibVte::Pty*)
    end

    def initialize(*, fd : Int32? = nil, flags : Vte::PtyFlags? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless fd.nil?
        __var0 << "fd".to_unsafe
        __var1 << fd.to_gvalue.to_unsafe.value
      end

      unless flags.nil?
        __var0 << "flags".to_unsafe
        __var1 << flags.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibVte._vte_pty_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new_foreign_sync(fd : ::Int, cancellable : Gio::Cancellable?) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibVte.pty_new_foreign_sync(Int32.new(fd), cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("vte_pty_new_foreign_sync") if __var1.null?
      cast(Vte::Pty.new(__var1))
    end

    def self.new_sync(flags : Vte::PtyFlags, cancellable : Gio::Cancellable?) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibVte.pty_new_sync(flags, cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("vte_pty_new_sync") if __var1.null?
      cast(Vte::Pty.new(__var1))
    end

    def child_setup
      LibVte.pty_child_setup(@pointer.as(LibVte::Pty*))
      nil
    end

    def close
      LibVte.pty_close(@pointer.as(LibVte::Pty*))
      nil
    end

    def fd
      __var0 = LibVte.pty_get_fd(@pointer.as(LibVte::Pty*))
      __var0
    end

    def size
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibVte.pty_get_size(@pointer.as(LibVte::Pty*), out rows, out columns, pointerof(__var0))
      GLib::Error.assert(__var0)
      {(__var1 == 1), rows, columns}
    end

    def set_size(rows : ::Int, columns : ::Int)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibVte.pty_set_size(@pointer.as(LibVte::Pty*), Int32.new(rows), Int32.new(columns), pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def set_utf8(utf8 : ::Bool)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibVte.pty_set_utf8(@pointer.as(LibVte::Pty*), LibC::Int.new(utf8 ? 1 : 0), pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def spawn_async(working_directory : ::String?, argv : ::Enumerable, envv : ::Enumerable?, spawn_flags : GLib::SpawnFlags, child_setup : GLib::SpawnChildSetupFunc?, child_setup_data : Void*?, child_setup_data_destroy : GLib::DestroyNotify, timeout : ::Int, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Void*?)
      LibVte.pty_spawn_async(@pointer.as(LibVte::Pty*), working_directory ? working_directory.to_unsafe : Pointer(UInt8).null, (__argv_ary = argv.map { |__item| __item.to_unsafe }.to_a).to_unsafe, envv ? (__envv_ary = envv.map { |__item| __item.to_unsafe }.to_a).to_unsafe : Pointer(Pointer(UInt8)).null, spawn_flags, child_setup ? child_setup : nil, child_setup_data ? child_setup_data : Pointer(Void).null, child_setup_data_destroy, Int32.new(timeout), cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, callback ? callback : nil, user_data ? user_data : Pointer(Void).null)
      nil
    end

    def spawn_finish(result : Gio::AsyncResult)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibVte.pty_spawn_finish(@pointer.as(LibVte::Pty*), result.to_unsafe_asyncresult, out child_pid, pointerof(__var0))
      GLib::Error.assert(__var0)
      {(__var1 == 1), child_pid}
    end

    def flags : Vte::PtyFlags
      __var0 = GObject::Value.new(type: GObject::Type::ENUM)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "flags", __var0)
      Vte::PtyFlags.new(UInt32.new(__var0.flags))
    end
  end

  class PtyClass
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibVte::PtyClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibVte::PtyClass*)
    end

    def to_unsafe_ptyclass
      @pointer.not_nil!.as(LibVte::PtyClass*)
    end
  end

  enum PtyError : UInt32
    PTY_HELPER_FAILED = 0
    PTY98_FAILED      = 1
  end
  # Function quark

  @[Flags]
  enum PtyFlags : UInt32
    NO_LASTLOG  =  1
    NO_UTMP     =  2
    NO_WTMP     =  4
    NO_HELPER   =  8
    NO_FALLBACK = 16
    NO_SESSION  = 32
    NO_CTTY     = 64
    DEFAULT     =  0
  end

  class Regex
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibVte::Regex*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibVte::Regex*)
    end

    def to_unsafe_regex
      @pointer.not_nil!.as(LibVte::Regex*)
    end

    def self.new_for_match(pattern : ::String, pattern_length : ::Int, flags : ::Int) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibVte.regex_new_for_match(pattern.to_unsafe, Int64.new(pattern_length), UInt32.new(flags), pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("vte_regex_new_for_match") if __var1.null?
      cast(Vte::Regex.new(__var1))
    end

    def self.new_for_search(pattern : ::String, pattern_length : ::Int, flags : ::Int) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibVte.regex_new_for_search(pattern.to_unsafe, Int64.new(pattern_length), UInt32.new(flags), pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("vte_regex_new_for_search") if __var1.null?
      cast(Vte::Regex.new(__var1))
    end

    def jit(flags : ::Int)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibVte.regex_jit(@pointer.as(LibVte::Regex*), UInt32.new(flags), pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def ref
      __var0 = LibVte.regex_ref(@pointer.as(LibVte::Regex*))
      GObject.raise_unexpected_null("vte_regex_ref") if __var0.null?
      Vte::Regex.new(__var0)
    end

    def substitute(subject : ::String, replacement : ::String, flags : ::Int)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibVte.regex_substitute(@pointer.as(LibVte::Regex*), subject.to_unsafe, replacement.to_unsafe, UInt32.new(flags), pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("vte_regex_substitute") if __var1.null?
      ::String.new(__var1)
    end

    def unref
      __var0 = LibVte.regex_unref(@pointer.as(LibVte::Regex*))
      GObject.raise_unexpected_null("vte_regex_unref") if __var0.null?
      Vte::Regex.new(__var0)
    end
  end

  enum RegexError : UInt32
    ZERO_NONE     =          0
    INCOMPATIBLE  = 2147483646
    NOT_SUPPORTED = 2147483647
  end
  # Function quark
  alias SelectionFunc = LibVte::SelectionFunc

  class Terminal < Gtk::Widget
    include Atk::ImplementorIface
    include Gtk::Buildable
    include Gtk::Scrollable

    @pointer : Void*

    def initialize(pointer : LibVte::Terminal*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a VteTerminal")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibVte._vte_terminal_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibVte::Terminal*)
    end

    def to_unsafe_terminal
      @pointer.not_nil!.as(LibVte::Terminal*)
    end

    def initialize(*, allow_bold : ::Bool? = nil, allow_hyperlink : ::Bool? = nil, app_paintable : ::Bool? = nil, audible_bell : ::Bool? = nil, backspace_binding : Vte::EraseBinding? = nil, bold_is_bright : ::Bool? = nil, can_default : ::Bool? = nil, can_focus : ::Bool? = nil, cell_height_scale : Float64? = nil, cell_width_scale : Float64? = nil, cjk_ambiguous_width : Int32? = nil, cursor_blink_mode : Vte::CursorBlinkMode? = nil, cursor_shape : Vte::CursorShape? = nil, delete_binding : Vte::EraseBinding? = nil, double_buffered : ::Bool? = nil, enable_bidi : ::Bool? = nil, enable_shaping : ::Bool? = nil, encoding : ::String? = nil, events : Gdk::EventMask? = nil, expand : ::Bool? = nil, focus_on_click : ::Bool? = nil, font_desc : Pango::FontDescription? = nil, font_scale : Float64? = nil, hadjustment : Gtk::Adjustment? = nil, halign : Gtk::Align? = nil, has_default : ::Bool? = nil, has_focus : ::Bool? = nil, has_tooltip : ::Bool? = nil, height_request : Int32? = nil, hexpand : ::Bool? = nil, hexpand_set : ::Bool? = nil, hscroll_policy : Gtk::ScrollablePolicy? = nil, input_enabled : ::Bool? = nil, is_focus : ::Bool? = nil, margin : Int32? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_left : Int32? = nil, margin_right : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, no_show_all : ::Bool? = nil, opacity : Float64? = nil, parent : Gtk::Container? = nil, pointer_autohide : ::Bool? = nil, pty : Vte::Pty? = nil, receives_default : ::Bool? = nil, rewrap_on_resize : ::Bool? = nil, scroll_on_keystroke : ::Bool? = nil, scroll_on_output : ::Bool? = nil, scrollback_lines : UInt32? = nil, sensitive : ::Bool? = nil, style : Gtk::Style? = nil, text_blink_mode : Vte::TextBlinkMode? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, vadjustment : Gtk::Adjustment? = nil, valign : Gtk::Align? = nil, vexpand : ::Bool? = nil, vexpand_set : ::Bool? = nil, visible : ::Bool? = nil, vscroll_policy : Gtk::ScrollablePolicy? = nil, width_request : Int32? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless allow_bold.nil?
        __var0 << "allow-bold".to_unsafe
        __var1 << allow_bold.to_gvalue.to_unsafe.value
      end

      unless allow_hyperlink.nil?
        __var0 << "allow-hyperlink".to_unsafe
        __var1 << allow_hyperlink.to_gvalue.to_unsafe.value
      end

      unless app_paintable.nil?
        __var0 << "app-paintable".to_unsafe
        __var1 << app_paintable.to_gvalue.to_unsafe.value
      end

      unless audible_bell.nil?
        __var0 << "audible-bell".to_unsafe
        __var1 << audible_bell.to_gvalue.to_unsafe.value
      end

      unless backspace_binding.nil?
        __var0 << "backspace-binding".to_unsafe
        __var1 << backspace_binding.to_gvalue.to_unsafe.value
      end

      unless bold_is_bright.nil?
        __var0 << "bold-is-bright".to_unsafe
        __var1 << bold_is_bright.to_gvalue.to_unsafe.value
      end

      unless can_default.nil?
        __var0 << "can-default".to_unsafe
        __var1 << can_default.to_gvalue.to_unsafe.value
      end

      unless can_focus.nil?
        __var0 << "can-focus".to_unsafe
        __var1 << can_focus.to_gvalue.to_unsafe.value
      end

      unless cell_height_scale.nil?
        __var0 << "cell-height-scale".to_unsafe
        __var1 << cell_height_scale.to_gvalue.to_unsafe.value
      end

      unless cell_width_scale.nil?
        __var0 << "cell-width-scale".to_unsafe
        __var1 << cell_width_scale.to_gvalue.to_unsafe.value
      end

      unless cjk_ambiguous_width.nil?
        __var0 << "cjk-ambiguous-width".to_unsafe
        __var1 << cjk_ambiguous_width.to_gvalue.to_unsafe.value
      end

      unless cursor_blink_mode.nil?
        __var0 << "cursor-blink-mode".to_unsafe
        __var1 << cursor_blink_mode.to_gvalue.to_unsafe.value
      end

      unless cursor_shape.nil?
        __var0 << "cursor-shape".to_unsafe
        __var1 << cursor_shape.to_gvalue.to_unsafe.value
      end

      unless delete_binding.nil?
        __var0 << "delete-binding".to_unsafe
        __var1 << delete_binding.to_gvalue.to_unsafe.value
      end

      unless double_buffered.nil?
        __var0 << "double-buffered".to_unsafe
        __var1 << double_buffered.to_gvalue.to_unsafe.value
      end

      unless enable_bidi.nil?
        __var0 << "enable-bidi".to_unsafe
        __var1 << enable_bidi.to_gvalue.to_unsafe.value
      end

      unless enable_shaping.nil?
        __var0 << "enable-shaping".to_unsafe
        __var1 << enable_shaping.to_gvalue.to_unsafe.value
      end

      unless encoding.nil?
        __var0 << "encoding".to_unsafe
        __var1 << encoding.to_gvalue.to_unsafe.value
      end

      unless events.nil?
        __var0 << "events".to_unsafe
        __var1 << events.to_gvalue.to_unsafe.value
      end

      unless expand.nil?
        __var0 << "expand".to_unsafe
        __var1 << expand.to_gvalue.to_unsafe.value
      end

      unless focus_on_click.nil?
        __var0 << "focus-on-click".to_unsafe
        __var1 << focus_on_click.to_gvalue.to_unsafe.value
      end

      unless font_desc.nil?
        __var0 << "font-desc".to_unsafe
        __var1 << font_desc.to_gvalue.to_unsafe.value
      end

      unless font_scale.nil?
        __var0 << "font-scale".to_unsafe
        __var1 << font_scale.to_gvalue.to_unsafe.value
      end

      unless hadjustment.nil?
        __var0 << "hadjustment".to_unsafe
        __var1 << hadjustment.to_gvalue.to_unsafe.value
      end

      unless halign.nil?
        __var0 << "halign".to_unsafe
        __var1 << halign.to_gvalue.to_unsafe.value
      end

      unless has_default.nil?
        __var0 << "has-default".to_unsafe
        __var1 << has_default.to_gvalue.to_unsafe.value
      end

      unless has_focus.nil?
        __var0 << "has-focus".to_unsafe
        __var1 << has_focus.to_gvalue.to_unsafe.value
      end

      unless has_tooltip.nil?
        __var0 << "has-tooltip".to_unsafe
        __var1 << has_tooltip.to_gvalue.to_unsafe.value
      end

      unless height_request.nil?
        __var0 << "height-request".to_unsafe
        __var1 << height_request.to_gvalue.to_unsafe.value
      end

      unless hexpand.nil?
        __var0 << "hexpand".to_unsafe
        __var1 << hexpand.to_gvalue.to_unsafe.value
      end

      unless hexpand_set.nil?
        __var0 << "hexpand-set".to_unsafe
        __var1 << hexpand_set.to_gvalue.to_unsafe.value
      end

      unless hscroll_policy.nil?
        __var0 << "hscroll-policy".to_unsafe
        __var1 << hscroll_policy.to_gvalue.to_unsafe.value
      end

      unless input_enabled.nil?
        __var0 << "input-enabled".to_unsafe
        __var1 << input_enabled.to_gvalue.to_unsafe.value
      end

      unless is_focus.nil?
        __var0 << "is-focus".to_unsafe
        __var1 << is_focus.to_gvalue.to_unsafe.value
      end

      unless margin.nil?
        __var0 << "margin".to_unsafe
        __var1 << margin.to_gvalue.to_unsafe.value
      end

      unless margin_bottom.nil?
        __var0 << "margin-bottom".to_unsafe
        __var1 << margin_bottom.to_gvalue.to_unsafe.value
      end

      unless margin_end.nil?
        __var0 << "margin-end".to_unsafe
        __var1 << margin_end.to_gvalue.to_unsafe.value
      end

      unless margin_left.nil?
        __var0 << "margin-left".to_unsafe
        __var1 << margin_left.to_gvalue.to_unsafe.value
      end

      unless margin_right.nil?
        __var0 << "margin-right".to_unsafe
        __var1 << margin_right.to_gvalue.to_unsafe.value
      end

      unless margin_start.nil?
        __var0 << "margin-start".to_unsafe
        __var1 << margin_start.to_gvalue.to_unsafe.value
      end

      unless margin_top.nil?
        __var0 << "margin-top".to_unsafe
        __var1 << margin_top.to_gvalue.to_unsafe.value
      end

      unless name.nil?
        __var0 << "name".to_unsafe
        __var1 << name.to_gvalue.to_unsafe.value
      end

      unless no_show_all.nil?
        __var0 << "no-show-all".to_unsafe
        __var1 << no_show_all.to_gvalue.to_unsafe.value
      end

      unless opacity.nil?
        __var0 << "opacity".to_unsafe
        __var1 << opacity.to_gvalue.to_unsafe.value
      end

      unless parent.nil?
        __var0 << "parent".to_unsafe
        __var1 << parent.to_gvalue.to_unsafe.value
      end

      unless pointer_autohide.nil?
        __var0 << "pointer-autohide".to_unsafe
        __var1 << pointer_autohide.to_gvalue.to_unsafe.value
      end

      unless pty.nil?
        __var0 << "pty".to_unsafe
        __var1 << pty.to_gvalue.to_unsafe.value
      end

      unless receives_default.nil?
        __var0 << "receives-default".to_unsafe
        __var1 << receives_default.to_gvalue.to_unsafe.value
      end

      unless rewrap_on_resize.nil?
        __var0 << "rewrap-on-resize".to_unsafe
        __var1 << rewrap_on_resize.to_gvalue.to_unsafe.value
      end

      unless scroll_on_keystroke.nil?
        __var0 << "scroll-on-keystroke".to_unsafe
        __var1 << scroll_on_keystroke.to_gvalue.to_unsafe.value
      end

      unless scroll_on_output.nil?
        __var0 << "scroll-on-output".to_unsafe
        __var1 << scroll_on_output.to_gvalue.to_unsafe.value
      end

      unless scrollback_lines.nil?
        __var0 << "scrollback-lines".to_unsafe
        __var1 << scrollback_lines.to_gvalue.to_unsafe.value
      end

      unless sensitive.nil?
        __var0 << "sensitive".to_unsafe
        __var1 << sensitive.to_gvalue.to_unsafe.value
      end

      unless style.nil?
        __var0 << "style".to_unsafe
        __var1 << style.to_gvalue.to_unsafe.value
      end

      unless text_blink_mode.nil?
        __var0 << "text-blink-mode".to_unsafe
        __var1 << text_blink_mode.to_gvalue.to_unsafe.value
      end

      unless tooltip_markup.nil?
        __var0 << "tooltip-markup".to_unsafe
        __var1 << tooltip_markup.to_gvalue.to_unsafe.value
      end

      unless tooltip_text.nil?
        __var0 << "tooltip-text".to_unsafe
        __var1 << tooltip_text.to_gvalue.to_unsafe.value
      end

      unless vadjustment.nil?
        __var0 << "vadjustment".to_unsafe
        __var1 << vadjustment.to_gvalue.to_unsafe.value
      end

      unless valign.nil?
        __var0 << "valign".to_unsafe
        __var1 << valign.to_gvalue.to_unsafe.value
      end

      unless vexpand.nil?
        __var0 << "vexpand".to_unsafe
        __var1 << vexpand.to_gvalue.to_unsafe.value
      end

      unless vexpand_set.nil?
        __var0 << "vexpand-set".to_unsafe
        __var1 << vexpand_set.to_gvalue.to_unsafe.value
      end

      unless visible.nil?
        __var0 << "visible".to_unsafe
        __var1 << visible.to_gvalue.to_unsafe.value
      end

      unless vscroll_policy.nil?
        __var0 << "vscroll-policy".to_unsafe
        __var1 << vscroll_policy.to_gvalue.to_unsafe.value
      end

      unless width_request.nil?
        __var0 << "width-request".to_unsafe
        __var1 << width_request.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibVte._vte_terminal_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new : self
      __var0 = LibVte.terminal_new
      GObject.raise_unexpected_null("vte_terminal_new") if __var0.null?
      cast(Vte::Terminal.new(__var0))
    end

    def copy_clipboard
      LibVte.terminal_copy_clipboard(@pointer.as(LibVte::Terminal*))
      nil
    end

    def copy_clipboard_format(format : Vte::Format)
      LibVte.terminal_copy_clipboard_format(@pointer.as(LibVte::Terminal*), format)
      nil
    end

    def copy_primary
      LibVte.terminal_copy_primary(@pointer.as(LibVte::Terminal*))
      nil
    end

    def event_check_gregex_simple(event : Gdk::Event::Union, regexes : ::Enumerable, match_flags : GLib::RegexMatchFlags, matches : ::Enumerable)
      n_regexes = regexes.size
      __regexes = (__regexes_ary = regexes.map { |__item| __item.to_unsafe.as(LibGLib::Regex*) }.to_a).to_unsafe
      n_regexes = __regexes_ary.size
      __var0 = LibVte.terminal_event_check_gregex_simple(@pointer.as(LibVte::Terminal*), event.to_unsafe.as(LibGdk::Event*), __regexes, out n_regexes, match_flags, matches)
      {(__var0 == 1), n_regexes}
    end

    def event_check_regex_simple(event : Gdk::Event::Union, regexes : ::Enumerable, match_flags : ::Int, matches : ::Enumerable)
      n_regexes = regexes.size
      __regexes = (__regexes_ary = regexes.map { |__item| __item.to_unsafe.as(LibVte::Regex*) }.to_a).to_unsafe
      n_regexes = __regexes_ary.size
      __var0 = LibVte.terminal_event_check_regex_simple(@pointer.as(LibVte::Terminal*), event.to_unsafe.as(LibGdk::Event*), __regexes, out n_regexes, UInt32.new(match_flags), matches)
      {(__var0 == 1), n_regexes}
    end

    def feed(data : ::Bytes?)
      length = data ? data.size : 0
      LibVte.terminal_feed(@pointer.as(LibVte::Terminal*), data ? data.to_unsafe : Pointer(UInt8).null, Int64.new(length))
      nil
    end

    def feed_child(text : ::Bytes?)
      length = text ? text.size : 0
      LibVte.terminal_feed_child(@pointer.as(LibVte::Terminal*), text ? text.to_unsafe : Pointer(UInt8).null, Int64.new(length))
      nil
    end

    def feed_child_binary(data : ::Bytes?)
      length = data ? data.size : 0
      LibVte.terminal_feed_child_binary(@pointer.as(LibVte::Terminal*), data ? data.to_unsafe : Pointer(UInt8).null, UInt64.new(length))
      nil
    end

    def allow_bold
      __var0 = LibVte.terminal_get_allow_bold(@pointer.as(LibVte::Terminal*))
      (__var0 == 1)
    end

    def allow_hyperlink
      __var0 = LibVte.terminal_get_allow_hyperlink(@pointer.as(LibVte::Terminal*))
      (__var0 == 1)
    end

    def audible_bell
      __var0 = LibVte.terminal_get_audible_bell(@pointer.as(LibVte::Terminal*))
      (__var0 == 1)
    end

    def bold_is_bright
      __var0 = LibVte.terminal_get_bold_is_bright(@pointer.as(LibVte::Terminal*))
      (__var0 == 1)
    end

    def cell_height_scale
      __var0 = LibVte.terminal_get_cell_height_scale(@pointer.as(LibVte::Terminal*))
      __var0
    end

    def cell_width_scale
      __var0 = LibVte.terminal_get_cell_width_scale(@pointer.as(LibVte::Terminal*))
      __var0
    end

    def char_height
      __var0 = LibVte.terminal_get_char_height(@pointer.as(LibVte::Terminal*))
      __var0
    end

    def char_width
      __var0 = LibVte.terminal_get_char_width(@pointer.as(LibVte::Terminal*))
      __var0
    end

    def cjk_ambiguous_width
      __var0 = LibVte.terminal_get_cjk_ambiguous_width(@pointer.as(LibVte::Terminal*))
      __var0
    end

    def color_background_for_draw(color : Gdk::RGBA)
      LibVte.terminal_get_color_background_for_draw(@pointer.as(LibVte::Terminal*), color)
      nil
    end

    def column_count
      __var0 = LibVte.terminal_get_column_count(@pointer.as(LibVte::Terminal*))
      __var0
    end

    def current_directory_uri
      __var0 = LibVte.terminal_get_current_directory_uri(@pointer.as(LibVte::Terminal*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def current_file_uri
      __var0 = LibVte.terminal_get_current_file_uri(@pointer.as(LibVte::Terminal*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def cursor_blink_mode
      __var0 = LibVte.terminal_get_cursor_blink_mode(@pointer.as(LibVte::Terminal*))
      Vte::CursorBlinkMode.new(__var0)
    end

    def cursor_position
      LibVte.terminal_get_cursor_position(@pointer.as(LibVte::Terminal*), out column, out row)
      {column, row}
    end

    def cursor_shape
      __var0 = LibVte.terminal_get_cursor_shape(@pointer.as(LibVte::Terminal*))
      Vte::CursorShape.new(__var0)
    end

    def enable_bidi
      __var0 = LibVte.terminal_get_enable_bidi(@pointer.as(LibVte::Terminal*))
      (__var0 == 1)
    end

    def enable_shaping
      __var0 = LibVte.terminal_get_enable_shaping(@pointer.as(LibVte::Terminal*))
      (__var0 == 1)
    end

    def encoding
      __var0 = LibVte.terminal_get_encoding(@pointer.as(LibVte::Terminal*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def font
      __var0 = LibVte.terminal_get_font(@pointer.as(LibVte::Terminal*))
      GObject.raise_unexpected_null("vte_terminal_get_font") if __var0.null?
      Pango::FontDescription.new(__var0)
    end

    def font_scale
      __var0 = LibVte.terminal_get_font_scale(@pointer.as(LibVte::Terminal*))
      __var0
    end

    def geometry_hints(hints : Gdk::Geometry, min_rows : ::Int, min_columns : ::Int)
      LibVte.terminal_get_geometry_hints(@pointer.as(LibVte::Terminal*), hints, Int32.new(min_rows), Int32.new(min_columns))
      nil
    end

    def has_selection
      __var0 = LibVte.terminal_get_has_selection(@pointer.as(LibVte::Terminal*))
      (__var0 == 1)
    end

    def icon_title
      __var0 = LibVte.terminal_get_icon_title(@pointer.as(LibVte::Terminal*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def input_enabled
      __var0 = LibVte.terminal_get_input_enabled(@pointer.as(LibVte::Terminal*))
      (__var0 == 1)
    end

    def mouse_autohide
      __var0 = LibVte.terminal_get_mouse_autohide(@pointer.as(LibVte::Terminal*))
      (__var0 == 1)
    end

    def pty
      __var0 = LibVte.terminal_get_pty(@pointer.as(LibVte::Terminal*))
      GObject.raise_unexpected_null("vte_terminal_get_pty") if __var0.null?
      Vte::Pty.new(__var0)
    end

    def rewrap_on_resize
      __var0 = LibVte.terminal_get_rewrap_on_resize(@pointer.as(LibVte::Terminal*))
      (__var0 == 1)
    end

    def row_count
      __var0 = LibVte.terminal_get_row_count(@pointer.as(LibVte::Terminal*))
      __var0
    end

    def scroll_on_keystroke
      __var0 = LibVte.terminal_get_scroll_on_keystroke(@pointer.as(LibVte::Terminal*))
      (__var0 == 1)
    end

    def scroll_on_output
      __var0 = LibVte.terminal_get_scroll_on_output(@pointer.as(LibVte::Terminal*))
      (__var0 == 1)
    end

    def scrollback_lines
      __var0 = LibVte.terminal_get_scrollback_lines(@pointer.as(LibVte::Terminal*))
      __var0
    end

    def text(is_selected : Vte::SelectionFunc?, user_data : Void*?, attributes : ::Enumerable)
      __var0 = LibVte.terminal_get_text(@pointer.as(LibVte::Terminal*), is_selected ? is_selected : nil, user_data ? user_data : Pointer(Void).null, attributes)
      GObject.raise_unexpected_null("vte_terminal_get_text") if __var0.null?
      ::String.new(__var0)
    end

    def text_blink_mode
      __var0 = LibVte.terminal_get_text_blink_mode(@pointer.as(LibVte::Terminal*))
      Vte::TextBlinkMode.new(__var0)
    end

    def text_include_trailing_spaces(is_selected : Vte::SelectionFunc?, user_data : Void*?, attributes : ::Enumerable)
      __var0 = LibVte.terminal_get_text_include_trailing_spaces(@pointer.as(LibVte::Terminal*), is_selected ? is_selected : nil, user_data ? user_data : Pointer(Void).null, attributes)
      GObject.raise_unexpected_null("vte_terminal_get_text_include_trailing_spaces") if __var0.null?
      ::String.new(__var0)
    end

    def text_range(start_row : ::Int, start_col : ::Int, end_row : ::Int, end_col : ::Int, is_selected : Vte::SelectionFunc?, user_data : Void*?, attributes : ::Enumerable)
      __var0 = LibVte.terminal_get_text_range(@pointer.as(LibVte::Terminal*), Int64.new(start_row), Int64.new(start_col), Int64.new(end_row), Int64.new(end_col), is_selected ? is_selected : nil, user_data ? user_data : Pointer(Void).null, attributes)
      GObject.raise_unexpected_null("vte_terminal_get_text_range") if __var0.null?
      ::String.new(__var0)
    end

    def window_title
      __var0 = LibVte.terminal_get_window_title(@pointer.as(LibVte::Terminal*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def word_char_exceptions
      __var0 = LibVte.terminal_get_word_char_exceptions(@pointer.as(LibVte::Terminal*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def hyperlink_check_event(event : Gdk::Event::Union)
      __var0 = LibVte.terminal_hyperlink_check_event(@pointer.as(LibVte::Terminal*), event.to_unsafe.as(LibGdk::Event*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def match_add_gregex(gregex : GLib::Regex, gflags : GLib::RegexMatchFlags)
      __var0 = LibVte.terminal_match_add_gregex(@pointer.as(LibVte::Terminal*), gregex.to_unsafe.as(LibGLib::Regex*), gflags)
      __var0
    end

    def match_add_regex(regex : Vte::Regex, flags : ::Int)
      __var0 = LibVte.terminal_match_add_regex(@pointer.as(LibVte::Terminal*), regex.to_unsafe.as(LibVte::Regex*), UInt32.new(flags))
      __var0
    end

    def match_check(column : ::Int, row : ::Int)
      __var0 = LibVte.terminal_match_check(@pointer.as(LibVte::Terminal*), Int64.new(column), Int64.new(row), out tag)
      __var1 = ::String.new(__var0) if __var0
      {__var1, tag}
    end

    def match_check_event(event : Gdk::Event::Union)
      __var0 = LibVte.terminal_match_check_event(@pointer.as(LibVte::Terminal*), event.to_unsafe.as(LibGdk::Event*), out tag)
      __var1 = ::String.new(__var0) if __var0
      {__var1, tag}
    end

    def match_remove(tag : ::Int)
      LibVte.terminal_match_remove(@pointer.as(LibVte::Terminal*), Int32.new(tag))
      nil
    end

    def match_remove_all
      LibVte.terminal_match_remove_all(@pointer.as(LibVte::Terminal*))
      nil
    end

    def match_set_cursor(tag : ::Int, cursor : Gdk::Cursor?)
      LibVte.terminal_match_set_cursor(@pointer.as(LibVte::Terminal*), Int32.new(tag), cursor ? cursor.to_unsafe_cursor : Pointer(LibGdk::Cursor).null)
      nil
    end

    def match_set_cursor_name(tag : ::Int, cursor_name : ::String)
      LibVte.terminal_match_set_cursor_name(@pointer.as(LibVte::Terminal*), Int32.new(tag), cursor_name.to_unsafe)
      nil
    end

    def match_set_cursor_type(tag : ::Int, cursor_type : Gdk::CursorType)
      LibVte.terminal_match_set_cursor_type(@pointer.as(LibVte::Terminal*), Int32.new(tag), cursor_type)
      nil
    end

    def paste_clipboard
      LibVte.terminal_paste_clipboard(@pointer.as(LibVte::Terminal*))
      nil
    end

    def paste_primary
      LibVte.terminal_paste_primary(@pointer.as(LibVte::Terminal*))
      nil
    end

    def pty_new_sync(flags : Vte::PtyFlags, cancellable : Gio::Cancellable?)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibVte.terminal_pty_new_sync(@pointer.as(LibVte::Terminal*), flags, cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("vte_terminal_pty_new_sync") if __var1.null?
      Vte::Pty.new(__var1)
    end

    def reset(clear_tabstops : ::Bool, clear_history : ::Bool)
      LibVte.terminal_reset(@pointer.as(LibVte::Terminal*), LibC::Int.new(clear_tabstops ? 1 : 0), LibC::Int.new(clear_history ? 1 : 0))
      nil
    end

    def search_find_next
      __var0 = LibVte.terminal_search_find_next(@pointer.as(LibVte::Terminal*))
      (__var0 == 1)
    end

    def search_find_previous
      __var0 = LibVte.terminal_search_find_previous(@pointer.as(LibVte::Terminal*))
      (__var0 == 1)
    end

    def search_get_gregex
      __var0 = LibVte.terminal_search_get_gregex(@pointer.as(LibVte::Terminal*))
      GObject.raise_unexpected_null("vte_terminal_search_get_gregex") if __var0.null?
      GLib::Regex.new(__var0)
    end

    def search_get_regex
      __var0 = LibVte.terminal_search_get_regex(@pointer.as(LibVte::Terminal*))
      GObject.raise_unexpected_null("vte_terminal_search_get_regex") if __var0.null?
      Vte::Regex.new(__var0)
    end

    def search_get_wrap_around
      __var0 = LibVte.terminal_search_get_wrap_around(@pointer.as(LibVte::Terminal*))
      (__var0 == 1)
    end

    def search_set_gregex(gregex : GLib::Regex?, gflags : GLib::RegexMatchFlags)
      LibVte.terminal_search_set_gregex(@pointer.as(LibVte::Terminal*), gregex ? gregex.to_unsafe.as(LibGLib::Regex*) : Pointer(LibGLib::Regex).null, gflags)
      nil
    end

    def search_set_regex(regex : Vte::Regex?, flags : ::Int)
      LibVte.terminal_search_set_regex(@pointer.as(LibVte::Terminal*), regex ? regex.to_unsafe.as(LibVte::Regex*) : Pointer(LibVte::Regex).null, UInt32.new(flags))
      nil
    end

    def search_set_wrap_around(wrap_around : ::Bool)
      LibVte.terminal_search_set_wrap_around(@pointer.as(LibVte::Terminal*), LibC::Int.new(wrap_around ? 1 : 0))
      nil
    end

    def select_all
      LibVte.terminal_select_all(@pointer.as(LibVte::Terminal*))
      nil
    end

    def allow_bold=(allow_bold : ::Bool)
      LibVte.terminal_set_allow_bold(@pointer.as(LibVte::Terminal*), LibC::Int.new(allow_bold ? 1 : 0))
      nil
    end

    def allow_hyperlink=(allow_hyperlink : ::Bool)
      LibVte.terminal_set_allow_hyperlink(@pointer.as(LibVte::Terminal*), LibC::Int.new(allow_hyperlink ? 1 : 0))
      nil
    end

    def audible_bell=(is_audible : ::Bool)
      LibVte.terminal_set_audible_bell(@pointer.as(LibVte::Terminal*), LibC::Int.new(is_audible ? 1 : 0))
      nil
    end

    def backspace_binding=(binding : Vte::EraseBinding)
      LibVte.terminal_set_backspace_binding(@pointer.as(LibVte::Terminal*), binding)
      nil
    end

    def bold_is_bright=(bold_is_bright : ::Bool)
      LibVte.terminal_set_bold_is_bright(@pointer.as(LibVte::Terminal*), LibC::Int.new(bold_is_bright ? 1 : 0))
      nil
    end

    def cell_height_scale=(scale : ::Float)
      LibVte.terminal_set_cell_height_scale(@pointer.as(LibVte::Terminal*), Float64.new(scale))
      nil
    end

    def cell_width_scale=(scale : ::Float)
      LibVte.terminal_set_cell_width_scale(@pointer.as(LibVte::Terminal*), Float64.new(scale))
      nil
    end

    def cjk_ambiguous_width=(width : ::Int)
      LibVte.terminal_set_cjk_ambiguous_width(@pointer.as(LibVte::Terminal*), Int32.new(width))
      nil
    end

    def clear_background=(setting : ::Bool)
      LibVte.terminal_set_clear_background(@pointer.as(LibVte::Terminal*), LibC::Int.new(setting ? 1 : 0))
      nil
    end

    def color_background=(background : Gdk::RGBA)
      LibVte.terminal_set_color_background(@pointer.as(LibVte::Terminal*), background.to_unsafe.as(LibGdk::RGBA*))
      nil
    end

    def color_bold=(bold : Gdk::RGBA?)
      LibVte.terminal_set_color_bold(@pointer.as(LibVte::Terminal*), bold ? bold.to_unsafe.as(LibGdk::RGBA*) : Pointer(LibGdk::RGBA).null)
      nil
    end

    def color_cursor=(cursor_background : Gdk::RGBA?)
      LibVte.terminal_set_color_cursor(@pointer.as(LibVte::Terminal*), cursor_background ? cursor_background.to_unsafe.as(LibGdk::RGBA*) : Pointer(LibGdk::RGBA).null)
      nil
    end

    def color_cursor_foreground=(cursor_foreground : Gdk::RGBA?)
      LibVte.terminal_set_color_cursor_foreground(@pointer.as(LibVte::Terminal*), cursor_foreground ? cursor_foreground.to_unsafe.as(LibGdk::RGBA*) : Pointer(LibGdk::RGBA).null)
      nil
    end

    def color_foreground=(foreground : Gdk::RGBA)
      LibVte.terminal_set_color_foreground(@pointer.as(LibVte::Terminal*), foreground.to_unsafe.as(LibGdk::RGBA*))
      nil
    end

    def color_highlight=(highlight_background : Gdk::RGBA?)
      LibVte.terminal_set_color_highlight(@pointer.as(LibVte::Terminal*), highlight_background ? highlight_background.to_unsafe.as(LibGdk::RGBA*) : Pointer(LibGdk::RGBA).null)
      nil
    end

    def color_highlight_foreground=(highlight_foreground : Gdk::RGBA?)
      LibVte.terminal_set_color_highlight_foreground(@pointer.as(LibVte::Terminal*), highlight_foreground ? highlight_foreground.to_unsafe.as(LibGdk::RGBA*) : Pointer(LibGdk::RGBA).null)
      nil
    end

    def set_colors(foreground : Gdk::RGBA?, background : Gdk::RGBA?, palette : ::Enumerable?)
      palette_size = palette ? palette.size : 0
      LibVte.terminal_set_colors(@pointer.as(LibVte::Terminal*), foreground ? foreground.to_unsafe.as(LibGdk::RGBA*) : Pointer(LibGdk::RGBA).null, background ? background.to_unsafe.as(LibGdk::RGBA*) : Pointer(LibGdk::RGBA).null, palette ? (__palette_ary = palette.map { |__item| __item }.to_a).to_unsafe : Pointer(LibGdk::RGBA).null, UInt64.new(palette_size))
      nil
    end

    def cursor_blink_mode=(mode : Vte::CursorBlinkMode)
      LibVte.terminal_set_cursor_blink_mode(@pointer.as(LibVte::Terminal*), mode)
      nil
    end

    def cursor_shape=(shape : Vte::CursorShape)
      LibVte.terminal_set_cursor_shape(@pointer.as(LibVte::Terminal*), shape)
      nil
    end

    def set_default_colors
      LibVte.terminal_set_default_colors(@pointer.as(LibVte::Terminal*))
      nil
    end

    def delete_binding=(binding : Vte::EraseBinding)
      LibVte.terminal_set_delete_binding(@pointer.as(LibVte::Terminal*), binding)
      nil
    end

    def enable_bidi=(enable_bidi : ::Bool)
      LibVte.terminal_set_enable_bidi(@pointer.as(LibVte::Terminal*), LibC::Int.new(enable_bidi ? 1 : 0))
      nil
    end

    def enable_shaping=(enable_shaping : ::Bool)
      LibVte.terminal_set_enable_shaping(@pointer.as(LibVte::Terminal*), LibC::Int.new(enable_shaping ? 1 : 0))
      nil
    end

    def set_encoding(codeset : ::String?)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibVte.terminal_set_encoding(@pointer.as(LibVte::Terminal*), codeset ? codeset.to_unsafe : Pointer(UInt8).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def font=(font_desc : Pango::FontDescription?)
      LibVte.terminal_set_font(@pointer.as(LibVte::Terminal*), font_desc ? font_desc.to_unsafe.as(LibPango::FontDescription*) : Pointer(LibPango::FontDescription).null)
      nil
    end

    def font_scale=(scale : ::Float)
      LibVte.terminal_set_font_scale(@pointer.as(LibVte::Terminal*), Float64.new(scale))
      nil
    end

    def geometry_hints_for_window=(window : Gtk::Window)
      LibVte.terminal_set_geometry_hints_for_window(@pointer.as(LibVte::Terminal*), window.to_unsafe_window)
      nil
    end

    def input_enabled=(enabled : ::Bool)
      LibVte.terminal_set_input_enabled(@pointer.as(LibVte::Terminal*), LibC::Int.new(enabled ? 1 : 0))
      nil
    end

    def mouse_autohide=(setting : ::Bool)
      LibVte.terminal_set_mouse_autohide(@pointer.as(LibVte::Terminal*), LibC::Int.new(setting ? 1 : 0))
      nil
    end

    def pty=(pty : Vte::Pty?)
      LibVte.terminal_set_pty(@pointer.as(LibVte::Terminal*), pty ? pty.to_unsafe_pty : Pointer(LibVte::Pty).null)
      nil
    end

    def rewrap_on_resize=(rewrap : ::Bool)
      LibVte.terminal_set_rewrap_on_resize(@pointer.as(LibVte::Terminal*), LibC::Int.new(rewrap ? 1 : 0))
      nil
    end

    def scroll_on_keystroke=(scroll : ::Bool)
      LibVte.terminal_set_scroll_on_keystroke(@pointer.as(LibVte::Terminal*), LibC::Int.new(scroll ? 1 : 0))
      nil
    end

    def scroll_on_output=(scroll : ::Bool)
      LibVte.terminal_set_scroll_on_output(@pointer.as(LibVte::Terminal*), LibC::Int.new(scroll ? 1 : 0))
      nil
    end

    def scrollback_lines=(lines : ::Int)
      LibVte.terminal_set_scrollback_lines(@pointer.as(LibVte::Terminal*), Int64.new(lines))
      nil
    end

    def set_size(columns : ::Int, rows : ::Int)
      LibVte.terminal_set_size(@pointer.as(LibVte::Terminal*), Int64.new(columns), Int64.new(rows))
      nil
    end

    def text_blink_mode=(text_blink_mode : Vte::TextBlinkMode)
      LibVte.terminal_set_text_blink_mode(@pointer.as(LibVte::Terminal*), text_blink_mode)
      nil
    end

    def word_char_exceptions=(exceptions : ::String)
      LibVte.terminal_set_word_char_exceptions(@pointer.as(LibVte::Terminal*), exceptions.to_unsafe)
      nil
    end

    def spawn_async(pty_flags : Vte::PtyFlags, working_directory : ::String?, argv : ::Enumerable, envv : ::Enumerable?, spawn_flags_ : GLib::SpawnFlags, child_setup : GLib::SpawnChildSetupFunc?, child_setup_data : Void*?, child_setup_data_destroy : GLib::DestroyNotify, timeout : ::Int, cancellable : Gio::Cancellable?, callback : Vte::TerminalSpawnAsyncCallback?, user_data : Void*?)
      LibVte.terminal_spawn_async(@pointer.as(LibVte::Terminal*), pty_flags, working_directory ? working_directory.to_unsafe : Pointer(UInt8).null, (__argv_ary = argv.map { |__item| __item.to_unsafe }.to_a).to_unsafe, envv ? (__envv_ary = envv.map { |__item| __item.to_unsafe }.to_a).to_unsafe : Pointer(Pointer(UInt8)).null, spawn_flags_, child_setup ? child_setup : nil, child_setup_data ? child_setup_data : Pointer(Void).null, child_setup_data_destroy, Int32.new(timeout), cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, callback ? callback : nil, user_data ? user_data : Pointer(Void).null)
      nil
    end

    def spawn_sync(pty_flags : Vte::PtyFlags, working_directory : ::String?, argv : ::Enumerable, envv : ::Enumerable?, spawn_flags : GLib::SpawnFlags, child_setup : GLib::SpawnChildSetupFunc?, child_setup_data : Void*?, cancellable : Gio::Cancellable?)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibVte.terminal_spawn_sync(@pointer.as(LibVte::Terminal*), pty_flags, working_directory ? working_directory.to_unsafe : Pointer(UInt8).null, (__argv_ary = argv.map { |__item| __item.to_unsafe }.to_a).to_unsafe, envv ? (__envv_ary = envv.map { |__item| __item.to_unsafe }.to_a).to_unsafe : Pointer(Pointer(UInt8)).null, spawn_flags, child_setup ? child_setup : nil, child_setup_data ? child_setup_data : Pointer(Void).null, out child_pid, cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      {(__var1 == 1), child_pid}
    end

    def unselect_all
      LibVte.terminal_unselect_all(@pointer.as(LibVte::Terminal*))
      nil
    end

    def watch_child(child_pid : ::Int)
      LibVte.terminal_watch_child(@pointer.as(LibVte::Terminal*), Int32.new(child_pid))
      nil
    end

    def write_contents_sync(stream : Gio::OutputStream, flags : Vte::WriteFlags, cancellable : Gio::Cancellable?)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibVte.terminal_write_contents_sync(@pointer.as(LibVte::Terminal*), stream.to_unsafe_outputstream, flags, cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def font_desc : Pango::FontDescription
      __var0 = GObject::Value.new(type: GObject::Type::OBJECT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "font-desc", __var0)
      Pango::FontDescription.cast(__var0.object)
    end

    def font_desc=(value : Pango::FontDescription)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "font-desc", value.to_gvalue)
    end

    def hyperlink_hover_uri : ::String
      __var0 = GObject::Value.new(type: GObject::Type::UTF8)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "hyperlink-hover-uri", __var0)
      __var0.string
    end

    def pointer_autohide : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "pointer-autohide", __var0)
      __var0.boolean
    end

    def pointer_autohide=(value : ::Bool)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "pointer-autohide", value.to_gvalue)
    end

    alias BellSignal = Terminal -> Nil

    def on_bell(*, after = false, &block : BellSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(BellSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(BellSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "bell", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_bell(&block : BellSignal)
      on_bell(after: true, &block)
    end

    alias CharSizeChangedSignal = Terminal, UInt32, UInt32 -> Nil

    def on_char_size_changed(*, after = false, &block : CharSizeChangedSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, arg1 : UInt32, arg2 : UInt32, box : Void*) {
        ::Box(CharSizeChangedSignal).unbox(box).call(Terminal.new(arg0), arg1, arg2)
      }

      __var1 = ::Box.box(CharSizeChangedSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "char-size-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_char_size_changed(&block : CharSizeChangedSignal)
      on_char_size_changed(after: true, &block)
    end

    alias ChildExitedSignal = Terminal, Int32 -> Nil

    def on_child_exited(*, after = false, &block : ChildExitedSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, arg1 : Int32, box : Void*) {
        ::Box(ChildExitedSignal).unbox(box).call(Terminal.new(arg0), arg1)
      }

      __var1 = ::Box.box(ChildExitedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "child-exited", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_child_exited(&block : ChildExitedSignal)
      on_child_exited(after: true, &block)
    end

    alias CommitSignal = Terminal, ::String, UInt32 -> Nil

    def on_commit(*, after = false, &block : CommitSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, arg1 : Pointer(UInt8), arg2 : UInt32, box : Void*) {
        ::Box(CommitSignal).unbox(box).call(Terminal.new(arg0), ::String.new(arg1), arg2)
      }

      __var1 = ::Box.box(CommitSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "commit", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_commit(&block : CommitSignal)
      on_commit(after: true, &block)
    end

    alias ContentsChangedSignal = Terminal -> Nil

    def on_contents_changed(*, after = false, &block : ContentsChangedSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(ContentsChangedSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(ContentsChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "contents-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_contents_changed(&block : ContentsChangedSignal)
      on_contents_changed(after: true, &block)
    end

    alias CopyClipboardSignal = Terminal -> Nil

    def on_copy_clipboard(*, after = false, &block : CopyClipboardSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(CopyClipboardSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(CopyClipboardSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "copy-clipboard", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_copy_clipboard(&block : CopyClipboardSignal)
      on_copy_clipboard(after: true, &block)
    end

    alias CurrentDirectoryUriChangedSignal = Terminal -> Nil

    def on_current_directory_uri_changed(*, after = false, &block : CurrentDirectoryUriChangedSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(CurrentDirectoryUriChangedSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(CurrentDirectoryUriChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "current-directory-uri-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_current_directory_uri_changed(&block : CurrentDirectoryUriChangedSignal)
      on_current_directory_uri_changed(after: true, &block)
    end

    alias CurrentFileUriChangedSignal = Terminal -> Nil

    def on_current_file_uri_changed(*, after = false, &block : CurrentFileUriChangedSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(CurrentFileUriChangedSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(CurrentFileUriChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "current-file-uri-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_current_file_uri_changed(&block : CurrentFileUriChangedSignal)
      on_current_file_uri_changed(after: true, &block)
    end

    alias CursorMovedSignal = Terminal -> Nil

    def on_cursor_moved(*, after = false, &block : CursorMovedSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(CursorMovedSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(CursorMovedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "cursor-moved", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_cursor_moved(&block : CursorMovedSignal)
      on_cursor_moved(after: true, &block)
    end

    alias DecreaseFontSizeSignal = Terminal -> Nil

    def on_decrease_font_size(*, after = false, &block : DecreaseFontSizeSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(DecreaseFontSizeSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(DecreaseFontSizeSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "decrease-font-size", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_decrease_font_size(&block : DecreaseFontSizeSignal)
      on_decrease_font_size(after: true, &block)
    end

    alias DeiconifyWindowSignal = Terminal -> Nil

    def on_deiconify_window(*, after = false, &block : DeiconifyWindowSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(DeiconifyWindowSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(DeiconifyWindowSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "deiconify-window", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_deiconify_window(&block : DeiconifyWindowSignal)
      on_deiconify_window(after: true, &block)
    end

    alias EncodingChangedSignal = Terminal -> Nil

    def on_encoding_changed(*, after = false, &block : EncodingChangedSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(EncodingChangedSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(EncodingChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "encoding-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_encoding_changed(&block : EncodingChangedSignal)
      on_encoding_changed(after: true, &block)
    end

    alias EofSignal = Terminal -> Nil

    def on_eof(*, after = false, &block : EofSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(EofSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(EofSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "eof", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_eof(&block : EofSignal)
      on_eof(after: true, &block)
    end

    alias HyperlinkHoverUriChangedSignal = Terminal, ::String, Gdk::Rectangle -> Nil

    def on_hyperlink_hover_uri_changed(*, after = false, &block : HyperlinkHoverUriChangedSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, arg1 : Pointer(UInt8), arg2 : LibGdk::Rectangle*, box : Void*) {
        ::Box(HyperlinkHoverUriChangedSignal).unbox(box).call(Terminal.new(arg0), ::String.new(arg1), arg2.null? ? GObject.raise_unexpected_null("bbox in hyperlink_hover_uri_changed") : Gdk::Rectangle.new(arg2))
      }

      __var1 = ::Box.box(HyperlinkHoverUriChangedSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "hyperlink-hover-uri-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_hyperlink_hover_uri_changed(&block : HyperlinkHoverUriChangedSignal)
      on_hyperlink_hover_uri_changed(after: true, &block)
    end

    alias IconTitleChangedSignal = Terminal -> Nil

    def on_icon_title_changed(*, after = false, &block : IconTitleChangedSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(IconTitleChangedSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(IconTitleChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "icon-title-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_icon_title_changed(&block : IconTitleChangedSignal)
      on_icon_title_changed(after: true, &block)
    end

    alias IconifyWindowSignal = Terminal -> Nil

    def on_iconify_window(*, after = false, &block : IconifyWindowSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(IconifyWindowSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(IconifyWindowSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "iconify-window", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_iconify_window(&block : IconifyWindowSignal)
      on_iconify_window(after: true, &block)
    end

    alias IncreaseFontSizeSignal = Terminal -> Nil

    def on_increase_font_size(*, after = false, &block : IncreaseFontSizeSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(IncreaseFontSizeSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(IncreaseFontSizeSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "increase-font-size", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_increase_font_size(&block : IncreaseFontSizeSignal)
      on_increase_font_size(after: true, &block)
    end

    alias LowerWindowSignal = Terminal -> Nil

    def on_lower_window(*, after = false, &block : LowerWindowSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(LowerWindowSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(LowerWindowSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "lower-window", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_lower_window(&block : LowerWindowSignal)
      on_lower_window(after: true, &block)
    end

    alias MaximizeWindowSignal = Terminal -> Nil

    def on_maximize_window(*, after = false, &block : MaximizeWindowSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(MaximizeWindowSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(MaximizeWindowSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "maximize-window", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_maximize_window(&block : MaximizeWindowSignal)
      on_maximize_window(after: true, &block)
    end

    alias MoveWindowSignal = Terminal, UInt32, UInt32 -> Nil

    def on_move_window(*, after = false, &block : MoveWindowSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, arg1 : UInt32, arg2 : UInt32, box : Void*) {
        ::Box(MoveWindowSignal).unbox(box).call(Terminal.new(arg0), arg1, arg2)
      }

      __var1 = ::Box.box(MoveWindowSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "move-window", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_move_window(&block : MoveWindowSignal)
      on_move_window(after: true, &block)
    end

    alias PasteClipboardSignal = Terminal -> Nil

    def on_paste_clipboard(*, after = false, &block : PasteClipboardSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(PasteClipboardSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(PasteClipboardSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "paste-clipboard", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_paste_clipboard(&block : PasteClipboardSignal)
      on_paste_clipboard(after: true, &block)
    end

    alias RaiseWindowSignal = Terminal -> Nil

    def on_raise_window(*, after = false, &block : RaiseWindowSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(RaiseWindowSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(RaiseWindowSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "raise-window", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_raise_window(&block : RaiseWindowSignal)
      on_raise_window(after: true, &block)
    end

    alias RefreshWindowSignal = Terminal -> Nil

    def on_refresh_window(*, after = false, &block : RefreshWindowSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(RefreshWindowSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(RefreshWindowSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "refresh-window", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_refresh_window(&block : RefreshWindowSignal)
      on_refresh_window(after: true, &block)
    end

    alias ResizeWindowSignal = Terminal, UInt32, UInt32 -> Nil

    def on_resize_window(*, after = false, &block : ResizeWindowSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, arg1 : UInt32, arg2 : UInt32, box : Void*) {
        ::Box(ResizeWindowSignal).unbox(box).call(Terminal.new(arg0), arg1, arg2)
      }

      __var1 = ::Box.box(ResizeWindowSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "resize-window", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_resize_window(&block : ResizeWindowSignal)
      on_resize_window(after: true, &block)
    end

    alias RestoreWindowSignal = Terminal -> Nil

    def on_restore_window(*, after = false, &block : RestoreWindowSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(RestoreWindowSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(RestoreWindowSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "restore-window", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_restore_window(&block : RestoreWindowSignal)
      on_restore_window(after: true, &block)
    end

    alias SelectionChangedSignal = Terminal -> Nil

    def on_selection_changed(*, after = false, &block : SelectionChangedSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(SelectionChangedSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(SelectionChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "selection-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_selection_changed(&block : SelectionChangedSignal)
      on_selection_changed(after: true, &block)
    end

    alias TextDeletedSignal = Terminal -> Nil

    def on_text_deleted(*, after = false, &block : TextDeletedSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(TextDeletedSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(TextDeletedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "text-deleted", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_text_deleted(&block : TextDeletedSignal)
      on_text_deleted(after: true, &block)
    end

    alias TextInsertedSignal = Terminal -> Nil

    def on_text_inserted(*, after = false, &block : TextInsertedSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(TextInsertedSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(TextInsertedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "text-inserted", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_text_inserted(&block : TextInsertedSignal)
      on_text_inserted(after: true, &block)
    end

    alias TextModifiedSignal = Terminal -> Nil

    def on_text_modified(*, after = false, &block : TextModifiedSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(TextModifiedSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(TextModifiedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "text-modified", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_text_modified(&block : TextModifiedSignal)
      on_text_modified(after: true, &block)
    end

    alias TextScrolledSignal = Terminal, Int32 -> Nil

    def on_text_scrolled(*, after = false, &block : TextScrolledSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, arg1 : Int32, box : Void*) {
        ::Box(TextScrolledSignal).unbox(box).call(Terminal.new(arg0), arg1)
      }

      __var1 = ::Box.box(TextScrolledSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "text-scrolled", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_text_scrolled(&block : TextScrolledSignal)
      on_text_scrolled(after: true, &block)
    end

    alias WindowTitleChangedSignal = Terminal -> Nil

    def on_window_title_changed(*, after = false, &block : WindowTitleChangedSignal)
      __var0 = ->(arg0 : LibVte::Terminal*, box : Void*) {
        ::Box(WindowTitleChangedSignal).unbox(box).call(Terminal.new(arg0))
      }

      __var1 = ::Box.box(WindowTitleChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "window-title-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_window_title_changed(&block : WindowTitleChangedSignal)
      on_window_title_changed(after: true, &block)
    end
  end

  class TerminalClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(1184u64, 0u8).as(LibVte::TerminalClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibVte::TerminalClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibVte::TerminalClass*)
    end

    def to_unsafe_terminalclass
      @pointer.not_nil!.as(LibVte::TerminalClass*)
    end

    def parent_class
      Gtk::WidgetClass.new(to_unsafe.as(LibVte::TerminalClass*).value.parent_class)
    end

    def eof
      to_unsafe.as(LibVte::TerminalClass*).value.eof
    end

    def child_exited
      to_unsafe.as(LibVte::TerminalClass*).value.child_exited
    end

    def encoding_changed
      to_unsafe.as(LibVte::TerminalClass*).value.encoding_changed
    end

    def char_size_changed
      to_unsafe.as(LibVte::TerminalClass*).value.char_size_changed
    end

    def window_title_changed
      to_unsafe.as(LibVte::TerminalClass*).value.window_title_changed
    end

    def icon_title_changed
      to_unsafe.as(LibVte::TerminalClass*).value.icon_title_changed
    end

    def selection_changed
      to_unsafe.as(LibVte::TerminalClass*).value.selection_changed
    end

    def contents_changed
      to_unsafe.as(LibVte::TerminalClass*).value.contents_changed
    end

    def cursor_moved
      to_unsafe.as(LibVte::TerminalClass*).value.cursor_moved
    end

    def commit
      to_unsafe.as(LibVte::TerminalClass*).value.commit
    end

    def deiconify_window
      to_unsafe.as(LibVte::TerminalClass*).value.deiconify_window
    end

    def iconify_window
      to_unsafe.as(LibVte::TerminalClass*).value.iconify_window
    end

    def raise_window
      to_unsafe.as(LibVte::TerminalClass*).value.raise_window
    end

    def lower_window
      to_unsafe.as(LibVte::TerminalClass*).value.lower_window
    end

    def refresh_window
      to_unsafe.as(LibVte::TerminalClass*).value.refresh_window
    end

    def restore_window
      to_unsafe.as(LibVte::TerminalClass*).value.restore_window
    end

    def maximize_window
      to_unsafe.as(LibVte::TerminalClass*).value.maximize_window
    end

    def resize_window
      to_unsafe.as(LibVte::TerminalClass*).value.resize_window
    end

    def move_window
      to_unsafe.as(LibVte::TerminalClass*).value.move_window
    end

    def increase_font_size
      to_unsafe.as(LibVte::TerminalClass*).value.increase_font_size
    end

    def decrease_font_size
      to_unsafe.as(LibVte::TerminalClass*).value.decrease_font_size
    end

    def text_modified
      to_unsafe.as(LibVte::TerminalClass*).value.text_modified
    end

    def text_inserted
      to_unsafe.as(LibVte::TerminalClass*).value.text_inserted
    end

    def text_deleted
      to_unsafe.as(LibVte::TerminalClass*).value.text_deleted
    end

    def text_scrolled
      to_unsafe.as(LibVte::TerminalClass*).value.text_scrolled
    end

    def copy_clipboard
      to_unsafe.as(LibVte::TerminalClass*).value.copy_clipboard
    end

    def paste_clipboard
      to_unsafe.as(LibVte::TerminalClass*).value.paste_clipboard
    end

    def bell
      to_unsafe.as(LibVte::TerminalClass*).value.bell
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibVte::TerminalClass*).value.padding) { |__var0|
        __var0
      }
    end

    def priv
      Vte::TerminalClassPrivate.new(to_unsafe.as(LibVte::TerminalClass*).value.priv)
    end
  end

  class TerminalClassPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibVte::TerminalClassPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibVte::TerminalClassPrivate*)
    end

    def to_unsafe_terminalclassprivate
      @pointer.not_nil!.as(LibVte::TerminalClassPrivate*)
    end
  end

  alias TerminalSpawnAsyncCallback = LibVte::TerminalSpawnAsyncCallback

  enum TextBlinkMode : UInt32
    NEVER     = 0
    FOCUSED   = 1
    UNFOCUSED = 2
    ALWAYS    = 3
  end

  enum WriteFlags : UInt32
    DEFAULT = 0
  end
end
