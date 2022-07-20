require_gobject("xlib", "2.0")
require_gobject("GLib", "2.0")
require_gobject("Gdk", "3.0")
require_gobject("GdkPixbuf", "2.0")
require_gobject("Gtk", "3.0")
require_gobject("cairo", "1.0")
require_gobject("GObject", "2.0")
require_gobject("Pango", "1.0")
require_gobject("Gio", "2.0")
require_gobject("GModule", "2.0")
require_gobject("Atk", "1.0")

@[Link("gtksourceview-4", pkg_config: "gtksourceview-4")]
lib LibGtkSource
  ###########################################
  # #    Enums
  ###########################################

  alias BackgroundPatternType = UInt32

  alias BracketMatchType = UInt32

  alias ChangeCaseType = UInt32

  alias CompletionError = UInt32
  fun completion_error_quark = gtk_source_completion_error_quark : UInt32

  alias CompressionType = UInt32

  alias FileLoaderError = UInt32
  fun file_loader_error_quark = gtk_source_file_loader_error_quark : UInt32

  alias FileSaverError = UInt32
  fun file_saver_error_quark = gtk_source_file_saver_error_quark : UInt32

  alias GutterRendererAlignmentMode = UInt32

  alias NewlineType = UInt32

  alias SmartHomeEndType = UInt32

  alias ViewGutterPosition = Int32

  ###########################################
  # #    Objects
  ###########################################

  struct Buffer # object
    parent_instance : LibGtk::TextBuffer
    priv : Pointer(LibGtkSource::BufferPrivate)
    # Signal bracket-matched
    # Signal highlight-updated
    # Signal redo
    # Signal source-mark-updated
    # Signal undo
    # Virtual function bracket_matched
    # Virtual function redo
    # Virtual function undo
    # Property can-redo : LibC::Int
    # Property can-undo : LibC::Int
    # Property highlight-matching-brackets : LibC::Int
    # Property highlight-syntax : LibC::Int
    # Property implicit-trailing-newline : LibC::Int
    # Property language : LibGtkSource::Language
    # Property max-undo-levels : Int32
    # Property style-scheme : LibGtkSource::StyleScheme
    # Property undo-manager : LibGtkSource::UndoManager
  end

  fun _gtk_source_buffer_get_type = gtk_source_buffer_get_type : UInt64
  fun buffer_new = gtk_source_buffer_new(table : Pointer(LibGtk::TextTagTable)) : Pointer(LibGtkSource::Buffer)
  fun buffer_new_with_language = gtk_source_buffer_new_with_language(language : Pointer(LibGtkSource::Language)) : Pointer(LibGtkSource::Buffer)
  fun buffer_backward_iter_to_source_mark = gtk_source_buffer_backward_iter_to_source_mark(this : Buffer*, iter : LibGtk::TextIter*, category : Pointer(UInt8)) : LibC::Int
  fun buffer_begin_not_undoable_action = gtk_source_buffer_begin_not_undoable_action(this : Buffer*) : Void
  fun buffer_can_redo = gtk_source_buffer_can_redo(this : Buffer*) : LibC::Int
  fun buffer_can_undo = gtk_source_buffer_can_undo(this : Buffer*) : LibC::Int
  fun buffer_change_case = gtk_source_buffer_change_case(this : Buffer*, case_type : LibGtkSource::ChangeCaseType, start : Pointer(LibGtk::TextIter), _end : Pointer(LibGtk::TextIter)) : Void
  fun buffer_create_source_mark = gtk_source_buffer_create_source_mark(this : Buffer*, name : Pointer(UInt8), category : Pointer(UInt8), where : Pointer(LibGtk::TextIter)) : Pointer(LibGtkSource::Mark)
  fun buffer_end_not_undoable_action = gtk_source_buffer_end_not_undoable_action(this : Buffer*) : Void
  fun buffer_ensure_highlight = gtk_source_buffer_ensure_highlight(this : Buffer*, start : Pointer(LibGtk::TextIter), _end : Pointer(LibGtk::TextIter)) : Void
  fun buffer_forward_iter_to_source_mark = gtk_source_buffer_forward_iter_to_source_mark(this : Buffer*, iter : LibGtk::TextIter*, category : Pointer(UInt8)) : LibC::Int
  fun buffer_get_context_classes_at_iter = gtk_source_buffer_get_context_classes_at_iter(this : Buffer*, iter : Pointer(LibGtk::TextIter)) : Pointer(Pointer(UInt8))
  fun buffer_get_highlight_matching_brackets = gtk_source_buffer_get_highlight_matching_brackets(this : Buffer*) : LibC::Int
  fun buffer_get_highlight_syntax = gtk_source_buffer_get_highlight_syntax(this : Buffer*) : LibC::Int
  fun buffer_get_implicit_trailing_newline = gtk_source_buffer_get_implicit_trailing_newline(this : Buffer*) : LibC::Int
  fun buffer_get_language = gtk_source_buffer_get_language(this : Buffer*) : Pointer(LibGtkSource::Language)
  fun buffer_get_max_undo_levels = gtk_source_buffer_get_max_undo_levels(this : Buffer*) : Int32
  fun buffer_get_source_marks_at_iter = gtk_source_buffer_get_source_marks_at_iter(this : Buffer*, iter : Pointer(LibGtk::TextIter), category : Pointer(UInt8)) : Pointer(Void*)
  fun buffer_get_source_marks_at_line = gtk_source_buffer_get_source_marks_at_line(this : Buffer*, line : Int32, category : Pointer(UInt8)) : Pointer(Void*)
  fun buffer_get_style_scheme = gtk_source_buffer_get_style_scheme(this : Buffer*) : Pointer(LibGtkSource::StyleScheme)
  fun buffer_get_undo_manager = gtk_source_buffer_get_undo_manager(this : Buffer*) : Pointer(LibGtkSource::UndoManager)
  fun buffer_iter_backward_to_context_class_toggle = gtk_source_buffer_iter_backward_to_context_class_toggle(this : Buffer*, iter : LibGtk::TextIter*, context_class : Pointer(UInt8)) : LibC::Int
  fun buffer_iter_forward_to_context_class_toggle = gtk_source_buffer_iter_forward_to_context_class_toggle(this : Buffer*, iter : LibGtk::TextIter*, context_class : Pointer(UInt8)) : LibC::Int
  fun buffer_iter_has_context_class = gtk_source_buffer_iter_has_context_class(this : Buffer*, iter : Pointer(LibGtk::TextIter), context_class : Pointer(UInt8)) : LibC::Int
  fun buffer_join_lines = gtk_source_buffer_join_lines(this : Buffer*, start : Pointer(LibGtk::TextIter), _end : Pointer(LibGtk::TextIter)) : Void
  fun buffer_redo = gtk_source_buffer_redo(this : Buffer*) : Void
  fun buffer_remove_source_marks = gtk_source_buffer_remove_source_marks(this : Buffer*, start : Pointer(LibGtk::TextIter), _end : Pointer(LibGtk::TextIter), category : Pointer(UInt8)) : Void
  fun buffer_set_highlight_matching_brackets = gtk_source_buffer_set_highlight_matching_brackets(this : Buffer*, highlight : LibC::Int) : Void
  fun buffer_set_highlight_syntax = gtk_source_buffer_set_highlight_syntax(this : Buffer*, highlight : LibC::Int) : Void
  fun buffer_set_implicit_trailing_newline = gtk_source_buffer_set_implicit_trailing_newline(this : Buffer*, implicit_trailing_newline : LibC::Int) : Void
  fun buffer_set_language = gtk_source_buffer_set_language(this : Buffer*, language : Pointer(LibGtkSource::Language)) : Void
  fun buffer_set_max_undo_levels = gtk_source_buffer_set_max_undo_levels(this : Buffer*, max_undo_levels : Int32) : Void
  fun buffer_set_style_scheme = gtk_source_buffer_set_style_scheme(this : Buffer*, scheme : Pointer(LibGtkSource::StyleScheme)) : Void
  fun buffer_set_undo_manager = gtk_source_buffer_set_undo_manager(this : Buffer*, manager : Pointer(LibGtkSource::UndoManager)) : Void
  fun buffer_sort_lines = gtk_source_buffer_sort_lines(this : Buffer*, start : Pointer(LibGtk::TextIter), _end : Pointer(LibGtk::TextIter), flags : LibGtkSource::SortFlags, column : Int32) : Void
  fun buffer_undo = gtk_source_buffer_undo(this : Buffer*) : Void

  struct Completion # object
    parent_instance : LibGObject::Object
    priv : Pointer(LibGtkSource::CompletionPrivate)
    # Signal activate-proposal
    # Signal hide
    # Signal move-cursor
    # Signal move-page
    # Signal populate-context
    # Signal show
    # Virtual function activate_proposal
    # Virtual function hide
    # Virtual function move_cursor
    # Virtual function move_page
    # Virtual function populate_context
    # Virtual function proposal_activated
    # Virtual function show
    # Property accelerators : UInt32
    # Property auto-complete-delay : UInt32
    # Property proposal-page-size : UInt32
    # Property provider-page-size : UInt32
    # Property remember-info-visibility : LibC::Int
    # Property select-on-show : LibC::Int
    # Property show-headers : LibC::Int
    # Property show-icons : LibC::Int
    # Property view : LibGtkSource::View
  end

  fun _gtk_source_completion_get_type = gtk_source_completion_get_type : UInt64
  fun completion_add_provider = gtk_source_completion_add_provider(this : Completion*, provider : Pointer(LibGtkSource::CompletionProvider), error : LibGLib::Error**) : LibC::Int
  fun completion_block_interactive = gtk_source_completion_block_interactive(this : Completion*) : Void
  fun completion_create_context = gtk_source_completion_create_context(this : Completion*, position : Pointer(LibGtk::TextIter)) : Pointer(LibGtkSource::CompletionContext)
  fun completion_get_info_window = gtk_source_completion_get_info_window(this : Completion*) : Pointer(LibGtkSource::CompletionInfo)
  fun completion_get_providers = gtk_source_completion_get_providers(this : Completion*) : Pointer(Void*)
  fun completion_get_view = gtk_source_completion_get_view(this : Completion*) : Pointer(LibGtkSource::View)
  fun completion_hide = gtk_source_completion_hide(this : Completion*) : Void
  fun completion_remove_provider = gtk_source_completion_remove_provider(this : Completion*, provider : Pointer(LibGtkSource::CompletionProvider), error : LibGLib::Error**) : LibC::Int
  fun completion_start = gtk_source_completion_start(this : Completion*, providers : Pointer(Void*), context : Pointer(LibGtkSource::CompletionContext)) : LibC::Int
  fun completion_unblock_interactive = gtk_source_completion_unblock_interactive(this : Completion*) : Void

  struct CompletionContext # object
    parent : LibGObject::InitiallyUnowned
    priv : Pointer(LibGtkSource::CompletionContextPrivate)
    # Signal cancelled
    # Virtual function cancelled
    # Property activation : LibGtkSource::CompletionActivation
    # Property completion : LibGtkSource::Completion
    # Property iter : LibGtk::TextIter
  end

  fun _gtk_source_completion_context_get_type = gtk_source_completion_context_get_type : UInt64
  fun completion_context_add_proposals = gtk_source_completion_context_add_proposals(this : CompletionContext*, provider : Pointer(LibGtkSource::CompletionProvider), proposals : Pointer(Void*), finished : LibC::Int) : Void
  fun completion_context_get_activation = gtk_source_completion_context_get_activation(this : CompletionContext*) : LibGtkSource::CompletionActivation
  fun completion_context_get_iter = gtk_source_completion_context_get_iter(this : CompletionContext*, iter : LibGtk::TextIter*) : LibC::Int

  struct CompletionInfo # object
    parent : LibGtk::Window
    priv : Pointer(LibGtkSource::CompletionInfoPrivate)
  end

  fun _gtk_source_completion_info_get_type = gtk_source_completion_info_get_type : UInt64
  fun completion_info_new = gtk_source_completion_info_new : Pointer(LibGtkSource::CompletionInfo)
  fun completion_info_move_to_iter = gtk_source_completion_info_move_to_iter(this : CompletionInfo*, view : Pointer(LibGtk::TextView), iter : Pointer(LibGtk::TextIter)) : Void

  struct CompletionItem # object
    parent : LibGObject::Object
    priv : Pointer(LibGtkSource::CompletionItemPrivate)
    # Property gicon : LibGio::Icon
    # Property icon : LibGdkPixbuf::Pixbuf
    # Property icon-name : Pointer(UInt8)
    # Property info : Pointer(UInt8)
    # Property label : Pointer(UInt8)
    # Property markup : Pointer(UInt8)
    # Property text : Pointer(UInt8)
  end

  fun _gtk_source_completion_item_get_type = gtk_source_completion_item_get_type : UInt64
  fun completion_item_new = gtk_source_completion_item_new : Pointer(LibGtkSource::CompletionItem)
  fun completion_item_set_gicon = gtk_source_completion_item_set_gicon(this : CompletionItem*, gicon : Pointer(LibGio::Icon)) : Void
  fun completion_item_set_icon = gtk_source_completion_item_set_icon(this : CompletionItem*, icon : Pointer(LibGdkPixbuf::Pixbuf)) : Void
  fun completion_item_set_icon_name = gtk_source_completion_item_set_icon_name(this : CompletionItem*, icon_name : Pointer(UInt8)) : Void
  fun completion_item_set_info = gtk_source_completion_item_set_info(this : CompletionItem*, info : Pointer(UInt8)) : Void
  fun completion_item_set_label = gtk_source_completion_item_set_label(this : CompletionItem*, label : Pointer(UInt8)) : Void
  fun completion_item_set_markup = gtk_source_completion_item_set_markup(this : CompletionItem*, markup : Pointer(UInt8)) : Void
  fun completion_item_set_text = gtk_source_completion_item_set_text(this : CompletionItem*, text : Pointer(UInt8)) : Void

  struct CompletionWords # object
    parent : LibGObject::Object
    priv : Pointer(LibGtkSource::CompletionWordsPrivate)
    # Property activation : LibGtkSource::CompletionActivation
    # Property icon : LibGdkPixbuf::Pixbuf
    # Property interactive-delay : Int32
    # Property minimum-word-size : UInt32
    # Property name : Pointer(UInt8)
    # Property priority : Int32
    # Property proposals-batch-size : UInt32
    # Property scan-batch-size : UInt32
  end

  fun _gtk_source_completion_words_get_type = gtk_source_completion_words_get_type : UInt64
  fun completion_words_new = gtk_source_completion_words_new(name : Pointer(UInt8), icon : Pointer(LibGdkPixbuf::Pixbuf)) : Pointer(LibGtkSource::CompletionWords)
  fun completion_words_register = gtk_source_completion_words_register(this : CompletionWords*, buffer : Pointer(LibGtk::TextBuffer)) : Void
  fun completion_words_unregister = gtk_source_completion_words_unregister(this : CompletionWords*, buffer : Pointer(LibGtk::TextBuffer)) : Void

  struct File # object
    parent : LibGObject::Object
    priv : Pointer(LibGtkSource::FilePrivate)
    # Property compression-type : LibGtkSource::CompressionType
    # Property encoding : LibGtkSource::Encoding
    # Property location : LibGio::File
    # Property newline-type : LibGtkSource::NewlineType
    # Property read-only : LibC::Int
  end

  fun _gtk_source_file_get_type = gtk_source_file_get_type : UInt64
  fun file_new = gtk_source_file_new : Pointer(LibGtkSource::File)
  fun file_check_file_on_disk = gtk_source_file_check_file_on_disk(this : File*) : Void
  fun file_get_compression_type = gtk_source_file_get_compression_type(this : File*) : LibGtkSource::CompressionType
  fun file_get_encoding = gtk_source_file_get_encoding(this : File*) : Pointer(LibGtkSource::Encoding)
  fun file_get_location = gtk_source_file_get_location(this : File*) : Pointer(LibGio::File)
  fun file_get_newline_type = gtk_source_file_get_newline_type(this : File*) : LibGtkSource::NewlineType
  fun file_is_deleted = gtk_source_file_is_deleted(this : File*) : LibC::Int
  fun file_is_externally_modified = gtk_source_file_is_externally_modified(this : File*) : LibC::Int
  fun file_is_local = gtk_source_file_is_local(this : File*) : LibC::Int
  fun file_is_readonly = gtk_source_file_is_readonly(this : File*) : LibC::Int
  fun file_set_location = gtk_source_file_set_location(this : File*, location : Pointer(LibGio::File)) : Void

  struct FileLoader # object
    parent : LibGObject::Object
    priv : Pointer(LibGtkSource::FileLoaderPrivate)
    # Property buffer : LibGtkSource::Buffer
    # Property file : LibGtkSource::File
    # Property input-stream : LibGio::InputStream
    # Property location : LibGio::File
  end

  fun _gtk_source_file_loader_get_type = gtk_source_file_loader_get_type : UInt64
  fun file_loader_new = gtk_source_file_loader_new(buffer : Pointer(LibGtkSource::Buffer), file : Pointer(LibGtkSource::File)) : Pointer(LibGtkSource::FileLoader)
  fun file_loader_new_from_stream = gtk_source_file_loader_new_from_stream(buffer : Pointer(LibGtkSource::Buffer), file : Pointer(LibGtkSource::File), stream : Pointer(LibGio::InputStream)) : Pointer(LibGtkSource::FileLoader)
  fun file_loader_get_buffer = gtk_source_file_loader_get_buffer(this : FileLoader*) : Pointer(LibGtkSource::Buffer)
  fun file_loader_get_compression_type = gtk_source_file_loader_get_compression_type(this : FileLoader*) : LibGtkSource::CompressionType
  fun file_loader_get_encoding = gtk_source_file_loader_get_encoding(this : FileLoader*) : Pointer(LibGtkSource::Encoding)
  fun file_loader_get_file = gtk_source_file_loader_get_file(this : FileLoader*) : Pointer(LibGtkSource::File)
  fun file_loader_get_input_stream = gtk_source_file_loader_get_input_stream(this : FileLoader*) : Pointer(LibGio::InputStream)
  fun file_loader_get_location = gtk_source_file_loader_get_location(this : FileLoader*) : Pointer(LibGio::File)
  fun file_loader_get_newline_type = gtk_source_file_loader_get_newline_type(this : FileLoader*) : LibGtkSource::NewlineType
  fun file_loader_load_async = gtk_source_file_loader_load_async(this : FileLoader*, io_priority : Int32, cancellable : Pointer(LibGio::Cancellable), progress_callback : LibGio::FileProgressCallback, progress_callback_data : Pointer(Void), progress_callback_notify : LibGLib::DestroyNotify, callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun file_loader_load_finish = gtk_source_file_loader_load_finish(this : FileLoader*, result : Pointer(LibGio::AsyncResult), error : LibGLib::Error**) : LibC::Int
  fun file_loader_set_candidate_encodings = gtk_source_file_loader_set_candidate_encodings(this : FileLoader*, candidate_encodings : Pointer(Void*)) : Void

  struct FileSaver # object
    object : LibGObject::Object
    priv : Pointer(LibGtkSource::FileSaverPrivate)
    # Property buffer : LibGtkSource::Buffer
    # Property compression-type : LibGtkSource::CompressionType
    # Property encoding : LibGtkSource::Encoding
    # Property file : LibGtkSource::File
    # Property flags : LibGtkSource::FileSaverFlags
    # Property location : LibGio::File
    # Property newline-type : LibGtkSource::NewlineType
  end

  fun _gtk_source_file_saver_get_type = gtk_source_file_saver_get_type : UInt64
  fun file_saver_new = gtk_source_file_saver_new(buffer : Pointer(LibGtkSource::Buffer), file : Pointer(LibGtkSource::File)) : Pointer(LibGtkSource::FileSaver)
  fun file_saver_new_with_target = gtk_source_file_saver_new_with_target(buffer : Pointer(LibGtkSource::Buffer), file : Pointer(LibGtkSource::File), target_location : Pointer(LibGio::File)) : Pointer(LibGtkSource::FileSaver)
  fun file_saver_get_buffer = gtk_source_file_saver_get_buffer(this : FileSaver*) : Pointer(LibGtkSource::Buffer)
  fun file_saver_get_compression_type = gtk_source_file_saver_get_compression_type(this : FileSaver*) : LibGtkSource::CompressionType
  fun file_saver_get_encoding = gtk_source_file_saver_get_encoding(this : FileSaver*) : Pointer(LibGtkSource::Encoding)
  fun file_saver_get_file = gtk_source_file_saver_get_file(this : FileSaver*) : Pointer(LibGtkSource::File)
  fun file_saver_get_flags = gtk_source_file_saver_get_flags(this : FileSaver*) : LibGtkSource::FileSaverFlags
  fun file_saver_get_location = gtk_source_file_saver_get_location(this : FileSaver*) : Pointer(LibGio::File)
  fun file_saver_get_newline_type = gtk_source_file_saver_get_newline_type(this : FileSaver*) : LibGtkSource::NewlineType
  fun file_saver_save_async = gtk_source_file_saver_save_async(this : FileSaver*, io_priority : Int32, cancellable : Pointer(LibGio::Cancellable), progress_callback : LibGio::FileProgressCallback, progress_callback_data : Pointer(Void), progress_callback_notify : LibGLib::DestroyNotify, callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun file_saver_save_finish = gtk_source_file_saver_save_finish(this : FileSaver*, result : Pointer(LibGio::AsyncResult), error : LibGLib::Error**) : LibC::Int
  fun file_saver_set_compression_type = gtk_source_file_saver_set_compression_type(this : FileSaver*, compression_type : LibGtkSource::CompressionType) : Void
  fun file_saver_set_encoding = gtk_source_file_saver_set_encoding(this : FileSaver*, encoding : Pointer(LibGtkSource::Encoding)) : Void
  fun file_saver_set_flags = gtk_source_file_saver_set_flags(this : FileSaver*, flags : LibGtkSource::FileSaverFlags) : Void
  fun file_saver_set_newline_type = gtk_source_file_saver_set_newline_type(this : FileSaver*, newline_type : LibGtkSource::NewlineType) : Void

  struct Gutter # object
    parent : LibGObject::Object
    priv : Pointer(LibGtkSource::GutterPrivate)
    # Property view : LibGtkSource::View
    # Property window-type : LibGtk::TextWindowType
  end

  fun _gtk_source_gutter_get_type = gtk_source_gutter_get_type : UInt64
  fun gutter_get_renderer_at_pos = gtk_source_gutter_get_renderer_at_pos(this : Gutter*, x : Int32, y : Int32) : Pointer(LibGtkSource::GutterRenderer)
  fun gutter_get_view = gtk_source_gutter_get_view(this : Gutter*) : Pointer(LibGtkSource::View)
  fun gutter_get_window_type = gtk_source_gutter_get_window_type(this : Gutter*) : LibGtk::TextWindowType
  fun gutter_insert = gtk_source_gutter_insert(this : Gutter*, renderer : Pointer(LibGtkSource::GutterRenderer), position : Int32) : LibC::Int
  fun gutter_queue_draw = gtk_source_gutter_queue_draw(this : Gutter*) : Void
  fun gutter_remove = gtk_source_gutter_remove(this : Gutter*, renderer : Pointer(LibGtkSource::GutterRenderer)) : Void
  fun gutter_reorder = gtk_source_gutter_reorder(this : Gutter*, renderer : Pointer(LibGtkSource::GutterRenderer), position : Int32) : Void

  struct GutterRenderer # object
    parent : LibGObject::InitiallyUnowned
    priv : Pointer(LibGtkSource::GutterRendererPrivate)
    # Signal activate
    # Signal query-activatable
    # Signal query-data
    # Signal query-tooltip
    # Signal queue-draw
    # Virtual function activate
    # Virtual function begin
    # Virtual function change_buffer
    # Virtual function change_view
    # Virtual function draw
    # Virtual function end
    # Virtual function query_activatable
    # Virtual function query_data
    # Virtual function query_tooltip
    # Virtual function queue_draw
    # Property alignment-mode : LibGtkSource::GutterRendererAlignmentMode
    # Property background-rgba : LibGdk::RGBA
    # Property background-set : LibC::Int
    # Property size : Int32
    # Property view : LibGtk::TextView
    # Property visible : LibC::Int
    # Property window-type : LibGtk::TextWindowType
    # Property xalign : Float32
    # Property xpad : Int32
    # Property yalign : Float32
    # Property ypad : Int32
  end

  fun _gtk_source_gutter_renderer_get_type = gtk_source_gutter_renderer_get_type : UInt64
  fun gutter_renderer_activate = gtk_source_gutter_renderer_activate(this : GutterRenderer*, iter : Pointer(LibGtk::TextIter), area : Pointer(LibGdk::Rectangle), event : Pointer(LibGdk::Event)) : Void
  fun gutter_renderer_begin = gtk_source_gutter_renderer_begin(this : GutterRenderer*, cr : Pointer(LibCairo::Context), background_area : Pointer(LibGdk::Rectangle), cell_area : Pointer(LibGdk::Rectangle), start : Pointer(LibGtk::TextIter), _end : Pointer(LibGtk::TextIter)) : Void
  fun gutter_renderer_draw = gtk_source_gutter_renderer_draw(this : GutterRenderer*, cr : Pointer(LibCairo::Context), background_area : Pointer(LibGdk::Rectangle), cell_area : Pointer(LibGdk::Rectangle), start : Pointer(LibGtk::TextIter), _end : Pointer(LibGtk::TextIter), state : LibGtkSource::GutterRendererState) : Void
  fun gutter_renderer_end = gtk_source_gutter_renderer_end(this : GutterRenderer*) : Void
  fun gutter_renderer_get_alignment = gtk_source_gutter_renderer_get_alignment(this : GutterRenderer*, xalign : Float32*, yalign : Float32*) : Void
  fun gutter_renderer_get_alignment_mode = gtk_source_gutter_renderer_get_alignment_mode(this : GutterRenderer*) : LibGtkSource::GutterRendererAlignmentMode
  fun gutter_renderer_get_background = gtk_source_gutter_renderer_get_background(this : GutterRenderer*, color : LibGdk::RGBA*) : LibC::Int
  fun gutter_renderer_get_padding = gtk_source_gutter_renderer_get_padding(this : GutterRenderer*, xpad : Int32*, ypad : Int32*) : Void
  fun gutter_renderer_get_size = gtk_source_gutter_renderer_get_size(this : GutterRenderer*) : Int32
  fun gutter_renderer_get_view = gtk_source_gutter_renderer_get_view(this : GutterRenderer*) : Pointer(LibGtk::TextView)
  fun gutter_renderer_get_visible = gtk_source_gutter_renderer_get_visible(this : GutterRenderer*) : LibC::Int
  fun gutter_renderer_get_window_type = gtk_source_gutter_renderer_get_window_type(this : GutterRenderer*) : LibGtk::TextWindowType
  fun gutter_renderer_query_activatable = gtk_source_gutter_renderer_query_activatable(this : GutterRenderer*, iter : Pointer(LibGtk::TextIter), area : Pointer(LibGdk::Rectangle), event : Pointer(LibGdk::Event)) : LibC::Int
  fun gutter_renderer_query_data = gtk_source_gutter_renderer_query_data(this : GutterRenderer*, start : Pointer(LibGtk::TextIter), _end : Pointer(LibGtk::TextIter), state : LibGtkSource::GutterRendererState) : Void
  fun gutter_renderer_query_tooltip = gtk_source_gutter_renderer_query_tooltip(this : GutterRenderer*, iter : Pointer(LibGtk::TextIter), area : Pointer(LibGdk::Rectangle), x : Int32, y : Int32, tooltip : Pointer(LibGtk::Tooltip)) : LibC::Int
  fun gutter_renderer_queue_draw = gtk_source_gutter_renderer_queue_draw(this : GutterRenderer*) : Void
  fun gutter_renderer_set_alignment = gtk_source_gutter_renderer_set_alignment(this : GutterRenderer*, xalign : Float32, yalign : Float32) : Void
  fun gutter_renderer_set_alignment_mode = gtk_source_gutter_renderer_set_alignment_mode(this : GutterRenderer*, mode : LibGtkSource::GutterRendererAlignmentMode) : Void
  fun gutter_renderer_set_background = gtk_source_gutter_renderer_set_background(this : GutterRenderer*, color : Pointer(LibGdk::RGBA)) : Void
  fun gutter_renderer_set_padding = gtk_source_gutter_renderer_set_padding(this : GutterRenderer*, xpad : Int32, ypad : Int32) : Void
  fun gutter_renderer_set_size = gtk_source_gutter_renderer_set_size(this : GutterRenderer*, size : Int32) : Void
  fun gutter_renderer_set_visible = gtk_source_gutter_renderer_set_visible(this : GutterRenderer*, visible : LibC::Int) : Void

  struct GutterRendererPixbuf # object
    parent : LibGtkSource::GutterRenderer
    priv : Pointer(LibGtkSource::GutterRendererPixbufPrivate)
    # Property gicon : LibGio::Icon
    # Property icon-name : Pointer(UInt8)
    # Property pixbuf : LibGdkPixbuf::Pixbuf
  end

  fun _gtk_source_gutter_renderer_pixbuf_get_type = gtk_source_gutter_renderer_pixbuf_get_type : UInt64
  fun gutter_renderer_pixbuf_new = gtk_source_gutter_renderer_pixbuf_new : Pointer(LibGtkSource::GutterRenderer)
  fun gutter_renderer_pixbuf_get_gicon = gtk_source_gutter_renderer_pixbuf_get_gicon(this : GutterRendererPixbuf*) : Pointer(LibGio::Icon)
  fun gutter_renderer_pixbuf_get_icon_name = gtk_source_gutter_renderer_pixbuf_get_icon_name(this : GutterRendererPixbuf*) : Pointer(UInt8)
  fun gutter_renderer_pixbuf_get_pixbuf = gtk_source_gutter_renderer_pixbuf_get_pixbuf(this : GutterRendererPixbuf*) : Pointer(LibGdkPixbuf::Pixbuf)
  fun gutter_renderer_pixbuf_set_gicon = gtk_source_gutter_renderer_pixbuf_set_gicon(this : GutterRendererPixbuf*, icon : Pointer(LibGio::Icon)) : Void
  fun gutter_renderer_pixbuf_set_icon_name = gtk_source_gutter_renderer_pixbuf_set_icon_name(this : GutterRendererPixbuf*, icon_name : Pointer(UInt8)) : Void
  fun gutter_renderer_pixbuf_set_pixbuf = gtk_source_gutter_renderer_pixbuf_set_pixbuf(this : GutterRendererPixbuf*, pixbuf : Pointer(LibGdkPixbuf::Pixbuf)) : Void

  struct GutterRendererText # object
    parent : LibGtkSource::GutterRenderer
    priv : Pointer(LibGtkSource::GutterRendererTextPrivate)
    # Property markup : Pointer(UInt8)
    # Property text : Pointer(UInt8)
  end

  fun _gtk_source_gutter_renderer_text_get_type = gtk_source_gutter_renderer_text_get_type : UInt64
  fun gutter_renderer_text_new = gtk_source_gutter_renderer_text_new : Pointer(LibGtkSource::GutterRenderer)
  fun gutter_renderer_text_measure = gtk_source_gutter_renderer_text_measure(this : GutterRendererText*, text : Pointer(UInt8), width : Int32*, height : Int32*) : Void
  fun gutter_renderer_text_measure_markup = gtk_source_gutter_renderer_text_measure_markup(this : GutterRendererText*, markup : Pointer(UInt8), width : Int32*, height : Int32*) : Void
  fun gutter_renderer_text_set_markup = gtk_source_gutter_renderer_text_set_markup(this : GutterRendererText*, markup : Pointer(UInt8), length : Int32) : Void
  fun gutter_renderer_text_set_text = gtk_source_gutter_renderer_text_set_text(this : GutterRendererText*, text : Pointer(UInt8), length : Int32) : Void

  struct Language # object
    parent_instance : LibGObject::Object
    priv : Pointer(LibGtkSource::LanguagePrivate)
    # Property hidden : LibC::Int
    # Property id : Pointer(UInt8)
    # Property name : Pointer(UInt8)
    # Property section : Pointer(UInt8)
  end

  fun _gtk_source_language_get_type = gtk_source_language_get_type : UInt64
  fun language_get_globs = gtk_source_language_get_globs(this : Language*) : Pointer(Pointer(UInt8))
  fun language_get_hidden = gtk_source_language_get_hidden(this : Language*) : LibC::Int
  fun language_get_id = gtk_source_language_get_id(this : Language*) : Pointer(UInt8)
  fun language_get_metadata = gtk_source_language_get_metadata(this : Language*, name : Pointer(UInt8)) : Pointer(UInt8)
  fun language_get_mime_types = gtk_source_language_get_mime_types(this : Language*) : Pointer(Pointer(UInt8))
  fun language_get_name = gtk_source_language_get_name(this : Language*) : Pointer(UInt8)
  fun language_get_section = gtk_source_language_get_section(this : Language*) : Pointer(UInt8)
  fun language_get_style_fallback = gtk_source_language_get_style_fallback(this : Language*, style_id : Pointer(UInt8)) : Pointer(UInt8)
  fun language_get_style_ids = gtk_source_language_get_style_ids(this : Language*) : Pointer(Pointer(UInt8))
  fun language_get_style_name = gtk_source_language_get_style_name(this : Language*, style_id : Pointer(UInt8)) : Pointer(UInt8)

  struct LanguageManager # object
    parent_instance : LibGObject::Object
    priv : Pointer(LibGtkSource::LanguageManagerPrivate)
    # Property language-ids : Pointer(Pointer(UInt8))
    # Property search-path : Pointer(Pointer(UInt8))
  end

  fun _gtk_source_language_manager_get_type = gtk_source_language_manager_get_type : UInt64
  fun language_manager_new = gtk_source_language_manager_new : Pointer(LibGtkSource::LanguageManager)
  fun language_manager_get_default = gtk_source_language_manager_get_default : Pointer(LibGtkSource::LanguageManager)
  fun language_manager_get_language = gtk_source_language_manager_get_language(this : LanguageManager*, id : Pointer(UInt8)) : Pointer(LibGtkSource::Language)
  fun language_manager_get_language_ids = gtk_source_language_manager_get_language_ids(this : LanguageManager*) : Pointer(Pointer(UInt8))
  fun language_manager_get_search_path = gtk_source_language_manager_get_search_path(this : LanguageManager*) : Pointer(Pointer(UInt8))
  fun language_manager_guess_language = gtk_source_language_manager_guess_language(this : LanguageManager*, filename : Pointer(UInt8), content_type : Pointer(UInt8)) : Pointer(LibGtkSource::Language)
  fun language_manager_set_search_path = gtk_source_language_manager_set_search_path(this : LanguageManager*, dirs : Pointer(Pointer(UInt8))) : Void

  struct Map # object
    parent_instance : LibGtkSource::View
    # Property font-desc : LibPango::FontDescription
    # Property view : LibGtkSource::View
  end

  fun _gtk_source_map_get_type = gtk_source_map_get_type : UInt64
  fun map_new = gtk_source_map_new : Pointer(LibGtk::Widget)
  fun map_get_view = gtk_source_map_get_view(this : Map*) : Pointer(LibGtkSource::View)
  fun map_set_view = gtk_source_map_set_view(this : Map*, view : Pointer(LibGtkSource::View)) : Void

  struct Mark # object
    parent_instance : LibGtk::TextMark
    priv : Pointer(LibGtkSource::MarkPrivate)
    # Property category : Pointer(UInt8)
  end

  fun _gtk_source_mark_get_type = gtk_source_mark_get_type : UInt64
  fun mark_new = gtk_source_mark_new(name : Pointer(UInt8), category : Pointer(UInt8)) : Pointer(LibGtkSource::Mark)
  fun mark_get_category = gtk_source_mark_get_category(this : Mark*) : Pointer(UInt8)
  fun mark_next = gtk_source_mark_next(this : Mark*, category : Pointer(UInt8)) : Pointer(LibGtkSource::Mark)
  fun mark_prev = gtk_source_mark_prev(this : Mark*, category : Pointer(UInt8)) : Pointer(LibGtkSource::Mark)

  struct MarkAttributes # object
    parent : LibGObject::Object
    priv : Pointer(LibGtkSource::MarkAttributesPrivate)
    # Signal query-tooltip-markup
    # Signal query-tooltip-text
    # Property background : LibGdk::RGBA
    # Property gicon : LibGio::Icon
    # Property icon-name : Pointer(UInt8)
    # Property pixbuf : LibGdkPixbuf::Pixbuf
  end

  fun _gtk_source_mark_attributes_get_type = gtk_source_mark_attributes_get_type : UInt64
  fun mark_attributes_new = gtk_source_mark_attributes_new : Pointer(LibGtkSource::MarkAttributes)
  fun mark_attributes_get_background = gtk_source_mark_attributes_get_background(this : MarkAttributes*, background : LibGdk::RGBA*) : LibC::Int
  fun mark_attributes_get_gicon = gtk_source_mark_attributes_get_gicon(this : MarkAttributes*) : Pointer(LibGio::Icon)
  fun mark_attributes_get_icon_name = gtk_source_mark_attributes_get_icon_name(this : MarkAttributes*) : Pointer(UInt8)
  fun mark_attributes_get_pixbuf = gtk_source_mark_attributes_get_pixbuf(this : MarkAttributes*) : Pointer(LibGdkPixbuf::Pixbuf)
  fun mark_attributes_get_tooltip_markup = gtk_source_mark_attributes_get_tooltip_markup(this : MarkAttributes*, mark : Pointer(LibGtkSource::Mark)) : Pointer(UInt8)
  fun mark_attributes_get_tooltip_text = gtk_source_mark_attributes_get_tooltip_text(this : MarkAttributes*, mark : Pointer(LibGtkSource::Mark)) : Pointer(UInt8)
  fun mark_attributes_render_icon = gtk_source_mark_attributes_render_icon(this : MarkAttributes*, widget : Pointer(LibGtk::Widget), size : Int32) : Pointer(LibGdkPixbuf::Pixbuf)
  fun mark_attributes_set_background = gtk_source_mark_attributes_set_background(this : MarkAttributes*, background : Pointer(LibGdk::RGBA)) : Void
  fun mark_attributes_set_gicon = gtk_source_mark_attributes_set_gicon(this : MarkAttributes*, gicon : Pointer(LibGio::Icon)) : Void
  fun mark_attributes_set_icon_name = gtk_source_mark_attributes_set_icon_name(this : MarkAttributes*, icon_name : Pointer(UInt8)) : Void
  fun mark_attributes_set_pixbuf = gtk_source_mark_attributes_set_pixbuf(this : MarkAttributes*, pixbuf : Pointer(LibGdkPixbuf::Pixbuf)) : Void

  struct PrintCompositor # object
    parent_instance : LibGObject::Object
    priv : Pointer(LibGtkSource::PrintCompositorPrivate)
    # Property body-font-name : Pointer(UInt8)
    # Property buffer : LibGtkSource::Buffer
    # Property footer-font-name : Pointer(UInt8)
    # Property header-font-name : Pointer(UInt8)
    # Property highlight-syntax : LibC::Int
    # Property line-numbers-font-name : Pointer(UInt8)
    # Property n-pages : Int32
    # Property print-footer : LibC::Int
    # Property print-header : LibC::Int
    # Property print-line-numbers : UInt32
    # Property tab-width : UInt32
    # Property wrap-mode : LibGtk::WrapMode
  end

  fun _gtk_source_print_compositor_get_type = gtk_source_print_compositor_get_type : UInt64
  fun print_compositor_new = gtk_source_print_compositor_new(buffer : Pointer(LibGtkSource::Buffer)) : Pointer(LibGtkSource::PrintCompositor)
  fun print_compositor_new_from_view = gtk_source_print_compositor_new_from_view(view : Pointer(LibGtkSource::View)) : Pointer(LibGtkSource::PrintCompositor)
  fun print_compositor_draw_page = gtk_source_print_compositor_draw_page(this : PrintCompositor*, context : Pointer(LibGtk::PrintContext), page_nr : Int32) : Void
  fun print_compositor_get_body_font_name = gtk_source_print_compositor_get_body_font_name(this : PrintCompositor*) : Pointer(UInt8)
  fun print_compositor_get_bottom_margin = gtk_source_print_compositor_get_bottom_margin(this : PrintCompositor*, unit : LibGtk::Unit) : Float64
  fun print_compositor_get_buffer = gtk_source_print_compositor_get_buffer(this : PrintCompositor*) : Pointer(LibGtkSource::Buffer)
  fun print_compositor_get_footer_font_name = gtk_source_print_compositor_get_footer_font_name(this : PrintCompositor*) : Pointer(UInt8)
  fun print_compositor_get_header_font_name = gtk_source_print_compositor_get_header_font_name(this : PrintCompositor*) : Pointer(UInt8)
  fun print_compositor_get_highlight_syntax = gtk_source_print_compositor_get_highlight_syntax(this : PrintCompositor*) : LibC::Int
  fun print_compositor_get_left_margin = gtk_source_print_compositor_get_left_margin(this : PrintCompositor*, unit : LibGtk::Unit) : Float64
  fun print_compositor_get_line_numbers_font_name = gtk_source_print_compositor_get_line_numbers_font_name(this : PrintCompositor*) : Pointer(UInt8)
  fun print_compositor_get_n_pages = gtk_source_print_compositor_get_n_pages(this : PrintCompositor*) : Int32
  fun print_compositor_get_pagination_progress = gtk_source_print_compositor_get_pagination_progress(this : PrintCompositor*) : Float64
  fun print_compositor_get_print_footer = gtk_source_print_compositor_get_print_footer(this : PrintCompositor*) : LibC::Int
  fun print_compositor_get_print_header = gtk_source_print_compositor_get_print_header(this : PrintCompositor*) : LibC::Int
  fun print_compositor_get_print_line_numbers = gtk_source_print_compositor_get_print_line_numbers(this : PrintCompositor*) : UInt32
  fun print_compositor_get_right_margin = gtk_source_print_compositor_get_right_margin(this : PrintCompositor*, unit : LibGtk::Unit) : Float64
  fun print_compositor_get_tab_width = gtk_source_print_compositor_get_tab_width(this : PrintCompositor*) : UInt32
  fun print_compositor_get_top_margin = gtk_source_print_compositor_get_top_margin(this : PrintCompositor*, unit : LibGtk::Unit) : Float64
  fun print_compositor_get_wrap_mode = gtk_source_print_compositor_get_wrap_mode(this : PrintCompositor*) : LibGtk::WrapMode
  fun print_compositor_paginate = gtk_source_print_compositor_paginate(this : PrintCompositor*, context : Pointer(LibGtk::PrintContext)) : LibC::Int
  fun print_compositor_set_body_font_name = gtk_source_print_compositor_set_body_font_name(this : PrintCompositor*, font_name : Pointer(UInt8)) : Void
  fun print_compositor_set_bottom_margin = gtk_source_print_compositor_set_bottom_margin(this : PrintCompositor*, margin : Float64, unit : LibGtk::Unit) : Void
  fun print_compositor_set_footer_font_name = gtk_source_print_compositor_set_footer_font_name(this : PrintCompositor*, font_name : Pointer(UInt8)) : Void
  fun print_compositor_set_footer_format = gtk_source_print_compositor_set_footer_format(this : PrintCompositor*, separator : LibC::Int, left : Pointer(UInt8), center : Pointer(UInt8), right : Pointer(UInt8)) : Void
  fun print_compositor_set_header_font_name = gtk_source_print_compositor_set_header_font_name(this : PrintCompositor*, font_name : Pointer(UInt8)) : Void
  fun print_compositor_set_header_format = gtk_source_print_compositor_set_header_format(this : PrintCompositor*, separator : LibC::Int, left : Pointer(UInt8), center : Pointer(UInt8), right : Pointer(UInt8)) : Void
  fun print_compositor_set_highlight_syntax = gtk_source_print_compositor_set_highlight_syntax(this : PrintCompositor*, highlight : LibC::Int) : Void
  fun print_compositor_set_left_margin = gtk_source_print_compositor_set_left_margin(this : PrintCompositor*, margin : Float64, unit : LibGtk::Unit) : Void
  fun print_compositor_set_line_numbers_font_name = gtk_source_print_compositor_set_line_numbers_font_name(this : PrintCompositor*, font_name : Pointer(UInt8)) : Void
  fun print_compositor_set_print_footer = gtk_source_print_compositor_set_print_footer(this : PrintCompositor*, print : LibC::Int) : Void
  fun print_compositor_set_print_header = gtk_source_print_compositor_set_print_header(this : PrintCompositor*, print : LibC::Int) : Void
  fun print_compositor_set_print_line_numbers = gtk_source_print_compositor_set_print_line_numbers(this : PrintCompositor*, interval : UInt32) : Void
  fun print_compositor_set_right_margin = gtk_source_print_compositor_set_right_margin(this : PrintCompositor*, margin : Float64, unit : LibGtk::Unit) : Void
  fun print_compositor_set_tab_width = gtk_source_print_compositor_set_tab_width(this : PrintCompositor*, width : UInt32) : Void
  fun print_compositor_set_top_margin = gtk_source_print_compositor_set_top_margin(this : PrintCompositor*, margin : Float64, unit : LibGtk::Unit) : Void
  fun print_compositor_set_wrap_mode = gtk_source_print_compositor_set_wrap_mode(this : PrintCompositor*, wrap_mode : LibGtk::WrapMode) : Void

  struct Region # object
    parent_instance : LibGObject::Object
    # Property buffer : LibGtk::TextBuffer
  end

  fun _gtk_source_region_get_type = gtk_source_region_get_type : UInt64
  fun region_new = gtk_source_region_new(buffer : Pointer(LibGtk::TextBuffer)) : Pointer(LibGtkSource::Region)
  fun region_add_region = gtk_source_region_add_region(this : Region*, region_to_add : Pointer(LibGtkSource::Region)) : Void
  fun region_add_subregion = gtk_source_region_add_subregion(this : Region*, _start : Pointer(LibGtk::TextIter), _end : Pointer(LibGtk::TextIter)) : Void
  fun region_get_bounds = gtk_source_region_get_bounds(this : Region*, start : LibGtk::TextIter*, _end : LibGtk::TextIter*) : LibC::Int
  fun region_get_buffer = gtk_source_region_get_buffer(this : Region*) : Pointer(LibGtk::TextBuffer)
  fun region_get_start_region_iter = gtk_source_region_get_start_region_iter(this : Region*, iter : LibGtkSource::RegionIter*) : Void
  fun region_intersect_region = gtk_source_region_intersect_region(this : Region*, region2 : Pointer(LibGtkSource::Region)) : Pointer(LibGtkSource::Region)
  fun region_intersect_subregion = gtk_source_region_intersect_subregion(this : Region*, _start : Pointer(LibGtk::TextIter), _end : Pointer(LibGtk::TextIter)) : Pointer(LibGtkSource::Region)
  fun region_is_empty = gtk_source_region_is_empty(this : Region*) : LibC::Int
  fun region_subtract_region = gtk_source_region_subtract_region(this : Region*, region_to_subtract : Pointer(LibGtkSource::Region)) : Void
  fun region_subtract_subregion = gtk_source_region_subtract_subregion(this : Region*, _start : Pointer(LibGtk::TextIter), _end : Pointer(LibGtk::TextIter)) : Void
  fun region_to_string = gtk_source_region_to_string(this : Region*) : Pointer(UInt8)

  struct SearchContext # object
    parent : LibGObject::Object
    priv : Pointer(LibGtkSource::SearchContextPrivate)
    # Property buffer : LibGtkSource::Buffer
    # Property highlight : LibC::Int
    # Property match-style : LibGtkSource::Style
    # Property occurrences-count : Int32
    # Property regex-error : Pointer(Void)
    # Property settings : LibGtkSource::SearchSettings
  end

  fun _gtk_source_search_context_get_type = gtk_source_search_context_get_type : UInt64
  fun search_context_new = gtk_source_search_context_new(buffer : Pointer(LibGtkSource::Buffer), settings : Pointer(LibGtkSource::SearchSettings)) : Pointer(LibGtkSource::SearchContext)
  fun search_context_backward = gtk_source_search_context_backward(this : SearchContext*, iter : Pointer(LibGtk::TextIter), match_start : LibGtk::TextIter*, match_end : LibGtk::TextIter*, has_wrapped_around : LibC::Int*) : LibC::Int
  fun search_context_backward_async = gtk_source_search_context_backward_async(this : SearchContext*, iter : Pointer(LibGtk::TextIter), cancellable : Pointer(LibGio::Cancellable), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun search_context_backward_finish = gtk_source_search_context_backward_finish(this : SearchContext*, result : Pointer(LibGio::AsyncResult), match_start : LibGtk::TextIter*, match_end : LibGtk::TextIter*, has_wrapped_around : LibC::Int*, error : LibGLib::Error**) : LibC::Int
  fun search_context_forward = gtk_source_search_context_forward(this : SearchContext*, iter : Pointer(LibGtk::TextIter), match_start : LibGtk::TextIter*, match_end : LibGtk::TextIter*, has_wrapped_around : LibC::Int*) : LibC::Int
  fun search_context_forward_async = gtk_source_search_context_forward_async(this : SearchContext*, iter : Pointer(LibGtk::TextIter), cancellable : Pointer(LibGio::Cancellable), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun search_context_forward_finish = gtk_source_search_context_forward_finish(this : SearchContext*, result : Pointer(LibGio::AsyncResult), match_start : LibGtk::TextIter*, match_end : LibGtk::TextIter*, has_wrapped_around : LibC::Int*, error : LibGLib::Error**) : LibC::Int
  fun search_context_get_buffer = gtk_source_search_context_get_buffer(this : SearchContext*) : Pointer(LibGtkSource::Buffer)
  fun search_context_get_highlight = gtk_source_search_context_get_highlight(this : SearchContext*) : LibC::Int
  fun search_context_get_match_style = gtk_source_search_context_get_match_style(this : SearchContext*) : Pointer(LibGtkSource::Style)
  fun search_context_get_occurrence_position = gtk_source_search_context_get_occurrence_position(this : SearchContext*, match_start : Pointer(LibGtk::TextIter), match_end : Pointer(LibGtk::TextIter)) : Int32
  fun search_context_get_occurrences_count = gtk_source_search_context_get_occurrences_count(this : SearchContext*) : Int32
  fun search_context_get_regex_error = gtk_source_search_context_get_regex_error(this : SearchContext*) : Pointer(LibGLib::Error*)
  fun search_context_get_settings = gtk_source_search_context_get_settings(this : SearchContext*) : Pointer(LibGtkSource::SearchSettings)
  fun search_context_replace = gtk_source_search_context_replace(this : SearchContext*, match_start : Pointer(LibGtk::TextIter), match_end : Pointer(LibGtk::TextIter), replace : Pointer(UInt8), replace_length : Int32, error : LibGLib::Error**) : LibC::Int
  fun search_context_replace_all = gtk_source_search_context_replace_all(this : SearchContext*, replace : Pointer(UInt8), replace_length : Int32, error : LibGLib::Error**) : UInt32
  fun search_context_set_highlight = gtk_source_search_context_set_highlight(this : SearchContext*, highlight : LibC::Int) : Void
  fun search_context_set_match_style = gtk_source_search_context_set_match_style(this : SearchContext*, match_style : Pointer(LibGtkSource::Style)) : Void

  struct SearchSettings # object
    parent : LibGObject::Object
    priv : Pointer(LibGtkSource::SearchSettingsPrivate)
    # Property at-word-boundaries : LibC::Int
    # Property case-sensitive : LibC::Int
    # Property regex-enabled : LibC::Int
    # Property search-text : Pointer(UInt8)
    # Property wrap-around : LibC::Int
  end

  fun _gtk_source_search_settings_get_type = gtk_source_search_settings_get_type : UInt64
  fun search_settings_new = gtk_source_search_settings_new : Pointer(LibGtkSource::SearchSettings)
  fun search_settings_get_at_word_boundaries = gtk_source_search_settings_get_at_word_boundaries(this : SearchSettings*) : LibC::Int
  fun search_settings_get_case_sensitive = gtk_source_search_settings_get_case_sensitive(this : SearchSettings*) : LibC::Int
  fun search_settings_get_regex_enabled = gtk_source_search_settings_get_regex_enabled(this : SearchSettings*) : LibC::Int
  fun search_settings_get_search_text = gtk_source_search_settings_get_search_text(this : SearchSettings*) : Pointer(UInt8)
  fun search_settings_get_wrap_around = gtk_source_search_settings_get_wrap_around(this : SearchSettings*) : LibC::Int
  fun search_settings_set_at_word_boundaries = gtk_source_search_settings_set_at_word_boundaries(this : SearchSettings*, at_word_boundaries : LibC::Int) : Void
  fun search_settings_set_case_sensitive = gtk_source_search_settings_set_case_sensitive(this : SearchSettings*, case_sensitive : LibC::Int) : Void
  fun search_settings_set_regex_enabled = gtk_source_search_settings_set_regex_enabled(this : SearchSettings*, regex_enabled : LibC::Int) : Void
  fun search_settings_set_search_text = gtk_source_search_settings_set_search_text(this : SearchSettings*, search_text : Pointer(UInt8)) : Void
  fun search_settings_set_wrap_around = gtk_source_search_settings_set_wrap_around(this : SearchSettings*, wrap_around : LibC::Int) : Void

  struct SpaceDrawer # object
    parent : LibGObject::Object
    priv : Pointer(LibGtkSource::SpaceDrawerPrivate)
    # Property enable-matrix : LibC::Int
    # Property matrix : LibGLib::Variant
  end

  fun _gtk_source_space_drawer_get_type = gtk_source_space_drawer_get_type : UInt64
  fun space_drawer_new = gtk_source_space_drawer_new : Pointer(LibGtkSource::SpaceDrawer)
  fun space_drawer_bind_matrix_setting = gtk_source_space_drawer_bind_matrix_setting(this : SpaceDrawer*, settings : Pointer(LibGio::Settings), key : Pointer(UInt8), flags : LibGio::SettingsBindFlags) : Void
  fun space_drawer_get_enable_matrix = gtk_source_space_drawer_get_enable_matrix(this : SpaceDrawer*) : LibC::Int
  fun space_drawer_get_matrix = gtk_source_space_drawer_get_matrix(this : SpaceDrawer*) : Pointer(LibGLib::Variant)
  fun space_drawer_get_types_for_locations = gtk_source_space_drawer_get_types_for_locations(this : SpaceDrawer*, locations : LibGtkSource::SpaceLocationFlags) : LibGtkSource::SpaceTypeFlags
  fun space_drawer_set_enable_matrix = gtk_source_space_drawer_set_enable_matrix(this : SpaceDrawer*, enable_matrix : LibC::Int) : Void
  fun space_drawer_set_matrix = gtk_source_space_drawer_set_matrix(this : SpaceDrawer*, matrix : Pointer(LibGLib::Variant)) : Void
  fun space_drawer_set_types_for_locations = gtk_source_space_drawer_set_types_for_locations(this : SpaceDrawer*, locations : LibGtkSource::SpaceLocationFlags, types : LibGtkSource::SpaceTypeFlags) : Void

  struct Style # object
    _data : UInt8[0]
    # Property background : Pointer(UInt8)
    # Property background-set : LibC::Int
    # Property bold : LibC::Int
    # Property bold-set : LibC::Int
    # Property foreground : Pointer(UInt8)
    # Property foreground-set : LibC::Int
    # Property italic : LibC::Int
    # Property italic-set : LibC::Int
    # Property line-background : Pointer(UInt8)
    # Property line-background-set : LibC::Int
    # Property pango-underline : LibPango::Underline
    # Property scale : Pointer(UInt8)
    # Property scale-set : LibC::Int
    # Property strikethrough : LibC::Int
    # Property strikethrough-set : LibC::Int
    # Property underline-color : Pointer(UInt8)
    # Property underline-color-set : LibC::Int
    # Property underline-set : LibC::Int
  end

  fun _gtk_source_style_get_type = gtk_source_style_get_type : UInt64
  fun style_apply = gtk_source_style_apply(this : Style*, tag : Pointer(LibGtk::TextTag)) : Void
  fun style_copy = gtk_source_style_copy(this : Style*) : Pointer(LibGtkSource::Style)

  struct StyleScheme # object
    base : LibGObject::Object
    priv : Pointer(LibGtkSource::StyleSchemePrivate)
    # Property description : Pointer(UInt8)
    # Property filename : Pointer(UInt8)
    # Property id : Pointer(UInt8)
    # Property name : Pointer(UInt8)
  end

  fun _gtk_source_style_scheme_get_type = gtk_source_style_scheme_get_type : UInt64
  fun style_scheme_get_authors = gtk_source_style_scheme_get_authors(this : StyleScheme*) : Pointer(Pointer(UInt8))
  fun style_scheme_get_description = gtk_source_style_scheme_get_description(this : StyleScheme*) : Pointer(UInt8)
  fun style_scheme_get_filename = gtk_source_style_scheme_get_filename(this : StyleScheme*) : Pointer(UInt8)
  fun style_scheme_get_id = gtk_source_style_scheme_get_id(this : StyleScheme*) : Pointer(UInt8)
  fun style_scheme_get_name = gtk_source_style_scheme_get_name(this : StyleScheme*) : Pointer(UInt8)
  fun style_scheme_get_style = gtk_source_style_scheme_get_style(this : StyleScheme*, style_id : Pointer(UInt8)) : Pointer(LibGtkSource::Style)

  struct StyleSchemeChooserButton # object
    parent : LibGtk::Button
  end

  fun _gtk_source_style_scheme_chooser_button_get_type = gtk_source_style_scheme_chooser_button_get_type : UInt64
  fun style_scheme_chooser_button_new = gtk_source_style_scheme_chooser_button_new : Pointer(LibGtk::Widget)

  struct StyleSchemeChooserWidget # object
    parent : LibGtk::Bin
  end

  fun _gtk_source_style_scheme_chooser_widget_get_type = gtk_source_style_scheme_chooser_widget_get_type : UInt64
  fun style_scheme_chooser_widget_new = gtk_source_style_scheme_chooser_widget_new : Pointer(LibGtk::Widget)

  struct StyleSchemeManager # object
    parent : LibGObject::Object
    priv : Pointer(LibGtkSource::StyleSchemeManagerPrivate)
    # Property scheme-ids : Pointer(Pointer(UInt8))
    # Property search-path : Pointer(Pointer(UInt8))
  end

  fun _gtk_source_style_scheme_manager_get_type = gtk_source_style_scheme_manager_get_type : UInt64
  fun style_scheme_manager_new = gtk_source_style_scheme_manager_new : Pointer(LibGtkSource::StyleSchemeManager)
  fun style_scheme_manager_get_default = gtk_source_style_scheme_manager_get_default : Pointer(LibGtkSource::StyleSchemeManager)
  fun style_scheme_manager_append_search_path = gtk_source_style_scheme_manager_append_search_path(this : StyleSchemeManager*, path : Pointer(UInt8)) : Void
  fun style_scheme_manager_force_rescan = gtk_source_style_scheme_manager_force_rescan(this : StyleSchemeManager*) : Void
  fun style_scheme_manager_get_scheme = gtk_source_style_scheme_manager_get_scheme(this : StyleSchemeManager*, scheme_id : Pointer(UInt8)) : Pointer(LibGtkSource::StyleScheme)
  fun style_scheme_manager_get_scheme_ids = gtk_source_style_scheme_manager_get_scheme_ids(this : StyleSchemeManager*) : Pointer(Pointer(UInt8))
  fun style_scheme_manager_get_search_path = gtk_source_style_scheme_manager_get_search_path(this : StyleSchemeManager*) : Pointer(Pointer(UInt8))
  fun style_scheme_manager_prepend_search_path = gtk_source_style_scheme_manager_prepend_search_path(this : StyleSchemeManager*, path : Pointer(UInt8)) : Void
  fun style_scheme_manager_set_search_path = gtk_source_style_scheme_manager_set_search_path(this : StyleSchemeManager*, path : Pointer(Pointer(UInt8))) : Void

  struct Tag # object
    parent_instance : LibGtk::TextTag
    # Property draw-spaces : LibC::Int
    # Property draw-spaces-set : LibC::Int
  end

  fun _gtk_source_tag_get_type = gtk_source_tag_get_type : UInt64
  fun tag_new = gtk_source_tag_new(name : Pointer(UInt8)) : Pointer(LibGtk::TextTag)

  struct View # object
    parent : LibGtk::TextView
    priv : Pointer(LibGtkSource::ViewPrivate)
    # Signal change-case
    # Signal change-number
    # Signal join-lines
    # Signal line-mark-activated
    # Signal move-lines
    # Signal move-to-matching-bracket
    # Signal move-words
    # Signal redo
    # Signal show-completion
    # Signal smart-home-end
    # Signal undo
    # Virtual function line_mark_activated
    # Virtual function move_lines
    # Virtual function move_words
    # Virtual function redo
    # Virtual function show_completion
    # Virtual function undo
    # Property auto-indent : LibC::Int
    # Property background-pattern : LibGtkSource::BackgroundPatternType
    # Property completion : LibGtkSource::Completion
    # Property highlight-current-line : LibC::Int
    # Property indent-on-tab : LibC::Int
    # Property indent-width : Int32
    # Property insert-spaces-instead-of-tabs : LibC::Int
    # Property right-margin-position : UInt32
    # Property show-line-marks : LibC::Int
    # Property show-line-numbers : LibC::Int
    # Property show-right-margin : LibC::Int
    # Property smart-backspace : LibC::Int
    # Property smart-home-end : LibGtkSource::SmartHomeEndType
    # Property space-drawer : LibGtkSource::SpaceDrawer
    # Property tab-width : UInt32
  end

  fun _gtk_source_view_get_type = gtk_source_view_get_type : UInt64
  fun view_new = gtk_source_view_new : Pointer(LibGtk::Widget)
  fun view_new_with_buffer = gtk_source_view_new_with_buffer(buffer : Pointer(LibGtkSource::Buffer)) : Pointer(LibGtk::Widget)
  fun view_get_auto_indent = gtk_source_view_get_auto_indent(this : View*) : LibC::Int
  fun view_get_background_pattern = gtk_source_view_get_background_pattern(this : View*) : LibGtkSource::BackgroundPatternType
  fun view_get_completion = gtk_source_view_get_completion(this : View*) : Pointer(LibGtkSource::Completion)
  fun view_get_gutter = gtk_source_view_get_gutter(this : View*, window_type : LibGtk::TextWindowType) : Pointer(LibGtkSource::Gutter)
  fun view_get_highlight_current_line = gtk_source_view_get_highlight_current_line(this : View*) : LibC::Int
  fun view_get_indent_on_tab = gtk_source_view_get_indent_on_tab(this : View*) : LibC::Int
  fun view_get_indent_width = gtk_source_view_get_indent_width(this : View*) : Int32
  fun view_get_insert_spaces_instead_of_tabs = gtk_source_view_get_insert_spaces_instead_of_tabs(this : View*) : LibC::Int
  fun view_get_mark_attributes = gtk_source_view_get_mark_attributes(this : View*, category : Pointer(UInt8), priority : Pointer(Int32)) : Pointer(LibGtkSource::MarkAttributes)
  fun view_get_right_margin_position = gtk_source_view_get_right_margin_position(this : View*) : UInt32
  fun view_get_show_line_marks = gtk_source_view_get_show_line_marks(this : View*) : LibC::Int
  fun view_get_show_line_numbers = gtk_source_view_get_show_line_numbers(this : View*) : LibC::Int
  fun view_get_show_right_margin = gtk_source_view_get_show_right_margin(this : View*) : LibC::Int
  fun view_get_smart_backspace = gtk_source_view_get_smart_backspace(this : View*) : LibC::Int
  fun view_get_smart_home_end = gtk_source_view_get_smart_home_end(this : View*) : LibGtkSource::SmartHomeEndType
  fun view_get_space_drawer = gtk_source_view_get_space_drawer(this : View*) : Pointer(LibGtkSource::SpaceDrawer)
  fun view_get_tab_width = gtk_source_view_get_tab_width(this : View*) : UInt32
  fun view_get_visual_column = gtk_source_view_get_visual_column(this : View*, iter : Pointer(LibGtk::TextIter)) : UInt32
  fun view_indent_lines = gtk_source_view_indent_lines(this : View*, start : Pointer(LibGtk::TextIter), _end : Pointer(LibGtk::TextIter)) : Void
  fun view_set_auto_indent = gtk_source_view_set_auto_indent(this : View*, enable : LibC::Int) : Void
  fun view_set_background_pattern = gtk_source_view_set_background_pattern(this : View*, background_pattern : LibGtkSource::BackgroundPatternType) : Void
  fun view_set_highlight_current_line = gtk_source_view_set_highlight_current_line(this : View*, highlight : LibC::Int) : Void
  fun view_set_indent_on_tab = gtk_source_view_set_indent_on_tab(this : View*, enable : LibC::Int) : Void
  fun view_set_indent_width = gtk_source_view_set_indent_width(this : View*, width : Int32) : Void
  fun view_set_insert_spaces_instead_of_tabs = gtk_source_view_set_insert_spaces_instead_of_tabs(this : View*, enable : LibC::Int) : Void
  fun view_set_mark_attributes = gtk_source_view_set_mark_attributes(this : View*, category : Pointer(UInt8), attributes : Pointer(LibGtkSource::MarkAttributes), priority : Int32) : Void
  fun view_set_right_margin_position = gtk_source_view_set_right_margin_position(this : View*, pos : UInt32) : Void
  fun view_set_show_line_marks = gtk_source_view_set_show_line_marks(this : View*, show : LibC::Int) : Void
  fun view_set_show_line_numbers = gtk_source_view_set_show_line_numbers(this : View*, show : LibC::Int) : Void
  fun view_set_show_right_margin = gtk_source_view_set_show_right_margin(this : View*, show : LibC::Int) : Void
  fun view_set_smart_backspace = gtk_source_view_set_smart_backspace(this : View*, smart_backspace : LibC::Int) : Void
  fun view_set_smart_home_end = gtk_source_view_set_smart_home_end(this : View*, smart_home_end : LibGtkSource::SmartHomeEndType) : Void
  fun view_set_tab_width = gtk_source_view_set_tab_width(this : View*, width : UInt32) : Void
  fun view_unindent_lines = gtk_source_view_unindent_lines(this : View*, start : Pointer(LibGtk::TextIter), _end : Pointer(LibGtk::TextIter)) : Void

  ###########################################
  # #    Structs
  ###########################################

  struct BufferClass # struct
    parent_class : LibGtk::TextBufferClass
    undo : Pointer(LibGtkSource::Buffer) -> Void
    redo : Pointer(LibGtkSource::Buffer) -> Void
    bracket_matched : Pointer(LibGtkSource::Buffer), Pointer(LibGtk::TextIter), LibGtkSource::BracketMatchType -> Void
    padding : Pointer(Void)[20]
  end

  struct BufferPrivate # struct
    _data : UInt8[0]
  end

  struct CompletionClass # struct
    parent_class : LibGObject::ObjectClass
    proposal_activated : Pointer(LibGtkSource::Completion), Pointer(LibGtkSource::CompletionProvider), Pointer(LibGtkSource::CompletionProposal) -> LibC::Int
    show : Pointer(LibGtkSource::Completion) -> Void
    hide : Pointer(LibGtkSource::Completion) -> Void
    populate_context : Pointer(LibGtkSource::Completion), Pointer(LibGtkSource::CompletionContext) -> Void
    move_cursor : Pointer(LibGtkSource::Completion), LibGtk::ScrollStep, Int32 -> Void
    move_page : Pointer(LibGtkSource::Completion), LibGtk::ScrollStep, Int32 -> Void
    activate_proposal : Pointer(LibGtkSource::Completion) -> Void
    padding : Pointer(Void)[20]
  end

  struct CompletionContextClass # struct
    parent_class : LibGObject::InitiallyUnownedClass
    cancelled : Pointer(LibGtkSource::CompletionContext) -> Void
    padding : Pointer(Void)[10]
  end

  struct CompletionContextPrivate # struct
    _data : UInt8[0]
  end

  struct CompletionInfoClass # struct
    parent_class : LibGtk::WindowClass
    padding : Pointer(Void)[10]
  end

  struct CompletionInfoPrivate # struct
    _data : UInt8[0]
  end

  struct CompletionItemClass # struct
    parent_class : LibGObject::ObjectClass
    padding : Pointer(Void)[10]
  end

  struct CompletionItemPrivate # struct
    _data : UInt8[0]
  end

  struct CompletionPrivate # struct
    _data : UInt8[0]
  end

  struct CompletionProposalIface # struct
    parent : LibGObject::TypeInterface
    get_label : Pointer(LibGtkSource::CompletionProposal) -> Pointer(UInt8)
    get_markup : Pointer(LibGtkSource::CompletionProposal) -> Pointer(UInt8)
    get_text : Pointer(LibGtkSource::CompletionProposal) -> Pointer(UInt8)
    get_icon : Pointer(LibGtkSource::CompletionProposal) -> Pointer(LibGdkPixbuf::Pixbuf)
    get_icon_name : Pointer(LibGtkSource::CompletionProposal) -> Pointer(UInt8)
    get_gicon : Pointer(LibGtkSource::CompletionProposal) -> Pointer(LibGio::Icon)
    get_info : Pointer(LibGtkSource::CompletionProposal) -> Pointer(UInt8)
    hash : Pointer(LibGtkSource::CompletionProposal) -> UInt32
    equal : Pointer(LibGtkSource::CompletionProposal), Pointer(LibGtkSource::CompletionProposal) -> LibC::Int
    changed : Pointer(LibGtkSource::CompletionProposal) -> Void
  end

  struct CompletionProviderIface # struct
    g_iface : LibGObject::TypeInterface
    get_name : Pointer(LibGtkSource::CompletionProvider) -> Pointer(UInt8)
    get_icon : Pointer(LibGtkSource::CompletionProvider) -> Pointer(LibGdkPixbuf::Pixbuf)
    get_icon_name : Pointer(LibGtkSource::CompletionProvider) -> Pointer(UInt8)
    get_gicon : Pointer(LibGtkSource::CompletionProvider) -> Pointer(LibGio::Icon)
    populate : Pointer(LibGtkSource::CompletionProvider), Pointer(LibGtkSource::CompletionContext) -> Void
    match : Pointer(LibGtkSource::CompletionProvider), Pointer(LibGtkSource::CompletionContext) -> LibC::Int
    get_activation : Pointer(LibGtkSource::CompletionProvider) -> LibGtkSource::CompletionActivation
    get_info_widget : Pointer(LibGtkSource::CompletionProvider), Pointer(LibGtkSource::CompletionProposal) -> Pointer(LibGtk::Widget)
    update_info : Pointer(LibGtkSource::CompletionProvider), Pointer(LibGtkSource::CompletionProposal), Pointer(LibGtkSource::CompletionInfo) -> Void
    get_start_iter : Pointer(LibGtkSource::CompletionProvider), Pointer(LibGtkSource::CompletionContext), Pointer(LibGtkSource::CompletionProposal), LibGtk::TextIter -> LibC::Int
    activate_proposal : Pointer(LibGtkSource::CompletionProvider), Pointer(LibGtkSource::CompletionProposal), Pointer(LibGtk::TextIter) -> LibC::Int
    get_interactive_delay : Pointer(LibGtkSource::CompletionProvider) -> Int32
    get_priority : Pointer(LibGtkSource::CompletionProvider) -> Int32
  end

  struct CompletionWordsClass # struct
    parent_class : LibGObject::ObjectClass
  end

  struct CompletionWordsPrivate # struct
    _data : UInt8[0]
  end

  struct Encoding # struct
    _data : UInt8[0]
  end

  fun _gtk_source_encoding_get_type = gtk_source_encoding_get_type : UInt64
  fun encoding_copy = gtk_source_encoding_copy(this : Encoding*) : Pointer(LibGtkSource::Encoding)
  fun encoding_free = gtk_source_encoding_free(this : Encoding*) : Void
  fun encoding_get_charset = gtk_source_encoding_get_charset(this : Encoding*) : Pointer(UInt8)
  fun encoding_get_name = gtk_source_encoding_get_name(this : Encoding*) : Pointer(UInt8)
  fun encoding_to_string = gtk_source_encoding_to_string(this : Encoding*) : Pointer(UInt8)
  fun encoding_get_all = gtk_source_encoding_get_all : Pointer(Void*)
  fun encoding_get_current = gtk_source_encoding_get_current : Pointer(LibGtkSource::Encoding)
  fun encoding_get_default_candidates = gtk_source_encoding_get_default_candidates : Pointer(Void*)
  fun encoding_get_from_charset = gtk_source_encoding_get_from_charset(charset : Pointer(UInt8)) : Pointer(LibGtkSource::Encoding)
  fun encoding_get_utf8 = gtk_source_encoding_get_utf8 : Pointer(LibGtkSource::Encoding)

  struct FileClass # struct
    parent_class : LibGObject::ObjectClass
    padding : Pointer(Void)[10]
  end

  struct FileLoaderClass # struct
    parent_class : LibGObject::ObjectClass
    padding : Pointer(Void)[10]
  end

  struct FileLoaderPrivate # struct
    _data : UInt8[0]
  end

  struct FilePrivate # struct
    _data : UInt8[0]
  end

  struct FileSaverClass # struct
    parent_class : LibGObject::ObjectClass
    padding : Pointer(Void)[10]
  end

  struct FileSaverPrivate # struct
    _data : UInt8[0]
  end

  struct GutterClass # struct
    parent_class : LibGObject::ObjectClass
    padding : Pointer(Void)[10]
  end

  struct GutterPrivate # struct
    _data : UInt8[0]
  end

  struct GutterRendererClass # struct
    parent_class : LibGObject::InitiallyUnownedClass
    _begin : Pointer(LibGtkSource::GutterRenderer), Pointer(LibCairo::Context), Pointer(LibGdk::Rectangle), Pointer(LibGdk::Rectangle), Pointer(LibGtk::TextIter), Pointer(LibGtk::TextIter) -> Void
    draw : Pointer(LibGtkSource::GutterRenderer), Pointer(LibCairo::Context), Pointer(LibGdk::Rectangle), Pointer(LibGdk::Rectangle), Pointer(LibGtk::TextIter), Pointer(LibGtk::TextIter), LibGtkSource::GutterRendererState -> Void
    _end : Pointer(LibGtkSource::GutterRenderer) -> Void
    change_view : Pointer(LibGtkSource::GutterRenderer), Pointer(LibGtk::TextView) -> Void
    change_buffer : Pointer(LibGtkSource::GutterRenderer), Pointer(LibGtk::TextBuffer) -> Void
    query_activatable : Pointer(LibGtkSource::GutterRenderer), Pointer(LibGtk::TextIter), Pointer(LibGdk::Rectangle), Pointer(LibGdk::Event) -> LibC::Int
    activate : Pointer(LibGtkSource::GutterRenderer), Pointer(LibGtk::TextIter), Pointer(LibGdk::Rectangle), Pointer(LibGdk::Event) -> Void
    queue_draw : Pointer(LibGtkSource::GutterRenderer) -> Void
    query_tooltip : Pointer(LibGtkSource::GutterRenderer), Pointer(LibGtk::TextIter), Pointer(LibGdk::Rectangle), Int32, Int32, Pointer(LibGtk::Tooltip) -> LibC::Int
    query_data : Pointer(LibGtkSource::GutterRenderer), Pointer(LibGtk::TextIter), Pointer(LibGtk::TextIter), LibGtkSource::GutterRendererState -> Void
    padding : Pointer(Void)[20]
  end

  struct GutterRendererPixbufClass # struct
    parent_class : LibGtkSource::GutterRendererClass
    padding : Pointer(Void)[10]
  end

  struct GutterRendererPixbufPrivate # struct
    _data : UInt8[0]
  end

  struct GutterRendererPrivate # struct
    _data : UInt8[0]
  end

  struct GutterRendererTextClass # struct
    parent_class : LibGtkSource::GutterRendererClass
    padding : Pointer(Void)[10]
  end

  struct GutterRendererTextPrivate # struct
    _data : UInt8[0]
  end

  struct LanguageClass # struct
    parent_class : LibGObject::ObjectClass
    padding : Pointer(Void)[10]
  end

  struct LanguageManagerClass # struct
    parent_class : LibGObject::ObjectClass
    padding : Pointer(Void)[10]
  end

  struct LanguageManagerPrivate # struct
    _data : UInt8[0]
  end

  struct LanguagePrivate # struct
    _data : UInt8[0]
  end

  struct MapClass # struct
    parent_class : LibGtkSource::ViewClass
    padding : Pointer(Void)[10]
  end

  struct MarkAttributesClass # struct
    parent_class : LibGObject::ObjectClass
    padding : Pointer(Void)[10]
  end

  struct MarkAttributesPrivate # struct
    _data : UInt8[0]
  end

  struct MarkClass # struct
    parent_class : LibGtk::TextMarkClass
    padding : Pointer(Void)[10]
  end

  struct MarkPrivate # struct
    _data : UInt8[0]
  end

  struct PrintCompositorClass # struct
    parent_class : LibGObject::ObjectClass
    padding : Pointer(Void)[10]
  end

  struct PrintCompositorPrivate # struct
    _data : UInt8[0]
  end

  struct RegionClass # struct
    parent_class : LibGObject::ObjectClass
    padding : Pointer(Void)[10]
  end

  struct RegionIter # struct
    dummy1 : Pointer(Void)
    dummy2 : UInt32
    dummy3 : Pointer(Void)
  end

  fun region_iter_get_subregion = gtk_source_region_iter_get_subregion(this : RegionIter*, start : LibGtk::TextIter*, _end : LibGtk::TextIter*) : LibC::Int
  fun region_iter_is_end = gtk_source_region_iter_is_end(this : RegionIter*) : LibC::Int
  fun region_iter_next = gtk_source_region_iter_next(this : RegionIter*) : LibC::Int

  struct SearchContextClass # struct
    parent_class : LibGObject::ObjectClass
    padding : Pointer(Void)[10]
  end

  struct SearchContextPrivate # struct
    _data : UInt8[0]
  end

  struct SearchSettingsClass # struct
    parent_class : LibGObject::ObjectClass
    padding : Pointer(Void)[10]
  end

  struct SearchSettingsPrivate # struct
    _data : UInt8[0]
  end

  struct SpaceDrawerClass # struct
    parent_class : LibGObject::ObjectClass
    padding : Pointer(Void)[20]
  end

  struct SpaceDrawerPrivate # struct
    _data : UInt8[0]
  end

  struct StyleClass # struct
    _data : UInt8[0]
  end

  struct StyleSchemeChooserButtonClass # struct
    parent : LibGtk::ButtonClass
    padding : Pointer(Void)[10]
  end

  struct StyleSchemeChooserInterface # struct
    base_interface : LibGObject::TypeInterface
    get_style_scheme : Pointer(LibGtkSource::StyleSchemeChooser) -> Pointer(LibGtkSource::StyleScheme)
    set_style_scheme : Pointer(LibGtkSource::StyleSchemeChooser), Pointer(LibGtkSource::StyleScheme) -> Void
    padding : Pointer(Void)[12]
  end

  struct StyleSchemeChooserWidgetClass # struct
    parent : LibGtk::BinClass
    padding : Pointer(Void)[10]
  end

  struct StyleSchemeClass # struct
    base_class : LibGObject::ObjectClass
    padding : Pointer(Void)[10]
  end

  struct StyleSchemeManagerClass # struct
    parent_class : LibGObject::ObjectClass
    padding : Pointer(Void)[10]
  end

  struct StyleSchemeManagerPrivate # struct
    _data : UInt8[0]
  end

  struct StyleSchemePrivate # struct
    _data : UInt8[0]
  end

  struct TagClass # struct
    parent_class : LibGtk::TextTagClass
    padding : Pointer(Void)[10]
  end

  struct UndoManagerIface # struct
    parent : LibGObject::TypeInterface
    can_undo : Pointer(LibGtkSource::UndoManager) -> LibC::Int
    can_redo : Pointer(LibGtkSource::UndoManager) -> LibC::Int
    undo : Pointer(LibGtkSource::UndoManager) -> Void
    redo : Pointer(LibGtkSource::UndoManager) -> Void
    begin_not_undoable_action : Pointer(LibGtkSource::UndoManager) -> Void
    end_not_undoable_action : Pointer(LibGtkSource::UndoManager) -> Void
    can_undo_changed : Pointer(LibGtkSource::UndoManager) -> Void
    can_redo_changed : Pointer(LibGtkSource::UndoManager) -> Void
  end

  struct ViewClass # struct
    parent_class : LibGtk::TextViewClass
    undo : Pointer(LibGtkSource::View) -> Void
    redo : Pointer(LibGtkSource::View) -> Void
    line_mark_activated : Pointer(LibGtkSource::View), Pointer(LibGtk::TextIter), Pointer(LibGdk::Event) -> Void
    show_completion : Pointer(LibGtkSource::View) -> Void
    move_lines : Pointer(LibGtkSource::View), LibC::Int -> Void
    move_words : Pointer(LibGtkSource::View), Int32 -> Void
    padding : Pointer(Void)[20]
  end

  struct ViewPrivate # struct
    _data : UInt8[0]
  end

  ###########################################
  # #    Flags
  ###########################################

  alias CompletionActivation = UInt32

  alias FileSaverFlags = UInt32

  alias GutterRendererState = UInt32

  alias SortFlags = UInt32

  alias SpaceLocationFlags = UInt32

  alias SpaceTypeFlags = UInt32

  ###########################################
  # #    Interfaces
  ###########################################

  struct CompletionProposal # interface
    parent : LibGObject::TypeInterface
    get_label : Pointer(LibGtkSource::CompletionProposal) -> Pointer(UInt8)
    get_markup : Pointer(LibGtkSource::CompletionProposal) -> Pointer(UInt8)
    get_text : Pointer(LibGtkSource::CompletionProposal) -> Pointer(UInt8)
    get_icon : Pointer(LibGtkSource::CompletionProposal) -> Pointer(LibGdkPixbuf::Pixbuf)
    get_icon_name : Pointer(LibGtkSource::CompletionProposal) -> Pointer(UInt8)
    get_gicon : Pointer(LibGtkSource::CompletionProposal) -> Pointer(LibGio::Icon)
    get_info : Pointer(LibGtkSource::CompletionProposal) -> Pointer(UInt8)
    hash : Pointer(LibGtkSource::CompletionProposal) -> UInt32
    equal : Pointer(LibGtkSource::CompletionProposal), Pointer(LibGtkSource::CompletionProposal) -> LibC::Int
    changed : Pointer(LibGtkSource::CompletionProposal) -> Void
    # Signal changed
    # Virtual function changed
    # Virtual function equal
    # Virtual function get_gicon
    # Virtual function get_icon
    # Virtual function get_icon_name
    # Virtual function get_info
    # Virtual function get_label
    # Virtual function get_markup
    # Virtual function get_text
    # Virtual function hash
  end

  fun _gtk_source_completion_proposal_get_type = gtk_source_completion_proposal_get_type : UInt64
  fun completion_proposal_changed = gtk_source_completion_proposal_changed(this : CompletionProposal*) : Void
  fun completion_proposal_equal = gtk_source_completion_proposal_equal(this : CompletionProposal*, other : Pointer(LibGtkSource::CompletionProposal)) : LibC::Int
  fun completion_proposal_get_gicon = gtk_source_completion_proposal_get_gicon(this : CompletionProposal*) : Pointer(LibGio::Icon)
  fun completion_proposal_get_icon = gtk_source_completion_proposal_get_icon(this : CompletionProposal*) : Pointer(LibGdkPixbuf::Pixbuf)
  fun completion_proposal_get_icon_name = gtk_source_completion_proposal_get_icon_name(this : CompletionProposal*) : Pointer(UInt8)
  fun completion_proposal_get_info = gtk_source_completion_proposal_get_info(this : CompletionProposal*) : Pointer(UInt8)
  fun completion_proposal_get_label = gtk_source_completion_proposal_get_label(this : CompletionProposal*) : Pointer(UInt8)
  fun completion_proposal_get_markup = gtk_source_completion_proposal_get_markup(this : CompletionProposal*) : Pointer(UInt8)
  fun completion_proposal_get_text = gtk_source_completion_proposal_get_text(this : CompletionProposal*) : Pointer(UInt8)
  fun completion_proposal_hash = gtk_source_completion_proposal_hash(this : CompletionProposal*) : UInt32

  struct CompletionProvider # interface
    g_iface : LibGObject::TypeInterface
    get_name : Pointer(LibGtkSource::CompletionProvider) -> Pointer(UInt8)
    get_icon : Pointer(LibGtkSource::CompletionProvider) -> Pointer(LibGdkPixbuf::Pixbuf)
    get_icon_name : Pointer(LibGtkSource::CompletionProvider) -> Pointer(UInt8)
    get_gicon : Pointer(LibGtkSource::CompletionProvider) -> Pointer(LibGio::Icon)
    populate : Pointer(LibGtkSource::CompletionProvider), Pointer(LibGtkSource::CompletionContext) -> Void
    match : Pointer(LibGtkSource::CompletionProvider), Pointer(LibGtkSource::CompletionContext) -> LibC::Int
    get_activation : Pointer(LibGtkSource::CompletionProvider) -> LibGtkSource::CompletionActivation
    get_info_widget : Pointer(LibGtkSource::CompletionProvider), Pointer(LibGtkSource::CompletionProposal) -> Pointer(LibGtk::Widget)
    update_info : Pointer(LibGtkSource::CompletionProvider), Pointer(LibGtkSource::CompletionProposal), Pointer(LibGtkSource::CompletionInfo) -> Void
    get_start_iter : Pointer(LibGtkSource::CompletionProvider), Pointer(LibGtkSource::CompletionContext), Pointer(LibGtkSource::CompletionProposal), LibGtk::TextIter -> LibC::Int
    activate_proposal : Pointer(LibGtkSource::CompletionProvider), Pointer(LibGtkSource::CompletionProposal), Pointer(LibGtk::TextIter) -> LibC::Int
    get_interactive_delay : Pointer(LibGtkSource::CompletionProvider) -> Int32
    get_priority : Pointer(LibGtkSource::CompletionProvider) -> Int32
    # Virtual function activate_proposal
    # Virtual function get_activation
    # Virtual function get_gicon
    # Virtual function get_icon
    # Virtual function get_icon_name
    # Virtual function get_info_widget
    # Virtual function get_interactive_delay
    # Virtual function get_name
    # Virtual function get_priority
    # Virtual function get_start_iter
    # Virtual function match
    # Virtual function populate
    # Virtual function update_info
  end

  fun _gtk_source_completion_provider_get_type = gtk_source_completion_provider_get_type : UInt64
  fun completion_provider_activate_proposal = gtk_source_completion_provider_activate_proposal(this : CompletionProvider*, proposal : Pointer(LibGtkSource::CompletionProposal), iter : Pointer(LibGtk::TextIter)) : LibC::Int
  fun completion_provider_get_activation = gtk_source_completion_provider_get_activation(this : CompletionProvider*) : LibGtkSource::CompletionActivation
  fun completion_provider_get_gicon = gtk_source_completion_provider_get_gicon(this : CompletionProvider*) : Pointer(LibGio::Icon)
  fun completion_provider_get_icon = gtk_source_completion_provider_get_icon(this : CompletionProvider*) : Pointer(LibGdkPixbuf::Pixbuf)
  fun completion_provider_get_icon_name = gtk_source_completion_provider_get_icon_name(this : CompletionProvider*) : Pointer(UInt8)
  fun completion_provider_get_info_widget = gtk_source_completion_provider_get_info_widget(this : CompletionProvider*, proposal : Pointer(LibGtkSource::CompletionProposal)) : Pointer(LibGtk::Widget)
  fun completion_provider_get_interactive_delay = gtk_source_completion_provider_get_interactive_delay(this : CompletionProvider*) : Int32
  fun completion_provider_get_name = gtk_source_completion_provider_get_name(this : CompletionProvider*) : Pointer(UInt8)
  fun completion_provider_get_priority = gtk_source_completion_provider_get_priority(this : CompletionProvider*) : Int32
  fun completion_provider_get_start_iter = gtk_source_completion_provider_get_start_iter(this : CompletionProvider*, context : Pointer(LibGtkSource::CompletionContext), proposal : Pointer(LibGtkSource::CompletionProposal), iter : LibGtk::TextIter*) : LibC::Int
  fun completion_provider_match = gtk_source_completion_provider_match(this : CompletionProvider*, context : Pointer(LibGtkSource::CompletionContext)) : LibC::Int
  fun completion_provider_populate = gtk_source_completion_provider_populate(this : CompletionProvider*, context : Pointer(LibGtkSource::CompletionContext)) : Void
  fun completion_provider_update_info = gtk_source_completion_provider_update_info(this : CompletionProvider*, proposal : Pointer(LibGtkSource::CompletionProposal), info : Pointer(LibGtkSource::CompletionInfo)) : Void

  struct StyleSchemeChooser # interface
    base_interface : LibGObject::TypeInterface
    get_style_scheme : Pointer(LibGtkSource::StyleSchemeChooser) -> Pointer(LibGtkSource::StyleScheme)
    set_style_scheme : Pointer(LibGtkSource::StyleSchemeChooser), Pointer(LibGtkSource::StyleScheme) -> Void
    padding : Pointer(Void)[12]
    # Virtual function get_style_scheme
    # Virtual function set_style_scheme
    # Property style-scheme : LibGtkSource::StyleScheme
  end

  fun _gtk_source_style_scheme_chooser_get_type = gtk_source_style_scheme_chooser_get_type : UInt64
  fun style_scheme_chooser_get_style_scheme = gtk_source_style_scheme_chooser_get_style_scheme(this : StyleSchemeChooser*) : Pointer(LibGtkSource::StyleScheme)
  fun style_scheme_chooser_set_style_scheme = gtk_source_style_scheme_chooser_set_style_scheme(this : StyleSchemeChooser*, scheme : Pointer(LibGtkSource::StyleScheme)) : Void

  struct UndoManager # interface
    parent : LibGObject::TypeInterface
    can_undo : Pointer(LibGtkSource::UndoManager) -> LibC::Int
    can_redo : Pointer(LibGtkSource::UndoManager) -> LibC::Int
    undo : Pointer(LibGtkSource::UndoManager) -> Void
    redo : Pointer(LibGtkSource::UndoManager) -> Void
    begin_not_undoable_action : Pointer(LibGtkSource::UndoManager) -> Void
    end_not_undoable_action : Pointer(LibGtkSource::UndoManager) -> Void
    can_undo_changed : Pointer(LibGtkSource::UndoManager) -> Void
    can_redo_changed : Pointer(LibGtkSource::UndoManager) -> Void
    # Signal can-redo-changed
    # Signal can-undo-changed
    # Virtual function begin_not_undoable_action
    # Virtual function can_redo
    # Virtual function can_redo_changed
    # Virtual function can_undo
    # Virtual function can_undo_changed
    # Virtual function end_not_undoable_action
    # Virtual function redo
    # Virtual function undo
  end

  fun _gtk_source_undo_manager_get_type = gtk_source_undo_manager_get_type : UInt64
  fun undo_manager_begin_not_undoable_action = gtk_source_undo_manager_begin_not_undoable_action(this : UndoManager*) : Void
  fun undo_manager_can_redo = gtk_source_undo_manager_can_redo(this : UndoManager*) : LibC::Int
  fun undo_manager_can_redo_changed = gtk_source_undo_manager_can_redo_changed(this : UndoManager*) : Void
  fun undo_manager_can_undo = gtk_source_undo_manager_can_undo(this : UndoManager*) : LibC::Int
  fun undo_manager_can_undo_changed = gtk_source_undo_manager_can_undo_changed(this : UndoManager*) : Void
  fun undo_manager_end_not_undoable_action = gtk_source_undo_manager_end_not_undoable_action(this : UndoManager*) : Void
  fun undo_manager_redo = gtk_source_undo_manager_redo(this : UndoManager*) : Void
  fun undo_manager_undo = gtk_source_undo_manager_undo(this : UndoManager*) : Void

  ###########################################
  # #    Functions
  ###########################################
  fun completion_error_quark = gtk_source_completion_error_quark : UInt32
  fun encoding_get_all = gtk_source_encoding_get_all : Pointer(Void*)
  fun encoding_get_current = gtk_source_encoding_get_current : Pointer(LibGtkSource::Encoding)
  fun encoding_get_default_candidates = gtk_source_encoding_get_default_candidates : Pointer(Void*)
  fun encoding_get_from_charset = gtk_source_encoding_get_from_charset(charset : Pointer(UInt8)) : Pointer(LibGtkSource::Encoding)
  fun encoding_get_utf8 = gtk_source_encoding_get_utf8 : Pointer(LibGtkSource::Encoding)
  fun file_loader_error_quark = gtk_source_file_loader_error_quark : UInt32
  fun file_saver_error_quark = gtk_source_file_saver_error_quark : UInt32
  fun finalize = gtk_source_finalize : Void
  fun init = gtk_source_init : Void
  fun utils_escape_search_text = gtk_source_utils_escape_search_text(text : Pointer(UInt8)) : Pointer(UInt8)
  fun utils_unescape_search_text = gtk_source_utils_unescape_search_text(text : Pointer(UInt8)) : Pointer(UInt8)
end

module GtkSource
  def self.completion_error_quark
    __var0 = LibGtkSource.completion_error_quark
    __var0
  end

  def self.encoding_get_all
    __var0 = LibGtkSource.encoding_get_all
    GObject.raise_unexpected_null("gtk_source_encoding_get_all") if __var0.null?
    GLib::SListIterator(GtkSource::Encoding, LibGtkSource::Encoding*).new(GLib::SList.new(__var0.as(LibGLib::SList*)))
  end

  def self.encoding_get_current
    __var0 = LibGtkSource.encoding_get_current
    GObject.raise_unexpected_null("gtk_source_encoding_get_current") if __var0.null?
    GtkSource::Encoding.new(__var0)
  end

  def self.encoding_get_default_candidates
    __var0 = LibGtkSource.encoding_get_default_candidates
    GObject.raise_unexpected_null("gtk_source_encoding_get_default_candidates") if __var0.null?
    GLib::SListIterator(GtkSource::Encoding, LibGtkSource::Encoding*).new(GLib::SList.new(__var0.as(LibGLib::SList*)))
  end

  def self.encoding_get_from_charset(charset : ::String)
    __var0 = LibGtkSource.encoding_get_from_charset(charset.to_unsafe)
    __var1 = GtkSource::Encoding.new(__var0) if __var0
    __var1
  end

  def self.encoding_get_utf8
    __var0 = LibGtkSource.encoding_get_utf8
    GObject.raise_unexpected_null("gtk_source_encoding_get_utf8") if __var0.null?
    GtkSource::Encoding.new(__var0)
  end

  def self.file_loader_error_quark
    __var0 = LibGtkSource.file_loader_error_quark
    __var0
  end

  def self.file_saver_error_quark
    __var0 = LibGtkSource.file_saver_error_quark
    __var0
  end

  def self.finalize
    LibGtkSource.finalize
    nil
  end

  def self.init
    LibGtkSource.init
    nil
  end

  def self.utils_escape_search_text(text : ::String)
    __var0 = LibGtkSource.utils_escape_search_text(text.to_unsafe)
    GObject.raise_unexpected_null("gtk_source_utils_escape_search_text") if __var0.null?
    ::String.new(__var0)
  end

  def self.utils_unescape_search_text(text : ::String)
    __var0 = LibGtkSource.utils_unescape_search_text(text.to_unsafe)
    GObject.raise_unexpected_null("gtk_source_utils_unescape_search_text") if __var0.null?
    ::String.new(__var0)
  end

  enum BackgroundPatternType : UInt32
    NONE = 0
    GRID = 1
  end

  enum BracketMatchType : UInt32
    NONE         = 0
    OUT_OF_RANGE = 1
    NOT_FOUND    = 2
    FOUND        = 3
  end

  class Buffer < Gtk::TextBuffer
    @pointer : Void*

    def initialize(pointer : LibGtkSource::Buffer*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceBuffer")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_buffer_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::Buffer*)
    end

    def to_unsafe_buffer
      @pointer.not_nil!.as(LibGtkSource::Buffer*)
    end

    def initialize(*, highlight_matching_brackets : ::Bool? = nil, highlight_syntax : ::Bool? = nil, implicit_trailing_newline : ::Bool? = nil, language : GtkSource::Language? = nil, max_undo_levels : Int32? = nil, style_scheme : GtkSource::StyleScheme? = nil, tag_table : Gtk::TextTagTable? = nil, text : ::String? = nil, undo_manager : GtkSource::UndoManager? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless highlight_matching_brackets.nil?
        __var0 << "highlight-matching-brackets".to_unsafe
        __var1 << highlight_matching_brackets.to_gvalue.to_unsafe.value
      end

      unless highlight_syntax.nil?
        __var0 << "highlight-syntax".to_unsafe
        __var1 << highlight_syntax.to_gvalue.to_unsafe.value
      end

      unless implicit_trailing_newline.nil?
        __var0 << "implicit-trailing-newline".to_unsafe
        __var1 << implicit_trailing_newline.to_gvalue.to_unsafe.value
      end

      unless language.nil?
        __var0 << "language".to_unsafe
        __var1 << language.to_gvalue.to_unsafe.value
      end

      unless max_undo_levels.nil?
        __var0 << "max-undo-levels".to_unsafe
        __var1 << max_undo_levels.to_gvalue.to_unsafe.value
      end

      unless style_scheme.nil?
        __var0 << "style-scheme".to_unsafe
        __var1 << style_scheme.to_gvalue.to_unsafe.value
      end

      unless tag_table.nil?
        __var0 << "tag-table".to_unsafe
        __var1 << tag_table.to_gvalue.to_unsafe.value
      end

      unless text.nil?
        __var0 << "text".to_unsafe
        __var1 << text.to_gvalue.to_unsafe.value
      end

      unless undo_manager.nil?
        __var0 << "undo-manager".to_unsafe
        __var1 << undo_manager.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_buffer_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new(table : Gtk::TextTagTable?) : self
      __var0 = LibGtkSource.buffer_new(table ? table.to_unsafe_texttagtable : Pointer(LibGtk::TextTagTable).null)
      GObject.raise_unexpected_null("gtk_source_buffer_new") if __var0.null?
      cast(GtkSource::Buffer.new(__var0))
    end

    def self.new_with_language(language : GtkSource::Language) : self
      __var0 = LibGtkSource.buffer_new_with_language(language.to_unsafe_language)
      GObject.raise_unexpected_null("gtk_source_buffer_new_with_language") if __var0.null?
      cast(GtkSource::Buffer.new(__var0))
    end

    def backward_iter_to_source_mark(iter : Gtk::TextIter, category : ::String?)
      __var0 = LibGtkSource.buffer_backward_iter_to_source_mark(@pointer.as(LibGtkSource::Buffer*), iter, category ? category.to_unsafe : Pointer(UInt8).null)
      (__var0 == 1)
    end

    def begin_not_undoable_action
      LibGtkSource.buffer_begin_not_undoable_action(@pointer.as(LibGtkSource::Buffer*))
      nil
    end

    def can_redo
      __var0 = LibGtkSource.buffer_can_redo(@pointer.as(LibGtkSource::Buffer*))
      (__var0 == 1)
    end

    def can_undo
      __var0 = LibGtkSource.buffer_can_undo(@pointer.as(LibGtkSource::Buffer*))
      (__var0 == 1)
    end

    def change_case(case_type : GtkSource::ChangeCaseType, start : Gtk::TextIter, _end : Gtk::TextIter)
      LibGtkSource.buffer_change_case(@pointer.as(LibGtkSource::Buffer*), case_type, start.to_unsafe.as(LibGtk::TextIter*), _end.to_unsafe.as(LibGtk::TextIter*))
      nil
    end

    def create_source_mark(name : ::String?, category : ::String, where : Gtk::TextIter)
      __var0 = LibGtkSource.buffer_create_source_mark(@pointer.as(LibGtkSource::Buffer*), name ? name.to_unsafe : Pointer(UInt8).null, category.to_unsafe, where.to_unsafe.as(LibGtk::TextIter*))
      GObject.raise_unexpected_null("gtk_source_buffer_create_source_mark") if __var0.null?
      GtkSource::Mark.new(__var0)
    end

    def end_not_undoable_action
      LibGtkSource.buffer_end_not_undoable_action(@pointer.as(LibGtkSource::Buffer*))
      nil
    end

    def ensure_highlight(start : Gtk::TextIter, _end : Gtk::TextIter)
      LibGtkSource.buffer_ensure_highlight(@pointer.as(LibGtkSource::Buffer*), start.to_unsafe.as(LibGtk::TextIter*), _end.to_unsafe.as(LibGtk::TextIter*))
      nil
    end

    def forward_iter_to_source_mark(iter : Gtk::TextIter, category : ::String?)
      __var0 = LibGtkSource.buffer_forward_iter_to_source_mark(@pointer.as(LibGtkSource::Buffer*), iter, category ? category.to_unsafe : Pointer(UInt8).null)
      (__var0 == 1)
    end

    def context_classes_at_iter(iter : Gtk::TextIter)
      __var0 = LibGtkSource.buffer_get_context_classes_at_iter(@pointer.as(LibGtkSource::Buffer*), iter.to_unsafe.as(LibGtk::TextIter*))
      GObject.raise_unexpected_null("gtk_source_buffer_get_context_classes_at_iter") if __var0.null?
      GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      }
    end

    def highlight_matching_brackets
      __var0 = LibGtkSource.buffer_get_highlight_matching_brackets(@pointer.as(LibGtkSource::Buffer*))
      (__var0 == 1)
    end

    def highlight_syntax
      __var0 = LibGtkSource.buffer_get_highlight_syntax(@pointer.as(LibGtkSource::Buffer*))
      (__var0 == 1)
    end

    def implicit_trailing_newline
      __var0 = LibGtkSource.buffer_get_implicit_trailing_newline(@pointer.as(LibGtkSource::Buffer*))
      (__var0 == 1)
    end

    def language
      __var0 = LibGtkSource.buffer_get_language(@pointer.as(LibGtkSource::Buffer*))
      __var1 = GtkSource::Language.new(__var0) if __var0
      __var1
    end

    def max_undo_levels
      __var0 = LibGtkSource.buffer_get_max_undo_levels(@pointer.as(LibGtkSource::Buffer*))
      __var0
    end

    def source_marks_at_iter(iter : Gtk::TextIter, category : ::String?)
      __var0 = LibGtkSource.buffer_get_source_marks_at_iter(@pointer.as(LibGtkSource::Buffer*), iter.to_unsafe.as(LibGtk::TextIter*), category ? category.to_unsafe : Pointer(UInt8).null)
      GObject.raise_unexpected_null("gtk_source_buffer_get_source_marks_at_iter") if __var0.null?
      GLib::SListIterator(GtkSource::Mark, LibGtkSource::Mark*).new(GLib::SList.new(__var0.as(LibGLib::SList*)))
    end

    def source_marks_at_line(line : ::Int, category : ::String?)
      __var0 = LibGtkSource.buffer_get_source_marks_at_line(@pointer.as(LibGtkSource::Buffer*), Int32.new(line), category ? category.to_unsafe : Pointer(UInt8).null)
      GObject.raise_unexpected_null("gtk_source_buffer_get_source_marks_at_line") if __var0.null?
      GLib::SListIterator(GtkSource::Mark, LibGtkSource::Mark*).new(GLib::SList.new(__var0.as(LibGLib::SList*)))
    end

    def style_scheme
      __var0 = LibGtkSource.buffer_get_style_scheme(@pointer.as(LibGtkSource::Buffer*))
      __var1 = GtkSource::StyleScheme.new(__var0) if __var0
      __var1
    end

    def undo_manager
      __var0 = LibGtkSource.buffer_get_undo_manager(@pointer.as(LibGtkSource::Buffer*))
      __var1 = GtkSource::UndoManager::Wrapper.new(__var0) if __var0
      __var1
    end

    def iter_backward_to_context_class_toggle(iter : Gtk::TextIter, context_class : ::String)
      __var0 = LibGtkSource.buffer_iter_backward_to_context_class_toggle(@pointer.as(LibGtkSource::Buffer*), iter, context_class.to_unsafe)
      (__var0 == 1)
    end

    def iter_forward_to_context_class_toggle(iter : Gtk::TextIter, context_class : ::String)
      __var0 = LibGtkSource.buffer_iter_forward_to_context_class_toggle(@pointer.as(LibGtkSource::Buffer*), iter, context_class.to_unsafe)
      (__var0 == 1)
    end

    def iter_has_context_class(iter : Gtk::TextIter, context_class : ::String)
      __var0 = LibGtkSource.buffer_iter_has_context_class(@pointer.as(LibGtkSource::Buffer*), iter.to_unsafe.as(LibGtk::TextIter*), context_class.to_unsafe)
      (__var0 == 1)
    end

    def join_lines(start : Gtk::TextIter, _end : Gtk::TextIter)
      LibGtkSource.buffer_join_lines(@pointer.as(LibGtkSource::Buffer*), start.to_unsafe.as(LibGtk::TextIter*), _end.to_unsafe.as(LibGtk::TextIter*))
      nil
    end

    def redo
      LibGtkSource.buffer_redo(@pointer.as(LibGtkSource::Buffer*))
      nil
    end

    def remove_source_marks(start : Gtk::TextIter, _end : Gtk::TextIter, category : ::String?)
      LibGtkSource.buffer_remove_source_marks(@pointer.as(LibGtkSource::Buffer*), start.to_unsafe.as(LibGtk::TextIter*), _end.to_unsafe.as(LibGtk::TextIter*), category ? category.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def highlight_matching_brackets=(highlight : ::Bool)
      LibGtkSource.buffer_set_highlight_matching_brackets(@pointer.as(LibGtkSource::Buffer*), LibC::Int.new(highlight ? 1 : 0))
      nil
    end

    def highlight_syntax=(highlight : ::Bool)
      LibGtkSource.buffer_set_highlight_syntax(@pointer.as(LibGtkSource::Buffer*), LibC::Int.new(highlight ? 1 : 0))
      nil
    end

    def implicit_trailing_newline=(implicit_trailing_newline : ::Bool)
      LibGtkSource.buffer_set_implicit_trailing_newline(@pointer.as(LibGtkSource::Buffer*), LibC::Int.new(implicit_trailing_newline ? 1 : 0))
      nil
    end

    def language=(language : GtkSource::Language?)
      LibGtkSource.buffer_set_language(@pointer.as(LibGtkSource::Buffer*), language ? language.to_unsafe_language : Pointer(LibGtkSource::Language).null)
      nil
    end

    def max_undo_levels=(max_undo_levels : ::Int)
      LibGtkSource.buffer_set_max_undo_levels(@pointer.as(LibGtkSource::Buffer*), Int32.new(max_undo_levels))
      nil
    end

    def style_scheme=(scheme : GtkSource::StyleScheme?)
      LibGtkSource.buffer_set_style_scheme(@pointer.as(LibGtkSource::Buffer*), scheme ? scheme.to_unsafe_stylescheme : Pointer(LibGtkSource::StyleScheme).null)
      nil
    end

    def undo_manager=(manager : GtkSource::UndoManager?)
      LibGtkSource.buffer_set_undo_manager(@pointer.as(LibGtkSource::Buffer*), manager ? manager.to_unsafe_undomanager : Pointer(LibGtkSource::UndoManager).null)
      nil
    end

    def sort_lines(start : Gtk::TextIter, _end : Gtk::TextIter, flags : GtkSource::SortFlags, column : ::Int)
      LibGtkSource.buffer_sort_lines(@pointer.as(LibGtkSource::Buffer*), start.to_unsafe.as(LibGtk::TextIter*), _end.to_unsafe.as(LibGtk::TextIter*), flags, Int32.new(column))
      nil
    end

    def undo
      LibGtkSource.buffer_undo(@pointer.as(LibGtkSource::Buffer*))
      nil
    end

    alias BracketMatchedSignal = Buffer, Gtk::TextIter?, GtkSource::BracketMatchType -> Nil

    def on_bracket_matched(*, after = false, &block : BracketMatchedSignal)
      __var0 = ->(arg0 : LibGtkSource::Buffer*, arg1 : LibGtk::TextIter*, arg2 : LibGtkSource::BracketMatchType, box : Void*) {
        ::Box(BracketMatchedSignal).unbox(box).call(Buffer.new(arg0), arg1.null? ? nil : Gtk::TextIter.new(arg1), GtkSource::BracketMatchType.new(arg2))
      }

      __var1 = ::Box.box(BracketMatchedSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "bracket-matched", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_bracket_matched(&block : BracketMatchedSignal)
      on_bracket_matched(after: true, &block)
    end

    alias HighlightUpdatedSignal = Buffer, Gtk::TextIter, Gtk::TextIter -> Nil

    def on_highlight_updated(*, after = false, &block : HighlightUpdatedSignal)
      __var0 = ->(arg0 : LibGtkSource::Buffer*, arg1 : LibGtk::TextIter*, arg2 : LibGtk::TextIter*, box : Void*) {
        ::Box(HighlightUpdatedSignal).unbox(box).call(Buffer.new(arg0), arg1.null? ? GObject.raise_unexpected_null("start in highlight_updated") : Gtk::TextIter.new(arg1), arg2.null? ? GObject.raise_unexpected_null("_end in highlight_updated") : Gtk::TextIter.new(arg2))
      }

      __var1 = ::Box.box(HighlightUpdatedSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "highlight-updated", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_highlight_updated(&block : HighlightUpdatedSignal)
      on_highlight_updated(after: true, &block)
    end

    alias RedoSignal = Buffer -> Nil

    def on_redo(*, after = false, &block : RedoSignal)
      __var0 = ->(arg0 : LibGtkSource::Buffer*, box : Void*) {
        ::Box(RedoSignal).unbox(box).call(Buffer.new(arg0))
      }

      __var1 = ::Box.box(RedoSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "redo", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_redo(&block : RedoSignal)
      on_redo(after: true, &block)
    end

    alias SourceMarkUpdatedSignal = Buffer, Gtk::TextMark -> Nil

    def on_source_mark_updated(*, after = false, &block : SourceMarkUpdatedSignal)
      __var0 = ->(arg0 : LibGtkSource::Buffer*, arg1 : LibGtk::TextMark*, box : Void*) {
        ::Box(SourceMarkUpdatedSignal).unbox(box).call(Buffer.new(arg0), arg1.null? ? GObject.raise_unexpected_null("mark in source_mark_updated") : Gtk::TextMark.new(arg1))
      }

      __var1 = ::Box.box(SourceMarkUpdatedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "source-mark-updated", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_source_mark_updated(&block : SourceMarkUpdatedSignal)
      on_source_mark_updated(after: true, &block)
    end

    alias UndoSignal = Buffer -> Nil

    def on_undo(*, after = false, &block : UndoSignal)
      __var0 = ->(arg0 : LibGtkSource::Buffer*, box : Void*) {
        ::Box(UndoSignal).unbox(box).call(Buffer.new(arg0))
      }

      __var1 = ::Box.box(UndoSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "undo", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_undo(&block : UndoSignal)
      on_undo(after: true, &block)
    end
  end

  class BufferClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(456u64, 0u8).as(LibGtkSource::BufferClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::BufferClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::BufferClass*)
    end

    def to_unsafe_bufferclass
      @pointer.not_nil!.as(LibGtkSource::BufferClass*)
    end

    def parent_class
      Gtk::TextBufferClass.new(to_unsafe.as(LibGtkSource::BufferClass*).value.parent_class)
    end

    def undo
      to_unsafe.as(LibGtkSource::BufferClass*).value.undo
    end

    def redo
      to_unsafe.as(LibGtkSource::BufferClass*).value.redo
    end

    def bracket_matched
      to_unsafe.as(LibGtkSource::BufferClass*).value.bracket_matched
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::BufferClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class BufferPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::BufferPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::BufferPrivate*)
    end

    def to_unsafe_bufferprivate
      @pointer.not_nil!.as(LibGtkSource::BufferPrivate*)
    end
  end

  enum ChangeCaseType : UInt32
    LOWER  = 0
    UPPER  = 1
    TOGGLE = 2
    TITLE  = 3
  end

  class Completion < GObject::Object
    include Gtk::Buildable

    @pointer : Void*

    def initialize(pointer : LibGtkSource::Completion*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceCompletion")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_completion_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::Completion*)
    end

    def to_unsafe_completion
      @pointer.not_nil!.as(LibGtkSource::Completion*)
    end

    def initialize(*, accelerators : UInt32? = nil, auto_complete_delay : UInt32? = nil, proposal_page_size : UInt32? = nil, provider_page_size : UInt32? = nil, remember_info_visibility : ::Bool? = nil, select_on_show : ::Bool? = nil, show_headers : ::Bool? = nil, show_icons : ::Bool? = nil, view : GtkSource::View? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless accelerators.nil?
        __var0 << "accelerators".to_unsafe
        __var1 << accelerators.to_gvalue.to_unsafe.value
      end

      unless auto_complete_delay.nil?
        __var0 << "auto-complete-delay".to_unsafe
        __var1 << auto_complete_delay.to_gvalue.to_unsafe.value
      end

      unless proposal_page_size.nil?
        __var0 << "proposal-page-size".to_unsafe
        __var1 << proposal_page_size.to_gvalue.to_unsafe.value
      end

      unless provider_page_size.nil?
        __var0 << "provider-page-size".to_unsafe
        __var1 << provider_page_size.to_gvalue.to_unsafe.value
      end

      unless remember_info_visibility.nil?
        __var0 << "remember-info-visibility".to_unsafe
        __var1 << remember_info_visibility.to_gvalue.to_unsafe.value
      end

      unless select_on_show.nil?
        __var0 << "select-on-show".to_unsafe
        __var1 << select_on_show.to_gvalue.to_unsafe.value
      end

      unless show_headers.nil?
        __var0 << "show-headers".to_unsafe
        __var1 << show_headers.to_gvalue.to_unsafe.value
      end

      unless show_icons.nil?
        __var0 << "show-icons".to_unsafe
        __var1 << show_icons.to_gvalue.to_unsafe.value
      end

      unless view.nil?
        __var0 << "view".to_unsafe
        __var1 << view.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_completion_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def add_provider(provider : GtkSource::CompletionProvider)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGtkSource.completion_add_provider(@pointer.as(LibGtkSource::Completion*), provider.to_unsafe_completionprovider, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def block_interactive
      LibGtkSource.completion_block_interactive(@pointer.as(LibGtkSource::Completion*))
      nil
    end

    def create_context(position : Gtk::TextIter?)
      __var0 = LibGtkSource.completion_create_context(@pointer.as(LibGtkSource::Completion*), position ? position.to_unsafe.as(LibGtk::TextIter*) : Pointer(LibGtk::TextIter).null)
      GObject.raise_unexpected_null("gtk_source_completion_create_context") if __var0.null?
      GtkSource::CompletionContext.new(__var0)
    end

    def info_window
      __var0 = LibGtkSource.completion_get_info_window(@pointer.as(LibGtkSource::Completion*))
      GObject.raise_unexpected_null("gtk_source_completion_get_info_window") if __var0.null?
      GtkSource::CompletionInfo.new(__var0)
    end

    def providers
      __var0 = LibGtkSource.completion_get_providers(@pointer.as(LibGtkSource::Completion*))
      GObject.raise_unexpected_null("gtk_source_completion_get_providers") if __var0.null?
      GLib::ListIterator(GtkSource::CompletionProvider, LibGtkSource::CompletionProvider*).new(GLib::List.new(__var0.as(LibGLib::List*)))
    end

    def view
      __var0 = LibGtkSource.completion_get_view(@pointer.as(LibGtkSource::Completion*))
      __var1 = GtkSource::View.new(__var0) if __var0
      __var1
    end

    def hide
      LibGtkSource.completion_hide(@pointer.as(LibGtkSource::Completion*))
      nil
    end

    def remove_provider(provider : GtkSource::CompletionProvider)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGtkSource.completion_remove_provider(@pointer.as(LibGtkSource::Completion*), provider.to_unsafe_completionprovider, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def start(providers : Void*?, context : GtkSource::CompletionContext)
      __var0 = LibGtkSource.completion_start(@pointer.as(LibGtkSource::Completion*), providers ? providers : Pointer(Void*).null, context.to_unsafe_completioncontext)
      (__var0 == 1)
    end

    def unblock_interactive
      LibGtkSource.completion_unblock_interactive(@pointer.as(LibGtkSource::Completion*))
      nil
    end

    def accelerators : UInt32
      __var0 = GObject::Value.new(type: GObject::Type::UINT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "accelerators", __var0)
      __var0.uint
    end

    def accelerators=(value : UInt32)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "accelerators", value.to_gvalue)
    end

    def auto_complete_delay : UInt32
      __var0 = GObject::Value.new(type: GObject::Type::UINT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "auto-complete-delay", __var0)
      __var0.uint
    end

    def auto_complete_delay=(value : UInt32)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "auto-complete-delay", value.to_gvalue)
    end

    def proposal_page_size : UInt32
      __var0 = GObject::Value.new(type: GObject::Type::UINT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "proposal-page-size", __var0)
      __var0.uint
    end

    def proposal_page_size=(value : UInt32)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "proposal-page-size", value.to_gvalue)
    end

    def provider_page_size : UInt32
      __var0 = GObject::Value.new(type: GObject::Type::UINT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "provider-page-size", __var0)
      __var0.uint
    end

    def provider_page_size=(value : UInt32)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "provider-page-size", value.to_gvalue)
    end

    def remember_info_visibility : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "remember-info-visibility", __var0)
      __var0.boolean
    end

    def remember_info_visibility=(value : ::Bool)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "remember-info-visibility", value.to_gvalue)
    end

    def select_on_show : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "select-on-show", __var0)
      __var0.boolean
    end

    def select_on_show=(value : ::Bool)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "select-on-show", value.to_gvalue)
    end

    def show_headers : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "show-headers", __var0)
      __var0.boolean
    end

    def show_headers=(value : ::Bool)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "show-headers", value.to_gvalue)
    end

    def show_icons : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "show-icons", __var0)
      __var0.boolean
    end

    def show_icons=(value : ::Bool)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "show-icons", value.to_gvalue)
    end

    alias ActivateProposalSignal = Completion -> Nil

    def on_activate_proposal(*, after = false, &block : ActivateProposalSignal)
      __var0 = ->(arg0 : LibGtkSource::Completion*, box : Void*) {
        ::Box(ActivateProposalSignal).unbox(box).call(Completion.new(arg0))
      }

      __var1 = ::Box.box(ActivateProposalSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "activate-proposal", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_activate_proposal(&block : ActivateProposalSignal)
      on_activate_proposal(after: true, &block)
    end

    alias HideSignal = Completion -> Nil

    def on_hide(*, after = false, &block : HideSignal)
      __var0 = ->(arg0 : LibGtkSource::Completion*, box : Void*) {
        ::Box(HideSignal).unbox(box).call(Completion.new(arg0))
      }

      __var1 = ::Box.box(HideSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "hide", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_hide(&block : HideSignal)
      on_hide(after: true, &block)
    end

    alias MoveCursorSignal = Completion, Gtk::ScrollStep, Int32 -> Nil

    def on_move_cursor(*, after = false, &block : MoveCursorSignal)
      __var0 = ->(arg0 : LibGtkSource::Completion*, arg1 : LibGtk::ScrollStep, arg2 : Int32, box : Void*) {
        ::Box(MoveCursorSignal).unbox(box).call(Completion.new(arg0), Gtk::ScrollStep.new(arg1), arg2)
      }

      __var1 = ::Box.box(MoveCursorSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "move-cursor", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_move_cursor(&block : MoveCursorSignal)
      on_move_cursor(after: true, &block)
    end

    alias MovePageSignal = Completion, Gtk::ScrollStep, Int32 -> Nil

    def on_move_page(*, after = false, &block : MovePageSignal)
      __var0 = ->(arg0 : LibGtkSource::Completion*, arg1 : LibGtk::ScrollStep, arg2 : Int32, box : Void*) {
        ::Box(MovePageSignal).unbox(box).call(Completion.new(arg0), Gtk::ScrollStep.new(arg1), arg2)
      }

      __var1 = ::Box.box(MovePageSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "move-page", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_move_page(&block : MovePageSignal)
      on_move_page(after: true, &block)
    end

    alias PopulateContextSignal = Completion, GtkSource::CompletionContext -> Nil

    def on_populate_context(*, after = false, &block : PopulateContextSignal)
      __var0 = ->(arg0 : LibGtkSource::Completion*, arg1 : LibGtkSource::CompletionContext*, box : Void*) {
        ::Box(PopulateContextSignal).unbox(box).call(Completion.new(arg0), arg1.null? ? GObject.raise_unexpected_null("context in populate_context") : GtkSource::CompletionContext.new(arg1))
      }

      __var1 = ::Box.box(PopulateContextSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "populate-context", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_populate_context(&block : PopulateContextSignal)
      on_populate_context(after: true, &block)
    end

    alias ShowSignal = Completion -> Nil

    def on_show(*, after = false, &block : ShowSignal)
      __var0 = ->(arg0 : LibGtkSource::Completion*, box : Void*) {
        ::Box(ShowSignal).unbox(box).call(Completion.new(arg0))
      }

      __var1 = ::Box.box(ShowSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "show", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_show(&block : ShowSignal)
      on_show(after: true, &block)
    end
  end

  @[Flags]
  enum CompletionActivation : UInt32
    NONE           = 0
    INTERACTIVE    = 1
    USER_REQUESTED = 2
  end

  class CompletionClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(352u64, 0u8).as(LibGtkSource::CompletionClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::CompletionClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::CompletionClass*)
    end

    def to_unsafe_completionclass
      @pointer.not_nil!.as(LibGtkSource::CompletionClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGtkSource::CompletionClass*).value.parent_class)
    end

    def proposal_activated
      to_unsafe.as(LibGtkSource::CompletionClass*).value.proposal_activated
    end

    def show
      to_unsafe.as(LibGtkSource::CompletionClass*).value.show
    end

    def hide
      to_unsafe.as(LibGtkSource::CompletionClass*).value.hide
    end

    def populate_context
      to_unsafe.as(LibGtkSource::CompletionClass*).value.populate_context
    end

    def move_cursor
      to_unsafe.as(LibGtkSource::CompletionClass*).value.move_cursor
    end

    def move_page
      to_unsafe.as(LibGtkSource::CompletionClass*).value.move_page
    end

    def activate_proposal
      to_unsafe.as(LibGtkSource::CompletionClass*).value.activate_proposal
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::CompletionClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class CompletionContext < GObject::InitiallyUnowned
    @pointer : Void*

    def initialize(pointer : LibGtkSource::CompletionContext*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceCompletionContext")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_completion_context_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::CompletionContext*)
    end

    def to_unsafe_completioncontext
      @pointer.not_nil!.as(LibGtkSource::CompletionContext*)
    end

    def initialize(*, activation : GtkSource::CompletionActivation? = nil, completion : GtkSource::Completion? = nil, iter : Gtk::TextIter? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless activation.nil?
        __var0 << "activation".to_unsafe
        __var1 << activation.to_gvalue.to_unsafe.value
      end

      unless completion.nil?
        __var0 << "completion".to_unsafe
        __var1 << completion.to_gvalue.to_unsafe.value
      end

      unless iter.nil?
        __var0 << "iter".to_unsafe
        __var1 << iter.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_completion_context_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def add_proposals(provider : GtkSource::CompletionProvider, proposals : Void*?, finished : ::Bool)
      LibGtkSource.completion_context_add_proposals(@pointer.as(LibGtkSource::CompletionContext*), provider.to_unsafe_completionprovider, proposals ? proposals : Pointer(Void*).null, LibC::Int.new(finished ? 1 : 0))
      nil
    end

    def activation
      __var0 = LibGtkSource.completion_context_get_activation(@pointer.as(LibGtkSource::CompletionContext*))
      GtkSource::CompletionActivation.new(__var0)
    end

    def iter(iter : Gtk::TextIter)
      __var0 = LibGtkSource.completion_context_get_iter(@pointer.as(LibGtkSource::CompletionContext*), iter)
      (__var0 == 1)
    end

    def completion : GtkSource::Completion
      __var0 = GObject::Value.new(type: GObject::Type::OBJECT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "completion", __var0)
      GtkSource::Completion.cast(__var0.object)
    end

    alias CancelledSignal = CompletionContext -> Nil

    def on_cancelled(*, after = false, &block : CancelledSignal)
      __var0 = ->(arg0 : LibGtkSource::CompletionContext*, box : Void*) {
        ::Box(CancelledSignal).unbox(box).call(CompletionContext.new(arg0))
      }

      __var1 = ::Box.box(CancelledSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "cancelled", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_cancelled(&block : CancelledSignal)
      on_cancelled(after: true, &block)
    end
  end

  class CompletionContextClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(224u64, 0u8).as(LibGtkSource::CompletionContextClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::CompletionContextClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::CompletionContextClass*)
    end

    def to_unsafe_completioncontextclass
      @pointer.not_nil!.as(LibGtkSource::CompletionContextClass*)
    end

    def parent_class
      GObject::InitiallyUnownedClass.new(to_unsafe.as(LibGtkSource::CompletionContextClass*).value.parent_class)
    end

    def cancelled
      to_unsafe.as(LibGtkSource::CompletionContextClass*).value.cancelled
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::CompletionContextClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class CompletionContextPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::CompletionContextPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::CompletionContextPrivate*)
    end

    def to_unsafe_completioncontextprivate
      @pointer.not_nil!.as(LibGtkSource::CompletionContextPrivate*)
    end
  end

  enum CompletionError : UInt32
    ALREADY_BOUND = 0
    NOT_BOUND     = 1
  end

  # Function quark

  class CompletionInfo < Gtk::Window
    include Atk::ImplementorIface
    include Gtk::Buildable

    @pointer : Void*

    def initialize(pointer : LibGtkSource::CompletionInfo*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceCompletionInfo")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_completion_info_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::CompletionInfo*)
    end

    def to_unsafe_completioninfo
      @pointer.not_nil!.as(LibGtkSource::CompletionInfo*)
    end

    def initialize(*, accept_focus : ::Bool? = nil, app_paintable : ::Bool? = nil, application : Gtk::Application? = nil, attached_to : Gtk::Widget? = nil, border_width : UInt32? = nil, can_default : ::Bool? = nil, can_focus : ::Bool? = nil, child : Gtk::Widget? = nil, decorated : ::Bool? = nil, default_height : Int32? = nil, default_width : Int32? = nil, deletable : ::Bool? = nil, destroy_with_parent : ::Bool? = nil, double_buffered : ::Bool? = nil, events : Gdk::EventMask? = nil, expand : ::Bool? = nil, focus_on_click : ::Bool? = nil, focus_on_map : ::Bool? = nil, focus_visible : ::Bool? = nil, gravity : Gdk::Gravity? = nil, halign : Gtk::Align? = nil, has_default : ::Bool? = nil, has_focus : ::Bool? = nil, has_resize_grip : ::Bool? = nil, has_tooltip : ::Bool? = nil, height_request : Int32? = nil, hexpand : ::Bool? = nil, hexpand_set : ::Bool? = nil, hide_titlebar_when_maximized : ::Bool? = nil, icon : GdkPixbuf::Pixbuf? = nil, icon_name : ::String? = nil, is_focus : ::Bool? = nil, margin : Int32? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_left : Int32? = nil, margin_right : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, mnemonics_visible : ::Bool? = nil, modal : ::Bool? = nil, name : ::String? = nil, no_show_all : ::Bool? = nil, opacity : Float64? = nil, parent : Gtk::Container? = nil, receives_default : ::Bool? = nil, resizable : ::Bool? = nil, resize_mode : Gtk::ResizeMode? = nil, role : ::String? = nil, screen : Gdk::Screen? = nil, sensitive : ::Bool? = nil, skip_pager_hint : ::Bool? = nil, skip_taskbar_hint : ::Bool? = nil, startup_id : ::String? = nil, style : Gtk::Style? = nil, title : ::String? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transient_for : Gtk::Window? = nil, type : Gtk::WindowType? = nil, type_hint : Gdk::WindowTypeHint? = nil, urgency_hint : ::Bool? = nil, valign : Gtk::Align? = nil, vexpand : ::Bool? = nil, vexpand_set : ::Bool? = nil, visible : ::Bool? = nil, width_request : Int32? = nil, window_position : Gtk::WindowPosition? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless accept_focus.nil?
        __var0 << "accept-focus".to_unsafe
        __var1 << accept_focus.to_gvalue.to_unsafe.value
      end

      unless app_paintable.nil?
        __var0 << "app-paintable".to_unsafe
        __var1 << app_paintable.to_gvalue.to_unsafe.value
      end

      unless application.nil?
        __var0 << "application".to_unsafe
        __var1 << application.to_gvalue.to_unsafe.value
      end

      unless attached_to.nil?
        __var0 << "attached-to".to_unsafe
        __var1 << attached_to.to_gvalue.to_unsafe.value
      end

      unless border_width.nil?
        __var0 << "border-width".to_unsafe
        __var1 << border_width.to_gvalue.to_unsafe.value
      end

      unless can_default.nil?
        __var0 << "can-default".to_unsafe
        __var1 << can_default.to_gvalue.to_unsafe.value
      end

      unless can_focus.nil?
        __var0 << "can-focus".to_unsafe
        __var1 << can_focus.to_gvalue.to_unsafe.value
      end

      unless child.nil?
        __var0 << "child".to_unsafe
        __var1 << child.to_gvalue.to_unsafe.value
      end

      unless decorated.nil?
        __var0 << "decorated".to_unsafe
        __var1 << decorated.to_gvalue.to_unsafe.value
      end

      unless default_height.nil?
        __var0 << "default-height".to_unsafe
        __var1 << default_height.to_gvalue.to_unsafe.value
      end

      unless default_width.nil?
        __var0 << "default-width".to_unsafe
        __var1 << default_width.to_gvalue.to_unsafe.value
      end

      unless deletable.nil?
        __var0 << "deletable".to_unsafe
        __var1 << deletable.to_gvalue.to_unsafe.value
      end

      unless destroy_with_parent.nil?
        __var0 << "destroy-with-parent".to_unsafe
        __var1 << destroy_with_parent.to_gvalue.to_unsafe.value
      end

      unless double_buffered.nil?
        __var0 << "double-buffered".to_unsafe
        __var1 << double_buffered.to_gvalue.to_unsafe.value
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

      unless focus_on_map.nil?
        __var0 << "focus-on-map".to_unsafe
        __var1 << focus_on_map.to_gvalue.to_unsafe.value
      end

      unless focus_visible.nil?
        __var0 << "focus-visible".to_unsafe
        __var1 << focus_visible.to_gvalue.to_unsafe.value
      end

      unless gravity.nil?
        __var0 << "gravity".to_unsafe
        __var1 << gravity.to_gvalue.to_unsafe.value
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

      unless has_resize_grip.nil?
        __var0 << "has-resize-grip".to_unsafe
        __var1 << has_resize_grip.to_gvalue.to_unsafe.value
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

      unless hide_titlebar_when_maximized.nil?
        __var0 << "hide-titlebar-when-maximized".to_unsafe
        __var1 << hide_titlebar_when_maximized.to_gvalue.to_unsafe.value
      end

      unless icon.nil?
        __var0 << "icon".to_unsafe
        __var1 << icon.to_gvalue.to_unsafe.value
      end

      unless icon_name.nil?
        __var0 << "icon-name".to_unsafe
        __var1 << icon_name.to_gvalue.to_unsafe.value
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

      unless mnemonics_visible.nil?
        __var0 << "mnemonics-visible".to_unsafe
        __var1 << mnemonics_visible.to_gvalue.to_unsafe.value
      end

      unless modal.nil?
        __var0 << "modal".to_unsafe
        __var1 << modal.to_gvalue.to_unsafe.value
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

      unless receives_default.nil?
        __var0 << "receives-default".to_unsafe
        __var1 << receives_default.to_gvalue.to_unsafe.value
      end

      unless resizable.nil?
        __var0 << "resizable".to_unsafe
        __var1 << resizable.to_gvalue.to_unsafe.value
      end

      unless resize_mode.nil?
        __var0 << "resize-mode".to_unsafe
        __var1 << resize_mode.to_gvalue.to_unsafe.value
      end

      unless role.nil?
        __var0 << "role".to_unsafe
        __var1 << role.to_gvalue.to_unsafe.value
      end

      unless screen.nil?
        __var0 << "screen".to_unsafe
        __var1 << screen.to_gvalue.to_unsafe.value
      end

      unless sensitive.nil?
        __var0 << "sensitive".to_unsafe
        __var1 << sensitive.to_gvalue.to_unsafe.value
      end

      unless skip_pager_hint.nil?
        __var0 << "skip-pager-hint".to_unsafe
        __var1 << skip_pager_hint.to_gvalue.to_unsafe.value
      end

      unless skip_taskbar_hint.nil?
        __var0 << "skip-taskbar-hint".to_unsafe
        __var1 << skip_taskbar_hint.to_gvalue.to_unsafe.value
      end

      unless startup_id.nil?
        __var0 << "startup-id".to_unsafe
        __var1 << startup_id.to_gvalue.to_unsafe.value
      end

      unless style.nil?
        __var0 << "style".to_unsafe
        __var1 << style.to_gvalue.to_unsafe.value
      end

      unless title.nil?
        __var0 << "title".to_unsafe
        __var1 << title.to_gvalue.to_unsafe.value
      end

      unless tooltip_markup.nil?
        __var0 << "tooltip-markup".to_unsafe
        __var1 << tooltip_markup.to_gvalue.to_unsafe.value
      end

      unless tooltip_text.nil?
        __var0 << "tooltip-text".to_unsafe
        __var1 << tooltip_text.to_gvalue.to_unsafe.value
      end

      unless transient_for.nil?
        __var0 << "transient-for".to_unsafe
        __var1 << transient_for.to_gvalue.to_unsafe.value
      end

      unless type.nil?
        __var0 << "type".to_unsafe
        __var1 << type.to_gvalue.to_unsafe.value
      end

      unless type_hint.nil?
        __var0 << "type-hint".to_unsafe
        __var1 << type_hint.to_gvalue.to_unsafe.value
      end

      unless urgency_hint.nil?
        __var0 << "urgency-hint".to_unsafe
        __var1 << urgency_hint.to_gvalue.to_unsafe.value
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

      unless width_request.nil?
        __var0 << "width-request".to_unsafe
        __var1 << width_request.to_gvalue.to_unsafe.value
      end

      unless window_position.nil?
        __var0 << "window-position".to_unsafe
        __var1 << window_position.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_completion_info_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new : self
      __var0 = LibGtkSource.completion_info_new
      GObject.raise_unexpected_null("gtk_source_completion_info_new") if __var0.null?
      cast(GtkSource::CompletionInfo.new(__var0))
    end

    def move_to_iter(view : Gtk::TextView, iter : Gtk::TextIter?)
      LibGtkSource.completion_info_move_to_iter(@pointer.as(LibGtkSource::CompletionInfo*), view.to_unsafe_textview, iter ? iter.to_unsafe.as(LibGtk::TextIter*) : Pointer(LibGtk::TextIter).null)
      nil
    end
  end

  class CompletionInfoClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(1152u64, 0u8).as(LibGtkSource::CompletionInfoClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::CompletionInfoClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::CompletionInfoClass*)
    end

    def to_unsafe_completioninfoclass
      @pointer.not_nil!.as(LibGtkSource::CompletionInfoClass*)
    end

    def parent_class
      Gtk::WindowClass.new(to_unsafe.as(LibGtkSource::CompletionInfoClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::CompletionInfoClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class CompletionInfoPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::CompletionInfoPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::CompletionInfoPrivate*)
    end

    def to_unsafe_completioninfoprivate
      @pointer.not_nil!.as(LibGtkSource::CompletionInfoPrivate*)
    end
  end

  module CompletionProposal
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include CompletionProposal
      @pointer : Void*

      def initialize(pointer : LibGtkSource::CompletionProposal*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a GtkSourceCompletionProposal")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_completion_proposal_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibGtkSource::CompletionProposal*)
      end

      def to_unsafe_completionproposal
        @pointer.not_nil!.as(LibGtkSource::CompletionProposal*)
      end
    end

    def to_unsafe_completionproposal
      @pointer.not_nil!.as(LibGtkSource::CompletionProposal*)
    end

    def changed
      LibGtkSource.completion_proposal_changed(@pointer.as(LibGtkSource::CompletionProposal*))
      nil
    end

    def equal(other : GtkSource::CompletionProposal)
      __var0 = LibGtkSource.completion_proposal_equal(@pointer.as(LibGtkSource::CompletionProposal*), other.to_unsafe_completionproposal)
      (__var0 == 1)
    end

    def gicon
      __var0 = LibGtkSource.completion_proposal_get_gicon(@pointer.as(LibGtkSource::CompletionProposal*))
      __var1 = Gio::Icon::Wrapper.new(__var0) if __var0
      __var1
    end

    def icon
      __var0 = LibGtkSource.completion_proposal_get_icon(@pointer.as(LibGtkSource::CompletionProposal*))
      __var1 = GdkPixbuf::Pixbuf.new(__var0) if __var0
      __var1
    end

    def icon_name
      __var0 = LibGtkSource.completion_proposal_get_icon_name(@pointer.as(LibGtkSource::CompletionProposal*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def info
      __var0 = LibGtkSource.completion_proposal_get_info(@pointer.as(LibGtkSource::CompletionProposal*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def label
      __var0 = LibGtkSource.completion_proposal_get_label(@pointer.as(LibGtkSource::CompletionProposal*))
      GObject.raise_unexpected_null("gtk_source_completion_proposal_get_label") if __var0.null?
      ::String.new(__var0)
    end

    def markup
      __var0 = LibGtkSource.completion_proposal_get_markup(@pointer.as(LibGtkSource::CompletionProposal*))
      GObject.raise_unexpected_null("gtk_source_completion_proposal_get_markup") if __var0.null?
      ::String.new(__var0)
    end

    def text
      __var0 = LibGtkSource.completion_proposal_get_text(@pointer.as(LibGtkSource::CompletionProposal*))
      GObject.raise_unexpected_null("gtk_source_completion_proposal_get_text") if __var0.null?
      ::String.new(__var0)
    end

    def hash
      __var0 = LibGtkSource.completion_proposal_hash(@pointer.as(LibGtkSource::CompletionProposal*))
      __var0
    end

    alias ChangedSignal = CompletionProposal -> Nil

    def on_changed(*, after = false, &block : ChangedSignal)
      __var0 = ->(arg0 : LibGtkSource::CompletionProposal*, box : Void*) {
        ::Box(ChangedSignal).unbox(box).call(CompletionProposal::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(ChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_changed(&block : ChangedSignal)
      on_changed(after: true, &block)
    end
  end

  class CompletionItemClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(216u64, 0u8).as(LibGtkSource::CompletionItemClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::CompletionItemClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::CompletionItemClass*)
    end

    def to_unsafe_completionitemclass
      @pointer.not_nil!.as(LibGtkSource::CompletionItemClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGtkSource::CompletionItemClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::CompletionItemClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class CompletionItemPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::CompletionItemPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::CompletionItemPrivate*)
    end

    def to_unsafe_completionitemprivate
      @pointer.not_nil!.as(LibGtkSource::CompletionItemPrivate*)
    end
  end

  class CompletionPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::CompletionPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::CompletionPrivate*)
    end

    def to_unsafe_completionprivate
      @pointer.not_nil!.as(LibGtkSource::CompletionPrivate*)
    end
  end

  class CompletionItem < GObject::Object
    include GtkSource::CompletionProposal

    @pointer : Void*

    def initialize(pointer : LibGtkSource::CompletionItem*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceCompletionItem")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_completion_item_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::CompletionItem*)
    end

    def to_unsafe_completionitem
      @pointer.not_nil!.as(LibGtkSource::CompletionItem*)
    end

    def initialize(*, gicon : Gio::Icon? = nil, icon : GdkPixbuf::Pixbuf? = nil, icon_name : ::String? = nil, info : ::String? = nil, label : ::String? = nil, markup : ::String? = nil, text : ::String? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless gicon.nil?
        __var0 << "gicon".to_unsafe
        __var1 << gicon.to_gvalue.to_unsafe.value
      end

      unless icon.nil?
        __var0 << "icon".to_unsafe
        __var1 << icon.to_gvalue.to_unsafe.value
      end

      unless icon_name.nil?
        __var0 << "icon-name".to_unsafe
        __var1 << icon_name.to_gvalue.to_unsafe.value
      end

      unless info.nil?
        __var0 << "info".to_unsafe
        __var1 << info.to_gvalue.to_unsafe.value
      end

      unless label.nil?
        __var0 << "label".to_unsafe
        __var1 << label.to_gvalue.to_unsafe.value
      end

      unless markup.nil?
        __var0 << "markup".to_unsafe
        __var1 << markup.to_gvalue.to_unsafe.value
      end

      unless text.nil?
        __var0 << "text".to_unsafe
        __var1 << text.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_completion_item_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new : self
      __var0 = LibGtkSource.completion_item_new
      GObject.raise_unexpected_null("gtk_source_completion_item_new") if __var0.null?
      cast(GtkSource::CompletionItem.new(__var0))
    end

    def gicon=(gicon : Gio::Icon?)
      LibGtkSource.completion_item_set_gicon(@pointer.as(LibGtkSource::CompletionItem*), gicon ? gicon.to_unsafe_icon : Pointer(LibGio::Icon).null)
      nil
    end

    def icon=(icon : GdkPixbuf::Pixbuf?)
      LibGtkSource.completion_item_set_icon(@pointer.as(LibGtkSource::CompletionItem*), icon ? icon.to_unsafe_pixbuf : Pointer(LibGdkPixbuf::Pixbuf).null)
      nil
    end

    def icon_name=(icon_name : ::String?)
      LibGtkSource.completion_item_set_icon_name(@pointer.as(LibGtkSource::CompletionItem*), icon_name ? icon_name.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def info=(info : ::String?)
      LibGtkSource.completion_item_set_info(@pointer.as(LibGtkSource::CompletionItem*), info ? info.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def label=(label : ::String?)
      LibGtkSource.completion_item_set_label(@pointer.as(LibGtkSource::CompletionItem*), label ? label.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def markup=(markup : ::String?)
      LibGtkSource.completion_item_set_markup(@pointer.as(LibGtkSource::CompletionItem*), markup ? markup.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def text=(text : ::String?)
      LibGtkSource.completion_item_set_text(@pointer.as(LibGtkSource::CompletionItem*), text ? text.to_unsafe : Pointer(UInt8).null)
      nil
    end
  end

  class CompletionProposalIface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(96u64, 0u8).as(LibGtkSource::CompletionProposalIface*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::CompletionProposalIface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::CompletionProposalIface*)
    end

    def to_unsafe_completionproposaliface
      @pointer.not_nil!.as(LibGtkSource::CompletionProposalIface*)
    end

    def parent
      GObject::TypeInterface.new(to_unsafe.as(LibGtkSource::CompletionProposalIface*).value.parent)
    end

    def get_label
      to_unsafe.as(LibGtkSource::CompletionProposalIface*).value.get_label
    end

    def get_markup
      to_unsafe.as(LibGtkSource::CompletionProposalIface*).value.get_markup
    end

    def get_text
      to_unsafe.as(LibGtkSource::CompletionProposalIface*).value.get_text
    end

    def get_icon
      to_unsafe.as(LibGtkSource::CompletionProposalIface*).value.get_icon
    end

    def get_icon_name
      to_unsafe.as(LibGtkSource::CompletionProposalIface*).value.get_icon_name
    end

    def get_gicon
      to_unsafe.as(LibGtkSource::CompletionProposalIface*).value.get_gicon
    end

    def get_info
      to_unsafe.as(LibGtkSource::CompletionProposalIface*).value.get_info
    end

    def hash
      to_unsafe.as(LibGtkSource::CompletionProposalIface*).value.hash
    end

    def equal
      to_unsafe.as(LibGtkSource::CompletionProposalIface*).value.equal
    end

    def changed
      to_unsafe.as(LibGtkSource::CompletionProposalIface*).value.changed
    end
  end

  module CompletionProvider
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include CompletionProvider
      @pointer : Void*

      def initialize(pointer : LibGtkSource::CompletionProvider*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a GtkSourceCompletionProvider")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_completion_provider_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibGtkSource::CompletionProvider*)
      end

      def to_unsafe_completionprovider
        @pointer.not_nil!.as(LibGtkSource::CompletionProvider*)
      end
    end

    def to_unsafe_completionprovider
      @pointer.not_nil!.as(LibGtkSource::CompletionProvider*)
    end

    def activate_proposal(proposal : GtkSource::CompletionProposal, iter : Gtk::TextIter)
      __var0 = LibGtkSource.completion_provider_activate_proposal(@pointer.as(LibGtkSource::CompletionProvider*), proposal.to_unsafe_completionproposal, iter.to_unsafe.as(LibGtk::TextIter*))
      (__var0 == 1)
    end

    def activation
      __var0 = LibGtkSource.completion_provider_get_activation(@pointer.as(LibGtkSource::CompletionProvider*))
      GtkSource::CompletionActivation.new(__var0)
    end

    def gicon
      __var0 = LibGtkSource.completion_provider_get_gicon(@pointer.as(LibGtkSource::CompletionProvider*))
      __var1 = Gio::Icon::Wrapper.new(__var0) if __var0
      __var1
    end

    def icon
      __var0 = LibGtkSource.completion_provider_get_icon(@pointer.as(LibGtkSource::CompletionProvider*))
      __var1 = GdkPixbuf::Pixbuf.new(__var0) if __var0
      __var1
    end

    def icon_name
      __var0 = LibGtkSource.completion_provider_get_icon_name(@pointer.as(LibGtkSource::CompletionProvider*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def info_widget(proposal : GtkSource::CompletionProposal)
      __var0 = LibGtkSource.completion_provider_get_info_widget(@pointer.as(LibGtkSource::CompletionProvider*), proposal.to_unsafe_completionproposal)
      __var1 = Gtk::Widget.new(__var0) if __var0
      __var1
    end

    def interactive_delay
      __var0 = LibGtkSource.completion_provider_get_interactive_delay(@pointer.as(LibGtkSource::CompletionProvider*))
      __var0
    end

    def name
      __var0 = LibGtkSource.completion_provider_get_name(@pointer.as(LibGtkSource::CompletionProvider*))
      GObject.raise_unexpected_null("gtk_source_completion_provider_get_name") if __var0.null?
      ::String.new(__var0)
    end

    def priority
      __var0 = LibGtkSource.completion_provider_get_priority(@pointer.as(LibGtkSource::CompletionProvider*))
      __var0
    end

    def start_iter(context : GtkSource::CompletionContext, proposal : GtkSource::CompletionProposal, iter : Gtk::TextIter)
      __var0 = LibGtkSource.completion_provider_get_start_iter(@pointer.as(LibGtkSource::CompletionProvider*), context.to_unsafe_completioncontext, proposal.to_unsafe_completionproposal, iter)
      (__var0 == 1)
    end

    def match(context : GtkSource::CompletionContext)
      __var0 = LibGtkSource.completion_provider_match(@pointer.as(LibGtkSource::CompletionProvider*), context.to_unsafe_completioncontext)
      (__var0 == 1)
    end

    def populate(context : GtkSource::CompletionContext)
      LibGtkSource.completion_provider_populate(@pointer.as(LibGtkSource::CompletionProvider*), context.to_unsafe_completioncontext)
      nil
    end

    def update_info(proposal : GtkSource::CompletionProposal, info : GtkSource::CompletionInfo)
      LibGtkSource.completion_provider_update_info(@pointer.as(LibGtkSource::CompletionProvider*), proposal.to_unsafe_completionproposal, info.to_unsafe_completioninfo)
      nil
    end
  end

  class CompletionProviderIface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(120u64, 0u8).as(LibGtkSource::CompletionProviderIface*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::CompletionProviderIface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::CompletionProviderIface*)
    end

    def to_unsafe_completionprovideriface
      @pointer.not_nil!.as(LibGtkSource::CompletionProviderIface*)
    end

    def g_iface
      GObject::TypeInterface.new(to_unsafe.as(LibGtkSource::CompletionProviderIface*).value.g_iface)
    end

    def get_name
      to_unsafe.as(LibGtkSource::CompletionProviderIface*).value.get_name
    end

    def get_icon
      to_unsafe.as(LibGtkSource::CompletionProviderIface*).value.get_icon
    end

    def get_icon_name
      to_unsafe.as(LibGtkSource::CompletionProviderIface*).value.get_icon_name
    end

    def get_gicon
      to_unsafe.as(LibGtkSource::CompletionProviderIface*).value.get_gicon
    end

    def populate
      to_unsafe.as(LibGtkSource::CompletionProviderIface*).value.populate
    end

    def match
      to_unsafe.as(LibGtkSource::CompletionProviderIface*).value.match
    end

    def get_activation
      to_unsafe.as(LibGtkSource::CompletionProviderIface*).value.get_activation
    end

    def get_info_widget
      to_unsafe.as(LibGtkSource::CompletionProviderIface*).value.get_info_widget
    end

    def update_info
      to_unsafe.as(LibGtkSource::CompletionProviderIface*).value.update_info
    end

    def get_start_iter
      to_unsafe.as(LibGtkSource::CompletionProviderIface*).value.get_start_iter
    end

    def activate_proposal
      to_unsafe.as(LibGtkSource::CompletionProviderIface*).value.activate_proposal
    end

    def get_interactive_delay
      to_unsafe.as(LibGtkSource::CompletionProviderIface*).value.get_interactive_delay
    end

    def get_priority
      to_unsafe.as(LibGtkSource::CompletionProviderIface*).value.get_priority
    end
  end

  class CompletionWords < GObject::Object
    include GtkSource::CompletionProvider

    @pointer : Void*

    def initialize(pointer : LibGtkSource::CompletionWords*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceCompletionWords")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_completion_words_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::CompletionWords*)
    end

    def to_unsafe_completionwords
      @pointer.not_nil!.as(LibGtkSource::CompletionWords*)
    end

    def initialize(*, activation : GtkSource::CompletionActivation? = nil, icon : GdkPixbuf::Pixbuf? = nil, interactive_delay : Int32? = nil, minimum_word_size : UInt32? = nil, name : ::String? = nil, priority : Int32? = nil, proposals_batch_size : UInt32? = nil, scan_batch_size : UInt32? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless activation.nil?
        __var0 << "activation".to_unsafe
        __var1 << activation.to_gvalue.to_unsafe.value
      end

      unless icon.nil?
        __var0 << "icon".to_unsafe
        __var1 << icon.to_gvalue.to_unsafe.value
      end

      unless interactive_delay.nil?
        __var0 << "interactive-delay".to_unsafe
        __var1 << interactive_delay.to_gvalue.to_unsafe.value
      end

      unless minimum_word_size.nil?
        __var0 << "minimum-word-size".to_unsafe
        __var1 << minimum_word_size.to_gvalue.to_unsafe.value
      end

      unless name.nil?
        __var0 << "name".to_unsafe
        __var1 << name.to_gvalue.to_unsafe.value
      end

      unless priority.nil?
        __var0 << "priority".to_unsafe
        __var1 << priority.to_gvalue.to_unsafe.value
      end

      unless proposals_batch_size.nil?
        __var0 << "proposals-batch-size".to_unsafe
        __var1 << proposals_batch_size.to_gvalue.to_unsafe.value
      end

      unless scan_batch_size.nil?
        __var0 << "scan-batch-size".to_unsafe
        __var1 << scan_batch_size.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_completion_words_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new(name : ::String?, icon : GdkPixbuf::Pixbuf?) : self
      __var0 = LibGtkSource.completion_words_new(name ? name.to_unsafe : Pointer(UInt8).null, icon ? icon.to_unsafe_pixbuf : Pointer(LibGdkPixbuf::Pixbuf).null)
      GObject.raise_unexpected_null("gtk_source_completion_words_new") if __var0.null?
      cast(GtkSource::CompletionWords.new(__var0))
    end

    def register(buffer : Gtk::TextBuffer)
      LibGtkSource.completion_words_register(@pointer.as(LibGtkSource::CompletionWords*), buffer.to_unsafe_textbuffer)
      nil
    end

    def unregister(buffer : Gtk::TextBuffer)
      LibGtkSource.completion_words_unregister(@pointer.as(LibGtkSource::CompletionWords*), buffer.to_unsafe_textbuffer)
      nil
    end

    def activation : GtkSource::CompletionActivation
      __var0 = GObject::Value.new(type: GObject::Type::ENUM)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "activation", __var0)
      GtkSource::CompletionActivation.new(UInt32.new(__var0.flags))
    end

    def activation=(value : GtkSource::CompletionActivation)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "activation", value.to_gvalue)
    end

    def icon : GdkPixbuf::Pixbuf
      __var0 = GObject::Value.new(type: GObject::Type::OBJECT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "icon", __var0)
      GdkPixbuf::Pixbuf.cast(__var0.object)
    end

    def icon=(value : GdkPixbuf::Pixbuf)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "icon", value.to_gvalue)
    end

    def interactive_delay : Int32
      __var0 = GObject::Value.new(type: GObject::Type::INT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "interactive-delay", __var0)
      __var0.int
    end

    def interactive_delay=(value : Int32)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "interactive-delay", value.to_gvalue)
    end

    def minimum_word_size : UInt32
      __var0 = GObject::Value.new(type: GObject::Type::UINT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "minimum-word-size", __var0)
      __var0.uint
    end

    def minimum_word_size=(value : UInt32)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "minimum-word-size", value.to_gvalue)
    end

    def name : ::String
      __var0 = GObject::Value.new(type: GObject::Type::UTF8)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "name", __var0)
      __var0.string
    end

    def name=(value : ::String)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "name", value.to_gvalue)
    end

    def priority : Int32
      __var0 = GObject::Value.new(type: GObject::Type::INT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "priority", __var0)
      __var0.int
    end

    def priority=(value : Int32)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "priority", value.to_gvalue)
    end

    def proposals_batch_size : UInt32
      __var0 = GObject::Value.new(type: GObject::Type::UINT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "proposals-batch-size", __var0)
      __var0.uint
    end

    def proposals_batch_size=(value : UInt32)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "proposals-batch-size", value.to_gvalue)
    end

    def scan_batch_size : UInt32
      __var0 = GObject::Value.new(type: GObject::Type::UINT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "scan-batch-size", __var0)
      __var0.uint
    end

    def scan_batch_size=(value : UInt32)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "scan-batch-size", value.to_gvalue)
    end
  end

  class CompletionWordsClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(136u64, 0u8).as(LibGtkSource::CompletionWordsClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::CompletionWordsClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::CompletionWordsClass*)
    end

    def to_unsafe_completionwordsclass
      @pointer.not_nil!.as(LibGtkSource::CompletionWordsClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGtkSource::CompletionWordsClass*).value.parent_class)
    end
  end

  class CompletionWordsPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::CompletionWordsPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::CompletionWordsPrivate*)
    end

    def to_unsafe_completionwordsprivate
      @pointer.not_nil!.as(LibGtkSource::CompletionWordsPrivate*)
    end
  end

  enum CompressionType : UInt32
    NONE = 0
    GZIP = 1
  end

  class Encoding
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::Encoding*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::Encoding*)
    end

    def to_unsafe_encoding
      @pointer.not_nil!.as(LibGtkSource::Encoding*)
    end

    def copy
      __var0 = LibGtkSource.encoding_copy(@pointer.as(LibGtkSource::Encoding*))
      GObject.raise_unexpected_null("gtk_source_encoding_copy") if __var0.null?
      GtkSource::Encoding.new(__var0)
    end

    def free
      LibGtkSource.encoding_free(@pointer.as(LibGtkSource::Encoding*))
      nil
    end

    def charset
      __var0 = LibGtkSource.encoding_get_charset(@pointer.as(LibGtkSource::Encoding*))
      GObject.raise_unexpected_null("gtk_source_encoding_get_charset") if __var0.null?
      ::String.new(__var0)
    end

    def name
      __var0 = LibGtkSource.encoding_get_name(@pointer.as(LibGtkSource::Encoding*))
      GObject.raise_unexpected_null("gtk_source_encoding_get_name") if __var0.null?
      ::String.new(__var0)
    end

    def to_string
      __var0 = LibGtkSource.encoding_to_string(@pointer.as(LibGtkSource::Encoding*))
      GObject.raise_unexpected_null("gtk_source_encoding_to_string") if __var0.null?
      ::String.new(__var0)
    end

    def self.all
      __var0 = LibGtkSource.encoding_get_all
      GObject.raise_unexpected_null("gtk_source_encoding_get_all") if __var0.null?
      GLib::SListIterator(GtkSource::Encoding, LibGtkSource::Encoding*).new(GLib::SList.new(__var0.as(LibGLib::SList*)))
    end

    def self.current
      __var0 = LibGtkSource.encoding_get_current
      GObject.raise_unexpected_null("gtk_source_encoding_get_current") if __var0.null?
      GtkSource::Encoding.new(__var0)
    end

    def self.default_candidates
      __var0 = LibGtkSource.encoding_get_default_candidates
      GObject.raise_unexpected_null("gtk_source_encoding_get_default_candidates") if __var0.null?
      GLib::SListIterator(GtkSource::Encoding, LibGtkSource::Encoding*).new(GLib::SList.new(__var0.as(LibGLib::SList*)))
    end

    def self.from_charset(charset : ::String)
      __var0 = LibGtkSource.encoding_get_from_charset(charset.to_unsafe)
      __var1 = GtkSource::Encoding.new(__var0) if __var0
      __var1
    end

    def self.utf8
      __var0 = LibGtkSource.encoding_get_utf8
      GObject.raise_unexpected_null("gtk_source_encoding_get_utf8") if __var0.null?
      GtkSource::Encoding.new(__var0)
    end
  end

  class File < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGtkSource::File*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceFile")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_file_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::File*)
    end

    def to_unsafe_file
      @pointer.not_nil!.as(LibGtkSource::File*)
    end

    def initialize(*, location : Gio::File? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless location.nil?
        __var0 << "location".to_unsafe
        __var1 << location.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_file_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new : self
      __var0 = LibGtkSource.file_new
      GObject.raise_unexpected_null("gtk_source_file_new") if __var0.null?
      cast(GtkSource::File.new(__var0))
    end

    def check_file_on_disk
      LibGtkSource.file_check_file_on_disk(@pointer.as(LibGtkSource::File*))
      nil
    end

    def compression_type
      __var0 = LibGtkSource.file_get_compression_type(@pointer.as(LibGtkSource::File*))
      GtkSource::CompressionType.new(__var0)
    end

    def encoding
      __var0 = LibGtkSource.file_get_encoding(@pointer.as(LibGtkSource::File*))
      GObject.raise_unexpected_null("gtk_source_file_get_encoding") if __var0.null?
      GtkSource::Encoding.new(__var0)
    end

    def location
      __var0 = LibGtkSource.file_get_location(@pointer.as(LibGtkSource::File*))
      GObject.raise_unexpected_null("gtk_source_file_get_location") if __var0.null?
      Gio::File::Wrapper.new(__var0)
    end

    def newline_type
      __var0 = LibGtkSource.file_get_newline_type(@pointer.as(LibGtkSource::File*))
      GtkSource::NewlineType.new(__var0)
    end

    def deleted?
      __var0 = LibGtkSource.file_is_deleted(@pointer.as(LibGtkSource::File*))
      (__var0 == 1)
    end

    def externally_modified?
      __var0 = LibGtkSource.file_is_externally_modified(@pointer.as(LibGtkSource::File*))
      (__var0 == 1)
    end

    def local?
      __var0 = LibGtkSource.file_is_local(@pointer.as(LibGtkSource::File*))
      (__var0 == 1)
    end

    def readonly?
      __var0 = LibGtkSource.file_is_readonly(@pointer.as(LibGtkSource::File*))
      (__var0 == 1)
    end

    def location=(location : Gio::File?)
      LibGtkSource.file_set_location(@pointer.as(LibGtkSource::File*), location ? location.to_unsafe_file : Pointer(LibGio::File).null)
      nil
    end

    def read_only : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "read-only", __var0)
      __var0.boolean
    end
  end

  class FileClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(216u64, 0u8).as(LibGtkSource::FileClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::FileClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::FileClass*)
    end

    def to_unsafe_fileclass
      @pointer.not_nil!.as(LibGtkSource::FileClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGtkSource::FileClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::FileClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class FileLoader < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGtkSource::FileLoader*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceFileLoader")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_file_loader_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::FileLoader*)
    end

    def to_unsafe_fileloader
      @pointer.not_nil!.as(LibGtkSource::FileLoader*)
    end

    def initialize(*, buffer : GtkSource::Buffer? = nil, file : GtkSource::File? = nil, input_stream : Gio::InputStream? = nil, location : Gio::File? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless buffer.nil?
        __var0 << "buffer".to_unsafe
        __var1 << buffer.to_gvalue.to_unsafe.value
      end

      unless file.nil?
        __var0 << "file".to_unsafe
        __var1 << file.to_gvalue.to_unsafe.value
      end

      unless input_stream.nil?
        __var0 << "input-stream".to_unsafe
        __var1 << input_stream.to_gvalue.to_unsafe.value
      end

      unless location.nil?
        __var0 << "location".to_unsafe
        __var1 << location.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_file_loader_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new(buffer : GtkSource::Buffer, file : GtkSource::File) : self
      __var0 = LibGtkSource.file_loader_new(buffer.to_unsafe_buffer, file.to_unsafe_file)
      GObject.raise_unexpected_null("gtk_source_file_loader_new") if __var0.null?
      cast(GtkSource::FileLoader.new(__var0))
    end

    def self.new_from_stream(buffer : GtkSource::Buffer, file : GtkSource::File, stream : Gio::InputStream) : self
      __var0 = LibGtkSource.file_loader_new_from_stream(buffer.to_unsafe_buffer, file.to_unsafe_file, stream.to_unsafe_inputstream)
      GObject.raise_unexpected_null("gtk_source_file_loader_new_from_stream") if __var0.null?
      cast(GtkSource::FileLoader.new(__var0))
    end

    def buffer
      __var0 = LibGtkSource.file_loader_get_buffer(@pointer.as(LibGtkSource::FileLoader*))
      GObject.raise_unexpected_null("gtk_source_file_loader_get_buffer") if __var0.null?
      GtkSource::Buffer.new(__var0)
    end

    def compression_type
      __var0 = LibGtkSource.file_loader_get_compression_type(@pointer.as(LibGtkSource::FileLoader*))
      GtkSource::CompressionType.new(__var0)
    end

    def encoding
      __var0 = LibGtkSource.file_loader_get_encoding(@pointer.as(LibGtkSource::FileLoader*))
      GObject.raise_unexpected_null("gtk_source_file_loader_get_encoding") if __var0.null?
      GtkSource::Encoding.new(__var0)
    end

    def file
      __var0 = LibGtkSource.file_loader_get_file(@pointer.as(LibGtkSource::FileLoader*))
      GObject.raise_unexpected_null("gtk_source_file_loader_get_file") if __var0.null?
      GtkSource::File.new(__var0)
    end

    def input_stream
      __var0 = LibGtkSource.file_loader_get_input_stream(@pointer.as(LibGtkSource::FileLoader*))
      __var1 = Gio::InputStream.new(__var0) if __var0
      __var1
    end

    def location
      __var0 = LibGtkSource.file_loader_get_location(@pointer.as(LibGtkSource::FileLoader*))
      __var1 = Gio::File::Wrapper.new(__var0) if __var0
      __var1
    end

    def newline_type
      __var0 = LibGtkSource.file_loader_get_newline_type(@pointer.as(LibGtkSource::FileLoader*))
      GtkSource::NewlineType.new(__var0)
    end

    def load_async(io_priority : ::Int, cancellable : Gio::Cancellable?, progress_callback : Gio::FileProgressCallback?, progress_callback_data : Void*?, progress_callback_notify : GLib::DestroyNotify?, callback : Gio::AsyncReadyCallback?, user_data : Void*?)
      LibGtkSource.file_loader_load_async(@pointer.as(LibGtkSource::FileLoader*), Int32.new(io_priority), cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, progress_callback ? progress_callback : nil, progress_callback_data ? progress_callback_data : Pointer(Void).null, progress_callback_notify ? progress_callback_notify : nil, callback ? callback : nil, user_data ? user_data : Pointer(Void).null)
      nil
    end

    def load_finish(result : Gio::AsyncResult)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGtkSource.file_loader_load_finish(@pointer.as(LibGtkSource::FileLoader*), result.to_unsafe_asyncresult, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def candidate_encodings=(candidate_encodings : Void*)
      LibGtkSource.file_loader_set_candidate_encodings(@pointer.as(LibGtkSource::FileLoader*), candidate_encodings)
      nil
    end
  end

  class FileLoaderClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(216u64, 0u8).as(LibGtkSource::FileLoaderClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::FileLoaderClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::FileLoaderClass*)
    end

    def to_unsafe_fileloaderclass
      @pointer.not_nil!.as(LibGtkSource::FileLoaderClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGtkSource::FileLoaderClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::FileLoaderClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  enum FileLoaderError : UInt32
    TOO_BIG                        = 0
    ENCODING_AUTO_DETECTION_FAILED = 1
    CONVERSION_FALLBACK            = 2
  end

  # Function quark

  class FileLoaderPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::FileLoaderPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::FileLoaderPrivate*)
    end

    def to_unsafe_fileloaderprivate
      @pointer.not_nil!.as(LibGtkSource::FileLoaderPrivate*)
    end
  end

  class FilePrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::FilePrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::FilePrivate*)
    end

    def to_unsafe_fileprivate
      @pointer.not_nil!.as(LibGtkSource::FilePrivate*)
    end
  end

  class FileSaver < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGtkSource::FileSaver*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceFileSaver")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_file_saver_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::FileSaver*)
    end

    def to_unsafe_filesaver
      @pointer.not_nil!.as(LibGtkSource::FileSaver*)
    end

    def initialize(*, buffer : GtkSource::Buffer? = nil, compression_type : GtkSource::CompressionType? = nil, encoding : GtkSource::Encoding? = nil, file : GtkSource::File? = nil, flags : GtkSource::FileSaverFlags? = nil, location : Gio::File? = nil, newline_type : GtkSource::NewlineType? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless buffer.nil?
        __var0 << "buffer".to_unsafe
        __var1 << buffer.to_gvalue.to_unsafe.value
      end

      unless compression_type.nil?
        __var0 << "compression-type".to_unsafe
        __var1 << compression_type.to_gvalue.to_unsafe.value
      end

      unless encoding.nil?
        __var0 << "encoding".to_unsafe
        __var1 << encoding.to_gvalue.to_unsafe.value
      end

      unless file.nil?
        __var0 << "file".to_unsafe
        __var1 << file.to_gvalue.to_unsafe.value
      end

      unless flags.nil?
        __var0 << "flags".to_unsafe
        __var1 << flags.to_gvalue.to_unsafe.value
      end

      unless location.nil?
        __var0 << "location".to_unsafe
        __var1 << location.to_gvalue.to_unsafe.value
      end

      unless newline_type.nil?
        __var0 << "newline-type".to_unsafe
        __var1 << newline_type.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_file_saver_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new(buffer : GtkSource::Buffer, file : GtkSource::File) : self
      __var0 = LibGtkSource.file_saver_new(buffer.to_unsafe_buffer, file.to_unsafe_file)
      GObject.raise_unexpected_null("gtk_source_file_saver_new") if __var0.null?
      cast(GtkSource::FileSaver.new(__var0))
    end

    def self.new_with_target(buffer : GtkSource::Buffer, file : GtkSource::File, target_location : Gio::File) : self
      __var0 = LibGtkSource.file_saver_new_with_target(buffer.to_unsafe_buffer, file.to_unsafe_file, target_location.to_unsafe_file)
      GObject.raise_unexpected_null("gtk_source_file_saver_new_with_target") if __var0.null?
      cast(GtkSource::FileSaver.new(__var0))
    end

    def buffer
      __var0 = LibGtkSource.file_saver_get_buffer(@pointer.as(LibGtkSource::FileSaver*))
      GObject.raise_unexpected_null("gtk_source_file_saver_get_buffer") if __var0.null?
      GtkSource::Buffer.new(__var0)
    end

    def compression_type
      __var0 = LibGtkSource.file_saver_get_compression_type(@pointer.as(LibGtkSource::FileSaver*))
      GtkSource::CompressionType.new(__var0)
    end

    def encoding
      __var0 = LibGtkSource.file_saver_get_encoding(@pointer.as(LibGtkSource::FileSaver*))
      GObject.raise_unexpected_null("gtk_source_file_saver_get_encoding") if __var0.null?
      GtkSource::Encoding.new(__var0)
    end

    def file
      __var0 = LibGtkSource.file_saver_get_file(@pointer.as(LibGtkSource::FileSaver*))
      GObject.raise_unexpected_null("gtk_source_file_saver_get_file") if __var0.null?
      GtkSource::File.new(__var0)
    end

    def flags
      __var0 = LibGtkSource.file_saver_get_flags(@pointer.as(LibGtkSource::FileSaver*))
      GtkSource::FileSaverFlags.new(__var0)
    end

    def location
      __var0 = LibGtkSource.file_saver_get_location(@pointer.as(LibGtkSource::FileSaver*))
      GObject.raise_unexpected_null("gtk_source_file_saver_get_location") if __var0.null?
      Gio::File::Wrapper.new(__var0)
    end

    def newline_type
      __var0 = LibGtkSource.file_saver_get_newline_type(@pointer.as(LibGtkSource::FileSaver*))
      GtkSource::NewlineType.new(__var0)
    end

    def save_async(io_priority : ::Int, cancellable : Gio::Cancellable?, progress_callback : Gio::FileProgressCallback?, progress_callback_data : Void*?, progress_callback_notify : GLib::DestroyNotify?, callback : Gio::AsyncReadyCallback?, user_data : Void*?)
      LibGtkSource.file_saver_save_async(@pointer.as(LibGtkSource::FileSaver*), Int32.new(io_priority), cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, progress_callback ? progress_callback : nil, progress_callback_data ? progress_callback_data : Pointer(Void).null, progress_callback_notify ? progress_callback_notify : nil, callback ? callback : nil, user_data ? user_data : Pointer(Void).null)
      nil
    end

    def save_finish(result : Gio::AsyncResult)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGtkSource.file_saver_save_finish(@pointer.as(LibGtkSource::FileSaver*), result.to_unsafe_asyncresult, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def compression_type=(compression_type : GtkSource::CompressionType)
      LibGtkSource.file_saver_set_compression_type(@pointer.as(LibGtkSource::FileSaver*), compression_type)
      nil
    end

    def encoding=(encoding : GtkSource::Encoding?)
      LibGtkSource.file_saver_set_encoding(@pointer.as(LibGtkSource::FileSaver*), encoding ? encoding.to_unsafe.as(LibGtkSource::Encoding*) : Pointer(LibGtkSource::Encoding).null)
      nil
    end

    def flags=(flags : GtkSource::FileSaverFlags)
      LibGtkSource.file_saver_set_flags(@pointer.as(LibGtkSource::FileSaver*), flags)
      nil
    end

    def newline_type=(newline_type : GtkSource::NewlineType)
      LibGtkSource.file_saver_set_newline_type(@pointer.as(LibGtkSource::FileSaver*), newline_type)
      nil
    end
  end

  class FileSaverClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(216u64, 0u8).as(LibGtkSource::FileSaverClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::FileSaverClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::FileSaverClass*)
    end

    def to_unsafe_filesaverclass
      @pointer.not_nil!.as(LibGtkSource::FileSaverClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGtkSource::FileSaverClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::FileSaverClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  enum FileSaverError : UInt32
    INVALID_CHARS       = 0
    EXTERNALLY_MODIFIED = 1
  end
  # Function quark

  @[Flags]
  enum FileSaverFlags : UInt32
    NONE                     = 0
    IGNORE_INVALID_CHARS     = 1
    IGNORE_MODIFICATION_TIME = 2
    CREATE_BACKUP            = 4
  end

  class FileSaverPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::FileSaverPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::FileSaverPrivate*)
    end

    def to_unsafe_filesaverprivate
      @pointer.not_nil!.as(LibGtkSource::FileSaverPrivate*)
    end
  end

  class Gutter < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGtkSource::Gutter*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceGutter")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_gutter_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::Gutter*)
    end

    def to_unsafe_gutter
      @pointer.not_nil!.as(LibGtkSource::Gutter*)
    end

    def initialize(*, view : GtkSource::View? = nil, window_type : Gtk::TextWindowType? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless view.nil?
        __var0 << "view".to_unsafe
        __var1 << view.to_gvalue.to_unsafe.value
      end

      unless window_type.nil?
        __var0 << "window-type".to_unsafe
        __var1 << window_type.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_gutter_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def renderer_at_pos(x : ::Int, y : ::Int)
      __var0 = LibGtkSource.gutter_get_renderer_at_pos(@pointer.as(LibGtkSource::Gutter*), Int32.new(x), Int32.new(y))
      __var1 = GtkSource::GutterRenderer.new(__var0) if __var0
      __var1
    end

    def view
      __var0 = LibGtkSource.gutter_get_view(@pointer.as(LibGtkSource::Gutter*))
      GObject.raise_unexpected_null("gtk_source_gutter_get_view") if __var0.null?
      GtkSource::View.new(__var0)
    end

    def window_type
      __var0 = LibGtkSource.gutter_get_window_type(@pointer.as(LibGtkSource::Gutter*))
      Gtk::TextWindowType.new(__var0)
    end

    def insert(renderer : GtkSource::GutterRenderer, position : ::Int)
      __var0 = LibGtkSource.gutter_insert(@pointer.as(LibGtkSource::Gutter*), renderer.to_unsafe_gutterrenderer, Int32.new(position))
      (__var0 == 1)
    end

    def queue_draw
      LibGtkSource.gutter_queue_draw(@pointer.as(LibGtkSource::Gutter*))
      nil
    end

    def remove(renderer : GtkSource::GutterRenderer)
      LibGtkSource.gutter_remove(@pointer.as(LibGtkSource::Gutter*), renderer.to_unsafe_gutterrenderer)
      nil
    end

    def reorder(renderer : GtkSource::GutterRenderer, position : ::Int)
      LibGtkSource.gutter_reorder(@pointer.as(LibGtkSource::Gutter*), renderer.to_unsafe_gutterrenderer, Int32.new(position))
      nil
    end
  end

  class GutterClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(216u64, 0u8).as(LibGtkSource::GutterClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::GutterClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::GutterClass*)
    end

    def to_unsafe_gutterclass
      @pointer.not_nil!.as(LibGtkSource::GutterClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGtkSource::GutterClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::GutterClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class GutterPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::GutterPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::GutterPrivate*)
    end

    def to_unsafe_gutterprivate
      @pointer.not_nil!.as(LibGtkSource::GutterPrivate*)
    end
  end

  class GutterRenderer < GObject::InitiallyUnowned
    @pointer : Void*

    def initialize(pointer : LibGtkSource::GutterRenderer*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceGutterRenderer")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_gutter_renderer_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::GutterRenderer*)
    end

    def to_unsafe_gutterrenderer
      @pointer.not_nil!.as(LibGtkSource::GutterRenderer*)
    end

    def activate(iter : Gtk::TextIter, area : Gdk::Rectangle, event : Gdk::Event::Union)
      LibGtkSource.gutter_renderer_activate(@pointer.as(LibGtkSource::GutterRenderer*), iter.to_unsafe.as(LibGtk::TextIter*), area.to_unsafe.as(LibGdk::Rectangle*), event.to_unsafe.as(LibGdk::Event*))
      nil
    end

    def begin(cr : Cairo::Context, background_area : Gdk::Rectangle, cell_area : Gdk::Rectangle, start : Gtk::TextIter, _end : Gtk::TextIter)
      LibGtkSource.gutter_renderer_begin(@pointer.as(LibGtkSource::GutterRenderer*), cr.to_unsafe.as(LibCairo::Context*), background_area.to_unsafe.as(LibGdk::Rectangle*), cell_area.to_unsafe.as(LibGdk::Rectangle*), start.to_unsafe.as(LibGtk::TextIter*), _end.to_unsafe.as(LibGtk::TextIter*))
      nil
    end

    def draw(cr : Cairo::Context, background_area : Gdk::Rectangle, cell_area : Gdk::Rectangle, start : Gtk::TextIter, _end : Gtk::TextIter, state : GtkSource::GutterRendererState)
      LibGtkSource.gutter_renderer_draw(@pointer.as(LibGtkSource::GutterRenderer*), cr.to_unsafe.as(LibCairo::Context*), background_area.to_unsafe.as(LibGdk::Rectangle*), cell_area.to_unsafe.as(LibGdk::Rectangle*), start.to_unsafe.as(LibGtk::TextIter*), _end.to_unsafe.as(LibGtk::TextIter*), state)
      nil
    end

    def end
      LibGtkSource.gutter_renderer_end(@pointer.as(LibGtkSource::GutterRenderer*))
      nil
    end

    def alignment
      LibGtkSource.gutter_renderer_get_alignment(@pointer.as(LibGtkSource::GutterRenderer*), out xalign, out yalign)
      {xalign, yalign}
    end

    def alignment_mode
      __var0 = LibGtkSource.gutter_renderer_get_alignment_mode(@pointer.as(LibGtkSource::GutterRenderer*))
      GtkSource::GutterRendererAlignmentMode.new(__var0)
    end

    def background(color : Gdk::RGBA?)
      __var0 = LibGtkSource.gutter_renderer_get_background(@pointer.as(LibGtkSource::GutterRenderer*), color)
      (__var0 == 1)
    end

    def padding
      LibGtkSource.gutter_renderer_get_padding(@pointer.as(LibGtkSource::GutterRenderer*), out xpad, out ypad)
      {xpad, ypad}
    end

    def size
      __var0 = LibGtkSource.gutter_renderer_get_size(@pointer.as(LibGtkSource::GutterRenderer*))
      __var0
    end

    def view
      __var0 = LibGtkSource.gutter_renderer_get_view(@pointer.as(LibGtkSource::GutterRenderer*))
      GObject.raise_unexpected_null("gtk_source_gutter_renderer_get_view") if __var0.null?
      Gtk::TextView.new(__var0)
    end

    def visible
      __var0 = LibGtkSource.gutter_renderer_get_visible(@pointer.as(LibGtkSource::GutterRenderer*))
      (__var0 == 1)
    end

    def window_type
      __var0 = LibGtkSource.gutter_renderer_get_window_type(@pointer.as(LibGtkSource::GutterRenderer*))
      Gtk::TextWindowType.new(__var0)
    end

    def query_activatable(iter : Gtk::TextIter, area : Gdk::Rectangle, event : Gdk::Event::Union)
      __var0 = LibGtkSource.gutter_renderer_query_activatable(@pointer.as(LibGtkSource::GutterRenderer*), iter.to_unsafe.as(LibGtk::TextIter*), area.to_unsafe.as(LibGdk::Rectangle*), event.to_unsafe.as(LibGdk::Event*))
      (__var0 == 1)
    end

    def query_data(start : Gtk::TextIter, _end : Gtk::TextIter, state : GtkSource::GutterRendererState)
      LibGtkSource.gutter_renderer_query_data(@pointer.as(LibGtkSource::GutterRenderer*), start.to_unsafe.as(LibGtk::TextIter*), _end.to_unsafe.as(LibGtk::TextIter*), state)
      nil
    end

    def query_tooltip(iter : Gtk::TextIter, area : Gdk::Rectangle, x : ::Int, y : ::Int, tooltip : Gtk::Tooltip)
      __var0 = LibGtkSource.gutter_renderer_query_tooltip(@pointer.as(LibGtkSource::GutterRenderer*), iter.to_unsafe.as(LibGtk::TextIter*), area.to_unsafe.as(LibGdk::Rectangle*), Int32.new(x), Int32.new(y), tooltip.to_unsafe_tooltip)
      (__var0 == 1)
    end

    def queue_draw
      LibGtkSource.gutter_renderer_queue_draw(@pointer.as(LibGtkSource::GutterRenderer*))
      nil
    end

    def set_alignment(xalign : ::Float, yalign : ::Float)
      LibGtkSource.gutter_renderer_set_alignment(@pointer.as(LibGtkSource::GutterRenderer*), Float32.new(xalign), Float32.new(yalign))
      nil
    end

    def alignment_mode=(mode : GtkSource::GutterRendererAlignmentMode)
      LibGtkSource.gutter_renderer_set_alignment_mode(@pointer.as(LibGtkSource::GutterRenderer*), mode)
      nil
    end

    def background=(color : Gdk::RGBA?)
      LibGtkSource.gutter_renderer_set_background(@pointer.as(LibGtkSource::GutterRenderer*), color ? color.to_unsafe.as(LibGdk::RGBA*) : Pointer(LibGdk::RGBA).null)
      nil
    end

    def set_padding(xpad : ::Int, ypad : ::Int)
      LibGtkSource.gutter_renderer_set_padding(@pointer.as(LibGtkSource::GutterRenderer*), Int32.new(xpad), Int32.new(ypad))
      nil
    end

    def size=(size : ::Int)
      LibGtkSource.gutter_renderer_set_size(@pointer.as(LibGtkSource::GutterRenderer*), Int32.new(size))
      nil
    end

    def visible=(visible : ::Bool)
      LibGtkSource.gutter_renderer_set_visible(@pointer.as(LibGtkSource::GutterRenderer*), LibC::Int.new(visible ? 1 : 0))
      nil
    end

    def background_rgba : Gdk::RGBA
      __var0 = GObject::Value.new(type: GObject::Type::OBJECT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "background-rgba", __var0)
      Gdk::RGBA.cast(__var0.object)
    end

    def background_rgba=(value : Gdk::RGBA)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "background-rgba", value.to_gvalue)
    end

    def background_set : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "background-set", __var0)
      __var0.boolean
    end

    def background_set=(value : ::Bool)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "background-set", value.to_gvalue)
    end

    def xalign : Float32
      __var0 = GObject::Value.new(type: GObject::Type::FLOAT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "xalign", __var0)
      __var0.float
    end

    def xalign=(value : Float32)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "xalign", value.to_gvalue)
    end

    def xpad : Int32
      __var0 = GObject::Value.new(type: GObject::Type::INT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "xpad", __var0)
      __var0.int
    end

    def xpad=(value : Int32)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "xpad", value.to_gvalue)
    end

    def yalign : Float32
      __var0 = GObject::Value.new(type: GObject::Type::FLOAT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "yalign", __var0)
      __var0.float
    end

    def yalign=(value : Float32)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "yalign", value.to_gvalue)
    end

    def ypad : Int32
      __var0 = GObject::Value.new(type: GObject::Type::INT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "ypad", __var0)
      __var0.int
    end

    def ypad=(value : Int32)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "ypad", value.to_gvalue)
    end

    alias ActivateSignal = GutterRenderer, Gtk::TextIter, Gdk::Rectangle, Gdk::Event -> Nil

    def on_activate(*, after = false, &block : ActivateSignal)
      __var0 = ->(arg0 : LibGtkSource::GutterRenderer*, arg1 : LibGtk::TextIter*, arg2 : LibGdk::Rectangle*, arg3 : LibGdk::Event*, box : Void*) {
        ::Box(ActivateSignal).unbox(box).call(GutterRenderer.new(arg0), arg1.null? ? GObject.raise_unexpected_null("iter in activate") : Gtk::TextIter.new(arg1), arg2.null? ? GObject.raise_unexpected_null("area in activate") : Gdk::Rectangle.new(arg2), arg3.null? ? GObject.raise_unexpected_null("event in activate") : Gdk::Event.new(arg3))
      }

      __var1 = ::Box.box(ActivateSignal.new { |arg0, arg1, arg2, arg3|
        block.call(arg0, arg1, arg2, arg3)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "activate", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_activate(&block : ActivateSignal)
      on_activate(after: true, &block)
    end

    alias QueryActivatableSignal = GutterRenderer, Gtk::TextIter, Gdk::Rectangle, Gdk::Event -> ::Bool

    def on_query_activatable(*, after = false, &block : QueryActivatableSignal)
      __var0 = ->(arg0 : LibGtkSource::GutterRenderer*, arg1 : LibGtk::TextIter*, arg2 : LibGdk::Rectangle*, arg3 : LibGdk::Event*, box : Void*) {
        LibC::Int.new(::Box(QueryActivatableSignal).unbox(box).call(GutterRenderer.new(arg0), arg1.null? ? GObject.raise_unexpected_null("iter in query_activatable") : Gtk::TextIter.new(arg1), arg2.null? ? GObject.raise_unexpected_null("area in query_activatable") : Gdk::Rectangle.new(arg2), arg3.null? ? GObject.raise_unexpected_null("event in query_activatable") : Gdk::Event.new(arg3)) ? 1 : 0)
      }

      __var1 = ::Box.box(QueryActivatableSignal.new { |arg0, arg1, arg2, arg3|
        block.call(arg0, arg1, arg2, arg3)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "query-activatable", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_query_activatable(&block : QueryActivatableSignal)
      on_query_activatable(after: true, &block)
    end

    alias QueryDataSignal = GutterRenderer, Gtk::TextIter, Gtk::TextIter, GtkSource::GutterRendererState -> Nil

    def on_query_data(*, after = false, &block : QueryDataSignal)
      __var0 = ->(arg0 : LibGtkSource::GutterRenderer*, arg1 : LibGtk::TextIter*, arg2 : LibGtk::TextIter*, arg3 : LibGtkSource::GutterRendererState, box : Void*) {
        ::Box(QueryDataSignal).unbox(box).call(GutterRenderer.new(arg0), arg1.null? ? GObject.raise_unexpected_null("start in query_data") : Gtk::TextIter.new(arg1), arg2.null? ? GObject.raise_unexpected_null("_end in query_data") : Gtk::TextIter.new(arg2), GtkSource::GutterRendererState.new(arg3))
      }

      __var1 = ::Box.box(QueryDataSignal.new { |arg0, arg1, arg2, arg3|
        block.call(arg0, arg1, arg2, arg3)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "query-data", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_query_data(&block : QueryDataSignal)
      on_query_data(after: true, &block)
    end

    alias QueryTooltipSignal = GutterRenderer, Gtk::TextIter, Gdk::Rectangle, Int32, Int32, Gtk::Tooltip -> ::Bool

    def on_query_tooltip(*, after = false, &block : QueryTooltipSignal)
      __var0 = ->(arg0 : LibGtkSource::GutterRenderer*, arg1 : LibGtk::TextIter*, arg2 : LibGdk::Rectangle*, arg3 : Int32, arg4 : Int32, arg5 : LibGtk::Tooltip*, box : Void*) {
        LibC::Int.new(::Box(QueryTooltipSignal).unbox(box).call(GutterRenderer.new(arg0), arg1.null? ? GObject.raise_unexpected_null("iter in query_tooltip") : Gtk::TextIter.new(arg1), arg2.null? ? GObject.raise_unexpected_null("area in query_tooltip") : Gdk::Rectangle.new(arg2), arg3, arg4, arg5.null? ? GObject.raise_unexpected_null("tooltip in query_tooltip") : Gtk::Tooltip.new(arg5)) ? 1 : 0)
      }

      __var1 = ::Box.box(QueryTooltipSignal.new { |arg0, arg1, arg2, arg3, arg4, arg5|
        block.call(arg0, arg1, arg2, arg3, arg4, arg5)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "query-tooltip", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_query_tooltip(&block : QueryTooltipSignal)
      on_query_tooltip(after: true, &block)
    end

    alias QueueDrawSignal = GutterRenderer -> Nil

    def on_queue_draw(*, after = false, &block : QueueDrawSignal)
      __var0 = ->(arg0 : LibGtkSource::GutterRenderer*, box : Void*) {
        ::Box(QueueDrawSignal).unbox(box).call(GutterRenderer.new(arg0))
      }

      __var1 = ::Box.box(QueueDrawSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "queue-draw", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_queue_draw(&block : QueueDrawSignal)
      on_queue_draw(after: true, &block)
    end
  end

  enum GutterRendererAlignmentMode : UInt32
    CELL  = 0
    FIRST = 1
    LAST  = 2
  end

  class GutterRendererClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(376u64, 0u8).as(LibGtkSource::GutterRendererClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::GutterRendererClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::GutterRendererClass*)
    end

    def to_unsafe_gutterrendererclass
      @pointer.not_nil!.as(LibGtkSource::GutterRendererClass*)
    end

    def parent_class
      GObject::InitiallyUnownedClass.new(to_unsafe.as(LibGtkSource::GutterRendererClass*).value.parent_class)
    end

    def begin
      to_unsafe.as(LibGtkSource::GutterRendererClass*).value._begin
    end

    def draw
      to_unsafe.as(LibGtkSource::GutterRendererClass*).value.draw
    end

    def end
      to_unsafe.as(LibGtkSource::GutterRendererClass*).value._end
    end

    def change_view
      to_unsafe.as(LibGtkSource::GutterRendererClass*).value.change_view
    end

    def change_buffer
      to_unsafe.as(LibGtkSource::GutterRendererClass*).value.change_buffer
    end

    def query_activatable
      to_unsafe.as(LibGtkSource::GutterRendererClass*).value.query_activatable
    end

    def activate
      to_unsafe.as(LibGtkSource::GutterRendererClass*).value.activate
    end

    def queue_draw
      to_unsafe.as(LibGtkSource::GutterRendererClass*).value.queue_draw
    end

    def query_tooltip
      to_unsafe.as(LibGtkSource::GutterRendererClass*).value.query_tooltip
    end

    def query_data
      to_unsafe.as(LibGtkSource::GutterRendererClass*).value.query_data
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::GutterRendererClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class GutterRendererPixbuf < GutterRenderer
    @pointer : Void*

    def initialize(pointer : LibGtkSource::GutterRendererPixbuf*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceGutterRendererPixbuf")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_gutter_renderer_pixbuf_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::GutterRendererPixbuf*)
    end

    def to_unsafe_gutterrendererpixbuf
      @pointer.not_nil!.as(LibGtkSource::GutterRendererPixbuf*)
    end

    def initialize(*, alignment_mode : GtkSource::GutterRendererAlignmentMode? = nil, background_rgba : Gdk::RGBA? = nil, background_set : ::Bool? = nil, gicon : Gio::Icon? = nil, icon_name : ::String? = nil, pixbuf : GdkPixbuf::Pixbuf? = nil, size : Int32? = nil, visible : ::Bool? = nil, xalign : Float32? = nil, xpad : Int32? = nil, yalign : Float32? = nil, ypad : Int32? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless alignment_mode.nil?
        __var0 << "alignment-mode".to_unsafe
        __var1 << alignment_mode.to_gvalue.to_unsafe.value
      end

      unless background_rgba.nil?
        __var0 << "background-rgba".to_unsafe
        __var1 << background_rgba.to_gvalue.to_unsafe.value
      end

      unless background_set.nil?
        __var0 << "background-set".to_unsafe
        __var1 << background_set.to_gvalue.to_unsafe.value
      end

      unless gicon.nil?
        __var0 << "gicon".to_unsafe
        __var1 << gicon.to_gvalue.to_unsafe.value
      end

      unless icon_name.nil?
        __var0 << "icon-name".to_unsafe
        __var1 << icon_name.to_gvalue.to_unsafe.value
      end

      unless pixbuf.nil?
        __var0 << "pixbuf".to_unsafe
        __var1 << pixbuf.to_gvalue.to_unsafe.value
      end

      unless size.nil?
        __var0 << "size".to_unsafe
        __var1 << size.to_gvalue.to_unsafe.value
      end

      unless visible.nil?
        __var0 << "visible".to_unsafe
        __var1 << visible.to_gvalue.to_unsafe.value
      end

      unless xalign.nil?
        __var0 << "xalign".to_unsafe
        __var1 << xalign.to_gvalue.to_unsafe.value
      end

      unless xpad.nil?
        __var0 << "xpad".to_unsafe
        __var1 << xpad.to_gvalue.to_unsafe.value
      end

      unless yalign.nil?
        __var0 << "yalign".to_unsafe
        __var1 << yalign.to_gvalue.to_unsafe.value
      end

      unless ypad.nil?
        __var0 << "ypad".to_unsafe
        __var1 << ypad.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_gutter_renderer_pixbuf_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new : self
      __var0 = LibGtkSource.gutter_renderer_pixbuf_new
      GObject.raise_unexpected_null("gtk_source_gutter_renderer_pixbuf_new") if __var0.null?
      cast(GtkSource::GutterRenderer.new(__var0))
    end

    def gicon
      __var0 = LibGtkSource.gutter_renderer_pixbuf_get_gicon(@pointer.as(LibGtkSource::GutterRendererPixbuf*))
      GObject.raise_unexpected_null("gtk_source_gutter_renderer_pixbuf_get_gicon") if __var0.null?
      Gio::Icon::Wrapper.new(__var0)
    end

    def icon_name
      __var0 = LibGtkSource.gutter_renderer_pixbuf_get_icon_name(@pointer.as(LibGtkSource::GutterRendererPixbuf*))
      GObject.raise_unexpected_null("gtk_source_gutter_renderer_pixbuf_get_icon_name") if __var0.null?
      ::String.new(__var0)
    end

    def pixbuf
      __var0 = LibGtkSource.gutter_renderer_pixbuf_get_pixbuf(@pointer.as(LibGtkSource::GutterRendererPixbuf*))
      GObject.raise_unexpected_null("gtk_source_gutter_renderer_pixbuf_get_pixbuf") if __var0.null?
      GdkPixbuf::Pixbuf.new(__var0)
    end

    def gicon=(icon : Gio::Icon?)
      LibGtkSource.gutter_renderer_pixbuf_set_gicon(@pointer.as(LibGtkSource::GutterRendererPixbuf*), icon ? icon.to_unsafe_icon : Pointer(LibGio::Icon).null)
      nil
    end

    def icon_name=(icon_name : ::String?)
      LibGtkSource.gutter_renderer_pixbuf_set_icon_name(@pointer.as(LibGtkSource::GutterRendererPixbuf*), icon_name ? icon_name.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def pixbuf=(pixbuf : GdkPixbuf::Pixbuf?)
      LibGtkSource.gutter_renderer_pixbuf_set_pixbuf(@pointer.as(LibGtkSource::GutterRendererPixbuf*), pixbuf ? pixbuf.to_unsafe_pixbuf : Pointer(LibGdkPixbuf::Pixbuf).null)
      nil
    end
  end

  class GutterRendererPixbufClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(456u64, 0u8).as(LibGtkSource::GutterRendererPixbufClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::GutterRendererPixbufClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::GutterRendererPixbufClass*)
    end

    def to_unsafe_gutterrendererpixbufclass
      @pointer.not_nil!.as(LibGtkSource::GutterRendererPixbufClass*)
    end

    def parent_class
      GtkSource::GutterRendererClass.new(to_unsafe.as(LibGtkSource::GutterRendererPixbufClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::GutterRendererPixbufClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class GutterRendererPixbufPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::GutterRendererPixbufPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::GutterRendererPixbufPrivate*)
    end

    def to_unsafe_gutterrendererpixbufprivate
      @pointer.not_nil!.as(LibGtkSource::GutterRendererPixbufPrivate*)
    end
  end

  class GutterRendererPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::GutterRendererPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::GutterRendererPrivate*)
    end

    def to_unsafe_gutterrendererprivate
      @pointer.not_nil!.as(LibGtkSource::GutterRendererPrivate*)
    end
  end

  @[Flags]
  enum GutterRendererState : UInt32
    NORMAL   = 0
    CURSOR   = 1
    PRELIT   = 2
    SELECTED = 4
  end

  class GutterRendererText < GutterRenderer
    @pointer : Void*

    def initialize(pointer : LibGtkSource::GutterRendererText*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceGutterRendererText")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_gutter_renderer_text_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::GutterRendererText*)
    end

    def to_unsafe_gutterrenderertext
      @pointer.not_nil!.as(LibGtkSource::GutterRendererText*)
    end

    def initialize(*, alignment_mode : GtkSource::GutterRendererAlignmentMode? = nil, background_rgba : Gdk::RGBA? = nil, background_set : ::Bool? = nil, markup : ::String? = nil, size : Int32? = nil, text : ::String? = nil, visible : ::Bool? = nil, xalign : Float32? = nil, xpad : Int32? = nil, yalign : Float32? = nil, ypad : Int32? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless alignment_mode.nil?
        __var0 << "alignment-mode".to_unsafe
        __var1 << alignment_mode.to_gvalue.to_unsafe.value
      end

      unless background_rgba.nil?
        __var0 << "background-rgba".to_unsafe
        __var1 << background_rgba.to_gvalue.to_unsafe.value
      end

      unless background_set.nil?
        __var0 << "background-set".to_unsafe
        __var1 << background_set.to_gvalue.to_unsafe.value
      end

      unless markup.nil?
        __var0 << "markup".to_unsafe
        __var1 << markup.to_gvalue.to_unsafe.value
      end

      unless size.nil?
        __var0 << "size".to_unsafe
        __var1 << size.to_gvalue.to_unsafe.value
      end

      unless text.nil?
        __var0 << "text".to_unsafe
        __var1 << text.to_gvalue.to_unsafe.value
      end

      unless visible.nil?
        __var0 << "visible".to_unsafe
        __var1 << visible.to_gvalue.to_unsafe.value
      end

      unless xalign.nil?
        __var0 << "xalign".to_unsafe
        __var1 << xalign.to_gvalue.to_unsafe.value
      end

      unless xpad.nil?
        __var0 << "xpad".to_unsafe
        __var1 << xpad.to_gvalue.to_unsafe.value
      end

      unless yalign.nil?
        __var0 << "yalign".to_unsafe
        __var1 << yalign.to_gvalue.to_unsafe.value
      end

      unless ypad.nil?
        __var0 << "ypad".to_unsafe
        __var1 << ypad.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_gutter_renderer_text_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new : self
      __var0 = LibGtkSource.gutter_renderer_text_new
      GObject.raise_unexpected_null("gtk_source_gutter_renderer_text_new") if __var0.null?
      cast(GtkSource::GutterRenderer.new(__var0))
    end

    def measure(text : ::String)
      LibGtkSource.gutter_renderer_text_measure(@pointer.as(LibGtkSource::GutterRendererText*), text.to_unsafe, out width, out height)
      {width, height}
    end

    def measure_markup(markup : ::String)
      LibGtkSource.gutter_renderer_text_measure_markup(@pointer.as(LibGtkSource::GutterRendererText*), markup.to_unsafe, out width, out height)
      {width, height}
    end

    def set_markup(markup : ::String, length : ::Int)
      LibGtkSource.gutter_renderer_text_set_markup(@pointer.as(LibGtkSource::GutterRendererText*), markup.to_unsafe, Int32.new(length))
      nil
    end

    def set_text(text : ::String, length : ::Int)
      LibGtkSource.gutter_renderer_text_set_text(@pointer.as(LibGtkSource::GutterRendererText*), text.to_unsafe, Int32.new(length))
      nil
    end

    def markup : ::String
      __var0 = GObject::Value.new(type: GObject::Type::UTF8)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "markup", __var0)
      __var0.string
    end

    def markup=(value : ::String)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "markup", value.to_gvalue)
    end

    def text : ::String
      __var0 = GObject::Value.new(type: GObject::Type::UTF8)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "text", __var0)
      __var0.string
    end

    def text=(value : ::String)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "text", value.to_gvalue)
    end
  end

  class GutterRendererTextClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(456u64, 0u8).as(LibGtkSource::GutterRendererTextClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::GutterRendererTextClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::GutterRendererTextClass*)
    end

    def to_unsafe_gutterrenderertextclass
      @pointer.not_nil!.as(LibGtkSource::GutterRendererTextClass*)
    end

    def parent_class
      GtkSource::GutterRendererClass.new(to_unsafe.as(LibGtkSource::GutterRendererTextClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::GutterRendererTextClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class GutterRendererTextPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::GutterRendererTextPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::GutterRendererTextPrivate*)
    end

    def to_unsafe_gutterrenderertextprivate
      @pointer.not_nil!.as(LibGtkSource::GutterRendererTextPrivate*)
    end
  end

  class Language < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGtkSource::Language*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceLanguage")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_language_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::Language*)
    end

    def to_unsafe_language
      @pointer.not_nil!.as(LibGtkSource::Language*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_language_get_type, 0, nil, nil).as(Void*)
    end

    def globs
      __var0 = LibGtkSource.language_get_globs(@pointer.as(LibGtkSource::Language*))
      __var2 = GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      } if __var0
      __var2
    end

    def hidden
      __var0 = LibGtkSource.language_get_hidden(@pointer.as(LibGtkSource::Language*))
      (__var0 == 1)
    end

    def id
      __var0 = LibGtkSource.language_get_id(@pointer.as(LibGtkSource::Language*))
      GObject.raise_unexpected_null("gtk_source_language_get_id") if __var0.null?
      ::String.new(__var0)
    end

    def metadata(name : ::String)
      __var0 = LibGtkSource.language_get_metadata(@pointer.as(LibGtkSource::Language*), name.to_unsafe)
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def mime_types
      __var0 = LibGtkSource.language_get_mime_types(@pointer.as(LibGtkSource::Language*))
      __var2 = GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      } if __var0
      __var2
    end

    def name
      __var0 = LibGtkSource.language_get_name(@pointer.as(LibGtkSource::Language*))
      GObject.raise_unexpected_null("gtk_source_language_get_name") if __var0.null?
      ::String.new(__var0)
    end

    def section
      __var0 = LibGtkSource.language_get_section(@pointer.as(LibGtkSource::Language*))
      GObject.raise_unexpected_null("gtk_source_language_get_section") if __var0.null?
      ::String.new(__var0)
    end

    def style_fallback(style_id : ::String)
      __var0 = LibGtkSource.language_get_style_fallback(@pointer.as(LibGtkSource::Language*), style_id.to_unsafe)
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def style_ids
      __var0 = LibGtkSource.language_get_style_ids(@pointer.as(LibGtkSource::Language*))
      __var2 = GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      } if __var0
      __var2
    end

    def style_name(style_id : ::String)
      __var0 = LibGtkSource.language_get_style_name(@pointer.as(LibGtkSource::Language*), style_id.to_unsafe)
      __var1 = ::String.new(__var0) if __var0
      __var1
    end
  end

  class LanguageClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(216u64, 0u8).as(LibGtkSource::LanguageClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::LanguageClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::LanguageClass*)
    end

    def to_unsafe_languageclass
      @pointer.not_nil!.as(LibGtkSource::LanguageClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGtkSource::LanguageClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::LanguageClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class LanguageManager < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGtkSource::LanguageManager*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceLanguageManager")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_language_manager_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::LanguageManager*)
    end

    def to_unsafe_languagemanager
      @pointer.not_nil!.as(LibGtkSource::LanguageManager*)
    end

    def initialize(*, search_path : ::Enumerable(::String)? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless search_path.nil?
        __var0 << "search-path".to_unsafe
        __var1 << search_path.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_language_manager_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new : self
      __var0 = LibGtkSource.language_manager_new
      GObject.raise_unexpected_null("gtk_source_language_manager_new") if __var0.null?
      cast(GtkSource::LanguageManager.new(__var0))
    end

    def self.default
      __var0 = LibGtkSource.language_manager_get_default
      GObject.raise_unexpected_null("gtk_source_language_manager_get_default") if __var0.null?
      GtkSource::LanguageManager.new(__var0)
    end

    def language(id : ::String)
      __var0 = LibGtkSource.language_manager_get_language(@pointer.as(LibGtkSource::LanguageManager*), id.to_unsafe)
      __var1 = GtkSource::Language.new(__var0) if __var0
      __var1
    end

    def language_ids
      __var0 = LibGtkSource.language_manager_get_language_ids(@pointer.as(LibGtkSource::LanguageManager*))
      __var2 = GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      } if __var0
      __var2
    end

    def search_path
      __var0 = LibGtkSource.language_manager_get_search_path(@pointer.as(LibGtkSource::LanguageManager*))
      GObject.raise_unexpected_null("gtk_source_language_manager_get_search_path") if __var0.null?
      GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      }
    end

    def guess_language(filename : ::String?, content_type : ::String?)
      __var0 = LibGtkSource.language_manager_guess_language(@pointer.as(LibGtkSource::LanguageManager*), filename ? filename.to_unsafe : Pointer(UInt8).null, content_type ? content_type.to_unsafe : Pointer(UInt8).null)
      __var1 = GtkSource::Language.new(__var0) if __var0
      __var1
    end

    def search_path=(dirs : ::Enumerable?)
      LibGtkSource.language_manager_set_search_path(@pointer.as(LibGtkSource::LanguageManager*), dirs ? (__dirs_ary = dirs.map { |__item| __item.to_unsafe }.to_a).to_unsafe : Pointer(Pointer(UInt8)).null)
      nil
    end
  end

  class LanguageManagerClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(216u64, 0u8).as(LibGtkSource::LanguageManagerClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::LanguageManagerClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::LanguageManagerClass*)
    end

    def to_unsafe_languagemanagerclass
      @pointer.not_nil!.as(LibGtkSource::LanguageManagerClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGtkSource::LanguageManagerClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::LanguageManagerClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class LanguageManagerPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::LanguageManagerPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::LanguageManagerPrivate*)
    end

    def to_unsafe_languagemanagerprivate
      @pointer.not_nil!.as(LibGtkSource::LanguageManagerPrivate*)
    end
  end

  class LanguagePrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::LanguagePrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::LanguagePrivate*)
    end

    def to_unsafe_languageprivate
      @pointer.not_nil!.as(LibGtkSource::LanguagePrivate*)
    end
  end

  class View < Gtk::TextView
    include Atk::ImplementorIface
    include Gtk::Buildable
    include Gtk::Scrollable

    @pointer : Void*

    def initialize(pointer : LibGtkSource::View*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceView")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_view_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::View*)
    end

    def to_unsafe_view
      @pointer.not_nil!.as(LibGtkSource::View*)
    end

    def initialize(*, accepts_tab : ::Bool? = nil, app_paintable : ::Bool? = nil, auto_indent : ::Bool? = nil, background_pattern : GtkSource::BackgroundPatternType? = nil, border_width : UInt32? = nil, bottom_margin : Int32? = nil, buffer : Gtk::TextBuffer? = nil, can_default : ::Bool? = nil, can_focus : ::Bool? = nil, child : Gtk::Widget? = nil, cursor_visible : ::Bool? = nil, double_buffered : ::Bool? = nil, editable : ::Bool? = nil, events : Gdk::EventMask? = nil, expand : ::Bool? = nil, focus_on_click : ::Bool? = nil, hadjustment : Gtk::Adjustment? = nil, halign : Gtk::Align? = nil, has_default : ::Bool? = nil, has_focus : ::Bool? = nil, has_tooltip : ::Bool? = nil, height_request : Int32? = nil, hexpand : ::Bool? = nil, hexpand_set : ::Bool? = nil, highlight_current_line : ::Bool? = nil, hscroll_policy : Gtk::ScrollablePolicy? = nil, im_module : ::String? = nil, indent : Int32? = nil, indent_on_tab : ::Bool? = nil, indent_width : Int32? = nil, input_hints : Gtk::InputHints? = nil, input_purpose : Gtk::InputPurpose? = nil, insert_spaces_instead_of_tabs : ::Bool? = nil, is_focus : ::Bool? = nil, justification : Gtk::Justification? = nil, left_margin : Int32? = nil, margin : Int32? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_left : Int32? = nil, margin_right : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, monospace : ::Bool? = nil, name : ::String? = nil, no_show_all : ::Bool? = nil, opacity : Float64? = nil, overwrite : ::Bool? = nil, parent : Gtk::Container? = nil, pixels_above_lines : Int32? = nil, pixels_below_lines : Int32? = nil, pixels_inside_wrap : Int32? = nil, populate_all : ::Bool? = nil, receives_default : ::Bool? = nil, resize_mode : Gtk::ResizeMode? = nil, right_margin : Int32? = nil, right_margin_position : UInt32? = nil, sensitive : ::Bool? = nil, show_line_marks : ::Bool? = nil, show_line_numbers : ::Bool? = nil, show_right_margin : ::Bool? = nil, smart_backspace : ::Bool? = nil, smart_home_end : GtkSource::SmartHomeEndType? = nil, style : Gtk::Style? = nil, tab_width : UInt32? = nil, tabs : Pango::TabArray? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, top_margin : Int32? = nil, vadjustment : Gtk::Adjustment? = nil, valign : Gtk::Align? = nil, vexpand : ::Bool? = nil, vexpand_set : ::Bool? = nil, visible : ::Bool? = nil, vscroll_policy : Gtk::ScrollablePolicy? = nil, width_request : Int32? = nil, wrap_mode : Gtk::WrapMode? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless accepts_tab.nil?
        __var0 << "accepts-tab".to_unsafe
        __var1 << accepts_tab.to_gvalue.to_unsafe.value
      end

      unless app_paintable.nil?
        __var0 << "app-paintable".to_unsafe
        __var1 << app_paintable.to_gvalue.to_unsafe.value
      end

      unless auto_indent.nil?
        __var0 << "auto-indent".to_unsafe
        __var1 << auto_indent.to_gvalue.to_unsafe.value
      end

      unless background_pattern.nil?
        __var0 << "background-pattern".to_unsafe
        __var1 << background_pattern.to_gvalue.to_unsafe.value
      end

      unless border_width.nil?
        __var0 << "border-width".to_unsafe
        __var1 << border_width.to_gvalue.to_unsafe.value
      end

      unless bottom_margin.nil?
        __var0 << "bottom-margin".to_unsafe
        __var1 << bottom_margin.to_gvalue.to_unsafe.value
      end

      unless buffer.nil?
        __var0 << "buffer".to_unsafe
        __var1 << buffer.to_gvalue.to_unsafe.value
      end

      unless can_default.nil?
        __var0 << "can-default".to_unsafe
        __var1 << can_default.to_gvalue.to_unsafe.value
      end

      unless can_focus.nil?
        __var0 << "can-focus".to_unsafe
        __var1 << can_focus.to_gvalue.to_unsafe.value
      end

      unless child.nil?
        __var0 << "child".to_unsafe
        __var1 << child.to_gvalue.to_unsafe.value
      end

      unless cursor_visible.nil?
        __var0 << "cursor-visible".to_unsafe
        __var1 << cursor_visible.to_gvalue.to_unsafe.value
      end

      unless double_buffered.nil?
        __var0 << "double-buffered".to_unsafe
        __var1 << double_buffered.to_gvalue.to_unsafe.value
      end

      unless editable.nil?
        __var0 << "editable".to_unsafe
        __var1 << editable.to_gvalue.to_unsafe.value
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

      unless highlight_current_line.nil?
        __var0 << "highlight-current-line".to_unsafe
        __var1 << highlight_current_line.to_gvalue.to_unsafe.value
      end

      unless hscroll_policy.nil?
        __var0 << "hscroll-policy".to_unsafe
        __var1 << hscroll_policy.to_gvalue.to_unsafe.value
      end

      unless im_module.nil?
        __var0 << "im-module".to_unsafe
        __var1 << im_module.to_gvalue.to_unsafe.value
      end

      unless indent.nil?
        __var0 << "indent".to_unsafe
        __var1 << indent.to_gvalue.to_unsafe.value
      end

      unless indent_on_tab.nil?
        __var0 << "indent-on-tab".to_unsafe
        __var1 << indent_on_tab.to_gvalue.to_unsafe.value
      end

      unless indent_width.nil?
        __var0 << "indent-width".to_unsafe
        __var1 << indent_width.to_gvalue.to_unsafe.value
      end

      unless input_hints.nil?
        __var0 << "input-hints".to_unsafe
        __var1 << input_hints.to_gvalue.to_unsafe.value
      end

      unless input_purpose.nil?
        __var0 << "input-purpose".to_unsafe
        __var1 << input_purpose.to_gvalue.to_unsafe.value
      end

      unless insert_spaces_instead_of_tabs.nil?
        __var0 << "insert-spaces-instead-of-tabs".to_unsafe
        __var1 << insert_spaces_instead_of_tabs.to_gvalue.to_unsafe.value
      end

      unless is_focus.nil?
        __var0 << "is-focus".to_unsafe
        __var1 << is_focus.to_gvalue.to_unsafe.value
      end

      unless justification.nil?
        __var0 << "justification".to_unsafe
        __var1 << justification.to_gvalue.to_unsafe.value
      end

      unless left_margin.nil?
        __var0 << "left-margin".to_unsafe
        __var1 << left_margin.to_gvalue.to_unsafe.value
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

      unless monospace.nil?
        __var0 << "monospace".to_unsafe
        __var1 << monospace.to_gvalue.to_unsafe.value
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

      unless overwrite.nil?
        __var0 << "overwrite".to_unsafe
        __var1 << overwrite.to_gvalue.to_unsafe.value
      end

      unless parent.nil?
        __var0 << "parent".to_unsafe
        __var1 << parent.to_gvalue.to_unsafe.value
      end

      unless pixels_above_lines.nil?
        __var0 << "pixels-above-lines".to_unsafe
        __var1 << pixels_above_lines.to_gvalue.to_unsafe.value
      end

      unless pixels_below_lines.nil?
        __var0 << "pixels-below-lines".to_unsafe
        __var1 << pixels_below_lines.to_gvalue.to_unsafe.value
      end

      unless pixels_inside_wrap.nil?
        __var0 << "pixels-inside-wrap".to_unsafe
        __var1 << pixels_inside_wrap.to_gvalue.to_unsafe.value
      end

      unless populate_all.nil?
        __var0 << "populate-all".to_unsafe
        __var1 << populate_all.to_gvalue.to_unsafe.value
      end

      unless receives_default.nil?
        __var0 << "receives-default".to_unsafe
        __var1 << receives_default.to_gvalue.to_unsafe.value
      end

      unless resize_mode.nil?
        __var0 << "resize-mode".to_unsafe
        __var1 << resize_mode.to_gvalue.to_unsafe.value
      end

      unless right_margin.nil?
        __var0 << "right-margin".to_unsafe
        __var1 << right_margin.to_gvalue.to_unsafe.value
      end

      unless right_margin_position.nil?
        __var0 << "right-margin-position".to_unsafe
        __var1 << right_margin_position.to_gvalue.to_unsafe.value
      end

      unless sensitive.nil?
        __var0 << "sensitive".to_unsafe
        __var1 << sensitive.to_gvalue.to_unsafe.value
      end

      unless show_line_marks.nil?
        __var0 << "show-line-marks".to_unsafe
        __var1 << show_line_marks.to_gvalue.to_unsafe.value
      end

      unless show_line_numbers.nil?
        __var0 << "show-line-numbers".to_unsafe
        __var1 << show_line_numbers.to_gvalue.to_unsafe.value
      end

      unless show_right_margin.nil?
        __var0 << "show-right-margin".to_unsafe
        __var1 << show_right_margin.to_gvalue.to_unsafe.value
      end

      unless smart_backspace.nil?
        __var0 << "smart-backspace".to_unsafe
        __var1 << smart_backspace.to_gvalue.to_unsafe.value
      end

      unless smart_home_end.nil?
        __var0 << "smart-home-end".to_unsafe
        __var1 << smart_home_end.to_gvalue.to_unsafe.value
      end

      unless style.nil?
        __var0 << "style".to_unsafe
        __var1 << style.to_gvalue.to_unsafe.value
      end

      unless tab_width.nil?
        __var0 << "tab-width".to_unsafe
        __var1 << tab_width.to_gvalue.to_unsafe.value
      end

      unless tabs.nil?
        __var0 << "tabs".to_unsafe
        __var1 << tabs.to_gvalue.to_unsafe.value
      end

      unless tooltip_markup.nil?
        __var0 << "tooltip-markup".to_unsafe
        __var1 << tooltip_markup.to_gvalue.to_unsafe.value
      end

      unless tooltip_text.nil?
        __var0 << "tooltip-text".to_unsafe
        __var1 << tooltip_text.to_gvalue.to_unsafe.value
      end

      unless top_margin.nil?
        __var0 << "top-margin".to_unsafe
        __var1 << top_margin.to_gvalue.to_unsafe.value
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

      unless wrap_mode.nil?
        __var0 << "wrap-mode".to_unsafe
        __var1 << wrap_mode.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_view_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new : self
      __var0 = LibGtkSource.view_new
      GObject.raise_unexpected_null("gtk_source_view_new") if __var0.null?
      cast(Gtk::Widget.new(__var0))
    end

    def self.new_with_buffer(buffer : GtkSource::Buffer) : self
      __var0 = LibGtkSource.view_new_with_buffer(buffer.to_unsafe_buffer)
      GObject.raise_unexpected_null("gtk_source_view_new_with_buffer") if __var0.null?
      cast(Gtk::Widget.new(__var0))
    end

    def auto_indent
      __var0 = LibGtkSource.view_get_auto_indent(@pointer.as(LibGtkSource::View*))
      (__var0 == 1)
    end

    def background_pattern
      __var0 = LibGtkSource.view_get_background_pattern(@pointer.as(LibGtkSource::View*))
      GtkSource::BackgroundPatternType.new(__var0)
    end

    def completion
      __var0 = LibGtkSource.view_get_completion(@pointer.as(LibGtkSource::View*))
      GObject.raise_unexpected_null("gtk_source_view_get_completion") if __var0.null?
      GtkSource::Completion.new(__var0)
    end

    def gutter(window_type : Gtk::TextWindowType)
      __var0 = LibGtkSource.view_get_gutter(@pointer.as(LibGtkSource::View*), window_type)
      GObject.raise_unexpected_null("gtk_source_view_get_gutter") if __var0.null?
      GtkSource::Gutter.new(__var0)
    end

    def highlight_current_line
      __var0 = LibGtkSource.view_get_highlight_current_line(@pointer.as(LibGtkSource::View*))
      (__var0 == 1)
    end

    def indent_on_tab
      __var0 = LibGtkSource.view_get_indent_on_tab(@pointer.as(LibGtkSource::View*))
      (__var0 == 1)
    end

    def indent_width
      __var0 = LibGtkSource.view_get_indent_width(@pointer.as(LibGtkSource::View*))
      __var0
    end

    def insert_spaces_instead_of_tabs
      __var0 = LibGtkSource.view_get_insert_spaces_instead_of_tabs(@pointer.as(LibGtkSource::View*))
      (__var0 == 1)
    end

    def mark_attributes(category : ::String, priority : ::Int)
      __var0 = LibGtkSource.view_get_mark_attributes(@pointer.as(LibGtkSource::View*), category.to_unsafe, priority)
      GObject.raise_unexpected_null("gtk_source_view_get_mark_attributes") if __var0.null?
      GtkSource::MarkAttributes.new(__var0)
    end

    def right_margin_position
      __var0 = LibGtkSource.view_get_right_margin_position(@pointer.as(LibGtkSource::View*))
      __var0
    end

    def show_line_marks
      __var0 = LibGtkSource.view_get_show_line_marks(@pointer.as(LibGtkSource::View*))
      (__var0 == 1)
    end

    def show_line_numbers
      __var0 = LibGtkSource.view_get_show_line_numbers(@pointer.as(LibGtkSource::View*))
      (__var0 == 1)
    end

    def show_right_margin
      __var0 = LibGtkSource.view_get_show_right_margin(@pointer.as(LibGtkSource::View*))
      (__var0 == 1)
    end

    def smart_backspace
      __var0 = LibGtkSource.view_get_smart_backspace(@pointer.as(LibGtkSource::View*))
      (__var0 == 1)
    end

    def smart_home_end
      __var0 = LibGtkSource.view_get_smart_home_end(@pointer.as(LibGtkSource::View*))
      GtkSource::SmartHomeEndType.new(__var0)
    end

    def space_drawer
      __var0 = LibGtkSource.view_get_space_drawer(@pointer.as(LibGtkSource::View*))
      GObject.raise_unexpected_null("gtk_source_view_get_space_drawer") if __var0.null?
      GtkSource::SpaceDrawer.new(__var0)
    end

    def tab_width
      __var0 = LibGtkSource.view_get_tab_width(@pointer.as(LibGtkSource::View*))
      __var0
    end

    def visual_column(iter : Gtk::TextIter)
      __var0 = LibGtkSource.view_get_visual_column(@pointer.as(LibGtkSource::View*), iter.to_unsafe.as(LibGtk::TextIter*))
      __var0
    end

    def indent_lines(start : Gtk::TextIter, _end : Gtk::TextIter)
      LibGtkSource.view_indent_lines(@pointer.as(LibGtkSource::View*), start.to_unsafe.as(LibGtk::TextIter*), _end.to_unsafe.as(LibGtk::TextIter*))
      nil
    end

    def auto_indent=(enable : ::Bool)
      LibGtkSource.view_set_auto_indent(@pointer.as(LibGtkSource::View*), LibC::Int.new(enable ? 1 : 0))
      nil
    end

    def background_pattern=(background_pattern : GtkSource::BackgroundPatternType)
      LibGtkSource.view_set_background_pattern(@pointer.as(LibGtkSource::View*), background_pattern)
      nil
    end

    def highlight_current_line=(highlight : ::Bool)
      LibGtkSource.view_set_highlight_current_line(@pointer.as(LibGtkSource::View*), LibC::Int.new(highlight ? 1 : 0))
      nil
    end

    def indent_on_tab=(enable : ::Bool)
      LibGtkSource.view_set_indent_on_tab(@pointer.as(LibGtkSource::View*), LibC::Int.new(enable ? 1 : 0))
      nil
    end

    def indent_width=(width : ::Int)
      LibGtkSource.view_set_indent_width(@pointer.as(LibGtkSource::View*), Int32.new(width))
      nil
    end

    def insert_spaces_instead_of_tabs=(enable : ::Bool)
      LibGtkSource.view_set_insert_spaces_instead_of_tabs(@pointer.as(LibGtkSource::View*), LibC::Int.new(enable ? 1 : 0))
      nil
    end

    def set_mark_attributes(category : ::String, attributes : GtkSource::MarkAttributes, priority : ::Int)
      LibGtkSource.view_set_mark_attributes(@pointer.as(LibGtkSource::View*), category.to_unsafe, attributes.to_unsafe_markattributes, Int32.new(priority))
      nil
    end

    def right_margin_position=(pos : ::Int)
      LibGtkSource.view_set_right_margin_position(@pointer.as(LibGtkSource::View*), UInt32.new(pos))
      nil
    end

    def show_line_marks=(show : ::Bool)
      LibGtkSource.view_set_show_line_marks(@pointer.as(LibGtkSource::View*), LibC::Int.new(show ? 1 : 0))
      nil
    end

    def show_line_numbers=(show : ::Bool)
      LibGtkSource.view_set_show_line_numbers(@pointer.as(LibGtkSource::View*), LibC::Int.new(show ? 1 : 0))
      nil
    end

    def show_right_margin=(show : ::Bool)
      LibGtkSource.view_set_show_right_margin(@pointer.as(LibGtkSource::View*), LibC::Int.new(show ? 1 : 0))
      nil
    end

    def smart_backspace=(smart_backspace : ::Bool)
      LibGtkSource.view_set_smart_backspace(@pointer.as(LibGtkSource::View*), LibC::Int.new(smart_backspace ? 1 : 0))
      nil
    end

    def smart_home_end=(smart_home_end : GtkSource::SmartHomeEndType)
      LibGtkSource.view_set_smart_home_end(@pointer.as(LibGtkSource::View*), smart_home_end)
      nil
    end

    def tab_width=(width : ::Int)
      LibGtkSource.view_set_tab_width(@pointer.as(LibGtkSource::View*), UInt32.new(width))
      nil
    end

    def unindent_lines(start : Gtk::TextIter, _end : Gtk::TextIter)
      LibGtkSource.view_unindent_lines(@pointer.as(LibGtkSource::View*), start.to_unsafe.as(LibGtk::TextIter*), _end.to_unsafe.as(LibGtk::TextIter*))
      nil
    end

    alias ChangeCaseSignal = View, GtkSource::ChangeCaseType -> Nil

    def on_change_case(*, after = false, &block : ChangeCaseSignal)
      __var0 = ->(arg0 : LibGtkSource::View*, arg1 : LibGtkSource::ChangeCaseType, box : Void*) {
        ::Box(ChangeCaseSignal).unbox(box).call(View.new(arg0), GtkSource::ChangeCaseType.new(arg1))
      }

      __var1 = ::Box.box(ChangeCaseSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "change-case", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_change_case(&block : ChangeCaseSignal)
      on_change_case(after: true, &block)
    end

    alias ChangeNumberSignal = View, Int32 -> Nil

    def on_change_number(*, after = false, &block : ChangeNumberSignal)
      __var0 = ->(arg0 : LibGtkSource::View*, arg1 : Int32, box : Void*) {
        ::Box(ChangeNumberSignal).unbox(box).call(View.new(arg0), arg1)
      }

      __var1 = ::Box.box(ChangeNumberSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "change-number", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_change_number(&block : ChangeNumberSignal)
      on_change_number(after: true, &block)
    end

    alias JoinLinesSignal = View -> Nil

    def on_join_lines(*, after = false, &block : JoinLinesSignal)
      __var0 = ->(arg0 : LibGtkSource::View*, box : Void*) {
        ::Box(JoinLinesSignal).unbox(box).call(View.new(arg0))
      }

      __var1 = ::Box.box(JoinLinesSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "join-lines", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_join_lines(&block : JoinLinesSignal)
      on_join_lines(after: true, &block)
    end

    alias LineMarkActivatedSignal = View, Gtk::TextIter, Gdk::Event -> Nil

    def on_line_mark_activated(*, after = false, &block : LineMarkActivatedSignal)
      __var0 = ->(arg0 : LibGtkSource::View*, arg1 : LibGtk::TextIter*, arg2 : LibGdk::Event*, box : Void*) {
        ::Box(LineMarkActivatedSignal).unbox(box).call(View.new(arg0), arg1.null? ? GObject.raise_unexpected_null("iter in line_mark_activated") : Gtk::TextIter.new(arg1), arg2.null? ? GObject.raise_unexpected_null("event in line_mark_activated") : Gdk::Event.new(arg2))
      }

      __var1 = ::Box.box(LineMarkActivatedSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "line-mark-activated", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_line_mark_activated(&block : LineMarkActivatedSignal)
      on_line_mark_activated(after: true, &block)
    end

    alias MoveLinesSignal = View, ::Bool -> Nil

    def on_move_lines(*, after = false, &block : MoveLinesSignal)
      __var0 = ->(arg0 : LibGtkSource::View*, arg1 : LibC::Int, box : Void*) {
        ::Box(MoveLinesSignal).unbox(box).call(View.new(arg0), (arg1 == 1))
      }

      __var1 = ::Box.box(MoveLinesSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "move-lines", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_move_lines(&block : MoveLinesSignal)
      on_move_lines(after: true, &block)
    end

    alias MoveToMatchingBracketSignal = View, ::Bool -> Nil

    def on_move_to_matching_bracket(*, after = false, &block : MoveToMatchingBracketSignal)
      __var0 = ->(arg0 : LibGtkSource::View*, arg1 : LibC::Int, box : Void*) {
        ::Box(MoveToMatchingBracketSignal).unbox(box).call(View.new(arg0), (arg1 == 1))
      }

      __var1 = ::Box.box(MoveToMatchingBracketSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "move-to-matching-bracket", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_move_to_matching_bracket(&block : MoveToMatchingBracketSignal)
      on_move_to_matching_bracket(after: true, &block)
    end

    alias MoveWordsSignal = View, Int32 -> Nil

    def on_move_words(*, after = false, &block : MoveWordsSignal)
      __var0 = ->(arg0 : LibGtkSource::View*, arg1 : Int32, box : Void*) {
        ::Box(MoveWordsSignal).unbox(box).call(View.new(arg0), arg1)
      }

      __var1 = ::Box.box(MoveWordsSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "move-words", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_move_words(&block : MoveWordsSignal)
      on_move_words(after: true, &block)
    end

    alias RedoSignal = View -> Nil

    def on_redo(*, after = false, &block : RedoSignal)
      __var0 = ->(arg0 : LibGtkSource::View*, box : Void*) {
        ::Box(RedoSignal).unbox(box).call(View.new(arg0))
      }

      __var1 = ::Box.box(RedoSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "redo", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_redo(&block : RedoSignal)
      on_redo(after: true, &block)
    end

    alias ShowCompletionSignal = View -> Nil

    def on_show_completion(*, after = false, &block : ShowCompletionSignal)
      __var0 = ->(arg0 : LibGtkSource::View*, box : Void*) {
        ::Box(ShowCompletionSignal).unbox(box).call(View.new(arg0))
      }

      __var1 = ::Box.box(ShowCompletionSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "show-completion", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_show_completion(&block : ShowCompletionSignal)
      on_show_completion(after: true, &block)
    end

    alias SmartHomeEndSignal = View, Gtk::TextIter, Int32 -> Nil

    def on_smart_home_end(*, after = false, &block : SmartHomeEndSignal)
      __var0 = ->(arg0 : LibGtkSource::View*, arg1 : LibGtk::TextIter*, arg2 : Int32, box : Void*) {
        ::Box(SmartHomeEndSignal).unbox(box).call(View.new(arg0), arg1.null? ? GObject.raise_unexpected_null("iter in smart_home_end") : Gtk::TextIter.new(arg1), arg2)
      }

      __var1 = ::Box.box(SmartHomeEndSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "smart-home-end", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_smart_home_end(&block : SmartHomeEndSignal)
      on_smart_home_end(after: true, &block)
    end

    alias UndoSignal = View -> Nil

    def on_undo(*, after = false, &block : UndoSignal)
      __var0 = ->(arg0 : LibGtkSource::View*, box : Void*) {
        ::Box(UndoSignal).unbox(box).call(View.new(arg0))
      }

      __var1 = ::Box.box(UndoSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "undo", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_undo(&block : UndoSignal)
      on_undo(after: true, &block)
    end
  end

  class MapClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(1408u64, 0u8).as(LibGtkSource::MapClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::MapClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::MapClass*)
    end

    def to_unsafe_mapclass
      @pointer.not_nil!.as(LibGtkSource::MapClass*)
    end

    def parent_class
      GtkSource::ViewClass.new(to_unsafe.as(LibGtkSource::MapClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::MapClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class Mark < Gtk::TextMark
    @pointer : Void*

    def initialize(pointer : LibGtkSource::Mark*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceMark")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_mark_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::Mark*)
    end

    def to_unsafe_mark
      @pointer.not_nil!.as(LibGtkSource::Mark*)
    end

    def initialize(*, category : ::String? = nil, left_gravity : ::Bool? = nil, name : ::String? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless category.nil?
        __var0 << "category".to_unsafe
        __var1 << category.to_gvalue.to_unsafe.value
      end

      unless left_gravity.nil?
        __var0 << "left-gravity".to_unsafe
        __var1 << left_gravity.to_gvalue.to_unsafe.value
      end

      unless name.nil?
        __var0 << "name".to_unsafe
        __var1 << name.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_mark_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new(name : ::String, category : ::String) : self
      __var0 = LibGtkSource.mark_new(name.to_unsafe, category.to_unsafe)
      GObject.raise_unexpected_null("gtk_source_mark_new") if __var0.null?
      cast(GtkSource::Mark.new(__var0))
    end

    def category
      __var0 = LibGtkSource.mark_get_category(@pointer.as(LibGtkSource::Mark*))
      GObject.raise_unexpected_null("gtk_source_mark_get_category") if __var0.null?
      ::String.new(__var0)
    end

    def next(category : ::String?)
      __var0 = LibGtkSource.mark_next(@pointer.as(LibGtkSource::Mark*), category ? category.to_unsafe : Pointer(UInt8).null)
      __var1 = GtkSource::Mark.new(__var0) if __var0
      __var1
    end

    def prev(category : ::String)
      __var0 = LibGtkSource.mark_prev(@pointer.as(LibGtkSource::Mark*), category.to_unsafe)
      __var1 = GtkSource::Mark.new(__var0) if __var0
      __var1
    end
  end

  class MarkAttributes < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGtkSource::MarkAttributes*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceMarkAttributes")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_mark_attributes_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::MarkAttributes*)
    end

    def to_unsafe_markattributes
      @pointer.not_nil!.as(LibGtkSource::MarkAttributes*)
    end

    def initialize(*, background : Gdk::RGBA? = nil, gicon : Gio::Icon? = nil, icon_name : ::String? = nil, pixbuf : GdkPixbuf::Pixbuf? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless background.nil?
        __var0 << "background".to_unsafe
        __var1 << background.to_gvalue.to_unsafe.value
      end

      unless gicon.nil?
        __var0 << "gicon".to_unsafe
        __var1 << gicon.to_gvalue.to_unsafe.value
      end

      unless icon_name.nil?
        __var0 << "icon-name".to_unsafe
        __var1 << icon_name.to_gvalue.to_unsafe.value
      end

      unless pixbuf.nil?
        __var0 << "pixbuf".to_unsafe
        __var1 << pixbuf.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_mark_attributes_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new : self
      __var0 = LibGtkSource.mark_attributes_new
      GObject.raise_unexpected_null("gtk_source_mark_attributes_new") if __var0.null?
      cast(GtkSource::MarkAttributes.new(__var0))
    end

    def background(background : Gdk::RGBA)
      __var0 = LibGtkSource.mark_attributes_get_background(@pointer.as(LibGtkSource::MarkAttributes*), background)
      (__var0 == 1)
    end

    def gicon
      __var0 = LibGtkSource.mark_attributes_get_gicon(@pointer.as(LibGtkSource::MarkAttributes*))
      GObject.raise_unexpected_null("gtk_source_mark_attributes_get_gicon") if __var0.null?
      Gio::Icon::Wrapper.new(__var0)
    end

    def icon_name
      __var0 = LibGtkSource.mark_attributes_get_icon_name(@pointer.as(LibGtkSource::MarkAttributes*))
      GObject.raise_unexpected_null("gtk_source_mark_attributes_get_icon_name") if __var0.null?
      ::String.new(__var0)
    end

    def pixbuf
      __var0 = LibGtkSource.mark_attributes_get_pixbuf(@pointer.as(LibGtkSource::MarkAttributes*))
      GObject.raise_unexpected_null("gtk_source_mark_attributes_get_pixbuf") if __var0.null?
      GdkPixbuf::Pixbuf.new(__var0)
    end

    def tooltip_markup(mark : GtkSource::Mark)
      __var0 = LibGtkSource.mark_attributes_get_tooltip_markup(@pointer.as(LibGtkSource::MarkAttributes*), mark.to_unsafe_mark)
      GObject.raise_unexpected_null("gtk_source_mark_attributes_get_tooltip_markup") if __var0.null?
      ::String.new(__var0)
    end

    def tooltip_text(mark : GtkSource::Mark)
      __var0 = LibGtkSource.mark_attributes_get_tooltip_text(@pointer.as(LibGtkSource::MarkAttributes*), mark.to_unsafe_mark)
      GObject.raise_unexpected_null("gtk_source_mark_attributes_get_tooltip_text") if __var0.null?
      ::String.new(__var0)
    end

    def render_icon(widget : Gtk::Widget, size : ::Int)
      __var0 = LibGtkSource.mark_attributes_render_icon(@pointer.as(LibGtkSource::MarkAttributes*), widget.to_unsafe_widget, Int32.new(size))
      GObject.raise_unexpected_null("gtk_source_mark_attributes_render_icon") if __var0.null?
      GdkPixbuf::Pixbuf.new(__var0)
    end

    def background=(background : Gdk::RGBA)
      LibGtkSource.mark_attributes_set_background(@pointer.as(LibGtkSource::MarkAttributes*), background.to_unsafe.as(LibGdk::RGBA*))
      nil
    end

    def gicon=(gicon : Gio::Icon)
      LibGtkSource.mark_attributes_set_gicon(@pointer.as(LibGtkSource::MarkAttributes*), gicon.to_unsafe_icon)
      nil
    end

    def icon_name=(icon_name : ::String)
      LibGtkSource.mark_attributes_set_icon_name(@pointer.as(LibGtkSource::MarkAttributes*), icon_name.to_unsafe)
      nil
    end

    def pixbuf=(pixbuf : GdkPixbuf::Pixbuf)
      LibGtkSource.mark_attributes_set_pixbuf(@pointer.as(LibGtkSource::MarkAttributes*), pixbuf.to_unsafe_pixbuf)
      nil
    end

    alias QueryTooltipMarkupSignal = MarkAttributes, GtkSource::Mark -> ::String

    def on_query_tooltip_markup(*, after = false, &block : QueryTooltipMarkupSignal)
      __var0 = ->(arg0 : LibGtkSource::MarkAttributes*, arg1 : LibGtkSource::Mark*, box : Void*) {
        ::Box(QueryTooltipMarkupSignal).unbox(box).call(MarkAttributes.new(arg0), arg1.null? ? GObject.raise_unexpected_null("mark in query_tooltip_markup") : GtkSource::Mark.new(arg1)).to_unsafe
      }

      __var1 = ::Box.box(QueryTooltipMarkupSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "query-tooltip-markup", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_query_tooltip_markup(&block : QueryTooltipMarkupSignal)
      on_query_tooltip_markup(after: true, &block)
    end

    alias QueryTooltipTextSignal = MarkAttributes, GtkSource::Mark -> ::String

    def on_query_tooltip_text(*, after = false, &block : QueryTooltipTextSignal)
      __var0 = ->(arg0 : LibGtkSource::MarkAttributes*, arg1 : LibGtkSource::Mark*, box : Void*) {
        ::Box(QueryTooltipTextSignal).unbox(box).call(MarkAttributes.new(arg0), arg1.null? ? GObject.raise_unexpected_null("mark in query_tooltip_text") : GtkSource::Mark.new(arg1)).to_unsafe
      }

      __var1 = ::Box.box(QueryTooltipTextSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "query-tooltip-text", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_query_tooltip_text(&block : QueryTooltipTextSignal)
      on_query_tooltip_text(after: true, &block)
    end
  end

  class MarkAttributesClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(216u64, 0u8).as(LibGtkSource::MarkAttributesClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::MarkAttributesClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::MarkAttributesClass*)
    end

    def to_unsafe_markattributesclass
      @pointer.not_nil!.as(LibGtkSource::MarkAttributesClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGtkSource::MarkAttributesClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::MarkAttributesClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class MarkAttributesPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::MarkAttributesPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::MarkAttributesPrivate*)
    end

    def to_unsafe_markattributesprivate
      @pointer.not_nil!.as(LibGtkSource::MarkAttributesPrivate*)
    end
  end

  class MarkClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(248u64, 0u8).as(LibGtkSource::MarkClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::MarkClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::MarkClass*)
    end

    def to_unsafe_markclass
      @pointer.not_nil!.as(LibGtkSource::MarkClass*)
    end

    def parent_class
      Gtk::TextMarkClass.new(to_unsafe.as(LibGtkSource::MarkClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::MarkClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class MarkPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::MarkPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::MarkPrivate*)
    end

    def to_unsafe_markprivate
      @pointer.not_nil!.as(LibGtkSource::MarkPrivate*)
    end
  end

  enum NewlineType : UInt32
    LF    = 0
    CR    = 1
    CR_LF = 2
  end

  class PrintCompositor < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGtkSource::PrintCompositor*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourcePrintCompositor")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_print_compositor_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::PrintCompositor*)
    end

    def to_unsafe_printcompositor
      @pointer.not_nil!.as(LibGtkSource::PrintCompositor*)
    end

    def initialize(*, body_font_name : ::String? = nil, buffer : GtkSource::Buffer? = nil, footer_font_name : ::String? = nil, header_font_name : ::String? = nil, highlight_syntax : ::Bool? = nil, line_numbers_font_name : ::String? = nil, print_footer : ::Bool? = nil, print_header : ::Bool? = nil, print_line_numbers : UInt32? = nil, tab_width : UInt32? = nil, wrap_mode : Gtk::WrapMode? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless body_font_name.nil?
        __var0 << "body-font-name".to_unsafe
        __var1 << body_font_name.to_gvalue.to_unsafe.value
      end

      unless buffer.nil?
        __var0 << "buffer".to_unsafe
        __var1 << buffer.to_gvalue.to_unsafe.value
      end

      unless footer_font_name.nil?
        __var0 << "footer-font-name".to_unsafe
        __var1 << footer_font_name.to_gvalue.to_unsafe.value
      end

      unless header_font_name.nil?
        __var0 << "header-font-name".to_unsafe
        __var1 << header_font_name.to_gvalue.to_unsafe.value
      end

      unless highlight_syntax.nil?
        __var0 << "highlight-syntax".to_unsafe
        __var1 << highlight_syntax.to_gvalue.to_unsafe.value
      end

      unless line_numbers_font_name.nil?
        __var0 << "line-numbers-font-name".to_unsafe
        __var1 << line_numbers_font_name.to_gvalue.to_unsafe.value
      end

      unless print_footer.nil?
        __var0 << "print-footer".to_unsafe
        __var1 << print_footer.to_gvalue.to_unsafe.value
      end

      unless print_header.nil?
        __var0 << "print-header".to_unsafe
        __var1 << print_header.to_gvalue.to_unsafe.value
      end

      unless print_line_numbers.nil?
        __var0 << "print-line-numbers".to_unsafe
        __var1 << print_line_numbers.to_gvalue.to_unsafe.value
      end

      unless tab_width.nil?
        __var0 << "tab-width".to_unsafe
        __var1 << tab_width.to_gvalue.to_unsafe.value
      end

      unless wrap_mode.nil?
        __var0 << "wrap-mode".to_unsafe
        __var1 << wrap_mode.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_print_compositor_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new(buffer : GtkSource::Buffer) : self
      __var0 = LibGtkSource.print_compositor_new(buffer.to_unsafe_buffer)
      GObject.raise_unexpected_null("gtk_source_print_compositor_new") if __var0.null?
      cast(GtkSource::PrintCompositor.new(__var0))
    end

    def self.new_from_view(view : GtkSource::View) : self
      __var0 = LibGtkSource.print_compositor_new_from_view(view.to_unsafe_view)
      GObject.raise_unexpected_null("gtk_source_print_compositor_new_from_view") if __var0.null?
      cast(GtkSource::PrintCompositor.new(__var0))
    end

    def draw_page(context : Gtk::PrintContext, page_nr : ::Int)
      LibGtkSource.print_compositor_draw_page(@pointer.as(LibGtkSource::PrintCompositor*), context.to_unsafe_printcontext, Int32.new(page_nr))
      nil
    end

    def body_font_name
      __var0 = LibGtkSource.print_compositor_get_body_font_name(@pointer.as(LibGtkSource::PrintCompositor*))
      GObject.raise_unexpected_null("gtk_source_print_compositor_get_body_font_name") if __var0.null?
      ::String.new(__var0)
    end

    def bottom_margin(unit : Gtk::Unit)
      __var0 = LibGtkSource.print_compositor_get_bottom_margin(@pointer.as(LibGtkSource::PrintCompositor*), unit)
      __var0
    end

    def buffer
      __var0 = LibGtkSource.print_compositor_get_buffer(@pointer.as(LibGtkSource::PrintCompositor*))
      GObject.raise_unexpected_null("gtk_source_print_compositor_get_buffer") if __var0.null?
      GtkSource::Buffer.new(__var0)
    end

    def footer_font_name
      __var0 = LibGtkSource.print_compositor_get_footer_font_name(@pointer.as(LibGtkSource::PrintCompositor*))
      GObject.raise_unexpected_null("gtk_source_print_compositor_get_footer_font_name") if __var0.null?
      ::String.new(__var0)
    end

    def header_font_name
      __var0 = LibGtkSource.print_compositor_get_header_font_name(@pointer.as(LibGtkSource::PrintCompositor*))
      GObject.raise_unexpected_null("gtk_source_print_compositor_get_header_font_name") if __var0.null?
      ::String.new(__var0)
    end

    def highlight_syntax
      __var0 = LibGtkSource.print_compositor_get_highlight_syntax(@pointer.as(LibGtkSource::PrintCompositor*))
      (__var0 == 1)
    end

    def left_margin(unit : Gtk::Unit)
      __var0 = LibGtkSource.print_compositor_get_left_margin(@pointer.as(LibGtkSource::PrintCompositor*), unit)
      __var0
    end

    def line_numbers_font_name
      __var0 = LibGtkSource.print_compositor_get_line_numbers_font_name(@pointer.as(LibGtkSource::PrintCompositor*))
      GObject.raise_unexpected_null("gtk_source_print_compositor_get_line_numbers_font_name") if __var0.null?
      ::String.new(__var0)
    end

    def n_pages
      __var0 = LibGtkSource.print_compositor_get_n_pages(@pointer.as(LibGtkSource::PrintCompositor*))
      __var0
    end

    def pagination_progress
      __var0 = LibGtkSource.print_compositor_get_pagination_progress(@pointer.as(LibGtkSource::PrintCompositor*))
      __var0
    end

    def print_footer
      __var0 = LibGtkSource.print_compositor_get_print_footer(@pointer.as(LibGtkSource::PrintCompositor*))
      (__var0 == 1)
    end

    def print_header
      __var0 = LibGtkSource.print_compositor_get_print_header(@pointer.as(LibGtkSource::PrintCompositor*))
      (__var0 == 1)
    end

    def print_line_numbers
      __var0 = LibGtkSource.print_compositor_get_print_line_numbers(@pointer.as(LibGtkSource::PrintCompositor*))
      __var0
    end

    def right_margin(unit : Gtk::Unit)
      __var0 = LibGtkSource.print_compositor_get_right_margin(@pointer.as(LibGtkSource::PrintCompositor*), unit)
      __var0
    end

    def tab_width
      __var0 = LibGtkSource.print_compositor_get_tab_width(@pointer.as(LibGtkSource::PrintCompositor*))
      __var0
    end

    def top_margin(unit : Gtk::Unit)
      __var0 = LibGtkSource.print_compositor_get_top_margin(@pointer.as(LibGtkSource::PrintCompositor*), unit)
      __var0
    end

    def wrap_mode
      __var0 = LibGtkSource.print_compositor_get_wrap_mode(@pointer.as(LibGtkSource::PrintCompositor*))
      Gtk::WrapMode.new(__var0)
    end

    def paginate(context : Gtk::PrintContext)
      __var0 = LibGtkSource.print_compositor_paginate(@pointer.as(LibGtkSource::PrintCompositor*), context.to_unsafe_printcontext)
      (__var0 == 1)
    end

    def body_font_name=(font_name : ::String)
      LibGtkSource.print_compositor_set_body_font_name(@pointer.as(LibGtkSource::PrintCompositor*), font_name.to_unsafe)
      nil
    end

    def set_bottom_margin(margin : ::Float, unit : Gtk::Unit)
      LibGtkSource.print_compositor_set_bottom_margin(@pointer.as(LibGtkSource::PrintCompositor*), Float64.new(margin), unit)
      nil
    end

    def footer_font_name=(font_name : ::String?)
      LibGtkSource.print_compositor_set_footer_font_name(@pointer.as(LibGtkSource::PrintCompositor*), font_name ? font_name.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def set_footer_format(separator : ::Bool, left : ::String?, center : ::String?, right : ::String?)
      LibGtkSource.print_compositor_set_footer_format(@pointer.as(LibGtkSource::PrintCompositor*), LibC::Int.new(separator ? 1 : 0), left ? left.to_unsafe : Pointer(UInt8).null, center ? center.to_unsafe : Pointer(UInt8).null, right ? right.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def header_font_name=(font_name : ::String?)
      LibGtkSource.print_compositor_set_header_font_name(@pointer.as(LibGtkSource::PrintCompositor*), font_name ? font_name.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def set_header_format(separator : ::Bool, left : ::String?, center : ::String?, right : ::String?)
      LibGtkSource.print_compositor_set_header_format(@pointer.as(LibGtkSource::PrintCompositor*), LibC::Int.new(separator ? 1 : 0), left ? left.to_unsafe : Pointer(UInt8).null, center ? center.to_unsafe : Pointer(UInt8).null, right ? right.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def highlight_syntax=(highlight : ::Bool)
      LibGtkSource.print_compositor_set_highlight_syntax(@pointer.as(LibGtkSource::PrintCompositor*), LibC::Int.new(highlight ? 1 : 0))
      nil
    end

    def set_left_margin(margin : ::Float, unit : Gtk::Unit)
      LibGtkSource.print_compositor_set_left_margin(@pointer.as(LibGtkSource::PrintCompositor*), Float64.new(margin), unit)
      nil
    end

    def line_numbers_font_name=(font_name : ::String?)
      LibGtkSource.print_compositor_set_line_numbers_font_name(@pointer.as(LibGtkSource::PrintCompositor*), font_name ? font_name.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def print_footer=(print : ::Bool)
      LibGtkSource.print_compositor_set_print_footer(@pointer.as(LibGtkSource::PrintCompositor*), LibC::Int.new(print ? 1 : 0))
      nil
    end

    def print_header=(print : ::Bool)
      LibGtkSource.print_compositor_set_print_header(@pointer.as(LibGtkSource::PrintCompositor*), LibC::Int.new(print ? 1 : 0))
      nil
    end

    def print_line_numbers=(interval : ::Int)
      LibGtkSource.print_compositor_set_print_line_numbers(@pointer.as(LibGtkSource::PrintCompositor*), UInt32.new(interval))
      nil
    end

    def set_right_margin(margin : ::Float, unit : Gtk::Unit)
      LibGtkSource.print_compositor_set_right_margin(@pointer.as(LibGtkSource::PrintCompositor*), Float64.new(margin), unit)
      nil
    end

    def tab_width=(width : ::Int)
      LibGtkSource.print_compositor_set_tab_width(@pointer.as(LibGtkSource::PrintCompositor*), UInt32.new(width))
      nil
    end

    def set_top_margin(margin : ::Float, unit : Gtk::Unit)
      LibGtkSource.print_compositor_set_top_margin(@pointer.as(LibGtkSource::PrintCompositor*), Float64.new(margin), unit)
      nil
    end

    def wrap_mode=(wrap_mode : Gtk::WrapMode)
      LibGtkSource.print_compositor_set_wrap_mode(@pointer.as(LibGtkSource::PrintCompositor*), wrap_mode)
      nil
    end
  end

  class PrintCompositorClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(216u64, 0u8).as(LibGtkSource::PrintCompositorClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::PrintCompositorClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::PrintCompositorClass*)
    end

    def to_unsafe_printcompositorclass
      @pointer.not_nil!.as(LibGtkSource::PrintCompositorClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGtkSource::PrintCompositorClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::PrintCompositorClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class PrintCompositorPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::PrintCompositorPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::PrintCompositorPrivate*)
    end

    def to_unsafe_printcompositorprivate
      @pointer.not_nil!.as(LibGtkSource::PrintCompositorPrivate*)
    end
  end

  class Region < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGtkSource::Region*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceRegion")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_region_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::Region*)
    end

    def to_unsafe_region
      @pointer.not_nil!.as(LibGtkSource::Region*)
    end

    def initialize(*, buffer : Gtk::TextBuffer? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless buffer.nil?
        __var0 << "buffer".to_unsafe
        __var1 << buffer.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_region_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new(buffer : Gtk::TextBuffer) : self
      __var0 = LibGtkSource.region_new(buffer.to_unsafe_textbuffer)
      GObject.raise_unexpected_null("gtk_source_region_new") if __var0.null?
      cast(GtkSource::Region.new(__var0))
    end

    def add_region(region_to_add : GtkSource::Region?)
      LibGtkSource.region_add_region(@pointer.as(LibGtkSource::Region*), region_to_add ? region_to_add.to_unsafe_region : Pointer(LibGtkSource::Region).null)
      nil
    end

    def add_subregion(_start : Gtk::TextIter, _end : Gtk::TextIter)
      LibGtkSource.region_add_subregion(@pointer.as(LibGtkSource::Region*), _start.to_unsafe.as(LibGtk::TextIter*), _end.to_unsafe.as(LibGtk::TextIter*))
      nil
    end

    def bounds(start : Gtk::TextIter?, _end : Gtk::TextIter?)
      __var0 = LibGtkSource.region_get_bounds(@pointer.as(LibGtkSource::Region*), start, _end)
      (__var0 == 1)
    end

    def buffer
      __var0 = LibGtkSource.region_get_buffer(@pointer.as(LibGtkSource::Region*))
      __var1 = Gtk::TextBuffer.new(__var0) if __var0
      __var1
    end

    def start_region_iter(iter : GtkSource::RegionIter)
      LibGtkSource.region_get_start_region_iter(@pointer.as(LibGtkSource::Region*), iter)
      nil
    end

    def intersect_region(region2 : GtkSource::Region?)
      __var0 = LibGtkSource.region_intersect_region(@pointer.as(LibGtkSource::Region*), region2 ? region2.to_unsafe_region : Pointer(LibGtkSource::Region).null)
      __var1 = GtkSource::Region.new(__var0) if __var0
      __var1
    end

    def intersect_subregion(_start : Gtk::TextIter, _end : Gtk::TextIter)
      __var0 = LibGtkSource.region_intersect_subregion(@pointer.as(LibGtkSource::Region*), _start.to_unsafe.as(LibGtk::TextIter*), _end.to_unsafe.as(LibGtk::TextIter*))
      __var1 = GtkSource::Region.new(__var0) if __var0
      __var1
    end

    def empty?
      __var0 = LibGtkSource.region_is_empty(@pointer.as(LibGtkSource::Region*))
      (__var0 == 1)
    end

    def subtract_region(region_to_subtract : GtkSource::Region?)
      LibGtkSource.region_subtract_region(@pointer.as(LibGtkSource::Region*), region_to_subtract ? region_to_subtract.to_unsafe_region : Pointer(LibGtkSource::Region).null)
      nil
    end

    def subtract_subregion(_start : Gtk::TextIter, _end : Gtk::TextIter)
      LibGtkSource.region_subtract_subregion(@pointer.as(LibGtkSource::Region*), _start.to_unsafe.as(LibGtk::TextIter*), _end.to_unsafe.as(LibGtk::TextIter*))
      nil
    end

    def to_string
      __var0 = LibGtkSource.region_to_string(@pointer.as(LibGtkSource::Region*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end
  end

  class RegionClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(216u64, 0u8).as(LibGtkSource::RegionClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::RegionClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::RegionClass*)
    end

    def to_unsafe_regionclass
      @pointer.not_nil!.as(LibGtkSource::RegionClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGtkSource::RegionClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::RegionClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class RegionIter
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGtkSource::RegionIter*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::RegionIter*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::RegionIter*)
    end

    def to_unsafe_regioniter
      @pointer.not_nil!.as(LibGtkSource::RegionIter*)
    end

    def subregion(start : Gtk::TextIter?, _end : Gtk::TextIter?)
      __var0 = LibGtkSource.region_iter_get_subregion(@pointer.as(LibGtkSource::RegionIter*), start, _end)
      (__var0 == 1)
    end

    def end?
      __var0 = LibGtkSource.region_iter_is_end(@pointer.as(LibGtkSource::RegionIter*))
      (__var0 == 1)
    end

    def next
      __var0 = LibGtkSource.region_iter_next(@pointer.as(LibGtkSource::RegionIter*))
      (__var0 == 1)
    end

    def dummy1
      to_unsafe.as(LibGtkSource::RegionIter*).value.dummy1
    end

    def dummy2
      to_unsafe.as(LibGtkSource::RegionIter*).value.dummy2
    end

    def dummy3
      to_unsafe.as(LibGtkSource::RegionIter*).value.dummy3
    end
  end

  class SearchContext < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGtkSource::SearchContext*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceSearchContext")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_search_context_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::SearchContext*)
    end

    def to_unsafe_searchcontext
      @pointer.not_nil!.as(LibGtkSource::SearchContext*)
    end

    def initialize(*, buffer : GtkSource::Buffer? = nil, highlight : ::Bool? = nil, match_style : GtkSource::Style? = nil, settings : GtkSource::SearchSettings? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless buffer.nil?
        __var0 << "buffer".to_unsafe
        __var1 << buffer.to_gvalue.to_unsafe.value
      end

      unless highlight.nil?
        __var0 << "highlight".to_unsafe
        __var1 << highlight.to_gvalue.to_unsafe.value
      end

      unless match_style.nil?
        __var0 << "match-style".to_unsafe
        __var1 << match_style.to_gvalue.to_unsafe.value
      end

      unless settings.nil?
        __var0 << "settings".to_unsafe
        __var1 << settings.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_search_context_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new(buffer : GtkSource::Buffer, settings : GtkSource::SearchSettings?) : self
      __var0 = LibGtkSource.search_context_new(buffer.to_unsafe_buffer, settings ? settings.to_unsafe_searchsettings : Pointer(LibGtkSource::SearchSettings).null)
      GObject.raise_unexpected_null("gtk_source_search_context_new") if __var0.null?
      cast(GtkSource::SearchContext.new(__var0))
    end

    def backward(iter : Gtk::TextIter, match_start : Gtk::TextIter?, match_end : Gtk::TextIter?)
      __var0 = LibGtkSource.search_context_backward(@pointer.as(LibGtkSource::SearchContext*), iter.to_unsafe.as(LibGtk::TextIter*), match_start, match_end, out has_wrapped_around)
      {(__var0 == 1), (has_wrapped_around == 1)}
    end

    def backward_async(iter : Gtk::TextIter, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Void*?)
      LibGtkSource.search_context_backward_async(@pointer.as(LibGtkSource::SearchContext*), iter.to_unsafe.as(LibGtk::TextIter*), cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, callback ? callback : nil, user_data ? user_data : Pointer(Void).null)
      nil
    end

    def backward_finish(result : Gio::AsyncResult, match_start : Gtk::TextIter?, match_end : Gtk::TextIter?)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGtkSource.search_context_backward_finish(@pointer.as(LibGtkSource::SearchContext*), result.to_unsafe_asyncresult, match_start, match_end, out has_wrapped_around, pointerof(__var0))
      GLib::Error.assert(__var0)
      {(__var1 == 1), (has_wrapped_around == 1)}
    end

    def forward(iter : Gtk::TextIter, match_start : Gtk::TextIter?, match_end : Gtk::TextIter?)
      __var0 = LibGtkSource.search_context_forward(@pointer.as(LibGtkSource::SearchContext*), iter.to_unsafe.as(LibGtk::TextIter*), match_start, match_end, out has_wrapped_around)
      {(__var0 == 1), (has_wrapped_around == 1)}
    end

    def forward_async(iter : Gtk::TextIter, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Void*?)
      LibGtkSource.search_context_forward_async(@pointer.as(LibGtkSource::SearchContext*), iter.to_unsafe.as(LibGtk::TextIter*), cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, callback ? callback : nil, user_data ? user_data : Pointer(Void).null)
      nil
    end

    def forward_finish(result : Gio::AsyncResult, match_start : Gtk::TextIter?, match_end : Gtk::TextIter?)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGtkSource.search_context_forward_finish(@pointer.as(LibGtkSource::SearchContext*), result.to_unsafe_asyncresult, match_start, match_end, out has_wrapped_around, pointerof(__var0))
      GLib::Error.assert(__var0)
      {(__var1 == 1), (has_wrapped_around == 1)}
    end

    def buffer
      __var0 = LibGtkSource.search_context_get_buffer(@pointer.as(LibGtkSource::SearchContext*))
      GObject.raise_unexpected_null("gtk_source_search_context_get_buffer") if __var0.null?
      GtkSource::Buffer.new(__var0)
    end

    def highlight
      __var0 = LibGtkSource.search_context_get_highlight(@pointer.as(LibGtkSource::SearchContext*))
      (__var0 == 1)
    end

    def match_style
      __var0 = LibGtkSource.search_context_get_match_style(@pointer.as(LibGtkSource::SearchContext*))
      GObject.raise_unexpected_null("gtk_source_search_context_get_match_style") if __var0.null?
      GtkSource::Style.new(__var0)
    end

    def occurrence_position(match_start : Gtk::TextIter, match_end : Gtk::TextIter)
      __var0 = LibGtkSource.search_context_get_occurrence_position(@pointer.as(LibGtkSource::SearchContext*), match_start.to_unsafe.as(LibGtk::TextIter*), match_end.to_unsafe.as(LibGtk::TextIter*))
      __var0
    end

    def occurrences_count
      __var0 = LibGtkSource.search_context_get_occurrences_count(@pointer.as(LibGtkSource::SearchContext*))
      __var0
    end

    def regex_error
      __var0 = LibGtkSource.search_context_get_regex_error(@pointer.as(LibGtkSource::SearchContext*))
      __var1 = __var0 if __var0
      __var1
    end

    def settings
      __var0 = LibGtkSource.search_context_get_settings(@pointer.as(LibGtkSource::SearchContext*))
      GObject.raise_unexpected_null("gtk_source_search_context_get_settings") if __var0.null?
      GtkSource::SearchSettings.new(__var0)
    end

    def replace(match_start : Gtk::TextIter, match_end : Gtk::TextIter, replace : ::String, replace_length : ::Int)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGtkSource.search_context_replace(@pointer.as(LibGtkSource::SearchContext*), match_start.to_unsafe.as(LibGtk::TextIter*), match_end.to_unsafe.as(LibGtk::TextIter*), replace.to_unsafe, Int32.new(replace_length), pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def replace_all(replace : ::String, replace_length : ::Int)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGtkSource.search_context_replace_all(@pointer.as(LibGtkSource::SearchContext*), replace.to_unsafe, Int32.new(replace_length), pointerof(__var0))
      GLib::Error.assert(__var0)
      __var1
    end

    def highlight=(highlight : ::Bool)
      LibGtkSource.search_context_set_highlight(@pointer.as(LibGtkSource::SearchContext*), LibC::Int.new(highlight ? 1 : 0))
      nil
    end

    def match_style=(match_style : GtkSource::Style?)
      LibGtkSource.search_context_set_match_style(@pointer.as(LibGtkSource::SearchContext*), match_style ? match_style.to_unsafe_style : Pointer(LibGtkSource::Style).null)
      nil
    end
  end

  class SearchContextClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(216u64, 0u8).as(LibGtkSource::SearchContextClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::SearchContextClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::SearchContextClass*)
    end

    def to_unsafe_searchcontextclass
      @pointer.not_nil!.as(LibGtkSource::SearchContextClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGtkSource::SearchContextClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::SearchContextClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class SearchContextPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::SearchContextPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::SearchContextPrivate*)
    end

    def to_unsafe_searchcontextprivate
      @pointer.not_nil!.as(LibGtkSource::SearchContextPrivate*)
    end
  end

  class SearchSettings < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGtkSource::SearchSettings*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceSearchSettings")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_search_settings_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::SearchSettings*)
    end

    def to_unsafe_searchsettings
      @pointer.not_nil!.as(LibGtkSource::SearchSettings*)
    end

    def initialize(*, at_word_boundaries : ::Bool? = nil, case_sensitive : ::Bool? = nil, regex_enabled : ::Bool? = nil, search_text : ::String? = nil, wrap_around : ::Bool? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless at_word_boundaries.nil?
        __var0 << "at-word-boundaries".to_unsafe
        __var1 << at_word_boundaries.to_gvalue.to_unsafe.value
      end

      unless case_sensitive.nil?
        __var0 << "case-sensitive".to_unsafe
        __var1 << case_sensitive.to_gvalue.to_unsafe.value
      end

      unless regex_enabled.nil?
        __var0 << "regex-enabled".to_unsafe
        __var1 << regex_enabled.to_gvalue.to_unsafe.value
      end

      unless search_text.nil?
        __var0 << "search-text".to_unsafe
        __var1 << search_text.to_gvalue.to_unsafe.value
      end

      unless wrap_around.nil?
        __var0 << "wrap-around".to_unsafe
        __var1 << wrap_around.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_search_settings_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new : self
      __var0 = LibGtkSource.search_settings_new
      GObject.raise_unexpected_null("gtk_source_search_settings_new") if __var0.null?
      cast(GtkSource::SearchSettings.new(__var0))
    end

    def at_word_boundaries
      __var0 = LibGtkSource.search_settings_get_at_word_boundaries(@pointer.as(LibGtkSource::SearchSettings*))
      (__var0 == 1)
    end

    def case_sensitive
      __var0 = LibGtkSource.search_settings_get_case_sensitive(@pointer.as(LibGtkSource::SearchSettings*))
      (__var0 == 1)
    end

    def regex_enabled
      __var0 = LibGtkSource.search_settings_get_regex_enabled(@pointer.as(LibGtkSource::SearchSettings*))
      (__var0 == 1)
    end

    def search_text
      __var0 = LibGtkSource.search_settings_get_search_text(@pointer.as(LibGtkSource::SearchSettings*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def wrap_around
      __var0 = LibGtkSource.search_settings_get_wrap_around(@pointer.as(LibGtkSource::SearchSettings*))
      (__var0 == 1)
    end

    def at_word_boundaries=(at_word_boundaries : ::Bool)
      LibGtkSource.search_settings_set_at_word_boundaries(@pointer.as(LibGtkSource::SearchSettings*), LibC::Int.new(at_word_boundaries ? 1 : 0))
      nil
    end

    def case_sensitive=(case_sensitive : ::Bool)
      LibGtkSource.search_settings_set_case_sensitive(@pointer.as(LibGtkSource::SearchSettings*), LibC::Int.new(case_sensitive ? 1 : 0))
      nil
    end

    def regex_enabled=(regex_enabled : ::Bool)
      LibGtkSource.search_settings_set_regex_enabled(@pointer.as(LibGtkSource::SearchSettings*), LibC::Int.new(regex_enabled ? 1 : 0))
      nil
    end

    def search_text=(search_text : ::String?)
      LibGtkSource.search_settings_set_search_text(@pointer.as(LibGtkSource::SearchSettings*), search_text ? search_text.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def wrap_around=(wrap_around : ::Bool)
      LibGtkSource.search_settings_set_wrap_around(@pointer.as(LibGtkSource::SearchSettings*), LibC::Int.new(wrap_around ? 1 : 0))
      nil
    end
  end

  class SearchSettingsClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(216u64, 0u8).as(LibGtkSource::SearchSettingsClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::SearchSettingsClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::SearchSettingsClass*)
    end

    def to_unsafe_searchsettingsclass
      @pointer.not_nil!.as(LibGtkSource::SearchSettingsClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGtkSource::SearchSettingsClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::SearchSettingsClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class SearchSettingsPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::SearchSettingsPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::SearchSettingsPrivate*)
    end

    def to_unsafe_searchsettingsprivate
      @pointer.not_nil!.as(LibGtkSource::SearchSettingsPrivate*)
    end
  end

  enum SmartHomeEndType : UInt32
    DISABLED = 0
    BEFORE   = 1
    AFTER    = 2
    ALWAYS   = 3
  end

  @[Flags]
  enum SortFlags : UInt32
    NONE              = 0
    CASE_SENSITIVE    = 1
    REVERSE_ORDER     = 2
    REMOVE_DUPLICATES = 4
  end

  class SpaceDrawer < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGtkSource::SpaceDrawer*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceSpaceDrawer")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_space_drawer_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::SpaceDrawer*)
    end

    def to_unsafe_spacedrawer
      @pointer.not_nil!.as(LibGtkSource::SpaceDrawer*)
    end

    def initialize(*, enable_matrix : ::Bool? = nil, matrix : GLib::Variant? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless enable_matrix.nil?
        __var0 << "enable-matrix".to_unsafe
        __var1 << enable_matrix.to_gvalue.to_unsafe.value
      end

      unless matrix.nil?
        __var0 << "matrix".to_unsafe
        __var1 << matrix.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_space_drawer_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new : self
      __var0 = LibGtkSource.space_drawer_new
      GObject.raise_unexpected_null("gtk_source_space_drawer_new") if __var0.null?
      cast(GtkSource::SpaceDrawer.new(__var0))
    end

    def bind_matrix_setting(settings : Gio::Settings, key : ::String, flags : Gio::SettingsBindFlags)
      LibGtkSource.space_drawer_bind_matrix_setting(@pointer.as(LibGtkSource::SpaceDrawer*), settings.to_unsafe_settings, key.to_unsafe, flags)
      nil
    end

    def enable_matrix
      __var0 = LibGtkSource.space_drawer_get_enable_matrix(@pointer.as(LibGtkSource::SpaceDrawer*))
      (__var0 == 1)
    end

    def matrix
      __var0 = LibGtkSource.space_drawer_get_matrix(@pointer.as(LibGtkSource::SpaceDrawer*))
      GObject.raise_unexpected_null("gtk_source_space_drawer_get_matrix") if __var0.null?
      GLib::Variant.new(__var0)
    end

    def types_for_locations(locations : GtkSource::SpaceLocationFlags)
      __var0 = LibGtkSource.space_drawer_get_types_for_locations(@pointer.as(LibGtkSource::SpaceDrawer*), locations)
      GtkSource::SpaceTypeFlags.new(__var0)
    end

    def enable_matrix=(enable_matrix : ::Bool)
      LibGtkSource.space_drawer_set_enable_matrix(@pointer.as(LibGtkSource::SpaceDrawer*), LibC::Int.new(enable_matrix ? 1 : 0))
      nil
    end

    def matrix=(matrix : GLib::Variant?)
      LibGtkSource.space_drawer_set_matrix(@pointer.as(LibGtkSource::SpaceDrawer*), matrix ? matrix.to_unsafe.as(LibGLib::Variant*) : Pointer(LibGLib::Variant).null)
      nil
    end

    def set_types_for_locations(locations : GtkSource::SpaceLocationFlags, types : GtkSource::SpaceTypeFlags)
      LibGtkSource.space_drawer_set_types_for_locations(@pointer.as(LibGtkSource::SpaceDrawer*), locations, types)
      nil
    end
  end

  class SpaceDrawerClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(296u64, 0u8).as(LibGtkSource::SpaceDrawerClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::SpaceDrawerClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::SpaceDrawerClass*)
    end

    def to_unsafe_spacedrawerclass
      @pointer.not_nil!.as(LibGtkSource::SpaceDrawerClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGtkSource::SpaceDrawerClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::SpaceDrawerClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class SpaceDrawerPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::SpaceDrawerPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::SpaceDrawerPrivate*)
    end

    def to_unsafe_spacedrawerprivate
      @pointer.not_nil!.as(LibGtkSource::SpaceDrawerPrivate*)
    end
  end

  @[Flags]
  enum SpaceLocationFlags : UInt32
    NONE        = 0
    LEADING     = 1
    INSIDE_TEXT = 2
    TRAILING    = 4
    ALL         = 7
  end

  @[Flags]
  enum SpaceTypeFlags : UInt32
    NONE    =  0
    SPACE   =  1
    TAB     =  2
    NEWLINE =  4
    NBSP    =  8
    ALL     = 15
  end

  class Style < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGtkSource::Style*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceStyle")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_style_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::Style*)
    end

    def to_unsafe_style
      @pointer.not_nil!.as(LibGtkSource::Style*)
    end

    def initialize(*, background : ::String? = nil, background_set : ::Bool? = nil, bold : ::Bool? = nil, bold_set : ::Bool? = nil, foreground : ::String? = nil, foreground_set : ::Bool? = nil, italic : ::Bool? = nil, italic_set : ::Bool? = nil, line_background : ::String? = nil, line_background_set : ::Bool? = nil, pango_underline : Pango::Underline? = nil, scale : ::String? = nil, scale_set : ::Bool? = nil, strikethrough : ::Bool? = nil, strikethrough_set : ::Bool? = nil, underline_color : ::String? = nil, underline_color_set : ::Bool? = nil, underline_set : ::Bool? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless background.nil?
        __var0 << "background".to_unsafe
        __var1 << background.to_gvalue.to_unsafe.value
      end

      unless background_set.nil?
        __var0 << "background-set".to_unsafe
        __var1 << background_set.to_gvalue.to_unsafe.value
      end

      unless bold.nil?
        __var0 << "bold".to_unsafe
        __var1 << bold.to_gvalue.to_unsafe.value
      end

      unless bold_set.nil?
        __var0 << "bold-set".to_unsafe
        __var1 << bold_set.to_gvalue.to_unsafe.value
      end

      unless foreground.nil?
        __var0 << "foreground".to_unsafe
        __var1 << foreground.to_gvalue.to_unsafe.value
      end

      unless foreground_set.nil?
        __var0 << "foreground-set".to_unsafe
        __var1 << foreground_set.to_gvalue.to_unsafe.value
      end

      unless italic.nil?
        __var0 << "italic".to_unsafe
        __var1 << italic.to_gvalue.to_unsafe.value
      end

      unless italic_set.nil?
        __var0 << "italic-set".to_unsafe
        __var1 << italic_set.to_gvalue.to_unsafe.value
      end

      unless line_background.nil?
        __var0 << "line-background".to_unsafe
        __var1 << line_background.to_gvalue.to_unsafe.value
      end

      unless line_background_set.nil?
        __var0 << "line-background-set".to_unsafe
        __var1 << line_background_set.to_gvalue.to_unsafe.value
      end

      unless pango_underline.nil?
        __var0 << "pango-underline".to_unsafe
        __var1 << pango_underline.to_gvalue.to_unsafe.value
      end

      unless scale.nil?
        __var0 << "scale".to_unsafe
        __var1 << scale.to_gvalue.to_unsafe.value
      end

      unless scale_set.nil?
        __var0 << "scale-set".to_unsafe
        __var1 << scale_set.to_gvalue.to_unsafe.value
      end

      unless strikethrough.nil?
        __var0 << "strikethrough".to_unsafe
        __var1 << strikethrough.to_gvalue.to_unsafe.value
      end

      unless strikethrough_set.nil?
        __var0 << "strikethrough-set".to_unsafe
        __var1 << strikethrough_set.to_gvalue.to_unsafe.value
      end

      unless underline_color.nil?
        __var0 << "underline-color".to_unsafe
        __var1 << underline_color.to_gvalue.to_unsafe.value
      end

      unless underline_color_set.nil?
        __var0 << "underline-color-set".to_unsafe
        __var1 << underline_color_set.to_gvalue.to_unsafe.value
      end

      unless underline_set.nil?
        __var0 << "underline-set".to_unsafe
        __var1 << underline_set.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_style_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def apply(tag : Gtk::TextTag)
      LibGtkSource.style_apply(@pointer.as(LibGtkSource::Style*), tag.to_unsafe_texttag)
      nil
    end

    def copy
      __var0 = LibGtkSource.style_copy(@pointer.as(LibGtkSource::Style*))
      GObject.raise_unexpected_null("gtk_source_style_copy") if __var0.null?
      GtkSource::Style.new(__var0)
    end

    def background : ::String
      __var0 = GObject::Value.new(type: GObject::Type::UTF8)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "background", __var0)
      __var0.string
    end

    def background_set : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "background-set", __var0)
      __var0.boolean
    end

    def bold : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "bold", __var0)
      __var0.boolean
    end

    def bold_set : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "bold-set", __var0)
      __var0.boolean
    end

    def foreground : ::String
      __var0 = GObject::Value.new(type: GObject::Type::UTF8)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "foreground", __var0)
      __var0.string
    end

    def foreground_set : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "foreground-set", __var0)
      __var0.boolean
    end

    def italic : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "italic", __var0)
      __var0.boolean
    end

    def italic_set : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "italic-set", __var0)
      __var0.boolean
    end

    def line_background : ::String
      __var0 = GObject::Value.new(type: GObject::Type::UTF8)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "line-background", __var0)
      __var0.string
    end

    def line_background_set : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "line-background-set", __var0)
      __var0.boolean
    end

    def pango_underline : Pango::Underline
      __var0 = GObject::Value.new(type: GObject::Type::ENUM)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "pango-underline", __var0)
      Pango::Underline.new(UInt32.new(__var0.enum))
    end

    def scale : ::String
      __var0 = GObject::Value.new(type: GObject::Type::UTF8)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "scale", __var0)
      __var0.string
    end

    def scale_set : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "scale-set", __var0)
      __var0.boolean
    end

    def strikethrough : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "strikethrough", __var0)
      __var0.boolean
    end

    def strikethrough_set : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "strikethrough-set", __var0)
      __var0.boolean
    end

    def underline_color : ::String
      __var0 = GObject::Value.new(type: GObject::Type::UTF8)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "underline-color", __var0)
      __var0.string
    end

    def underline_color_set : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "underline-color-set", __var0)
      __var0.boolean
    end

    def underline_set : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "underline-set", __var0)
      __var0.boolean
    end
  end

  class StyleClass
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::StyleClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::StyleClass*)
    end

    def to_unsafe_styleclass
      @pointer.not_nil!.as(LibGtkSource::StyleClass*)
    end
  end

  class StyleScheme < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGtkSource::StyleScheme*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceStyleScheme")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_style_scheme_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::StyleScheme*)
    end

    def to_unsafe_stylescheme
      @pointer.not_nil!.as(LibGtkSource::StyleScheme*)
    end

    def initialize(*, id : ::String? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless id.nil?
        __var0 << "id".to_unsafe
        __var1 << id.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_style_scheme_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def authors
      __var0 = LibGtkSource.style_scheme_get_authors(@pointer.as(LibGtkSource::StyleScheme*))
      __var2 = GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      } if __var0
      __var2
    end

    def description
      __var0 = LibGtkSource.style_scheme_get_description(@pointer.as(LibGtkSource::StyleScheme*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def filename
      __var0 = LibGtkSource.style_scheme_get_filename(@pointer.as(LibGtkSource::StyleScheme*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def id
      __var0 = LibGtkSource.style_scheme_get_id(@pointer.as(LibGtkSource::StyleScheme*))
      GObject.raise_unexpected_null("gtk_source_style_scheme_get_id") if __var0.null?
      ::String.new(__var0)
    end

    def name
      __var0 = LibGtkSource.style_scheme_get_name(@pointer.as(LibGtkSource::StyleScheme*))
      GObject.raise_unexpected_null("gtk_source_style_scheme_get_name") if __var0.null?
      ::String.new(__var0)
    end

    def style(style_id : ::String)
      __var0 = LibGtkSource.style_scheme_get_style(@pointer.as(LibGtkSource::StyleScheme*), style_id.to_unsafe)
      __var1 = GtkSource::Style.new(__var0) if __var0
      __var1
    end
  end

  module StyleSchemeChooser
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include StyleSchemeChooser
      @pointer : Void*

      def initialize(pointer : LibGtkSource::StyleSchemeChooser*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a GtkSourceStyleSchemeChooser")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_style_scheme_chooser_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibGtkSource::StyleSchemeChooser*)
      end

      def to_unsafe_styleschemechooser
        @pointer.not_nil!.as(LibGtkSource::StyleSchemeChooser*)
      end
    end

    def to_unsafe_styleschemechooser
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeChooser*)
    end

    def style_scheme
      __var0 = LibGtkSource.style_scheme_chooser_get_style_scheme(@pointer.as(LibGtkSource::StyleSchemeChooser*))
      GObject.raise_unexpected_null("gtk_source_style_scheme_chooser_get_style_scheme") if __var0.null?
      GtkSource::StyleScheme.new(__var0)
    end

    def style_scheme=(scheme : GtkSource::StyleScheme)
      LibGtkSource.style_scheme_chooser_set_style_scheme(@pointer.as(LibGtkSource::StyleSchemeChooser*), scheme.to_unsafe_stylescheme)
      nil
    end
  end

  class StyleSchemeChooserButton < Gtk::Button
    include Atk::ImplementorIface
    include Gtk::Actionable
    include Gtk::Activatable
    include Gtk::Buildable
    include GtkSource::StyleSchemeChooser

    @pointer : Void*

    def initialize(pointer : LibGtkSource::StyleSchemeChooserButton*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceStyleSchemeChooserButton")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_style_scheme_chooser_button_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeChooserButton*)
    end

    def to_unsafe_styleschemechooserbutton
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeChooserButton*)
    end

    def initialize(*, action_name : ::String? = nil, action_target : GLib::Variant? = nil, always_show_image : ::Bool? = nil, app_paintable : ::Bool? = nil, border_width : UInt32? = nil, can_default : ::Bool? = nil, can_focus : ::Bool? = nil, child : Gtk::Widget? = nil, double_buffered : ::Bool? = nil, events : Gdk::EventMask? = nil, expand : ::Bool? = nil, focus_on_click : ::Bool? = nil, halign : Gtk::Align? = nil, has_default : ::Bool? = nil, has_focus : ::Bool? = nil, has_tooltip : ::Bool? = nil, height_request : Int32? = nil, hexpand : ::Bool? = nil, hexpand_set : ::Bool? = nil, image : Gtk::Widget? = nil, image_position : Gtk::PositionType? = nil, is_focus : ::Bool? = nil, label : ::String? = nil, margin : Int32? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_left : Int32? = nil, margin_right : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, no_show_all : ::Bool? = nil, opacity : Float64? = nil, parent : Gtk::Container? = nil, receives_default : ::Bool? = nil, related_action : Gtk::Action? = nil, relief : Gtk::ReliefStyle? = nil, resize_mode : Gtk::ResizeMode? = nil, sensitive : ::Bool? = nil, style : Gtk::Style? = nil, style_scheme : GtkSource::StyleScheme? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, use_action_appearance : ::Bool? = nil, use_stock : ::Bool? = nil, use_underline : ::Bool? = nil, valign : Gtk::Align? = nil, vexpand : ::Bool? = nil, vexpand_set : ::Bool? = nil, visible : ::Bool? = nil, width_request : Int32? = nil, xalign : Float32? = nil, yalign : Float32? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless action_name.nil?
        __var0 << "action-name".to_unsafe
        __var1 << action_name.to_gvalue.to_unsafe.value
      end

      unless action_target.nil?
        __var0 << "action-target".to_unsafe
        __var1 << action_target.to_gvalue.to_unsafe.value
      end

      unless always_show_image.nil?
        __var0 << "always-show-image".to_unsafe
        __var1 << always_show_image.to_gvalue.to_unsafe.value
      end

      unless app_paintable.nil?
        __var0 << "app-paintable".to_unsafe
        __var1 << app_paintable.to_gvalue.to_unsafe.value
      end

      unless border_width.nil?
        __var0 << "border-width".to_unsafe
        __var1 << border_width.to_gvalue.to_unsafe.value
      end

      unless can_default.nil?
        __var0 << "can-default".to_unsafe
        __var1 << can_default.to_gvalue.to_unsafe.value
      end

      unless can_focus.nil?
        __var0 << "can-focus".to_unsafe
        __var1 << can_focus.to_gvalue.to_unsafe.value
      end

      unless child.nil?
        __var0 << "child".to_unsafe
        __var1 << child.to_gvalue.to_unsafe.value
      end

      unless double_buffered.nil?
        __var0 << "double-buffered".to_unsafe
        __var1 << double_buffered.to_gvalue.to_unsafe.value
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

      unless image.nil?
        __var0 << "image".to_unsafe
        __var1 << image.to_gvalue.to_unsafe.value
      end

      unless image_position.nil?
        __var0 << "image-position".to_unsafe
        __var1 << image_position.to_gvalue.to_unsafe.value
      end

      unless is_focus.nil?
        __var0 << "is-focus".to_unsafe
        __var1 << is_focus.to_gvalue.to_unsafe.value
      end

      unless label.nil?
        __var0 << "label".to_unsafe
        __var1 << label.to_gvalue.to_unsafe.value
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

      unless receives_default.nil?
        __var0 << "receives-default".to_unsafe
        __var1 << receives_default.to_gvalue.to_unsafe.value
      end

      unless related_action.nil?
        __var0 << "related-action".to_unsafe
        __var1 << related_action.to_gvalue.to_unsafe.value
      end

      unless relief.nil?
        __var0 << "relief".to_unsafe
        __var1 << relief.to_gvalue.to_unsafe.value
      end

      unless resize_mode.nil?
        __var0 << "resize-mode".to_unsafe
        __var1 << resize_mode.to_gvalue.to_unsafe.value
      end

      unless sensitive.nil?
        __var0 << "sensitive".to_unsafe
        __var1 << sensitive.to_gvalue.to_unsafe.value
      end

      unless style.nil?
        __var0 << "style".to_unsafe
        __var1 << style.to_gvalue.to_unsafe.value
      end

      unless style_scheme.nil?
        __var0 << "style-scheme".to_unsafe
        __var1 << style_scheme.to_gvalue.to_unsafe.value
      end

      unless tooltip_markup.nil?
        __var0 << "tooltip-markup".to_unsafe
        __var1 << tooltip_markup.to_gvalue.to_unsafe.value
      end

      unless tooltip_text.nil?
        __var0 << "tooltip-text".to_unsafe
        __var1 << tooltip_text.to_gvalue.to_unsafe.value
      end

      unless use_action_appearance.nil?
        __var0 << "use-action-appearance".to_unsafe
        __var1 << use_action_appearance.to_gvalue.to_unsafe.value
      end

      unless use_stock.nil?
        __var0 << "use-stock".to_unsafe
        __var1 << use_stock.to_gvalue.to_unsafe.value
      end

      unless use_underline.nil?
        __var0 << "use-underline".to_unsafe
        __var1 << use_underline.to_gvalue.to_unsafe.value
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

      unless width_request.nil?
        __var0 << "width-request".to_unsafe
        __var1 << width_request.to_gvalue.to_unsafe.value
      end

      unless xalign.nil?
        __var0 << "xalign".to_unsafe
        __var1 << xalign.to_gvalue.to_unsafe.value
      end

      unless yalign.nil?
        __var0 << "yalign".to_unsafe
        __var1 << yalign.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_style_scheme_chooser_button_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new : self
      __var0 = LibGtkSource.style_scheme_chooser_button_new
      GObject.raise_unexpected_null("gtk_source_style_scheme_chooser_button_new") if __var0.null?
      cast(Gtk::Widget.new(__var0))
    end
  end

  class StyleSchemeChooserButtonClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(1168u64, 0u8).as(LibGtkSource::StyleSchemeChooserButtonClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::StyleSchemeChooserButtonClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeChooserButtonClass*)
    end

    def to_unsafe_styleschemechooserbuttonclass
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeChooserButtonClass*)
    end

    def parent
      Gtk::ButtonClass.new(to_unsafe.as(LibGtkSource::StyleSchemeChooserButtonClass*).value.parent)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::StyleSchemeChooserButtonClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class StyleSchemeChooserInterface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(128u64, 0u8).as(LibGtkSource::StyleSchemeChooserInterface*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::StyleSchemeChooserInterface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeChooserInterface*)
    end

    def to_unsafe_styleschemechooserinterface
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeChooserInterface*)
    end

    def base_interface
      GObject::TypeInterface.new(to_unsafe.as(LibGtkSource::StyleSchemeChooserInterface*).value.base_interface)
    end

    def get_style_scheme
      to_unsafe.as(LibGtkSource::StyleSchemeChooserInterface*).value.get_style_scheme
    end

    def set_style_scheme
      to_unsafe.as(LibGtkSource::StyleSchemeChooserInterface*).value.set_style_scheme
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::StyleSchemeChooserInterface*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class StyleSchemeChooserWidget < Gtk::Bin
    include Atk::ImplementorIface
    include Gtk::Buildable
    include GtkSource::StyleSchemeChooser

    @pointer : Void*

    def initialize(pointer : LibGtkSource::StyleSchemeChooserWidget*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceStyleSchemeChooserWidget")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_style_scheme_chooser_widget_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeChooserWidget*)
    end

    def to_unsafe_styleschemechooserwidget
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeChooserWidget*)
    end

    def initialize(*, app_paintable : ::Bool? = nil, border_width : UInt32? = nil, can_default : ::Bool? = nil, can_focus : ::Bool? = nil, child : Gtk::Widget? = nil, double_buffered : ::Bool? = nil, events : Gdk::EventMask? = nil, expand : ::Bool? = nil, focus_on_click : ::Bool? = nil, halign : Gtk::Align? = nil, has_default : ::Bool? = nil, has_focus : ::Bool? = nil, has_tooltip : ::Bool? = nil, height_request : Int32? = nil, hexpand : ::Bool? = nil, hexpand_set : ::Bool? = nil, is_focus : ::Bool? = nil, margin : Int32? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_left : Int32? = nil, margin_right : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, no_show_all : ::Bool? = nil, opacity : Float64? = nil, parent : Gtk::Container? = nil, receives_default : ::Bool? = nil, resize_mode : Gtk::ResizeMode? = nil, sensitive : ::Bool? = nil, style : Gtk::Style? = nil, style_scheme : GtkSource::StyleScheme? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : ::Bool? = nil, vexpand_set : ::Bool? = nil, visible : ::Bool? = nil, width_request : Int32? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless app_paintable.nil?
        __var0 << "app-paintable".to_unsafe
        __var1 << app_paintable.to_gvalue.to_unsafe.value
      end

      unless border_width.nil?
        __var0 << "border-width".to_unsafe
        __var1 << border_width.to_gvalue.to_unsafe.value
      end

      unless can_default.nil?
        __var0 << "can-default".to_unsafe
        __var1 << can_default.to_gvalue.to_unsafe.value
      end

      unless can_focus.nil?
        __var0 << "can-focus".to_unsafe
        __var1 << can_focus.to_gvalue.to_unsafe.value
      end

      unless child.nil?
        __var0 << "child".to_unsafe
        __var1 << child.to_gvalue.to_unsafe.value
      end

      unless double_buffered.nil?
        __var0 << "double-buffered".to_unsafe
        __var1 << double_buffered.to_gvalue.to_unsafe.value
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

      unless receives_default.nil?
        __var0 << "receives-default".to_unsafe
        __var1 << receives_default.to_gvalue.to_unsafe.value
      end

      unless resize_mode.nil?
        __var0 << "resize-mode".to_unsafe
        __var1 << resize_mode.to_gvalue.to_unsafe.value
      end

      unless sensitive.nil?
        __var0 << "sensitive".to_unsafe
        __var1 << sensitive.to_gvalue.to_unsafe.value
      end

      unless style.nil?
        __var0 << "style".to_unsafe
        __var1 << style.to_gvalue.to_unsafe.value
      end

      unless style_scheme.nil?
        __var0 << "style-scheme".to_unsafe
        __var1 << style_scheme.to_gvalue.to_unsafe.value
      end

      unless tooltip_markup.nil?
        __var0 << "tooltip-markup".to_unsafe
        __var1 << tooltip_markup.to_gvalue.to_unsafe.value
      end

      unless tooltip_text.nil?
        __var0 << "tooltip-text".to_unsafe
        __var1 << tooltip_text.to_gvalue.to_unsafe.value
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

      unless width_request.nil?
        __var0 << "width-request".to_unsafe
        __var1 << width_request.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_style_scheme_chooser_widget_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new : self
      __var0 = LibGtkSource.style_scheme_chooser_widget_new
      GObject.raise_unexpected_null("gtk_source_style_scheme_chooser_widget_new") if __var0.null?
      cast(Gtk::Widget.new(__var0))
    end
  end

  class StyleSchemeChooserWidgetClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(1088u64, 0u8).as(LibGtkSource::StyleSchemeChooserWidgetClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::StyleSchemeChooserWidgetClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeChooserWidgetClass*)
    end

    def to_unsafe_styleschemechooserwidgetclass
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeChooserWidgetClass*)
    end

    def parent
      Gtk::BinClass.new(to_unsafe.as(LibGtkSource::StyleSchemeChooserWidgetClass*).value.parent)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::StyleSchemeChooserWidgetClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class StyleSchemeClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(216u64, 0u8).as(LibGtkSource::StyleSchemeClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::StyleSchemeClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeClass*)
    end

    def to_unsafe_styleschemeclass
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeClass*)
    end

    def base_class
      GObject::ObjectClass.new(to_unsafe.as(LibGtkSource::StyleSchemeClass*).value.base_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::StyleSchemeClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class StyleSchemeManager < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGtkSource::StyleSchemeManager*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceStyleSchemeManager")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_style_scheme_manager_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeManager*)
    end

    def to_unsafe_styleschememanager
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeManager*)
    end

    def initialize(*, search_path : ::Enumerable(::String)? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless search_path.nil?
        __var0 << "search-path".to_unsafe
        __var1 << search_path.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_style_scheme_manager_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new : self
      __var0 = LibGtkSource.style_scheme_manager_new
      GObject.raise_unexpected_null("gtk_source_style_scheme_manager_new") if __var0.null?
      cast(GtkSource::StyleSchemeManager.new(__var0))
    end

    def self.default
      __var0 = LibGtkSource.style_scheme_manager_get_default
      GObject.raise_unexpected_null("gtk_source_style_scheme_manager_get_default") if __var0.null?
      GtkSource::StyleSchemeManager.new(__var0)
    end

    def append_search_path(path : ::String)
      LibGtkSource.style_scheme_manager_append_search_path(@pointer.as(LibGtkSource::StyleSchemeManager*), path.to_unsafe)
      nil
    end

    def force_rescan
      LibGtkSource.style_scheme_manager_force_rescan(@pointer.as(LibGtkSource::StyleSchemeManager*))
      nil
    end

    def scheme(scheme_id : ::String)
      __var0 = LibGtkSource.style_scheme_manager_get_scheme(@pointer.as(LibGtkSource::StyleSchemeManager*), scheme_id.to_unsafe)
      GObject.raise_unexpected_null("gtk_source_style_scheme_manager_get_scheme") if __var0.null?
      GtkSource::StyleScheme.new(__var0)
    end

    def scheme_ids
      __var0 = LibGtkSource.style_scheme_manager_get_scheme_ids(@pointer.as(LibGtkSource::StyleSchemeManager*))
      __var2 = GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      } if __var0
      __var2
    end

    def search_path
      __var0 = LibGtkSource.style_scheme_manager_get_search_path(@pointer.as(LibGtkSource::StyleSchemeManager*))
      GObject.raise_unexpected_null("gtk_source_style_scheme_manager_get_search_path") if __var0.null?
      GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      }
    end

    def prepend_search_path(path : ::String)
      LibGtkSource.style_scheme_manager_prepend_search_path(@pointer.as(LibGtkSource::StyleSchemeManager*), path.to_unsafe)
      nil
    end

    def search_path=(path : ::Enumerable?)
      LibGtkSource.style_scheme_manager_set_search_path(@pointer.as(LibGtkSource::StyleSchemeManager*), path ? (__path_ary = path.map { |__item| __item.to_unsafe }.to_a).to_unsafe : Pointer(Pointer(UInt8)).null)
      nil
    end
  end

  class StyleSchemeManagerClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(216u64, 0u8).as(LibGtkSource::StyleSchemeManagerClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::StyleSchemeManagerClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeManagerClass*)
    end

    def to_unsafe_styleschememanagerclass
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeManagerClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGtkSource::StyleSchemeManagerClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::StyleSchemeManagerClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  class StyleSchemeManagerPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::StyleSchemeManagerPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeManagerPrivate*)
    end

    def to_unsafe_styleschememanagerprivate
      @pointer.not_nil!.as(LibGtkSource::StyleSchemeManagerPrivate*)
    end
  end

  class StyleSchemePrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::StyleSchemePrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::StyleSchemePrivate*)
    end

    def to_unsafe_styleschemeprivate
      @pointer.not_nil!.as(LibGtkSource::StyleSchemePrivate*)
    end
  end

  class Tag < Gtk::TextTag
    @pointer : Void*

    def initialize(pointer : LibGtkSource::Tag*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceTag")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_tag_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::Tag*)
    end

    def to_unsafe_tag
      @pointer.not_nil!.as(LibGtkSource::Tag*)
    end

    def initialize(*, accumulative_margin : ::Bool? = nil, background : ::String? = nil, background_full_height : ::Bool? = nil, background_full_height_set : ::Bool? = nil, background_gdk : Gdk::Color? = nil, background_rgba : Gdk::RGBA? = nil, background_set : ::Bool? = nil, direction : Gtk::TextDirection? = nil, draw_spaces : ::Bool? = nil, draw_spaces_set : ::Bool? = nil, editable : ::Bool? = nil, editable_set : ::Bool? = nil, fallback : ::Bool? = nil, fallback_set : ::Bool? = nil, family : ::String? = nil, family_set : ::Bool? = nil, font : ::String? = nil, font_desc : Pango::FontDescription? = nil, font_features : ::String? = nil, font_features_set : ::Bool? = nil, foreground : ::String? = nil, foreground_gdk : Gdk::Color? = nil, foreground_rgba : Gdk::RGBA? = nil, foreground_set : ::Bool? = nil, indent : Int32? = nil, indent_set : ::Bool? = nil, invisible : ::Bool? = nil, invisible_set : ::Bool? = nil, justification : Gtk::Justification? = nil, justification_set : ::Bool? = nil, language : ::String? = nil, language_set : ::Bool? = nil, left_margin : Int32? = nil, left_margin_set : ::Bool? = nil, letter_spacing : Int32? = nil, letter_spacing_set : ::Bool? = nil, name : ::String? = nil, paragraph_background : ::String? = nil, paragraph_background_gdk : Gdk::Color? = nil, paragraph_background_rgba : Gdk::RGBA? = nil, paragraph_background_set : ::Bool? = nil, pixels_above_lines : Int32? = nil, pixels_above_lines_set : ::Bool? = nil, pixels_below_lines : Int32? = nil, pixels_below_lines_set : ::Bool? = nil, pixels_inside_wrap : Int32? = nil, pixels_inside_wrap_set : ::Bool? = nil, right_margin : Int32? = nil, right_margin_set : ::Bool? = nil, rise : Int32? = nil, rise_set : ::Bool? = nil, scale : Float64? = nil, scale_set : ::Bool? = nil, size : Int32? = nil, size_points : Float64? = nil, size_set : ::Bool? = nil, stretch : Pango::Stretch? = nil, stretch_set : ::Bool? = nil, strikethrough : ::Bool? = nil, strikethrough_rgba : Gdk::RGBA? = nil, strikethrough_rgba_set : ::Bool? = nil, strikethrough_set : ::Bool? = nil, style : Pango::Style? = nil, style_set : ::Bool? = nil, tabs : Pango::TabArray? = nil, tabs_set : ::Bool? = nil, underline : Pango::Underline? = nil, underline_rgba : Gdk::RGBA? = nil, underline_rgba_set : ::Bool? = nil, underline_set : ::Bool? = nil, variant : Pango::Variant? = nil, variant_set : ::Bool? = nil, weight : Int32? = nil, weight_set : ::Bool? = nil, wrap_mode : Gtk::WrapMode? = nil, wrap_mode_set : ::Bool? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless accumulative_margin.nil?
        __var0 << "accumulative-margin".to_unsafe
        __var1 << accumulative_margin.to_gvalue.to_unsafe.value
      end

      unless background.nil?
        __var0 << "background".to_unsafe
        __var1 << background.to_gvalue.to_unsafe.value
      end

      unless background_full_height.nil?
        __var0 << "background-full-height".to_unsafe
        __var1 << background_full_height.to_gvalue.to_unsafe.value
      end

      unless background_full_height_set.nil?
        __var0 << "background-full-height-set".to_unsafe
        __var1 << background_full_height_set.to_gvalue.to_unsafe.value
      end

      unless background_gdk.nil?
        __var0 << "background-gdk".to_unsafe
        __var1 << background_gdk.to_gvalue.to_unsafe.value
      end

      unless background_rgba.nil?
        __var0 << "background-rgba".to_unsafe
        __var1 << background_rgba.to_gvalue.to_unsafe.value
      end

      unless background_set.nil?
        __var0 << "background-set".to_unsafe
        __var1 << background_set.to_gvalue.to_unsafe.value
      end

      unless direction.nil?
        __var0 << "direction".to_unsafe
        __var1 << direction.to_gvalue.to_unsafe.value
      end

      unless draw_spaces.nil?
        __var0 << "draw-spaces".to_unsafe
        __var1 << draw_spaces.to_gvalue.to_unsafe.value
      end

      unless draw_spaces_set.nil?
        __var0 << "draw-spaces-set".to_unsafe
        __var1 << draw_spaces_set.to_gvalue.to_unsafe.value
      end

      unless editable.nil?
        __var0 << "editable".to_unsafe
        __var1 << editable.to_gvalue.to_unsafe.value
      end

      unless editable_set.nil?
        __var0 << "editable-set".to_unsafe
        __var1 << editable_set.to_gvalue.to_unsafe.value
      end

      unless fallback.nil?
        __var0 << "fallback".to_unsafe
        __var1 << fallback.to_gvalue.to_unsafe.value
      end

      unless fallback_set.nil?
        __var0 << "fallback-set".to_unsafe
        __var1 << fallback_set.to_gvalue.to_unsafe.value
      end

      unless family.nil?
        __var0 << "family".to_unsafe
        __var1 << family.to_gvalue.to_unsafe.value
      end

      unless family_set.nil?
        __var0 << "family-set".to_unsafe
        __var1 << family_set.to_gvalue.to_unsafe.value
      end

      unless font.nil?
        __var0 << "font".to_unsafe
        __var1 << font.to_gvalue.to_unsafe.value
      end

      unless font_desc.nil?
        __var0 << "font-desc".to_unsafe
        __var1 << font_desc.to_gvalue.to_unsafe.value
      end

      unless font_features.nil?
        __var0 << "font-features".to_unsafe
        __var1 << font_features.to_gvalue.to_unsafe.value
      end

      unless font_features_set.nil?
        __var0 << "font-features-set".to_unsafe
        __var1 << font_features_set.to_gvalue.to_unsafe.value
      end

      unless foreground.nil?
        __var0 << "foreground".to_unsafe
        __var1 << foreground.to_gvalue.to_unsafe.value
      end

      unless foreground_gdk.nil?
        __var0 << "foreground-gdk".to_unsafe
        __var1 << foreground_gdk.to_gvalue.to_unsafe.value
      end

      unless foreground_rgba.nil?
        __var0 << "foreground-rgba".to_unsafe
        __var1 << foreground_rgba.to_gvalue.to_unsafe.value
      end

      unless foreground_set.nil?
        __var0 << "foreground-set".to_unsafe
        __var1 << foreground_set.to_gvalue.to_unsafe.value
      end

      unless indent.nil?
        __var0 << "indent".to_unsafe
        __var1 << indent.to_gvalue.to_unsafe.value
      end

      unless indent_set.nil?
        __var0 << "indent-set".to_unsafe
        __var1 << indent_set.to_gvalue.to_unsafe.value
      end

      unless invisible.nil?
        __var0 << "invisible".to_unsafe
        __var1 << invisible.to_gvalue.to_unsafe.value
      end

      unless invisible_set.nil?
        __var0 << "invisible-set".to_unsafe
        __var1 << invisible_set.to_gvalue.to_unsafe.value
      end

      unless justification.nil?
        __var0 << "justification".to_unsafe
        __var1 << justification.to_gvalue.to_unsafe.value
      end

      unless justification_set.nil?
        __var0 << "justification-set".to_unsafe
        __var1 << justification_set.to_gvalue.to_unsafe.value
      end

      unless language.nil?
        __var0 << "language".to_unsafe
        __var1 << language.to_gvalue.to_unsafe.value
      end

      unless language_set.nil?
        __var0 << "language-set".to_unsafe
        __var1 << language_set.to_gvalue.to_unsafe.value
      end

      unless left_margin.nil?
        __var0 << "left-margin".to_unsafe
        __var1 << left_margin.to_gvalue.to_unsafe.value
      end

      unless left_margin_set.nil?
        __var0 << "left-margin-set".to_unsafe
        __var1 << left_margin_set.to_gvalue.to_unsafe.value
      end

      unless letter_spacing.nil?
        __var0 << "letter-spacing".to_unsafe
        __var1 << letter_spacing.to_gvalue.to_unsafe.value
      end

      unless letter_spacing_set.nil?
        __var0 << "letter-spacing-set".to_unsafe
        __var1 << letter_spacing_set.to_gvalue.to_unsafe.value
      end

      unless name.nil?
        __var0 << "name".to_unsafe
        __var1 << name.to_gvalue.to_unsafe.value
      end

      unless paragraph_background.nil?
        __var0 << "paragraph-background".to_unsafe
        __var1 << paragraph_background.to_gvalue.to_unsafe.value
      end

      unless paragraph_background_gdk.nil?
        __var0 << "paragraph-background-gdk".to_unsafe
        __var1 << paragraph_background_gdk.to_gvalue.to_unsafe.value
      end

      unless paragraph_background_rgba.nil?
        __var0 << "paragraph-background-rgba".to_unsafe
        __var1 << paragraph_background_rgba.to_gvalue.to_unsafe.value
      end

      unless paragraph_background_set.nil?
        __var0 << "paragraph-background-set".to_unsafe
        __var1 << paragraph_background_set.to_gvalue.to_unsafe.value
      end

      unless pixels_above_lines.nil?
        __var0 << "pixels-above-lines".to_unsafe
        __var1 << pixels_above_lines.to_gvalue.to_unsafe.value
      end

      unless pixels_above_lines_set.nil?
        __var0 << "pixels-above-lines-set".to_unsafe
        __var1 << pixels_above_lines_set.to_gvalue.to_unsafe.value
      end

      unless pixels_below_lines.nil?
        __var0 << "pixels-below-lines".to_unsafe
        __var1 << pixels_below_lines.to_gvalue.to_unsafe.value
      end

      unless pixels_below_lines_set.nil?
        __var0 << "pixels-below-lines-set".to_unsafe
        __var1 << pixels_below_lines_set.to_gvalue.to_unsafe.value
      end

      unless pixels_inside_wrap.nil?
        __var0 << "pixels-inside-wrap".to_unsafe
        __var1 << pixels_inside_wrap.to_gvalue.to_unsafe.value
      end

      unless pixels_inside_wrap_set.nil?
        __var0 << "pixels-inside-wrap-set".to_unsafe
        __var1 << pixels_inside_wrap_set.to_gvalue.to_unsafe.value
      end

      unless right_margin.nil?
        __var0 << "right-margin".to_unsafe
        __var1 << right_margin.to_gvalue.to_unsafe.value
      end

      unless right_margin_set.nil?
        __var0 << "right-margin-set".to_unsafe
        __var1 << right_margin_set.to_gvalue.to_unsafe.value
      end

      unless rise.nil?
        __var0 << "rise".to_unsafe
        __var1 << rise.to_gvalue.to_unsafe.value
      end

      unless rise_set.nil?
        __var0 << "rise-set".to_unsafe
        __var1 << rise_set.to_gvalue.to_unsafe.value
      end

      unless scale.nil?
        __var0 << "scale".to_unsafe
        __var1 << scale.to_gvalue.to_unsafe.value
      end

      unless scale_set.nil?
        __var0 << "scale-set".to_unsafe
        __var1 << scale_set.to_gvalue.to_unsafe.value
      end

      unless size.nil?
        __var0 << "size".to_unsafe
        __var1 << size.to_gvalue.to_unsafe.value
      end

      unless size_points.nil?
        __var0 << "size-points".to_unsafe
        __var1 << size_points.to_gvalue.to_unsafe.value
      end

      unless size_set.nil?
        __var0 << "size-set".to_unsafe
        __var1 << size_set.to_gvalue.to_unsafe.value
      end

      unless stretch.nil?
        __var0 << "stretch".to_unsafe
        __var1 << stretch.to_gvalue.to_unsafe.value
      end

      unless stretch_set.nil?
        __var0 << "stretch-set".to_unsafe
        __var1 << stretch_set.to_gvalue.to_unsafe.value
      end

      unless strikethrough.nil?
        __var0 << "strikethrough".to_unsafe
        __var1 << strikethrough.to_gvalue.to_unsafe.value
      end

      unless strikethrough_rgba.nil?
        __var0 << "strikethrough-rgba".to_unsafe
        __var1 << strikethrough_rgba.to_gvalue.to_unsafe.value
      end

      unless strikethrough_rgba_set.nil?
        __var0 << "strikethrough-rgba-set".to_unsafe
        __var1 << strikethrough_rgba_set.to_gvalue.to_unsafe.value
      end

      unless strikethrough_set.nil?
        __var0 << "strikethrough-set".to_unsafe
        __var1 << strikethrough_set.to_gvalue.to_unsafe.value
      end

      unless style.nil?
        __var0 << "style".to_unsafe
        __var1 << style.to_gvalue.to_unsafe.value
      end

      unless style_set.nil?
        __var0 << "style-set".to_unsafe
        __var1 << style_set.to_gvalue.to_unsafe.value
      end

      unless tabs.nil?
        __var0 << "tabs".to_unsafe
        __var1 << tabs.to_gvalue.to_unsafe.value
      end

      unless tabs_set.nil?
        __var0 << "tabs-set".to_unsafe
        __var1 << tabs_set.to_gvalue.to_unsafe.value
      end

      unless underline.nil?
        __var0 << "underline".to_unsafe
        __var1 << underline.to_gvalue.to_unsafe.value
      end

      unless underline_rgba.nil?
        __var0 << "underline-rgba".to_unsafe
        __var1 << underline_rgba.to_gvalue.to_unsafe.value
      end

      unless underline_rgba_set.nil?
        __var0 << "underline-rgba-set".to_unsafe
        __var1 << underline_rgba_set.to_gvalue.to_unsafe.value
      end

      unless underline_set.nil?
        __var0 << "underline-set".to_unsafe
        __var1 << underline_set.to_gvalue.to_unsafe.value
      end

      unless variant.nil?
        __var0 << "variant".to_unsafe
        __var1 << variant.to_gvalue.to_unsafe.value
      end

      unless variant_set.nil?
        __var0 << "variant-set".to_unsafe
        __var1 << variant_set.to_gvalue.to_unsafe.value
      end

      unless weight.nil?
        __var0 << "weight".to_unsafe
        __var1 << weight.to_gvalue.to_unsafe.value
      end

      unless weight_set.nil?
        __var0 << "weight-set".to_unsafe
        __var1 << weight_set.to_gvalue.to_unsafe.value
      end

      unless wrap_mode.nil?
        __var0 << "wrap-mode".to_unsafe
        __var1 << wrap_mode.to_gvalue.to_unsafe.value
      end

      unless wrap_mode_set.nil?
        __var0 << "wrap-mode-set".to_unsafe
        __var1 << wrap_mode_set.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_tag_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new(name : ::String?) : self
      __var0 = LibGtkSource.tag_new(name ? name.to_unsafe : Pointer(UInt8).null)
      GObject.raise_unexpected_null("gtk_source_tag_new") if __var0.null?
      cast(Gtk::TextTag.new(__var0))
    end

    def draw_spaces : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "draw-spaces", __var0)
      __var0.boolean
    end

    def draw_spaces=(value : ::Bool)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "draw-spaces", value.to_gvalue)
    end

    def draw_spaces_set : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "draw-spaces-set", __var0)
      __var0.boolean
    end

    def draw_spaces_set=(value : ::Bool)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "draw-spaces-set", value.to_gvalue)
    end
  end

  class TagClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(256u64, 0u8).as(LibGtkSource::TagClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::TagClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::TagClass*)
    end

    def to_unsafe_tagclass
      @pointer.not_nil!.as(LibGtkSource::TagClass*)
    end

    def parent_class
      Gtk::TextTagClass.new(to_unsafe.as(LibGtkSource::TagClass*).value.parent_class)
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::TagClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  module UndoManager
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include UndoManager
      @pointer : Void*

      def initialize(pointer : LibGtkSource::UndoManager*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a GtkSourceUndoManager")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_undo_manager_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibGtkSource::UndoManager*)
      end

      def to_unsafe_undomanager
        @pointer.not_nil!.as(LibGtkSource::UndoManager*)
      end
    end

    def to_unsafe_undomanager
      @pointer.not_nil!.as(LibGtkSource::UndoManager*)
    end

    def begin_not_undoable_action
      LibGtkSource.undo_manager_begin_not_undoable_action(@pointer.as(LibGtkSource::UndoManager*))
      nil
    end

    def can_redo
      __var0 = LibGtkSource.undo_manager_can_redo(@pointer.as(LibGtkSource::UndoManager*))
      (__var0 == 1)
    end

    def can_redo_changed
      LibGtkSource.undo_manager_can_redo_changed(@pointer.as(LibGtkSource::UndoManager*))
      nil
    end

    def can_undo
      __var0 = LibGtkSource.undo_manager_can_undo(@pointer.as(LibGtkSource::UndoManager*))
      (__var0 == 1)
    end

    def can_undo_changed
      LibGtkSource.undo_manager_can_undo_changed(@pointer.as(LibGtkSource::UndoManager*))
      nil
    end

    def end_not_undoable_action
      LibGtkSource.undo_manager_end_not_undoable_action(@pointer.as(LibGtkSource::UndoManager*))
      nil
    end

    def redo
      LibGtkSource.undo_manager_redo(@pointer.as(LibGtkSource::UndoManager*))
      nil
    end

    def undo
      LibGtkSource.undo_manager_undo(@pointer.as(LibGtkSource::UndoManager*))
      nil
    end

    alias CanRedoChangedSignal = UndoManager -> Nil

    def on_can_redo_changed(*, after = false, &block : CanRedoChangedSignal)
      __var0 = ->(arg0 : LibGtkSource::UndoManager*, box : Void*) {
        ::Box(CanRedoChangedSignal).unbox(box).call(UndoManager::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(CanRedoChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "can-redo-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_can_redo_changed(&block : CanRedoChangedSignal)
      on_can_redo_changed(after: true, &block)
    end

    alias CanUndoChangedSignal = UndoManager -> Nil

    def on_can_undo_changed(*, after = false, &block : CanUndoChangedSignal)
      __var0 = ->(arg0 : LibGtkSource::UndoManager*, box : Void*) {
        ::Box(CanUndoChangedSignal).unbox(box).call(UndoManager::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(CanUndoChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "can-undo-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_can_undo_changed(&block : CanUndoChangedSignal)
      on_can_undo_changed(after: true, &block)
    end
  end

  class UndoManagerIface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(80u64, 0u8).as(LibGtkSource::UndoManagerIface*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::UndoManagerIface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::UndoManagerIface*)
    end

    def to_unsafe_undomanageriface
      @pointer.not_nil!.as(LibGtkSource::UndoManagerIface*)
    end

    def parent
      GObject::TypeInterface.new(to_unsafe.as(LibGtkSource::UndoManagerIface*).value.parent)
    end

    def can_undo
      to_unsafe.as(LibGtkSource::UndoManagerIface*).value.can_undo
    end

    def can_redo
      to_unsafe.as(LibGtkSource::UndoManagerIface*).value.can_redo
    end

    def undo
      to_unsafe.as(LibGtkSource::UndoManagerIface*).value.undo
    end

    def redo
      to_unsafe.as(LibGtkSource::UndoManagerIface*).value.redo
    end

    def begin_not_undoable_action
      to_unsafe.as(LibGtkSource::UndoManagerIface*).value.begin_not_undoable_action
    end

    def end_not_undoable_action
      to_unsafe.as(LibGtkSource::UndoManagerIface*).value.end_not_undoable_action
    end

    def can_undo_changed
      to_unsafe.as(LibGtkSource::UndoManagerIface*).value.can_undo_changed
    end

    def can_redo_changed
      to_unsafe.as(LibGtkSource::UndoManagerIface*).value.can_redo_changed
    end
  end

  class Map < View
    include Atk::ImplementorIface
    include Gtk::Buildable
    include Gtk::Scrollable

    @pointer : Void*

    def initialize(pointer : LibGtkSource::Map*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GtkSourceMap")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGtkSource._gtk_source_map_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::Map*)
    end

    def to_unsafe_map
      @pointer.not_nil!.as(LibGtkSource::Map*)
    end

    def initialize(*, accepts_tab : ::Bool? = nil, app_paintable : ::Bool? = nil, auto_indent : ::Bool? = nil, background_pattern : GtkSource::BackgroundPatternType? = nil, border_width : UInt32? = nil, bottom_margin : Int32? = nil, buffer : Gtk::TextBuffer? = nil, can_default : ::Bool? = nil, can_focus : ::Bool? = nil, child : Gtk::Widget? = nil, cursor_visible : ::Bool? = nil, double_buffered : ::Bool? = nil, editable : ::Bool? = nil, events : Gdk::EventMask? = nil, expand : ::Bool? = nil, focus_on_click : ::Bool? = nil, font_desc : Pango::FontDescription? = nil, hadjustment : Gtk::Adjustment? = nil, halign : Gtk::Align? = nil, has_default : ::Bool? = nil, has_focus : ::Bool? = nil, has_tooltip : ::Bool? = nil, height_request : Int32? = nil, hexpand : ::Bool? = nil, hexpand_set : ::Bool? = nil, highlight_current_line : ::Bool? = nil, hscroll_policy : Gtk::ScrollablePolicy? = nil, im_module : ::String? = nil, indent : Int32? = nil, indent_on_tab : ::Bool? = nil, indent_width : Int32? = nil, input_hints : Gtk::InputHints? = nil, input_purpose : Gtk::InputPurpose? = nil, insert_spaces_instead_of_tabs : ::Bool? = nil, is_focus : ::Bool? = nil, justification : Gtk::Justification? = nil, left_margin : Int32? = nil, margin : Int32? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_left : Int32? = nil, margin_right : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, monospace : ::Bool? = nil, name : ::String? = nil, no_show_all : ::Bool? = nil, opacity : Float64? = nil, overwrite : ::Bool? = nil, parent : Gtk::Container? = nil, pixels_above_lines : Int32? = nil, pixels_below_lines : Int32? = nil, pixels_inside_wrap : Int32? = nil, populate_all : ::Bool? = nil, receives_default : ::Bool? = nil, resize_mode : Gtk::ResizeMode? = nil, right_margin : Int32? = nil, right_margin_position : UInt32? = nil, sensitive : ::Bool? = nil, show_line_marks : ::Bool? = nil, show_line_numbers : ::Bool? = nil, show_right_margin : ::Bool? = nil, smart_backspace : ::Bool? = nil, smart_home_end : GtkSource::SmartHomeEndType? = nil, style : Gtk::Style? = nil, tab_width : UInt32? = nil, tabs : Pango::TabArray? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, top_margin : Int32? = nil, vadjustment : Gtk::Adjustment? = nil, valign : Gtk::Align? = nil, vexpand : ::Bool? = nil, vexpand_set : ::Bool? = nil, view : GtkSource::View? = nil, visible : ::Bool? = nil, vscroll_policy : Gtk::ScrollablePolicy? = nil, width_request : Int32? = nil, wrap_mode : Gtk::WrapMode? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless accepts_tab.nil?
        __var0 << "accepts-tab".to_unsafe
        __var1 << accepts_tab.to_gvalue.to_unsafe.value
      end

      unless app_paintable.nil?
        __var0 << "app-paintable".to_unsafe
        __var1 << app_paintable.to_gvalue.to_unsafe.value
      end

      unless auto_indent.nil?
        __var0 << "auto-indent".to_unsafe
        __var1 << auto_indent.to_gvalue.to_unsafe.value
      end

      unless background_pattern.nil?
        __var0 << "background-pattern".to_unsafe
        __var1 << background_pattern.to_gvalue.to_unsafe.value
      end

      unless border_width.nil?
        __var0 << "border-width".to_unsafe
        __var1 << border_width.to_gvalue.to_unsafe.value
      end

      unless bottom_margin.nil?
        __var0 << "bottom-margin".to_unsafe
        __var1 << bottom_margin.to_gvalue.to_unsafe.value
      end

      unless buffer.nil?
        __var0 << "buffer".to_unsafe
        __var1 << buffer.to_gvalue.to_unsafe.value
      end

      unless can_default.nil?
        __var0 << "can-default".to_unsafe
        __var1 << can_default.to_gvalue.to_unsafe.value
      end

      unless can_focus.nil?
        __var0 << "can-focus".to_unsafe
        __var1 << can_focus.to_gvalue.to_unsafe.value
      end

      unless child.nil?
        __var0 << "child".to_unsafe
        __var1 << child.to_gvalue.to_unsafe.value
      end

      unless cursor_visible.nil?
        __var0 << "cursor-visible".to_unsafe
        __var1 << cursor_visible.to_gvalue.to_unsafe.value
      end

      unless double_buffered.nil?
        __var0 << "double-buffered".to_unsafe
        __var1 << double_buffered.to_gvalue.to_unsafe.value
      end

      unless editable.nil?
        __var0 << "editable".to_unsafe
        __var1 << editable.to_gvalue.to_unsafe.value
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

      unless highlight_current_line.nil?
        __var0 << "highlight-current-line".to_unsafe
        __var1 << highlight_current_line.to_gvalue.to_unsafe.value
      end

      unless hscroll_policy.nil?
        __var0 << "hscroll-policy".to_unsafe
        __var1 << hscroll_policy.to_gvalue.to_unsafe.value
      end

      unless im_module.nil?
        __var0 << "im-module".to_unsafe
        __var1 << im_module.to_gvalue.to_unsafe.value
      end

      unless indent.nil?
        __var0 << "indent".to_unsafe
        __var1 << indent.to_gvalue.to_unsafe.value
      end

      unless indent_on_tab.nil?
        __var0 << "indent-on-tab".to_unsafe
        __var1 << indent_on_tab.to_gvalue.to_unsafe.value
      end

      unless indent_width.nil?
        __var0 << "indent-width".to_unsafe
        __var1 << indent_width.to_gvalue.to_unsafe.value
      end

      unless input_hints.nil?
        __var0 << "input-hints".to_unsafe
        __var1 << input_hints.to_gvalue.to_unsafe.value
      end

      unless input_purpose.nil?
        __var0 << "input-purpose".to_unsafe
        __var1 << input_purpose.to_gvalue.to_unsafe.value
      end

      unless insert_spaces_instead_of_tabs.nil?
        __var0 << "insert-spaces-instead-of-tabs".to_unsafe
        __var1 << insert_spaces_instead_of_tabs.to_gvalue.to_unsafe.value
      end

      unless is_focus.nil?
        __var0 << "is-focus".to_unsafe
        __var1 << is_focus.to_gvalue.to_unsafe.value
      end

      unless justification.nil?
        __var0 << "justification".to_unsafe
        __var1 << justification.to_gvalue.to_unsafe.value
      end

      unless left_margin.nil?
        __var0 << "left-margin".to_unsafe
        __var1 << left_margin.to_gvalue.to_unsafe.value
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

      unless monospace.nil?
        __var0 << "monospace".to_unsafe
        __var1 << monospace.to_gvalue.to_unsafe.value
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

      unless overwrite.nil?
        __var0 << "overwrite".to_unsafe
        __var1 << overwrite.to_gvalue.to_unsafe.value
      end

      unless parent.nil?
        __var0 << "parent".to_unsafe
        __var1 << parent.to_gvalue.to_unsafe.value
      end

      unless pixels_above_lines.nil?
        __var0 << "pixels-above-lines".to_unsafe
        __var1 << pixels_above_lines.to_gvalue.to_unsafe.value
      end

      unless pixels_below_lines.nil?
        __var0 << "pixels-below-lines".to_unsafe
        __var1 << pixels_below_lines.to_gvalue.to_unsafe.value
      end

      unless pixels_inside_wrap.nil?
        __var0 << "pixels-inside-wrap".to_unsafe
        __var1 << pixels_inside_wrap.to_gvalue.to_unsafe.value
      end

      unless populate_all.nil?
        __var0 << "populate-all".to_unsafe
        __var1 << populate_all.to_gvalue.to_unsafe.value
      end

      unless receives_default.nil?
        __var0 << "receives-default".to_unsafe
        __var1 << receives_default.to_gvalue.to_unsafe.value
      end

      unless resize_mode.nil?
        __var0 << "resize-mode".to_unsafe
        __var1 << resize_mode.to_gvalue.to_unsafe.value
      end

      unless right_margin.nil?
        __var0 << "right-margin".to_unsafe
        __var1 << right_margin.to_gvalue.to_unsafe.value
      end

      unless right_margin_position.nil?
        __var0 << "right-margin-position".to_unsafe
        __var1 << right_margin_position.to_gvalue.to_unsafe.value
      end

      unless sensitive.nil?
        __var0 << "sensitive".to_unsafe
        __var1 << sensitive.to_gvalue.to_unsafe.value
      end

      unless show_line_marks.nil?
        __var0 << "show-line-marks".to_unsafe
        __var1 << show_line_marks.to_gvalue.to_unsafe.value
      end

      unless show_line_numbers.nil?
        __var0 << "show-line-numbers".to_unsafe
        __var1 << show_line_numbers.to_gvalue.to_unsafe.value
      end

      unless show_right_margin.nil?
        __var0 << "show-right-margin".to_unsafe
        __var1 << show_right_margin.to_gvalue.to_unsafe.value
      end

      unless smart_backspace.nil?
        __var0 << "smart-backspace".to_unsafe
        __var1 << smart_backspace.to_gvalue.to_unsafe.value
      end

      unless smart_home_end.nil?
        __var0 << "smart-home-end".to_unsafe
        __var1 << smart_home_end.to_gvalue.to_unsafe.value
      end

      unless style.nil?
        __var0 << "style".to_unsafe
        __var1 << style.to_gvalue.to_unsafe.value
      end

      unless tab_width.nil?
        __var0 << "tab-width".to_unsafe
        __var1 << tab_width.to_gvalue.to_unsafe.value
      end

      unless tabs.nil?
        __var0 << "tabs".to_unsafe
        __var1 << tabs.to_gvalue.to_unsafe.value
      end

      unless tooltip_markup.nil?
        __var0 << "tooltip-markup".to_unsafe
        __var1 << tooltip_markup.to_gvalue.to_unsafe.value
      end

      unless tooltip_text.nil?
        __var0 << "tooltip-text".to_unsafe
        __var1 << tooltip_text.to_gvalue.to_unsafe.value
      end

      unless top_margin.nil?
        __var0 << "top-margin".to_unsafe
        __var1 << top_margin.to_gvalue.to_unsafe.value
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

      unless view.nil?
        __var0 << "view".to_unsafe
        __var1 << view.to_gvalue.to_unsafe.value
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

      unless wrap_mode.nil?
        __var0 << "wrap-mode".to_unsafe
        __var1 << wrap_mode.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGtkSource._gtk_source_map_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new : self
      __var0 = LibGtkSource.map_new
      GObject.raise_unexpected_null("gtk_source_map_new") if __var0.null?
      cast(Gtk::Widget.new(__var0))
    end

    def view
      __var0 = LibGtkSource.map_get_view(@pointer.as(LibGtkSource::Map*))
      __var1 = GtkSource::View.new(__var0) if __var0
      __var1
    end

    def view=(view : GtkSource::View)
      LibGtkSource.map_set_view(@pointer.as(LibGtkSource::Map*), view.to_unsafe_view)
      nil
    end

    def font_desc : Pango::FontDescription
      __var0 = GObject::Value.new(type: GObject::Type::OBJECT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "font-desc", __var0)
      Pango::FontDescription.cast(__var0.object)
    end

    def font_desc=(value : Pango::FontDescription)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "font-desc", value.to_gvalue)
    end
  end

  class ViewClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(1328u64, 0u8).as(LibGtkSource::ViewClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGtkSource::ViewClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::ViewClass*)
    end

    def to_unsafe_viewclass
      @pointer.not_nil!.as(LibGtkSource::ViewClass*)
    end

    def parent_class
      Gtk::TextViewClass.new(to_unsafe.as(LibGtkSource::ViewClass*).value.parent_class)
    end

    def undo
      to_unsafe.as(LibGtkSource::ViewClass*).value.undo
    end

    def redo
      to_unsafe.as(LibGtkSource::ViewClass*).value.redo
    end

    def line_mark_activated
      to_unsafe.as(LibGtkSource::ViewClass*).value.line_mark_activated
    end

    def show_completion
      to_unsafe.as(LibGtkSource::ViewClass*).value.show_completion
    end

    def move_lines
      to_unsafe.as(LibGtkSource::ViewClass*).value.move_lines
    end

    def move_words
      to_unsafe.as(LibGtkSource::ViewClass*).value.move_words
    end

    def padding
      GObject::PointerIterator.new(to_unsafe.as(LibGtkSource::ViewClass*).value.padding) { |__var0|
        __var0
      }
    end
  end

  enum ViewGutterPosition : Int32
    ZERO_NONE =   0
    LINES     = -30
    MARKS     = -20
  end

  class ViewPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGtkSource::ViewPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtkSource::ViewPrivate*)
    end

    def to_unsafe_viewprivate
      @pointer.not_nil!.as(LibGtkSource::ViewPrivate*)
    end
  end
end
