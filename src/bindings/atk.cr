require_gobject("GObject", "2.0")
require_gobject("GLib", "2.0")

@[Link("atk-1.0", pkg_config: "atk-1.0")]
lib LibAtk
  ###########################################
  # #    Interfaces
  ###########################################

  struct Action # interface
    parent : LibGObject::TypeInterface
    do_action : Pointer(LibAtk::Action), Int32 -> LibC::Int
    get_n_actions : Pointer(LibAtk::Action) -> Int32
    get_description : Pointer(LibAtk::Action), Int32 -> Pointer(UInt8)
    get_name : Pointer(LibAtk::Action), Int32 -> Pointer(UInt8)
    get_keybinding : Pointer(LibAtk::Action), Int32 -> Pointer(UInt8)
    set_description : Pointer(LibAtk::Action), Int32, Pointer(UInt8) -> LibC::Int
    get_localized_name : Pointer(LibAtk::Action), Int32 -> Pointer(UInt8)
    # Virtual function do_action
    # Virtual function get_description
    # Virtual function get_keybinding
    # Virtual function get_localized_name
    # Virtual function get_n_actions
    # Virtual function get_name
    # Virtual function set_description
  end

  fun _atk_action_get_type = atk_action_get_type : UInt64
  fun action_do_action = atk_action_do_action(this : Action*, i : Int32) : LibC::Int
  fun action_get_description = atk_action_get_description(this : Action*, i : Int32) : Pointer(UInt8)
  fun action_get_keybinding = atk_action_get_keybinding(this : Action*, i : Int32) : Pointer(UInt8)
  fun action_get_localized_name = atk_action_get_localized_name(this : Action*, i : Int32) : Pointer(UInt8)
  fun action_get_n_actions = atk_action_get_n_actions(this : Action*) : Int32
  fun action_get_name = atk_action_get_name(this : Action*, i : Int32) : Pointer(UInt8)
  fun action_set_description = atk_action_set_description(this : Action*, i : Int32, desc : Pointer(UInt8)) : LibC::Int

  struct Component # interface
    parent : LibGObject::TypeInterface
    add_focus_handler : Pointer(Void)
    contains : Pointer(LibAtk::Component), Int32, Int32, LibAtk::CoordType -> LibC::Int
    ref_accessible_at_point : Pointer(LibAtk::Component), Int32, Int32, LibAtk::CoordType -> Pointer(LibAtk::Object)
    get_extents : Pointer(LibAtk::Component), Int32, Int32, Int32, Int32, LibAtk::CoordType -> Void
    get_position : Pointer(LibAtk::Component), Int32, Int32, LibAtk::CoordType -> Void
    get_size : Pointer(LibAtk::Component), Int32, Int32 -> Void
    grab_focus : Pointer(LibAtk::Component) -> LibC::Int
    remove_focus_handler : Pointer(LibAtk::Component), UInt32 -> Void
    set_extents : Pointer(LibAtk::Component), Int32, Int32, Int32, Int32, LibAtk::CoordType -> LibC::Int
    set_position : Pointer(LibAtk::Component), Int32, Int32, LibAtk::CoordType -> LibC::Int
    set_size : Pointer(LibAtk::Component), Int32, Int32 -> LibC::Int
    get_layer : Pointer(LibAtk::Component) -> LibAtk::Layer
    get_mdi_zorder : Pointer(LibAtk::Component) -> Int32
    bounds_changed : Pointer(LibAtk::Component), Pointer(LibAtk::Rectangle) -> Void
    get_alpha : Pointer(LibAtk::Component) -> Float64
    scroll_to : Pointer(LibAtk::Component), LibAtk::ScrollType -> LibC::Int
    scroll_to_point : Pointer(LibAtk::Component), LibAtk::CoordType, Int32, Int32 -> LibC::Int
    # Signal bounds-changed
    # Virtual function bounds_changed
    # Virtual function contains
    # Virtual function get_alpha
    # Virtual function get_extents
    # Virtual function get_layer
    # Virtual function get_mdi_zorder
    # Virtual function get_position
    # Virtual function get_size
    # Virtual function grab_focus
    # Virtual function ref_accessible_at_point
    # Virtual function remove_focus_handler
    # Virtual function scroll_to
    # Virtual function scroll_to_point
    # Virtual function set_extents
    # Virtual function set_position
    # Virtual function set_size
  end

  fun _atk_component_get_type = atk_component_get_type : UInt64
  fun component_contains = atk_component_contains(this : Component*, x : Int32, y : Int32, coord_type : LibAtk::CoordType) : LibC::Int
  fun component_get_alpha = atk_component_get_alpha(this : Component*) : Float64
  fun component_get_extents = atk_component_get_extents(this : Component*, x : Int32*, y : Int32*, width : Int32*, height : Int32*, coord_type : LibAtk::CoordType) : Void
  fun component_get_layer = atk_component_get_layer(this : Component*) : LibAtk::Layer
  fun component_get_mdi_zorder = atk_component_get_mdi_zorder(this : Component*) : Int32
  fun component_get_position = atk_component_get_position(this : Component*, x : Int32*, y : Int32*, coord_type : LibAtk::CoordType) : Void
  fun component_get_size = atk_component_get_size(this : Component*, width : Int32*, height : Int32*) : Void
  fun component_grab_focus = atk_component_grab_focus(this : Component*) : LibC::Int
  fun component_ref_accessible_at_point = atk_component_ref_accessible_at_point(this : Component*, x : Int32, y : Int32, coord_type : LibAtk::CoordType) : Pointer(LibAtk::Object)
  fun component_remove_focus_handler = atk_component_remove_focus_handler(this : Component*, handler_id : UInt32) : Void
  fun component_scroll_to = atk_component_scroll_to(this : Component*, type : LibAtk::ScrollType) : LibC::Int
  fun component_scroll_to_point = atk_component_scroll_to_point(this : Component*, coords : LibAtk::CoordType, x : Int32, y : Int32) : LibC::Int
  fun component_set_extents = atk_component_set_extents(this : Component*, x : Int32, y : Int32, width : Int32, height : Int32, coord_type : LibAtk::CoordType) : LibC::Int
  fun component_set_position = atk_component_set_position(this : Component*, x : Int32, y : Int32, coord_type : LibAtk::CoordType) : LibC::Int
  fun component_set_size = atk_component_set_size(this : Component*, width : Int32, height : Int32) : LibC::Int

  struct Document # interface
    parent : LibGObject::TypeInterface
    get_document_type : Pointer(LibAtk::Document) -> Pointer(UInt8)
    get_document : Pointer(LibAtk::Document) -> Pointer(Void)
    get_document_locale : Pointer(LibAtk::Document) -> Pointer(UInt8)
    get_document_attributes : Pointer(LibAtk::Document) -> Pointer(Void*)
    get_document_attribute_value : Pointer(LibAtk::Document), Pointer(UInt8) -> Pointer(UInt8)
    set_document_attribute : Pointer(LibAtk::Document), Pointer(UInt8), Pointer(UInt8) -> LibC::Int
    get_current_page_number : Pointer(LibAtk::Document) -> Int32
    get_page_count : Pointer(LibAtk::Document) -> Int32
    # Signal load-complete
    # Signal load-stopped
    # Signal page-changed
    # Signal reload
    # Virtual function get_current_page_number
    # Virtual function get_document
    # Virtual function get_document_attribute_value
    # Virtual function get_document_attributes
    # Virtual function get_document_locale
    # Virtual function get_document_type
    # Virtual function get_page_count
    # Virtual function set_document_attribute
  end

  fun _atk_document_get_type = atk_document_get_type : UInt64
  fun document_get_attribute_value = atk_document_get_attribute_value(this : Document*, attribute_name : Pointer(UInt8)) : Pointer(UInt8)
  fun document_get_attributes = atk_document_get_attributes(this : Document*) : Pointer(Void*)
  fun document_get_current_page_number = atk_document_get_current_page_number(this : Document*) : Int32
  fun document_get_document = atk_document_get_document(this : Document*) : Pointer(Void)
  fun document_get_document_type = atk_document_get_document_type(this : Document*) : Pointer(UInt8)
  fun document_get_locale = atk_document_get_locale(this : Document*) : Pointer(UInt8)
  fun document_get_page_count = atk_document_get_page_count(this : Document*) : Int32
  fun document_set_attribute_value = atk_document_set_attribute_value(this : Document*, attribute_name : Pointer(UInt8), attribute_value : Pointer(UInt8)) : LibC::Int

  struct EditableText # interface
    parent_interface : LibGObject::TypeInterface
    set_run_attributes : Pointer(LibAtk::EditableText), Pointer(Void*), Int32, Int32 -> LibC::Int
    set_text_contents : Pointer(LibAtk::EditableText), Pointer(UInt8) -> Void
    insert_text : Pointer(LibAtk::EditableText), Pointer(UInt8), Int32, Pointer(Int32) -> Void
    copy_text : Pointer(LibAtk::EditableText), Int32, Int32 -> Void
    cut_text : Pointer(LibAtk::EditableText), Int32, Int32 -> Void
    delete_text : Pointer(LibAtk::EditableText), Int32, Int32 -> Void
    paste_text : Pointer(LibAtk::EditableText), Int32 -> Void
    # Virtual function copy_text
    # Virtual function cut_text
    # Virtual function delete_text
    # Virtual function insert_text
    # Virtual function paste_text
    # Virtual function set_run_attributes
    # Virtual function set_text_contents
  end

  fun _atk_editable_text_get_type = atk_editable_text_get_type : UInt64
  fun editable_text_copy_text = atk_editable_text_copy_text(this : EditableText*, start_pos : Int32, end_pos : Int32) : Void
  fun editable_text_cut_text = atk_editable_text_cut_text(this : EditableText*, start_pos : Int32, end_pos : Int32) : Void
  fun editable_text_delete_text = atk_editable_text_delete_text(this : EditableText*, start_pos : Int32, end_pos : Int32) : Void
  fun editable_text_insert_text = atk_editable_text_insert_text(this : EditableText*, string : Pointer(UInt8), length : Int32, position : Pointer(Int32)) : Void
  fun editable_text_paste_text = atk_editable_text_paste_text(this : EditableText*, position : Int32) : Void
  fun editable_text_set_run_attributes = atk_editable_text_set_run_attributes(this : EditableText*, attrib_set : Pointer(Void*), start_offset : Int32, end_offset : Int32) : LibC::Int
  fun editable_text_set_text_contents = atk_editable_text_set_text_contents(this : EditableText*, string : Pointer(UInt8)) : Void

  struct HyperlinkImpl # interface
    parent : LibGObject::TypeInterface
    get_hyperlink : Pointer(LibAtk::HyperlinkImpl) -> Pointer(LibAtk::Hyperlink)
    # Virtual function get_hyperlink
  end

  fun _atk_hyperlink_impl_get_type = atk_hyperlink_impl_get_type : UInt64
  fun hyperlink_impl_get_hyperlink = atk_hyperlink_impl_get_hyperlink(this : HyperlinkImpl*) : Pointer(LibAtk::Hyperlink)

  struct Hypertext # interface
    parent : LibGObject::TypeInterface
    get_link : Pointer(LibAtk::Hypertext), Int32 -> Pointer(LibAtk::Hyperlink)
    get_n_links : Pointer(LibAtk::Hypertext) -> Int32
    get_link_index : Pointer(LibAtk::Hypertext), Int32 -> Int32
    link_selected : Pointer(LibAtk::Hypertext), Int32 -> Void
    # Signal link-selected
    # Virtual function get_link
    # Virtual function get_link_index
    # Virtual function get_n_links
    # Virtual function link_selected
  end

  fun _atk_hypertext_get_type = atk_hypertext_get_type : UInt64
  fun hypertext_get_link = atk_hypertext_get_link(this : Hypertext*, link_index : Int32) : Pointer(LibAtk::Hyperlink)
  fun hypertext_get_link_index = atk_hypertext_get_link_index(this : Hypertext*, char_index : Int32) : Int32
  fun hypertext_get_n_links = atk_hypertext_get_n_links(this : Hypertext*) : Int32

  struct Image # interface
    parent : LibGObject::TypeInterface
    get_image_position : Pointer(LibAtk::Image), Int32, Int32, LibAtk::CoordType -> Void
    get_image_description : Pointer(LibAtk::Image) -> Pointer(UInt8)
    get_image_size : Pointer(LibAtk::Image), Int32, Int32 -> Void
    set_image_description : Pointer(LibAtk::Image), Pointer(UInt8) -> LibC::Int
    get_image_locale : Pointer(LibAtk::Image) -> Pointer(UInt8)
    # Virtual function get_image_description
    # Virtual function get_image_locale
    # Virtual function get_image_position
    # Virtual function get_image_size
    # Virtual function set_image_description
  end

  fun _atk_image_get_type = atk_image_get_type : UInt64
  fun image_get_image_description = atk_image_get_image_description(this : Image*) : Pointer(UInt8)
  fun image_get_image_locale = atk_image_get_image_locale(this : Image*) : Pointer(UInt8)
  fun image_get_image_position = atk_image_get_image_position(this : Image*, x : Int32*, y : Int32*, coord_type : LibAtk::CoordType) : Void
  fun image_get_image_size = atk_image_get_image_size(this : Image*, width : Int32*, height : Int32*) : Void
  fun image_set_image_description = atk_image_set_image_description(this : Image*, description : Pointer(UInt8)) : LibC::Int

  struct ImplementorIface # interface
    _data : UInt8[0]
  end

  fun _atk_implementor_get_type = atk_implementor_get_type : UInt64

  struct Selection # interface
    parent : LibGObject::TypeInterface
    add_selection : Pointer(LibAtk::Selection), Int32 -> LibC::Int
    clear_selection : Pointer(LibAtk::Selection) -> LibC::Int
    ref_selection : Pointer(LibAtk::Selection), Int32 -> Pointer(LibAtk::Object)
    get_selection_count : Pointer(LibAtk::Selection) -> Int32
    is_child_selected : Pointer(LibAtk::Selection), Int32 -> LibC::Int
    remove_selection : Pointer(LibAtk::Selection), Int32 -> LibC::Int
    select_all_selection : Pointer(LibAtk::Selection) -> LibC::Int
    selection_changed : Pointer(LibAtk::Selection) -> Void
    # Signal selection-changed
    # Virtual function add_selection
    # Virtual function clear_selection
    # Virtual function get_selection_count
    # Virtual function is_child_selected
    # Virtual function ref_selection
    # Virtual function remove_selection
    # Virtual function select_all_selection
    # Virtual function selection_changed
  end

  fun _atk_selection_get_type = atk_selection_get_type : UInt64
  fun selection_add_selection = atk_selection_add_selection(this : Selection*, i : Int32) : LibC::Int
  fun selection_clear_selection = atk_selection_clear_selection(this : Selection*) : LibC::Int
  fun selection_get_selection_count = atk_selection_get_selection_count(this : Selection*) : Int32
  fun selection_is_child_selected = atk_selection_is_child_selected(this : Selection*, i : Int32) : LibC::Int
  fun selection_ref_selection = atk_selection_ref_selection(this : Selection*, i : Int32) : Pointer(LibAtk::Object)
  fun selection_remove_selection = atk_selection_remove_selection(this : Selection*, i : Int32) : LibC::Int
  fun selection_select_all_selection = atk_selection_select_all_selection(this : Selection*) : LibC::Int

  struct StreamableContent # interface
    parent : LibGObject::TypeInterface
    get_n_mime_types : Pointer(LibAtk::StreamableContent) -> Int32
    get_mime_type : Pointer(LibAtk::StreamableContent), Int32 -> Pointer(UInt8)
    get_stream : Pointer(LibAtk::StreamableContent), Pointer(UInt8) -> Pointer(LibGLib::IOChannel)
    get_uri : Pointer(LibAtk::StreamableContent), Pointer(UInt8) -> Pointer(UInt8)
    pad1 : LibAtk::Function
    pad2 : LibAtk::Function
    pad3 : LibAtk::Function
    # Virtual function get_mime_type
    # Virtual function get_n_mime_types
    # Virtual function get_stream
    # Virtual function get_uri
  end

  fun _atk_streamable_content_get_type = atk_streamable_content_get_type : UInt64
  fun streamable_content_get_mime_type = atk_streamable_content_get_mime_type(this : StreamableContent*, i : Int32) : Pointer(UInt8)
  fun streamable_content_get_n_mime_types = atk_streamable_content_get_n_mime_types(this : StreamableContent*) : Int32
  fun streamable_content_get_stream = atk_streamable_content_get_stream(this : StreamableContent*, mime_type : Pointer(UInt8)) : Pointer(LibGLib::IOChannel)
  fun streamable_content_get_uri = atk_streamable_content_get_uri(this : StreamableContent*, mime_type : Pointer(UInt8)) : Pointer(UInt8)

  struct Table # interface
    parent : LibGObject::TypeInterface
    ref_at : Pointer(LibAtk::Table), Int32, Int32 -> Pointer(LibAtk::Object)
    get_index_at : Pointer(LibAtk::Table), Int32, Int32 -> Int32
    get_column_at_index : Pointer(LibAtk::Table), Int32 -> Int32
    get_row_at_index : Pointer(LibAtk::Table), Int32 -> Int32
    get_n_columns : Pointer(LibAtk::Table) -> Int32
    get_n_rows : Pointer(LibAtk::Table) -> Int32
    get_column_extent_at : Pointer(LibAtk::Table), Int32, Int32 -> Int32
    get_row_extent_at : Pointer(LibAtk::Table), Int32, Int32 -> Int32
    get_caption : Pointer(LibAtk::Table) -> Pointer(LibAtk::Object)
    get_column_description : Pointer(LibAtk::Table), Int32 -> Pointer(UInt8)
    get_column_header : Pointer(LibAtk::Table), Int32 -> Pointer(LibAtk::Object)
    get_row_description : Pointer(LibAtk::Table), Int32 -> Pointer(UInt8)
    get_row_header : Pointer(LibAtk::Table), Int32 -> Pointer(LibAtk::Object)
    get_summary : Pointer(LibAtk::Table) -> Pointer(LibAtk::Object)
    set_caption : Pointer(LibAtk::Table), Pointer(LibAtk::Object) -> Void
    set_column_description : Pointer(LibAtk::Table), Int32, Pointer(UInt8) -> Void
    set_column_header : Pointer(LibAtk::Table), Int32, Pointer(LibAtk::Object) -> Void
    set_row_description : Pointer(LibAtk::Table), Int32, Pointer(UInt8) -> Void
    set_row_header : Pointer(LibAtk::Table), Int32, Pointer(LibAtk::Object) -> Void
    set_summary : Pointer(LibAtk::Table), Pointer(LibAtk::Object) -> Void
    get_selected_columns : Pointer(LibAtk::Table), Pointer(Int32) -> Int32
    get_selected_rows : Pointer(LibAtk::Table), Pointer(Int32) -> Int32
    is_column_selected : Pointer(LibAtk::Table), Int32 -> LibC::Int
    is_row_selected : Pointer(LibAtk::Table), Int32 -> LibC::Int
    is_selected : Pointer(LibAtk::Table), Int32, Int32 -> LibC::Int
    add_row_selection : Pointer(LibAtk::Table), Int32 -> LibC::Int
    remove_row_selection : Pointer(LibAtk::Table), Int32 -> LibC::Int
    add_column_selection : Pointer(LibAtk::Table), Int32 -> LibC::Int
    remove_column_selection : Pointer(LibAtk::Table), Int32 -> LibC::Int
    row_inserted : Pointer(LibAtk::Table), Int32, Int32 -> Void
    column_inserted : Pointer(LibAtk::Table), Int32, Int32 -> Void
    row_deleted : Pointer(LibAtk::Table), Int32, Int32 -> Void
    column_deleted : Pointer(LibAtk::Table), Int32, Int32 -> Void
    row_reordered : Pointer(LibAtk::Table) -> Void
    column_reordered : Pointer(LibAtk::Table) -> Void
    model_changed : Pointer(LibAtk::Table) -> Void
    # Signal column-deleted
    # Signal column-inserted
    # Signal column-reordered
    # Signal model-changed
    # Signal row-deleted
    # Signal row-inserted
    # Signal row-reordered
    # Virtual function add_column_selection
    # Virtual function add_row_selection
    # Virtual function column_deleted
    # Virtual function column_inserted
    # Virtual function column_reordered
    # Virtual function get_caption
    # Virtual function get_column_at_index
    # Virtual function get_column_description
    # Virtual function get_column_extent_at
    # Virtual function get_column_header
    # Virtual function get_index_at
    # Virtual function get_n_columns
    # Virtual function get_n_rows
    # Virtual function get_row_at_index
    # Virtual function get_row_description
    # Virtual function get_row_extent_at
    # Virtual function get_row_header
    # Virtual function get_selected_columns
    # Virtual function get_selected_rows
    # Virtual function get_summary
    # Virtual function is_column_selected
    # Virtual function is_row_selected
    # Virtual function is_selected
    # Virtual function model_changed
    # Virtual function ref_at
    # Virtual function remove_column_selection
    # Virtual function remove_row_selection
    # Virtual function row_deleted
    # Virtual function row_inserted
    # Virtual function row_reordered
    # Virtual function set_caption
    # Virtual function set_column_description
    # Virtual function set_column_header
    # Virtual function set_row_description
    # Virtual function set_row_header
    # Virtual function set_summary
  end

  fun _atk_table_get_type = atk_table_get_type : UInt64
  fun table_add_column_selection = atk_table_add_column_selection(this : Table*, column : Int32) : LibC::Int
  fun table_add_row_selection = atk_table_add_row_selection(this : Table*, row : Int32) : LibC::Int
  fun table_get_caption = atk_table_get_caption(this : Table*) : Pointer(LibAtk::Object)
  fun table_get_column_at_index = atk_table_get_column_at_index(this : Table*, index_ : Int32) : Int32
  fun table_get_column_description = atk_table_get_column_description(this : Table*, column : Int32) : Pointer(UInt8)
  fun table_get_column_extent_at = atk_table_get_column_extent_at(this : Table*, row : Int32, column : Int32) : Int32
  fun table_get_column_header = atk_table_get_column_header(this : Table*, column : Int32) : Pointer(LibAtk::Object)
  fun table_get_index_at = atk_table_get_index_at(this : Table*, row : Int32, column : Int32) : Int32
  fun table_get_n_columns = atk_table_get_n_columns(this : Table*) : Int32
  fun table_get_n_rows = atk_table_get_n_rows(this : Table*) : Int32
  fun table_get_row_at_index = atk_table_get_row_at_index(this : Table*, index_ : Int32) : Int32
  fun table_get_row_description = atk_table_get_row_description(this : Table*, row : Int32) : Pointer(UInt8)
  fun table_get_row_extent_at = atk_table_get_row_extent_at(this : Table*, row : Int32, column : Int32) : Int32
  fun table_get_row_header = atk_table_get_row_header(this : Table*, row : Int32) : Pointer(LibAtk::Object)
  fun table_get_selected_columns = atk_table_get_selected_columns(this : Table*, selected : Pointer(Int32)) : Int32
  fun table_get_selected_rows = atk_table_get_selected_rows(this : Table*, selected : Pointer(Int32)) : Int32
  fun table_get_summary = atk_table_get_summary(this : Table*) : Pointer(LibAtk::Object)
  fun table_is_column_selected = atk_table_is_column_selected(this : Table*, column : Int32) : LibC::Int
  fun table_is_row_selected = atk_table_is_row_selected(this : Table*, row : Int32) : LibC::Int
  fun table_is_selected = atk_table_is_selected(this : Table*, row : Int32, column : Int32) : LibC::Int
  fun table_ref_at = atk_table_ref_at(this : Table*, row : Int32, column : Int32) : Pointer(LibAtk::Object)
  fun table_remove_column_selection = atk_table_remove_column_selection(this : Table*, column : Int32) : LibC::Int
  fun table_remove_row_selection = atk_table_remove_row_selection(this : Table*, row : Int32) : LibC::Int
  fun table_set_caption = atk_table_set_caption(this : Table*, caption : Pointer(LibAtk::Object)) : Void
  fun table_set_column_description = atk_table_set_column_description(this : Table*, column : Int32, description : Pointer(UInt8)) : Void
  fun table_set_column_header = atk_table_set_column_header(this : Table*, column : Int32, header : Pointer(LibAtk::Object)) : Void
  fun table_set_row_description = atk_table_set_row_description(this : Table*, row : Int32, description : Pointer(UInt8)) : Void
  fun table_set_row_header = atk_table_set_row_header(this : Table*, row : Int32, header : Pointer(LibAtk::Object)) : Void
  fun table_set_summary = atk_table_set_summary(this : Table*, accessible : Pointer(LibAtk::Object)) : Void

  struct TableCell # interface
    parent : LibGObject::TypeInterface
    get_column_span : Pointer(LibAtk::TableCell) -> Int32
    get_column_header_cells : Pointer(LibAtk::TableCell) -> Pointer(Void)
    get_position : Pointer(LibAtk::TableCell), Int32, Int32 -> LibC::Int
    get_row_span : Pointer(LibAtk::TableCell) -> Int32
    get_row_header_cells : Pointer(LibAtk::TableCell) -> Pointer(Void)
    get_row_column_span : Pointer(LibAtk::TableCell), Int32, Int32, Int32, Int32 -> LibC::Int
    get_table : Pointer(LibAtk::TableCell) -> Pointer(LibAtk::Object)
    # Requires Object
    # Virtual function get_column_header_cells
    # Virtual function get_column_span
    # Virtual function get_position
    # Virtual function get_row_column_span
    # Virtual function get_row_header_cells
    # Virtual function get_row_span
    # Virtual function get_table
  end

  fun _atk_table_cell_get_type = atk_table_cell_get_type : UInt64
  fun table_cell_get_column_header_cells = atk_table_cell_get_column_header_cells(this : TableCell*) : Pointer(Void)
  fun table_cell_get_column_span = atk_table_cell_get_column_span(this : TableCell*) : Int32
  fun table_cell_get_position = atk_table_cell_get_position(this : TableCell*, row : Int32*, column : Int32*) : LibC::Int
  fun table_cell_get_row_column_span = atk_table_cell_get_row_column_span(this : TableCell*, row : Int32*, column : Int32*, row_span : Int32*, column_span : Int32*) : LibC::Int
  fun table_cell_get_row_header_cells = atk_table_cell_get_row_header_cells(this : TableCell*) : Pointer(Void)
  fun table_cell_get_row_span = atk_table_cell_get_row_span(this : TableCell*) : Int32
  fun table_cell_get_table = atk_table_cell_get_table(this : TableCell*) : Pointer(LibAtk::Object)

  struct Text # interface
    parent : LibGObject::TypeInterface
    get_text : Pointer(LibAtk::Text), Int32, Int32 -> Pointer(UInt8)
    get_text_after_offset : Pointer(LibAtk::Text), Int32, LibAtk::TextBoundary, Int32, Int32 -> Pointer(UInt8)
    get_text_at_offset : Pointer(LibAtk::Text), Int32, LibAtk::TextBoundary, Int32, Int32 -> Pointer(UInt8)
    get_character_at_offset : Pointer(LibAtk::Text), Int32 -> UInt8
    get_text_before_offset : Pointer(LibAtk::Text), Int32, LibAtk::TextBoundary, Int32, Int32 -> Pointer(UInt8)
    get_caret_offset : Pointer(LibAtk::Text) -> Int32
    get_run_attributes : Pointer(LibAtk::Text), Int32, Int32, Int32 -> Pointer(Void*)
    get_default_attributes : Pointer(LibAtk::Text) -> Pointer(Void*)
    get_character_extents : Pointer(LibAtk::Text), Int32, Int32, Int32, Int32, Int32, LibAtk::CoordType -> Void
    get_character_count : Pointer(LibAtk::Text) -> Int32
    get_offset_at_point : Pointer(LibAtk::Text), Int32, Int32, LibAtk::CoordType -> Int32
    get_n_selections : Pointer(LibAtk::Text) -> Int32
    get_selection : Pointer(LibAtk::Text), Int32, Int32, Int32 -> Pointer(UInt8)
    add_selection : Pointer(LibAtk::Text), Int32, Int32 -> LibC::Int
    remove_selection : Pointer(LibAtk::Text), Int32 -> LibC::Int
    set_selection : Pointer(LibAtk::Text), Int32, Int32, Int32 -> LibC::Int
    set_caret_offset : Pointer(LibAtk::Text), Int32 -> LibC::Int
    text_changed : Pointer(LibAtk::Text), Int32, Int32 -> Void
    text_caret_moved : Pointer(LibAtk::Text), Int32 -> Void
    text_selection_changed : Pointer(LibAtk::Text) -> Void
    text_attributes_changed : Pointer(LibAtk::Text) -> Void
    get_range_extents : Pointer(LibAtk::Text), Int32, Int32, LibAtk::CoordType, LibAtk::TextRectangle -> Void
    get_bounded_ranges : Pointer(LibAtk::Text), Pointer(LibAtk::TextRectangle), LibAtk::CoordType, LibAtk::TextClipType, LibAtk::TextClipType -> Pointer(Pointer(LibAtk::TextRange))
    get_string_at_offset : Pointer(LibAtk::Text), Int32, LibAtk::TextGranularity, Int32, Int32 -> Pointer(UInt8)
    scroll_substring_to : Pointer(LibAtk::Text), Int32, Int32, LibAtk::ScrollType -> LibC::Int
    scroll_substring_to_point : Pointer(LibAtk::Text), Int32, Int32, LibAtk::CoordType, Int32, Int32 -> LibC::Int
    # Signal text-attributes-changed
    # Signal text-caret-moved
    # Signal text-changed
    # Signal text-insert
    # Signal text-remove
    # Signal text-selection-changed
    # Virtual function add_selection
    # Virtual function get_bounded_ranges
    # Virtual function get_caret_offset
    # Virtual function get_character_at_offset
    # Virtual function get_character_count
    # Virtual function get_character_extents
    # Virtual function get_default_attributes
    # Virtual function get_n_selections
    # Virtual function get_offset_at_point
    # Virtual function get_range_extents
    # Virtual function get_run_attributes
    # Virtual function get_selection
    # Virtual function get_string_at_offset
    # Virtual function get_text
    # Virtual function get_text_after_offset
    # Virtual function get_text_at_offset
    # Virtual function get_text_before_offset
    # Virtual function remove_selection
    # Virtual function scroll_substring_to
    # Virtual function scroll_substring_to_point
    # Virtual function set_caret_offset
    # Virtual function set_selection
    # Virtual function text_attributes_changed
    # Virtual function text_caret_moved
    # Virtual function text_changed
    # Virtual function text_selection_changed
  end

  fun _atk_text_get_type = atk_text_get_type : UInt64
  fun text_free_ranges = atk_text_free_ranges(ranges : Pointer(Pointer(LibAtk::TextRange))) : Void
  fun text_add_selection = atk_text_add_selection(this : Text*, start_offset : Int32, end_offset : Int32) : LibC::Int
  fun text_get_bounded_ranges = atk_text_get_bounded_ranges(this : Text*, rect : Pointer(LibAtk::TextRectangle), coord_type : LibAtk::CoordType, x_clip_type : LibAtk::TextClipType, y_clip_type : LibAtk::TextClipType) : Pointer(Pointer(LibAtk::TextRange))
  fun text_get_caret_offset = atk_text_get_caret_offset(this : Text*) : Int32
  fun text_get_character_at_offset = atk_text_get_character_at_offset(this : Text*, offset : Int32) : UInt8
  fun text_get_character_count = atk_text_get_character_count(this : Text*) : Int32
  fun text_get_character_extents = atk_text_get_character_extents(this : Text*, offset : Int32, x : Int32*, y : Int32*, width : Int32*, height : Int32*, coords : LibAtk::CoordType) : Void
  fun text_get_default_attributes = atk_text_get_default_attributes(this : Text*) : Pointer(Void*)
  fun text_get_n_selections = atk_text_get_n_selections(this : Text*) : Int32
  fun text_get_offset_at_point = atk_text_get_offset_at_point(this : Text*, x : Int32, y : Int32, coords : LibAtk::CoordType) : Int32
  fun text_get_range_extents = atk_text_get_range_extents(this : Text*, start_offset : Int32, end_offset : Int32, coord_type : LibAtk::CoordType, rect : LibAtk::TextRectangle*) : Void
  fun text_get_run_attributes = atk_text_get_run_attributes(this : Text*, offset : Int32, start_offset : Int32*, end_offset : Int32*) : Pointer(Void*)
  fun text_get_selection = atk_text_get_selection(this : Text*, selection_num : Int32, start_offset : Int32*, end_offset : Int32*) : Pointer(UInt8)
  fun text_get_string_at_offset = atk_text_get_string_at_offset(this : Text*, offset : Int32, granularity : LibAtk::TextGranularity, start_offset : Int32*, end_offset : Int32*) : Pointer(UInt8)
  fun text_get_text = atk_text_get_text(this : Text*, start_offset : Int32, end_offset : Int32) : Pointer(UInt8)
  fun text_get_text_after_offset = atk_text_get_text_after_offset(this : Text*, offset : Int32, boundary_type : LibAtk::TextBoundary, start_offset : Int32*, end_offset : Int32*) : Pointer(UInt8)
  fun text_get_text_at_offset = atk_text_get_text_at_offset(this : Text*, offset : Int32, boundary_type : LibAtk::TextBoundary, start_offset : Int32*, end_offset : Int32*) : Pointer(UInt8)
  fun text_get_text_before_offset = atk_text_get_text_before_offset(this : Text*, offset : Int32, boundary_type : LibAtk::TextBoundary, start_offset : Int32*, end_offset : Int32*) : Pointer(UInt8)
  fun text_remove_selection = atk_text_remove_selection(this : Text*, selection_num : Int32) : LibC::Int
  fun text_scroll_substring_to = atk_text_scroll_substring_to(this : Text*, start_offset : Int32, end_offset : Int32, type : LibAtk::ScrollType) : LibC::Int
  fun text_scroll_substring_to_point = atk_text_scroll_substring_to_point(this : Text*, start_offset : Int32, end_offset : Int32, coords : LibAtk::CoordType, x : Int32, y : Int32) : LibC::Int
  fun text_set_caret_offset = atk_text_set_caret_offset(this : Text*, offset : Int32) : LibC::Int
  fun text_set_selection = atk_text_set_selection(this : Text*, selection_num : Int32, start_offset : Int32, end_offset : Int32) : LibC::Int

  struct Value # interface
    parent : LibGObject::TypeInterface
    get_current_value : Pointer(LibAtk::Value), LibGObject::Value -> Void
    get_maximum_value : Pointer(LibAtk::Value), LibGObject::Value -> Void
    get_minimum_value : Pointer(LibAtk::Value), LibGObject::Value -> Void
    set_current_value : Pointer(LibAtk::Value), Pointer(LibGObject::Value) -> LibC::Int
    get_minimum_increment : Pointer(LibAtk::Value), LibGObject::Value -> Void
    get_value_and_text : Pointer(LibAtk::Value), Float64, Pointer(UInt8) -> Void
    get_range : Pointer(LibAtk::Value) -> Pointer(LibAtk::Range)
    get_increment : Pointer(LibAtk::Value) -> Float64
    get_sub_ranges : Pointer(LibAtk::Value) -> Pointer(Void*)
    set_value : Pointer(LibAtk::Value), Float64 -> Void
    # Signal value-changed
    # Virtual function get_current_value
    # Virtual function get_increment
    # Virtual function get_maximum_value
    # Virtual function get_minimum_increment
    # Virtual function get_minimum_value
    # Virtual function get_range
    # Virtual function get_sub_ranges
    # Virtual function get_value_and_text
    # Virtual function set_current_value
    # Virtual function set_value
  end

  fun _atk_value_get_type = atk_value_get_type : UInt64
  fun value_get_current_value = atk_value_get_current_value(this : Value*, value : LibGObject::Value*) : Void
  fun value_get_increment = atk_value_get_increment(this : Value*) : Float64
  fun value_get_maximum_value = atk_value_get_maximum_value(this : Value*, value : LibGObject::Value*) : Void
  fun value_get_minimum_increment = atk_value_get_minimum_increment(this : Value*, value : LibGObject::Value*) : Void
  fun value_get_minimum_value = atk_value_get_minimum_value(this : Value*, value : LibGObject::Value*) : Void
  fun value_get_range = atk_value_get_range(this : Value*) : Pointer(LibAtk::Range)
  fun value_get_sub_ranges = atk_value_get_sub_ranges(this : Value*) : Pointer(Void*)
  fun value_get_value_and_text = atk_value_get_value_and_text(this : Value*, value : Float64*, text : Pointer(UInt8)*) : Void
  fun value_set_current_value = atk_value_set_current_value(this : Value*, value : Pointer(LibGObject::Value)) : LibC::Int
  fun value_set_value = atk_value_set_value(this : Value*, new_value : Float64) : Void

  struct Window # interface
    parent : LibGObject::TypeInterface
    # Requires Object
    # Signal activate
    # Signal create
    # Signal deactivate
    # Signal destroy
    # Signal maximize
    # Signal minimize
    # Signal move
    # Signal resize
    # Signal restore
  end

  fun _atk_window_get_type = atk_window_get_type : UInt64

  ###########################################
  # #    Structs
  ###########################################

  struct ActionIface # struct
    parent : LibGObject::TypeInterface
    do_action : Pointer(LibAtk::Action), Int32 -> LibC::Int
    get_n_actions : Pointer(LibAtk::Action) -> Int32
    get_description : Pointer(LibAtk::Action), Int32 -> Pointer(UInt8)
    get_name : Pointer(LibAtk::Action), Int32 -> Pointer(UInt8)
    get_keybinding : Pointer(LibAtk::Action), Int32 -> Pointer(UInt8)
    set_description : Pointer(LibAtk::Action), Int32, Pointer(UInt8) -> LibC::Int
    get_localized_name : Pointer(LibAtk::Action), Int32 -> Pointer(UInt8)
  end

  struct Attribute # struct
    name : Pointer(UInt8)
    value : Pointer(UInt8)
  end

  fun attribute_set_free = atk_attribute_set_free(attrib_set : Pointer(Void*)) : Void

  struct ComponentIface # struct
    parent : LibGObject::TypeInterface
    add_focus_handler : Pointer(Void)
    contains : Pointer(LibAtk::Component), Int32, Int32, LibAtk::CoordType -> LibC::Int
    ref_accessible_at_point : Pointer(LibAtk::Component), Int32, Int32, LibAtk::CoordType -> Pointer(LibAtk::Object)
    get_extents : Pointer(LibAtk::Component), Int32, Int32, Int32, Int32, LibAtk::CoordType -> Void
    get_position : Pointer(LibAtk::Component), Int32, Int32, LibAtk::CoordType -> Void
    get_size : Pointer(LibAtk::Component), Int32, Int32 -> Void
    grab_focus : Pointer(LibAtk::Component) -> LibC::Int
    remove_focus_handler : Pointer(LibAtk::Component), UInt32 -> Void
    set_extents : Pointer(LibAtk::Component), Int32, Int32, Int32, Int32, LibAtk::CoordType -> LibC::Int
    set_position : Pointer(LibAtk::Component), Int32, Int32, LibAtk::CoordType -> LibC::Int
    set_size : Pointer(LibAtk::Component), Int32, Int32 -> LibC::Int
    get_layer : Pointer(LibAtk::Component) -> LibAtk::Layer
    get_mdi_zorder : Pointer(LibAtk::Component) -> Int32
    bounds_changed : Pointer(LibAtk::Component), Pointer(LibAtk::Rectangle) -> Void
    get_alpha : Pointer(LibAtk::Component) -> Float64
    scroll_to : Pointer(LibAtk::Component), LibAtk::ScrollType -> LibC::Int
    scroll_to_point : Pointer(LibAtk::Component), LibAtk::CoordType, Int32, Int32 -> LibC::Int
  end

  struct DocumentIface # struct
    parent : LibGObject::TypeInterface
    get_document_type : Pointer(LibAtk::Document) -> Pointer(UInt8)
    get_document : Pointer(LibAtk::Document) -> Pointer(Void)
    get_document_locale : Pointer(LibAtk::Document) -> Pointer(UInt8)
    get_document_attributes : Pointer(LibAtk::Document) -> Pointer(Void*)
    get_document_attribute_value : Pointer(LibAtk::Document), Pointer(UInt8) -> Pointer(UInt8)
    set_document_attribute : Pointer(LibAtk::Document), Pointer(UInt8), Pointer(UInt8) -> LibC::Int
    get_current_page_number : Pointer(LibAtk::Document) -> Int32
    get_page_count : Pointer(LibAtk::Document) -> Int32
  end

  struct EditableTextIface # struct
    parent_interface : LibGObject::TypeInterface
    set_run_attributes : Pointer(LibAtk::EditableText), Pointer(Void*), Int32, Int32 -> LibC::Int
    set_text_contents : Pointer(LibAtk::EditableText), Pointer(UInt8) -> Void
    insert_text : Pointer(LibAtk::EditableText), Pointer(UInt8), Int32, Pointer(Int32) -> Void
    copy_text : Pointer(LibAtk::EditableText), Int32, Int32 -> Void
    cut_text : Pointer(LibAtk::EditableText), Int32, Int32 -> Void
    delete_text : Pointer(LibAtk::EditableText), Int32, Int32 -> Void
    paste_text : Pointer(LibAtk::EditableText), Int32 -> Void
  end

  struct GObjectAccessibleClass # struct
    parent_class : LibAtk::ObjectClass
    pad1 : LibAtk::Function
    pad2 : LibAtk::Function
  end

  struct HyperlinkClass # struct
    parent : LibGObject::ObjectClass
    get_uri : Pointer(LibAtk::Hyperlink), Int32 -> Pointer(UInt8)
    get_object : Pointer(LibAtk::Hyperlink), Int32 -> Pointer(LibAtk::Object)
    get_end_index : Pointer(LibAtk::Hyperlink) -> Int32
    get_start_index : Pointer(LibAtk::Hyperlink) -> Int32
    is_valid : Pointer(LibAtk::Hyperlink) -> LibC::Int
    get_n_anchors : Pointer(LibAtk::Hyperlink) -> Int32
    link_state : Pointer(LibAtk::Hyperlink) -> UInt32
    is_selected_link : Pointer(LibAtk::Hyperlink) -> LibC::Int
    link_activated : Pointer(LibAtk::Hyperlink) -> Void
    pad1 : LibAtk::Function
  end

  struct HyperlinkImplIface # struct
    parent : LibGObject::TypeInterface
    get_hyperlink : Pointer(LibAtk::HyperlinkImpl) -> Pointer(LibAtk::Hyperlink)
  end

  struct HypertextIface # struct
    parent : LibGObject::TypeInterface
    get_link : Pointer(LibAtk::Hypertext), Int32 -> Pointer(LibAtk::Hyperlink)
    get_n_links : Pointer(LibAtk::Hypertext) -> Int32
    get_link_index : Pointer(LibAtk::Hypertext), Int32 -> Int32
    link_selected : Pointer(LibAtk::Hypertext), Int32 -> Void
  end

  struct ImageIface # struct
    parent : LibGObject::TypeInterface
    get_image_position : Pointer(LibAtk::Image), Int32, Int32, LibAtk::CoordType -> Void
    get_image_description : Pointer(LibAtk::Image) -> Pointer(UInt8)
    get_image_size : Pointer(LibAtk::Image), Int32, Int32 -> Void
    set_image_description : Pointer(LibAtk::Image), Pointer(UInt8) -> LibC::Int
    get_image_locale : Pointer(LibAtk::Image) -> Pointer(UInt8)
  end

  struct Implementor # struct
    _data : UInt8[0]
  end

  fun implementor_ref_accessible = atk_implementor_ref_accessible(this : Implementor*) : Pointer(LibAtk::Object)

  struct KeyEventStruct # struct
    type : Int32
    state : UInt32
    keyval : UInt32
    length : Int32
    string : Pointer(UInt8)
    keycode : UInt16
    timestamp : UInt32
  end

  struct MiscClass # struct
    parent : LibGObject::ObjectClass
    threads_enter : Pointer(LibAtk::Misc) -> Void
    threads_leave : Pointer(LibAtk::Misc) -> Void
    vfuncs : Pointer(Void)[32]
  end

  struct NoOpObjectClass # struct
    parent_class : LibAtk::ObjectClass
  end

  struct NoOpObjectFactoryClass # struct
    parent_class : LibAtk::ObjectFactoryClass
  end

  struct ObjectClass # struct
    parent : LibGObject::ObjectClass
    get_name : Pointer(LibAtk::Object) -> Pointer(UInt8)
    get_description : Pointer(LibAtk::Object) -> Pointer(UInt8)
    get_parent : Pointer(LibAtk::Object) -> Pointer(LibAtk::Object)
    get_n_children : Pointer(LibAtk::Object) -> Int32
    ref_child : Pointer(Void)
    get_index_in_parent : Pointer(LibAtk::Object) -> Int32
    ref_relation_set : Pointer(LibAtk::Object) -> Pointer(LibAtk::RelationSet)
    get_role : Pointer(LibAtk::Object) -> LibAtk::Role
    get_layer : Pointer(LibAtk::Object) -> LibAtk::Layer
    get_mdi_zorder : Pointer(LibAtk::Object) -> Int32
    ref_state_set : Pointer(LibAtk::Object) -> Pointer(LibAtk::StateSet)
    set_name : Pointer(LibAtk::Object), Pointer(UInt8) -> Void
    set_description : Pointer(LibAtk::Object), Pointer(UInt8) -> Void
    set_parent : Pointer(LibAtk::Object), Pointer(LibAtk::Object) -> Void
    set_role : Pointer(LibAtk::Object), LibAtk::Role -> Void
    connect_property_change_handler : Pointer(Void)
    remove_property_change_handler : Pointer(LibAtk::Object), UInt32 -> Void
    initialize : Pointer(LibAtk::Object), Pointer(Void) -> Void
    children_changed : Pointer(LibAtk::Object), UInt32, Pointer(Void) -> Void
    focus_event : Pointer(LibAtk::Object), LibC::Int -> Void
    property_change : Pointer(LibAtk::Object), Pointer(LibAtk::PropertyValues) -> Void
    state_change : Pointer(LibAtk::Object), Pointer(UInt8), LibC::Int -> Void
    visible_data_changed : Pointer(LibAtk::Object) -> Void
    active_descendant_changed : Pointer(LibAtk::Object), Pointer(Void) -> Void
    get_attributes : Pointer(LibAtk::Object) -> Pointer(Void*)
    get_object_locale : Pointer(LibAtk::Object) -> Pointer(UInt8)
    pad1 : LibAtk::Function
  end

  struct ObjectFactoryClass # struct
    parent_class : LibGObject::ObjectClass
    create_accessible : Pointer(Void)
    invalidate : Pointer(LibAtk::ObjectFactory) -> Void
    get_accessible_type : -> UInt64
    pad1 : LibAtk::Function
    pad2 : LibAtk::Function
  end

  struct PlugClass # struct
    parent_class : LibAtk::ObjectClass
    get_object_id : Pointer(LibAtk::Plug) -> Pointer(UInt8)
  end

  struct PropertyValues # struct
    property_name : Pointer(UInt8)
    old_value : LibGObject::Value
    new_value : LibGObject::Value
  end

  struct Range # struct
    _data : UInt8[0]
  end

  fun _atk_range_get_type = atk_range_get_type : UInt64
  fun range_new = atk_range_new(lower_limit : Float64, upper_limit : Float64, description : Pointer(UInt8)) : Pointer(LibAtk::Range)
  fun range_copy = atk_range_copy(this : Range*) : Pointer(LibAtk::Range)
  fun range_free = atk_range_free(this : Range*) : Void
  fun range_get_description = atk_range_get_description(this : Range*) : Pointer(UInt8)
  fun range_get_lower_limit = atk_range_get_lower_limit(this : Range*) : Float64
  fun range_get_upper_limit = atk_range_get_upper_limit(this : Range*) : Float64

  struct Rectangle # struct
    x : Int32
    y : Int32
    width : Int32
    height : Int32
  end

  fun _atk_rectangle_get_type = atk_rectangle_get_type : UInt64

  struct RegistryClass # struct
    parent_class : LibGObject::ObjectClass
  end

  struct RelationClass # struct
    parent : LibGObject::ObjectClass
  end

  struct RelationSetClass # struct
    parent : LibGObject::ObjectClass
    pad1 : LibAtk::Function
    pad2 : LibAtk::Function
  end

  struct SelectionIface # struct
    parent : LibGObject::TypeInterface
    add_selection : Pointer(LibAtk::Selection), Int32 -> LibC::Int
    clear_selection : Pointer(LibAtk::Selection) -> LibC::Int
    ref_selection : Pointer(LibAtk::Selection), Int32 -> Pointer(LibAtk::Object)
    get_selection_count : Pointer(LibAtk::Selection) -> Int32
    is_child_selected : Pointer(LibAtk::Selection), Int32 -> LibC::Int
    remove_selection : Pointer(LibAtk::Selection), Int32 -> LibC::Int
    select_all_selection : Pointer(LibAtk::Selection) -> LibC::Int
    selection_changed : Pointer(LibAtk::Selection) -> Void
  end

  struct SocketClass # struct
    parent_class : LibAtk::ObjectClass
    embed : Pointer(LibAtk::Socket), Pointer(UInt8) -> Void
  end

  struct StateSetClass # struct
    parent : LibGObject::ObjectClass
  end

  struct StreamableContentIface # struct
    parent : LibGObject::TypeInterface
    get_n_mime_types : Pointer(LibAtk::StreamableContent) -> Int32
    get_mime_type : Pointer(LibAtk::StreamableContent), Int32 -> Pointer(UInt8)
    get_stream : Pointer(LibAtk::StreamableContent), Pointer(UInt8) -> Pointer(LibGLib::IOChannel)
    get_uri : Pointer(LibAtk::StreamableContent), Pointer(UInt8) -> Pointer(UInt8)
    pad1 : LibAtk::Function
    pad2 : LibAtk::Function
    pad3 : LibAtk::Function
  end

  struct TableCellIface # struct
    parent : LibGObject::TypeInterface
    get_column_span : Pointer(LibAtk::TableCell) -> Int32
    get_column_header_cells : Pointer(LibAtk::TableCell) -> Pointer(Void)
    get_position : Pointer(LibAtk::TableCell), Int32, Int32 -> LibC::Int
    get_row_span : Pointer(LibAtk::TableCell) -> Int32
    get_row_header_cells : Pointer(LibAtk::TableCell) -> Pointer(Void)
    get_row_column_span : Pointer(LibAtk::TableCell), Int32, Int32, Int32, Int32 -> LibC::Int
    get_table : Pointer(LibAtk::TableCell) -> Pointer(LibAtk::Object)
  end

  struct TableIface # struct
    parent : LibGObject::TypeInterface
    ref_at : Pointer(LibAtk::Table), Int32, Int32 -> Pointer(LibAtk::Object)
    get_index_at : Pointer(LibAtk::Table), Int32, Int32 -> Int32
    get_column_at_index : Pointer(LibAtk::Table), Int32 -> Int32
    get_row_at_index : Pointer(LibAtk::Table), Int32 -> Int32
    get_n_columns : Pointer(LibAtk::Table) -> Int32
    get_n_rows : Pointer(LibAtk::Table) -> Int32
    get_column_extent_at : Pointer(LibAtk::Table), Int32, Int32 -> Int32
    get_row_extent_at : Pointer(LibAtk::Table), Int32, Int32 -> Int32
    get_caption : Pointer(LibAtk::Table) -> Pointer(LibAtk::Object)
    get_column_description : Pointer(LibAtk::Table), Int32 -> Pointer(UInt8)
    get_column_header : Pointer(LibAtk::Table), Int32 -> Pointer(LibAtk::Object)
    get_row_description : Pointer(LibAtk::Table), Int32 -> Pointer(UInt8)
    get_row_header : Pointer(LibAtk::Table), Int32 -> Pointer(LibAtk::Object)
    get_summary : Pointer(LibAtk::Table) -> Pointer(LibAtk::Object)
    set_caption : Pointer(LibAtk::Table), Pointer(LibAtk::Object) -> Void
    set_column_description : Pointer(LibAtk::Table), Int32, Pointer(UInt8) -> Void
    set_column_header : Pointer(LibAtk::Table), Int32, Pointer(LibAtk::Object) -> Void
    set_row_description : Pointer(LibAtk::Table), Int32, Pointer(UInt8) -> Void
    set_row_header : Pointer(LibAtk::Table), Int32, Pointer(LibAtk::Object) -> Void
    set_summary : Pointer(LibAtk::Table), Pointer(LibAtk::Object) -> Void
    get_selected_columns : Pointer(LibAtk::Table), Pointer(Int32) -> Int32
    get_selected_rows : Pointer(LibAtk::Table), Pointer(Int32) -> Int32
    is_column_selected : Pointer(LibAtk::Table), Int32 -> LibC::Int
    is_row_selected : Pointer(LibAtk::Table), Int32 -> LibC::Int
    is_selected : Pointer(LibAtk::Table), Int32, Int32 -> LibC::Int
    add_row_selection : Pointer(LibAtk::Table), Int32 -> LibC::Int
    remove_row_selection : Pointer(LibAtk::Table), Int32 -> LibC::Int
    add_column_selection : Pointer(LibAtk::Table), Int32 -> LibC::Int
    remove_column_selection : Pointer(LibAtk::Table), Int32 -> LibC::Int
    row_inserted : Pointer(LibAtk::Table), Int32, Int32 -> Void
    column_inserted : Pointer(LibAtk::Table), Int32, Int32 -> Void
    row_deleted : Pointer(LibAtk::Table), Int32, Int32 -> Void
    column_deleted : Pointer(LibAtk::Table), Int32, Int32 -> Void
    row_reordered : Pointer(LibAtk::Table) -> Void
    column_reordered : Pointer(LibAtk::Table) -> Void
    model_changed : Pointer(LibAtk::Table) -> Void
  end

  struct TextIface # struct
    parent : LibGObject::TypeInterface
    get_text : Pointer(LibAtk::Text), Int32, Int32 -> Pointer(UInt8)
    get_text_after_offset : Pointer(LibAtk::Text), Int32, LibAtk::TextBoundary, Int32, Int32 -> Pointer(UInt8)
    get_text_at_offset : Pointer(LibAtk::Text), Int32, LibAtk::TextBoundary, Int32, Int32 -> Pointer(UInt8)
    get_character_at_offset : Pointer(LibAtk::Text), Int32 -> UInt8
    get_text_before_offset : Pointer(LibAtk::Text), Int32, LibAtk::TextBoundary, Int32, Int32 -> Pointer(UInt8)
    get_caret_offset : Pointer(LibAtk::Text) -> Int32
    get_run_attributes : Pointer(LibAtk::Text), Int32, Int32, Int32 -> Pointer(Void*)
    get_default_attributes : Pointer(LibAtk::Text) -> Pointer(Void*)
    get_character_extents : Pointer(LibAtk::Text), Int32, Int32, Int32, Int32, Int32, LibAtk::CoordType -> Void
    get_character_count : Pointer(LibAtk::Text) -> Int32
    get_offset_at_point : Pointer(LibAtk::Text), Int32, Int32, LibAtk::CoordType -> Int32
    get_n_selections : Pointer(LibAtk::Text) -> Int32
    get_selection : Pointer(LibAtk::Text), Int32, Int32, Int32 -> Pointer(UInt8)
    add_selection : Pointer(LibAtk::Text), Int32, Int32 -> LibC::Int
    remove_selection : Pointer(LibAtk::Text), Int32 -> LibC::Int
    set_selection : Pointer(LibAtk::Text), Int32, Int32, Int32 -> LibC::Int
    set_caret_offset : Pointer(LibAtk::Text), Int32 -> LibC::Int
    text_changed : Pointer(LibAtk::Text), Int32, Int32 -> Void
    text_caret_moved : Pointer(LibAtk::Text), Int32 -> Void
    text_selection_changed : Pointer(LibAtk::Text) -> Void
    text_attributes_changed : Pointer(LibAtk::Text) -> Void
    get_range_extents : Pointer(LibAtk::Text), Int32, Int32, LibAtk::CoordType, LibAtk::TextRectangle -> Void
    get_bounded_ranges : Pointer(LibAtk::Text), Pointer(LibAtk::TextRectangle), LibAtk::CoordType, LibAtk::TextClipType, LibAtk::TextClipType -> Pointer(Pointer(LibAtk::TextRange))
    get_string_at_offset : Pointer(LibAtk::Text), Int32, LibAtk::TextGranularity, Int32, Int32 -> Pointer(UInt8)
    scroll_substring_to : Pointer(LibAtk::Text), Int32, Int32, LibAtk::ScrollType -> LibC::Int
    scroll_substring_to_point : Pointer(LibAtk::Text), Int32, Int32, LibAtk::CoordType, Int32, Int32 -> LibC::Int
  end

  struct TextRange # struct
    bounds : LibAtk::TextRectangle
    start_offset : Int32
    end_offset : Int32
    content : Pointer(UInt8)
  end

  fun _atk_text_range_get_type = atk_text_range_get_type : UInt64

  struct TextRectangle # struct
    x : Int32
    y : Int32
    width : Int32
    height : Int32
  end

  struct UtilClass # struct
    parent : LibGObject::ObjectClass
    add_global_event_listener : Pointer(Void)
    remove_global_event_listener : UInt32 -> Void
    add_key_event_listener : Pointer(Void)
    remove_key_event_listener : UInt32 -> Void
    get_root : Pointer(Void)
    get_toolkit_name : -> Pointer(UInt8)
    get_toolkit_version : -> Pointer(UInt8)
  end

  struct ValueIface # struct
    parent : LibGObject::TypeInterface
    get_current_value : Pointer(LibAtk::Value), LibGObject::Value -> Void
    get_maximum_value : Pointer(LibAtk::Value), LibGObject::Value -> Void
    get_minimum_value : Pointer(LibAtk::Value), LibGObject::Value -> Void
    set_current_value : Pointer(LibAtk::Value), Pointer(LibGObject::Value) -> LibC::Int
    get_minimum_increment : Pointer(LibAtk::Value), LibGObject::Value -> Void
    get_value_and_text : Pointer(LibAtk::Value), Float64, Pointer(UInt8) -> Void
    get_range : Pointer(LibAtk::Value) -> Pointer(LibAtk::Range)
    get_increment : Pointer(LibAtk::Value) -> Float64
    get_sub_ranges : Pointer(LibAtk::Value) -> Pointer(Void*)
    set_value : Pointer(LibAtk::Value), Float64 -> Void
  end

  struct WindowIface # struct
    parent : LibGObject::TypeInterface
  end

  ###########################################
  # #    Constants
  ###########################################
  BINARY_AGE           = 23511 # : Int32
  INTERFACE_AGE        =     1 # : Int32
  MAJOR_VERSION        =     2 # : Int32
  MICRO_VERSION        =     1 # : Int32
  MINOR_VERSION        =    35 # : Int32
  VERSION_MIN_REQUIRED =     2 # : Int32

  ###########################################
  # #    Enums
  ###########################################

  alias CoordType = UInt32

  alias KeyEventType = UInt32

  alias Layer = UInt32

  alias RelationType = UInt32
  fun relation_type_for_name = atk_relation_type_for_name(name : Pointer(UInt8)) : LibAtk::RelationType
  fun relation_type_get_name = atk_relation_type_get_name(type : LibAtk::RelationType) : Pointer(UInt8)
  fun relation_type_register = atk_relation_type_register(name : Pointer(UInt8)) : LibAtk::RelationType

  alias Role = UInt32
  fun role_for_name = atk_role_for_name(name : Pointer(UInt8)) : LibAtk::Role
  fun role_get_localized_name = atk_role_get_localized_name(role : LibAtk::Role) : Pointer(UInt8)
  fun role_get_name = atk_role_get_name(role : LibAtk::Role) : Pointer(UInt8)
  fun role_register = atk_role_register(name : Pointer(UInt8)) : LibAtk::Role

  alias ScrollType = UInt32

  alias StateType = UInt32
  fun state_type_for_name = atk_state_type_for_name(name : Pointer(UInt8)) : LibAtk::StateType
  fun state_type_get_name = atk_state_type_get_name(type : LibAtk::StateType) : Pointer(UInt8)
  fun state_type_register = atk_state_type_register(name : Pointer(UInt8)) : LibAtk::StateType

  alias TextAttribute = UInt32
  fun text_attribute_for_name = atk_text_attribute_for_name(name : Pointer(UInt8)) : LibAtk::TextAttribute
  fun text_attribute_get_name = atk_text_attribute_get_name(attr : LibAtk::TextAttribute) : Pointer(UInt8)
  fun text_attribute_get_value = atk_text_attribute_get_value(attr : LibAtk::TextAttribute, index_ : Int32) : Pointer(UInt8)
  fun text_attribute_register = atk_text_attribute_register(name : Pointer(UInt8)) : LibAtk::TextAttribute

  alias TextBoundary = UInt32

  alias TextClipType = UInt32

  alias TextGranularity = UInt32

  alias ValueType = UInt32
  fun value_type_get_localized_name = atk_value_type_get_localized_name(value_type : LibAtk::ValueType) : Pointer(UInt8)
  fun value_type_get_name = atk_value_type_get_name(value_type : LibAtk::ValueType) : Pointer(UInt8)

  ###########################################
  # #    Objects
  ###########################################

  struct GObjectAccessible # object
    parent : LibAtk::Object
  end

  fun _atk_gobject_accessible_get_type = atk_gobject_accessible_get_type : UInt64
  fun g_object_accessible_for_object = atk_gobject_accessible_for_object(obj : Pointer(LibGObject::Object)) : Pointer(LibAtk::Object)
  fun g_object_accessible_get_object = atk_gobject_accessible_get_object(this : GObjectAccessible*) : Pointer(LibGObject::Object)

  struct Hyperlink # object
    parent : LibGObject::Object
    # Signal link-activated
    # Virtual function get_end_index
    # Virtual function get_n_anchors
    # Virtual function get_object
    # Virtual function get_start_index
    # Virtual function get_uri
    # Virtual function is_selected_link
    # Virtual function is_valid
    # Virtual function link_activated
    # Virtual function link_state
    # Property end-index : Int32
    # Property number-of-anchors : Int32
    # Property selected-link : LibC::Int
    # Property start-index : Int32
  end

  fun _atk_hyperlink_get_type = atk_hyperlink_get_type : UInt64
  fun hyperlink_get_end_index = atk_hyperlink_get_end_index(this : Hyperlink*) : Int32
  fun hyperlink_get_n_anchors = atk_hyperlink_get_n_anchors(this : Hyperlink*) : Int32
  fun hyperlink_get_object = atk_hyperlink_get_object(this : Hyperlink*, i : Int32) : Pointer(LibAtk::Object)
  fun hyperlink_get_start_index = atk_hyperlink_get_start_index(this : Hyperlink*) : Int32
  fun hyperlink_get_uri = atk_hyperlink_get_uri(this : Hyperlink*, i : Int32) : Pointer(UInt8)
  fun hyperlink_is_inline = atk_hyperlink_is_inline(this : Hyperlink*) : LibC::Int
  fun hyperlink_is_selected_link = atk_hyperlink_is_selected_link(this : Hyperlink*) : LibC::Int
  fun hyperlink_is_valid = atk_hyperlink_is_valid(this : Hyperlink*) : LibC::Int

  struct Misc # object
    parent : LibGObject::Object
    # Virtual function threads_enter
    # Virtual function threads_leave
  end

  fun _atk_misc_get_type = atk_misc_get_type : UInt64
  fun misc_get_instance = atk_misc_get_instance : Pointer(LibAtk::Misc)
  fun misc_threads_enter = atk_misc_threads_enter(this : Misc*) : Void
  fun misc_threads_leave = atk_misc_threads_leave(this : Misc*) : Void

  struct NoOpObject # object
    parent : LibAtk::Object
  end

  fun _atk_no_op_object_get_type = atk_no_op_object_get_type : UInt64
  fun no_op_object_new = atk_no_op_object_new(obj : Pointer(LibGObject::Object)) : Pointer(LibAtk::Object)

  struct NoOpObjectFactory # object
    parent : LibAtk::ObjectFactory
  end

  fun _atk_no_op_object_factory_get_type = atk_no_op_object_factory_get_type : UInt64
  fun no_op_object_factory_new = atk_no_op_object_factory_new : Pointer(LibAtk::ObjectFactory)

  struct Object # object
    parent : LibGObject::Object
    description : Pointer(UInt8)
    name : Pointer(UInt8)
    accessible_parent : Pointer(LibAtk::Object)
    role : LibAtk::Role
    relation_set : Pointer(LibAtk::RelationSet)
    layer : LibAtk::Layer
    # Signal active-descendant-changed
    # Signal children-changed
    # Signal focus-event
    # Signal property-change
    # Signal state-change
    # Signal visible-data-changed
    # Virtual function active_descendant_changed
    # Virtual function children_changed
    # Virtual function focus_event
    # Virtual function get_attributes
    # Virtual function get_description
    # Virtual function get_index_in_parent
    # Virtual function get_layer
    # Virtual function get_mdi_zorder
    # Virtual function get_n_children
    # Virtual function get_name
    # Virtual function get_object_locale
    # Virtual function get_parent
    # Virtual function get_role
    # Virtual function initialize
    # Virtual function property_change
    # Virtual function ref_relation_set
    # Virtual function ref_state_set
    # Virtual function remove_property_change_handler
    # Virtual function set_description
    # Virtual function set_name
    # Virtual function set_parent
    # Virtual function set_role
    # Virtual function state_change
    # Virtual function visible_data_changed
    # Property accessible-component-layer : Int32
    # Property accessible-component-mdi-zorder : Int32
    # Property accessible-description : Pointer(UInt8)
    # Property accessible-hypertext-nlinks : Int32
    # Property accessible-name : Pointer(UInt8)
    # Property accessible-parent : LibAtk::Object
    # Property accessible-role : LibAtk::Role
    # Property accessible-table-caption : Pointer(UInt8)
    # Property accessible-table-caption-object : LibAtk::Object
    # Property accessible-table-column-description : Pointer(UInt8)
    # Property accessible-table-column-header : LibAtk::Object
    # Property accessible-table-row-description : Pointer(UInt8)
    # Property accessible-table-row-header : LibAtk::Object
    # Property accessible-table-summary : LibAtk::Object
    # Property accessible-value : Float64
  end

  fun _atk_object_get_type = atk_object_get_type : UInt64
  fun object_add_relationship = atk_object_add_relationship(this : Object*, relationship : LibAtk::RelationType, target : Pointer(LibAtk::Object)) : LibC::Int
  fun object_get_accessible_id = atk_object_get_accessible_id(this : Object*) : Pointer(UInt8)
  fun object_get_attributes = atk_object_get_attributes(this : Object*) : Pointer(Void*)
  fun object_get_description = atk_object_get_description(this : Object*) : Pointer(UInt8)
  fun object_get_index_in_parent = atk_object_get_index_in_parent(this : Object*) : Int32
  fun object_get_layer = atk_object_get_layer(this : Object*) : LibAtk::Layer
  fun object_get_mdi_zorder = atk_object_get_mdi_zorder(this : Object*) : Int32
  fun object_get_n_accessible_children = atk_object_get_n_accessible_children(this : Object*) : Int32
  fun object_get_name = atk_object_get_name(this : Object*) : Pointer(UInt8)
  fun object_get_object_locale = atk_object_get_object_locale(this : Object*) : Pointer(UInt8)
  fun object_get_parent = atk_object_get_parent(this : Object*) : Pointer(LibAtk::Object)
  fun object_get_role = atk_object_get_role(this : Object*) : LibAtk::Role
  fun object_init = atk_object_initialize(this : Object*, data : Pointer(Void)) : Void
  fun object_notify_state_change = atk_object_notify_state_change(this : Object*, state : UInt64, value : LibC::Int) : Void
  fun object_peek_parent = atk_object_peek_parent(this : Object*) : Pointer(LibAtk::Object)
  fun object_ref_accessible_child = atk_object_ref_accessible_child(this : Object*, i : Int32) : Pointer(LibAtk::Object)
  fun object_ref_relation_set = atk_object_ref_relation_set(this : Object*) : Pointer(LibAtk::RelationSet)
  fun object_ref_state_set = atk_object_ref_state_set(this : Object*) : Pointer(LibAtk::StateSet)
  fun object_remove_property_change_handler = atk_object_remove_property_change_handler(this : Object*, handler_id : UInt32) : Void
  fun object_remove_relationship = atk_object_remove_relationship(this : Object*, relationship : LibAtk::RelationType, target : Pointer(LibAtk::Object)) : LibC::Int
  fun object_set_accessible_id = atk_object_set_accessible_id(this : Object*, name : Pointer(UInt8)) : Void
  fun object_set_description = atk_object_set_description(this : Object*, description : Pointer(UInt8)) : Void
  fun object_set_name = atk_object_set_name(this : Object*, name : Pointer(UInt8)) : Void
  fun object_set_parent = atk_object_set_parent(this : Object*, parent : Pointer(LibAtk::Object)) : Void
  fun object_set_role = atk_object_set_role(this : Object*, role : LibAtk::Role) : Void

  struct ObjectFactory # object
    parent : LibGObject::Object
    # Virtual function invalidate
  end

  fun _atk_object_factory_get_type = atk_object_factory_get_type : UInt64
  fun object_factory_create_accessible = atk_object_factory_create_accessible(this : ObjectFactory*, obj : Pointer(LibGObject::Object)) : Pointer(LibAtk::Object)
  fun object_factory_get_accessible_type = atk_object_factory_get_accessible_type(this : ObjectFactory*) : UInt64
  fun object_factory_invalidate = atk_object_factory_invalidate(this : ObjectFactory*) : Void

  struct Plug # object
    parent : LibAtk::Object
    # Virtual function get_object_id
  end

  fun _atk_plug_get_type = atk_plug_get_type : UInt64
  fun plug_new = atk_plug_new : Pointer(LibAtk::Object)
  fun plug_get_id = atk_plug_get_id(this : Plug*) : Pointer(UInt8)
  fun plug_set_child = atk_plug_set_child(this : Plug*, child : Pointer(LibAtk::Object)) : Void

  struct Registry # object
    parent : LibGObject::Object
    factory_type_registry : Pointer(Void*)
    factory_singleton_cache : Pointer(Void*)
  end

  fun _atk_registry_get_type = atk_registry_get_type : UInt64
  fun registry_get_factory = atk_registry_get_factory(this : Registry*, type : UInt64) : Pointer(LibAtk::ObjectFactory)
  fun registry_get_factory_type = atk_registry_get_factory_type(this : Registry*, type : UInt64) : UInt64
  fun registry_set_factory_type = atk_registry_set_factory_type(this : Registry*, type : UInt64, factory_type : UInt64) : Void

  struct Relation # object
    parent : LibGObject::Object
    target : Pointer(Void)
    relationship : LibAtk::RelationType
    # Property relation-type : LibAtk::RelationType
    # Property target : LibGObject::ValueArray
  end

  fun _atk_relation_get_type = atk_relation_get_type : UInt64
  fun relation_new = atk_relation_new(targets : Pointer(Pointer(LibAtk::Object)), n_targets : Int32, relationship : LibAtk::RelationType) : Pointer(LibAtk::Relation)
  fun relation_add_target = atk_relation_add_target(this : Relation*, target : Pointer(LibAtk::Object)) : Void
  fun relation_get_relation_type = atk_relation_get_relation_type(this : Relation*) : LibAtk::RelationType
  fun relation_get_target = atk_relation_get_target(this : Relation*) : Pointer(Void)
  fun relation_remove_target = atk_relation_remove_target(this : Relation*, target : Pointer(LibAtk::Object)) : LibC::Int

  struct RelationSet # object
    parent : LibGObject::Object
    relations : Pointer(Void)
  end

  fun _atk_relation_set_get_type = atk_relation_set_get_type : UInt64
  fun relation_set_new = atk_relation_set_new : Pointer(LibAtk::RelationSet)
  fun relation_set_add = atk_relation_set_add(this : RelationSet*, relation : Pointer(LibAtk::Relation)) : Void
  fun relation_set_add_relation_by_type = atk_relation_set_add_relation_by_type(this : RelationSet*, relationship : LibAtk::RelationType, target : Pointer(LibAtk::Object)) : Void
  fun relation_set_contains = atk_relation_set_contains(this : RelationSet*, relationship : LibAtk::RelationType) : LibC::Int
  fun relation_set_contains_target = atk_relation_set_contains_target(this : RelationSet*, relationship : LibAtk::RelationType, target : Pointer(LibAtk::Object)) : LibC::Int
  fun relation_set_get_n_relations = atk_relation_set_get_n_relations(this : RelationSet*) : Int32
  fun relation_set_get_relation = atk_relation_set_get_relation(this : RelationSet*, i : Int32) : Pointer(LibAtk::Relation)
  fun relation_set_get_relation_by_type = atk_relation_set_get_relation_by_type(this : RelationSet*, relationship : LibAtk::RelationType) : Pointer(LibAtk::Relation)
  fun relation_set_remove = atk_relation_set_remove(this : RelationSet*, relation : Pointer(LibAtk::Relation)) : Void

  struct Socket # object
    parent : LibAtk::Object
    embedded_plug_id : Pointer(UInt8)
    # Virtual function embed
  end

  fun _atk_socket_get_type = atk_socket_get_type : UInt64
  fun socket_new = atk_socket_new : Pointer(LibAtk::Object)
  fun socket_embed = atk_socket_embed(this : Socket*, plug_id : Pointer(UInt8)) : Void
  fun socket_is_occupied = atk_socket_is_occupied(this : Socket*) : LibC::Int

  struct StateSet # object
    parent : LibGObject::Object
  end

  fun _atk_state_set_get_type = atk_state_set_get_type : UInt64
  fun state_set_new = atk_state_set_new : Pointer(LibAtk::StateSet)
  fun state_set_add_state = atk_state_set_add_state(this : StateSet*, type : LibAtk::StateType) : LibC::Int
  fun state_set_add_states = atk_state_set_add_states(this : StateSet*, types : Pointer(LibAtk::StateType), n_types : Int32) : Void
  fun state_set_and_sets = atk_state_set_and_sets(this : StateSet*, compare_set : Pointer(LibAtk::StateSet)) : Pointer(LibAtk::StateSet)
  fun state_set_clear_states = atk_state_set_clear_states(this : StateSet*) : Void
  fun state_set_contains_state = atk_state_set_contains_state(this : StateSet*, type : LibAtk::StateType) : LibC::Int
  fun state_set_contains_states = atk_state_set_contains_states(this : StateSet*, types : Pointer(LibAtk::StateType), n_types : Int32) : LibC::Int
  fun state_set_is_empty = atk_state_set_is_empty(this : StateSet*) : LibC::Int
  fun state_set_or_sets = atk_state_set_or_sets(this : StateSet*, compare_set : Pointer(LibAtk::StateSet)) : Pointer(LibAtk::StateSet)
  fun state_set_remove_state = atk_state_set_remove_state(this : StateSet*, type : LibAtk::StateType) : LibC::Int
  fun state_set_xor_sets = atk_state_set_xor_sets(this : StateSet*, compare_set : Pointer(LibAtk::StateSet)) : Pointer(LibAtk::StateSet)

  struct Util # object
    parent : LibGObject::Object
  end

  fun _atk_util_get_type = atk_util_get_type : UInt64

  ###########################################
  # #    Flags
  ###########################################

  alias HyperlinkStateFlags = UInt32

  ###########################################
  # #    Functions
  ###########################################
  fun attribute_set_free = atk_attribute_set_free(attrib_set : Pointer(Void*)) : Void
  fun focus_tracker_notify = atk_focus_tracker_notify(object : Pointer(LibAtk::Object)) : Void
  fun get_binary_age = atk_get_binary_age : UInt32
  fun get_default_registry = atk_get_default_registry : Pointer(LibAtk::Registry)
  fun get_focus_object = atk_get_focus_object : Pointer(LibAtk::Object)
  fun get_interface_age = atk_get_interface_age : UInt32
  fun get_major_version = atk_get_major_version : UInt32
  fun get_micro_version = atk_get_micro_version : UInt32
  fun get_minor_version = atk_get_minor_version : UInt32
  fun get_root = atk_get_root : Pointer(LibAtk::Object)
  fun get_toolkit_name = atk_get_toolkit_name : Pointer(UInt8)
  fun get_toolkit_version = atk_get_toolkit_version : Pointer(UInt8)
  fun get_version = atk_get_version : Pointer(UInt8)
  fun relation_type_for_name = atk_relation_type_for_name(name : Pointer(UInt8)) : LibAtk::RelationType
  fun relation_type_get_name = atk_relation_type_get_name(type : LibAtk::RelationType) : Pointer(UInt8)
  fun relation_type_register = atk_relation_type_register(name : Pointer(UInt8)) : LibAtk::RelationType
  fun remove_focus_tracker = atk_remove_focus_tracker(tracker_id : UInt32) : Void
  fun remove_global_event_listener = atk_remove_global_event_listener(listener_id : UInt32) : Void
  fun remove_key_event_listener = atk_remove_key_event_listener(listener_id : UInt32) : Void
  fun role_for_name = atk_role_for_name(name : Pointer(UInt8)) : LibAtk::Role
  fun role_get_localized_name = atk_role_get_localized_name(role : LibAtk::Role) : Pointer(UInt8)
  fun role_get_name = atk_role_get_name(role : LibAtk::Role) : Pointer(UInt8)
  fun role_register = atk_role_register(name : Pointer(UInt8)) : LibAtk::Role
  fun state_type_for_name = atk_state_type_for_name(name : Pointer(UInt8)) : LibAtk::StateType
  fun state_type_get_name = atk_state_type_get_name(type : LibAtk::StateType) : Pointer(UInt8)
  fun state_type_register = atk_state_type_register(name : Pointer(UInt8)) : LibAtk::StateType
  fun text_attribute_for_name = atk_text_attribute_for_name(name : Pointer(UInt8)) : LibAtk::TextAttribute
  fun text_attribute_get_name = atk_text_attribute_get_name(attr : LibAtk::TextAttribute) : Pointer(UInt8)
  fun text_attribute_get_value = atk_text_attribute_get_value(attr : LibAtk::TextAttribute, index_ : Int32) : Pointer(UInt8)
  fun text_attribute_register = atk_text_attribute_register(name : Pointer(UInt8)) : LibAtk::TextAttribute
  fun text_free_ranges = atk_text_free_ranges(ranges : Pointer(Pointer(LibAtk::TextRange))) : Void
  fun value_type_get_localized_name = atk_value_type_get_localized_name(value_type : LibAtk::ValueType) : Pointer(UInt8)
  fun value_type_get_name = atk_value_type_get_name(value_type : LibAtk::ValueType) : Pointer(UInt8)

  ###########################################
  # #    Callbacks
  ###########################################
  alias EventListener = Pointer(LibAtk::Object) -> Void
  alias EventListenerInit = -> Void
  alias FocusHandler = Pointer(LibAtk::Object), LibC::Int -> Void
  alias Function = Pointer(Void) -> LibC::Int
  alias KeySnoopFunc = Pointer(LibAtk::KeyEventStruct), Pointer(Void) -> Int32
  alias PropertyChangeHandler = Pointer(LibAtk::Object), Pointer(LibAtk::PropertyValues) -> Void
end

module Atk
  BINARY_AGE           = LibAtk::BINARY_AGE
  INTERFACE_AGE        = LibAtk::INTERFACE_AGE
  MAJOR_VERSION        = LibAtk::MAJOR_VERSION
  MICRO_VERSION        = LibAtk::MICRO_VERSION
  MINOR_VERSION        = LibAtk::MINOR_VERSION
  VERSION_MIN_REQUIRED = LibAtk::VERSION_MIN_REQUIRED

  def self.attribute_set_free(attrib_set : Void*)
    LibAtk.attribute_set_free(attrib_set)
    nil
  end

  def self.focus_tracker_notify(object : Atk::Object)
    LibAtk.focus_tracker_notify(object.to_unsafe_object)
    nil
  end

  def self.binary_age
    __var0 = LibAtk.get_binary_age
    __var0
  end

  def self.default_registry
    __var0 = LibAtk.get_default_registry
    GObject.raise_unexpected_null("atk_get_default_registry") if __var0.null?
    Atk::Registry.new(__var0)
  end

  def self.focus_object
    __var0 = LibAtk.get_focus_object
    GObject.raise_unexpected_null("atk_get_focus_object") if __var0.null?
    Atk::Object.new(__var0)
  end

  def self.interface_age
    __var0 = LibAtk.get_interface_age
    __var0
  end

  def self.major_version
    __var0 = LibAtk.get_major_version
    __var0
  end

  def self.micro_version
    __var0 = LibAtk.get_micro_version
    __var0
  end

  def self.minor_version
    __var0 = LibAtk.get_minor_version
    __var0
  end

  def self.root
    __var0 = LibAtk.get_root
    GObject.raise_unexpected_null("atk_get_root") if __var0.null?
    Atk::Object.new(__var0)
  end

  def self.toolkit_name
    __var0 = LibAtk.get_toolkit_name
    GObject.raise_unexpected_null("atk_get_toolkit_name") if __var0.null?
    ::String.new(__var0)
  end

  def self.toolkit_version
    __var0 = LibAtk.get_toolkit_version
    GObject.raise_unexpected_null("atk_get_toolkit_version") if __var0.null?
    ::String.new(__var0)
  end

  def self.version
    __var0 = LibAtk.get_version
    GObject.raise_unexpected_null("atk_get_version") if __var0.null?
    ::String.new(__var0)
  end

  def self.relation_type_for_name(name : ::String)
    __var0 = LibAtk.relation_type_for_name(name.to_unsafe)
    Atk::RelationType.new(__var0)
  end

  def self.relation_type_get_name(type : Atk::RelationType)
    __var0 = LibAtk.relation_type_get_name(type)
    GObject.raise_unexpected_null("atk_relation_type_get_name") if __var0.null?
    ::String.new(__var0)
  end

  def self.relation_type_register(name : ::String)
    __var0 = LibAtk.relation_type_register(name.to_unsafe)
    Atk::RelationType.new(__var0)
  end

  def self.remove_focus_tracker(tracker_id : ::Int)
    LibAtk.remove_focus_tracker(UInt32.new(tracker_id))
    nil
  end

  def self.remove_global_event_listener(listener_id : ::Int)
    LibAtk.remove_global_event_listener(UInt32.new(listener_id))
    nil
  end

  def self.remove_key_event_listener(listener_id : ::Int)
    LibAtk.remove_key_event_listener(UInt32.new(listener_id))
    nil
  end

  def self.role_for_name(name : ::String)
    __var0 = LibAtk.role_for_name(name.to_unsafe)
    Atk::Role.new(__var0)
  end

  def self.role_get_localized_name(role : Atk::Role)
    __var0 = LibAtk.role_get_localized_name(role)
    GObject.raise_unexpected_null("atk_role_get_localized_name") if __var0.null?
    ::String.new(__var0)
  end

  def self.role_get_name(role : Atk::Role)
    __var0 = LibAtk.role_get_name(role)
    GObject.raise_unexpected_null("atk_role_get_name") if __var0.null?
    ::String.new(__var0)
  end

  def self.role_register(name : ::String)
    __var0 = LibAtk.role_register(name.to_unsafe)
    Atk::Role.new(__var0)
  end

  def self.state_type_for_name(name : ::String)
    __var0 = LibAtk.state_type_for_name(name.to_unsafe)
    Atk::StateType.new(__var0)
  end

  def self.state_type_get_name(type : Atk::StateType)
    __var0 = LibAtk.state_type_get_name(type)
    GObject.raise_unexpected_null("atk_state_type_get_name") if __var0.null?
    ::String.new(__var0)
  end

  def self.state_type_register(name : ::String)
    __var0 = LibAtk.state_type_register(name.to_unsafe)
    Atk::StateType.new(__var0)
  end

  def self.text_attribute_for_name(name : ::String)
    __var0 = LibAtk.text_attribute_for_name(name.to_unsafe)
    Atk::TextAttribute.new(__var0)
  end

  def self.text_attribute_get_name(attr : Atk::TextAttribute)
    __var0 = LibAtk.text_attribute_get_name(attr)
    GObject.raise_unexpected_null("atk_text_attribute_get_name") if __var0.null?
    ::String.new(__var0)
  end

  def self.text_attribute_get_value(attr : Atk::TextAttribute, index_ : ::Int)
    __var0 = LibAtk.text_attribute_get_value(attr, Int32.new(index_))
    __var1 = ::String.new(__var0) if __var0
    __var1
  end

  def self.text_attribute_register(name : ::String)
    __var0 = LibAtk.text_attribute_register(name.to_unsafe)
    Atk::TextAttribute.new(__var0)
  end

  def self.text_free_ranges(ranges : ::Enumerable)
    LibAtk.text_free_ranges((__ranges_ary = ranges.map { |__item| __item.to_unsafe.as(LibAtk::TextRange*) }.to_a).to_unsafe)
    nil
  end

  def self.value_type_get_localized_name(value_type : Atk::ValueType)
    __var0 = LibAtk.value_type_get_localized_name(value_type)
    GObject.raise_unexpected_null("atk_value_type_get_localized_name") if __var0.null?
    ::String.new(__var0)
  end

  def self.value_type_get_name(value_type : Atk::ValueType)
    __var0 = LibAtk.value_type_get_name(value_type)
    GObject.raise_unexpected_null("atk_value_type_get_name") if __var0.null?
    ::String.new(__var0)
  end

  module Action
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include Action
      @pointer : Void*

      def initialize(pointer : LibAtk::Action*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a AtkAction")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_action_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibAtk::Action*)
      end

      def to_unsafe_action
        @pointer.not_nil!.as(LibAtk::Action*)
      end
    end

    def to_unsafe_action
      @pointer.not_nil!.as(LibAtk::Action*)
    end

    def do_action(i : ::Int)
      __var0 = LibAtk.action_do_action(@pointer.as(LibAtk::Action*), Int32.new(i))
      (__var0 == 1)
    end

    def description(i : ::Int)
      __var0 = LibAtk.action_get_description(@pointer.as(LibAtk::Action*), Int32.new(i))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def keybinding(i : ::Int)
      __var0 = LibAtk.action_get_keybinding(@pointer.as(LibAtk::Action*), Int32.new(i))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def localized_name(i : ::Int)
      __var0 = LibAtk.action_get_localized_name(@pointer.as(LibAtk::Action*), Int32.new(i))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def n_actions
      __var0 = LibAtk.action_get_n_actions(@pointer.as(LibAtk::Action*))
      __var0
    end

    def name(i : ::Int)
      __var0 = LibAtk.action_get_name(@pointer.as(LibAtk::Action*), Int32.new(i))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def set_description(i : ::Int, desc : ::String)
      __var0 = LibAtk.action_set_description(@pointer.as(LibAtk::Action*), Int32.new(i), desc.to_unsafe)
      (__var0 == 1)
    end
  end

  class ActionIface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(72u64, 0u8).as(LibAtk::ActionIface*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::ActionIface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::ActionIface*)
    end

    def to_unsafe_actioniface
      @pointer.not_nil!.as(LibAtk::ActionIface*)
    end

    def parent
      GObject::TypeInterface.new(to_unsafe.as(LibAtk::ActionIface*).value.parent)
    end

    def do_action
      to_unsafe.as(LibAtk::ActionIface*).value.do_action
    end

    def get_n_actions
      to_unsafe.as(LibAtk::ActionIface*).value.get_n_actions
    end

    def get_description
      to_unsafe.as(LibAtk::ActionIface*).value.get_description
    end

    def get_name
      to_unsafe.as(LibAtk::ActionIface*).value.get_name
    end

    def get_keybinding
      to_unsafe.as(LibAtk::ActionIface*).value.get_keybinding
    end

    def set_description
      to_unsafe.as(LibAtk::ActionIface*).value.set_description
    end

    def get_localized_name
      to_unsafe.as(LibAtk::ActionIface*).value.get_localized_name
    end
  end

  class Attribute
    include GObject::WrappedType

    def self.new(name : ::String? = nil, value : ::String? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibAtk::Attribute*))
      __var0.name = name unless name.nil?
      __var0.value = value unless value.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::Attribute*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::Attribute*)
    end

    def to_unsafe_attribute
      @pointer.not_nil!.as(LibAtk::Attribute*)
    end

    def self.set_free(attrib_set : Void*)
      LibAtk.attribute_set_free(attrib_set)
      nil
    end

    def name
      ::String.new(to_unsafe.as(LibAtk::Attribute*).value.name)
    end

    def name=(value : ::String)
      to_unsafe.as(LibAtk::Attribute*).value.name = value.to_unsafe
    end

    def value
      ::String.new(to_unsafe.as(LibAtk::Attribute*).value.value)
    end

    def value=(value : ::String)
      to_unsafe.as(LibAtk::Attribute*).value.value = value.to_unsafe
    end
  end

  module Component
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include Component
      @pointer : Void*

      def initialize(pointer : LibAtk::Component*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a AtkComponent")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_component_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibAtk::Component*)
      end

      def to_unsafe_component
        @pointer.not_nil!.as(LibAtk::Component*)
      end
    end

    def to_unsafe_component
      @pointer.not_nil!.as(LibAtk::Component*)
    end

    def contains(x : ::Int, y : ::Int, coord_type : Atk::CoordType)
      __var0 = LibAtk.component_contains(@pointer.as(LibAtk::Component*), Int32.new(x), Int32.new(y), coord_type)
      (__var0 == 1)
    end

    def alpha
      __var0 = LibAtk.component_get_alpha(@pointer.as(LibAtk::Component*))
      __var0
    end

    def extents(coord_type : Atk::CoordType)
      LibAtk.component_get_extents(@pointer.as(LibAtk::Component*), out x, out y, out width, out height, coord_type)
      {x, y, width, height}
    end

    def layer
      __var0 = LibAtk.component_get_layer(@pointer.as(LibAtk::Component*))
      Atk::Layer.new(__var0)
    end

    def mdi_zorder
      __var0 = LibAtk.component_get_mdi_zorder(@pointer.as(LibAtk::Component*))
      __var0
    end

    def position(coord_type : Atk::CoordType)
      LibAtk.component_get_position(@pointer.as(LibAtk::Component*), out x, out y, coord_type)
      {x, y}
    end

    def size
      LibAtk.component_get_size(@pointer.as(LibAtk::Component*), out width, out height)
      {width, height}
    end

    def grab_focus
      __var0 = LibAtk.component_grab_focus(@pointer.as(LibAtk::Component*))
      (__var0 == 1)
    end

    def ref_accessible_at_point(x : ::Int, y : ::Int, coord_type : Atk::CoordType)
      __var0 = LibAtk.component_ref_accessible_at_point(@pointer.as(LibAtk::Component*), Int32.new(x), Int32.new(y), coord_type)
      __var1 = Atk::Object.new(__var0) if __var0
      __var1
    end

    def remove_focus_handler(handler_id : ::Int)
      LibAtk.component_remove_focus_handler(@pointer.as(LibAtk::Component*), UInt32.new(handler_id))
      nil
    end

    def scroll_to(type : Atk::ScrollType)
      __var0 = LibAtk.component_scroll_to(@pointer.as(LibAtk::Component*), type)
      (__var0 == 1)
    end

    def scroll_to_point(coords : Atk::CoordType, x : ::Int, y : ::Int)
      __var0 = LibAtk.component_scroll_to_point(@pointer.as(LibAtk::Component*), coords, Int32.new(x), Int32.new(y))
      (__var0 == 1)
    end

    def set_extents(x : ::Int, y : ::Int, width : ::Int, height : ::Int, coord_type : Atk::CoordType)
      __var0 = LibAtk.component_set_extents(@pointer.as(LibAtk::Component*), Int32.new(x), Int32.new(y), Int32.new(width), Int32.new(height), coord_type)
      (__var0 == 1)
    end

    def set_position(x : ::Int, y : ::Int, coord_type : Atk::CoordType)
      __var0 = LibAtk.component_set_position(@pointer.as(LibAtk::Component*), Int32.new(x), Int32.new(y), coord_type)
      (__var0 == 1)
    end

    def set_size(width : ::Int, height : ::Int)
      __var0 = LibAtk.component_set_size(@pointer.as(LibAtk::Component*), Int32.new(width), Int32.new(height))
      (__var0 == 1)
    end

    alias BoundsChangedSignal = Component, Atk::Rectangle -> Nil

    def on_bounds_changed(*, after = false, &block : BoundsChangedSignal)
      __var0 = ->(arg0 : LibAtk::Component*, arg1 : LibAtk::Rectangle*, box : Void*) {
        ::Box(BoundsChangedSignal).unbox(box).call(Component::Wrapper.new(arg0), arg1.null? ? GObject.raise_unexpected_null("arg1 in bounds_changed") : Atk::Rectangle.new(arg1))
      }

      __var1 = ::Box.box(BoundsChangedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "bounds-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_bounds_changed(&block : BoundsChangedSignal)
      on_bounds_changed(after: true, &block)
    end
  end

  class ComponentIface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(152u64, 0u8).as(LibAtk::ComponentIface*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::ComponentIface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::ComponentIface*)
    end

    def to_unsafe_componentiface
      @pointer.not_nil!.as(LibAtk::ComponentIface*)
    end

    def parent
      GObject::TypeInterface.new(to_unsafe.as(LibAtk::ComponentIface*).value.parent)
    end

    def add_focus_handler
      to_unsafe.as(LibAtk::ComponentIface*).value.add_focus_handler
    end

    def contains
      to_unsafe.as(LibAtk::ComponentIface*).value.contains
    end

    def ref_accessible_at_point
      to_unsafe.as(LibAtk::ComponentIface*).value.ref_accessible_at_point
    end

    def get_extents
      to_unsafe.as(LibAtk::ComponentIface*).value.get_extents
    end

    def get_position
      to_unsafe.as(LibAtk::ComponentIface*).value.get_position
    end

    def get_size
      to_unsafe.as(LibAtk::ComponentIface*).value.get_size
    end

    def grab_focus
      to_unsafe.as(LibAtk::ComponentIface*).value.grab_focus
    end

    def remove_focus_handler
      to_unsafe.as(LibAtk::ComponentIface*).value.remove_focus_handler
    end

    def set_extents
      to_unsafe.as(LibAtk::ComponentIface*).value.set_extents
    end

    def set_position
      to_unsafe.as(LibAtk::ComponentIface*).value.set_position
    end

    def set_size
      to_unsafe.as(LibAtk::ComponentIface*).value.set_size
    end

    def get_layer
      to_unsafe.as(LibAtk::ComponentIface*).value.get_layer
    end

    def get_mdi_zorder
      to_unsafe.as(LibAtk::ComponentIface*).value.get_mdi_zorder
    end

    def bounds_changed
      to_unsafe.as(LibAtk::ComponentIface*).value.bounds_changed
    end

    def get_alpha
      to_unsafe.as(LibAtk::ComponentIface*).value.get_alpha
    end

    def scroll_to
      to_unsafe.as(LibAtk::ComponentIface*).value.scroll_to
    end

    def scroll_to_point
      to_unsafe.as(LibAtk::ComponentIface*).value.scroll_to_point
    end
  end

  enum CoordType : UInt32
    SCREEN = 0
    WINDOW = 1
    PARENT = 2
  end

  module Document
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include Document
      @pointer : Void*

      def initialize(pointer : LibAtk::Document*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a AtkDocument")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_document_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibAtk::Document*)
      end

      def to_unsafe_document
        @pointer.not_nil!.as(LibAtk::Document*)
      end
    end

    def to_unsafe_document
      @pointer.not_nil!.as(LibAtk::Document*)
    end

    def attribute_value(attribute_name : ::String)
      __var0 = LibAtk.document_get_attribute_value(@pointer.as(LibAtk::Document*), attribute_name.to_unsafe)
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def attributes
      __var0 = LibAtk.document_get_attributes(@pointer.as(LibAtk::Document*))
      GObject.raise_unexpected_null("atk_document_get_attributes") if __var0.null?
      GLib::SListIterator(Void*, Pointer(Void)*).new(GLib::SList.new(__var0.as(LibGLib::SList*)))
    end

    def current_page_number
      __var0 = LibAtk.document_get_current_page_number(@pointer.as(LibAtk::Document*))
      __var0
    end

    def document
      LibAtk.document_get_document(@pointer.as(LibAtk::Document*))
      nil
    end

    def document_type
      __var0 = LibAtk.document_get_document_type(@pointer.as(LibAtk::Document*))
      GObject.raise_unexpected_null("atk_document_get_document_type") if __var0.null?
      ::String.new(__var0)
    end

    def locale
      __var0 = LibAtk.document_get_locale(@pointer.as(LibAtk::Document*))
      GObject.raise_unexpected_null("atk_document_get_locale") if __var0.null?
      ::String.new(__var0)
    end

    def page_count
      __var0 = LibAtk.document_get_page_count(@pointer.as(LibAtk::Document*))
      __var0
    end

    def set_attribute_value(attribute_name : ::String, attribute_value : ::String)
      __var0 = LibAtk.document_set_attribute_value(@pointer.as(LibAtk::Document*), attribute_name.to_unsafe, attribute_value.to_unsafe)
      (__var0 == 1)
    end

    alias LoadCompleteSignal = Document -> Nil

    def on_load_complete(*, after = false, &block : LoadCompleteSignal)
      __var0 = ->(arg0 : LibAtk::Document*, box : Void*) {
        ::Box(LoadCompleteSignal).unbox(box).call(Document::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(LoadCompleteSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "load-complete", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_load_complete(&block : LoadCompleteSignal)
      on_load_complete(after: true, &block)
    end

    alias LoadStoppedSignal = Document -> Nil

    def on_load_stopped(*, after = false, &block : LoadStoppedSignal)
      __var0 = ->(arg0 : LibAtk::Document*, box : Void*) {
        ::Box(LoadStoppedSignal).unbox(box).call(Document::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(LoadStoppedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "load-stopped", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_load_stopped(&block : LoadStoppedSignal)
      on_load_stopped(after: true, &block)
    end

    alias PageChangedSignal = Document, Int32 -> Nil

    def on_page_changed(*, after = false, &block : PageChangedSignal)
      __var0 = ->(arg0 : LibAtk::Document*, arg1 : Int32, box : Void*) {
        ::Box(PageChangedSignal).unbox(box).call(Document::Wrapper.new(arg0), arg1)
      }

      __var1 = ::Box.box(PageChangedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "page-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_page_changed(&block : PageChangedSignal)
      on_page_changed(after: true, &block)
    end

    alias ReloadSignal = Document -> Nil

    def on_reload(*, after = false, &block : ReloadSignal)
      __var0 = ->(arg0 : LibAtk::Document*, box : Void*) {
        ::Box(ReloadSignal).unbox(box).call(Document::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(ReloadSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "reload", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_reload(&block : ReloadSignal)
      on_reload(after: true, &block)
    end
  end

  class DocumentIface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(80u64, 0u8).as(LibAtk::DocumentIface*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::DocumentIface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::DocumentIface*)
    end

    def to_unsafe_documentiface
      @pointer.not_nil!.as(LibAtk::DocumentIface*)
    end

    def parent
      GObject::TypeInterface.new(to_unsafe.as(LibAtk::DocumentIface*).value.parent)
    end

    def get_document_type
      to_unsafe.as(LibAtk::DocumentIface*).value.get_document_type
    end

    def get_document
      to_unsafe.as(LibAtk::DocumentIface*).value.get_document
    end

    def get_document_locale
      to_unsafe.as(LibAtk::DocumentIface*).value.get_document_locale
    end

    def get_document_attributes
      to_unsafe.as(LibAtk::DocumentIface*).value.get_document_attributes
    end

    def get_document_attribute_value
      to_unsafe.as(LibAtk::DocumentIface*).value.get_document_attribute_value
    end

    def set_document_attribute
      to_unsafe.as(LibAtk::DocumentIface*).value.set_document_attribute
    end

    def get_current_page_number
      to_unsafe.as(LibAtk::DocumentIface*).value.get_current_page_number
    end

    def get_page_count
      to_unsafe.as(LibAtk::DocumentIface*).value.get_page_count
    end
  end

  module EditableText
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include EditableText
      @pointer : Void*

      def initialize(pointer : LibAtk::EditableText*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a AtkEditableText")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_editable_text_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibAtk::EditableText*)
      end

      def to_unsafe_editabletext
        @pointer.not_nil!.as(LibAtk::EditableText*)
      end
    end

    def to_unsafe_editabletext
      @pointer.not_nil!.as(LibAtk::EditableText*)
    end

    def copy_text(start_pos : ::Int, end_pos : ::Int)
      LibAtk.editable_text_copy_text(@pointer.as(LibAtk::EditableText*), Int32.new(start_pos), Int32.new(end_pos))
      nil
    end

    def cut_text(start_pos : ::Int, end_pos : ::Int)
      LibAtk.editable_text_cut_text(@pointer.as(LibAtk::EditableText*), Int32.new(start_pos), Int32.new(end_pos))
      nil
    end

    def delete_text(start_pos : ::Int, end_pos : ::Int)
      LibAtk.editable_text_delete_text(@pointer.as(LibAtk::EditableText*), Int32.new(start_pos), Int32.new(end_pos))
      nil
    end

    def insert_text(string : ::String, length : ::Int, position : ::Int)
      LibAtk.editable_text_insert_text(@pointer.as(LibAtk::EditableText*), string.to_unsafe, Int32.new(length), position)
      nil
    end

    def paste_text(position : ::Int)
      LibAtk.editable_text_paste_text(@pointer.as(LibAtk::EditableText*), Int32.new(position))
      nil
    end

    def set_run_attributes(attrib_set : Void*, start_offset : ::Int, end_offset : ::Int)
      __var0 = LibAtk.editable_text_set_run_attributes(@pointer.as(LibAtk::EditableText*), attrib_set, Int32.new(start_offset), Int32.new(end_offset))
      (__var0 == 1)
    end

    def text_contents=(string : ::String)
      LibAtk.editable_text_set_text_contents(@pointer.as(LibAtk::EditableText*), string.to_unsafe)
      nil
    end
  end

  class EditableTextIface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(72u64, 0u8).as(LibAtk::EditableTextIface*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::EditableTextIface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::EditableTextIface*)
    end

    def to_unsafe_editabletextiface
      @pointer.not_nil!.as(LibAtk::EditableTextIface*)
    end

    def parent_interface
      GObject::TypeInterface.new(to_unsafe.as(LibAtk::EditableTextIface*).value.parent_interface)
    end

    def set_run_attributes
      to_unsafe.as(LibAtk::EditableTextIface*).value.set_run_attributes
    end

    def set_text_contents
      to_unsafe.as(LibAtk::EditableTextIface*).value.set_text_contents
    end

    def insert_text
      to_unsafe.as(LibAtk::EditableTextIface*).value.insert_text
    end

    def copy_text
      to_unsafe.as(LibAtk::EditableTextIface*).value.copy_text
    end

    def cut_text
      to_unsafe.as(LibAtk::EditableTextIface*).value.cut_text
    end

    def delete_text
      to_unsafe.as(LibAtk::EditableTextIface*).value.delete_text
    end

    def paste_text
      to_unsafe.as(LibAtk::EditableTextIface*).value.paste_text
    end
  end

  alias EventListener = LibAtk::EventListener
  alias EventListenerInit = LibAtk::EventListenerInit
  alias FocusHandler = LibAtk::FocusHandler
  alias Function = LibAtk::Function

  class Object < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibAtk::Object*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a AtkObject")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_object_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::Object*)
    end

    def to_unsafe_object
      @pointer.not_nil!.as(LibAtk::Object*)
    end

    def initialize(*, accessible_description : ::String? = nil, accessible_name : ::String? = nil, accessible_parent : Atk::Object? = nil, accessible_role : Atk::Role? = nil, accessible_table_caption : ::String? = nil, accessible_table_caption_object : Atk::Object? = nil, accessible_table_column_description : ::String? = nil, accessible_table_column_header : Atk::Object? = nil, accessible_table_row_description : ::String? = nil, accessible_table_row_header : Atk::Object? = nil, accessible_table_summary : Atk::Object? = nil, accessible_value : Float64? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless accessible_description.nil?
        __var0 << "accessible-description".to_unsafe
        __var1 << accessible_description.to_gvalue.to_unsafe.value
      end

      unless accessible_name.nil?
        __var0 << "accessible-name".to_unsafe
        __var1 << accessible_name.to_gvalue.to_unsafe.value
      end

      unless accessible_parent.nil?
        __var0 << "accessible-parent".to_unsafe
        __var1 << accessible_parent.to_gvalue.to_unsafe.value
      end

      unless accessible_role.nil?
        __var0 << "accessible-role".to_unsafe
        __var1 << accessible_role.to_gvalue.to_unsafe.value
      end

      unless accessible_table_caption.nil?
        __var0 << "accessible-table-caption".to_unsafe
        __var1 << accessible_table_caption.to_gvalue.to_unsafe.value
      end

      unless accessible_table_caption_object.nil?
        __var0 << "accessible-table-caption-object".to_unsafe
        __var1 << accessible_table_caption_object.to_gvalue.to_unsafe.value
      end

      unless accessible_table_column_description.nil?
        __var0 << "accessible-table-column-description".to_unsafe
        __var1 << accessible_table_column_description.to_gvalue.to_unsafe.value
      end

      unless accessible_table_column_header.nil?
        __var0 << "accessible-table-column-header".to_unsafe
        __var1 << accessible_table_column_header.to_gvalue.to_unsafe.value
      end

      unless accessible_table_row_description.nil?
        __var0 << "accessible-table-row-description".to_unsafe
        __var1 << accessible_table_row_description.to_gvalue.to_unsafe.value
      end

      unless accessible_table_row_header.nil?
        __var0 << "accessible-table-row-header".to_unsafe
        __var1 << accessible_table_row_header.to_gvalue.to_unsafe.value
      end

      unless accessible_table_summary.nil?
        __var0 << "accessible-table-summary".to_unsafe
        __var1 << accessible_table_summary.to_gvalue.to_unsafe.value
      end

      unless accessible_value.nil?
        __var0 << "accessible-value".to_unsafe
        __var1 << accessible_value.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibAtk._atk_object_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def add_relationship(relationship : Atk::RelationType, target : Atk::Object)
      __var0 = LibAtk.object_add_relationship(@pointer.as(LibAtk::Object*), relationship, target.to_unsafe_object)
      (__var0 == 1)
    end

    def accessible_id
      __var0 = LibAtk.object_get_accessible_id(@pointer.as(LibAtk::Object*))
      GObject.raise_unexpected_null("atk_object_get_accessible_id") if __var0.null?
      ::String.new(__var0)
    end

    def attributes
      __var0 = LibAtk.object_get_attributes(@pointer.as(LibAtk::Object*))
      GObject.raise_unexpected_null("atk_object_get_attributes") if __var0.null?
      GLib::SListIterator(Void*, Pointer(Void)*).new(GLib::SList.new(__var0.as(LibGLib::SList*)))
    end

    def description
      __var0 = LibAtk.object_get_description(@pointer.as(LibAtk::Object*))
      GObject.raise_unexpected_null("atk_object_get_description") if __var0.null?
      ::String.new(__var0)
    end

    def index_in_parent
      __var0 = LibAtk.object_get_index_in_parent(@pointer.as(LibAtk::Object*))
      __var0
    end

    def layer
      __var0 = LibAtk.object_get_layer(@pointer.as(LibAtk::Object*))
      Atk::Layer.new(__var0)
    end

    def mdi_zorder
      __var0 = LibAtk.object_get_mdi_zorder(@pointer.as(LibAtk::Object*))
      __var0
    end

    def n_accessible_children
      __var0 = LibAtk.object_get_n_accessible_children(@pointer.as(LibAtk::Object*))
      __var0
    end

    def name
      __var0 = LibAtk.object_get_name(@pointer.as(LibAtk::Object*))
      GObject.raise_unexpected_null("atk_object_get_name") if __var0.null?
      ::String.new(__var0)
    end

    def object_locale
      __var0 = LibAtk.object_get_object_locale(@pointer.as(LibAtk::Object*))
      GObject.raise_unexpected_null("atk_object_get_object_locale") if __var0.null?
      ::String.new(__var0)
    end

    def parent
      __var0 = LibAtk.object_get_parent(@pointer.as(LibAtk::Object*))
      GObject.raise_unexpected_null("atk_object_get_parent") if __var0.null?
      Atk::Object.new(__var0)
    end

    def role
      __var0 = LibAtk.object_get_role(@pointer.as(LibAtk::Object*))
      Atk::Role.new(__var0)
    end

    def init(data : Void*?)
      LibAtk.object_init(@pointer.as(LibAtk::Object*), data ? data : Pointer(Void).null)
      nil
    end

    def notify_state_change(state : ::Int, value : ::Bool)
      LibAtk.object_notify_state_change(@pointer.as(LibAtk::Object*), UInt64.new(state), LibC::Int.new(value ? 1 : 0))
      nil
    end

    def peek_parent
      __var0 = LibAtk.object_peek_parent(@pointer.as(LibAtk::Object*))
      GObject.raise_unexpected_null("atk_object_peek_parent") if __var0.null?
      Atk::Object.new(__var0)
    end

    def ref_accessible_child(i : ::Int)
      __var0 = LibAtk.object_ref_accessible_child(@pointer.as(LibAtk::Object*), Int32.new(i))
      GObject.raise_unexpected_null("atk_object_ref_accessible_child") if __var0.null?
      Atk::Object.new(__var0)
    end

    def ref_relation_set
      __var0 = LibAtk.object_ref_relation_set(@pointer.as(LibAtk::Object*))
      GObject.raise_unexpected_null("atk_object_ref_relation_set") if __var0.null?
      Atk::RelationSet.new(__var0)
    end

    def ref_state_set
      __var0 = LibAtk.object_ref_state_set(@pointer.as(LibAtk::Object*))
      GObject.raise_unexpected_null("atk_object_ref_state_set") if __var0.null?
      Atk::StateSet.new(__var0)
    end

    def remove_property_change_handler(handler_id : ::Int)
      LibAtk.object_remove_property_change_handler(@pointer.as(LibAtk::Object*), UInt32.new(handler_id))
      nil
    end

    def remove_relationship(relationship : Atk::RelationType, target : Atk::Object)
      __var0 = LibAtk.object_remove_relationship(@pointer.as(LibAtk::Object*), relationship, target.to_unsafe_object)
      (__var0 == 1)
    end

    def accessible_id=(name : ::String)
      LibAtk.object_set_accessible_id(@pointer.as(LibAtk::Object*), name.to_unsafe)
      nil
    end

    def description=(description : ::String)
      LibAtk.object_set_description(@pointer.as(LibAtk::Object*), description.to_unsafe)
      nil
    end

    def name=(name : ::String)
      LibAtk.object_set_name(@pointer.as(LibAtk::Object*), name.to_unsafe)
      nil
    end

    def parent=(parent : Atk::Object)
      LibAtk.object_set_parent(@pointer.as(LibAtk::Object*), parent.to_unsafe_object)
      nil
    end

    def role=(role : Atk::Role)
      LibAtk.object_set_role(@pointer.as(LibAtk::Object*), role)
      nil
    end

    def accessible_component_layer : Int32
      __var0 = GObject::Value.new(type: GObject::Type::INT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "accessible-component-layer", __var0)
      __var0.int
    end

    def accessible_component_mdi_zorder : Int32
      __var0 = GObject::Value.new(type: GObject::Type::INT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "accessible-component-mdi-zorder", __var0)
      __var0.int
    end

    def accessible_description : ::String
      __var0 = GObject::Value.new(type: GObject::Type::UTF8)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "accessible-description", __var0)
      __var0.string
    end

    def accessible_description=(value : ::String)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "accessible-description", value.to_gvalue)
    end

    def accessible_hypertext_nlinks : Int32
      __var0 = GObject::Value.new(type: GObject::Type::INT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "accessible-hypertext-nlinks", __var0)
      __var0.int
    end

    def accessible_name : ::String
      __var0 = GObject::Value.new(type: GObject::Type::UTF8)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "accessible-name", __var0)
      __var0.string
    end

    def accessible_name=(value : ::String)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "accessible-name", value.to_gvalue)
    end

    def accessible_parent : Atk::Object
      __var0 = GObject::Value.new(type: GObject::Type::OBJECT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "accessible-parent", __var0)
      Atk::Object.cast(__var0.object)
    end

    def accessible_parent=(value : Atk::Object)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "accessible-parent", value.to_gvalue)
    end

    def accessible_role : Atk::Role
      __var0 = GObject::Value.new(type: GObject::Type::ENUM)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "accessible-role", __var0)
      Atk::Role.new(UInt32.new(__var0.enum))
    end

    def accessible_role=(value : Atk::Role)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "accessible-role", value.to_gvalue)
    end

    def accessible_table_caption : ::String
      __var0 = GObject::Value.new(type: GObject::Type::UTF8)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "accessible-table-caption", __var0)
      __var0.string
    end

    def accessible_table_caption=(value : ::String)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "accessible-table-caption", value.to_gvalue)
    end

    def accessible_table_caption_object : Atk::Object
      __var0 = GObject::Value.new(type: GObject::Type::OBJECT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "accessible-table-caption-object", __var0)
      Atk::Object.cast(__var0.object)
    end

    def accessible_table_caption_object=(value : Atk::Object)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "accessible-table-caption-object", value.to_gvalue)
    end

    def accessible_table_column_description : ::String
      __var0 = GObject::Value.new(type: GObject::Type::UTF8)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "accessible-table-column-description", __var0)
      __var0.string
    end

    def accessible_table_column_description=(value : ::String)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "accessible-table-column-description", value.to_gvalue)
    end

    def accessible_table_column_header : Atk::Object
      __var0 = GObject::Value.new(type: GObject::Type::OBJECT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "accessible-table-column-header", __var0)
      Atk::Object.cast(__var0.object)
    end

    def accessible_table_column_header=(value : Atk::Object)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "accessible-table-column-header", value.to_gvalue)
    end

    def accessible_table_row_description : ::String
      __var0 = GObject::Value.new(type: GObject::Type::UTF8)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "accessible-table-row-description", __var0)
      __var0.string
    end

    def accessible_table_row_description=(value : ::String)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "accessible-table-row-description", value.to_gvalue)
    end

    def accessible_table_row_header : Atk::Object
      __var0 = GObject::Value.new(type: GObject::Type::OBJECT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "accessible-table-row-header", __var0)
      Atk::Object.cast(__var0.object)
    end

    def accessible_table_row_header=(value : Atk::Object)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "accessible-table-row-header", value.to_gvalue)
    end

    def accessible_table_summary : Atk::Object
      __var0 = GObject::Value.new(type: GObject::Type::OBJECT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "accessible-table-summary", __var0)
      Atk::Object.cast(__var0.object)
    end

    def accessible_table_summary=(value : Atk::Object)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "accessible-table-summary", value.to_gvalue)
    end

    def accessible_value : Float64
      __var0 = GObject::Value.new(type: GObject::Type::DOUBLE)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "accessible-value", __var0)
      __var0.double
    end

    def accessible_value=(value : Float64)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), "accessible-value", value.to_gvalue)
    end

    alias ActiveDescendantChangedSignal = Object, Atk::Object -> Nil

    def on_active_descendant_changed(*, after = false, &block : ActiveDescendantChangedSignal)
      __var0 = ->(arg0 : LibAtk::Object*, arg1 : Pointer(LibAtk::Object)*, box : Void*) {
        ::Box(ActiveDescendantChangedSignal).unbox(box).call(Object.new(arg0), arg1.null? ? GObject.raise_unexpected_null("arg1 in active_descendant_changed") : Atk::Object.new(arg1))
      }

      __var1 = ::Box.box(ActiveDescendantChangedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "active-descendant-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_active_descendant_changed(&block : ActiveDescendantChangedSignal)
      on_active_descendant_changed(after: true, &block)
    end

    alias ChildrenChangedSignal = Object, UInt32, Atk::Object -> Nil

    def on_children_changed(*, after = false, &block : ChildrenChangedSignal)
      __var0 = ->(arg0 : LibAtk::Object*, arg1 : UInt32, arg2 : Pointer(LibAtk::Object)*, box : Void*) {
        ::Box(ChildrenChangedSignal).unbox(box).call(Object.new(arg0), arg1, arg2.null? ? GObject.raise_unexpected_null("arg2 in children_changed") : Atk::Object.new(arg2))
      }

      __var1 = ::Box.box(ChildrenChangedSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "children-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_children_changed(&block : ChildrenChangedSignal)
      on_children_changed(after: true, &block)
    end

    alias FocusEventSignal = Object, ::Bool -> Nil

    def on_focus_event(*, after = false, &block : FocusEventSignal)
      __var0 = ->(arg0 : LibAtk::Object*, arg1 : LibC::Int, box : Void*) {
        ::Box(FocusEventSignal).unbox(box).call(Object.new(arg0), (arg1 == 1))
      }

      __var1 = ::Box.box(FocusEventSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "focus-event", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_focus_event(&block : FocusEventSignal)
      on_focus_event(after: true, &block)
    end

    alias PropertyChangeSignal = Object, Atk::PropertyValues -> Nil

    def on_property_change(*, after = false, &block : PropertyChangeSignal)
      __var0 = ->(arg0 : LibAtk::Object*, arg1 : Pointer(LibAtk::PropertyValues)*, box : Void*) {
        ::Box(PropertyChangeSignal).unbox(box).call(Object.new(arg0), arg1.null? ? GObject.raise_unexpected_null("arg1 in property_change") : Atk::PropertyValues.new(arg1))
      }

      __var1 = ::Box.box(PropertyChangeSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "property-change", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_property_change(&block : PropertyChangeSignal)
      on_property_change(after: true, &block)
    end

    alias StateChangeSignal = Object, ::String, ::Bool -> Nil

    def on_state_change(*, after = false, &block : StateChangeSignal)
      __var0 = ->(arg0 : LibAtk::Object*, arg1 : Pointer(UInt8), arg2 : LibC::Int, box : Void*) {
        ::Box(StateChangeSignal).unbox(box).call(Object.new(arg0), ::String.new(arg1), (arg2 == 1))
      }

      __var1 = ::Box.box(StateChangeSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "state-change", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_state_change(&block : StateChangeSignal)
      on_state_change(after: true, &block)
    end

    alias VisibleDataChangedSignal = Object -> Nil

    def on_visible_data_changed(*, after = false, &block : VisibleDataChangedSignal)
      __var0 = ->(arg0 : LibAtk::Object*, box : Void*) {
        ::Box(VisibleDataChangedSignal).unbox(box).call(Object.new(arg0))
      }

      __var1 = ::Box.box(VisibleDataChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "visible-data-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_visible_data_changed(&block : VisibleDataChangedSignal)
      on_visible_data_changed(after: true, &block)
    end
  end

  class GObjectAccessibleClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(368u64, 0u8).as(LibAtk::GObjectAccessibleClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::GObjectAccessibleClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::GObjectAccessibleClass*)
    end

    def to_unsafe_gobjectaccessibleclass
      @pointer.not_nil!.as(LibAtk::GObjectAccessibleClass*)
    end

    def parent_class
      Atk::ObjectClass.new(to_unsafe.as(LibAtk::GObjectAccessibleClass*).value.parent_class)
    end

    def pad1
      to_unsafe.as(LibAtk::GObjectAccessibleClass*).value.pad1
    end

    def pad2
      to_unsafe.as(LibAtk::GObjectAccessibleClass*).value.pad2
    end
  end

  class Hyperlink < GObject::Object
    include Atk::Action

    @pointer : Void*

    def initialize(pointer : LibAtk::Hyperlink*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a AtkHyperlink")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_hyperlink_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::Hyperlink*)
    end

    def to_unsafe_hyperlink
      @pointer.not_nil!.as(LibAtk::Hyperlink*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(LibAtk._atk_hyperlink_get_type, 0, nil, nil).as(Void*)
    end

    def end_index
      __var0 = LibAtk.hyperlink_get_end_index(@pointer.as(LibAtk::Hyperlink*))
      __var0
    end

    def n_anchors
      __var0 = LibAtk.hyperlink_get_n_anchors(@pointer.as(LibAtk::Hyperlink*))
      __var0
    end

    def object(i : ::Int)
      __var0 = LibAtk.hyperlink_get_object(@pointer.as(LibAtk::Hyperlink*), Int32.new(i))
      GObject.raise_unexpected_null("atk_hyperlink_get_object") if __var0.null?
      Atk::Object.new(__var0)
    end

    def start_index
      __var0 = LibAtk.hyperlink_get_start_index(@pointer.as(LibAtk::Hyperlink*))
      __var0
    end

    def uri(i : ::Int)
      __var0 = LibAtk.hyperlink_get_uri(@pointer.as(LibAtk::Hyperlink*), Int32.new(i))
      GObject.raise_unexpected_null("atk_hyperlink_get_uri") if __var0.null?
      ::String.new(__var0)
    end

    def inline?
      __var0 = LibAtk.hyperlink_is_inline(@pointer.as(LibAtk::Hyperlink*))
      (__var0 == 1)
    end

    def selected_link?
      __var0 = LibAtk.hyperlink_is_selected_link(@pointer.as(LibAtk::Hyperlink*))
      (__var0 == 1)
    end

    def valid?
      __var0 = LibAtk.hyperlink_is_valid(@pointer.as(LibAtk::Hyperlink*))
      (__var0 == 1)
    end

    def number_of_anchors : Int32
      __var0 = GObject::Value.new(type: GObject::Type::INT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "number-of-anchors", __var0)
      __var0.int
    end

    def selected_link : ::Bool
      __var0 = GObject::Value.new(type: GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "selected-link", __var0)
      __var0.boolean
    end

    alias LinkActivatedSignal = Hyperlink -> Nil

    def on_link_activated(*, after = false, &block : LinkActivatedSignal)
      __var0 = ->(arg0 : LibAtk::Hyperlink*, box : Void*) {
        ::Box(LinkActivatedSignal).unbox(box).call(Hyperlink.new(arg0))
      }

      __var1 = ::Box.box(LinkActivatedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "link-activated", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_link_activated(&block : LinkActivatedSignal)
      on_link_activated(after: true, &block)
    end
  end

  class HyperlinkClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(216u64, 0u8).as(LibAtk::HyperlinkClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::HyperlinkClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::HyperlinkClass*)
    end

    def to_unsafe_hyperlinkclass
      @pointer.not_nil!.as(LibAtk::HyperlinkClass*)
    end

    def parent
      GObject::ObjectClass.new(to_unsafe.as(LibAtk::HyperlinkClass*).value.parent)
    end

    def get_uri
      to_unsafe.as(LibAtk::HyperlinkClass*).value.get_uri
    end

    def get_object
      to_unsafe.as(LibAtk::HyperlinkClass*).value.get_object
    end

    def get_end_index
      to_unsafe.as(LibAtk::HyperlinkClass*).value.get_end_index
    end

    def get_start_index
      to_unsafe.as(LibAtk::HyperlinkClass*).value.get_start_index
    end

    def is_valid
      to_unsafe.as(LibAtk::HyperlinkClass*).value.is_valid
    end

    def get_n_anchors
      to_unsafe.as(LibAtk::HyperlinkClass*).value.get_n_anchors
    end

    def link_state
      to_unsafe.as(LibAtk::HyperlinkClass*).value.link_state
    end

    def is_selected_link
      to_unsafe.as(LibAtk::HyperlinkClass*).value.is_selected_link
    end

    def link_activated
      to_unsafe.as(LibAtk::HyperlinkClass*).value.link_activated
    end

    def pad1
      to_unsafe.as(LibAtk::HyperlinkClass*).value.pad1
    end
  end

  module HyperlinkImpl
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include HyperlinkImpl
      @pointer : Void*

      def initialize(pointer : LibAtk::HyperlinkImpl*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a AtkHyperlinkImpl")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_hyperlink_impl_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibAtk::HyperlinkImpl*)
      end

      def to_unsafe_hyperlinkimpl
        @pointer.not_nil!.as(LibAtk::HyperlinkImpl*)
      end
    end

    def to_unsafe_hyperlinkimpl
      @pointer.not_nil!.as(LibAtk::HyperlinkImpl*)
    end

    def hyperlink
      __var0 = LibAtk.hyperlink_impl_get_hyperlink(@pointer.as(LibAtk::HyperlinkImpl*))
      GObject.raise_unexpected_null("atk_hyperlink_impl_get_hyperlink") if __var0.null?
      Atk::Hyperlink.new(__var0)
    end
  end

  class HyperlinkImplIface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(24u64, 0u8).as(LibAtk::HyperlinkImplIface*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::HyperlinkImplIface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::HyperlinkImplIface*)
    end

    def to_unsafe_hyperlinkimpliface
      @pointer.not_nil!.as(LibAtk::HyperlinkImplIface*)
    end

    def parent
      GObject::TypeInterface.new(to_unsafe.as(LibAtk::HyperlinkImplIface*).value.parent)
    end

    def get_hyperlink
      to_unsafe.as(LibAtk::HyperlinkImplIface*).value.get_hyperlink
    end
  end

  @[Flags]
  enum HyperlinkStateFlags : UInt32
    ZERO_NONE = 0
    INLINE    = 1
  end

  module Hypertext
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include Hypertext
      @pointer : Void*

      def initialize(pointer : LibAtk::Hypertext*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a AtkHypertext")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_hypertext_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibAtk::Hypertext*)
      end

      def to_unsafe_hypertext
        @pointer.not_nil!.as(LibAtk::Hypertext*)
      end
    end

    def to_unsafe_hypertext
      @pointer.not_nil!.as(LibAtk::Hypertext*)
    end

    def link(link_index : ::Int)
      __var0 = LibAtk.hypertext_get_link(@pointer.as(LibAtk::Hypertext*), Int32.new(link_index))
      GObject.raise_unexpected_null("atk_hypertext_get_link") if __var0.null?
      Atk::Hyperlink.new(__var0)
    end

    def link_index(char_index : ::Int)
      __var0 = LibAtk.hypertext_get_link_index(@pointer.as(LibAtk::Hypertext*), Int32.new(char_index))
      __var0
    end

    def n_links
      __var0 = LibAtk.hypertext_get_n_links(@pointer.as(LibAtk::Hypertext*))
      __var0
    end

    alias LinkSelectedSignal = Hypertext, Int32 -> Nil

    def on_link_selected(*, after = false, &block : LinkSelectedSignal)
      __var0 = ->(arg0 : LibAtk::Hypertext*, arg1 : Int32, box : Void*) {
        ::Box(LinkSelectedSignal).unbox(box).call(Hypertext::Wrapper.new(arg0), arg1)
      }

      __var1 = ::Box.box(LinkSelectedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "link-selected", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_link_selected(&block : LinkSelectedSignal)
      on_link_selected(after: true, &block)
    end
  end

  class HypertextIface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(48u64, 0u8).as(LibAtk::HypertextIface*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::HypertextIface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::HypertextIface*)
    end

    def to_unsafe_hypertextiface
      @pointer.not_nil!.as(LibAtk::HypertextIface*)
    end

    def parent
      GObject::TypeInterface.new(to_unsafe.as(LibAtk::HypertextIface*).value.parent)
    end

    def get_link
      to_unsafe.as(LibAtk::HypertextIface*).value.get_link
    end

    def get_n_links
      to_unsafe.as(LibAtk::HypertextIface*).value.get_n_links
    end

    def get_link_index
      to_unsafe.as(LibAtk::HypertextIface*).value.get_link_index
    end

    def link_selected
      to_unsafe.as(LibAtk::HypertextIface*).value.link_selected
    end
  end

  module Image
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include Image
      @pointer : Void*

      def initialize(pointer : LibAtk::Image*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a AtkImage")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_image_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibAtk::Image*)
      end

      def to_unsafe_image
        @pointer.not_nil!.as(LibAtk::Image*)
      end
    end

    def to_unsafe_image
      @pointer.not_nil!.as(LibAtk::Image*)
    end

    def image_description
      __var0 = LibAtk.image_get_image_description(@pointer.as(LibAtk::Image*))
      GObject.raise_unexpected_null("atk_image_get_image_description") if __var0.null?
      ::String.new(__var0)
    end

    def image_locale
      __var0 = LibAtk.image_get_image_locale(@pointer.as(LibAtk::Image*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def image_position(coord_type : Atk::CoordType)
      LibAtk.image_get_image_position(@pointer.as(LibAtk::Image*), out x, out y, coord_type)
      {x, y}
    end

    def image_size
      LibAtk.image_get_image_size(@pointer.as(LibAtk::Image*), out width, out height)
      {width, height}
    end

    def image_description=(description : ::String)
      __var0 = LibAtk.image_set_image_description(@pointer.as(LibAtk::Image*), description.to_unsafe)
      (__var0 == 1)
    end
  end

  class ImageIface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(56u64, 0u8).as(LibAtk::ImageIface*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::ImageIface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::ImageIface*)
    end

    def to_unsafe_imageiface
      @pointer.not_nil!.as(LibAtk::ImageIface*)
    end

    def parent
      GObject::TypeInterface.new(to_unsafe.as(LibAtk::ImageIface*).value.parent)
    end

    def get_image_position
      to_unsafe.as(LibAtk::ImageIface*).value.get_image_position
    end

    def get_image_description
      to_unsafe.as(LibAtk::ImageIface*).value.get_image_description
    end

    def get_image_size
      to_unsafe.as(LibAtk::ImageIface*).value.get_image_size
    end

    def set_image_description
      to_unsafe.as(LibAtk::ImageIface*).value.set_image_description
    end

    def get_image_locale
      to_unsafe.as(LibAtk::ImageIface*).value.get_image_locale
    end
  end

  class Implementor
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibAtk::Implementor*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::Implementor*)
    end

    def to_unsafe_implementor
      @pointer.not_nil!.as(LibAtk::Implementor*)
    end

    def ref_accessible
      __var0 = LibAtk.implementor_ref_accessible(@pointer.as(LibAtk::Implementor*))
      GObject.raise_unexpected_null("atk_implementor_ref_accessible") if __var0.null?
      Atk::Object.new(__var0)
    end
  end

  module ImplementorIface
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include ImplementorIface
      @pointer : Void*

      def initialize(pointer : LibAtk::ImplementorIface*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a AtkImplementorIface")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_implementor_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibAtk::ImplementorIface*)
      end

      def to_unsafe_implementoriface
        @pointer.not_nil!.as(LibAtk::ImplementorIface*)
      end
    end

    def to_unsafe_implementoriface
      @pointer.not_nil!.as(LibAtk::ImplementorIface*)
    end
  end

  class KeyEventStruct
    include GObject::WrappedType

    def self.new(type : Int32? = nil, state : UInt32? = nil, keyval : UInt32? = nil, length : Int32? = nil, string : ::String? = nil, keycode : UInt16? = nil, timestamp : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(32u64, 0u8).as(LibAtk::KeyEventStruct*))
      __var0.type = type unless type.nil?
      __var0.state = state unless state.nil?
      __var0.keyval = keyval unless keyval.nil?
      __var0.length = length unless length.nil?
      __var0.string = string unless string.nil?
      __var0.keycode = keycode unless keycode.nil?
      __var0.timestamp = timestamp unless timestamp.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::KeyEventStruct*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::KeyEventStruct*)
    end

    def to_unsafe_keyeventstruct
      @pointer.not_nil!.as(LibAtk::KeyEventStruct*)
    end

    def type
      to_unsafe.as(LibAtk::KeyEventStruct*).value.type
    end

    def type=(value : Int32)
      to_unsafe.as(LibAtk::KeyEventStruct*).value.type = Int32.new(value)
    end

    def state
      to_unsafe.as(LibAtk::KeyEventStruct*).value.state
    end

    def state=(value : UInt32)
      to_unsafe.as(LibAtk::KeyEventStruct*).value.state = UInt32.new(value)
    end

    def keyval
      to_unsafe.as(LibAtk::KeyEventStruct*).value.keyval
    end

    def keyval=(value : UInt32)
      to_unsafe.as(LibAtk::KeyEventStruct*).value.keyval = UInt32.new(value)
    end

    def length
      to_unsafe.as(LibAtk::KeyEventStruct*).value.length
    end

    def length=(value : Int32)
      to_unsafe.as(LibAtk::KeyEventStruct*).value.length = Int32.new(value)
    end

    def string
      ::String.new(to_unsafe.as(LibAtk::KeyEventStruct*).value.string)
    end

    def string=(value : ::String)
      to_unsafe.as(LibAtk::KeyEventStruct*).value.string = value.to_unsafe
    end

    def keycode
      to_unsafe.as(LibAtk::KeyEventStruct*).value.keycode
    end

    def keycode=(value : UInt16)
      to_unsafe.as(LibAtk::KeyEventStruct*).value.keycode = UInt16.new(value)
    end

    def timestamp
      to_unsafe.as(LibAtk::KeyEventStruct*).value.timestamp
    end

    def timestamp=(value : UInt32)
      to_unsafe.as(LibAtk::KeyEventStruct*).value.timestamp = UInt32.new(value)
    end
  end

  enum KeyEventType : UInt32
    PRESS        = 0
    RELEASE      = 1
    LAST_DEFINED = 2
  end
  alias KeySnoopFunc = LibAtk::KeySnoopFunc

  enum Layer : UInt32
    INVALID    = 0
    BACKGROUND = 1
    CANVAS     = 2
    WIDGET     = 3
    MDI        = 4
    POPUP      = 5
    OVERLAY    = 6
    WINDOW     = 7
  end

  class Misc < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibAtk::Misc*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a AtkMisc")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_misc_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::Misc*)
    end

    def to_unsafe_misc
      @pointer.not_nil!.as(LibAtk::Misc*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(LibAtk._atk_misc_get_type, 0, nil, nil).as(Void*)
    end

    def self.instance
      __var0 = LibAtk.misc_get_instance
      GObject.raise_unexpected_null("atk_misc_get_instance") if __var0.null?
      Atk::Misc.new(__var0)
    end

    def threads_enter
      LibAtk.misc_threads_enter(@pointer.as(LibAtk::Misc*))
      nil
    end

    def threads_leave
      LibAtk.misc_threads_leave(@pointer.as(LibAtk::Misc*))
      nil
    end
  end

  class MiscClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(408u64, 0u8).as(LibAtk::MiscClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::MiscClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::MiscClass*)
    end

    def to_unsafe_miscclass
      @pointer.not_nil!.as(LibAtk::MiscClass*)
    end

    def parent
      GObject::ObjectClass.new(to_unsafe.as(LibAtk::MiscClass*).value.parent)
    end

    def threads_enter
      to_unsafe.as(LibAtk::MiscClass*).value.threads_enter
    end

    def threads_leave
      to_unsafe.as(LibAtk::MiscClass*).value.threads_leave
    end

    def vfuncs
      GObject::PointerIterator.new(to_unsafe.as(LibAtk::MiscClass*).value.vfuncs) { |__var0|
        __var0
      }
    end
  end

  module Selection
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include Selection
      @pointer : Void*

      def initialize(pointer : LibAtk::Selection*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a AtkSelection")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_selection_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibAtk::Selection*)
      end

      def to_unsafe_selection
        @pointer.not_nil!.as(LibAtk::Selection*)
      end
    end

    def to_unsafe_selection
      @pointer.not_nil!.as(LibAtk::Selection*)
    end

    def add_selection(i : ::Int)
      __var0 = LibAtk.selection_add_selection(@pointer.as(LibAtk::Selection*), Int32.new(i))
      (__var0 == 1)
    end

    def clear_selection
      __var0 = LibAtk.selection_clear_selection(@pointer.as(LibAtk::Selection*))
      (__var0 == 1)
    end

    def selection_count
      __var0 = LibAtk.selection_get_selection_count(@pointer.as(LibAtk::Selection*))
      __var0
    end

    def child_selected?(i : ::Int)
      __var0 = LibAtk.selection_is_child_selected(@pointer.as(LibAtk::Selection*), Int32.new(i))
      (__var0 == 1)
    end

    def ref_selection(i : ::Int)
      __var0 = LibAtk.selection_ref_selection(@pointer.as(LibAtk::Selection*), Int32.new(i))
      __var1 = Atk::Object.new(__var0) if __var0
      __var1
    end

    def remove_selection(i : ::Int)
      __var0 = LibAtk.selection_remove_selection(@pointer.as(LibAtk::Selection*), Int32.new(i))
      (__var0 == 1)
    end

    def select_all_selection
      __var0 = LibAtk.selection_select_all_selection(@pointer.as(LibAtk::Selection*))
      (__var0 == 1)
    end

    alias SelectionChangedSignal = Selection -> Nil

    def on_selection_changed(*, after = false, &block : SelectionChangedSignal)
      __var0 = ->(arg0 : LibAtk::Selection*, box : Void*) {
        ::Box(SelectionChangedSignal).unbox(box).call(Selection::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(SelectionChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "selection-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_selection_changed(&block : SelectionChangedSignal)
      on_selection_changed(after: true, &block)
    end
  end

  class NoOpObjectClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(352u64, 0u8).as(LibAtk::NoOpObjectClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::NoOpObjectClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::NoOpObjectClass*)
    end

    def to_unsafe_noopobjectclass
      @pointer.not_nil!.as(LibAtk::NoOpObjectClass*)
    end

    def parent_class
      Atk::ObjectClass.new(to_unsafe.as(LibAtk::NoOpObjectClass*).value.parent_class)
    end
  end

  class ObjectFactory < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibAtk::ObjectFactory*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a AtkObjectFactory")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_object_factory_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::ObjectFactory*)
    end

    def to_unsafe_objectfactory
      @pointer.not_nil!.as(LibAtk::ObjectFactory*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(LibAtk._atk_object_factory_get_type, 0, nil, nil).as(Void*)
    end

    def create_accessible(obj : GObject::Object)
      __var0 = LibAtk.object_factory_create_accessible(@pointer.as(LibAtk::ObjectFactory*), obj.to_unsafe_object)
      GObject.raise_unexpected_null("atk_object_factory_create_accessible") if __var0.null?
      Atk::Object.new(__var0)
    end

    def accessible_type
      __var0 = LibAtk.object_factory_get_accessible_type(@pointer.as(LibAtk::ObjectFactory*))
      __var0
    end

    def invalidate
      LibAtk.object_factory_invalidate(@pointer.as(LibAtk::ObjectFactory*))
      nil
    end
  end

  class NoOpObjectFactoryClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(176u64, 0u8).as(LibAtk::NoOpObjectFactoryClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::NoOpObjectFactoryClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::NoOpObjectFactoryClass*)
    end

    def to_unsafe_noopobjectfactoryclass
      @pointer.not_nil!.as(LibAtk::NoOpObjectFactoryClass*)
    end

    def parent_class
      Atk::ObjectFactoryClass.new(to_unsafe.as(LibAtk::NoOpObjectFactoryClass*).value.parent_class)
    end
  end

  class GObjectAccessible < Object
    @pointer : Void*

    def initialize(pointer : LibAtk::GObjectAccessible*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a AtkGObjectAccessible")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_gobject_accessible_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::GObjectAccessible*)
    end

    def to_unsafe_gobjectaccessible
      @pointer.not_nil!.as(LibAtk::GObjectAccessible*)
    end

    def initialize(*, accessible_description : ::String? = nil, accessible_name : ::String? = nil, accessible_parent : Atk::Object? = nil, accessible_role : Atk::Role? = nil, accessible_table_caption : ::String? = nil, accessible_table_caption_object : Atk::Object? = nil, accessible_table_column_description : ::String? = nil, accessible_table_column_header : Atk::Object? = nil, accessible_table_row_description : ::String? = nil, accessible_table_row_header : Atk::Object? = nil, accessible_table_summary : Atk::Object? = nil, accessible_value : Float64? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless accessible_description.nil?
        __var0 << "accessible-description".to_unsafe
        __var1 << accessible_description.to_gvalue.to_unsafe.value
      end

      unless accessible_name.nil?
        __var0 << "accessible-name".to_unsafe
        __var1 << accessible_name.to_gvalue.to_unsafe.value
      end

      unless accessible_parent.nil?
        __var0 << "accessible-parent".to_unsafe
        __var1 << accessible_parent.to_gvalue.to_unsafe.value
      end

      unless accessible_role.nil?
        __var0 << "accessible-role".to_unsafe
        __var1 << accessible_role.to_gvalue.to_unsafe.value
      end

      unless accessible_table_caption.nil?
        __var0 << "accessible-table-caption".to_unsafe
        __var1 << accessible_table_caption.to_gvalue.to_unsafe.value
      end

      unless accessible_table_caption_object.nil?
        __var0 << "accessible-table-caption-object".to_unsafe
        __var1 << accessible_table_caption_object.to_gvalue.to_unsafe.value
      end

      unless accessible_table_column_description.nil?
        __var0 << "accessible-table-column-description".to_unsafe
        __var1 << accessible_table_column_description.to_gvalue.to_unsafe.value
      end

      unless accessible_table_column_header.nil?
        __var0 << "accessible-table-column-header".to_unsafe
        __var1 << accessible_table_column_header.to_gvalue.to_unsafe.value
      end

      unless accessible_table_row_description.nil?
        __var0 << "accessible-table-row-description".to_unsafe
        __var1 << accessible_table_row_description.to_gvalue.to_unsafe.value
      end

      unless accessible_table_row_header.nil?
        __var0 << "accessible-table-row-header".to_unsafe
        __var1 << accessible_table_row_header.to_gvalue.to_unsafe.value
      end

      unless accessible_table_summary.nil?
        __var0 << "accessible-table-summary".to_unsafe
        __var1 << accessible_table_summary.to_gvalue.to_unsafe.value
      end

      unless accessible_value.nil?
        __var0 << "accessible-value".to_unsafe
        __var1 << accessible_value.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibAtk._atk_gobject_accessible_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.for_object(obj : GObject::Object)
      __var0 = LibAtk.g_object_accessible_for_object(obj.to_unsafe_object)
      GObject.raise_unexpected_null("atk_gobject_accessible_for_object") if __var0.null?
      Atk::Object.new(__var0)
    end

    def object
      __var0 = LibAtk.g_object_accessible_get_object(@pointer.as(LibAtk::GObjectAccessible*))
      GObject.raise_unexpected_null("atk_gobject_accessible_get_object") if __var0.null?
      GObject::Object.new(__var0)
    end
  end

  class ObjectClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(352u64, 0u8).as(LibAtk::ObjectClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::ObjectClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::ObjectClass*)
    end

    def to_unsafe_objectclass
      @pointer.not_nil!.as(LibAtk::ObjectClass*)
    end

    def parent
      GObject::ObjectClass.new(to_unsafe.as(LibAtk::ObjectClass*).value.parent)
    end

    def get_name
      to_unsafe.as(LibAtk::ObjectClass*).value.get_name
    end

    def get_description
      to_unsafe.as(LibAtk::ObjectClass*).value.get_description
    end

    def get_parent
      to_unsafe.as(LibAtk::ObjectClass*).value.get_parent
    end

    def get_n_children
      to_unsafe.as(LibAtk::ObjectClass*).value.get_n_children
    end

    def ref_child
      to_unsafe.as(LibAtk::ObjectClass*).value.ref_child
    end

    def get_index_in_parent
      to_unsafe.as(LibAtk::ObjectClass*).value.get_index_in_parent
    end

    def ref_relation_set
      to_unsafe.as(LibAtk::ObjectClass*).value.ref_relation_set
    end

    def get_role
      to_unsafe.as(LibAtk::ObjectClass*).value.get_role
    end

    def get_layer
      to_unsafe.as(LibAtk::ObjectClass*).value.get_layer
    end

    def get_mdi_zorder
      to_unsafe.as(LibAtk::ObjectClass*).value.get_mdi_zorder
    end

    def ref_state_set
      to_unsafe.as(LibAtk::ObjectClass*).value.ref_state_set
    end

    def set_name
      to_unsafe.as(LibAtk::ObjectClass*).value.set_name
    end

    def set_description
      to_unsafe.as(LibAtk::ObjectClass*).value.set_description
    end

    def set_parent
      to_unsafe.as(LibAtk::ObjectClass*).value.set_parent
    end

    def set_role
      to_unsafe.as(LibAtk::ObjectClass*).value.set_role
    end

    def connect_property_change_handler
      to_unsafe.as(LibAtk::ObjectClass*).value.connect_property_change_handler
    end

    def remove_property_change_handler
      to_unsafe.as(LibAtk::ObjectClass*).value.remove_property_change_handler
    end

    def _initialize
      to_unsafe.as(LibAtk::ObjectClass*).value.initialize
    end

    def children_changed
      to_unsafe.as(LibAtk::ObjectClass*).value.children_changed
    end

    def focus_event
      to_unsafe.as(LibAtk::ObjectClass*).value.focus_event
    end

    def property_change
      to_unsafe.as(LibAtk::ObjectClass*).value.property_change
    end

    def state_change
      to_unsafe.as(LibAtk::ObjectClass*).value.state_change
    end

    def visible_data_changed
      to_unsafe.as(LibAtk::ObjectClass*).value.visible_data_changed
    end

    def active_descendant_changed
      to_unsafe.as(LibAtk::ObjectClass*).value.active_descendant_changed
    end

    def get_attributes
      to_unsafe.as(LibAtk::ObjectClass*).value.get_attributes
    end

    def get_object_locale
      to_unsafe.as(LibAtk::ObjectClass*).value.get_object_locale
    end

    def pad1
      to_unsafe.as(LibAtk::ObjectClass*).value.pad1
    end
  end

  class NoOpObjectFactory < ObjectFactory
    @pointer : Void*

    def initialize(pointer : LibAtk::NoOpObjectFactory*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a AtkNoOpObjectFactory")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_no_op_object_factory_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::NoOpObjectFactory*)
    end

    def to_unsafe_noopobjectfactory
      @pointer.not_nil!.as(LibAtk::NoOpObjectFactory*)
    end

    def self.new : self
      __var0 = LibAtk.no_op_object_factory_new
      GObject.raise_unexpected_null("atk_no_op_object_factory_new") if __var0.null?
      cast(Atk::ObjectFactory.new(__var0))
    end
  end

  class ObjectFactoryClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(176u64, 0u8).as(LibAtk::ObjectFactoryClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::ObjectFactoryClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::ObjectFactoryClass*)
    end

    def to_unsafe_objectfactoryclass
      @pointer.not_nil!.as(LibAtk::ObjectFactoryClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibAtk::ObjectFactoryClass*).value.parent_class)
    end

    def create_accessible
      to_unsafe.as(LibAtk::ObjectFactoryClass*).value.create_accessible
    end

    def invalidate
      to_unsafe.as(LibAtk::ObjectFactoryClass*).value.invalidate
    end

    def get_accessible_type
      to_unsafe.as(LibAtk::ObjectFactoryClass*).value.get_accessible_type
    end

    def pad1
      to_unsafe.as(LibAtk::ObjectFactoryClass*).value.pad1
    end

    def pad2
      to_unsafe.as(LibAtk::ObjectFactoryClass*).value.pad2
    end
  end

  class Plug < Object
    include Atk::Component

    @pointer : Void*

    def initialize(pointer : LibAtk::Plug*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a AtkPlug")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_plug_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::Plug*)
    end

    def to_unsafe_plug
      @pointer.not_nil!.as(LibAtk::Plug*)
    end

    def initialize(*, accessible_description : ::String? = nil, accessible_name : ::String? = nil, accessible_parent : Atk::Object? = nil, accessible_role : Atk::Role? = nil, accessible_table_caption : ::String? = nil, accessible_table_caption_object : Atk::Object? = nil, accessible_table_column_description : ::String? = nil, accessible_table_column_header : Atk::Object? = nil, accessible_table_row_description : ::String? = nil, accessible_table_row_header : Atk::Object? = nil, accessible_table_summary : Atk::Object? = nil, accessible_value : Float64? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless accessible_description.nil?
        __var0 << "accessible-description".to_unsafe
        __var1 << accessible_description.to_gvalue.to_unsafe.value
      end

      unless accessible_name.nil?
        __var0 << "accessible-name".to_unsafe
        __var1 << accessible_name.to_gvalue.to_unsafe.value
      end

      unless accessible_parent.nil?
        __var0 << "accessible-parent".to_unsafe
        __var1 << accessible_parent.to_gvalue.to_unsafe.value
      end

      unless accessible_role.nil?
        __var0 << "accessible-role".to_unsafe
        __var1 << accessible_role.to_gvalue.to_unsafe.value
      end

      unless accessible_table_caption.nil?
        __var0 << "accessible-table-caption".to_unsafe
        __var1 << accessible_table_caption.to_gvalue.to_unsafe.value
      end

      unless accessible_table_caption_object.nil?
        __var0 << "accessible-table-caption-object".to_unsafe
        __var1 << accessible_table_caption_object.to_gvalue.to_unsafe.value
      end

      unless accessible_table_column_description.nil?
        __var0 << "accessible-table-column-description".to_unsafe
        __var1 << accessible_table_column_description.to_gvalue.to_unsafe.value
      end

      unless accessible_table_column_header.nil?
        __var0 << "accessible-table-column-header".to_unsafe
        __var1 << accessible_table_column_header.to_gvalue.to_unsafe.value
      end

      unless accessible_table_row_description.nil?
        __var0 << "accessible-table-row-description".to_unsafe
        __var1 << accessible_table_row_description.to_gvalue.to_unsafe.value
      end

      unless accessible_table_row_header.nil?
        __var0 << "accessible-table-row-header".to_unsafe
        __var1 << accessible_table_row_header.to_gvalue.to_unsafe.value
      end

      unless accessible_table_summary.nil?
        __var0 << "accessible-table-summary".to_unsafe
        __var1 << accessible_table_summary.to_gvalue.to_unsafe.value
      end

      unless accessible_value.nil?
        __var0 << "accessible-value".to_unsafe
        __var1 << accessible_value.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibAtk._atk_plug_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new : self
      __var0 = LibAtk.plug_new
      GObject.raise_unexpected_null("atk_plug_new") if __var0.null?
      cast(Atk::Object.new(__var0))
    end

    def id
      __var0 = LibAtk.plug_get_id(@pointer.as(LibAtk::Plug*))
      GObject.raise_unexpected_null("atk_plug_get_id") if __var0.null?
      ::String.new(__var0)
    end

    def child=(child : Atk::Object)
      LibAtk.plug_set_child(@pointer.as(LibAtk::Plug*), child.to_unsafe_object)
      nil
    end
  end

  class PlugClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(360u64, 0u8).as(LibAtk::PlugClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::PlugClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::PlugClass*)
    end

    def to_unsafe_plugclass
      @pointer.not_nil!.as(LibAtk::PlugClass*)
    end

    def parent_class
      Atk::ObjectClass.new(to_unsafe.as(LibAtk::PlugClass*).value.parent_class)
    end

    def get_object_id
      to_unsafe.as(LibAtk::PlugClass*).value.get_object_id
    end
  end

  alias PropertyChangeHandler = LibAtk::PropertyChangeHandler

  class PropertyValues
    include GObject::WrappedType

    def self.new(property_name : ::String? = nil, old_value : GObject::Value? = nil, new_value : GObject::Value? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(56u64, 0u8).as(LibAtk::PropertyValues*))
      __var0.property_name = property_name unless property_name.nil?
      __var0.old_value = old_value unless old_value.nil?
      __var0.new_value = new_value unless new_value.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::PropertyValues*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::PropertyValues*)
    end

    def to_unsafe_propertyvalues
      @pointer.not_nil!.as(LibAtk::PropertyValues*)
    end

    def property_name
      ::String.new(to_unsafe.as(LibAtk::PropertyValues*).value.property_name)
    end

    def property_name=(value : ::String)
      to_unsafe.as(LibAtk::PropertyValues*).value.property_name = value.to_unsafe
    end

    def old_value
      GObject::Value.new(to_unsafe.as(LibAtk::PropertyValues*).value.old_value)
    end

    def old_value=(value : GObject::Value)
      to_unsafe.as(LibAtk::PropertyValues*).value.old_value = value.to_gvalue.to_unsafe.value
    end

    def new_value
      GObject::Value.new(to_unsafe.as(LibAtk::PropertyValues*).value.new_value)
    end

    def new_value=(value : GObject::Value)
      to_unsafe.as(LibAtk::PropertyValues*).value.new_value = value.to_gvalue.to_unsafe.value
    end
  end

  class Range
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibAtk::Range*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::Range*)
    end

    def to_unsafe_range
      @pointer.not_nil!.as(LibAtk::Range*)
    end

    def self.new(lower_limit : ::Float, upper_limit : ::Float, description : ::String) : self
      __var0 = LibAtk.range_new(Float64.new(lower_limit), Float64.new(upper_limit), description.to_unsafe)
      GObject.raise_unexpected_null("atk_range_new") if __var0.null?
      cast(Atk::Range.new(__var0))
    end

    def copy
      __var0 = LibAtk.range_copy(@pointer.as(LibAtk::Range*))
      GObject.raise_unexpected_null("atk_range_copy") if __var0.null?
      Atk::Range.new(__var0)
    end

    def free
      LibAtk.range_free(@pointer.as(LibAtk::Range*))
      nil
    end

    def description
      __var0 = LibAtk.range_get_description(@pointer.as(LibAtk::Range*))
      GObject.raise_unexpected_null("atk_range_get_description") if __var0.null?
      ::String.new(__var0)
    end

    def lower_limit
      __var0 = LibAtk.range_get_lower_limit(@pointer.as(LibAtk::Range*))
      __var0
    end

    def upper_limit
      __var0 = LibAtk.range_get_upper_limit(@pointer.as(LibAtk::Range*))
      __var0
    end
  end

  class Rectangle
    include GObject::WrappedType

    def self.new(x : Int32? = nil, y : Int32? = nil, width : Int32? = nil, height : Int32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibAtk::Rectangle*))
      __var0.x = x unless x.nil?
      __var0.y = y unless y.nil?
      __var0.width = width unless width.nil?
      __var0.height = height unless height.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::Rectangle*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::Rectangle*)
    end

    def to_unsafe_rectangle
      @pointer.not_nil!.as(LibAtk::Rectangle*)
    end

    def x
      to_unsafe.as(LibAtk::Rectangle*).value.x
    end

    def x=(value : Int32)
      to_unsafe.as(LibAtk::Rectangle*).value.x = Int32.new(value)
    end

    def y
      to_unsafe.as(LibAtk::Rectangle*).value.y
    end

    def y=(value : Int32)
      to_unsafe.as(LibAtk::Rectangle*).value.y = Int32.new(value)
    end

    def width
      to_unsafe.as(LibAtk::Rectangle*).value.width
    end

    def width=(value : Int32)
      to_unsafe.as(LibAtk::Rectangle*).value.width = Int32.new(value)
    end

    def height
      to_unsafe.as(LibAtk::Rectangle*).value.height
    end

    def height=(value : Int32)
      to_unsafe.as(LibAtk::Rectangle*).value.height = Int32.new(value)
    end
  end

  class Registry < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibAtk::Registry*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a AtkRegistry")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_registry_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::Registry*)
    end

    def to_unsafe_registry
      @pointer.not_nil!.as(LibAtk::Registry*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(LibAtk._atk_registry_get_type, 0, nil, nil).as(Void*)
    end

    def factory(type : UInt64)
      __var0 = LibAtk.registry_get_factory(@pointer.as(LibAtk::Registry*), UInt64.new(type))
      GObject.raise_unexpected_null("atk_registry_get_factory") if __var0.null?
      Atk::ObjectFactory.new(__var0)
    end

    def factory_type(type : UInt64)
      __var0 = LibAtk.registry_get_factory_type(@pointer.as(LibAtk::Registry*), UInt64.new(type))
      __var0
    end

    def set_factory_type(type : UInt64, factory_type : UInt64)
      LibAtk.registry_set_factory_type(@pointer.as(LibAtk::Registry*), UInt64.new(type), UInt64.new(factory_type))
      nil
    end
  end

  class RegistryClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(136u64, 0u8).as(LibAtk::RegistryClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::RegistryClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::RegistryClass*)
    end

    def to_unsafe_registryclass
      @pointer.not_nil!.as(LibAtk::RegistryClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibAtk::RegistryClass*).value.parent_class)
    end
  end

  class Relation < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibAtk::Relation*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a AtkRelation")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_relation_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::Relation*)
    end

    def to_unsafe_relation
      @pointer.not_nil!.as(LibAtk::Relation*)
    end

    def initialize(*, relation_type : Atk::RelationType? = nil, target : GObject::ValueArray? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless relation_type.nil?
        __var0 << "relation-type".to_unsafe
        __var1 << relation_type.to_gvalue.to_unsafe.value
      end

      unless target.nil?
        __var0 << "target".to_unsafe
        __var1 << target.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibAtk._atk_relation_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new(targets : ::Enumerable, relationship : Atk::RelationType) : self
      n_targets = targets.size
      __targets = (__targets_ary = targets.map { |__item| __item.to_unsafe_object }.to_a).to_unsafe
      n_targets = __targets_ary.size
      __var0 = LibAtk.relation_new(__targets, Int32.new(n_targets), relationship)
      GObject.raise_unexpected_null("atk_relation_new") if __var0.null?
      cast(Atk::Relation.new(__var0))
    end

    def add_target(target : Atk::Object)
      LibAtk.relation_add_target(@pointer.as(LibAtk::Relation*), target.to_unsafe_object)
      nil
    end

    def relation_type
      __var0 = LibAtk.relation_get_relation_type(@pointer.as(LibAtk::Relation*))
      Atk::RelationType.new(__var0)
    end

    def target
      __var0 = LibAtk.relation_get_target(@pointer.as(LibAtk::Relation*))
      GObject.raise_unexpected_null("atk_relation_get_target") if __var0.null?
      __var0
    end

    def remove_target(target : Atk::Object)
      __var0 = LibAtk.relation_remove_target(@pointer.as(LibAtk::Relation*), target.to_unsafe_object)
      (__var0 == 1)
    end
  end

  class RelationClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(136u64, 0u8).as(LibAtk::RelationClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::RelationClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::RelationClass*)
    end

    def to_unsafe_relationclass
      @pointer.not_nil!.as(LibAtk::RelationClass*)
    end

    def parent
      GObject::ObjectClass.new(to_unsafe.as(LibAtk::RelationClass*).value.parent)
    end
  end

  class RelationSet < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibAtk::RelationSet*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a AtkRelationSet")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_relation_set_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::RelationSet*)
    end

    def to_unsafe_relationset
      @pointer.not_nil!.as(LibAtk::RelationSet*)
    end

    def self.new : self
      __var0 = LibAtk.relation_set_new
      GObject.raise_unexpected_null("atk_relation_set_new") if __var0.null?
      cast(Atk::RelationSet.new(__var0))
    end

    def add(relation : Atk::Relation)
      LibAtk.relation_set_add(@pointer.as(LibAtk::RelationSet*), relation.to_unsafe_relation)
      nil
    end

    def add_relation_by_type(relationship : Atk::RelationType, target : Atk::Object)
      LibAtk.relation_set_add_relation_by_type(@pointer.as(LibAtk::RelationSet*), relationship, target.to_unsafe_object)
      nil
    end

    def contains(relationship : Atk::RelationType)
      __var0 = LibAtk.relation_set_contains(@pointer.as(LibAtk::RelationSet*), relationship)
      (__var0 == 1)
    end

    def contains_target(relationship : Atk::RelationType, target : Atk::Object)
      __var0 = LibAtk.relation_set_contains_target(@pointer.as(LibAtk::RelationSet*), relationship, target.to_unsafe_object)
      (__var0 == 1)
    end

    def n_relations
      __var0 = LibAtk.relation_set_get_n_relations(@pointer.as(LibAtk::RelationSet*))
      __var0
    end

    def relation(i : ::Int)
      __var0 = LibAtk.relation_set_get_relation(@pointer.as(LibAtk::RelationSet*), Int32.new(i))
      GObject.raise_unexpected_null("atk_relation_set_get_relation") if __var0.null?
      Atk::Relation.new(__var0)
    end

    def relation_by_type(relationship : Atk::RelationType)
      __var0 = LibAtk.relation_set_get_relation_by_type(@pointer.as(LibAtk::RelationSet*), relationship)
      GObject.raise_unexpected_null("atk_relation_set_get_relation_by_type") if __var0.null?
      Atk::Relation.new(__var0)
    end

    def remove(relation : Atk::Relation)
      LibAtk.relation_set_remove(@pointer.as(LibAtk::RelationSet*), relation.to_unsafe_relation)
      nil
    end
  end

  class RelationSetClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(152u64, 0u8).as(LibAtk::RelationSetClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::RelationSetClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::RelationSetClass*)
    end

    def to_unsafe_relationsetclass
      @pointer.not_nil!.as(LibAtk::RelationSetClass*)
    end

    def parent
      GObject::ObjectClass.new(to_unsafe.as(LibAtk::RelationSetClass*).value.parent)
    end

    def pad1
      to_unsafe.as(LibAtk::RelationSetClass*).value.pad1
    end

    def pad2
      to_unsafe.as(LibAtk::RelationSetClass*).value.pad2
    end
  end

  enum RelationType : UInt32
    NULL             =  0
    CONTROLLED_BY    =  1
    CONTROLLER_FOR   =  2
    LABEL_FOR        =  3
    LABELLED_BY      =  4
    MEMBER_OF        =  5
    NODE_CHILD_OF    =  6
    FLOWS_TO         =  7
    FLOWS_FROM       =  8
    SUBWINDOW_OF     =  9
    EMBEDS           = 10
    EMBEDDED_BY      = 11
    POPUP_FOR        = 12
    PARENT_WINDOW_OF = 13
    DESCRIBED_BY     = 14
    DESCRIPTION_FOR  = 15
    NODE_PARENT_OF   = 16
    DETAILS          = 17
    DETAILS_FOR      = 18
    ERROR_MESSAGE    = 19
    ERROR_FOR        = 20
    LAST_DEFINED     = 21
  end
  # Function for_name
  # Function get_name
  # Function register

  enum Role : UInt32
    INVALID               =   0
    ACCELERATOR_LABEL     =   1
    ALERT                 =   2
    ANIMATION             =   3
    ARROW                 =   4
    CALENDAR              =   5
    CANVAS                =   6
    CHECK_BOX             =   7
    CHECK_MENU_ITEM       =   8
    COLOR_CHOOSER         =   9
    COLUMN_HEADER         =  10
    COMBO_BOX             =  11
    DATE_EDITOR           =  12
    DESKTOP_ICON          =  13
    DESKTOP_FRAME         =  14
    DIAL                  =  15
    DIALOG                =  16
    DIRECTORY_PANE        =  17
    DRAWING_AREA          =  18
    FILE_CHOOSER          =  19
    FILLER                =  20
    FONT_CHOOSER          =  21
    FRAME                 =  22
    GLASS_PANE            =  23
    HTML_CONTAINER        =  24
    ICON                  =  25
    IMAGE                 =  26
    INTERNAL_FRAME        =  27
    LABEL                 =  28
    LAYERED_PANE          =  29
    LIST                  =  30
    LIST_ITEM             =  31
    MENU                  =  32
    MENU_BAR              =  33
    MENU_ITEM             =  34
    OPTION_PANE           =  35
    PAGE_TAB              =  36
    PAGE_TAB_LIST         =  37
    PANEL                 =  38
    PASSWORD_TEXT         =  39
    POPUP_MENU            =  40
    PROGRESS_BAR          =  41
    PUSH_BUTTON           =  42
    RADIO_BUTTON          =  43
    RADIO_MENU_ITEM       =  44
    ROOT_PANE             =  45
    ROW_HEADER            =  46
    SCROLL_BAR            =  47
    SCROLL_PANE           =  48
    SEPARATOR             =  49
    SLIDER                =  50
    SPLIT_PANE            =  51
    SPIN_BUTTON           =  52
    STATUSBAR             =  53
    TABLE                 =  54
    TABLE_CELL            =  55
    TABLE_COLUMN_HEADER   =  56
    TABLE_ROW_HEADER      =  57
    TEAR_OFF_MENU_ITEM    =  58
    TERMINAL              =  59
    TEXT                  =  60
    TOGGLE_BUTTON         =  61
    TOOL_BAR              =  62
    TOOL_TIP              =  63
    TREE                  =  64
    TREE_TABLE            =  65
    UNKNOWN               =  66
    VIEWPORT              =  67
    WINDOW                =  68
    HEADER                =  69
    FOOTER                =  70
    PARAGRAPH             =  71
    RULER                 =  72
    APPLICATION           =  73
    AUTOCOMPLETE          =  74
    EDIT_BAR              =  75
    EMBEDDED              =  76
    ENTRY                 =  77
    CHART                 =  78
    CAPTION               =  79
    DOCUMENT_FRAME        =  80
    HEADING               =  81
    PAGE                  =  82
    SECTION               =  83
    REDUNDANT_OBJECT      =  84
    FORM                  =  85
    LINK                  =  86
    INPUT_METHOD_WINDOW   =  87
    TABLE_ROW             =  88
    TREE_ITEM             =  89
    DOCUMENT_SPREADSHEET  =  90
    DOCUMENT_PRESENTATION =  91
    DOCUMENT_TEXT         =  92
    DOCUMENT_WEB          =  93
    DOCUMENT_EMAIL        =  94
    COMMENT               =  95
    LIST_BOX              =  96
    GROUPING              =  97
    IMAGE_MAP             =  98
    NOTIFICATION          =  99
    INFO_BAR              = 100
    LEVEL_BAR             = 101
    TITLE_BAR             = 102
    BLOCK_QUOTE           = 103
    AUDIO                 = 104
    VIDEO                 = 105
    DEFINITION            = 106
    ARTICLE               = 107
    LANDMARK              = 108
    LOG                   = 109
    MARQUEE               = 110
    MATH                  = 111
    RATING                = 112
    TIMER                 = 113
    DESCRIPTION_LIST      = 114
    DESCRIPTION_TERM      = 115
    DESCRIPTION_VALUE     = 116
    STATIC                = 117
    MATH_FRACTION         = 118
    MATH_ROOT             = 119
    SUBSCRIPT             = 120
    SUPERSCRIPT           = 121
    FOOTNOTE              = 122
    CONTENT_DELETION      = 123
    CONTENT_INSERTION     = 124
    LAST_DEFINED          = 125
  end
  # Function for_name
  # Function get_localized_name
  # Function get_name
  # Function register

  enum ScrollType : UInt32
    TOP_LEFT     = 0
    BOTTOM_RIGHT = 1
    TOP_EDGE     = 2
    BOTTOM_EDGE  = 3
    LEFT_EDGE    = 4
    RIGHT_EDGE   = 5
    ANYWHERE     = 6
  end

  module Table
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include Table
      @pointer : Void*

      def initialize(pointer : LibAtk::Table*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a AtkTable")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_table_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibAtk::Table*)
      end

      def to_unsafe_table
        @pointer.not_nil!.as(LibAtk::Table*)
      end
    end

    def to_unsafe_table
      @pointer.not_nil!.as(LibAtk::Table*)
    end

    def add_column_selection(column : ::Int)
      __var0 = LibAtk.table_add_column_selection(@pointer.as(LibAtk::Table*), Int32.new(column))
      (__var0 == 1)
    end

    def add_row_selection(row : ::Int)
      __var0 = LibAtk.table_add_row_selection(@pointer.as(LibAtk::Table*), Int32.new(row))
      (__var0 == 1)
    end

    def caption
      __var0 = LibAtk.table_get_caption(@pointer.as(LibAtk::Table*))
      __var1 = Atk::Object.new(__var0) if __var0
      __var1
    end

    def column_at_index(index_ : ::Int)
      __var0 = LibAtk.table_get_column_at_index(@pointer.as(LibAtk::Table*), Int32.new(index_))
      __var0
    end

    def column_description(column : ::Int)
      __var0 = LibAtk.table_get_column_description(@pointer.as(LibAtk::Table*), Int32.new(column))
      GObject.raise_unexpected_null("atk_table_get_column_description") if __var0.null?
      ::String.new(__var0)
    end

    def column_extent_at(row : ::Int, column : ::Int)
      __var0 = LibAtk.table_get_column_extent_at(@pointer.as(LibAtk::Table*), Int32.new(row), Int32.new(column))
      __var0
    end

    def column_header(column : ::Int)
      __var0 = LibAtk.table_get_column_header(@pointer.as(LibAtk::Table*), Int32.new(column))
      __var1 = Atk::Object.new(__var0) if __var0
      __var1
    end

    def index_at(row : ::Int, column : ::Int)
      __var0 = LibAtk.table_get_index_at(@pointer.as(LibAtk::Table*), Int32.new(row), Int32.new(column))
      __var0
    end

    def n_columns
      __var0 = LibAtk.table_get_n_columns(@pointer.as(LibAtk::Table*))
      __var0
    end

    def n_rows
      __var0 = LibAtk.table_get_n_rows(@pointer.as(LibAtk::Table*))
      __var0
    end

    def row_at_index(index_ : ::Int)
      __var0 = LibAtk.table_get_row_at_index(@pointer.as(LibAtk::Table*), Int32.new(index_))
      __var0
    end

    def row_description(row : ::Int)
      __var0 = LibAtk.table_get_row_description(@pointer.as(LibAtk::Table*), Int32.new(row))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def row_extent_at(row : ::Int, column : ::Int)
      __var0 = LibAtk.table_get_row_extent_at(@pointer.as(LibAtk::Table*), Int32.new(row), Int32.new(column))
      __var0
    end

    def row_header(row : ::Int)
      __var0 = LibAtk.table_get_row_header(@pointer.as(LibAtk::Table*), Int32.new(row))
      __var1 = Atk::Object.new(__var0) if __var0
      __var1
    end

    def selected_columns(selected : ::Int)
      __var0 = LibAtk.table_get_selected_columns(@pointer.as(LibAtk::Table*), selected)
      __var0
    end

    def selected_rows(selected : ::Int)
      __var0 = LibAtk.table_get_selected_rows(@pointer.as(LibAtk::Table*), selected)
      __var0
    end

    def summary
      __var0 = LibAtk.table_get_summary(@pointer.as(LibAtk::Table*))
      GObject.raise_unexpected_null("atk_table_get_summary") if __var0.null?
      Atk::Object.new(__var0)
    end

    def column_selected?(column : ::Int)
      __var0 = LibAtk.table_is_column_selected(@pointer.as(LibAtk::Table*), Int32.new(column))
      (__var0 == 1)
    end

    def row_selected?(row : ::Int)
      __var0 = LibAtk.table_is_row_selected(@pointer.as(LibAtk::Table*), Int32.new(row))
      (__var0 == 1)
    end

    def selected?(row : ::Int, column : ::Int)
      __var0 = LibAtk.table_is_selected(@pointer.as(LibAtk::Table*), Int32.new(row), Int32.new(column))
      (__var0 == 1)
    end

    def ref_at(row : ::Int, column : ::Int)
      __var0 = LibAtk.table_ref_at(@pointer.as(LibAtk::Table*), Int32.new(row), Int32.new(column))
      GObject.raise_unexpected_null("atk_table_ref_at") if __var0.null?
      Atk::Object.new(__var0)
    end

    def remove_column_selection(column : ::Int)
      __var0 = LibAtk.table_remove_column_selection(@pointer.as(LibAtk::Table*), Int32.new(column))
      (__var0 == 1)
    end

    def remove_row_selection(row : ::Int)
      __var0 = LibAtk.table_remove_row_selection(@pointer.as(LibAtk::Table*), Int32.new(row))
      (__var0 == 1)
    end

    def caption=(caption : Atk::Object)
      LibAtk.table_set_caption(@pointer.as(LibAtk::Table*), caption.to_unsafe_object)
      nil
    end

    def set_column_description(column : ::Int, description : ::String)
      LibAtk.table_set_column_description(@pointer.as(LibAtk::Table*), Int32.new(column), description.to_unsafe)
      nil
    end

    def set_column_header(column : ::Int, header : Atk::Object)
      LibAtk.table_set_column_header(@pointer.as(LibAtk::Table*), Int32.new(column), header.to_unsafe_object)
      nil
    end

    def set_row_description(row : ::Int, description : ::String)
      LibAtk.table_set_row_description(@pointer.as(LibAtk::Table*), Int32.new(row), description.to_unsafe)
      nil
    end

    def set_row_header(row : ::Int, header : Atk::Object)
      LibAtk.table_set_row_header(@pointer.as(LibAtk::Table*), Int32.new(row), header.to_unsafe_object)
      nil
    end

    def summary=(accessible : Atk::Object)
      LibAtk.table_set_summary(@pointer.as(LibAtk::Table*), accessible.to_unsafe_object)
      nil
    end

    alias ColumnDeletedSignal = Table, Int32, Int32 -> Nil

    def on_column_deleted(*, after = false, &block : ColumnDeletedSignal)
      __var0 = ->(arg0 : LibAtk::Table*, arg1 : Int32, arg2 : Int32, box : Void*) {
        ::Box(ColumnDeletedSignal).unbox(box).call(Table::Wrapper.new(arg0), arg1, arg2)
      }

      __var1 = ::Box.box(ColumnDeletedSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "column-deleted", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_column_deleted(&block : ColumnDeletedSignal)
      on_column_deleted(after: true, &block)
    end

    alias ColumnInsertedSignal = Table, Int32, Int32 -> Nil

    def on_column_inserted(*, after = false, &block : ColumnInsertedSignal)
      __var0 = ->(arg0 : LibAtk::Table*, arg1 : Int32, arg2 : Int32, box : Void*) {
        ::Box(ColumnInsertedSignal).unbox(box).call(Table::Wrapper.new(arg0), arg1, arg2)
      }

      __var1 = ::Box.box(ColumnInsertedSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "column-inserted", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_column_inserted(&block : ColumnInsertedSignal)
      on_column_inserted(after: true, &block)
    end

    alias ColumnReorderedSignal = Table -> Nil

    def on_column_reordered(*, after = false, &block : ColumnReorderedSignal)
      __var0 = ->(arg0 : LibAtk::Table*, box : Void*) {
        ::Box(ColumnReorderedSignal).unbox(box).call(Table::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(ColumnReorderedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "column-reordered", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_column_reordered(&block : ColumnReorderedSignal)
      on_column_reordered(after: true, &block)
    end

    alias ModelChangedSignal = Table -> Nil

    def on_model_changed(*, after = false, &block : ModelChangedSignal)
      __var0 = ->(arg0 : LibAtk::Table*, box : Void*) {
        ::Box(ModelChangedSignal).unbox(box).call(Table::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(ModelChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "model-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_model_changed(&block : ModelChangedSignal)
      on_model_changed(after: true, &block)
    end

    alias RowDeletedSignal = Table, Int32, Int32 -> Nil

    def on_row_deleted(*, after = false, &block : RowDeletedSignal)
      __var0 = ->(arg0 : LibAtk::Table*, arg1 : Int32, arg2 : Int32, box : Void*) {
        ::Box(RowDeletedSignal).unbox(box).call(Table::Wrapper.new(arg0), arg1, arg2)
      }

      __var1 = ::Box.box(RowDeletedSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "row-deleted", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_row_deleted(&block : RowDeletedSignal)
      on_row_deleted(after: true, &block)
    end

    alias RowInsertedSignal = Table, Int32, Int32 -> Nil

    def on_row_inserted(*, after = false, &block : RowInsertedSignal)
      __var0 = ->(arg0 : LibAtk::Table*, arg1 : Int32, arg2 : Int32, box : Void*) {
        ::Box(RowInsertedSignal).unbox(box).call(Table::Wrapper.new(arg0), arg1, arg2)
      }

      __var1 = ::Box.box(RowInsertedSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "row-inserted", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_row_inserted(&block : RowInsertedSignal)
      on_row_inserted(after: true, &block)
    end

    alias RowReorderedSignal = Table -> Nil

    def on_row_reordered(*, after = false, &block : RowReorderedSignal)
      __var0 = ->(arg0 : LibAtk::Table*, box : Void*) {
        ::Box(RowReorderedSignal).unbox(box).call(Table::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(RowReorderedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "row-reordered", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_row_reordered(&block : RowReorderedSignal)
      on_row_reordered(after: true, &block)
    end
  end

  class SelectionIface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(80u64, 0u8).as(LibAtk::SelectionIface*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::SelectionIface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::SelectionIface*)
    end

    def to_unsafe_selectioniface
      @pointer.not_nil!.as(LibAtk::SelectionIface*)
    end

    def parent
      GObject::TypeInterface.new(to_unsafe.as(LibAtk::SelectionIface*).value.parent)
    end

    def add_selection
      to_unsafe.as(LibAtk::SelectionIface*).value.add_selection
    end

    def clear_selection
      to_unsafe.as(LibAtk::SelectionIface*).value.clear_selection
    end

    def ref_selection
      to_unsafe.as(LibAtk::SelectionIface*).value.ref_selection
    end

    def get_selection_count
      to_unsafe.as(LibAtk::SelectionIface*).value.get_selection_count
    end

    def is_child_selected
      to_unsafe.as(LibAtk::SelectionIface*).value.is_child_selected
    end

    def remove_selection
      to_unsafe.as(LibAtk::SelectionIface*).value.remove_selection
    end

    def select_all_selection
      to_unsafe.as(LibAtk::SelectionIface*).value.select_all_selection
    end

    def selection_changed
      to_unsafe.as(LibAtk::SelectionIface*).value.selection_changed
    end
  end

  class Socket < Object
    include Atk::Component

    @pointer : Void*

    def initialize(pointer : LibAtk::Socket*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a AtkSocket")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_socket_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::Socket*)
    end

    def to_unsafe_socket
      @pointer.not_nil!.as(LibAtk::Socket*)
    end

    def initialize(*, accessible_description : ::String? = nil, accessible_name : ::String? = nil, accessible_parent : Atk::Object? = nil, accessible_role : Atk::Role? = nil, accessible_table_caption : ::String? = nil, accessible_table_caption_object : Atk::Object? = nil, accessible_table_column_description : ::String? = nil, accessible_table_column_header : Atk::Object? = nil, accessible_table_row_description : ::String? = nil, accessible_table_row_header : Atk::Object? = nil, accessible_table_summary : Atk::Object? = nil, accessible_value : Float64? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless accessible_description.nil?
        __var0 << "accessible-description".to_unsafe
        __var1 << accessible_description.to_gvalue.to_unsafe.value
      end

      unless accessible_name.nil?
        __var0 << "accessible-name".to_unsafe
        __var1 << accessible_name.to_gvalue.to_unsafe.value
      end

      unless accessible_parent.nil?
        __var0 << "accessible-parent".to_unsafe
        __var1 << accessible_parent.to_gvalue.to_unsafe.value
      end

      unless accessible_role.nil?
        __var0 << "accessible-role".to_unsafe
        __var1 << accessible_role.to_gvalue.to_unsafe.value
      end

      unless accessible_table_caption.nil?
        __var0 << "accessible-table-caption".to_unsafe
        __var1 << accessible_table_caption.to_gvalue.to_unsafe.value
      end

      unless accessible_table_caption_object.nil?
        __var0 << "accessible-table-caption-object".to_unsafe
        __var1 << accessible_table_caption_object.to_gvalue.to_unsafe.value
      end

      unless accessible_table_column_description.nil?
        __var0 << "accessible-table-column-description".to_unsafe
        __var1 << accessible_table_column_description.to_gvalue.to_unsafe.value
      end

      unless accessible_table_column_header.nil?
        __var0 << "accessible-table-column-header".to_unsafe
        __var1 << accessible_table_column_header.to_gvalue.to_unsafe.value
      end

      unless accessible_table_row_description.nil?
        __var0 << "accessible-table-row-description".to_unsafe
        __var1 << accessible_table_row_description.to_gvalue.to_unsafe.value
      end

      unless accessible_table_row_header.nil?
        __var0 << "accessible-table-row-header".to_unsafe
        __var1 << accessible_table_row_header.to_gvalue.to_unsafe.value
      end

      unless accessible_table_summary.nil?
        __var0 << "accessible-table-summary".to_unsafe
        __var1 << accessible_table_summary.to_gvalue.to_unsafe.value
      end

      unless accessible_value.nil?
        __var0 << "accessible-value".to_unsafe
        __var1 << accessible_value.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibAtk._atk_socket_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new : self
      __var0 = LibAtk.socket_new
      GObject.raise_unexpected_null("atk_socket_new") if __var0.null?
      cast(Atk::Object.new(__var0))
    end

    def embed(plug_id : ::String)
      LibAtk.socket_embed(@pointer.as(LibAtk::Socket*), plug_id.to_unsafe)
      nil
    end

    def occupied?
      __var0 = LibAtk.socket_is_occupied(@pointer.as(LibAtk::Socket*))
      (__var0 == 1)
    end
  end

  class SocketClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(360u64, 0u8).as(LibAtk::SocketClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::SocketClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::SocketClass*)
    end

    def to_unsafe_socketclass
      @pointer.not_nil!.as(LibAtk::SocketClass*)
    end

    def parent_class
      Atk::ObjectClass.new(to_unsafe.as(LibAtk::SocketClass*).value.parent_class)
    end

    def embed
      to_unsafe.as(LibAtk::SocketClass*).value.embed
    end
  end

  class StateSet < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibAtk::StateSet*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a AtkStateSet")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_state_set_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::StateSet*)
    end

    def to_unsafe_stateset
      @pointer.not_nil!.as(LibAtk::StateSet*)
    end

    def self.new : self
      __var0 = LibAtk.state_set_new
      GObject.raise_unexpected_null("atk_state_set_new") if __var0.null?
      cast(Atk::StateSet.new(__var0))
    end

    def add_state(type : Atk::StateType)
      __var0 = LibAtk.state_set_add_state(@pointer.as(LibAtk::StateSet*), type)
      (__var0 == 1)
    end

    def add_states(types : ::Enumerable)
      n_types = types.size
      __types = (__types_ary = types.map { |__item| __item }.to_a).to_unsafe
      n_types = __types_ary.size
      LibAtk.state_set_add_states(@pointer.as(LibAtk::StateSet*), __types, Int32.new(n_types))
      nil
    end

    def and_sets(compare_set : Atk::StateSet)
      __var0 = LibAtk.state_set_and_sets(@pointer.as(LibAtk::StateSet*), compare_set.to_unsafe_stateset)
      GObject.raise_unexpected_null("atk_state_set_and_sets") if __var0.null?
      Atk::StateSet.new(__var0)
    end

    def clear_states
      LibAtk.state_set_clear_states(@pointer.as(LibAtk::StateSet*))
      nil
    end

    def contains_state(type : Atk::StateType)
      __var0 = LibAtk.state_set_contains_state(@pointer.as(LibAtk::StateSet*), type)
      (__var0 == 1)
    end

    def contains_states(types : ::Enumerable)
      n_types = types.size
      __types = (__types_ary = types.map { |__item| __item }.to_a).to_unsafe
      n_types = __types_ary.size
      __var0 = LibAtk.state_set_contains_states(@pointer.as(LibAtk::StateSet*), __types, Int32.new(n_types))
      (__var0 == 1)
    end

    def empty?
      __var0 = LibAtk.state_set_is_empty(@pointer.as(LibAtk::StateSet*))
      (__var0 == 1)
    end

    def or_sets(compare_set : Atk::StateSet)
      __var0 = LibAtk.state_set_or_sets(@pointer.as(LibAtk::StateSet*), compare_set.to_unsafe_stateset)
      __var1 = Atk::StateSet.new(__var0) if __var0
      __var1
    end

    def remove_state(type : Atk::StateType)
      __var0 = LibAtk.state_set_remove_state(@pointer.as(LibAtk::StateSet*), type)
      (__var0 == 1)
    end

    def xor_sets(compare_set : Atk::StateSet)
      __var0 = LibAtk.state_set_xor_sets(@pointer.as(LibAtk::StateSet*), compare_set.to_unsafe_stateset)
      GObject.raise_unexpected_null("atk_state_set_xor_sets") if __var0.null?
      Atk::StateSet.new(__var0)
    end
  end

  class StateSetClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(136u64, 0u8).as(LibAtk::StateSetClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::StateSetClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::StateSetClass*)
    end

    def to_unsafe_statesetclass
      @pointer.not_nil!.as(LibAtk::StateSetClass*)
    end

    def parent
      GObject::ObjectClass.new(to_unsafe.as(LibAtk::StateSetClass*).value.parent)
    end
  end

  enum StateType : UInt32
    INVALID                 =  0
    ACTIVE                  =  1
    ARMED                   =  2
    BUSY                    =  3
    CHECKED                 =  4
    DEFUNCT                 =  5
    EDITABLE                =  6
    ENABLED                 =  7
    EXPANDABLE              =  8
    EXPANDED                =  9
    FOCUSABLE               = 10
    FOCUSED                 = 11
    HORIZONTAL              = 12
    ICONIFIED               = 13
    MODAL                   = 14
    MULTI_LINE              = 15
    MULTISELECTABLE         = 16
    OPAQUE                  = 17
    PRESSED                 = 18
    RESIZABLE               = 19
    SELECTABLE              = 20
    SELECTED                = 21
    SENSITIVE               = 22
    SHOWING                 = 23
    SINGLE_LINE             = 24
    STALE                   = 25
    TRANSIENT               = 26
    VERTICAL                = 27
    VISIBLE                 = 28
    MANAGES_DESCENDANTS     = 29
    INDETERMINATE           = 30
    TRUNCATED               = 31
    REQUIRED                = 32
    INVALID_ENTRY           = 33
    SUPPORTS_AUTOCOMPLETION = 34
    SELECTABLE_TEXT         = 35
    DEFAULT                 = 36
    ANIMATED                = 37
    VISITED                 = 38
    CHECKABLE               = 39
    HAS_POPUP               = 40
    HAS_TOOLTIP             = 41
    READ_ONLY               = 42
    LAST_DEFINED            = 43
  end

  # Function for_name
  # Function get_name
  # Function register

  module StreamableContent
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include StreamableContent
      @pointer : Void*

      def initialize(pointer : LibAtk::StreamableContent*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a AtkStreamableContent")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_streamable_content_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibAtk::StreamableContent*)
      end

      def to_unsafe_streamablecontent
        @pointer.not_nil!.as(LibAtk::StreamableContent*)
      end
    end

    def to_unsafe_streamablecontent
      @pointer.not_nil!.as(LibAtk::StreamableContent*)
    end

    def mime_type(i : ::Int)
      __var0 = LibAtk.streamable_content_get_mime_type(@pointer.as(LibAtk::StreamableContent*), Int32.new(i))
      GObject.raise_unexpected_null("atk_streamable_content_get_mime_type") if __var0.null?
      ::String.new(__var0)
    end

    def n_mime_types
      __var0 = LibAtk.streamable_content_get_n_mime_types(@pointer.as(LibAtk::StreamableContent*))
      __var0
    end

    def stream(mime_type : ::String)
      __var0 = LibAtk.streamable_content_get_stream(@pointer.as(LibAtk::StreamableContent*), mime_type.to_unsafe)
      GObject.raise_unexpected_null("atk_streamable_content_get_stream") if __var0.null?
      GLib::IOChannel.new(__var0)
    end

    def uri(mime_type : ::String)
      __var0 = LibAtk.streamable_content_get_uri(@pointer.as(LibAtk::StreamableContent*), mime_type.to_unsafe)
      __var1 = ::String.new(__var0) if __var0
      __var1
    end
  end

  class StreamableContentIface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(72u64, 0u8).as(LibAtk::StreamableContentIface*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::StreamableContentIface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::StreamableContentIface*)
    end

    def to_unsafe_streamablecontentiface
      @pointer.not_nil!.as(LibAtk::StreamableContentIface*)
    end

    def parent
      GObject::TypeInterface.new(to_unsafe.as(LibAtk::StreamableContentIface*).value.parent)
    end

    def get_n_mime_types
      to_unsafe.as(LibAtk::StreamableContentIface*).value.get_n_mime_types
    end

    def get_mime_type
      to_unsafe.as(LibAtk::StreamableContentIface*).value.get_mime_type
    end

    def get_stream
      to_unsafe.as(LibAtk::StreamableContentIface*).value.get_stream
    end

    def get_uri
      to_unsafe.as(LibAtk::StreamableContentIface*).value.get_uri
    end

    def pad1
      to_unsafe.as(LibAtk::StreamableContentIface*).value.pad1
    end

    def pad2
      to_unsafe.as(LibAtk::StreamableContentIface*).value.pad2
    end

    def pad3
      to_unsafe.as(LibAtk::StreamableContentIface*).value.pad3
    end
  end

  module TableCell
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include TableCell
      @pointer : Void*

      def initialize(pointer : LibAtk::TableCell*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a AtkTableCell")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_table_cell_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibAtk::TableCell*)
      end

      def to_unsafe_tablecell
        @pointer.not_nil!.as(LibAtk::TableCell*)
      end
    end

    def to_unsafe_tablecell
      @pointer.not_nil!.as(LibAtk::TableCell*)
    end

    def column_header_cells
      __var0 = LibAtk.table_cell_get_column_header_cells(@pointer.as(LibAtk::TableCell*))
      GObject.raise_unexpected_null("atk_table_cell_get_column_header_cells") if __var0.null?
      __var0
    end

    def column_span
      __var0 = LibAtk.table_cell_get_column_span(@pointer.as(LibAtk::TableCell*))
      __var0
    end

    def position
      __var0 = LibAtk.table_cell_get_position(@pointer.as(LibAtk::TableCell*), out row, out column)
      {(__var0 == 1), row, column}
    end

    def row_column_span
      __var0 = LibAtk.table_cell_get_row_column_span(@pointer.as(LibAtk::TableCell*), out row, out column, out row_span, out column_span)
      {(__var0 == 1), row, column, row_span, column_span}
    end

    def row_header_cells
      __var0 = LibAtk.table_cell_get_row_header_cells(@pointer.as(LibAtk::TableCell*))
      GObject.raise_unexpected_null("atk_table_cell_get_row_header_cells") if __var0.null?
      __var0
    end

    def row_span
      __var0 = LibAtk.table_cell_get_row_span(@pointer.as(LibAtk::TableCell*))
      __var0
    end

    def table
      __var0 = LibAtk.table_cell_get_table(@pointer.as(LibAtk::TableCell*))
      GObject.raise_unexpected_null("atk_table_cell_get_table") if __var0.null?
      Atk::Object.new(__var0)
    end
  end

  module Text
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include Text
      @pointer : Void*

      def initialize(pointer : LibAtk::Text*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a AtkText")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_text_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibAtk::Text*)
      end

      def to_unsafe_text
        @pointer.not_nil!.as(LibAtk::Text*)
      end
    end

    def to_unsafe_text
      @pointer.not_nil!.as(LibAtk::Text*)
    end

    def self.free_ranges(ranges : ::Enumerable)
      LibAtk.text_free_ranges((__ranges_ary = ranges.map { |__item| __item.to_unsafe.as(LibAtk::TextRange*) }.to_a).to_unsafe)
      nil
    end

    def add_selection(start_offset : ::Int, end_offset : ::Int)
      __var0 = LibAtk.text_add_selection(@pointer.as(LibAtk::Text*), Int32.new(start_offset), Int32.new(end_offset))
      (__var0 == 1)
    end

    def bounded_ranges(rect : Atk::TextRectangle, coord_type : Atk::CoordType, x_clip_type : Atk::TextClipType, y_clip_type : Atk::TextClipType)
      __var0 = LibAtk.text_get_bounded_ranges(@pointer.as(LibAtk::Text*), rect.to_unsafe.as(LibAtk::TextRectangle*), coord_type, x_clip_type, y_clip_type)
      GObject.raise_unexpected_null("atk_text_get_bounded_ranges") if __var0.null?
      GObject::PointerIterator.new(__var0) { |__var1|
        Atk::TextRange.new(__var1)
      }
    end

    def caret_offset
      __var0 = LibAtk.text_get_caret_offset(@pointer.as(LibAtk::Text*))
      __var0
    end

    def character_at_offset(offset : ::Int)
      __var0 = LibAtk.text_get_character_at_offset(@pointer.as(LibAtk::Text*), Int32.new(offset))
      __var0
    end

    def character_count
      __var0 = LibAtk.text_get_character_count(@pointer.as(LibAtk::Text*))
      __var0
    end

    def character_extents(offset : ::Int, coords : Atk::CoordType)
      LibAtk.text_get_character_extents(@pointer.as(LibAtk::Text*), Int32.new(offset), out x, out y, out width, out height, coords)
      {x, y, width, height}
    end

    def default_attributes
      __var0 = LibAtk.text_get_default_attributes(@pointer.as(LibAtk::Text*))
      GObject.raise_unexpected_null("atk_text_get_default_attributes") if __var0.null?
      GLib::SListIterator(Void*, Pointer(Void)*).new(GLib::SList.new(__var0.as(LibGLib::SList*)))
    end

    def n_selections
      __var0 = LibAtk.text_get_n_selections(@pointer.as(LibAtk::Text*))
      __var0
    end

    def offset_at_point(x : ::Int, y : ::Int, coords : Atk::CoordType)
      __var0 = LibAtk.text_get_offset_at_point(@pointer.as(LibAtk::Text*), Int32.new(x), Int32.new(y), coords)
      __var0
    end

    def range_extents(start_offset : ::Int, end_offset : ::Int, coord_type : Atk::CoordType, rect : Atk::TextRectangle)
      LibAtk.text_get_range_extents(@pointer.as(LibAtk::Text*), Int32.new(start_offset), Int32.new(end_offset), coord_type, rect)
      nil
    end

    def run_attributes(offset : ::Int)
      __var0 = LibAtk.text_get_run_attributes(@pointer.as(LibAtk::Text*), Int32.new(offset), out start_offset, out end_offset)
      GObject.raise_unexpected_null("atk_text_get_run_attributes") if __var0.null?
      {GLib::SListIterator(Void*, Pointer(Void)*).new(GLib::SList.new(__var0.as(LibGLib::SList*))), start_offset, end_offset}
    end

    def selection(selection_num : ::Int)
      __var0 = LibAtk.text_get_selection(@pointer.as(LibAtk::Text*), Int32.new(selection_num), out start_offset, out end_offset)
      GObject.raise_unexpected_null("atk_text_get_selection") if __var0.null?
      {::String.new(__var0), start_offset, end_offset}
    end

    def string_at_offset(offset : ::Int, granularity : Atk::TextGranularity)
      __var0 = LibAtk.text_get_string_at_offset(@pointer.as(LibAtk::Text*), Int32.new(offset), granularity, out start_offset, out end_offset)
      __var1 = ::String.new(__var0) if __var0
      {__var1, start_offset, end_offset}
    end

    def text(start_offset : ::Int, end_offset : ::Int)
      __var0 = LibAtk.text_get_text(@pointer.as(LibAtk::Text*), Int32.new(start_offset), Int32.new(end_offset))
      GObject.raise_unexpected_null("atk_text_get_text") if __var0.null?
      ::String.new(__var0)
    end

    def text_after_offset(offset : ::Int, boundary_type : Atk::TextBoundary)
      __var0 = LibAtk.text_get_text_after_offset(@pointer.as(LibAtk::Text*), Int32.new(offset), boundary_type, out start_offset, out end_offset)
      GObject.raise_unexpected_null("atk_text_get_text_after_offset") if __var0.null?
      {::String.new(__var0), start_offset, end_offset}
    end

    def text_at_offset(offset : ::Int, boundary_type : Atk::TextBoundary)
      __var0 = LibAtk.text_get_text_at_offset(@pointer.as(LibAtk::Text*), Int32.new(offset), boundary_type, out start_offset, out end_offset)
      GObject.raise_unexpected_null("atk_text_get_text_at_offset") if __var0.null?
      {::String.new(__var0), start_offset, end_offset}
    end

    def text_before_offset(offset : ::Int, boundary_type : Atk::TextBoundary)
      __var0 = LibAtk.text_get_text_before_offset(@pointer.as(LibAtk::Text*), Int32.new(offset), boundary_type, out start_offset, out end_offset)
      GObject.raise_unexpected_null("atk_text_get_text_before_offset") if __var0.null?
      {::String.new(__var0), start_offset, end_offset}
    end

    def remove_selection(selection_num : ::Int)
      __var0 = LibAtk.text_remove_selection(@pointer.as(LibAtk::Text*), Int32.new(selection_num))
      (__var0 == 1)
    end

    def scroll_substring_to(start_offset : ::Int, end_offset : ::Int, type : Atk::ScrollType)
      __var0 = LibAtk.text_scroll_substring_to(@pointer.as(LibAtk::Text*), Int32.new(start_offset), Int32.new(end_offset), type)
      (__var0 == 1)
    end

    def scroll_substring_to_point(start_offset : ::Int, end_offset : ::Int, coords : Atk::CoordType, x : ::Int, y : ::Int)
      __var0 = LibAtk.text_scroll_substring_to_point(@pointer.as(LibAtk::Text*), Int32.new(start_offset), Int32.new(end_offset), coords, Int32.new(x), Int32.new(y))
      (__var0 == 1)
    end

    def caret_offset=(offset : ::Int)
      __var0 = LibAtk.text_set_caret_offset(@pointer.as(LibAtk::Text*), Int32.new(offset))
      (__var0 == 1)
    end

    def set_selection(selection_num : ::Int, start_offset : ::Int, end_offset : ::Int)
      __var0 = LibAtk.text_set_selection(@pointer.as(LibAtk::Text*), Int32.new(selection_num), Int32.new(start_offset), Int32.new(end_offset))
      (__var0 == 1)
    end

    alias TextAttributesChangedSignal = Text -> Nil

    def on_text_attributes_changed(*, after = false, &block : TextAttributesChangedSignal)
      __var0 = ->(arg0 : LibAtk::Text*, box : Void*) {
        ::Box(TextAttributesChangedSignal).unbox(box).call(Text::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(TextAttributesChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "text-attributes-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_text_attributes_changed(&block : TextAttributesChangedSignal)
      on_text_attributes_changed(after: true, &block)
    end

    alias TextCaretMovedSignal = Text, Int32 -> Nil

    def on_text_caret_moved(*, after = false, &block : TextCaretMovedSignal)
      __var0 = ->(arg0 : LibAtk::Text*, arg1 : Int32, box : Void*) {
        ::Box(TextCaretMovedSignal).unbox(box).call(Text::Wrapper.new(arg0), arg1)
      }

      __var1 = ::Box.box(TextCaretMovedSignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "text-caret-moved", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_text_caret_moved(&block : TextCaretMovedSignal)
      on_text_caret_moved(after: true, &block)
    end

    alias TextChangedSignal = Text, Int32, Int32 -> Nil

    def on_text_changed(*, after = false, &block : TextChangedSignal)
      __var0 = ->(arg0 : LibAtk::Text*, arg1 : Int32, arg2 : Int32, box : Void*) {
        ::Box(TextChangedSignal).unbox(box).call(Text::Wrapper.new(arg0), arg1, arg2)
      }

      __var1 = ::Box.box(TextChangedSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "text-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_text_changed(&block : TextChangedSignal)
      on_text_changed(after: true, &block)
    end

    alias TextInsertSignal = Text, Int32, Int32, ::String -> Nil

    def on_text_insert(*, after = false, &block : TextInsertSignal)
      __var0 = ->(arg0 : LibAtk::Text*, arg1 : Int32, arg2 : Int32, arg3 : Pointer(UInt8), box : Void*) {
        ::Box(TextInsertSignal).unbox(box).call(Text::Wrapper.new(arg0), arg1, arg2, ::String.new(arg3))
      }

      __var1 = ::Box.box(TextInsertSignal.new { |arg0, arg1, arg2, arg3|
        block.call(arg0, arg1, arg2, arg3)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "text-insert", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_text_insert(&block : TextInsertSignal)
      on_text_insert(after: true, &block)
    end

    alias TextRemoveSignal = Text, Int32, Int32, ::String -> Nil

    def on_text_remove(*, after = false, &block : TextRemoveSignal)
      __var0 = ->(arg0 : LibAtk::Text*, arg1 : Int32, arg2 : Int32, arg3 : Pointer(UInt8), box : Void*) {
        ::Box(TextRemoveSignal).unbox(box).call(Text::Wrapper.new(arg0), arg1, arg2, ::String.new(arg3))
      }

      __var1 = ::Box.box(TextRemoveSignal.new { |arg0, arg1, arg2, arg3|
        block.call(arg0, arg1, arg2, arg3)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "text-remove", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_text_remove(&block : TextRemoveSignal)
      on_text_remove(after: true, &block)
    end

    alias TextSelectionChangedSignal = Text -> Nil

    def on_text_selection_changed(*, after = false, &block : TextSelectionChangedSignal)
      __var0 = ->(arg0 : LibAtk::Text*, box : Void*) {
        ::Box(TextSelectionChangedSignal).unbox(box).call(Text::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(TextSelectionChangedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "text-selection-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_text_selection_changed(&block : TextSelectionChangedSignal)
      on_text_selection_changed(after: true, &block)
    end
  end

  class TableCellIface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(72u64, 0u8).as(LibAtk::TableCellIface*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::TableCellIface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::TableCellIface*)
    end

    def to_unsafe_tablecelliface
      @pointer.not_nil!.as(LibAtk::TableCellIface*)
    end

    def parent
      GObject::TypeInterface.new(to_unsafe.as(LibAtk::TableCellIface*).value.parent)
    end

    def get_column_span
      to_unsafe.as(LibAtk::TableCellIface*).value.get_column_span
    end

    def get_column_header_cells
      to_unsafe.as(LibAtk::TableCellIface*).value.get_column_header_cells
    end

    def get_position
      to_unsafe.as(LibAtk::TableCellIface*).value.get_position
    end

    def get_row_span
      to_unsafe.as(LibAtk::TableCellIface*).value.get_row_span
    end

    def get_row_header_cells
      to_unsafe.as(LibAtk::TableCellIface*).value.get_row_header_cells
    end

    def get_row_column_span
      to_unsafe.as(LibAtk::TableCellIface*).value.get_row_column_span
    end

    def get_table
      to_unsafe.as(LibAtk::TableCellIface*).value.get_table
    end
  end

  class TableIface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(304u64, 0u8).as(LibAtk::TableIface*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::TableIface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::TableIface*)
    end

    def to_unsafe_tableiface
      @pointer.not_nil!.as(LibAtk::TableIface*)
    end

    def parent
      GObject::TypeInterface.new(to_unsafe.as(LibAtk::TableIface*).value.parent)
    end

    def ref_at
      to_unsafe.as(LibAtk::TableIface*).value.ref_at
    end

    def get_index_at
      to_unsafe.as(LibAtk::TableIface*).value.get_index_at
    end

    def get_column_at_index
      to_unsafe.as(LibAtk::TableIface*).value.get_column_at_index
    end

    def get_row_at_index
      to_unsafe.as(LibAtk::TableIface*).value.get_row_at_index
    end

    def get_n_columns
      to_unsafe.as(LibAtk::TableIface*).value.get_n_columns
    end

    def get_n_rows
      to_unsafe.as(LibAtk::TableIface*).value.get_n_rows
    end

    def get_column_extent_at
      to_unsafe.as(LibAtk::TableIface*).value.get_column_extent_at
    end

    def get_row_extent_at
      to_unsafe.as(LibAtk::TableIface*).value.get_row_extent_at
    end

    def get_caption
      to_unsafe.as(LibAtk::TableIface*).value.get_caption
    end

    def get_column_description
      to_unsafe.as(LibAtk::TableIface*).value.get_column_description
    end

    def get_column_header
      to_unsafe.as(LibAtk::TableIface*).value.get_column_header
    end

    def get_row_description
      to_unsafe.as(LibAtk::TableIface*).value.get_row_description
    end

    def get_row_header
      to_unsafe.as(LibAtk::TableIface*).value.get_row_header
    end

    def get_summary
      to_unsafe.as(LibAtk::TableIface*).value.get_summary
    end

    def set_caption
      to_unsafe.as(LibAtk::TableIface*).value.set_caption
    end

    def set_column_description
      to_unsafe.as(LibAtk::TableIface*).value.set_column_description
    end

    def set_column_header
      to_unsafe.as(LibAtk::TableIface*).value.set_column_header
    end

    def set_row_description
      to_unsafe.as(LibAtk::TableIface*).value.set_row_description
    end

    def set_row_header
      to_unsafe.as(LibAtk::TableIface*).value.set_row_header
    end

    def set_summary
      to_unsafe.as(LibAtk::TableIface*).value.set_summary
    end

    def get_selected_columns
      to_unsafe.as(LibAtk::TableIface*).value.get_selected_columns
    end

    def get_selected_rows
      to_unsafe.as(LibAtk::TableIface*).value.get_selected_rows
    end

    def is_column_selected
      to_unsafe.as(LibAtk::TableIface*).value.is_column_selected
    end

    def is_row_selected
      to_unsafe.as(LibAtk::TableIface*).value.is_row_selected
    end

    def is_selected
      to_unsafe.as(LibAtk::TableIface*).value.is_selected
    end

    def add_row_selection
      to_unsafe.as(LibAtk::TableIface*).value.add_row_selection
    end

    def remove_row_selection
      to_unsafe.as(LibAtk::TableIface*).value.remove_row_selection
    end

    def add_column_selection
      to_unsafe.as(LibAtk::TableIface*).value.add_column_selection
    end

    def remove_column_selection
      to_unsafe.as(LibAtk::TableIface*).value.remove_column_selection
    end

    def row_inserted
      to_unsafe.as(LibAtk::TableIface*).value.row_inserted
    end

    def column_inserted
      to_unsafe.as(LibAtk::TableIface*).value.column_inserted
    end

    def row_deleted
      to_unsafe.as(LibAtk::TableIface*).value.row_deleted
    end

    def column_deleted
      to_unsafe.as(LibAtk::TableIface*).value.column_deleted
    end

    def row_reordered
      to_unsafe.as(LibAtk::TableIface*).value.row_reordered
    end

    def column_reordered
      to_unsafe.as(LibAtk::TableIface*).value.column_reordered
    end

    def model_changed
      to_unsafe.as(LibAtk::TableIface*).value.model_changed
    end
  end

  module Value
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include Value
      @pointer : Void*

      def initialize(pointer : LibAtk::Value*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a AtkValue")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_value_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibAtk::Value*)
      end

      def to_unsafe_value
        @pointer.not_nil!.as(LibAtk::Value*)
      end
    end

    def to_unsafe_value
      @pointer.not_nil!.as(LibAtk::Value*)
    end

    def current_value : GObject::Value
      value = GObject::Value.new
      LibAtk.value_get_current_value(@pointer.as(LibAtk::Value*), value)
      value
    end

    def increment
      __var0 = LibAtk.value_get_increment(@pointer.as(LibAtk::Value*))
      __var0
    end

    def maximum_value : GObject::Value
      value = GObject::Value.new
      LibAtk.value_get_maximum_value(@pointer.as(LibAtk::Value*), value)
      value
    end

    def minimum_increment : GObject::Value
      value = GObject::Value.new
      LibAtk.value_get_minimum_increment(@pointer.as(LibAtk::Value*), value)
      value
    end

    def minimum_value : GObject::Value
      value = GObject::Value.new
      LibAtk.value_get_minimum_value(@pointer.as(LibAtk::Value*), value)
      value
    end

    def range
      __var0 = LibAtk.value_get_range(@pointer.as(LibAtk::Value*))
      __var1 = Atk::Range.new(__var0) if __var0
      __var1
    end

    def sub_ranges
      __var0 = LibAtk.value_get_sub_ranges(@pointer.as(LibAtk::Value*))
      GObject.raise_unexpected_null("atk_value_get_sub_ranges") if __var0.null?
      GLib::SListIterator(Atk::Range, LibAtk::Range*).new(GLib::SList.new(__var0.as(LibGLib::SList*)))
    end

    def value_and_text
      LibAtk.value_get_value_and_text(@pointer.as(LibAtk::Value*), out value, out text)
      {value, ::String.new(text)}
    end

    def current_value=(value)
      __var0 = LibAtk.value_set_current_value(@pointer.as(LibAtk::Value*), value.to_gvalue.to_unsafe)
      (__var0 == 1)
    end

    def value=(new_value : ::Float)
      LibAtk.value_set_value(@pointer.as(LibAtk::Value*), Float64.new(new_value))
      nil
    end

    alias ValueChangedSignal = Value, Float64, ::String -> Nil

    def on_value_changed(*, after = false, &block : ValueChangedSignal)
      __var0 = ->(arg0 : LibAtk::Value*, arg1 : Float64, arg2 : Pointer(UInt8), box : Void*) {
        ::Box(ValueChangedSignal).unbox(box).call(Value::Wrapper.new(arg0), arg1, ::String.new(arg2))
      }

      __var1 = ::Box.box(ValueChangedSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "value-changed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_value_changed(&block : ValueChangedSignal)
      on_value_changed(after: true, &block)
    end
  end

  enum TextAttribute : UInt32
    INVALID            =  0
    LEFT_MARGIN        =  1
    RIGHT_MARGIN       =  2
    INDENT             =  3
    INVISIBLE          =  4
    EDITABLE           =  5
    PIXELS_ABOVE_LINES =  6
    PIXELS_BELOW_LINES =  7
    PIXELS_INSIDE_WRAP =  8
    BG_FULL_HEIGHT     =  9
    RISE               = 10
    UNDERLINE          = 11
    STRIKETHROUGH      = 12
    SIZE               = 13
    SCALE              = 14
    WEIGHT             = 15
    LANGUAGE           = 16
    FAMILY_NAME        = 17
    BG_COLOR           = 18
    FG_COLOR           = 19
    BG_STIPPLE         = 20
    FG_STIPPLE         = 21
    WRAP_MODE          = 22
    DIRECTION          = 23
    JUSTIFICATION      = 24
    STRETCH            = 25
    VARIANT            = 26
    STYLE              = 27
    LAST_DEFINED       = 28
  end
  # Function for_name
  # Function get_name
  # Function get_value
  # Function register

  enum TextBoundary : UInt32
    CHAR           = 0
    WORD_START     = 1
    WORD_END       = 2
    SENTENCE_START = 3
    SENTENCE_END   = 4
    LINE_START     = 5
    LINE_END       = 6
  end

  enum TextClipType : UInt32
    NONE = 0
    MIN  = 1
    MAX  = 2
    BOTH = 3
  end

  enum TextGranularity : UInt32
    CHAR      = 0
    WORD      = 1
    SENTENCE  = 2
    LINE      = 3
    PARAGRAPH = 4
  end

  class TextIface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(224u64, 0u8).as(LibAtk::TextIface*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::TextIface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::TextIface*)
    end

    def to_unsafe_textiface
      @pointer.not_nil!.as(LibAtk::TextIface*)
    end

    def parent
      GObject::TypeInterface.new(to_unsafe.as(LibAtk::TextIface*).value.parent)
    end

    def get_text
      to_unsafe.as(LibAtk::TextIface*).value.get_text
    end

    def get_text_after_offset
      to_unsafe.as(LibAtk::TextIface*).value.get_text_after_offset
    end

    def get_text_at_offset
      to_unsafe.as(LibAtk::TextIface*).value.get_text_at_offset
    end

    def get_character_at_offset
      to_unsafe.as(LibAtk::TextIface*).value.get_character_at_offset
    end

    def get_text_before_offset
      to_unsafe.as(LibAtk::TextIface*).value.get_text_before_offset
    end

    def get_caret_offset
      to_unsafe.as(LibAtk::TextIface*).value.get_caret_offset
    end

    def get_run_attributes
      to_unsafe.as(LibAtk::TextIface*).value.get_run_attributes
    end

    def get_default_attributes
      to_unsafe.as(LibAtk::TextIface*).value.get_default_attributes
    end

    def get_character_extents
      to_unsafe.as(LibAtk::TextIface*).value.get_character_extents
    end

    def get_character_count
      to_unsafe.as(LibAtk::TextIface*).value.get_character_count
    end

    def get_offset_at_point
      to_unsafe.as(LibAtk::TextIface*).value.get_offset_at_point
    end

    def get_n_selections
      to_unsafe.as(LibAtk::TextIface*).value.get_n_selections
    end

    def get_selection
      to_unsafe.as(LibAtk::TextIface*).value.get_selection
    end

    def add_selection
      to_unsafe.as(LibAtk::TextIface*).value.add_selection
    end

    def remove_selection
      to_unsafe.as(LibAtk::TextIface*).value.remove_selection
    end

    def set_selection
      to_unsafe.as(LibAtk::TextIface*).value.set_selection
    end

    def set_caret_offset
      to_unsafe.as(LibAtk::TextIface*).value.set_caret_offset
    end

    def text_changed
      to_unsafe.as(LibAtk::TextIface*).value.text_changed
    end

    def text_caret_moved
      to_unsafe.as(LibAtk::TextIface*).value.text_caret_moved
    end

    def text_selection_changed
      to_unsafe.as(LibAtk::TextIface*).value.text_selection_changed
    end

    def text_attributes_changed
      to_unsafe.as(LibAtk::TextIface*).value.text_attributes_changed
    end

    def get_range_extents
      to_unsafe.as(LibAtk::TextIface*).value.get_range_extents
    end

    def get_bounded_ranges
      to_unsafe.as(LibAtk::TextIface*).value.get_bounded_ranges
    end

    def get_string_at_offset
      to_unsafe.as(LibAtk::TextIface*).value.get_string_at_offset
    end

    def scroll_substring_to
      to_unsafe.as(LibAtk::TextIface*).value.scroll_substring_to
    end

    def scroll_substring_to_point
      to_unsafe.as(LibAtk::TextIface*).value.scroll_substring_to_point
    end
  end

  class TextRange
    include GObject::WrappedType

    def self.new(bounds : Atk::TextRectangle? = nil, start_offset : Int32? = nil, end_offset : Int32? = nil, content : ::String? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(32u64, 0u8).as(LibAtk::TextRange*))
      __var0.bounds = bounds unless bounds.nil?
      __var0.start_offset = start_offset unless start_offset.nil?
      __var0.end_offset = end_offset unless end_offset.nil?
      __var0.content = content unless content.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::TextRange*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::TextRange*)
    end

    def to_unsafe_textrange
      @pointer.not_nil!.as(LibAtk::TextRange*)
    end

    def bounds
      Atk::TextRectangle.new(to_unsafe.as(LibAtk::TextRange*).value.bounds)
    end

    def bounds=(value : Atk::TextRectangle)
      to_unsafe.as(LibAtk::TextRange*).value.bounds = value
    end

    def start_offset
      to_unsafe.as(LibAtk::TextRange*).value.start_offset
    end

    def start_offset=(value : Int32)
      to_unsafe.as(LibAtk::TextRange*).value.start_offset = Int32.new(value)
    end

    def end_offset
      to_unsafe.as(LibAtk::TextRange*).value.end_offset
    end

    def end_offset=(value : Int32)
      to_unsafe.as(LibAtk::TextRange*).value.end_offset = Int32.new(value)
    end

    def content
      ::String.new(to_unsafe.as(LibAtk::TextRange*).value.content)
    end

    def content=(value : ::String)
      to_unsafe.as(LibAtk::TextRange*).value.content = value.to_unsafe
    end
  end

  class TextRectangle
    include GObject::WrappedType

    def self.new(x : Int32? = nil, y : Int32? = nil, width : Int32? = nil, height : Int32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibAtk::TextRectangle*))
      __var0.x = x unless x.nil?
      __var0.y = y unless y.nil?
      __var0.width = width unless width.nil?
      __var0.height = height unless height.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::TextRectangle*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::TextRectangle*)
    end

    def to_unsafe_textrectangle
      @pointer.not_nil!.as(LibAtk::TextRectangle*)
    end

    def x
      to_unsafe.as(LibAtk::TextRectangle*).value.x
    end

    def x=(value : Int32)
      to_unsafe.as(LibAtk::TextRectangle*).value.x = Int32.new(value)
    end

    def y
      to_unsafe.as(LibAtk::TextRectangle*).value.y
    end

    def y=(value : Int32)
      to_unsafe.as(LibAtk::TextRectangle*).value.y = Int32.new(value)
    end

    def width
      to_unsafe.as(LibAtk::TextRectangle*).value.width
    end

    def width=(value : Int32)
      to_unsafe.as(LibAtk::TextRectangle*).value.width = Int32.new(value)
    end

    def height
      to_unsafe.as(LibAtk::TextRectangle*).value.height
    end

    def height=(value : Int32)
      to_unsafe.as(LibAtk::TextRectangle*).value.height = Int32.new(value)
    end
  end

  class Util < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibAtk::Util*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a AtkUtil")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_util_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::Util*)
    end

    def to_unsafe_util
      @pointer.not_nil!.as(LibAtk::Util*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(LibAtk._atk_util_get_type, 0, nil, nil).as(Void*)
    end
  end

  class UtilClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(192u64, 0u8).as(LibAtk::UtilClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::UtilClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::UtilClass*)
    end

    def to_unsafe_utilclass
      @pointer.not_nil!.as(LibAtk::UtilClass*)
    end

    def parent
      GObject::ObjectClass.new(to_unsafe.as(LibAtk::UtilClass*).value.parent)
    end

    def add_global_event_listener
      to_unsafe.as(LibAtk::UtilClass*).value.add_global_event_listener
    end

    def remove_global_event_listener
      to_unsafe.as(LibAtk::UtilClass*).value.remove_global_event_listener
    end

    def add_key_event_listener
      to_unsafe.as(LibAtk::UtilClass*).value.add_key_event_listener
    end

    def remove_key_event_listener
      to_unsafe.as(LibAtk::UtilClass*).value.remove_key_event_listener
    end

    def get_root
      to_unsafe.as(LibAtk::UtilClass*).value.get_root
    end

    def get_toolkit_name
      to_unsafe.as(LibAtk::UtilClass*).value.get_toolkit_name
    end

    def get_toolkit_version
      to_unsafe.as(LibAtk::UtilClass*).value.get_toolkit_version
    end
  end

  module Window
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include Window
      @pointer : Void*

      def initialize(pointer : LibAtk::Window*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a AtkWindow")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_window_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibAtk::Window*)
      end

      def to_unsafe_window
        @pointer.not_nil!.as(LibAtk::Window*)
      end
    end

    def to_unsafe_window
      @pointer.not_nil!.as(LibAtk::Window*)
    end

    alias ActivateSignal = Window -> Nil

    def on_activate(*, after = false, &block : ActivateSignal)
      __var0 = ->(arg0 : LibAtk::Window*, box : Void*) {
        ::Box(ActivateSignal).unbox(box).call(Window::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(ActivateSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "activate", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_activate(&block : ActivateSignal)
      on_activate(after: true, &block)
    end

    alias CreateSignal = Window -> Nil

    def on_create(*, after = false, &block : CreateSignal)
      __var0 = ->(arg0 : LibAtk::Window*, box : Void*) {
        ::Box(CreateSignal).unbox(box).call(Window::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(CreateSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "create", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_create(&block : CreateSignal)
      on_create(after: true, &block)
    end

    alias DeactivateSignal = Window -> Nil

    def on_deactivate(*, after = false, &block : DeactivateSignal)
      __var0 = ->(arg0 : LibAtk::Window*, box : Void*) {
        ::Box(DeactivateSignal).unbox(box).call(Window::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(DeactivateSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "deactivate", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_deactivate(&block : DeactivateSignal)
      on_deactivate(after: true, &block)
    end

    alias DestroySignal = Window -> Nil

    def on_destroy(*, after = false, &block : DestroySignal)
      __var0 = ->(arg0 : LibAtk::Window*, box : Void*) {
        ::Box(DestroySignal).unbox(box).call(Window::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(DestroySignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "destroy", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_destroy(&block : DestroySignal)
      on_destroy(after: true, &block)
    end

    alias MaximizeSignal = Window -> Nil

    def on_maximize(*, after = false, &block : MaximizeSignal)
      __var0 = ->(arg0 : LibAtk::Window*, box : Void*) {
        ::Box(MaximizeSignal).unbox(box).call(Window::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(MaximizeSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "maximize", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_maximize(&block : MaximizeSignal)
      on_maximize(after: true, &block)
    end

    alias MinimizeSignal = Window -> Nil

    def on_minimize(*, after = false, &block : MinimizeSignal)
      __var0 = ->(arg0 : LibAtk::Window*, box : Void*) {
        ::Box(MinimizeSignal).unbox(box).call(Window::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(MinimizeSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "minimize", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_minimize(&block : MinimizeSignal)
      on_minimize(after: true, &block)
    end

    alias MoveSignal = Window -> Nil

    def on_move(*, after = false, &block : MoveSignal)
      __var0 = ->(arg0 : LibAtk::Window*, box : Void*) {
        ::Box(MoveSignal).unbox(box).call(Window::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(MoveSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "move", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_move(&block : MoveSignal)
      on_move(after: true, &block)
    end

    alias ResizeSignal = Window -> Nil

    def on_resize(*, after = false, &block : ResizeSignal)
      __var0 = ->(arg0 : LibAtk::Window*, box : Void*) {
        ::Box(ResizeSignal).unbox(box).call(Window::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(ResizeSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "resize", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_resize(&block : ResizeSignal)
      on_resize(after: true, &block)
    end

    alias RestoreSignal = Window -> Nil

    def on_restore(*, after = false, &block : RestoreSignal)
      __var0 = ->(arg0 : LibAtk::Window*, box : Void*) {
        ::Box(RestoreSignal).unbox(box).call(Window::Wrapper.new(arg0))
      }

      __var1 = ::Box.box(RestoreSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "restore", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_restore(&block : RestoreSignal)
      on_restore(after: true, &block)
    end
  end

  class ValueIface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(96u64, 0u8).as(LibAtk::ValueIface*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::ValueIface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::ValueIface*)
    end

    def to_unsafe_valueiface
      @pointer.not_nil!.as(LibAtk::ValueIface*)
    end

    def parent
      GObject::TypeInterface.new(to_unsafe.as(LibAtk::ValueIface*).value.parent)
    end

    def get_current_value
      to_unsafe.as(LibAtk::ValueIface*).value.get_current_value
    end

    def get_maximum_value
      to_unsafe.as(LibAtk::ValueIface*).value.get_maximum_value
    end

    def get_minimum_value
      to_unsafe.as(LibAtk::ValueIface*).value.get_minimum_value
    end

    def set_current_value
      to_unsafe.as(LibAtk::ValueIface*).value.set_current_value
    end

    def get_minimum_increment
      to_unsafe.as(LibAtk::ValueIface*).value.get_minimum_increment
    end

    def get_value_and_text
      to_unsafe.as(LibAtk::ValueIface*).value.get_value_and_text
    end

    def get_range
      to_unsafe.as(LibAtk::ValueIface*).value.get_range
    end

    def get_increment
      to_unsafe.as(LibAtk::ValueIface*).value.get_increment
    end

    def get_sub_ranges
      to_unsafe.as(LibAtk::ValueIface*).value.get_sub_ranges
    end

    def set_value
      to_unsafe.as(LibAtk::ValueIface*).value.set_value
    end
  end

  enum ValueType : UInt32
    VERY_WEAK    =  0
    WEAK         =  1
    ACCEPTABLE   =  2
    STRONG       =  3
    VERY_STRONG  =  4
    VERY_LOW     =  5
    LOW          =  6
    MEDIUM       =  7
    HIGH         =  8
    VERY_HIGH    =  9
    VERY_BAD     = 10
    BAD          = 11
    GOOD         = 12
    VERY_GOOD    = 13
    BEST         = 14
    LAST_DEFINED = 15
  end

  # Function get_localized_name
  # Function get_name

  class NoOpObject < Object
    include Atk::Action
    include Atk::Component
    include Atk::Document
    include Atk::EditableText
    include Atk::Hypertext
    include Atk::Image
    include Atk::Selection
    include Atk::Table
    include Atk::TableCell
    include Atk::Text
    include Atk::Value
    include Atk::Window

    @pointer : Void*

    def initialize(pointer : LibAtk::NoOpObject*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a AtkNoOpObject")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibAtk._atk_no_op_object_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::NoOpObject*)
    end

    def to_unsafe_noopobject
      @pointer.not_nil!.as(LibAtk::NoOpObject*)
    end

    def initialize(*, accessible_description : ::String? = nil, accessible_name : ::String? = nil, accessible_parent : Atk::Object? = nil, accessible_role : Atk::Role? = nil, accessible_table_caption : ::String? = nil, accessible_table_caption_object : Atk::Object? = nil, accessible_table_column_description : ::String? = nil, accessible_table_column_header : Atk::Object? = nil, accessible_table_row_description : ::String? = nil, accessible_table_row_header : Atk::Object? = nil, accessible_table_summary : Atk::Object? = nil, accessible_value : Float64? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless accessible_description.nil?
        __var0 << "accessible-description".to_unsafe
        __var1 << accessible_description.to_gvalue.to_unsafe.value
      end

      unless accessible_name.nil?
        __var0 << "accessible-name".to_unsafe
        __var1 << accessible_name.to_gvalue.to_unsafe.value
      end

      unless accessible_parent.nil?
        __var0 << "accessible-parent".to_unsafe
        __var1 << accessible_parent.to_gvalue.to_unsafe.value
      end

      unless accessible_role.nil?
        __var0 << "accessible-role".to_unsafe
        __var1 << accessible_role.to_gvalue.to_unsafe.value
      end

      unless accessible_table_caption.nil?
        __var0 << "accessible-table-caption".to_unsafe
        __var1 << accessible_table_caption.to_gvalue.to_unsafe.value
      end

      unless accessible_table_caption_object.nil?
        __var0 << "accessible-table-caption-object".to_unsafe
        __var1 << accessible_table_caption_object.to_gvalue.to_unsafe.value
      end

      unless accessible_table_column_description.nil?
        __var0 << "accessible-table-column-description".to_unsafe
        __var1 << accessible_table_column_description.to_gvalue.to_unsafe.value
      end

      unless accessible_table_column_header.nil?
        __var0 << "accessible-table-column-header".to_unsafe
        __var1 << accessible_table_column_header.to_gvalue.to_unsafe.value
      end

      unless accessible_table_row_description.nil?
        __var0 << "accessible-table-row-description".to_unsafe
        __var1 << accessible_table_row_description.to_gvalue.to_unsafe.value
      end

      unless accessible_table_row_header.nil?
        __var0 << "accessible-table-row-header".to_unsafe
        __var1 << accessible_table_row_header.to_gvalue.to_unsafe.value
      end

      unless accessible_table_summary.nil?
        __var0 << "accessible-table-summary".to_unsafe
        __var1 << accessible_table_summary.to_gvalue.to_unsafe.value
      end

      unless accessible_value.nil?
        __var0 << "accessible-value".to_unsafe
        __var1 << accessible_value.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibAtk._atk_no_op_object_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new(obj : GObject::Object) : self
      __var0 = LibAtk.no_op_object_new(obj.to_unsafe_object)
      GObject.raise_unexpected_null("atk_no_op_object_new") if __var0.null?
      cast(Atk::Object.new(__var0))
    end
  end

  class WindowIface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(16u64, 0u8).as(LibAtk::WindowIface*))
    end

    @pointer : Void*

    def initialize(pointer : LibAtk::WindowIface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibAtk::WindowIface*)
    end

    def to_unsafe_windowiface
      @pointer.not_nil!.as(LibAtk::WindowIface*)
    end

    def parent
      GObject::TypeInterface.new(to_unsafe.as(LibAtk::WindowIface*).value.parent)
    end
  end
end
