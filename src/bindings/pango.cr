require_gobject("GObject", "2.0")
require_gobject("cairo", "1.0")
require_gobject("GLib", "2.0")

@[Link("pango-1.0", pkg_config: "pango-1.0")]
lib LibPango
  ###########################################
  # #    Constants
  ###########################################
  ANALYSIS_FLAG_CENTERED_BASELINE = 1                  # : Int32
  ANALYSIS_FLAG_IS_ELLIPSIS       = 2                  # : Int32
  ANALYSIS_FLAG_NEED_HYPHEN       = 4                  # : Int32
  ATTR_INDEX_FROM_TEXT_BEGINNING  = 0                  # : Int32
  ENGINE_TYPE_LANG                = "PangoEngineLang"  # : Pointer(UInt8)
  ENGINE_TYPE_SHAPE               = "PangoEngineShape" # : Pointer(UInt8)
  GLYPH_EMPTY                     =  268435455         # : UInt32
  GLYPH_INVALID_INPUT             = 4294967295         # : UInt32
  GLYPH_UNKNOWN_FLAG              =  268435456         # : UInt32
  RENDER_TYPE_NONE                = "PangoRenderNone"  # : Pointer(UInt8)
  SCALE                           = 1024               # : Int32
  UNKNOWN_GLYPH_HEIGHT            =   14               # : Int32
  UNKNOWN_GLYPH_WIDTH             =   10               # : Int32
  VERSION_MIN_REQUIRED            =    2               # : Int32

  ###########################################
  # #    Enums
  ###########################################

  alias Alignment = UInt32

  alias AttrType = UInt32
  fun attr_type_get_name = pango_attr_type_get_name(type : LibPango::AttrType) : Pointer(UInt8)
  fun attr_type_register = pango_attr_type_register(name : Pointer(UInt8)) : LibPango::AttrType

  alias BidiType = UInt32
  fun bidi_type_for_unichar = pango_bidi_type_for_unichar(ch : UInt8) : LibPango::BidiType

  alias CoverageLevel = UInt32

  alias Direction = UInt32

  alias EllipsizeMode = UInt32

  alias Gravity = UInt32
  fun gravity_get_for_matrix = pango_gravity_get_for_matrix(matrix : Pointer(LibPango::Matrix)) : LibPango::Gravity
  fun gravity_get_for_script = pango_gravity_get_for_script(script : LibPango::Script, base_gravity : LibPango::Gravity, hint : LibPango::GravityHint) : LibPango::Gravity
  fun gravity_get_for_script_and_width = pango_gravity_get_for_script_and_width(script : LibPango::Script, wide : LibC::Int, base_gravity : LibPango::Gravity, hint : LibPango::GravityHint) : LibPango::Gravity
  fun gravity_to_rotation = pango_gravity_to_rotation(gravity : LibPango::Gravity) : Float64

  alias GravityHint = UInt32

  alias RenderPart = UInt32

  alias Script = Int32
  fun script_for_unichar = pango_script_for_unichar(ch : UInt8) : LibPango::Script
  fun script_get_sample_language = pango_script_get_sample_language(script : LibPango::Script) : Pointer(LibPango::Language)

  alias Stretch = UInt32

  alias Style = UInt32

  alias TabAlign = UInt32

  alias Underline = UInt32

  alias Variant = UInt32

  alias Weight = UInt32

  alias WrapMode = UInt32

  ###########################################
  # #    Structs
  ###########################################

  struct Analysis # struct
    shape_engine : Pointer(LibPango::EngineShape)
    lang_engine : Pointer(LibPango::EngineLang)
    font : Pointer(LibPango::Font)
    level : UInt8
    gravity : UInt8
    flags : UInt8
    script : UInt8
    language : Pointer(LibPango::Language)
    extra_attrs : Pointer(Void*)
  end

  struct AttrClass # struct
    type : LibPango::AttrType
    copy : Pointer(LibPango::Attribute) -> Pointer(LibPango::Attribute)
    destroy : Pointer(LibPango::Attribute) -> Void
    equal : Pointer(LibPango::Attribute), Pointer(LibPango::Attribute) -> LibC::Int
  end

  struct AttrColor # struct
    attr : LibPango::Attribute
    color : LibPango::Color
  end

  struct AttrFloat # struct
    attr : LibPango::Attribute
    value : Float64
  end

  struct AttrFontDesc # struct
    attr : LibPango::Attribute
    desc : Pointer(LibPango::FontDescription)
  end

  fun attr_font_desc_new = pango_attr_font_desc_new(desc : Pointer(LibPango::FontDescription)) : Pointer(LibPango::Attribute)

  struct AttrFontFeatures # struct
    attr : LibPango::Attribute
    features : Pointer(UInt8)
  end

  fun attr_font_features_new = pango_attr_font_features_new(features : Pointer(UInt8)) : Pointer(LibPango::Attribute)

  struct AttrInt # struct
    attr : LibPango::Attribute
    value : Int32
  end

  struct AttrIterator # struct
    _data : UInt8[0]
  end

  fun _pango_attr_iterator_get_type = pango_attr_iterator_get_type : UInt64
  fun attr_iterator_copy = pango_attr_iterator_copy(this : AttrIterator*) : Pointer(LibPango::AttrIterator)
  fun attr_iterator_destroy = pango_attr_iterator_destroy(this : AttrIterator*) : Void
  fun attr_iterator_get = pango_attr_iterator_get(this : AttrIterator*, type : LibPango::AttrType) : Pointer(LibPango::Attribute)
  fun attr_iterator_get_attrs = pango_attr_iterator_get_attrs(this : AttrIterator*) : Pointer(Void*)
  fun attr_iterator_get_font = pango_attr_iterator_get_font(this : AttrIterator*, desc : Pointer(LibPango::FontDescription), language : Pointer(LibPango::Language), extra_attrs : Pointer(Void*)) : Void
  fun attr_iterator_next = pango_attr_iterator_next(this : AttrIterator*) : LibC::Int
  fun attr_iterator_range = pango_attr_iterator_range(this : AttrIterator*, start : Int32*, _end : Int32*) : Void

  struct AttrLanguage # struct
    attr : LibPango::Attribute
    value : Pointer(LibPango::Language)
  end

  fun attr_language_new = pango_attr_language_new(language : Pointer(LibPango::Language)) : Pointer(LibPango::Attribute)

  struct AttrList # struct
    _data : UInt8[0]
  end

  fun _pango_attr_list_get_type = pango_attr_list_get_type : UInt64
  fun attr_list_new = pango_attr_list_new : Pointer(LibPango::AttrList)
  fun attr_list_change = pango_attr_list_change(this : AttrList*, attr : Pointer(LibPango::Attribute)) : Void
  fun attr_list_copy = pango_attr_list_copy(this : AttrList*) : Pointer(LibPango::AttrList)
  fun attr_list_filter = pango_attr_list_filter(this : AttrList*, func : LibPango::AttrFilterFunc, data : Pointer(Void)) : Pointer(LibPango::AttrList)
  fun attr_list_get_attributes = pango_attr_list_get_attributes(this : AttrList*) : Pointer(Void*)
  fun attr_list_get_iterator = pango_attr_list_get_iterator(this : AttrList*) : Pointer(LibPango::AttrIterator)
  fun attr_list_insert = pango_attr_list_insert(this : AttrList*, attr : Pointer(LibPango::Attribute)) : Void
  fun attr_list_insert_before = pango_attr_list_insert_before(this : AttrList*, attr : Pointer(LibPango::Attribute)) : Void
  fun attr_list_ref = pango_attr_list_ref(this : AttrList*) : Pointer(LibPango::AttrList)
  fun attr_list_splice = pango_attr_list_splice(this : AttrList*, other : Pointer(LibPango::AttrList), pos : Int32, len : Int32) : Void
  fun attr_list_unref = pango_attr_list_unref(this : AttrList*) : Void
  fun attr_list_update = pango_attr_list_update(this : AttrList*, pos : Int32, remove : Int32, add : Int32) : Void

  struct AttrShape # struct
    attr : LibPango::Attribute
    ink_rect : LibPango::Rectangle
    logical_rect : LibPango::Rectangle
    data : Pointer(Void)
    copy_func : LibPango::AttrDataCopyFunc
    destroy_func : LibGLib::DestroyNotify
  end

  fun attr_shape_new = pango_attr_shape_new(ink_rect : Pointer(LibPango::Rectangle), logical_rect : Pointer(LibPango::Rectangle)) : Pointer(LibPango::Attribute)
  fun attr_shape_new_with_data = pango_attr_shape_new_with_data(ink_rect : Pointer(LibPango::Rectangle), logical_rect : Pointer(LibPango::Rectangle), data : Pointer(Void), copy_func : LibPango::AttrDataCopyFunc, destroy_func : LibGLib::DestroyNotify) : Pointer(LibPango::Attribute)

  struct AttrSize # struct
    attr : LibPango::Attribute
    size : Int32
    absolute : UInt32
  end

  fun attr_size_new = pango_attr_size_new(size : Int32) : Pointer(LibPango::Attribute)
  fun attr_size_new_absolute = pango_attr_size_new_absolute(size : Int32) : Pointer(LibPango::Attribute)

  struct AttrString # struct
    attr : LibPango::Attribute
    value : Pointer(UInt8)
  end

  struct Attribute # struct
    klass : Pointer(LibPango::AttrClass)
    start_index : UInt32
    end_index : UInt32
  end

  fun _pango_attribute_get_type = pango_attribute_get_type : UInt64
  fun attribute_copy = pango_attribute_copy(this : Attribute*) : Pointer(LibPango::Attribute)
  fun attribute_destroy = pango_attribute_destroy(this : Attribute*) : Void
  fun attribute_equal = pango_attribute_equal(this : Attribute*, attr2 : Pointer(LibPango::Attribute)) : LibC::Int
  fun attribute_init = pango_attribute_init(this : Attribute*, klass : Pointer(LibPango::AttrClass)) : Void

  struct Color # struct
    red : UInt16
    green : UInt16
    blue : UInt16
  end

  fun _pango_color_get_type = pango_color_get_type : UInt64
  fun color_copy = pango_color_copy(this : Color*) : Pointer(LibPango::Color)
  fun color_free = pango_color_free(this : Color*) : Void
  fun color_parse = pango_color_parse(this : Color*, spec : Pointer(UInt8)) : LibC::Int
  fun color_to_string = pango_color_to_string(this : Color*) : Pointer(UInt8)

  struct ContextClass # struct
    _data : UInt8[0]
  end

  struct EngineClass # struct
    parent_class : LibGObject::ObjectClass
  end

  struct EngineInfo # struct
    id : Pointer(UInt8)
    engine_type : Pointer(UInt8)
    render_type : Pointer(UInt8)
    scripts : Pointer(LibPango::EngineScriptInfo)
    n_scripts : Int32
  end

  struct EngineLangClass # struct
    parent_class : LibPango::EngineClass
    script_break : Pointer(LibPango::EngineLang), Pointer(UInt8), Int32, Pointer(LibPango::Analysis), Pointer(LibPango::LogAttr), Int32 -> Void
  end

  struct EngineScriptInfo # struct
    script : LibPango::Script
    langs : Pointer(UInt8)
  end

  struct EngineShapeClass # struct
    parent_class : LibPango::EngineClass
    script_shape : Pointer(LibPango::EngineShape), Pointer(LibPango::Font), Pointer(UInt8), UInt32, Pointer(LibPango::Analysis), Pointer(LibPango::GlyphString), Pointer(UInt8), UInt32 -> Void
    covers : Pointer(LibPango::EngineShape), Pointer(LibPango::Font), Pointer(LibPango::Language), UInt8 -> LibPango::CoverageLevel
  end

  struct FontClass # struct
    parent_class : LibGObject::ObjectClass
    describe : Pointer(LibPango::Font) -> Pointer(LibPango::FontDescription)
    get_coverage : Pointer(LibPango::Font), Pointer(LibPango::Language) -> Pointer(LibPango::Coverage)
    get_glyph_extents : Pointer(LibPango::Font), UInt32, LibPango::Rectangle, LibPango::Rectangle -> Void
    get_metrics : Pointer(LibPango::Font), Pointer(LibPango::Language) -> Pointer(LibPango::FontMetrics)
    get_font_map : Pointer(LibPango::Font) -> Pointer(LibPango::FontMap)
    describe_absolute : Pointer(LibPango::Font) -> Pointer(LibPango::FontDescription)
    get_features : Pointer(Void)
    create_hb_font : Pointer(Void)
  end

  struct FontDescription # struct
    _data : UInt8[0]
  end

  fun _pango_font_description_get_type = pango_font_description_get_type : UInt64
  fun font_description_new = pango_font_description_new : Pointer(LibPango::FontDescription)
  fun font_description_better_match = pango_font_description_better_match(this : FontDescription*, old_match : Pointer(LibPango::FontDescription), new_match : Pointer(LibPango::FontDescription)) : LibC::Int
  fun font_description_copy = pango_font_description_copy(this : FontDescription*) : Pointer(LibPango::FontDescription)
  fun font_description_copy_static = pango_font_description_copy_static(this : FontDescription*) : Pointer(LibPango::FontDescription)
  fun font_description_equal = pango_font_description_equal(this : FontDescription*, desc2 : Pointer(LibPango::FontDescription)) : LibC::Int
  fun font_description_free = pango_font_description_free(this : FontDescription*) : Void
  fun font_description_get_family = pango_font_description_get_family(this : FontDescription*) : Pointer(UInt8)
  fun font_description_get_gravity = pango_font_description_get_gravity(this : FontDescription*) : LibPango::Gravity
  fun font_description_get_set_fields = pango_font_description_get_set_fields(this : FontDescription*) : LibPango::FontMask
  fun font_description_get_size = pango_font_description_get_size(this : FontDescription*) : Int32
  fun font_description_get_size_is_absolute = pango_font_description_get_size_is_absolute(this : FontDescription*) : LibC::Int
  fun font_description_get_stretch = pango_font_description_get_stretch(this : FontDescription*) : LibPango::Stretch
  fun font_description_get_style = pango_font_description_get_style(this : FontDescription*) : LibPango::Style
  fun font_description_get_variant = pango_font_description_get_variant(this : FontDescription*) : LibPango::Variant
  fun font_description_get_variations = pango_font_description_get_variations(this : FontDescription*) : Pointer(UInt8)
  fun font_description_get_weight = pango_font_description_get_weight(this : FontDescription*) : LibPango::Weight
  fun font_description_hash = pango_font_description_hash(this : FontDescription*) : UInt32
  fun font_description_merge = pango_font_description_merge(this : FontDescription*, desc_to_merge : Pointer(LibPango::FontDescription), replace_existing : LibC::Int) : Void
  fun font_description_merge_static = pango_font_description_merge_static(this : FontDescription*, desc_to_merge : Pointer(LibPango::FontDescription), replace_existing : LibC::Int) : Void
  fun font_description_set_absolute_size = pango_font_description_set_absolute_size(this : FontDescription*, size : Float64) : Void
  fun font_description_set_family = pango_font_description_set_family(this : FontDescription*, family : Pointer(UInt8)) : Void
  fun font_description_set_family_static = pango_font_description_set_family_static(this : FontDescription*, family : Pointer(UInt8)) : Void
  fun font_description_set_gravity = pango_font_description_set_gravity(this : FontDescription*, gravity : LibPango::Gravity) : Void
  fun font_description_set_size = pango_font_description_set_size(this : FontDescription*, size : Int32) : Void
  fun font_description_set_stretch = pango_font_description_set_stretch(this : FontDescription*, stretch : LibPango::Stretch) : Void
  fun font_description_set_style = pango_font_description_set_style(this : FontDescription*, style : LibPango::Style) : Void
  fun font_description_set_variant = pango_font_description_set_variant(this : FontDescription*, variant : LibPango::Variant) : Void
  fun font_description_set_variations = pango_font_description_set_variations(this : FontDescription*, variations : Pointer(UInt8)) : Void
  fun font_description_set_variations_static = pango_font_description_set_variations_static(this : FontDescription*, variations : Pointer(UInt8)) : Void
  fun font_description_set_weight = pango_font_description_set_weight(this : FontDescription*, weight : LibPango::Weight) : Void
  fun font_description_to_filename = pango_font_description_to_filename(this : FontDescription*) : Pointer(UInt8)
  fun font_description_to_string = pango_font_description_to_string(this : FontDescription*) : Pointer(UInt8)
  fun font_description_unset_fields = pango_font_description_unset_fields(this : FontDescription*, to_unset : LibPango::FontMask) : Void
  fun font_description_from_string = pango_font_description_from_string(str : Pointer(UInt8)) : Pointer(LibPango::FontDescription)

  struct FontFaceClass # struct
    parent_class : LibGObject::ObjectClass
    get_face_name : Pointer(LibPango::FontFace) -> Pointer(UInt8)
    describe : Pointer(LibPango::FontFace) -> Pointer(LibPango::FontDescription)
    list_sizes : Pointer(LibPango::FontFace), Pointer(Int32), Int32 -> Void
    is_synthesized : Pointer(LibPango::FontFace) -> LibC::Int
    _pango_reserved3 : Pointer(Void)
    _pango_reserved4 : Pointer(Void)
  end

  struct FontFamilyClass # struct
    parent_class : LibGObject::ObjectClass
    list_faces : Pointer(LibPango::FontFamily), Pointer(Pointer(LibPango::FontFace)), Int32 -> Void
    get_name : Pointer(LibPango::FontFamily) -> Pointer(UInt8)
    is_monospace : Pointer(LibPango::FontFamily) -> LibC::Int
    is_variable : Pointer(LibPango::FontFamily) -> LibC::Int
    _pango_reserved2 : Pointer(Void)
    _pango_reserved3 : Pointer(Void)
  end

  struct FontMapClass # struct
    parent_class : LibGObject::ObjectClass
    load_font : Pointer(LibPango::FontMap), Pointer(LibPango::Context), Pointer(LibPango::FontDescription) -> Pointer(LibPango::Font)
    list_families : Pointer(LibPango::FontMap), Pointer(Pointer(LibPango::FontFamily)), Int32 -> Void
    load_fontset : Pointer(LibPango::FontMap), Pointer(LibPango::Context), Pointer(LibPango::FontDescription), Pointer(LibPango::Language) -> Pointer(LibPango::Fontset)
    shape_engine_type : Pointer(UInt8)
    get_serial : Pointer(LibPango::FontMap) -> UInt32
    changed : Pointer(LibPango::FontMap) -> Void
    _pango_reserved1 : Pointer(Void)
    _pango_reserved2 : Pointer(Void)
  end

  struct FontMetrics # struct
    ref_count : UInt32
    ascent : Int32
    descent : Int32
    height : Int32
    approximate_char_width : Int32
    approximate_digit_width : Int32
    underline_position : Int32
    underline_thickness : Int32
    strikethrough_position : Int32
    strikethrough_thickness : Int32
  end

  fun _pango_font_metrics_get_type = pango_font_metrics_get_type : UInt64
  fun font_metrics_get_approximate_char_width = pango_font_metrics_get_approximate_char_width(this : FontMetrics*) : Int32
  fun font_metrics_get_approximate_digit_width = pango_font_metrics_get_approximate_digit_width(this : FontMetrics*) : Int32
  fun font_metrics_get_ascent = pango_font_metrics_get_ascent(this : FontMetrics*) : Int32
  fun font_metrics_get_descent = pango_font_metrics_get_descent(this : FontMetrics*) : Int32
  fun font_metrics_get_height = pango_font_metrics_get_height(this : FontMetrics*) : Int32
  fun font_metrics_get_strikethrough_position = pango_font_metrics_get_strikethrough_position(this : FontMetrics*) : Int32
  fun font_metrics_get_strikethrough_thickness = pango_font_metrics_get_strikethrough_thickness(this : FontMetrics*) : Int32
  fun font_metrics_get_underline_position = pango_font_metrics_get_underline_position(this : FontMetrics*) : Int32
  fun font_metrics_get_underline_thickness = pango_font_metrics_get_underline_thickness(this : FontMetrics*) : Int32
  fun font_metrics_ref = pango_font_metrics_ref(this : FontMetrics*) : Pointer(LibPango::FontMetrics)
  fun font_metrics_unref = pango_font_metrics_unref(this : FontMetrics*) : Void

  struct FontsetClass # struct
    parent_class : LibGObject::ObjectClass
    get_font : Pointer(LibPango::Fontset), UInt32 -> Pointer(LibPango::Font)
    get_metrics : Pointer(LibPango::Fontset) -> Pointer(LibPango::FontMetrics)
    get_language : Pointer(LibPango::Fontset) -> Pointer(LibPango::Language)
    foreach : Pointer(LibPango::Fontset), LibPango::FontsetForeachFunc, Pointer(Void) -> Void
    _pango_reserved1 : Pointer(Void)
    _pango_reserved2 : Pointer(Void)
    _pango_reserved3 : Pointer(Void)
    _pango_reserved4 : Pointer(Void)
  end

  struct FontsetSimpleClass # struct
    _data : UInt8[0]
  end

  struct GlyphGeometry # struct
    width : Int32
    x_offset : Int32
    y_offset : Int32
  end

  struct GlyphInfo # struct
    glyph : UInt32
    geometry : LibPango::GlyphGeometry
    attr : LibPango::GlyphVisAttr
  end

  struct GlyphItem # struct
    item : Pointer(LibPango::Item)
    glyphs : Pointer(LibPango::GlyphString)
  end

  fun _pango_glyph_item_get_type = pango_glyph_item_get_type : UInt64
  fun glyph_item_apply_attrs = pango_glyph_item_apply_attrs(this : GlyphItem*, text : Pointer(UInt8), list : Pointer(LibPango::AttrList)) : Pointer(Void*)
  fun glyph_item_copy = pango_glyph_item_copy(this : GlyphItem*) : Pointer(LibPango::GlyphItem)
  fun glyph_item_free = pango_glyph_item_free(this : GlyphItem*) : Void
  fun glyph_item_get_logical_widths = pango_glyph_item_get_logical_widths(this : GlyphItem*, text : Pointer(UInt8), logical_widths : Pointer(Int32)) : Void
  fun glyph_item_letter_space = pango_glyph_item_letter_space(this : GlyphItem*, text : Pointer(UInt8), log_attrs : Pointer(LibPango::LogAttr), letter_spacing : Int32) : Void
  fun glyph_item_split = pango_glyph_item_split(this : GlyphItem*, text : Pointer(UInt8), split_index : Int32) : Pointer(LibPango::GlyphItem)

  struct GlyphItemIter # struct
    glyph_item : Pointer(LibPango::GlyphItem)
    text : Pointer(UInt8)
    start_glyph : Int32
    start_index : Int32
    start_char : Int32
    end_glyph : Int32
    end_index : Int32
    end_char : Int32
  end

  fun _pango_glyph_item_iter_get_type = pango_glyph_item_iter_get_type : UInt64
  fun glyph_item_iter_copy = pango_glyph_item_iter_copy(this : GlyphItemIter*) : Pointer(LibPango::GlyphItemIter)
  fun glyph_item_iter_free = pango_glyph_item_iter_free(this : GlyphItemIter*) : Void
  fun glyph_item_iter_init_end = pango_glyph_item_iter_init_end(this : GlyphItemIter*, glyph_item : Pointer(LibPango::GlyphItem), text : Pointer(UInt8)) : LibC::Int
  fun glyph_item_iter_init_start = pango_glyph_item_iter_init_start(this : GlyphItemIter*, glyph_item : Pointer(LibPango::GlyphItem), text : Pointer(UInt8)) : LibC::Int
  fun glyph_item_iter_next_cluster = pango_glyph_item_iter_next_cluster(this : GlyphItemIter*) : LibC::Int
  fun glyph_item_iter_prev_cluster = pango_glyph_item_iter_prev_cluster(this : GlyphItemIter*) : LibC::Int

  struct GlyphString # struct
    num_glyphs : Int32
    glyphs : Pointer(LibPango::GlyphInfo)
    log_clusters : Pointer(Int32)
    space : Int32
  end

  fun _pango_glyph_string_get_type = pango_glyph_string_get_type : UInt64
  fun glyph_string_new = pango_glyph_string_new : Pointer(LibPango::GlyphString)
  fun glyph_string_copy = pango_glyph_string_copy(this : GlyphString*) : Pointer(LibPango::GlyphString)
  fun glyph_string_extents = pango_glyph_string_extents(this : GlyphString*, font : Pointer(LibPango::Font), ink_rect : LibPango::Rectangle*, logical_rect : LibPango::Rectangle*) : Void
  fun glyph_string_extents_range = pango_glyph_string_extents_range(this : GlyphString*, start : Int32, _end : Int32, font : Pointer(LibPango::Font), ink_rect : LibPango::Rectangle*, logical_rect : LibPango::Rectangle*) : Void
  fun glyph_string_free = pango_glyph_string_free(this : GlyphString*) : Void
  fun glyph_string_get_logical_widths = pango_glyph_string_get_logical_widths(this : GlyphString*, text : Pointer(UInt8), length : Int32, embedding_level : Int32, logical_widths : Pointer(Int32)) : Void
  fun glyph_string_get_width = pango_glyph_string_get_width(this : GlyphString*) : Int32
  fun glyph_string_index_to_x = pango_glyph_string_index_to_x(this : GlyphString*, text : Pointer(UInt8), length : Int32, analysis : Pointer(LibPango::Analysis), index_ : Int32, trailing : LibC::Int, x_pos : Int32*) : Void
  fun glyph_string_set_size = pango_glyph_string_set_size(this : GlyphString*, new_len : Int32) : Void
  fun glyph_string_x_to_index = pango_glyph_string_x_to_index(this : GlyphString*, text : Pointer(UInt8), length : Int32, analysis : Pointer(LibPango::Analysis), x_pos : Int32, index_ : Int32*, trailing : Int32*) : Void

  struct GlyphVisAttr # struct
    is_cluster_start : UInt32
  end

  struct IncludedModule # struct
    list : Pointer(LibPango::EngineInfo), Pointer(Int32) -> Void
    init : Pointer(LibGObject::TypeModule) -> Void
    exit : -> Void
    create : Pointer(Void)
  end

  struct Item # struct
    offset : Int32
    length : Int32
    num_chars : Int32
    analysis : LibPango::Analysis
  end

  fun _pango_item_get_type = pango_item_get_type : UInt64
  fun item_new = pango_item_new : Pointer(LibPango::Item)
  fun item_apply_attrs = pango_item_apply_attrs(this : Item*, iter : Pointer(LibPango::AttrIterator)) : Void
  fun item_copy = pango_item_copy(this : Item*) : Pointer(LibPango::Item)
  fun item_free = pango_item_free(this : Item*) : Void
  fun item_split = pango_item_split(this : Item*, split_index : Int32, split_offset : Int32) : Pointer(LibPango::Item)

  struct Language # struct
    _data : UInt8[0]
  end

  fun _pango_language_get_type = pango_language_get_type : UInt64
  fun language_get_sample_string = pango_language_get_sample_string(this : Language*) : Pointer(UInt8)
  fun language_get_scripts = pango_language_get_scripts(this : Language*, num_scripts : Int32*) : Pointer(LibPango::Script)
  fun language_includes_script = pango_language_includes_script(this : Language*, script : LibPango::Script) : LibC::Int
  fun language_matches = pango_language_matches(this : Language*, range_list : Pointer(UInt8)) : LibC::Int
  fun language_to_string = pango_language_to_string(this : Language*) : Pointer(UInt8)
  fun language_from_string = pango_language_from_string(language : Pointer(UInt8)) : Pointer(LibPango::Language)
  fun language_get_default = pango_language_get_default : Pointer(LibPango::Language)

  struct LayoutClass # struct
    _data : UInt8[0]
  end

  struct LayoutIter # struct
    _data : UInt8[0]
  end

  fun _pango_layout_iter_get_type = pango_layout_iter_get_type : UInt64
  fun layout_iter_at_last_line = pango_layout_iter_at_last_line(this : LayoutIter*) : LibC::Int
  fun layout_iter_copy = pango_layout_iter_copy(this : LayoutIter*) : Pointer(LibPango::LayoutIter)
  fun layout_iter_free = pango_layout_iter_free(this : LayoutIter*) : Void
  fun layout_iter_get_baseline = pango_layout_iter_get_baseline(this : LayoutIter*) : Int32
  fun layout_iter_get_char_extents = pango_layout_iter_get_char_extents(this : LayoutIter*, logical_rect : LibPango::Rectangle*) : Void
  fun layout_iter_get_cluster_extents = pango_layout_iter_get_cluster_extents(this : LayoutIter*, ink_rect : LibPango::Rectangle*, logical_rect : LibPango::Rectangle*) : Void
  fun layout_iter_get_index = pango_layout_iter_get_index(this : LayoutIter*) : Int32
  fun layout_iter_get_layout = pango_layout_iter_get_layout(this : LayoutIter*) : Pointer(LibPango::Layout)
  fun layout_iter_get_layout_extents = pango_layout_iter_get_layout_extents(this : LayoutIter*, ink_rect : LibPango::Rectangle*, logical_rect : LibPango::Rectangle*) : Void
  fun layout_iter_get_line = pango_layout_iter_get_line(this : LayoutIter*) : Pointer(LibPango::LayoutLine)
  fun layout_iter_get_line_extents = pango_layout_iter_get_line_extents(this : LayoutIter*, ink_rect : LibPango::Rectangle*, logical_rect : LibPango::Rectangle*) : Void
  fun layout_iter_get_line_readonly = pango_layout_iter_get_line_readonly(this : LayoutIter*) : Pointer(LibPango::LayoutLine)
  fun layout_iter_get_line_yrange = pango_layout_iter_get_line_yrange(this : LayoutIter*, y0_ : Int32*, y1_ : Int32*) : Void
  fun layout_iter_get_run = pango_layout_iter_get_run(this : LayoutIter*) : Pointer(LibPango::GlyphItem)
  fun layout_iter_get_run_extents = pango_layout_iter_get_run_extents(this : LayoutIter*, ink_rect : LibPango::Rectangle*, logical_rect : LibPango::Rectangle*) : Void
  fun layout_iter_get_run_readonly = pango_layout_iter_get_run_readonly(this : LayoutIter*) : Pointer(LibPango::GlyphItem)
  fun layout_iter_next_char = pango_layout_iter_next_char(this : LayoutIter*) : LibC::Int
  fun layout_iter_next_cluster = pango_layout_iter_next_cluster(this : LayoutIter*) : LibC::Int
  fun layout_iter_next_line = pango_layout_iter_next_line(this : LayoutIter*) : LibC::Int
  fun layout_iter_next_run = pango_layout_iter_next_run(this : LayoutIter*) : LibC::Int

  struct LayoutLine # struct
    layout : Pointer(LibPango::Layout)
    start_index : Int32
    length : Int32
    runs : Pointer(Void*)
    is_paragraph_start : UInt32
    resolved_dir : UInt32
  end

  fun _pango_layout_line_get_type = pango_layout_line_get_type : UInt64
  fun layout_line_get_extents = pango_layout_line_get_extents(this : LayoutLine*, ink_rect : LibPango::Rectangle*, logical_rect : LibPango::Rectangle*) : Void
  fun layout_line_get_height = pango_layout_line_get_height(this : LayoutLine*, height : Int32*) : Void
  fun layout_line_get_pixel_extents = pango_layout_line_get_pixel_extents(this : LayoutLine*, ink_rect : LibPango::Rectangle*, logical_rect : LibPango::Rectangle*) : Void
  fun layout_line_get_x_ranges = pango_layout_line_get_x_ranges(this : LayoutLine*, start_index : Int32, end_index : Int32, ranges : Pointer(Int32)*, n_ranges : Int32*) : Void
  fun layout_line_index_to_x = pango_layout_line_index_to_x(this : LayoutLine*, index_ : Int32, trailing : LibC::Int, x_pos : Int32*) : Void
  fun layout_line_ref = pango_layout_line_ref(this : LayoutLine*) : Pointer(LibPango::LayoutLine)
  fun layout_line_unref = pango_layout_line_unref(this : LayoutLine*) : Void
  fun layout_line_x_to_index = pango_layout_line_x_to_index(this : LayoutLine*, x_pos : Int32, index_ : Int32*, trailing : Int32*) : LibC::Int

  struct LogAttr # struct
    is_line_break : UInt32
    is_mandatory_break : UInt32
    is_char_break : UInt32
    is_white : UInt32
    is_cursor_position : UInt32
    is_word_start : UInt32
    is_word_end : UInt32
    is_sentence_boundary : UInt32
    is_sentence_start : UInt32
    is_sentence_end : UInt32
    backspace_deletes_character : UInt32
    is_expandable_space : UInt32
    is_word_boundary : UInt32
  end

  struct Map # struct
    _data : UInt8[0]
  end

  struct MapEntry # struct
    _data : UInt8[0]
  end

  struct Matrix # struct
    xx : Float64
    xy : Float64
    yx : Float64
    yy : Float64
    x0 : Float64
    y0 : Float64
  end

  fun _pango_matrix_get_type = pango_matrix_get_type : UInt64
  fun matrix_concat = pango_matrix_concat(this : Matrix*, new_matrix : Pointer(LibPango::Matrix)) : Void
  fun matrix_copy = pango_matrix_copy(this : Matrix*) : Pointer(LibPango::Matrix)
  fun matrix_free = pango_matrix_free(this : Matrix*) : Void
  fun matrix_get_font_scale_factor = pango_matrix_get_font_scale_factor(this : Matrix*) : Float64
  fun matrix_get_font_scale_factors = pango_matrix_get_font_scale_factors(this : Matrix*, xscale : Float64*, yscale : Float64*) : Void
  fun matrix_rotate = pango_matrix_rotate(this : Matrix*, degrees : Float64) : Void
  fun matrix_scale = pango_matrix_scale(this : Matrix*, scale_x : Float64, scale_y : Float64) : Void
  fun matrix_transform_distance = pango_matrix_transform_distance(this : Matrix*, dx : Float64*, dy : Float64*) : Void
  fun matrix_transform_pixel_rectangle = pango_matrix_transform_pixel_rectangle(this : Matrix*, rect : LibPango::Rectangle*) : Void
  fun matrix_transform_point = pango_matrix_transform_point(this : Matrix*, x : Float64*, y : Float64*) : Void
  fun matrix_transform_rectangle = pango_matrix_transform_rectangle(this : Matrix*, rect : LibPango::Rectangle*) : Void
  fun matrix_translate = pango_matrix_translate(this : Matrix*, tx : Float64, ty : Float64) : Void

  struct Rectangle # struct
    x : Int32
    y : Int32
    width : Int32
    height : Int32
  end

  struct RendererClass # struct
    parent_class : LibGObject::ObjectClass
    draw_glyphs : Pointer(LibPango::Renderer), Pointer(LibPango::Font), Pointer(LibPango::GlyphString), Int32, Int32 -> Void
    draw_rectangle : Pointer(LibPango::Renderer), LibPango::RenderPart, Int32, Int32, Int32, Int32 -> Void
    draw_error_underline : Pointer(LibPango::Renderer), Int32, Int32, Int32, Int32 -> Void
    draw_shape : Pointer(LibPango::Renderer), Pointer(LibPango::AttrShape), Int32, Int32 -> Void
    draw_trapezoid : Pointer(LibPango::Renderer), LibPango::RenderPart, Float64, Float64, Float64, Float64, Float64, Float64 -> Void
    draw_glyph : Pointer(LibPango::Renderer), Pointer(LibPango::Font), UInt32, Float64, Float64 -> Void
    part_changed : Pointer(LibPango::Renderer), LibPango::RenderPart -> Void
    _begin : Pointer(LibPango::Renderer) -> Void
    _end : Pointer(LibPango::Renderer) -> Void
    prepare_run : Pointer(LibPango::Renderer), Pointer(LibPango::GlyphItem) -> Void
    draw_glyph_item : Pointer(LibPango::Renderer), Pointer(UInt8), Pointer(LibPango::GlyphItem), Int32, Int32 -> Void
    _pango_reserved2 : Pointer(Void)
    _pango_reserved3 : Pointer(Void)
    _pango_reserved4 : Pointer(Void)
  end

  struct RendererPrivate # struct
    _data : UInt8[0]
  end

  struct ScriptIter # struct
    _data : UInt8[0]
  end

  fun _pango_script_iter_get_type = pango_script_iter_get_type : UInt64
  fun script_iter_new = pango_script_iter_new(text : Pointer(UInt8), length : Int32) : Pointer(LibPango::ScriptIter)
  fun script_iter_free = pango_script_iter_free(this : ScriptIter*) : Void
  fun script_iter_get_range = pango_script_iter_get_range(this : ScriptIter*, start : Pointer(UInt8)*, _end : Pointer(UInt8)*, script : LibPango::Script*) : Void
  fun script_iter_next = pango_script_iter_next(this : ScriptIter*) : LibC::Int

  struct TabArray # struct
    _data : UInt8[0]
  end

  fun _pango_tab_array_get_type = pango_tab_array_get_type : UInt64
  fun tab_array_new = pango_tab_array_new(initial_size : Int32, positions_in_pixels : LibC::Int) : Pointer(LibPango::TabArray)
  fun tab_array_copy = pango_tab_array_copy(this : TabArray*) : Pointer(LibPango::TabArray)
  fun tab_array_free = pango_tab_array_free(this : TabArray*) : Void
  fun tab_array_get_positions_in_pixels = pango_tab_array_get_positions_in_pixels(this : TabArray*) : LibC::Int
  fun tab_array_get_size = pango_tab_array_get_size(this : TabArray*) : Int32
  fun tab_array_get_tab = pango_tab_array_get_tab(this : TabArray*, tab_index : Int32, alignment : LibPango::TabAlign*, location : Int32*) : Void
  fun tab_array_get_tabs = pango_tab_array_get_tabs(this : TabArray*, alignments : Pointer(LibPango::TabAlign)*, locations : Pointer(Int32)*) : Void
  fun tab_array_resize = pango_tab_array_resize(this : TabArray*, new_size : Int32) : Void
  fun tab_array_set_tab = pango_tab_array_set_tab(this : TabArray*, tab_index : Int32, alignment : LibPango::TabAlign, location : Int32) : Void

  ###########################################
  # #    Objects
  ###########################################

  struct Context # object
    _data : UInt8[0]
  end

  fun _pango_context_get_type = pango_context_get_type : UInt64
  fun context_new = pango_context_new : Pointer(LibPango::Context)
  fun context_changed = pango_context_changed(this : Context*) : Void
  fun context_get_base_dir = pango_context_get_base_dir(this : Context*) : LibPango::Direction
  fun context_get_base_gravity = pango_context_get_base_gravity(this : Context*) : LibPango::Gravity
  fun context_get_font_description = pango_context_get_font_description(this : Context*) : Pointer(LibPango::FontDescription)
  fun context_get_font_map = pango_context_get_font_map(this : Context*) : Pointer(LibPango::FontMap)
  fun context_get_gravity = pango_context_get_gravity(this : Context*) : LibPango::Gravity
  fun context_get_gravity_hint = pango_context_get_gravity_hint(this : Context*) : LibPango::GravityHint
  fun context_get_language = pango_context_get_language(this : Context*) : Pointer(LibPango::Language)
  fun context_get_matrix = pango_context_get_matrix(this : Context*) : Pointer(LibPango::Matrix)
  fun context_get_metrics = pango_context_get_metrics(this : Context*, desc : Pointer(LibPango::FontDescription), language : Pointer(LibPango::Language)) : Pointer(LibPango::FontMetrics)
  fun context_get_round_glyph_positions = pango_context_get_round_glyph_positions(this : Context*) : LibC::Int
  fun context_get_serial = pango_context_get_serial(this : Context*) : UInt32
  fun context_list_families = pango_context_list_families(this : Context*, families : Pointer(Pointer(LibPango::FontFamily))*, n_families : Int32*) : Void
  fun context_load_font = pango_context_load_font(this : Context*, desc : Pointer(LibPango::FontDescription)) : Pointer(LibPango::Font)
  fun context_load_fontset = pango_context_load_fontset(this : Context*, desc : Pointer(LibPango::FontDescription), language : Pointer(LibPango::Language)) : Pointer(LibPango::Fontset)
  fun context_set_base_dir = pango_context_set_base_dir(this : Context*, direction : LibPango::Direction) : Void
  fun context_set_base_gravity = pango_context_set_base_gravity(this : Context*, gravity : LibPango::Gravity) : Void
  fun context_set_font_description = pango_context_set_font_description(this : Context*, desc : Pointer(LibPango::FontDescription)) : Void
  fun context_set_font_map = pango_context_set_font_map(this : Context*, font_map : Pointer(LibPango::FontMap)) : Void
  fun context_set_gravity_hint = pango_context_set_gravity_hint(this : Context*, hint : LibPango::GravityHint) : Void
  fun context_set_language = pango_context_set_language(this : Context*, language : Pointer(LibPango::Language)) : Void
  fun context_set_matrix = pango_context_set_matrix(this : Context*, matrix : Pointer(LibPango::Matrix)) : Void
  fun context_set_round_glyph_positions = pango_context_set_round_glyph_positions(this : Context*, round_positions : LibC::Int) : Void

  struct Coverage # object
    _data : UInt8[0]
  end

  fun _pango_coverage_get_type = pango_coverage_get_type : UInt64
  fun coverage_new = pango_coverage_new : Pointer(LibPango::Coverage)
  fun coverage_from_bytes = pango_coverage_from_bytes(bytes : Pointer(UInt8), n_bytes : Int32) : Pointer(LibPango::Coverage)
  fun coverage_copy = pango_coverage_copy(this : Coverage*) : Pointer(LibPango::Coverage)
  fun coverage_get = pango_coverage_get(this : Coverage*, index_ : Int32) : LibPango::CoverageLevel
  fun coverage_max = pango_coverage_max(this : Coverage*, other : Pointer(LibPango::Coverage)) : Void
  fun coverage_ref = pango_coverage_ref(this : Coverage*) : Pointer(LibPango::Coverage)
  fun coverage_set = pango_coverage_set(this : Coverage*, index_ : Int32, level : LibPango::CoverageLevel) : Void
  fun coverage_to_bytes = pango_coverage_to_bytes(this : Coverage*, bytes : Pointer(UInt8)*, n_bytes : Int32*) : Void
  fun coverage_unref = pango_coverage_unref(this : Coverage*) : Void

  struct Engine # object
    parent_instance : LibGObject::Object
  end

  fun _pango_engine_get_type = pango_engine_get_type : UInt64

  struct EngineLang # object
    parent_instance : LibPango::Engine
    # Virtual function script_break
  end

  fun _pango_engine_lang_get_type = pango_engine_lang_get_type : UInt64

  struct EngineShape # object
    parent_instance : LibPango::Engine
    # Virtual function covers
    # Virtual function script_shape
  end

  fun _pango_engine_shape_get_type = pango_engine_shape_get_type : UInt64

  struct Font # object
    parent_instance : LibGObject::Object
    # Virtual function describe
    # Virtual function describe_absolute
    # Virtual function get_coverage
    # Virtual function get_font_map
    # Virtual function get_glyph_extents
    # Virtual function get_metrics
  end

  fun _pango_font_get_type = pango_font_get_type : UInt64
  fun font_descriptions_free = pango_font_descriptions_free(descs : Pointer(Pointer(LibPango::FontDescription)), n_descs : Int32) : Void
  fun font_describe = pango_font_describe(this : Font*) : Pointer(LibPango::FontDescription)
  fun font_describe_with_absolute_size = pango_font_describe_with_absolute_size(this : Font*) : Pointer(LibPango::FontDescription)
  fun font_find_shaper = pango_font_find_shaper(this : Font*, language : Pointer(LibPango::Language), ch : UInt32) : Pointer(LibPango::EngineShape)
  fun font_get_coverage = pango_font_get_coverage(this : Font*, language : Pointer(LibPango::Language)) : Pointer(LibPango::Coverage)
  fun font_get_font_map = pango_font_get_font_map(this : Font*) : Pointer(LibPango::FontMap)
  fun font_get_glyph_extents = pango_font_get_glyph_extents(this : Font*, glyph : UInt32, ink_rect : LibPango::Rectangle*, logical_rect : LibPango::Rectangle*) : Void
  fun font_get_metrics = pango_font_get_metrics(this : Font*, language : Pointer(LibPango::Language)) : Pointer(LibPango::FontMetrics)
  fun font_has_char = pango_font_has_char(this : Font*, wc : UInt8) : LibC::Int

  struct FontFace # object
    parent_instance : LibGObject::Object
    # Virtual function describe
    # Virtual function get_face_name
    # Virtual function is_synthesized
    # Virtual function list_sizes
  end

  fun _pango_font_face_get_type = pango_font_face_get_type : UInt64
  fun font_face_describe = pango_font_face_describe(this : FontFace*) : Pointer(LibPango::FontDescription)
  fun font_face_get_face_name = pango_font_face_get_face_name(this : FontFace*) : Pointer(UInt8)
  fun font_face_is_synthesized = pango_font_face_is_synthesized(this : FontFace*) : LibC::Int
  fun font_face_list_sizes = pango_font_face_list_sizes(this : FontFace*, sizes : Pointer(Int32)*, n_sizes : Int32*) : Void

  struct FontFamily # object
    parent_instance : LibGObject::Object
    # Virtual function get_name
    # Virtual function is_monospace
    # Virtual function is_variable
    # Virtual function list_faces
  end

  fun _pango_font_family_get_type = pango_font_family_get_type : UInt64
  fun font_family_get_name = pango_font_family_get_name(this : FontFamily*) : Pointer(UInt8)
  fun font_family_is_monospace = pango_font_family_is_monospace(this : FontFamily*) : LibC::Int
  fun font_family_is_variable = pango_font_family_is_variable(this : FontFamily*) : LibC::Int
  fun font_family_list_faces = pango_font_family_list_faces(this : FontFamily*, faces : Pointer(Pointer(LibPango::FontFace))*, n_faces : Int32*) : Void

  struct FontMap # object
    parent_instance : LibGObject::Object
    # Virtual function changed
    # Virtual function get_serial
    # Virtual function list_families
    # Virtual function load_font
    # Virtual function load_fontset
  end

  fun _pango_font_map_get_type = pango_font_map_get_type : UInt64
  fun font_map_changed = pango_font_map_changed(this : FontMap*) : Void
  fun font_map_create_context = pango_font_map_create_context(this : FontMap*) : Pointer(LibPango::Context)
  fun font_map_get_serial = pango_font_map_get_serial(this : FontMap*) : UInt32
  fun font_map_list_families = pango_font_map_list_families(this : FontMap*, families : Pointer(Pointer(LibPango::FontFamily))*, n_families : Int32*) : Void
  fun font_map_load_font = pango_font_map_load_font(this : FontMap*, context : Pointer(LibPango::Context), desc : Pointer(LibPango::FontDescription)) : Pointer(LibPango::Font)
  fun font_map_load_fontset = pango_font_map_load_fontset(this : FontMap*, context : Pointer(LibPango::Context), desc : Pointer(LibPango::FontDescription), language : Pointer(LibPango::Language)) : Pointer(LibPango::Fontset)

  struct Fontset # object
    parent_instance : LibGObject::Object
    # Virtual function foreach
    # Virtual function get_font
    # Virtual function get_language
    # Virtual function get_metrics
  end

  fun _pango_fontset_get_type = pango_fontset_get_type : UInt64
  fun fontset_foreach = pango_fontset_foreach(this : Fontset*, func : LibPango::FontsetForeachFunc, data : Pointer(Void)) : Void
  fun fontset_get_font = pango_fontset_get_font(this : Fontset*, wc : UInt32) : Pointer(LibPango::Font)
  fun fontset_get_metrics = pango_fontset_get_metrics(this : Fontset*) : Pointer(LibPango::FontMetrics)

  struct FontsetSimple # object
    _data : UInt8[0]
  end

  fun _pango_fontset_simple_get_type = pango_fontset_simple_get_type : UInt64
  fun fontset_simple_new = pango_fontset_simple_new(language : Pointer(LibPango::Language)) : Pointer(LibPango::FontsetSimple)
  fun fontset_simple_append = pango_fontset_simple_append(this : FontsetSimple*, font : Pointer(LibPango::Font)) : Void
  fun fontset_simple_size = pango_fontset_simple_size(this : FontsetSimple*) : Int32

  struct Layout # object
    _data : UInt8[0]
  end

  fun _pango_layout_get_type = pango_layout_get_type : UInt64
  fun layout_new = pango_layout_new(context : Pointer(LibPango::Context)) : Pointer(LibPango::Layout)
  fun layout_context_changed = pango_layout_context_changed(this : Layout*) : Void
  fun layout_copy = pango_layout_copy(this : Layout*) : Pointer(LibPango::Layout)
  fun layout_get_alignment = pango_layout_get_alignment(this : Layout*) : LibPango::Alignment
  fun layout_get_attributes = pango_layout_get_attributes(this : Layout*) : Pointer(LibPango::AttrList)
  fun layout_get_auto_dir = pango_layout_get_auto_dir(this : Layout*) : LibC::Int
  fun layout_get_baseline = pango_layout_get_baseline(this : Layout*) : Int32
  fun layout_get_character_count = pango_layout_get_character_count(this : Layout*) : Int32
  fun layout_get_context = pango_layout_get_context(this : Layout*) : Pointer(LibPango::Context)
  fun layout_get_cursor_pos = pango_layout_get_cursor_pos(this : Layout*, index_ : Int32, strong_pos : LibPango::Rectangle*, weak_pos : LibPango::Rectangle*) : Void
  fun layout_get_ellipsize = pango_layout_get_ellipsize(this : Layout*) : LibPango::EllipsizeMode
  fun layout_get_extents = pango_layout_get_extents(this : Layout*, ink_rect : LibPango::Rectangle*, logical_rect : LibPango::Rectangle*) : Void
  fun layout_get_font_description = pango_layout_get_font_description(this : Layout*) : Pointer(LibPango::FontDescription)
  fun layout_get_height = pango_layout_get_height(this : Layout*) : Int32
  fun layout_get_indent = pango_layout_get_indent(this : Layout*) : Int32
  fun layout_get_iter = pango_layout_get_iter(this : Layout*) : Pointer(LibPango::LayoutIter)
  fun layout_get_justify = pango_layout_get_justify(this : Layout*) : LibC::Int
  fun layout_get_line = pango_layout_get_line(this : Layout*, line : Int32) : Pointer(LibPango::LayoutLine)
  fun layout_get_line_count = pango_layout_get_line_count(this : Layout*) : Int32
  fun layout_get_line_readonly = pango_layout_get_line_readonly(this : Layout*, line : Int32) : Pointer(LibPango::LayoutLine)
  fun layout_get_line_spacing = pango_layout_get_line_spacing(this : Layout*) : Float32
  fun layout_get_lines = pango_layout_get_lines(this : Layout*) : Pointer(Void*)
  fun layout_get_lines_readonly = pango_layout_get_lines_readonly(this : Layout*) : Pointer(Void*)
  fun layout_get_log_attrs = pango_layout_get_log_attrs(this : Layout*, attrs : Pointer(LibPango::LogAttr)*, n_attrs : Int32*) : Void
  fun layout_get_log_attrs_readonly = pango_layout_get_log_attrs_readonly(this : Layout*, n_attrs : Int32*) : Pointer(LibPango::LogAttr)
  fun layout_get_pixel_extents = pango_layout_get_pixel_extents(this : Layout*, ink_rect : LibPango::Rectangle*, logical_rect : LibPango::Rectangle*) : Void
  fun layout_get_pixel_size = pango_layout_get_pixel_size(this : Layout*, width : Int32*, height : Int32*) : Void
  fun layout_get_serial = pango_layout_get_serial(this : Layout*) : UInt32
  fun layout_get_single_paragraph_mode = pango_layout_get_single_paragraph_mode(this : Layout*) : LibC::Int
  fun layout_get_size = pango_layout_get_size(this : Layout*, width : Int32*, height : Int32*) : Void
  fun layout_get_spacing = pango_layout_get_spacing(this : Layout*) : Int32
  fun layout_get_tabs = pango_layout_get_tabs(this : Layout*) : Pointer(LibPango::TabArray)
  fun layout_get_text = pango_layout_get_text(this : Layout*) : Pointer(UInt8)
  fun layout_get_unknown_glyphs_count = pango_layout_get_unknown_glyphs_count(this : Layout*) : Int32
  fun layout_get_width = pango_layout_get_width(this : Layout*) : Int32
  fun layout_get_wrap = pango_layout_get_wrap(this : Layout*) : LibPango::WrapMode
  fun layout_index_to_line_x = pango_layout_index_to_line_x(this : Layout*, index_ : Int32, trailing : LibC::Int, line : Int32*, x_pos : Int32*) : Void
  fun layout_index_to_pos = pango_layout_index_to_pos(this : Layout*, index_ : Int32, pos : LibPango::Rectangle*) : Void
  fun layout_is_ellipsized = pango_layout_is_ellipsized(this : Layout*) : LibC::Int
  fun layout_is_wrapped = pango_layout_is_wrapped(this : Layout*) : LibC::Int
  fun layout_move_cursor_visually = pango_layout_move_cursor_visually(this : Layout*, strong : LibC::Int, old_index : Int32, old_trailing : Int32, direction : Int32, new_index : Int32*, new_trailing : Int32*) : Void
  fun layout_set_alignment = pango_layout_set_alignment(this : Layout*, alignment : LibPango::Alignment) : Void
  fun layout_set_attributes = pango_layout_set_attributes(this : Layout*, attrs : Pointer(LibPango::AttrList)) : Void
  fun layout_set_auto_dir = pango_layout_set_auto_dir(this : Layout*, auto_dir : LibC::Int) : Void
  fun layout_set_ellipsize = pango_layout_set_ellipsize(this : Layout*, ellipsize : LibPango::EllipsizeMode) : Void
  fun layout_set_font_description = pango_layout_set_font_description(this : Layout*, desc : Pointer(LibPango::FontDescription)) : Void
  fun layout_set_height = pango_layout_set_height(this : Layout*, height : Int32) : Void
  fun layout_set_indent = pango_layout_set_indent(this : Layout*, indent : Int32) : Void
  fun layout_set_justify = pango_layout_set_justify(this : Layout*, justify : LibC::Int) : Void
  fun layout_set_line_spacing = pango_layout_set_line_spacing(this : Layout*, factor : Float32) : Void
  fun layout_set_markup = pango_layout_set_markup(this : Layout*, markup : Pointer(UInt8), length : Int32) : Void
  fun layout_set_markup_with_accel = pango_layout_set_markup_with_accel(this : Layout*, markup : Pointer(UInt8), length : Int32, accel_marker : UInt8, accel_char : UInt8*) : Void
  fun layout_set_single_paragraph_mode = pango_layout_set_single_paragraph_mode(this : Layout*, setting : LibC::Int) : Void
  fun layout_set_spacing = pango_layout_set_spacing(this : Layout*, spacing : Int32) : Void
  fun layout_set_tabs = pango_layout_set_tabs(this : Layout*, tabs : Pointer(LibPango::TabArray)) : Void
  fun layout_set_text = pango_layout_set_text(this : Layout*, text : Pointer(UInt8), length : Int32) : Void
  fun layout_set_width = pango_layout_set_width(this : Layout*, width : Int32) : Void
  fun layout_set_wrap = pango_layout_set_wrap(this : Layout*, wrap : LibPango::WrapMode) : Void
  fun layout_xy_to_index = pango_layout_xy_to_index(this : Layout*, x : Int32, y : Int32, index_ : Int32*, trailing : Int32*) : LibC::Int

  struct Renderer # object
    parent_instance : LibGObject::Object
    underline : LibPango::Underline
    strikethrough : LibC::Int
    active_count : Int32
    matrix : Pointer(LibPango::Matrix)
    priv : Pointer(LibPango::RendererPrivate)
    # Virtual function begin
    # Virtual function draw_error_underline
    # Virtual function draw_glyph
    # Virtual function draw_glyph_item
    # Virtual function draw_glyphs
    # Virtual function draw_rectangle
    # Virtual function draw_shape
    # Virtual function draw_trapezoid
    # Virtual function end
    # Virtual function part_changed
    # Virtual function prepare_run
  end

  fun _pango_renderer_get_type = pango_renderer_get_type : UInt64
  fun renderer_activate = pango_renderer_activate(this : Renderer*) : Void
  fun renderer_deactivate = pango_renderer_deactivate(this : Renderer*) : Void
  fun renderer_draw_error_underline = pango_renderer_draw_error_underline(this : Renderer*, x : Int32, y : Int32, width : Int32, height : Int32) : Void
  fun renderer_draw_glyph = pango_renderer_draw_glyph(this : Renderer*, font : Pointer(LibPango::Font), glyph : UInt32, x : Float64, y : Float64) : Void
  fun renderer_draw_glyph_item = pango_renderer_draw_glyph_item(this : Renderer*, text : Pointer(UInt8), glyph_item : Pointer(LibPango::GlyphItem), x : Int32, y : Int32) : Void
  fun renderer_draw_glyphs = pango_renderer_draw_glyphs(this : Renderer*, font : Pointer(LibPango::Font), glyphs : Pointer(LibPango::GlyphString), x : Int32, y : Int32) : Void
  fun renderer_draw_layout = pango_renderer_draw_layout(this : Renderer*, layout : Pointer(LibPango::Layout), x : Int32, y : Int32) : Void
  fun renderer_draw_layout_line = pango_renderer_draw_layout_line(this : Renderer*, line : Pointer(LibPango::LayoutLine), x : Int32, y : Int32) : Void
  fun renderer_draw_rectangle = pango_renderer_draw_rectangle(this : Renderer*, part : LibPango::RenderPart, x : Int32, y : Int32, width : Int32, height : Int32) : Void
  fun renderer_draw_trapezoid = pango_renderer_draw_trapezoid(this : Renderer*, part : LibPango::RenderPart, y1_ : Float64, x11 : Float64, x21 : Float64, y2 : Float64, x12 : Float64, x22 : Float64) : Void
  fun renderer_get_alpha = pango_renderer_get_alpha(this : Renderer*, part : LibPango::RenderPart) : UInt16
  fun renderer_get_color = pango_renderer_get_color(this : Renderer*, part : LibPango::RenderPart) : Pointer(LibPango::Color)
  fun renderer_get_layout = pango_renderer_get_layout(this : Renderer*) : Pointer(LibPango::Layout)
  fun renderer_get_layout_line = pango_renderer_get_layout_line(this : Renderer*) : Pointer(LibPango::LayoutLine)
  fun renderer_get_matrix = pango_renderer_get_matrix(this : Renderer*) : Pointer(LibPango::Matrix)
  fun renderer_part_changed = pango_renderer_part_changed(this : Renderer*, part : LibPango::RenderPart) : Void
  fun renderer_set_alpha = pango_renderer_set_alpha(this : Renderer*, part : LibPango::RenderPart, alpha : UInt16) : Void
  fun renderer_set_color = pango_renderer_set_color(this : Renderer*, part : LibPango::RenderPart, color : Pointer(LibPango::Color)) : Void
  fun renderer_set_matrix = pango_renderer_set_matrix(this : Renderer*, matrix : Pointer(LibPango::Matrix)) : Void

  ###########################################
  # #    Flags
  ###########################################

  alias FontMask = UInt32

  alias ShapeFlags = UInt32

  alias ShowFlags = UInt32

  ###########################################
  # #    Functions
  ###########################################
  fun attr_allow_breaks_new = pango_attr_allow_breaks_new(allow_breaks : LibC::Int) : Pointer(LibPango::Attribute)
  fun attr_background_alpha_new = pango_attr_background_alpha_new(alpha : UInt16) : Pointer(LibPango::Attribute)
  fun attr_background_new = pango_attr_background_new(red : UInt16, green : UInt16, blue : UInt16) : Pointer(LibPango::Attribute)
  fun attr_fallback_new = pango_attr_fallback_new(enable_fallback : LibC::Int) : Pointer(LibPango::Attribute)
  fun attr_family_new = pango_attr_family_new(family : Pointer(UInt8)) : Pointer(LibPango::Attribute)
  fun attr_font_desc_new = pango_attr_font_desc_new(desc : Pointer(LibPango::FontDescription)) : Pointer(LibPango::Attribute)
  fun attr_font_features_new = pango_attr_font_features_new(features : Pointer(UInt8)) : Pointer(LibPango::Attribute)
  fun attr_foreground_alpha_new = pango_attr_foreground_alpha_new(alpha : UInt16) : Pointer(LibPango::Attribute)
  fun attr_foreground_new = pango_attr_foreground_new(red : UInt16, green : UInt16, blue : UInt16) : Pointer(LibPango::Attribute)
  fun attr_gravity_hint_new = pango_attr_gravity_hint_new(hint : LibPango::GravityHint) : Pointer(LibPango::Attribute)
  fun attr_gravity_new = pango_attr_gravity_new(gravity : LibPango::Gravity) : Pointer(LibPango::Attribute)
  fun attr_insert_hyphens_new = pango_attr_insert_hyphens_new(insert_hyphens : LibC::Int) : Pointer(LibPango::Attribute)
  fun attr_language_new = pango_attr_language_new(language : Pointer(LibPango::Language)) : Pointer(LibPango::Attribute)
  fun attr_letter_spacing_new = pango_attr_letter_spacing_new(letter_spacing : Int32) : Pointer(LibPango::Attribute)
  fun attr_rise_new = pango_attr_rise_new(rise : Int32) : Pointer(LibPango::Attribute)
  fun attr_scale_new = pango_attr_scale_new(scale_factor : Float64) : Pointer(LibPango::Attribute)
  fun attr_shape_new = pango_attr_shape_new(ink_rect : Pointer(LibPango::Rectangle), logical_rect : Pointer(LibPango::Rectangle)) : Pointer(LibPango::Attribute)
  fun attr_shape_new_with_data = pango_attr_shape_new_with_data(ink_rect : Pointer(LibPango::Rectangle), logical_rect : Pointer(LibPango::Rectangle), data : Pointer(Void), copy_func : LibPango::AttrDataCopyFunc, destroy_func : LibGLib::DestroyNotify) : Pointer(LibPango::Attribute)
  fun attr_show_new = pango_attr_show_new(flags : LibPango::ShowFlags) : Pointer(LibPango::Attribute)
  fun attr_size_new = pango_attr_size_new(size : Int32) : Pointer(LibPango::Attribute)
  fun attr_size_new_absolute = pango_attr_size_new_absolute(size : Int32) : Pointer(LibPango::Attribute)
  fun attr_stretch_new = pango_attr_stretch_new(stretch : LibPango::Stretch) : Pointer(LibPango::Attribute)
  fun attr_strikethrough_color_new = pango_attr_strikethrough_color_new(red : UInt16, green : UInt16, blue : UInt16) : Pointer(LibPango::Attribute)
  fun attr_strikethrough_new = pango_attr_strikethrough_new(strikethrough : LibC::Int) : Pointer(LibPango::Attribute)
  fun attr_style_new = pango_attr_style_new(style : LibPango::Style) : Pointer(LibPango::Attribute)
  fun attr_type_get_name = pango_attr_type_get_name(type : LibPango::AttrType) : Pointer(UInt8)
  fun attr_type_register = pango_attr_type_register(name : Pointer(UInt8)) : LibPango::AttrType
  fun attr_underline_color_new = pango_attr_underline_color_new(red : UInt16, green : UInt16, blue : UInt16) : Pointer(LibPango::Attribute)
  fun attr_underline_new = pango_attr_underline_new(underline : LibPango::Underline) : Pointer(LibPango::Attribute)
  fun attr_variant_new = pango_attr_variant_new(variant : LibPango::Variant) : Pointer(LibPango::Attribute)
  fun attr_weight_new = pango_attr_weight_new(weight : LibPango::Weight) : Pointer(LibPango::Attribute)
  fun bidi_type_for_unichar = pango_bidi_type_for_unichar(ch : UInt8) : LibPango::BidiType
  fun break = pango_break(text : Pointer(UInt8), length : Int32, analysis : Pointer(LibPango::Analysis), attrs : Pointer(LibPango::LogAttr), attrs_len : Int32) : Void
  fun default_break = pango_default_break(text : Pointer(UInt8), length : Int32, analysis : Pointer(LibPango::Analysis), attrs : Pointer(LibPango::LogAttr), attrs_len : Int32) : Void
  fun extents_to_pixels = pango_extents_to_pixels(inclusive : Pointer(LibPango::Rectangle), nearest : Pointer(LibPango::Rectangle)) : Void
  fun find_base_dir = pango_find_base_dir(text : Pointer(UInt8), length : Int32) : LibPango::Direction
  fun find_paragraph_boundary = pango_find_paragraph_boundary(text : Pointer(UInt8), length : Int32, paragraph_delimiter_index : Int32*, next_paragraph_start : Int32*) : Void
  fun font_description_from_string = pango_font_description_from_string(str : Pointer(UInt8)) : Pointer(LibPango::FontDescription)
  fun get_log_attrs = pango_get_log_attrs(text : Pointer(UInt8), length : Int32, level : Int32, language : Pointer(LibPango::Language), log_attrs : Pointer(LibPango::LogAttr), attrs_len : Int32) : Void
  fun get_mirror_char = pango_get_mirror_char(ch : UInt8, mirrored_ch : Pointer(UInt8)) : LibC::Int
  fun gravity_get_for_matrix = pango_gravity_get_for_matrix(matrix : Pointer(LibPango::Matrix)) : LibPango::Gravity
  fun gravity_get_for_script = pango_gravity_get_for_script(script : LibPango::Script, base_gravity : LibPango::Gravity, hint : LibPango::GravityHint) : LibPango::Gravity
  fun gravity_get_for_script_and_width = pango_gravity_get_for_script_and_width(script : LibPango::Script, wide : LibC::Int, base_gravity : LibPango::Gravity, hint : LibPango::GravityHint) : LibPango::Gravity
  fun gravity_to_rotation = pango_gravity_to_rotation(gravity : LibPango::Gravity) : Float64
  fun is_zero_width = pango_is_zero_width(ch : UInt8) : LibC::Int
  fun itemize = pango_itemize(context : Pointer(LibPango::Context), text : Pointer(UInt8), start_index : Int32, length : Int32, attrs : Pointer(LibPango::AttrList), cached_iter : Pointer(LibPango::AttrIterator)) : Pointer(Void*)
  fun itemize_with_base_dir = pango_itemize_with_base_dir(context : Pointer(LibPango::Context), base_dir : LibPango::Direction, text : Pointer(UInt8), start_index : Int32, length : Int32, attrs : Pointer(LibPango::AttrList), cached_iter : Pointer(LibPango::AttrIterator)) : Pointer(Void*)
  fun language_from_string = pango_language_from_string(language : Pointer(UInt8)) : Pointer(LibPango::Language)
  fun language_get_default = pango_language_get_default : Pointer(LibPango::Language)
  fun log2vis_get_embedding_levels = pango_log2vis_get_embedding_levels(text : Pointer(UInt8), length : Int32, pbase_dir : Pointer(LibPango::Direction)) : Pointer(UInt8)
  fun markup_parser_finish = pango_markup_parser_finish(context : Pointer(LibGLib::MarkupParseContext), attr_list : Pointer(LibPango::AttrList)*, text : Pointer(UInt8)*, accel_char : UInt8*, error : LibGLib::Error**) : LibC::Int
  fun markup_parser_new = pango_markup_parser_new(accel_marker : UInt8) : Pointer(LibGLib::MarkupParseContext)
  fun parse_enum = pango_parse_enum(type : UInt64, str : Pointer(UInt8), value : Int32*, warn : LibC::Int, possible_values : Pointer(UInt8)*) : LibC::Int
  fun parse_markup = pango_parse_markup(markup_text : Pointer(UInt8), length : Int32, accel_marker : UInt8, attr_list : Pointer(LibPango::AttrList)*, text : Pointer(UInt8)*, accel_char : UInt8*, error : LibGLib::Error**) : LibC::Int
  fun parse_stretch = pango_parse_stretch(str : Pointer(UInt8), stretch : LibPango::Stretch*, warn : LibC::Int) : LibC::Int
  fun parse_style = pango_parse_style(str : Pointer(UInt8), style : LibPango::Style*, warn : LibC::Int) : LibC::Int
  fun parse_variant = pango_parse_variant(str : Pointer(UInt8), variant : LibPango::Variant*, warn : LibC::Int) : LibC::Int
  fun parse_weight = pango_parse_weight(str : Pointer(UInt8), weight : LibPango::Weight*, warn : LibC::Int) : LibC::Int
  fun quantize_line_geometry = pango_quantize_line_geometry(thickness : Int32*, position : Int32*) : Void
  fun read_line = pango_read_line(stream : Pointer(Void), str : Pointer(LibGLib::String)) : Int32
  fun reorder_items = pango_reorder_items(logical_items : Pointer(Void*)) : Pointer(Void*)
  fun scan_int = pango_scan_int(pos : Pointer(UInt8)*, _out : Int32*) : LibC::Int
  fun scan_string = pango_scan_string(pos : Pointer(UInt8)*, _out : Pointer(LibGLib::String)) : LibC::Int
  fun scan_word = pango_scan_word(pos : Pointer(UInt8)*, _out : Pointer(LibGLib::String)) : LibC::Int
  fun script_for_unichar = pango_script_for_unichar(ch : UInt8) : LibPango::Script
  fun script_get_sample_language = pango_script_get_sample_language(script : LibPango::Script) : Pointer(LibPango::Language)
  fun shape = pango_shape(text : Pointer(UInt8), length : Int32, analysis : Pointer(LibPango::Analysis), glyphs : Pointer(LibPango::GlyphString)) : Void
  fun shape_full = pango_shape_full(item_text : Pointer(UInt8), item_length : Int32, paragraph_text : Pointer(UInt8), paragraph_length : Int32, analysis : Pointer(LibPango::Analysis), glyphs : Pointer(LibPango::GlyphString)) : Void
  fun shape_with_flags = pango_shape_with_flags(item_text : Pointer(UInt8), item_length : Int32, paragraph_text : Pointer(UInt8), paragraph_length : Int32, analysis : Pointer(LibPango::Analysis), glyphs : Pointer(LibPango::GlyphString), flags : LibPango::ShapeFlags) : Void
  fun skip_space = pango_skip_space(pos : Pointer(UInt8)*) : LibC::Int
  fun split_file_list = pango_split_file_list(str : Pointer(UInt8)) : Pointer(Pointer(UInt8))
  fun tailor_break = pango_tailor_break(text : Pointer(UInt8), length : Int32, analysis : Pointer(LibPango::Analysis), offset : Int32, log_attrs : Pointer(LibPango::LogAttr), log_attrs_len : Int32) : Void
  fun trim_string = pango_trim_string(str : Pointer(UInt8)) : Pointer(UInt8)
  fun unichar_direction = pango_unichar_direction(ch : UInt8) : LibPango::Direction
  fun units_from_double = pango_units_from_double(d : Float64) : Int32
  fun units_to_double = pango_units_to_double(i : Int32) : Float64
  fun version = pango_version : Int32
  fun version_check = pango_version_check(required_major : Int32, required_minor : Int32, required_micro : Int32) : Pointer(UInt8)
  fun version_string = pango_version_string : Pointer(UInt8)

  ###########################################
  # #    Callbacks
  ###########################################
  alias AttrDataCopyFunc = Pointer(Void) -> Pointer(Void)
  alias AttrFilterFunc = Pointer(LibPango::Attribute), Pointer(Void) -> LibC::Int
  alias FontsetForeachFunc = Pointer(LibPango::Fontset), Pointer(LibPango::Font), Pointer(Void) -> LibC::Int
end

module Pango
  ANALYSIS_FLAG_CENTERED_BASELINE = LibPango::ANALYSIS_FLAG_CENTERED_BASELINE
  ANALYSIS_FLAG_IS_ELLIPSIS       = LibPango::ANALYSIS_FLAG_IS_ELLIPSIS
  ANALYSIS_FLAG_NEED_HYPHEN       = LibPango::ANALYSIS_FLAG_NEED_HYPHEN
  ATTR_INDEX_FROM_TEXT_BEGINNING  = LibPango::ATTR_INDEX_FROM_TEXT_BEGINNING
  ENGINE_TYPE_LANG                = LibPango::ENGINE_TYPE_LANG
  ENGINE_TYPE_SHAPE               = LibPango::ENGINE_TYPE_SHAPE
  GLYPH_EMPTY                     = LibPango::GLYPH_EMPTY
  GLYPH_INVALID_INPUT             = LibPango::GLYPH_INVALID_INPUT
  GLYPH_UNKNOWN_FLAG              = LibPango::GLYPH_UNKNOWN_FLAG
  RENDER_TYPE_NONE                = LibPango::RENDER_TYPE_NONE
  SCALE                           = LibPango::SCALE
  UNKNOWN_GLYPH_HEIGHT            = LibPango::UNKNOWN_GLYPH_HEIGHT
  UNKNOWN_GLYPH_WIDTH             = LibPango::UNKNOWN_GLYPH_WIDTH
  VERSION_MIN_REQUIRED            = LibPango::VERSION_MIN_REQUIRED

  def self.attr_allow_breaks_new(allow_breaks : ::Bool)
    __var0 = LibPango.attr_allow_breaks_new(LibC::Int.new(allow_breaks ? 1 : 0))
    GObject.raise_unexpected_null("pango_attr_allow_breaks_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_background_alpha_new(alpha : ::Int)
    __var0 = LibPango.attr_background_alpha_new(UInt16.new(alpha))
    GObject.raise_unexpected_null("pango_attr_background_alpha_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_background_new(red : ::Int, green : ::Int, blue : ::Int)
    __var0 = LibPango.attr_background_new(UInt16.new(red), UInt16.new(green), UInt16.new(blue))
    GObject.raise_unexpected_null("pango_attr_background_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_fallback_new(enable_fallback : ::Bool)
    __var0 = LibPango.attr_fallback_new(LibC::Int.new(enable_fallback ? 1 : 0))
    GObject.raise_unexpected_null("pango_attr_fallback_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_family_new(family : ::String)
    __var0 = LibPango.attr_family_new(family.to_unsafe)
    GObject.raise_unexpected_null("pango_attr_family_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_font_desc_new(desc : Pango::FontDescription)
    __var0 = LibPango.attr_font_desc_new(desc.to_unsafe.as(LibPango::FontDescription*))
    GObject.raise_unexpected_null("pango_attr_font_desc_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_font_features_new(features : ::String)
    __var0 = LibPango.attr_font_features_new(features.to_unsafe)
    GObject.raise_unexpected_null("pango_attr_font_features_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_foreground_alpha_new(alpha : ::Int)
    __var0 = LibPango.attr_foreground_alpha_new(UInt16.new(alpha))
    GObject.raise_unexpected_null("pango_attr_foreground_alpha_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_foreground_new(red : ::Int, green : ::Int, blue : ::Int)
    __var0 = LibPango.attr_foreground_new(UInt16.new(red), UInt16.new(green), UInt16.new(blue))
    GObject.raise_unexpected_null("pango_attr_foreground_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_gravity_hint_new(hint : Pango::GravityHint)
    __var0 = LibPango.attr_gravity_hint_new(hint)
    GObject.raise_unexpected_null("pango_attr_gravity_hint_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_gravity_new(gravity : Pango::Gravity)
    __var0 = LibPango.attr_gravity_new(gravity)
    GObject.raise_unexpected_null("pango_attr_gravity_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_insert_hyphens_new(insert_hyphens : ::Bool)
    __var0 = LibPango.attr_insert_hyphens_new(LibC::Int.new(insert_hyphens ? 1 : 0))
    GObject.raise_unexpected_null("pango_attr_insert_hyphens_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_language_new(language : Pango::Language)
    __var0 = LibPango.attr_language_new(language.to_unsafe.as(LibPango::Language*))
    GObject.raise_unexpected_null("pango_attr_language_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_letter_spacing_new(letter_spacing : ::Int)
    __var0 = LibPango.attr_letter_spacing_new(Int32.new(letter_spacing))
    GObject.raise_unexpected_null("pango_attr_letter_spacing_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_rise_new(rise : ::Int)
    __var0 = LibPango.attr_rise_new(Int32.new(rise))
    GObject.raise_unexpected_null("pango_attr_rise_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_scale_new(scale_factor : ::Float)
    __var0 = LibPango.attr_scale_new(Float64.new(scale_factor))
    GObject.raise_unexpected_null("pango_attr_scale_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_shape_new(ink_rect : Pango::Rectangle, logical_rect : Pango::Rectangle)
    __var0 = LibPango.attr_shape_new(ink_rect.to_unsafe.as(LibPango::Rectangle*), logical_rect.to_unsafe.as(LibPango::Rectangle*))
    GObject.raise_unexpected_null("pango_attr_shape_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_shape_new_with_data(ink_rect : Pango::Rectangle, logical_rect : Pango::Rectangle, data : Void*?, copy_func : Pango::AttrDataCopyFunc?, destroy_func : GLib::DestroyNotify?)
    __var0 = LibPango.attr_shape_new_with_data(ink_rect.to_unsafe.as(LibPango::Rectangle*), logical_rect.to_unsafe.as(LibPango::Rectangle*), data ? data : Pointer(Void).null, copy_func ? copy_func : nil, destroy_func ? destroy_func : nil)
    GObject.raise_unexpected_null("pango_attr_shape_new_with_data") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_show_new(flags : Pango::ShowFlags)
    __var0 = LibPango.attr_show_new(flags)
    GObject.raise_unexpected_null("pango_attr_show_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_size_new(size : ::Int)
    __var0 = LibPango.attr_size_new(Int32.new(size))
    GObject.raise_unexpected_null("pango_attr_size_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_size_new_absolute(size : ::Int)
    __var0 = LibPango.attr_size_new_absolute(Int32.new(size))
    GObject.raise_unexpected_null("pango_attr_size_new_absolute") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_stretch_new(stretch : Pango::Stretch)
    __var0 = LibPango.attr_stretch_new(stretch)
    GObject.raise_unexpected_null("pango_attr_stretch_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_strikethrough_color_new(red : ::Int, green : ::Int, blue : ::Int)
    __var0 = LibPango.attr_strikethrough_color_new(UInt16.new(red), UInt16.new(green), UInt16.new(blue))
    GObject.raise_unexpected_null("pango_attr_strikethrough_color_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_strikethrough_new(strikethrough : ::Bool)
    __var0 = LibPango.attr_strikethrough_new(LibC::Int.new(strikethrough ? 1 : 0))
    GObject.raise_unexpected_null("pango_attr_strikethrough_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_style_new(style : Pango::Style)
    __var0 = LibPango.attr_style_new(style)
    GObject.raise_unexpected_null("pango_attr_style_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_type_get_name(type : Pango::AttrType)
    __var0 = LibPango.attr_type_get_name(type)
    __var1 = ::String.new(__var0) if __var0
    __var1
  end

  def self.attr_type_register(name : ::String)
    __var0 = LibPango.attr_type_register(name.to_unsafe)
    Pango::AttrType.new(__var0)
  end

  def self.attr_underline_color_new(red : ::Int, green : ::Int, blue : ::Int)
    __var0 = LibPango.attr_underline_color_new(UInt16.new(red), UInt16.new(green), UInt16.new(blue))
    GObject.raise_unexpected_null("pango_attr_underline_color_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_underline_new(underline : Pango::Underline)
    __var0 = LibPango.attr_underline_new(underline)
    GObject.raise_unexpected_null("pango_attr_underline_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_variant_new(variant : Pango::Variant)
    __var0 = LibPango.attr_variant_new(variant)
    GObject.raise_unexpected_null("pango_attr_variant_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.attr_weight_new(weight : Pango::Weight)
    __var0 = LibPango.attr_weight_new(weight)
    GObject.raise_unexpected_null("pango_attr_weight_new") if __var0.null?
    Pango::Attribute.new(__var0)
  end

  def self.bidi_type_for_unichar(ch : UInt8)
    __var0 = LibPango.bidi_type_for_unichar(UInt8.new(ch))
    Pango::BidiType.new(__var0)
  end

  def self.break(text : ::String, length : ::Int, analysis : Pango::Analysis, attrs : ::Enumerable)
    attrs_len = attrs.size
    LibPango.break(text.to_unsafe, Int32.new(length), analysis.to_unsafe.as(LibPango::Analysis*), (__attrs_ary = attrs.map { |__item| __item }.to_a).to_unsafe, Int32.new(attrs_len))
    nil
  end

  def self.default_break(text : ::String, length : ::Int, analysis : Pango::Analysis?, attrs : Pango::LogAttr, attrs_len : ::Int)
    LibPango.default_break(text.to_unsafe, Int32.new(length), analysis ? analysis.to_unsafe.as(LibPango::Analysis*) : Pointer(LibPango::Analysis).null, attrs.to_unsafe.as(LibPango::LogAttr*), Int32.new(attrs_len))
    nil
  end

  def self.extents_to_pixels(inclusive : Pango::Rectangle?, nearest : Pango::Rectangle?)
    LibPango.extents_to_pixels(inclusive ? inclusive.to_unsafe.as(LibPango::Rectangle*) : Pointer(LibPango::Rectangle).null, nearest ? nearest.to_unsafe.as(LibPango::Rectangle*) : Pointer(LibPango::Rectangle).null)
    nil
  end

  def self.find_base_dir(text : ::String, length : ::Int)
    __var0 = LibPango.find_base_dir(text.to_unsafe, Int32.new(length))
    Pango::Direction.new(__var0)
  end

  def self.find_paragraph_boundary(text : ::String, length : ::Int)
    LibPango.find_paragraph_boundary(text.to_unsafe, Int32.new(length), out paragraph_delimiter_index, out next_paragraph_start)
    {paragraph_delimiter_index, next_paragraph_start}
  end

  def self.font_description_from_string(str : ::String)
    __var0 = LibPango.font_description_from_string(str.to_unsafe)
    GObject.raise_unexpected_null("pango_font_description_from_string") if __var0.null?
    Pango::FontDescription.new(__var0)
  end

  def self.log_attrs(text : ::String, length : ::Int, level : ::Int, language : Pango::Language, log_attrs : ::Enumerable)
    attrs_len = log_attrs.size
    LibPango.get_log_attrs(text.to_unsafe, Int32.new(length), Int32.new(level), language.to_unsafe.as(LibPango::Language*), (__log_attrs_ary = log_attrs.map { |__item| __item }.to_a).to_unsafe, Int32.new(attrs_len))
    nil
  end

  def self.mirror_char(ch : UInt8, mirrored_ch : UInt8)
    __var0 = LibPango.get_mirror_char(UInt8.new(ch), mirrored_ch)
    (__var0 == 1)
  end

  def self.gravity_get_for_matrix(matrix : Pango::Matrix?)
    __var0 = LibPango.gravity_get_for_matrix(matrix ? matrix.to_unsafe.as(LibPango::Matrix*) : Pointer(LibPango::Matrix).null)
    Pango::Gravity.new(__var0)
  end

  def self.gravity_get_for_script(script : Pango::Script, base_gravity : Pango::Gravity, hint : Pango::GravityHint)
    __var0 = LibPango.gravity_get_for_script(script, base_gravity, hint)
    Pango::Gravity.new(__var0)
  end

  def self.gravity_get_for_script_and_width(script : Pango::Script, wide : ::Bool, base_gravity : Pango::Gravity, hint : Pango::GravityHint)
    __var0 = LibPango.gravity_get_for_script_and_width(script, LibC::Int.new(wide ? 1 : 0), base_gravity, hint)
    Pango::Gravity.new(__var0)
  end

  def self.gravity_to_rotation(gravity : Pango::Gravity)
    __var0 = LibPango.gravity_to_rotation(gravity)
    __var0
  end

  def self.zero_width?(ch : UInt8)
    __var0 = LibPango.is_zero_width(UInt8.new(ch))
    (__var0 == 1)
  end

  def self.itemize(context : Pango::Context, text : ::String, start_index : ::Int, length : ::Int, attrs : Pango::AttrList, cached_iter : Pango::AttrIterator?)
    __var0 = LibPango.itemize(context.to_unsafe_context, text.to_unsafe, Int32.new(start_index), Int32.new(length), attrs.to_unsafe.as(LibPango::AttrList*), cached_iter ? cached_iter.to_unsafe.as(LibPango::AttrIterator*) : Pointer(LibPango::AttrIterator).null)
    GObject.raise_unexpected_null("pango_itemize") if __var0.null?
    GLib::ListIterator(Pango::Item, LibPango::Item*).new(GLib::List.new(__var0.as(LibGLib::List*)))
  end

  def self.itemize_with_base_dir(context : Pango::Context, base_dir : Pango::Direction, text : ::String, start_index : ::Int, length : ::Int, attrs : Pango::AttrList, cached_iter : Pango::AttrIterator?)
    __var0 = LibPango.itemize_with_base_dir(context.to_unsafe_context, base_dir, text.to_unsafe, Int32.new(start_index), Int32.new(length), attrs.to_unsafe.as(LibPango::AttrList*), cached_iter ? cached_iter.to_unsafe.as(LibPango::AttrIterator*) : Pointer(LibPango::AttrIterator).null)
    GObject.raise_unexpected_null("pango_itemize_with_base_dir") if __var0.null?
    GLib::ListIterator(Pango::Item, LibPango::Item*).new(GLib::List.new(__var0.as(LibGLib::List*)))
  end

  def self.language_from_string(language : ::String?)
    __var0 = LibPango.language_from_string(language ? language.to_unsafe : Pointer(UInt8).null)
    __var1 = Pango::Language.new(__var0) if __var0
    __var1
  end

  def self.language_get_default
    __var0 = LibPango.language_get_default
    GObject.raise_unexpected_null("pango_language_get_default") if __var0.null?
    Pango::Language.new(__var0)
  end

  def self.log2vis_get_embedding_levels(text : ::String, length : ::Int, pbase_dir : Pango::Direction)
    __var0 = LibPango.log2vis_get_embedding_levels(text.to_unsafe, Int32.new(length), pbase_dir.to_unsafe.as(LibPango::Direction*))
    GObject.raise_unexpected_null("pango_log2vis_get_embedding_levels") if __var0.null?
    __var0
  end

  def self.markup_parser_finish(context : GLib::MarkupParseContext, attr_list : Pango::AttrList?)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibPango.markup_parser_finish(context.to_unsafe.as(LibGLib::MarkupParseContext*), attr_list, out text, out accel_char, pointerof(__var0))
    GLib::Error.assert(__var0)
    {(__var1 == 1), ::String.new(text), accel_char}
  end

  def self.markup_parser_new(accel_marker : UInt8)
    __var0 = LibPango.markup_parser_new(UInt8.new(accel_marker))
    GObject.raise_unexpected_null("pango_markup_parser_new") if __var0.null?
    GLib::MarkupParseContext.new(__var0)
  end

  def self.parse_enum(type : UInt64, str : ::String?, warn : ::Bool)
    __var0 = LibPango.parse_enum(UInt64.new(type), str ? str.to_unsafe : Pointer(UInt8).null, out value, LibC::Int.new(warn ? 1 : 0), out possible_values)
    {(__var0 == 1), value, ::String.new(possible_values)}
  end

  def self.parse_markup(markup_text : ::String, length : ::Int, accel_marker : UInt8, attr_list : Pango::AttrList?)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibPango.parse_markup(markup_text.to_unsafe, Int32.new(length), UInt8.new(accel_marker), attr_list, out text, out accel_char, pointerof(__var0))
    GLib::Error.assert(__var0)
    {(__var1 == 1), ::String.new(text), accel_char}
  end

  def self.parse_stretch(str : ::String, stretch : Pango::Stretch, warn : ::Bool)
    __var0 = LibPango.parse_stretch(str.to_unsafe, stretch, LibC::Int.new(warn ? 1 : 0))
    (__var0 == 1)
  end

  def self.parse_style(str : ::String, style : Pango::Style, warn : ::Bool)
    __var0 = LibPango.parse_style(str.to_unsafe, style, LibC::Int.new(warn ? 1 : 0))
    (__var0 == 1)
  end

  def self.parse_variant(str : ::String, variant : Pango::Variant, warn : ::Bool)
    __var0 = LibPango.parse_variant(str.to_unsafe, variant, LibC::Int.new(warn ? 1 : 0))
    (__var0 == 1)
  end

  def self.parse_weight(str : ::String, weight : Pango::Weight, warn : ::Bool)
    __var0 = LibPango.parse_weight(str.to_unsafe, weight, LibC::Int.new(warn ? 1 : 0))
    (__var0 == 1)
  end

  def self.quantize_line_geometry(thickness : ::Int, position : ::Int)
    LibPango.quantize_line_geometry(thickness, position)
    nil
  end

  def self.read_line(stream : Void*?, str : GLib::String)
    __var0 = LibPango.read_line(stream ? stream : Pointer(Void).null, str.to_unsafe.as(LibGLib::String*))
    __var0
  end

  def self.reorder_items(logical_items : Void*)
    __var0 = LibPango.reorder_items(logical_items)
    GObject.raise_unexpected_null("pango_reorder_items") if __var0.null?
    GLib::ListIterator(Pango::Item, LibPango::Item*).new(GLib::List.new(__var0.as(LibGLib::List*)))
  end

  def self.scan_int(pos : ::String)
    __var0 = LibPango.scan_int(pos, out _out)
    {(__var0 == 1), _out}
  end

  def self.scan_string(pos : ::String, _out : GLib::String)
    __var0 = LibPango.scan_string(pos, _out.to_unsafe.as(LibGLib::String*))
    (__var0 == 1)
  end

  def self.scan_word(pos : ::String, _out : GLib::String)
    __var0 = LibPango.scan_word(pos, _out.to_unsafe.as(LibGLib::String*))
    (__var0 == 1)
  end

  def self.script_for_unichar(ch : UInt8)
    __var0 = LibPango.script_for_unichar(UInt8.new(ch))
    Pango::Script.new(__var0)
  end

  def self.script_get_sample_language(script : Pango::Script)
    __var0 = LibPango.script_get_sample_language(script)
    __var1 = Pango::Language.new(__var0) if __var0
    __var1
  end

  def self.shape(text : ::String, length : ::Int, analysis : Pango::Analysis, glyphs : Pango::GlyphString)
    LibPango.shape(text.to_unsafe, Int32.new(length), analysis.to_unsafe.as(LibPango::Analysis*), glyphs.to_unsafe.as(LibPango::GlyphString*))
    nil
  end

  def self.shape_full(item_text : ::String, item_length : ::Int, paragraph_text : ::String?, paragraph_length : ::Int, analysis : Pango::Analysis, glyphs : Pango::GlyphString)
    LibPango.shape_full(item_text.to_unsafe, Int32.new(item_length), paragraph_text ? paragraph_text.to_unsafe : Pointer(UInt8).null, Int32.new(paragraph_length), analysis.to_unsafe.as(LibPango::Analysis*), glyphs.to_unsafe.as(LibPango::GlyphString*))
    nil
  end

  def self.shape_with_flags(item_text : ::String, item_length : ::Int, paragraph_text : ::String?, paragraph_length : ::Int, analysis : Pango::Analysis, glyphs : Pango::GlyphString, flags : Pango::ShapeFlags)
    LibPango.shape_with_flags(item_text.to_unsafe, Int32.new(item_length), paragraph_text ? paragraph_text.to_unsafe : Pointer(UInt8).null, Int32.new(paragraph_length), analysis.to_unsafe.as(LibPango::Analysis*), glyphs.to_unsafe.as(LibPango::GlyphString*), flags)
    nil
  end

  def self.skip_space(pos : ::String)
    __var0 = LibPango.skip_space(pos)
    (__var0 == 1)
  end

  def self.split_file_list(str : ::String)
    __var0 = LibPango.split_file_list(str.to_unsafe)
    GObject.raise_unexpected_null("pango_split_file_list") if __var0.null?
    GObject::PointerIterator.new(__var0) { |__var1|
      ::String.new(__var1)
    }
  end

  def self.tailor_break(text : ::String, length : ::Int, analysis : Pango::Analysis, offset : ::Int, log_attrs : ::Enumerable)
    log_attrs_len = log_attrs.size
    LibPango.tailor_break(text.to_unsafe, Int32.new(length), analysis.to_unsafe.as(LibPango::Analysis*), Int32.new(offset), (__log_attrs_ary = log_attrs.map { |__item| __item }.to_a).to_unsafe, Int32.new(log_attrs_len))
    nil
  end

  def self.trim_string(str : ::String)
    __var0 = LibPango.trim_string(str.to_unsafe)
    GObject.raise_unexpected_null("pango_trim_string") if __var0.null?
    ::String.new(__var0)
  end

  def self.unichar_direction(ch : UInt8)
    __var0 = LibPango.unichar_direction(UInt8.new(ch))
    Pango::Direction.new(__var0)
  end

  def self.units_from_double(d : ::Float)
    __var0 = LibPango.units_from_double(Float64.new(d))
    __var0
  end

  def self.units_to_double(i : ::Int)
    __var0 = LibPango.units_to_double(Int32.new(i))
    __var0
  end

  def self.version
    __var0 = LibPango.version
    __var0
  end

  def self.version_check(required_major : ::Int, required_minor : ::Int, required_micro : ::Int)
    __var0 = LibPango.version_check(Int32.new(required_major), Int32.new(required_minor), Int32.new(required_micro))
    __var1 = ::String.new(__var0) if __var0
    __var1
  end

  def self.version_string
    __var0 = LibPango.version_string
    GObject.raise_unexpected_null("pango_version_string") if __var0.null?
    ::String.new(__var0)
  end

  enum Alignment : UInt32
    LEFT   = 0
    CENTER = 1
    RIGHT  = 2
  end

  class Analysis
    include GObject::WrappedType

    def self.new(shape_engine : Pango::EngineShape? = nil, lang_engine : Pango::EngineLang? = nil, font : Pango::Font? = nil, level : UInt8? = nil, gravity : UInt8? = nil, flags : UInt8? = nil, script : UInt8? = nil, language : Pango::Language? = nil, extra_attrs : Void*? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(48u64, 0u8).as(LibPango::Analysis*))
      __var0.shape_engine = shape_engine unless shape_engine.nil?
      __var0.lang_engine = lang_engine unless lang_engine.nil?
      __var0.font = font unless font.nil?
      __var0.level = level unless level.nil?
      __var0.gravity = gravity unless gravity.nil?
      __var0.flags = flags unless flags.nil?
      __var0.script = script unless script.nil?
      __var0.language = language unless language.nil?
      __var0.extra_attrs = extra_attrs unless extra_attrs.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::Analysis*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::Analysis*)
    end

    def to_unsafe_analysis
      @pointer.not_nil!.as(LibPango::Analysis*)
    end

    def shape_engine
      Pango::EngineShape.new(to_unsafe.as(LibPango::Analysis*).value.shape_engine)
    end

    def shape_engine=(value : Pango::EngineShape)
      to_unsafe.as(LibPango::Analysis*).value.shape_engine = value.to_unsafe_engineshape
    end

    def lang_engine
      Pango::EngineLang.new(to_unsafe.as(LibPango::Analysis*).value.lang_engine)
    end

    def lang_engine=(value : Pango::EngineLang)
      to_unsafe.as(LibPango::Analysis*).value.lang_engine = value.to_unsafe_enginelang
    end

    def font
      Pango::Font.new(to_unsafe.as(LibPango::Analysis*).value.font)
    end

    def font=(value : Pango::Font)
      to_unsafe.as(LibPango::Analysis*).value.font = value.to_unsafe_font
    end

    def level
      to_unsafe.as(LibPango::Analysis*).value.level
    end

    def level=(value : UInt8)
      to_unsafe.as(LibPango::Analysis*).value.level = UInt8.new(value)
    end

    def gravity
      to_unsafe.as(LibPango::Analysis*).value.gravity
    end

    def gravity=(value : UInt8)
      to_unsafe.as(LibPango::Analysis*).value.gravity = UInt8.new(value)
    end

    def flags
      to_unsafe.as(LibPango::Analysis*).value.flags
    end

    def flags=(value : UInt8)
      to_unsafe.as(LibPango::Analysis*).value.flags = UInt8.new(value)
    end

    def script
      to_unsafe.as(LibPango::Analysis*).value.script
    end

    def script=(value : UInt8)
      to_unsafe.as(LibPango::Analysis*).value.script = UInt8.new(value)
    end

    def language
      Pango::Language.new(to_unsafe.as(LibPango::Analysis*).value.language)
    end

    def language=(value : Pango::Language)
      to_unsafe.as(LibPango::Analysis*).value.language = value.to_unsafe.as(LibPango::Language*)
    end

    def extra_attrs
      GLib::SListIterator(Void*, Pointer(Void)*).new(GLib::SList.new(to_unsafe.as(LibPango::Analysis*).value.extra_attrs.as(LibGLib::SList*)))
    end

    def extra_attrs=(value : Void*)
      to_unsafe.as(LibPango::Analysis*).value.extra_attrs = value
    end
  end

  class AttrClass
    include GObject::WrappedType

    def self.new(type : Pango::AttrType? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(32u64, 0u8).as(LibPango::AttrClass*))
      __var0.type = type unless type.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::AttrClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::AttrClass*)
    end

    def to_unsafe_attrclass
      @pointer.not_nil!.as(LibPango::AttrClass*)
    end

    def type
      Pango::AttrType.new(to_unsafe.as(LibPango::AttrClass*).value.type)
    end

    def type=(value : Pango::AttrType)
      to_unsafe.as(LibPango::AttrClass*).value.type = value
    end

    def copy
      to_unsafe.as(LibPango::AttrClass*).value.copy
    end

    def destroy
      to_unsafe.as(LibPango::AttrClass*).value.destroy
    end

    def equal
      to_unsafe.as(LibPango::AttrClass*).value.equal
    end
  end

  class AttrColor
    include GObject::WrappedType

    def self.new(attr : Pango::Attribute? = nil, color : Pango::Color? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibPango::AttrColor*))
      __var0.attr = attr unless attr.nil?
      __var0.color = color unless color.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::AttrColor*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::AttrColor*)
    end

    def to_unsafe_attrcolor
      @pointer.not_nil!.as(LibPango::AttrColor*)
    end

    def attr
      Pango::Attribute.new(to_unsafe.as(LibPango::AttrColor*).value.attr)
    end

    def attr=(value : Pango::Attribute)
      to_unsafe.as(LibPango::AttrColor*).value.attr = value
    end

    def color
      Pango::Color.new(to_unsafe.as(LibPango::AttrColor*).value.color)
    end

    def color=(value : Pango::Color)
      to_unsafe.as(LibPango::AttrColor*).value.color = value
    end
  end

  alias AttrDataCopyFunc = LibPango::AttrDataCopyFunc
  alias AttrFilterFunc = LibPango::AttrFilterFunc

  class AttrFloat
    include GObject::WrappedType

    def self.new(attr : Pango::Attribute? = nil, value : Float64? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibPango::AttrFloat*))
      __var0.attr = attr unless attr.nil?
      __var0.value = value unless value.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::AttrFloat*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::AttrFloat*)
    end

    def to_unsafe_attrfloat
      @pointer.not_nil!.as(LibPango::AttrFloat*)
    end

    def attr
      Pango::Attribute.new(to_unsafe.as(LibPango::AttrFloat*).value.attr)
    end

    def attr=(value : Pango::Attribute)
      to_unsafe.as(LibPango::AttrFloat*).value.attr = value
    end

    def value
      to_unsafe.as(LibPango::AttrFloat*).value.value
    end

    def value=(value : Float64)
      to_unsafe.as(LibPango::AttrFloat*).value.value = Float64.new(value)
    end
  end

  class AttrFontDesc
    include GObject::WrappedType

    def self.new(attr : Pango::Attribute? = nil, desc : Pango::FontDescription? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibPango::AttrFontDesc*))
      __var0.attr = attr unless attr.nil?
      __var0.desc = desc unless desc.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::AttrFontDesc*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::AttrFontDesc*)
    end

    def to_unsafe_attrfontdesc
      @pointer.not_nil!.as(LibPango::AttrFontDesc*)
    end

    def self.new(desc : Pango::FontDescription)
      __var0 = LibPango.attr_font_desc_new(desc.to_unsafe.as(LibPango::FontDescription*))
      GObject.raise_unexpected_null("pango_attr_font_desc_new") if __var0.null?
      Pango::Attribute.new(__var0)
    end

    def attr
      Pango::Attribute.new(to_unsafe.as(LibPango::AttrFontDesc*).value.attr)
    end

    def attr=(value : Pango::Attribute)
      to_unsafe.as(LibPango::AttrFontDesc*).value.attr = value
    end

    def desc
      Pango::FontDescription.new(to_unsafe.as(LibPango::AttrFontDesc*).value.desc)
    end

    def desc=(value : Pango::FontDescription)
      to_unsafe.as(LibPango::AttrFontDesc*).value.desc = value.to_unsafe.as(LibPango::FontDescription*)
    end
  end

  class AttrFontFeatures
    include GObject::WrappedType

    def self.new(attr : Pango::Attribute? = nil, features : ::String? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibPango::AttrFontFeatures*))
      __var0.attr = attr unless attr.nil?
      __var0.features = features unless features.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::AttrFontFeatures*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::AttrFontFeatures*)
    end

    def to_unsafe_attrfontfeatures
      @pointer.not_nil!.as(LibPango::AttrFontFeatures*)
    end

    def self.new(features : ::String)
      __var0 = LibPango.attr_font_features_new(features.to_unsafe)
      GObject.raise_unexpected_null("pango_attr_font_features_new") if __var0.null?
      Pango::Attribute.new(__var0)
    end

    def attr
      Pango::Attribute.new(to_unsafe.as(LibPango::AttrFontFeatures*).value.attr)
    end

    def attr=(value : Pango::Attribute)
      to_unsafe.as(LibPango::AttrFontFeatures*).value.attr = value
    end

    def features
      ::String.new(to_unsafe.as(LibPango::AttrFontFeatures*).value.features)
    end

    def features=(value : ::String)
      to_unsafe.as(LibPango::AttrFontFeatures*).value.features = value.to_unsafe
    end
  end

  class AttrInt
    include GObject::WrappedType

    def self.new(attr : Pango::Attribute? = nil, value : Int32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibPango::AttrInt*))
      __var0.attr = attr unless attr.nil?
      __var0.value = value unless value.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::AttrInt*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::AttrInt*)
    end

    def to_unsafe_attrint
      @pointer.not_nil!.as(LibPango::AttrInt*)
    end

    def attr
      Pango::Attribute.new(to_unsafe.as(LibPango::AttrInt*).value.attr)
    end

    def attr=(value : Pango::Attribute)
      to_unsafe.as(LibPango::AttrInt*).value.attr = value
    end

    def value
      to_unsafe.as(LibPango::AttrInt*).value.value
    end

    def value=(value : Int32)
      to_unsafe.as(LibPango::AttrInt*).value.value = Int32.new(value)
    end
  end

  class AttrIterator
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibPango::AttrIterator*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::AttrIterator*)
    end

    def to_unsafe_attriterator
      @pointer.not_nil!.as(LibPango::AttrIterator*)
    end

    def copy
      __var0 = LibPango.attr_iterator_copy(@pointer.as(LibPango::AttrIterator*))
      GObject.raise_unexpected_null("pango_attr_iterator_copy") if __var0.null?
      Pango::AttrIterator.new(__var0)
    end

    def destroy
      LibPango.attr_iterator_destroy(@pointer.as(LibPango::AttrIterator*))
      nil
    end

    def get(type : Pango::AttrType)
      __var0 = LibPango.attr_iterator_get(@pointer.as(LibPango::AttrIterator*), type)
      __var1 = Pango::Attribute.new(__var0) if __var0
      __var1
    end

    def attrs
      __var0 = LibPango.attr_iterator_get_attrs(@pointer.as(LibPango::AttrIterator*))
      GObject.raise_unexpected_null("pango_attr_iterator_get_attrs") if __var0.null?
      GLib::SListIterator(Pango::Attribute, LibPango::Attribute*).new(GLib::SList.new(__var0.as(LibGLib::SList*)))
    end

    def font(desc : Pango::FontDescription, language : Pango::Language?, extra_attrs : Void*?)
      LibPango.attr_iterator_get_font(@pointer.as(LibPango::AttrIterator*), desc.to_unsafe.as(LibPango::FontDescription*), language ? language.to_unsafe.as(LibPango::Language*) : Pointer(LibPango::Language).null, extra_attrs ? extra_attrs : Pointer(Void*).null)
      nil
    end

    def next
      __var0 = LibPango.attr_iterator_next(@pointer.as(LibPango::AttrIterator*))
      (__var0 == 1)
    end

    def range
      LibPango.attr_iterator_range(@pointer.as(LibPango::AttrIterator*), out start, out _end)
      {start, _end}
    end
  end

  class AttrLanguage
    include GObject::WrappedType

    def self.new(attr : Pango::Attribute? = nil, value : Pango::Language? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibPango::AttrLanguage*))
      __var0.attr = attr unless attr.nil?
      __var0.value = value unless value.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::AttrLanguage*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::AttrLanguage*)
    end

    def to_unsafe_attrlanguage
      @pointer.not_nil!.as(LibPango::AttrLanguage*)
    end

    def self.new(language : Pango::Language)
      __var0 = LibPango.attr_language_new(language.to_unsafe.as(LibPango::Language*))
      GObject.raise_unexpected_null("pango_attr_language_new") if __var0.null?
      Pango::Attribute.new(__var0)
    end

    def attr
      Pango::Attribute.new(to_unsafe.as(LibPango::AttrLanguage*).value.attr)
    end

    def attr=(value : Pango::Attribute)
      to_unsafe.as(LibPango::AttrLanguage*).value.attr = value
    end

    def value
      Pango::Language.new(to_unsafe.as(LibPango::AttrLanguage*).value.value)
    end

    def value=(value : Pango::Language)
      to_unsafe.as(LibPango::AttrLanguage*).value.value = value.to_unsafe.as(LibPango::Language*)
    end
  end

  class AttrList
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibPango::AttrList*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::AttrList*)
    end

    def to_unsafe_attrlist
      @pointer.not_nil!.as(LibPango::AttrList*)
    end

    def self.new : self
      __var0 = LibPango.attr_list_new
      GObject.raise_unexpected_null("pango_attr_list_new") if __var0.null?
      cast(Pango::AttrList.new(__var0))
    end

    def change(attr : Pango::Attribute)
      LibPango.attr_list_change(@pointer.as(LibPango::AttrList*), attr.to_unsafe.as(LibPango::Attribute*))
      nil
    end

    def copy
      __var0 = LibPango.attr_list_copy(@pointer.as(LibPango::AttrList*))
      __var1 = Pango::AttrList.new(__var0) if __var0
      __var1
    end

    def filter(func : Pango::AttrFilterFunc, data : Void*?)
      __var0 = LibPango.attr_list_filter(@pointer.as(LibPango::AttrList*), func, data ? data : Pointer(Void).null)
      __var1 = Pango::AttrList.new(__var0) if __var0
      __var1
    end

    def attributes
      __var0 = LibPango.attr_list_get_attributes(@pointer.as(LibPango::AttrList*))
      GObject.raise_unexpected_null("pango_attr_list_get_attributes") if __var0.null?
      GLib::SListIterator(Pango::Attribute, LibPango::Attribute*).new(GLib::SList.new(__var0.as(LibGLib::SList*)))
    end

    def iterator
      __var0 = LibPango.attr_list_get_iterator(@pointer.as(LibPango::AttrList*))
      GObject.raise_unexpected_null("pango_attr_list_get_iterator") if __var0.null?
      Pango::AttrIterator.new(__var0)
    end

    def insert(attr : Pango::Attribute)
      LibPango.attr_list_insert(@pointer.as(LibPango::AttrList*), attr.to_unsafe.as(LibPango::Attribute*))
      nil
    end

    def insert_before(attr : Pango::Attribute)
      LibPango.attr_list_insert_before(@pointer.as(LibPango::AttrList*), attr.to_unsafe.as(LibPango::Attribute*))
      nil
    end

    def ref
      __var0 = LibPango.attr_list_ref(@pointer.as(LibPango::AttrList*))
      GObject.raise_unexpected_null("pango_attr_list_ref") if __var0.null?
      Pango::AttrList.new(__var0)
    end

    def splice(other : Pango::AttrList, pos : ::Int, len : ::Int)
      LibPango.attr_list_splice(@pointer.as(LibPango::AttrList*), other.to_unsafe.as(LibPango::AttrList*), Int32.new(pos), Int32.new(len))
      nil
    end

    def unref
      LibPango.attr_list_unref(@pointer.as(LibPango::AttrList*))
      nil
    end

    def update(pos : ::Int, remove : ::Int, add : ::Int)
      LibPango.attr_list_update(@pointer.as(LibPango::AttrList*), Int32.new(pos), Int32.new(remove), Int32.new(add))
      nil
    end
  end

  class AttrShape
    include GObject::WrappedType

    def self.new(attr : Pango::Attribute? = nil, ink_rect : Pango::Rectangle? = nil, logical_rect : Pango::Rectangle? = nil, data : Void*? = nil, copy_func : Pango::AttrDataCopyFunc? = nil, destroy_func : GLib::DestroyNotify? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(72u64, 0u8).as(LibPango::AttrShape*))
      __var0.attr = attr unless attr.nil?
      __var0.ink_rect = ink_rect unless ink_rect.nil?
      __var0.logical_rect = logical_rect unless logical_rect.nil?
      __var0.data = data unless data.nil?
      __var0.copy_func = copy_func unless copy_func.nil?
      __var0.destroy_func = destroy_func unless destroy_func.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::AttrShape*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::AttrShape*)
    end

    def to_unsafe_attrshape
      @pointer.not_nil!.as(LibPango::AttrShape*)
    end

    def self.new(ink_rect : Pango::Rectangle, logical_rect : Pango::Rectangle)
      __var0 = LibPango.attr_shape_new(ink_rect.to_unsafe.as(LibPango::Rectangle*), logical_rect.to_unsafe.as(LibPango::Rectangle*))
      GObject.raise_unexpected_null("pango_attr_shape_new") if __var0.null?
      Pango::Attribute.new(__var0)
    end

    def self.new_with_data(ink_rect : Pango::Rectangle, logical_rect : Pango::Rectangle, data : Void*?, copy_func : Pango::AttrDataCopyFunc?, destroy_func : GLib::DestroyNotify?)
      __var0 = LibPango.attr_shape_new_with_data(ink_rect.to_unsafe.as(LibPango::Rectangle*), logical_rect.to_unsafe.as(LibPango::Rectangle*), data ? data : Pointer(Void).null, copy_func ? copy_func : nil, destroy_func ? destroy_func : nil)
      GObject.raise_unexpected_null("pango_attr_shape_new_with_data") if __var0.null?
      Pango::Attribute.new(__var0)
    end

    def attr
      Pango::Attribute.new(to_unsafe.as(LibPango::AttrShape*).value.attr)
    end

    def attr=(value : Pango::Attribute)
      to_unsafe.as(LibPango::AttrShape*).value.attr = value
    end

    def ink_rect
      Pango::Rectangle.new(to_unsafe.as(LibPango::AttrShape*).value.ink_rect)
    end

    def ink_rect=(value : Pango::Rectangle)
      to_unsafe.as(LibPango::AttrShape*).value.ink_rect = value
    end

    def logical_rect
      Pango::Rectangle.new(to_unsafe.as(LibPango::AttrShape*).value.logical_rect)
    end

    def logical_rect=(value : Pango::Rectangle)
      to_unsafe.as(LibPango::AttrShape*).value.logical_rect = value
    end

    def data
      to_unsafe.as(LibPango::AttrShape*).value.data
    end

    def data=(value : Void*)
      to_unsafe.as(LibPango::AttrShape*).value.data = value
    end

    def copy_func
      to_unsafe.as(LibPango::AttrShape*).value.copy_func
    end

    def copy_func=(value : Pango::AttrDataCopyFunc)
      to_unsafe.as(LibPango::AttrShape*).value.copy_func = value
    end

    def destroy_func
      to_unsafe.as(LibPango::AttrShape*).value.destroy_func
    end

    def destroy_func=(value : GLib::DestroyNotify)
      to_unsafe.as(LibPango::AttrShape*).value.destroy_func = value
    end
  end

  class AttrSize
    include GObject::WrappedType

    def self.new(attr : Pango::Attribute? = nil, size : Int32? = nil, absolute : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibPango::AttrSize*))
      __var0.attr = attr unless attr.nil?
      __var0.size = size unless size.nil?
      __var0.absolute = absolute unless absolute.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::AttrSize*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::AttrSize*)
    end

    def to_unsafe_attrsize
      @pointer.not_nil!.as(LibPango::AttrSize*)
    end

    def self.new(size : ::Int)
      __var0 = LibPango.attr_size_new(Int32.new(size))
      GObject.raise_unexpected_null("pango_attr_size_new") if __var0.null?
      Pango::Attribute.new(__var0)
    end

    def self.new_absolute(size : ::Int)
      __var0 = LibPango.attr_size_new_absolute(Int32.new(size))
      GObject.raise_unexpected_null("pango_attr_size_new_absolute") if __var0.null?
      Pango::Attribute.new(__var0)
    end

    def attr
      Pango::Attribute.new(to_unsafe.as(LibPango::AttrSize*).value.attr)
    end

    def attr=(value : Pango::Attribute)
      to_unsafe.as(LibPango::AttrSize*).value.attr = value
    end

    def size
      to_unsafe.as(LibPango::AttrSize*).value.size
    end

    def size=(value : Int32)
      to_unsafe.as(LibPango::AttrSize*).value.size = Int32.new(value)
    end

    def absolute
      to_unsafe.as(LibPango::AttrSize*).value.absolute
    end

    def absolute=(value : UInt32)
      to_unsafe.as(LibPango::AttrSize*).value.absolute = UInt32.new(value)
    end
  end

  class AttrString
    include GObject::WrappedType

    def self.new(attr : Pango::Attribute? = nil, value : ::String? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibPango::AttrString*))
      __var0.attr = attr unless attr.nil?
      __var0.value = value unless value.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::AttrString*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::AttrString*)
    end

    def to_unsafe_attrstring
      @pointer.not_nil!.as(LibPango::AttrString*)
    end

    def attr
      Pango::Attribute.new(to_unsafe.as(LibPango::AttrString*).value.attr)
    end

    def attr=(value : Pango::Attribute)
      to_unsafe.as(LibPango::AttrString*).value.attr = value
    end

    def value
      ::String.new(to_unsafe.as(LibPango::AttrString*).value.value)
    end

    def value=(value : ::String)
      to_unsafe.as(LibPango::AttrString*).value.value = value.to_unsafe
    end
  end

  enum AttrType : UInt32
    INVALID             =  0
    LANGUAGE            =  1
    FAMILY              =  2
    STYLE               =  3
    WEIGHT              =  4
    VARIANT             =  5
    STRETCH             =  6
    SIZE                =  7
    FONT_DESC           =  8
    FOREGROUND          =  9
    BACKGROUND          = 10
    UNDERLINE           = 11
    STRIKETHROUGH       = 12
    RISE                = 13
    SHAPE               = 14
    SCALE               = 15
    FALLBACK            = 16
    LETTER_SPACING      = 17
    UNDERLINE_COLOR     = 18
    STRIKETHROUGH_COLOR = 19
    ABSOLUTE_SIZE       = 20
    GRAVITY             = 21
    GRAVITY_HINT        = 22
    FONT_FEATURES       = 23
    FOREGROUND_ALPHA    = 24
    BACKGROUND_ALPHA    = 25
    ALLOW_BREAKS        = 26
    SHOW                = 27
    INSERT_HYPHENS      = 28
  end

  # Function get_name
  # Function register

  class Attribute
    include GObject::WrappedType

    def self.new(klass : Pango::AttrClass? = nil, start_index : UInt32? = nil, end_index : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibPango::Attribute*))
      __var0.klass = klass unless klass.nil?
      __var0.start_index = start_index unless start_index.nil?
      __var0.end_index = end_index unless end_index.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::Attribute*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::Attribute*)
    end

    def to_unsafe_attribute
      @pointer.not_nil!.as(LibPango::Attribute*)
    end

    def copy
      __var0 = LibPango.attribute_copy(@pointer.as(LibPango::Attribute*))
      GObject.raise_unexpected_null("pango_attribute_copy") if __var0.null?
      Pango::Attribute.new(__var0)
    end

    def destroy
      LibPango.attribute_destroy(@pointer.as(LibPango::Attribute*))
      nil
    end

    def equal(attr2 : Pango::Attribute)
      __var0 = LibPango.attribute_equal(@pointer.as(LibPango::Attribute*), attr2.to_unsafe.as(LibPango::Attribute*))
      (__var0 == 1)
    end

    def init(klass : Pango::AttrClass)
      LibPango.attribute_init(@pointer.as(LibPango::Attribute*), klass.to_unsafe.as(LibPango::AttrClass*))
      nil
    end

    def klass
      Pango::AttrClass.new(to_unsafe.as(LibPango::Attribute*).value.klass)
    end

    def klass=(value : Pango::AttrClass)
      to_unsafe.as(LibPango::Attribute*).value.klass = value.to_unsafe.as(LibPango::AttrClass*)
    end

    def start_index
      to_unsafe.as(LibPango::Attribute*).value.start_index
    end

    def start_index=(value : UInt32)
      to_unsafe.as(LibPango::Attribute*).value.start_index = UInt32.new(value)
    end

    def end_index
      to_unsafe.as(LibPango::Attribute*).value.end_index
    end

    def end_index=(value : UInt32)
      to_unsafe.as(LibPango::Attribute*).value.end_index = UInt32.new(value)
    end
  end

  enum BidiType : UInt32
    L   =  0
    LRE =  1
    LRO =  2
    R   =  3
    AL  =  4
    RLE =  5
    RLO =  6
    PDF =  7
    EN  =  8
    ES  =  9
    ET  = 10
    AN  = 11
    CS  = 12
    NSM = 13
    BN  = 14
    B   = 15
    S   = 16
    WS  = 17
    ON  = 18
  end

  # Function for_unichar

  class Color
    include GObject::WrappedType

    def self.new(red : UInt16? = nil, green : UInt16? = nil, blue : UInt16? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(6u64, 0u8).as(LibPango::Color*))
      __var0.red = red unless red.nil?
      __var0.green = green unless green.nil?
      __var0.blue = blue unless blue.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::Color*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::Color*)
    end

    def to_unsafe_color
      @pointer.not_nil!.as(LibPango::Color*)
    end

    def copy
      __var0 = LibPango.color_copy(@pointer.as(LibPango::Color*))
      __var1 = Pango::Color.new(__var0) if __var0
      __var1
    end

    def free
      LibPango.color_free(@pointer.as(LibPango::Color*))
      nil
    end

    def parse(spec : ::String)
      __var0 = LibPango.color_parse(@pointer.as(LibPango::Color*), spec.to_unsafe)
      (__var0 == 1)
    end

    def to_string
      __var0 = LibPango.color_to_string(@pointer.as(LibPango::Color*))
      GObject.raise_unexpected_null("pango_color_to_string") if __var0.null?
      ::String.new(__var0)
    end

    def red
      to_unsafe.as(LibPango::Color*).value.red
    end

    def red=(value : UInt16)
      to_unsafe.as(LibPango::Color*).value.red = UInt16.new(value)
    end

    def green
      to_unsafe.as(LibPango::Color*).value.green
    end

    def green=(value : UInt16)
      to_unsafe.as(LibPango::Color*).value.green = UInt16.new(value)
    end

    def blue
      to_unsafe.as(LibPango::Color*).value.blue
    end

    def blue=(value : UInt16)
      to_unsafe.as(LibPango::Color*).value.blue = UInt16.new(value)
    end
  end

  class Context < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibPango::Context*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a PangoContext")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibPango._pango_context_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::Context*)
    end

    def to_unsafe_context
      @pointer.not_nil!.as(LibPango::Context*)
    end

    def self.new : self
      __var0 = LibPango.context_new
      GObject.raise_unexpected_null("pango_context_new") if __var0.null?
      cast(Pango::Context.new(__var0))
    end

    def changed
      LibPango.context_changed(@pointer.as(LibPango::Context*))
      nil
    end

    def base_dir
      __var0 = LibPango.context_get_base_dir(@pointer.as(LibPango::Context*))
      Pango::Direction.new(__var0)
    end

    def base_gravity
      __var0 = LibPango.context_get_base_gravity(@pointer.as(LibPango::Context*))
      Pango::Gravity.new(__var0)
    end

    def font_description
      __var0 = LibPango.context_get_font_description(@pointer.as(LibPango::Context*))
      GObject.raise_unexpected_null("pango_context_get_font_description") if __var0.null?
      Pango::FontDescription.new(__var0)
    end

    def font_map
      __var0 = LibPango.context_get_font_map(@pointer.as(LibPango::Context*))
      GObject.raise_unexpected_null("pango_context_get_font_map") if __var0.null?
      Pango::FontMap.new(__var0)
    end

    def gravity
      __var0 = LibPango.context_get_gravity(@pointer.as(LibPango::Context*))
      Pango::Gravity.new(__var0)
    end

    def gravity_hint
      __var0 = LibPango.context_get_gravity_hint(@pointer.as(LibPango::Context*))
      Pango::GravityHint.new(__var0)
    end

    def language
      __var0 = LibPango.context_get_language(@pointer.as(LibPango::Context*))
      GObject.raise_unexpected_null("pango_context_get_language") if __var0.null?
      Pango::Language.new(__var0)
    end

    def matrix
      __var0 = LibPango.context_get_matrix(@pointer.as(LibPango::Context*))
      __var1 = Pango::Matrix.new(__var0) if __var0
      __var1
    end

    def metrics(desc : Pango::FontDescription?, language : Pango::Language?)
      __var0 = LibPango.context_get_metrics(@pointer.as(LibPango::Context*), desc ? desc.to_unsafe.as(LibPango::FontDescription*) : Pointer(LibPango::FontDescription).null, language ? language.to_unsafe.as(LibPango::Language*) : Pointer(LibPango::Language).null)
      GObject.raise_unexpected_null("pango_context_get_metrics") if __var0.null?
      Pango::FontMetrics.new(__var0)
    end

    def round_glyph_positions
      __var0 = LibPango.context_get_round_glyph_positions(@pointer.as(LibPango::Context*))
      (__var0 == 1)
    end

    def serial
      __var0 = LibPango.context_get_serial(@pointer.as(LibPango::Context*))
      __var0
    end

    def list_families(families : ::Enumerable)
      LibPango.context_list_families(@pointer.as(LibPango::Context*), families, out n_families)
      n_families
    end

    def load_font(desc : Pango::FontDescription)
      __var0 = LibPango.context_load_font(@pointer.as(LibPango::Context*), desc.to_unsafe.as(LibPango::FontDescription*))
      __var1 = Pango::Font.new(__var0) if __var0
      __var1
    end

    def load_fontset(desc : Pango::FontDescription, language : Pango::Language)
      __var0 = LibPango.context_load_fontset(@pointer.as(LibPango::Context*), desc.to_unsafe.as(LibPango::FontDescription*), language.to_unsafe.as(LibPango::Language*))
      __var1 = Pango::Fontset.new(__var0) if __var0
      __var1
    end

    def base_dir=(direction : Pango::Direction)
      LibPango.context_set_base_dir(@pointer.as(LibPango::Context*), direction)
      nil
    end

    def base_gravity=(gravity : Pango::Gravity)
      LibPango.context_set_base_gravity(@pointer.as(LibPango::Context*), gravity)
      nil
    end

    def font_description=(desc : Pango::FontDescription)
      LibPango.context_set_font_description(@pointer.as(LibPango::Context*), desc.to_unsafe.as(LibPango::FontDescription*))
      nil
    end

    def font_map=(font_map : Pango::FontMap)
      LibPango.context_set_font_map(@pointer.as(LibPango::Context*), font_map.to_unsafe_fontmap)
      nil
    end

    def gravity_hint=(hint : Pango::GravityHint)
      LibPango.context_set_gravity_hint(@pointer.as(LibPango::Context*), hint)
      nil
    end

    def language=(language : Pango::Language)
      LibPango.context_set_language(@pointer.as(LibPango::Context*), language.to_unsafe.as(LibPango::Language*))
      nil
    end

    def matrix=(matrix : Pango::Matrix?)
      LibPango.context_set_matrix(@pointer.as(LibPango::Context*), matrix ? matrix.to_unsafe.as(LibPango::Matrix*) : Pointer(LibPango::Matrix).null)
      nil
    end

    def round_glyph_positions=(round_positions : ::Bool)
      LibPango.context_set_round_glyph_positions(@pointer.as(LibPango::Context*), LibC::Int.new(round_positions ? 1 : 0))
      nil
    end
  end

  class ContextClass
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibPango::ContextClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::ContextClass*)
    end

    def to_unsafe_contextclass
      @pointer.not_nil!.as(LibPango::ContextClass*)
    end
  end

  class Coverage < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibPango::Coverage*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a PangoCoverage")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibPango._pango_coverage_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::Coverage*)
    end

    def to_unsafe_coverage
      @pointer.not_nil!.as(LibPango::Coverage*)
    end

    def self.new : self
      __var0 = LibPango.coverage_new
      GObject.raise_unexpected_null("pango_coverage_new") if __var0.null?
      cast(Pango::Coverage.new(__var0))
    end

    def self.from_bytes(bytes : ::Bytes)
      n_bytes = bytes.size
      __bytes = bytes.to_unsafe
      n_bytes = __bytes_ary.size
      __var0 = LibPango.coverage_from_bytes(__bytes, Int32.new(n_bytes))
      __var1 = Pango::Coverage.new(__var0) if __var0
      __var1
    end

    def copy
      __var0 = LibPango.coverage_copy(@pointer.as(LibPango::Coverage*))
      GObject.raise_unexpected_null("pango_coverage_copy") if __var0.null?
      Pango::Coverage.new(__var0)
    end

    def get(index_ : ::Int)
      __var0 = LibPango.coverage_get(@pointer.as(LibPango::Coverage*), Int32.new(index_))
      Pango::CoverageLevel.new(__var0)
    end

    def max(other : Pango::Coverage)
      LibPango.coverage_max(@pointer.as(LibPango::Coverage*), other.to_unsafe_coverage)
      nil
    end

    def ref
      __var0 = LibPango.coverage_ref(@pointer.as(LibPango::Coverage*))
      GObject.raise_unexpected_null("pango_coverage_ref") if __var0.null?
      Pango::Coverage.new(__var0)
    end

    def set(index_ : ::Int, level : Pango::CoverageLevel)
      LibPango.coverage_set(@pointer.as(LibPango::Coverage*), Int32.new(index_), level)
      nil
    end

    def to_bytes(bytes : ::Bytes)
      LibPango.coverage_to_bytes(@pointer.as(LibPango::Coverage*), bytes, out n_bytes)
      n_bytes
    end

    def unref
      LibPango.coverage_unref(@pointer.as(LibPango::Coverage*))
      nil
    end
  end

  enum CoverageLevel : UInt32
    NONE        = 0
    FALLBACK    = 1
    APPROXIMATE = 2
    EXACT       = 3
  end

  enum Direction : UInt32
    LTR      = 0
    RTL      = 1
    TTB_LTR  = 2
    TTB_RTL  = 3
    WEAK_LTR = 4
    WEAK_RTL = 5
    NEUTRAL  = 6
  end

  enum EllipsizeMode : UInt32
    NONE   = 0
    START  = 1
    MIDDLE = 2
    END    = 3
  end

  class Engine < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibPango::Engine*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a PangoEngine")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibPango._pango_engine_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::Engine*)
    end

    def to_unsafe_engine
      @pointer.not_nil!.as(LibPango::Engine*)
    end
  end

  class EngineClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(136u64, 0u8).as(LibPango::EngineClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibPango::EngineClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::EngineClass*)
    end

    def to_unsafe_engineclass
      @pointer.not_nil!.as(LibPango::EngineClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibPango::EngineClass*).value.parent_class)
    end
  end

  class EngineInfo
    include GObject::WrappedType

    def self.new(id : ::String? = nil, engine_type : ::String? = nil, render_type : ::String? = nil, scripts : Pango::EngineScriptInfo? = nil, n_scripts : Int32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(40u64, 0u8).as(LibPango::EngineInfo*))
      __var0.id = id unless id.nil?
      __var0.engine_type = engine_type unless engine_type.nil?
      __var0.render_type = render_type unless render_type.nil?
      __var0.scripts = scripts unless scripts.nil?
      __var0.n_scripts = n_scripts unless n_scripts.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::EngineInfo*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::EngineInfo*)
    end

    def to_unsafe_engineinfo
      @pointer.not_nil!.as(LibPango::EngineInfo*)
    end

    def id
      ::String.new(to_unsafe.as(LibPango::EngineInfo*).value.id)
    end

    def id=(value : ::String)
      to_unsafe.as(LibPango::EngineInfo*).value.id = value.to_unsafe
    end

    def engine_type
      ::String.new(to_unsafe.as(LibPango::EngineInfo*).value.engine_type)
    end

    def engine_type=(value : ::String)
      to_unsafe.as(LibPango::EngineInfo*).value.engine_type = value.to_unsafe
    end

    def render_type
      ::String.new(to_unsafe.as(LibPango::EngineInfo*).value.render_type)
    end

    def render_type=(value : ::String)
      to_unsafe.as(LibPango::EngineInfo*).value.render_type = value.to_unsafe
    end

    def scripts
      Pango::EngineScriptInfo.new(to_unsafe.as(LibPango::EngineInfo*).value.scripts)
    end

    def scripts=(value : Pango::EngineScriptInfo)
      to_unsafe.as(LibPango::EngineInfo*).value.scripts = value.to_unsafe.as(LibPango::EngineScriptInfo*)
    end

    def n_scripts
      to_unsafe.as(LibPango::EngineInfo*).value.n_scripts
    end

    def n_scripts=(value : Int32)
      to_unsafe.as(LibPango::EngineInfo*).value.n_scripts = Int32.new(value)
    end
  end

  class EngineLang < Engine
    @pointer : Void*

    def initialize(pointer : LibPango::EngineLang*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a PangoEngineLang")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibPango._pango_engine_lang_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::EngineLang*)
    end

    def to_unsafe_enginelang
      @pointer.not_nil!.as(LibPango::EngineLang*)
    end
  end

  class EngineLangClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(144u64, 0u8).as(LibPango::EngineLangClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibPango::EngineLangClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::EngineLangClass*)
    end

    def to_unsafe_enginelangclass
      @pointer.not_nil!.as(LibPango::EngineLangClass*)
    end

    def parent_class
      Pango::EngineClass.new(to_unsafe.as(LibPango::EngineLangClass*).value.parent_class)
    end

    def script_break
      to_unsafe.as(LibPango::EngineLangClass*).value.script_break
    end
  end

  class EngineScriptInfo
    include GObject::WrappedType

    def self.new(script : Pango::Script? = nil, langs : ::String? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibPango::EngineScriptInfo*))
      __var0.script = script unless script.nil?
      __var0.langs = langs unless langs.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::EngineScriptInfo*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::EngineScriptInfo*)
    end

    def to_unsafe_enginescriptinfo
      @pointer.not_nil!.as(LibPango::EngineScriptInfo*)
    end

    def script
      Pango::Script.new(to_unsafe.as(LibPango::EngineScriptInfo*).value.script)
    end

    def script=(value : Pango::Script)
      to_unsafe.as(LibPango::EngineScriptInfo*).value.script = value
    end

    def langs
      ::String.new(to_unsafe.as(LibPango::EngineScriptInfo*).value.langs)
    end

    def langs=(value : ::String)
      to_unsafe.as(LibPango::EngineScriptInfo*).value.langs = value.to_unsafe
    end
  end

  class EngineShape < Engine
    @pointer : Void*

    def initialize(pointer : LibPango::EngineShape*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a PangoEngineShape")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibPango._pango_engine_shape_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::EngineShape*)
    end

    def to_unsafe_engineshape
      @pointer.not_nil!.as(LibPango::EngineShape*)
    end
  end

  class EngineShapeClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(152u64, 0u8).as(LibPango::EngineShapeClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibPango::EngineShapeClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::EngineShapeClass*)
    end

    def to_unsafe_engineshapeclass
      @pointer.not_nil!.as(LibPango::EngineShapeClass*)
    end

    def parent_class
      Pango::EngineClass.new(to_unsafe.as(LibPango::EngineShapeClass*).value.parent_class)
    end

    def script_shape
      to_unsafe.as(LibPango::EngineShapeClass*).value.script_shape
    end

    def covers
      to_unsafe.as(LibPango::EngineShapeClass*).value.covers
    end
  end

  class Font < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibPango::Font*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a PangoFont")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibPango._pango_font_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::Font*)
    end

    def to_unsafe_font
      @pointer.not_nil!.as(LibPango::Font*)
    end

    def self.descriptions_free(descs : ::Enumerable?)
      n_descs = descs ? descs.size : 0
      if descs
        __descs = descs ? (__descs_ary = descs.map { |__item| __item.to_unsafe.as(LibPango::FontDescription*) }.to_a).to_unsafe : Pointer(Pointer(LibPango::FontDescription)).null
        n_descs = __descs_ary.size
      else
        n_descs = 0
      end

      LibPango.font_descriptions_free(__descs, Int32.new(n_descs))
      nil
    end

    def describe
      __var0 = LibPango.font_describe(@pointer.as(LibPango::Font*))
      GObject.raise_unexpected_null("pango_font_describe") if __var0.null?
      Pango::FontDescription.new(__var0)
    end

    def describe_with_absolute_size
      __var0 = LibPango.font_describe_with_absolute_size(@pointer.as(LibPango::Font*))
      GObject.raise_unexpected_null("pango_font_describe_with_absolute_size") if __var0.null?
      Pango::FontDescription.new(__var0)
    end

    def find_shaper(language : Pango::Language, ch : ::Int)
      __var0 = LibPango.font_find_shaper(@pointer.as(LibPango::Font*), language.to_unsafe.as(LibPango::Language*), UInt32.new(ch))
      GObject.raise_unexpected_null("pango_font_find_shaper") if __var0.null?
      Pango::EngineShape.new(__var0)
    end

    def coverage(language : Pango::Language)
      __var0 = LibPango.font_get_coverage(@pointer.as(LibPango::Font*), language.to_unsafe.as(LibPango::Language*))
      GObject.raise_unexpected_null("pango_font_get_coverage") if __var0.null?
      Pango::Coverage.new(__var0)
    end

    def font_map
      __var0 = LibPango.font_get_font_map(@pointer.as(LibPango::Font*))
      __var1 = Pango::FontMap.new(__var0) if __var0
      __var1
    end

    def glyph_extents(glyph : ::Int, ink_rect : Pango::Rectangle?, logical_rect : Pango::Rectangle?)
      LibPango.font_get_glyph_extents(@pointer.as(LibPango::Font*), UInt32.new(glyph), ink_rect, logical_rect)
      nil
    end

    def metrics(language : Pango::Language?)
      __var0 = LibPango.font_get_metrics(@pointer.as(LibPango::Font*), language ? language.to_unsafe.as(LibPango::Language*) : Pointer(LibPango::Language).null)
      GObject.raise_unexpected_null("pango_font_get_metrics") if __var0.null?
      Pango::FontMetrics.new(__var0)
    end

    def has_char(wc : UInt8)
      __var0 = LibPango.font_has_char(@pointer.as(LibPango::Font*), UInt8.new(wc))
      (__var0 == 1)
    end
  end

  class FontClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(200u64, 0u8).as(LibPango::FontClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibPango::FontClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::FontClass*)
    end

    def to_unsafe_fontclass
      @pointer.not_nil!.as(LibPango::FontClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibPango::FontClass*).value.parent_class)
    end

    def describe
      to_unsafe.as(LibPango::FontClass*).value.describe
    end

    def get_coverage
      to_unsafe.as(LibPango::FontClass*).value.get_coverage
    end

    def get_glyph_extents
      to_unsafe.as(LibPango::FontClass*).value.get_glyph_extents
    end

    def get_metrics
      to_unsafe.as(LibPango::FontClass*).value.get_metrics
    end

    def get_font_map
      to_unsafe.as(LibPango::FontClass*).value.get_font_map
    end

    def describe_absolute
      to_unsafe.as(LibPango::FontClass*).value.describe_absolute
    end

    def get_features
      to_unsafe.as(LibPango::FontClass*).value.get_features
    end

    def create_hb_font
      to_unsafe.as(LibPango::FontClass*).value.create_hb_font
    end
  end

  class FontDescription
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibPango::FontDescription*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::FontDescription*)
    end

    def to_unsafe_fontdescription
      @pointer.not_nil!.as(LibPango::FontDescription*)
    end

    def self.new : self
      __var0 = LibPango.font_description_new
      GObject.raise_unexpected_null("pango_font_description_new") if __var0.null?
      cast(Pango::FontDescription.new(__var0))
    end

    def better_match(old_match : Pango::FontDescription?, new_match : Pango::FontDescription)
      __var0 = LibPango.font_description_better_match(@pointer.as(LibPango::FontDescription*), old_match ? old_match.to_unsafe.as(LibPango::FontDescription*) : Pointer(LibPango::FontDescription).null, new_match.to_unsafe.as(LibPango::FontDescription*))
      (__var0 == 1)
    end

    def copy
      __var0 = LibPango.font_description_copy(@pointer.as(LibPango::FontDescription*))
      __var1 = Pango::FontDescription.new(__var0) if __var0
      __var1
    end

    def copy_static
      __var0 = LibPango.font_description_copy_static(@pointer.as(LibPango::FontDescription*))
      __var1 = Pango::FontDescription.new(__var0) if __var0
      __var1
    end

    def equal(desc2 : Pango::FontDescription)
      __var0 = LibPango.font_description_equal(@pointer.as(LibPango::FontDescription*), desc2.to_unsafe.as(LibPango::FontDescription*))
      (__var0 == 1)
    end

    def free
      LibPango.font_description_free(@pointer.as(LibPango::FontDescription*))
      nil
    end

    def family
      __var0 = LibPango.font_description_get_family(@pointer.as(LibPango::FontDescription*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def gravity
      __var0 = LibPango.font_description_get_gravity(@pointer.as(LibPango::FontDescription*))
      Pango::Gravity.new(__var0)
    end

    def set_fields
      __var0 = LibPango.font_description_get_set_fields(@pointer.as(LibPango::FontDescription*))
      Pango::FontMask.new(__var0)
    end

    def size
      __var0 = LibPango.font_description_get_size(@pointer.as(LibPango::FontDescription*))
      __var0
    end

    def size_is_absolute
      __var0 = LibPango.font_description_get_size_is_absolute(@pointer.as(LibPango::FontDescription*))
      (__var0 == 1)
    end

    def stretch
      __var0 = LibPango.font_description_get_stretch(@pointer.as(LibPango::FontDescription*))
      Pango::Stretch.new(__var0)
    end

    def style
      __var0 = LibPango.font_description_get_style(@pointer.as(LibPango::FontDescription*))
      Pango::Style.new(__var0)
    end

    def variant
      __var0 = LibPango.font_description_get_variant(@pointer.as(LibPango::FontDescription*))
      Pango::Variant.new(__var0)
    end

    def variations
      __var0 = LibPango.font_description_get_variations(@pointer.as(LibPango::FontDescription*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def weight
      __var0 = LibPango.font_description_get_weight(@pointer.as(LibPango::FontDescription*))
      Pango::Weight.new(__var0)
    end

    def hash
      __var0 = LibPango.font_description_hash(@pointer.as(LibPango::FontDescription*))
      __var0
    end

    def merge(desc_to_merge : Pango::FontDescription?, replace_existing : ::Bool)
      LibPango.font_description_merge(@pointer.as(LibPango::FontDescription*), desc_to_merge ? desc_to_merge.to_unsafe.as(LibPango::FontDescription*) : Pointer(LibPango::FontDescription).null, LibC::Int.new(replace_existing ? 1 : 0))
      nil
    end

    def merge_static(desc_to_merge : Pango::FontDescription, replace_existing : ::Bool)
      LibPango.font_description_merge_static(@pointer.as(LibPango::FontDescription*), desc_to_merge.to_unsafe.as(LibPango::FontDescription*), LibC::Int.new(replace_existing ? 1 : 0))
      nil
    end

    def absolute_size=(size : ::Float)
      LibPango.font_description_set_absolute_size(@pointer.as(LibPango::FontDescription*), Float64.new(size))
      nil
    end

    def family=(family : ::String)
      LibPango.font_description_set_family(@pointer.as(LibPango::FontDescription*), family.to_unsafe)
      nil
    end

    def family_static=(family : ::String)
      LibPango.font_description_set_family_static(@pointer.as(LibPango::FontDescription*), family.to_unsafe)
      nil
    end

    def gravity=(gravity : Pango::Gravity)
      LibPango.font_description_set_gravity(@pointer.as(LibPango::FontDescription*), gravity)
      nil
    end

    def size=(size : ::Int)
      LibPango.font_description_set_size(@pointer.as(LibPango::FontDescription*), Int32.new(size))
      nil
    end

    def stretch=(stretch : Pango::Stretch)
      LibPango.font_description_set_stretch(@pointer.as(LibPango::FontDescription*), stretch)
      nil
    end

    def style=(style : Pango::Style)
      LibPango.font_description_set_style(@pointer.as(LibPango::FontDescription*), style)
      nil
    end

    def variant=(variant : Pango::Variant)
      LibPango.font_description_set_variant(@pointer.as(LibPango::FontDescription*), variant)
      nil
    end

    def variations=(variations : ::String)
      LibPango.font_description_set_variations(@pointer.as(LibPango::FontDescription*), variations.to_unsafe)
      nil
    end

    def variations_static=(variations : ::String)
      LibPango.font_description_set_variations_static(@pointer.as(LibPango::FontDescription*), variations.to_unsafe)
      nil
    end

    def weight=(weight : Pango::Weight)
      LibPango.font_description_set_weight(@pointer.as(LibPango::FontDescription*), weight)
      nil
    end

    def to_filename
      __var0 = LibPango.font_description_to_filename(@pointer.as(LibPango::FontDescription*))
      GObject.raise_unexpected_null("pango_font_description_to_filename") if __var0.null?
      ::String.new(__var0)
    end

    def to_string
      __var0 = LibPango.font_description_to_string(@pointer.as(LibPango::FontDescription*))
      GObject.raise_unexpected_null("pango_font_description_to_string") if __var0.null?
      ::String.new(__var0)
    end

    def unset_fields(to_unset : Pango::FontMask)
      LibPango.font_description_unset_fields(@pointer.as(LibPango::FontDescription*), to_unset)
      nil
    end

    def self.from_string(str : ::String)
      __var0 = LibPango.font_description_from_string(str.to_unsafe)
      GObject.raise_unexpected_null("pango_font_description_from_string") if __var0.null?
      Pango::FontDescription.new(__var0)
    end
  end

  class FontFace < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibPango::FontFace*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a PangoFontFace")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibPango._pango_font_face_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::FontFace*)
    end

    def to_unsafe_fontface
      @pointer.not_nil!.as(LibPango::FontFace*)
    end

    def describe
      __var0 = LibPango.font_face_describe(@pointer.as(LibPango::FontFace*))
      GObject.raise_unexpected_null("pango_font_face_describe") if __var0.null?
      Pango::FontDescription.new(__var0)
    end

    def face_name
      __var0 = LibPango.font_face_get_face_name(@pointer.as(LibPango::FontFace*))
      GObject.raise_unexpected_null("pango_font_face_get_face_name") if __var0.null?
      ::String.new(__var0)
    end

    def synthesized?
      __var0 = LibPango.font_face_is_synthesized(@pointer.as(LibPango::FontFace*))
      (__var0 == 1)
    end

    def list_sizes(sizes : ::Enumerable?)
      LibPango.font_face_list_sizes(@pointer.as(LibPango::FontFace*), sizes, out n_sizes)
      n_sizes
    end
  end

  class FontFaceClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(184u64, 0u8).as(LibPango::FontFaceClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibPango::FontFaceClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::FontFaceClass*)
    end

    def to_unsafe_fontfaceclass
      @pointer.not_nil!.as(LibPango::FontFaceClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibPango::FontFaceClass*).value.parent_class)
    end

    def get_face_name
      to_unsafe.as(LibPango::FontFaceClass*).value.get_face_name
    end

    def describe
      to_unsafe.as(LibPango::FontFaceClass*).value.describe
    end

    def list_sizes
      to_unsafe.as(LibPango::FontFaceClass*).value.list_sizes
    end

    def is_synthesized
      to_unsafe.as(LibPango::FontFaceClass*).value.is_synthesized
    end

    def _pango_reserved3
      to_unsafe.as(LibPango::FontFaceClass*).value._pango_reserved3
    end

    def _pango_reserved4
      to_unsafe.as(LibPango::FontFaceClass*).value._pango_reserved4
    end
  end

  class FontFamily < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibPango::FontFamily*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a PangoFontFamily")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibPango._pango_font_family_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::FontFamily*)
    end

    def to_unsafe_fontfamily
      @pointer.not_nil!.as(LibPango::FontFamily*)
    end

    def name
      __var0 = LibPango.font_family_get_name(@pointer.as(LibPango::FontFamily*))
      GObject.raise_unexpected_null("pango_font_family_get_name") if __var0.null?
      ::String.new(__var0)
    end

    def monospace?
      __var0 = LibPango.font_family_is_monospace(@pointer.as(LibPango::FontFamily*))
      (__var0 == 1)
    end

    def variable?
      __var0 = LibPango.font_family_is_variable(@pointer.as(LibPango::FontFamily*))
      (__var0 == 1)
    end

    def list_faces(faces : ::Enumerable?)
      LibPango.font_family_list_faces(@pointer.as(LibPango::FontFamily*), faces, out n_faces)
      n_faces
    end
  end

  class FontFamilyClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(184u64, 0u8).as(LibPango::FontFamilyClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibPango::FontFamilyClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::FontFamilyClass*)
    end

    def to_unsafe_fontfamilyclass
      @pointer.not_nil!.as(LibPango::FontFamilyClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibPango::FontFamilyClass*).value.parent_class)
    end

    def list_faces
      to_unsafe.as(LibPango::FontFamilyClass*).value.list_faces
    end

    def get_name
      to_unsafe.as(LibPango::FontFamilyClass*).value.get_name
    end

    def is_monospace
      to_unsafe.as(LibPango::FontFamilyClass*).value.is_monospace
    end

    def is_variable
      to_unsafe.as(LibPango::FontFamilyClass*).value.is_variable
    end

    def _pango_reserved2
      to_unsafe.as(LibPango::FontFamilyClass*).value._pango_reserved2
    end

    def _pango_reserved3
      to_unsafe.as(LibPango::FontFamilyClass*).value._pango_reserved3
    end
  end

  class FontMap < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibPango::FontMap*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a PangoFontMap")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibPango._pango_font_map_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::FontMap*)
    end

    def to_unsafe_fontmap
      @pointer.not_nil!.as(LibPango::FontMap*)
    end

    def changed
      LibPango.font_map_changed(@pointer.as(LibPango::FontMap*))
      nil
    end

    def create_context
      __var0 = LibPango.font_map_create_context(@pointer.as(LibPango::FontMap*))
      GObject.raise_unexpected_null("pango_font_map_create_context") if __var0.null?
      Pango::Context.new(__var0)
    end

    def serial
      __var0 = LibPango.font_map_get_serial(@pointer.as(LibPango::FontMap*))
      __var0
    end

    def list_families(families : ::Enumerable)
      LibPango.font_map_list_families(@pointer.as(LibPango::FontMap*), families, out n_families)
      n_families
    end

    def load_font(context : Pango::Context, desc : Pango::FontDescription)
      __var0 = LibPango.font_map_load_font(@pointer.as(LibPango::FontMap*), context.to_unsafe_context, desc.to_unsafe.as(LibPango::FontDescription*))
      __var1 = Pango::Font.new(__var0) if __var0
      __var1
    end

    def load_fontset(context : Pango::Context, desc : Pango::FontDescription, language : Pango::Language)
      __var0 = LibPango.font_map_load_fontset(@pointer.as(LibPango::FontMap*), context.to_unsafe_context, desc.to_unsafe.as(LibPango::FontDescription*), language.to_unsafe.as(LibPango::Language*))
      __var1 = Pango::Fontset.new(__var0) if __var0
      __var1
    end
  end

  class FontMapClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(200u64, 0u8).as(LibPango::FontMapClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibPango::FontMapClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::FontMapClass*)
    end

    def to_unsafe_fontmapclass
      @pointer.not_nil!.as(LibPango::FontMapClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibPango::FontMapClass*).value.parent_class)
    end

    def load_font
      to_unsafe.as(LibPango::FontMapClass*).value.load_font
    end

    def list_families
      to_unsafe.as(LibPango::FontMapClass*).value.list_families
    end

    def load_fontset
      to_unsafe.as(LibPango::FontMapClass*).value.load_fontset
    end

    def shape_engine_type
      ::String.new(to_unsafe.as(LibPango::FontMapClass*).value.shape_engine_type)
    end

    def get_serial
      to_unsafe.as(LibPango::FontMapClass*).value.get_serial
    end

    def changed
      to_unsafe.as(LibPango::FontMapClass*).value.changed
    end

    def _pango_reserved1
      to_unsafe.as(LibPango::FontMapClass*).value._pango_reserved1
    end

    def _pango_reserved2
      to_unsafe.as(LibPango::FontMapClass*).value._pango_reserved2
    end
  end

  @[Flags]
  enum FontMask : UInt32
    ZERO_NONE  =   0
    FAMILY     =   1
    STYLE      =   2
    VARIANT    =   4
    WEIGHT     =   8
    STRETCH    =  16
    SIZE       =  32
    GRAVITY    =  64
    VARIATIONS = 128
  end

  class FontMetrics
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(40u64, 0u8).as(LibPango::FontMetrics*))
    end

    @pointer : Void*

    def initialize(pointer : LibPango::FontMetrics*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::FontMetrics*)
    end

    def to_unsafe_fontmetrics
      @pointer.not_nil!.as(LibPango::FontMetrics*)
    end

    def approximate_char_width
      __var0 = LibPango.font_metrics_get_approximate_char_width(@pointer.as(LibPango::FontMetrics*))
      __var0
    end

    def approximate_digit_width
      __var0 = LibPango.font_metrics_get_approximate_digit_width(@pointer.as(LibPango::FontMetrics*))
      __var0
    end

    def ascent
      __var0 = LibPango.font_metrics_get_ascent(@pointer.as(LibPango::FontMetrics*))
      __var0
    end

    def descent
      __var0 = LibPango.font_metrics_get_descent(@pointer.as(LibPango::FontMetrics*))
      __var0
    end

    def height
      __var0 = LibPango.font_metrics_get_height(@pointer.as(LibPango::FontMetrics*))
      __var0
    end

    def strikethrough_position
      __var0 = LibPango.font_metrics_get_strikethrough_position(@pointer.as(LibPango::FontMetrics*))
      __var0
    end

    def strikethrough_thickness
      __var0 = LibPango.font_metrics_get_strikethrough_thickness(@pointer.as(LibPango::FontMetrics*))
      __var0
    end

    def underline_position
      __var0 = LibPango.font_metrics_get_underline_position(@pointer.as(LibPango::FontMetrics*))
      __var0
    end

    def underline_thickness
      __var0 = LibPango.font_metrics_get_underline_thickness(@pointer.as(LibPango::FontMetrics*))
      __var0
    end

    def ref
      __var0 = LibPango.font_metrics_ref(@pointer.as(LibPango::FontMetrics*))
      __var1 = Pango::FontMetrics.new(__var0) if __var0
      __var1
    end

    def unref
      LibPango.font_metrics_unref(@pointer.as(LibPango::FontMetrics*))
      nil
    end

    def ref_count
      to_unsafe.as(LibPango::FontMetrics*).value.ref_count
    end
  end

  class Fontset < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibPango::Fontset*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a PangoFontset")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibPango._pango_fontset_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::Fontset*)
    end

    def to_unsafe_fontset
      @pointer.not_nil!.as(LibPango::Fontset*)
    end

    def foreach(func : Pango::FontsetForeachFunc, data : Void*?)
      LibPango.fontset_foreach(@pointer.as(LibPango::Fontset*), func, data ? data : Pointer(Void).null)
      nil
    end

    def font(wc : ::Int)
      __var0 = LibPango.fontset_get_font(@pointer.as(LibPango::Fontset*), UInt32.new(wc))
      GObject.raise_unexpected_null("pango_fontset_get_font") if __var0.null?
      Pango::Font.new(__var0)
    end

    def metrics
      __var0 = LibPango.fontset_get_metrics(@pointer.as(LibPango::Fontset*))
      GObject.raise_unexpected_null("pango_fontset_get_metrics") if __var0.null?
      Pango::FontMetrics.new(__var0)
    end
  end

  class FontsetClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(200u64, 0u8).as(LibPango::FontsetClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibPango::FontsetClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::FontsetClass*)
    end

    def to_unsafe_fontsetclass
      @pointer.not_nil!.as(LibPango::FontsetClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibPango::FontsetClass*).value.parent_class)
    end

    def get_font
      to_unsafe.as(LibPango::FontsetClass*).value.get_font
    end

    def get_metrics
      to_unsafe.as(LibPango::FontsetClass*).value.get_metrics
    end

    def get_language
      to_unsafe.as(LibPango::FontsetClass*).value.get_language
    end

    def foreach
      to_unsafe.as(LibPango::FontsetClass*).value.foreach
    end

    def _pango_reserved1
      to_unsafe.as(LibPango::FontsetClass*).value._pango_reserved1
    end

    def _pango_reserved2
      to_unsafe.as(LibPango::FontsetClass*).value._pango_reserved2
    end

    def _pango_reserved3
      to_unsafe.as(LibPango::FontsetClass*).value._pango_reserved3
    end

    def _pango_reserved4
      to_unsafe.as(LibPango::FontsetClass*).value._pango_reserved4
    end
  end

  alias FontsetForeachFunc = LibPango::FontsetForeachFunc

  class FontsetSimple < Fontset
    @pointer : Void*

    def initialize(pointer : LibPango::FontsetSimple*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a PangoFontsetSimple")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibPango._pango_fontset_simple_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::FontsetSimple*)
    end

    def to_unsafe_fontsetsimple
      @pointer.not_nil!.as(LibPango::FontsetSimple*)
    end

    def self.new(language : Pango::Language) : self
      __var0 = LibPango.fontset_simple_new(language.to_unsafe.as(LibPango::Language*))
      GObject.raise_unexpected_null("pango_fontset_simple_new") if __var0.null?
      cast(Pango::FontsetSimple.new(__var0))
    end

    def append(font : Pango::Font)
      LibPango.fontset_simple_append(@pointer.as(LibPango::FontsetSimple*), font.to_unsafe_font)
      nil
    end

    def size
      __var0 = LibPango.fontset_simple_size(@pointer.as(LibPango::FontsetSimple*))
      __var0
    end
  end

  class FontsetSimpleClass
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibPango::FontsetSimpleClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::FontsetSimpleClass*)
    end

    def to_unsafe_fontsetsimpleclass
      @pointer.not_nil!.as(LibPango::FontsetSimpleClass*)
    end
  end

  class GlyphGeometry
    include GObject::WrappedType

    def self.new(width : Int32? = nil, x_offset : Int32? = nil, y_offset : Int32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(12u64, 0u8).as(LibPango::GlyphGeometry*))
      __var0.width = width unless width.nil?
      __var0.x_offset = x_offset unless x_offset.nil?
      __var0.y_offset = y_offset unless y_offset.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::GlyphGeometry*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::GlyphGeometry*)
    end

    def to_unsafe_glyphgeometry
      @pointer.not_nil!.as(LibPango::GlyphGeometry*)
    end

    def width
      to_unsafe.as(LibPango::GlyphGeometry*).value.width
    end

    def width=(value : Int32)
      to_unsafe.as(LibPango::GlyphGeometry*).value.width = Int32.new(value)
    end

    def x_offset
      to_unsafe.as(LibPango::GlyphGeometry*).value.x_offset
    end

    def x_offset=(value : Int32)
      to_unsafe.as(LibPango::GlyphGeometry*).value.x_offset = Int32.new(value)
    end

    def y_offset
      to_unsafe.as(LibPango::GlyphGeometry*).value.y_offset
    end

    def y_offset=(value : Int32)
      to_unsafe.as(LibPango::GlyphGeometry*).value.y_offset = Int32.new(value)
    end
  end

  class GlyphInfo
    include GObject::WrappedType

    def self.new(glyph : UInt32? = nil, geometry : Pango::GlyphGeometry? = nil, attr : Pango::GlyphVisAttr? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(20u64, 0u8).as(LibPango::GlyphInfo*))
      __var0.glyph = glyph unless glyph.nil?
      __var0.geometry = geometry unless geometry.nil?
      __var0.attr = attr unless attr.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::GlyphInfo*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::GlyphInfo*)
    end

    def to_unsafe_glyphinfo
      @pointer.not_nil!.as(LibPango::GlyphInfo*)
    end

    def glyph
      to_unsafe.as(LibPango::GlyphInfo*).value.glyph
    end

    def glyph=(value : UInt32)
      to_unsafe.as(LibPango::GlyphInfo*).value.glyph = UInt32.new(value)
    end

    def geometry
      Pango::GlyphGeometry.new(to_unsafe.as(LibPango::GlyphInfo*).value.geometry)
    end

    def geometry=(value : Pango::GlyphGeometry)
      to_unsafe.as(LibPango::GlyphInfo*).value.geometry = value
    end

    def attr
      Pango::GlyphVisAttr.new(to_unsafe.as(LibPango::GlyphInfo*).value.attr)
    end

    def attr=(value : Pango::GlyphVisAttr)
      to_unsafe.as(LibPango::GlyphInfo*).value.attr = value
    end
  end

  class GlyphItem
    include GObject::WrappedType

    def self.new(item : Pango::Item? = nil, glyphs : Pango::GlyphString? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibPango::GlyphItem*))
      __var0.item = item unless item.nil?
      __var0.glyphs = glyphs unless glyphs.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::GlyphItem*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::GlyphItem*)
    end

    def to_unsafe_glyphitem
      @pointer.not_nil!.as(LibPango::GlyphItem*)
    end

    def apply_attrs(text : ::String, list : Pango::AttrList)
      __var0 = LibPango.glyph_item_apply_attrs(@pointer.as(LibPango::GlyphItem*), text.to_unsafe, list.to_unsafe.as(LibPango::AttrList*))
      GObject.raise_unexpected_null("pango_glyph_item_apply_attrs") if __var0.null?
      GLib::SListIterator(Pango::GlyphItem, LibPango::GlyphItem*).new(GLib::SList.new(__var0.as(LibGLib::SList*)))
    end

    def copy
      __var0 = LibPango.glyph_item_copy(@pointer.as(LibPango::GlyphItem*))
      __var1 = Pango::GlyphItem.new(__var0) if __var0
      __var1
    end

    def free
      LibPango.glyph_item_free(@pointer.as(LibPango::GlyphItem*))
      nil
    end

    def logical_widths(text : ::String, logical_widths : ::Enumerable)
      LibPango.glyph_item_get_logical_widths(@pointer.as(LibPango::GlyphItem*), text.to_unsafe, (__logical_widths_ary = logical_widths.map { |__item| Int32.new(__item) }.to_a).to_unsafe)
      nil
    end

    def letter_space(text : ::String, log_attrs : ::Enumerable, letter_spacing : ::Int)
      LibPango.glyph_item_letter_space(@pointer.as(LibPango::GlyphItem*), text.to_unsafe, (__log_attrs_ary = log_attrs.map { |__item| __item }.to_a).to_unsafe, Int32.new(letter_spacing))
      nil
    end

    def split(text : ::String, split_index : ::Int)
      __var0 = LibPango.glyph_item_split(@pointer.as(LibPango::GlyphItem*), text.to_unsafe, Int32.new(split_index))
      GObject.raise_unexpected_null("pango_glyph_item_split") if __var0.null?
      Pango::GlyphItem.new(__var0)
    end

    def item
      Pango::Item.new(to_unsafe.as(LibPango::GlyphItem*).value.item)
    end

    def item=(value : Pango::Item)
      to_unsafe.as(LibPango::GlyphItem*).value.item = value.to_unsafe.as(LibPango::Item*)
    end

    def glyphs
      Pango::GlyphString.new(to_unsafe.as(LibPango::GlyphItem*).value.glyphs)
    end

    def glyphs=(value : Pango::GlyphString)
      to_unsafe.as(LibPango::GlyphItem*).value.glyphs = value.to_unsafe.as(LibPango::GlyphString*)
    end
  end

  class GlyphItemIter
    include GObject::WrappedType

    def self.new(glyph_item : Pango::GlyphItem? = nil, text : ::String? = nil, start_glyph : Int32? = nil, start_index : Int32? = nil, start_char : Int32? = nil, end_glyph : Int32? = nil, end_index : Int32? = nil, end_char : Int32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(40u64, 0u8).as(LibPango::GlyphItemIter*))
      __var0.glyph_item = glyph_item unless glyph_item.nil?
      __var0.text = text unless text.nil?
      __var0.start_glyph = start_glyph unless start_glyph.nil?
      __var0.start_index = start_index unless start_index.nil?
      __var0.start_char = start_char unless start_char.nil?
      __var0.end_glyph = end_glyph unless end_glyph.nil?
      __var0.end_index = end_index unless end_index.nil?
      __var0.end_char = end_char unless end_char.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::GlyphItemIter*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::GlyphItemIter*)
    end

    def to_unsafe_glyphitemiter
      @pointer.not_nil!.as(LibPango::GlyphItemIter*)
    end

    def copy
      __var0 = LibPango.glyph_item_iter_copy(@pointer.as(LibPango::GlyphItemIter*))
      __var1 = Pango::GlyphItemIter.new(__var0) if __var0
      __var1
    end

    def free
      LibPango.glyph_item_iter_free(@pointer.as(LibPango::GlyphItemIter*))
      nil
    end

    def init_end(glyph_item : Pango::GlyphItem, text : ::String)
      __var0 = LibPango.glyph_item_iter_init_end(@pointer.as(LibPango::GlyphItemIter*), glyph_item.to_unsafe.as(LibPango::GlyphItem*), text.to_unsafe)
      (__var0 == 1)
    end

    def init_start(glyph_item : Pango::GlyphItem, text : ::String)
      __var0 = LibPango.glyph_item_iter_init_start(@pointer.as(LibPango::GlyphItemIter*), glyph_item.to_unsafe.as(LibPango::GlyphItem*), text.to_unsafe)
      (__var0 == 1)
    end

    def next_cluster
      __var0 = LibPango.glyph_item_iter_next_cluster(@pointer.as(LibPango::GlyphItemIter*))
      (__var0 == 1)
    end

    def prev_cluster
      __var0 = LibPango.glyph_item_iter_prev_cluster(@pointer.as(LibPango::GlyphItemIter*))
      (__var0 == 1)
    end

    def glyph_item
      Pango::GlyphItem.new(to_unsafe.as(LibPango::GlyphItemIter*).value.glyph_item)
    end

    def glyph_item=(value : Pango::GlyphItem)
      to_unsafe.as(LibPango::GlyphItemIter*).value.glyph_item = value.to_unsafe.as(LibPango::GlyphItem*)
    end

    def text
      ::String.new(to_unsafe.as(LibPango::GlyphItemIter*).value.text)
    end

    def text=(value : ::String)
      to_unsafe.as(LibPango::GlyphItemIter*).value.text = value.to_unsafe
    end

    def start_glyph
      to_unsafe.as(LibPango::GlyphItemIter*).value.start_glyph
    end

    def start_glyph=(value : Int32)
      to_unsafe.as(LibPango::GlyphItemIter*).value.start_glyph = Int32.new(value)
    end

    def start_index
      to_unsafe.as(LibPango::GlyphItemIter*).value.start_index
    end

    def start_index=(value : Int32)
      to_unsafe.as(LibPango::GlyphItemIter*).value.start_index = Int32.new(value)
    end

    def start_char
      to_unsafe.as(LibPango::GlyphItemIter*).value.start_char
    end

    def start_char=(value : Int32)
      to_unsafe.as(LibPango::GlyphItemIter*).value.start_char = Int32.new(value)
    end

    def end_glyph
      to_unsafe.as(LibPango::GlyphItemIter*).value.end_glyph
    end

    def end_glyph=(value : Int32)
      to_unsafe.as(LibPango::GlyphItemIter*).value.end_glyph = Int32.new(value)
    end

    def end_index
      to_unsafe.as(LibPango::GlyphItemIter*).value.end_index
    end

    def end_index=(value : Int32)
      to_unsafe.as(LibPango::GlyphItemIter*).value.end_index = Int32.new(value)
    end

    def end_char
      to_unsafe.as(LibPango::GlyphItemIter*).value.end_char
    end

    def end_char=(value : Int32)
      to_unsafe.as(LibPango::GlyphItemIter*).value.end_char = Int32.new(value)
    end
  end

  class GlyphString
    include GObject::WrappedType

    def self.new(num_glyphs : Int32? = nil, glyphs : ::Enumerable(Pango::GlyphInfo)? = nil, log_clusters : Int32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(32u64, 0u8).as(LibPango::GlyphString*))
      __var0.num_glyphs = num_glyphs unless num_glyphs.nil?
      __var0.glyphs = glyphs unless glyphs.nil?
      __var0.log_clusters = log_clusters unless log_clusters.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::GlyphString*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::GlyphString*)
    end

    def to_unsafe_glyphstring
      @pointer.not_nil!.as(LibPango::GlyphString*)
    end

    def self.new : self
      __var0 = LibPango.glyph_string_new
      GObject.raise_unexpected_null("pango_glyph_string_new") if __var0.null?
      cast(Pango::GlyphString.new(__var0))
    end

    def copy
      __var0 = LibPango.glyph_string_copy(@pointer.as(LibPango::GlyphString*))
      __var1 = Pango::GlyphString.new(__var0) if __var0
      __var1
    end

    def extents(font : Pango::Font, ink_rect : Pango::Rectangle?, logical_rect : Pango::Rectangle?)
      LibPango.glyph_string_extents(@pointer.as(LibPango::GlyphString*), font.to_unsafe_font, ink_rect, logical_rect)
      nil
    end

    def extents_range(start : ::Int, _end : ::Int, font : Pango::Font, ink_rect : Pango::Rectangle?, logical_rect : Pango::Rectangle?)
      LibPango.glyph_string_extents_range(@pointer.as(LibPango::GlyphString*), Int32.new(start), Int32.new(_end), font.to_unsafe_font, ink_rect, logical_rect)
      nil
    end

    def free
      LibPango.glyph_string_free(@pointer.as(LibPango::GlyphString*))
      nil
    end

    def logical_widths(text : ::String, length : ::Int, embedding_level : ::Int, logical_widths : ::Enumerable)
      LibPango.glyph_string_get_logical_widths(@pointer.as(LibPango::GlyphString*), text.to_unsafe, Int32.new(length), Int32.new(embedding_level), (__logical_widths_ary = logical_widths.map { |__item| Int32.new(__item) }.to_a).to_unsafe)
      nil
    end

    def width
      __var0 = LibPango.glyph_string_get_width(@pointer.as(LibPango::GlyphString*))
      __var0
    end

    def index_to_x(text : ::String, length : ::Int, analysis : Pango::Analysis, index_ : ::Int, trailing : ::Bool)
      LibPango.glyph_string_index_to_x(@pointer.as(LibPango::GlyphString*), text.to_unsafe, Int32.new(length), analysis.to_unsafe.as(LibPango::Analysis*), Int32.new(index_), LibC::Int.new(trailing ? 1 : 0), out x_pos)
      x_pos
    end

    def size=(new_len : ::Int)
      LibPango.glyph_string_set_size(@pointer.as(LibPango::GlyphString*), Int32.new(new_len))
      nil
    end

    def x_to_index(text : ::String, length : ::Int, analysis : Pango::Analysis, x_pos : ::Int)
      LibPango.glyph_string_x_to_index(@pointer.as(LibPango::GlyphString*), text.to_unsafe, Int32.new(length), analysis.to_unsafe.as(LibPango::Analysis*), Int32.new(x_pos), out index_, out trailing)
      {index_, trailing}
    end

    def num_glyphs
      to_unsafe.as(LibPango::GlyphString*).value.num_glyphs
    end

    def num_glyphs=(value : Int32)
      to_unsafe.as(LibPango::GlyphString*).value.num_glyphs = Int32.new(value)
    end

    def glyphs
      GObject::PointerIterator.new(to_unsafe.as(LibPango::GlyphString*).value.glyphs) { |__var0|
        Pango::GlyphInfo.new(__var0)
      }
    end

    def glyphs=(value : ::Enumerable(Pango::GlyphInfo))
      to_unsafe.as(LibPango::GlyphString*).value.glyphs = (__value_ary = value.map { |__item| __item }.to_a).to_unsafe
    end

    def log_clusters
      to_unsafe.as(LibPango::GlyphString*).value.log_clusters
    end

    def log_clusters=(value : Int32)
      to_unsafe.as(LibPango::GlyphString*).value.log_clusters = value
    end

    def space
      to_unsafe.as(LibPango::GlyphString*).value.space
    end
  end

  class GlyphVisAttr
    include GObject::WrappedType

    def self.new(is_cluster_start : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(4u64, 0u8).as(LibPango::GlyphVisAttr*))
      __var0.is_cluster_start = is_cluster_start unless is_cluster_start.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::GlyphVisAttr*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::GlyphVisAttr*)
    end

    def to_unsafe_glyphvisattr
      @pointer.not_nil!.as(LibPango::GlyphVisAttr*)
    end

    def is_cluster_start
      to_unsafe.as(LibPango::GlyphVisAttr*).value.is_cluster_start
    end

    def is_cluster_start=(value : UInt32)
      to_unsafe.as(LibPango::GlyphVisAttr*).value.is_cluster_start = UInt32.new(value)
    end
  end

  enum Gravity : UInt32
    SOUTH = 0
    EAST  = 1
    NORTH = 2
    WEST  = 3
    AUTO  = 4
  end
  # Function get_for_matrix
  # Function get_for_script
  # Function get_for_script_and_width
  # Function to_rotation

  enum GravityHint : UInt32
    NATURAL = 0
    STRONG  = 1
    LINE    = 2
  end

  class IncludedModule
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(32u64, 0u8).as(LibPango::IncludedModule*))
    end

    @pointer : Void*

    def initialize(pointer : LibPango::IncludedModule*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::IncludedModule*)
    end

    def to_unsafe_includedmodule
      @pointer.not_nil!.as(LibPango::IncludedModule*)
    end

    def list
      to_unsafe.as(LibPango::IncludedModule*).value.list
    end

    def init
      to_unsafe.as(LibPango::IncludedModule*).value.init
    end

    def exit
      to_unsafe.as(LibPango::IncludedModule*).value.exit
    end

    def create
      to_unsafe.as(LibPango::IncludedModule*).value.create
    end
  end

  class Item
    include GObject::WrappedType

    def self.new(offset : Int32? = nil, length : Int32? = nil, num_chars : Int32? = nil, analysis : Pango::Analysis? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(64u64, 0u8).as(LibPango::Item*))
      __var0.offset = offset unless offset.nil?
      __var0.length = length unless length.nil?
      __var0.num_chars = num_chars unless num_chars.nil?
      __var0.analysis = analysis unless analysis.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::Item*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::Item*)
    end

    def to_unsafe_item
      @pointer.not_nil!.as(LibPango::Item*)
    end

    def self.new : self
      __var0 = LibPango.item_new
      GObject.raise_unexpected_null("pango_item_new") if __var0.null?
      cast(Pango::Item.new(__var0))
    end

    def apply_attrs(iter : Pango::AttrIterator)
      LibPango.item_apply_attrs(@pointer.as(LibPango::Item*), iter.to_unsafe.as(LibPango::AttrIterator*))
      nil
    end

    def copy
      __var0 = LibPango.item_copy(@pointer.as(LibPango::Item*))
      __var1 = Pango::Item.new(__var0) if __var0
      __var1
    end

    def free
      LibPango.item_free(@pointer.as(LibPango::Item*))
      nil
    end

    def split(split_index : ::Int, split_offset : ::Int)
      __var0 = LibPango.item_split(@pointer.as(LibPango::Item*), Int32.new(split_index), Int32.new(split_offset))
      GObject.raise_unexpected_null("pango_item_split") if __var0.null?
      Pango::Item.new(__var0)
    end

    def offset
      to_unsafe.as(LibPango::Item*).value.offset
    end

    def offset=(value : Int32)
      to_unsafe.as(LibPango::Item*).value.offset = Int32.new(value)
    end

    def length
      to_unsafe.as(LibPango::Item*).value.length
    end

    def length=(value : Int32)
      to_unsafe.as(LibPango::Item*).value.length = Int32.new(value)
    end

    def num_chars
      to_unsafe.as(LibPango::Item*).value.num_chars
    end

    def num_chars=(value : Int32)
      to_unsafe.as(LibPango::Item*).value.num_chars = Int32.new(value)
    end

    def analysis
      Pango::Analysis.new(to_unsafe.as(LibPango::Item*).value.analysis)
    end

    def analysis=(value : Pango::Analysis)
      to_unsafe.as(LibPango::Item*).value.analysis = value
    end
  end

  class Language
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibPango::Language*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::Language*)
    end

    def to_unsafe_language
      @pointer.not_nil!.as(LibPango::Language*)
    end

    def sample_string
      __var0 = LibPango.language_get_sample_string(@pointer.as(LibPango::Language*))
      GObject.raise_unexpected_null("pango_language_get_sample_string") if __var0.null?
      ::String.new(__var0)
    end

    def scripts
      __var0 = LibPango.language_get_scripts(@pointer.as(LibPango::Language*), out num_scripts)
      __var2 = GObject::PointerIterator.new(__var0) { |__var1|
        Pango::Script.new(__var1)
      } if __var0
      {__var2, num_scripts}
    end

    def includes_script(script : Pango::Script)
      __var0 = LibPango.language_includes_script(@pointer.as(LibPango::Language*), script)
      (__var0 == 1)
    end

    def matches(range_list : ::String)
      __var0 = LibPango.language_matches(@pointer.as(LibPango::Language*), range_list.to_unsafe)
      (__var0 == 1)
    end

    def to_string
      __var0 = LibPango.language_to_string(@pointer.as(LibPango::Language*))
      GObject.raise_unexpected_null("pango_language_to_string") if __var0.null?
      ::String.new(__var0)
    end

    def self.from_string(language : ::String?)
      __var0 = LibPango.language_from_string(language ? language.to_unsafe : Pointer(UInt8).null)
      __var1 = Pango::Language.new(__var0) if __var0
      __var1
    end

    def self.default
      __var0 = LibPango.language_get_default
      GObject.raise_unexpected_null("pango_language_get_default") if __var0.null?
      Pango::Language.new(__var0)
    end
  end

  class Layout < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibPango::Layout*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a PangoLayout")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibPango._pango_layout_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::Layout*)
    end

    def to_unsafe_layout
      @pointer.not_nil!.as(LibPango::Layout*)
    end

    def self.new(context : Pango::Context) : self
      __var0 = LibPango.layout_new(context.to_unsafe_context)
      GObject.raise_unexpected_null("pango_layout_new") if __var0.null?
      cast(Pango::Layout.new(__var0))
    end

    def context_changed
      LibPango.layout_context_changed(@pointer.as(LibPango::Layout*))
      nil
    end

    def copy
      __var0 = LibPango.layout_copy(@pointer.as(LibPango::Layout*))
      GObject.raise_unexpected_null("pango_layout_copy") if __var0.null?
      Pango::Layout.new(__var0)
    end

    def alignment
      __var0 = LibPango.layout_get_alignment(@pointer.as(LibPango::Layout*))
      Pango::Alignment.new(__var0)
    end

    def attributes
      __var0 = LibPango.layout_get_attributes(@pointer.as(LibPango::Layout*))
      GObject.raise_unexpected_null("pango_layout_get_attributes") if __var0.null?
      Pango::AttrList.new(__var0)
    end

    def auto_dir
      __var0 = LibPango.layout_get_auto_dir(@pointer.as(LibPango::Layout*))
      (__var0 == 1)
    end

    def baseline
      __var0 = LibPango.layout_get_baseline(@pointer.as(LibPango::Layout*))
      __var0
    end

    def character_count
      __var0 = LibPango.layout_get_character_count(@pointer.as(LibPango::Layout*))
      __var0
    end

    def context
      __var0 = LibPango.layout_get_context(@pointer.as(LibPango::Layout*))
      GObject.raise_unexpected_null("pango_layout_get_context") if __var0.null?
      Pango::Context.new(__var0)
    end

    def cursor_pos(index_ : ::Int, strong_pos : Pango::Rectangle?, weak_pos : Pango::Rectangle?)
      LibPango.layout_get_cursor_pos(@pointer.as(LibPango::Layout*), Int32.new(index_), strong_pos, weak_pos)
      nil
    end

    def ellipsize
      __var0 = LibPango.layout_get_ellipsize(@pointer.as(LibPango::Layout*))
      Pango::EllipsizeMode.new(__var0)
    end

    def extents(ink_rect : Pango::Rectangle?, logical_rect : Pango::Rectangle?)
      LibPango.layout_get_extents(@pointer.as(LibPango::Layout*), ink_rect, logical_rect)
      nil
    end

    def font_description
      __var0 = LibPango.layout_get_font_description(@pointer.as(LibPango::Layout*))
      __var1 = Pango::FontDescription.new(__var0) if __var0
      __var1
    end

    def height
      __var0 = LibPango.layout_get_height(@pointer.as(LibPango::Layout*))
      __var0
    end

    def indent
      __var0 = LibPango.layout_get_indent(@pointer.as(LibPango::Layout*))
      __var0
    end

    def iter
      __var0 = LibPango.layout_get_iter(@pointer.as(LibPango::Layout*))
      GObject.raise_unexpected_null("pango_layout_get_iter") if __var0.null?
      Pango::LayoutIter.new(__var0)
    end

    def justify
      __var0 = LibPango.layout_get_justify(@pointer.as(LibPango::Layout*))
      (__var0 == 1)
    end

    def line(line : ::Int)
      __var0 = LibPango.layout_get_line(@pointer.as(LibPango::Layout*), Int32.new(line))
      __var1 = Pango::LayoutLine.new(__var0) if __var0
      __var1
    end

    def line_count
      __var0 = LibPango.layout_get_line_count(@pointer.as(LibPango::Layout*))
      __var0
    end

    def line_readonly(line : ::Int)
      __var0 = LibPango.layout_get_line_readonly(@pointer.as(LibPango::Layout*), Int32.new(line))
      __var1 = Pango::LayoutLine.new(__var0) if __var0
      __var1
    end

    def line_spacing
      __var0 = LibPango.layout_get_line_spacing(@pointer.as(LibPango::Layout*))
      __var0
    end

    def lines
      __var0 = LibPango.layout_get_lines(@pointer.as(LibPango::Layout*))
      GObject.raise_unexpected_null("pango_layout_get_lines") if __var0.null?
      GLib::SListIterator(Pango::LayoutLine, LibPango::LayoutLine*).new(GLib::SList.new(__var0.as(LibGLib::SList*)))
    end

    def lines_readonly
      __var0 = LibPango.layout_get_lines_readonly(@pointer.as(LibPango::Layout*))
      GObject.raise_unexpected_null("pango_layout_get_lines_readonly") if __var0.null?
      GLib::SListIterator(Pango::LayoutLine, LibPango::LayoutLine*).new(GLib::SList.new(__var0.as(LibGLib::SList*)))
    end

    def log_attrs(attrs : ::Enumerable)
      LibPango.layout_get_log_attrs(@pointer.as(LibPango::Layout*), attrs, out n_attrs)
      n_attrs
    end

    def log_attrs_readonly
      __var0 = LibPango.layout_get_log_attrs_readonly(@pointer.as(LibPango::Layout*), out n_attrs)
      GObject.raise_unexpected_null("pango_layout_get_log_attrs_readonly") if __var0.null?
      {GObject::PointerIterator.new(__var0) { |__var1|
        Pango::LogAttr.new(__var1)
      }, n_attrs}
    end

    def pixel_extents(ink_rect : Pango::Rectangle?, logical_rect : Pango::Rectangle?)
      LibPango.layout_get_pixel_extents(@pointer.as(LibPango::Layout*), ink_rect, logical_rect)
      nil
    end

    def pixel_size
      LibPango.layout_get_pixel_size(@pointer.as(LibPango::Layout*), out width, out height)
      {width, height}
    end

    def serial
      __var0 = LibPango.layout_get_serial(@pointer.as(LibPango::Layout*))
      __var0
    end

    def single_paragraph_mode
      __var0 = LibPango.layout_get_single_paragraph_mode(@pointer.as(LibPango::Layout*))
      (__var0 == 1)
    end

    def size
      LibPango.layout_get_size(@pointer.as(LibPango::Layout*), out width, out height)
      {width, height}
    end

    def spacing
      __var0 = LibPango.layout_get_spacing(@pointer.as(LibPango::Layout*))
      __var0
    end

    def tabs
      __var0 = LibPango.layout_get_tabs(@pointer.as(LibPango::Layout*))
      __var1 = Pango::TabArray.new(__var0) if __var0
      __var1
    end

    def text
      __var0 = LibPango.layout_get_text(@pointer.as(LibPango::Layout*))
      GObject.raise_unexpected_null("pango_layout_get_text") if __var0.null?
      ::String.new(__var0)
    end

    def unknown_glyphs_count
      __var0 = LibPango.layout_get_unknown_glyphs_count(@pointer.as(LibPango::Layout*))
      __var0
    end

    def width
      __var0 = LibPango.layout_get_width(@pointer.as(LibPango::Layout*))
      __var0
    end

    def wrap
      __var0 = LibPango.layout_get_wrap(@pointer.as(LibPango::Layout*))
      Pango::WrapMode.new(__var0)
    end

    def index_to_line_x(index_ : ::Int, trailing : ::Bool)
      LibPango.layout_index_to_line_x(@pointer.as(LibPango::Layout*), Int32.new(index_), LibC::Int.new(trailing ? 1 : 0), out line, out x_pos)
      {line, x_pos}
    end

    def index_to_pos(index_ : ::Int, pos : Pango::Rectangle)
      LibPango.layout_index_to_pos(@pointer.as(LibPango::Layout*), Int32.new(index_), pos)
      nil
    end

    def ellipsized?
      __var0 = LibPango.layout_is_ellipsized(@pointer.as(LibPango::Layout*))
      (__var0 == 1)
    end

    def wrapped?
      __var0 = LibPango.layout_is_wrapped(@pointer.as(LibPango::Layout*))
      (__var0 == 1)
    end

    def move_cursor_visually(strong : ::Bool, old_index : ::Int, old_trailing : ::Int, direction : ::Int)
      LibPango.layout_move_cursor_visually(@pointer.as(LibPango::Layout*), LibC::Int.new(strong ? 1 : 0), Int32.new(old_index), Int32.new(old_trailing), Int32.new(direction), out new_index, out new_trailing)
      {new_index, new_trailing}
    end

    def alignment=(alignment : Pango::Alignment)
      LibPango.layout_set_alignment(@pointer.as(LibPango::Layout*), alignment)
      nil
    end

    def attributes=(attrs : Pango::AttrList?)
      LibPango.layout_set_attributes(@pointer.as(LibPango::Layout*), attrs ? attrs.to_unsafe.as(LibPango::AttrList*) : Pointer(LibPango::AttrList).null)
      nil
    end

    def auto_dir=(auto_dir : ::Bool)
      LibPango.layout_set_auto_dir(@pointer.as(LibPango::Layout*), LibC::Int.new(auto_dir ? 1 : 0))
      nil
    end

    def ellipsize=(ellipsize : Pango::EllipsizeMode)
      LibPango.layout_set_ellipsize(@pointer.as(LibPango::Layout*), ellipsize)
      nil
    end

    def font_description=(desc : Pango::FontDescription?)
      LibPango.layout_set_font_description(@pointer.as(LibPango::Layout*), desc ? desc.to_unsafe.as(LibPango::FontDescription*) : Pointer(LibPango::FontDescription).null)
      nil
    end

    def height=(height : ::Int)
      LibPango.layout_set_height(@pointer.as(LibPango::Layout*), Int32.new(height))
      nil
    end

    def indent=(indent : ::Int)
      LibPango.layout_set_indent(@pointer.as(LibPango::Layout*), Int32.new(indent))
      nil
    end

    def justify=(justify : ::Bool)
      LibPango.layout_set_justify(@pointer.as(LibPango::Layout*), LibC::Int.new(justify ? 1 : 0))
      nil
    end

    def line_spacing=(factor : ::Float)
      LibPango.layout_set_line_spacing(@pointer.as(LibPango::Layout*), Float32.new(factor))
      nil
    end

    def set_markup(markup : ::String, length : ::Int)
      LibPango.layout_set_markup(@pointer.as(LibPango::Layout*), markup.to_unsafe, Int32.new(length))
      nil
    end

    def set_markup_with_accel(markup : ::String, length : ::Int, accel_marker : UInt8)
      LibPango.layout_set_markup_with_accel(@pointer.as(LibPango::Layout*), markup.to_unsafe, Int32.new(length), UInt8.new(accel_marker), out accel_char)
      accel_char
    end

    def single_paragraph_mode=(setting : ::Bool)
      LibPango.layout_set_single_paragraph_mode(@pointer.as(LibPango::Layout*), LibC::Int.new(setting ? 1 : 0))
      nil
    end

    def spacing=(spacing : ::Int)
      LibPango.layout_set_spacing(@pointer.as(LibPango::Layout*), Int32.new(spacing))
      nil
    end

    def tabs=(tabs : Pango::TabArray?)
      LibPango.layout_set_tabs(@pointer.as(LibPango::Layout*), tabs ? tabs.to_unsafe.as(LibPango::TabArray*) : Pointer(LibPango::TabArray).null)
      nil
    end

    def set_text(text : ::String, length : ::Int)
      LibPango.layout_set_text(@pointer.as(LibPango::Layout*), text.to_unsafe, Int32.new(length))
      nil
    end

    def width=(width : ::Int)
      LibPango.layout_set_width(@pointer.as(LibPango::Layout*), Int32.new(width))
      nil
    end

    def wrap=(wrap : Pango::WrapMode)
      LibPango.layout_set_wrap(@pointer.as(LibPango::Layout*), wrap)
      nil
    end

    def xy_to_index(x : ::Int, y : ::Int)
      __var0 = LibPango.layout_xy_to_index(@pointer.as(LibPango::Layout*), Int32.new(x), Int32.new(y), out index_, out trailing)
      {(__var0 == 1), index_, trailing}
    end
  end

  class LayoutClass
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibPango::LayoutClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::LayoutClass*)
    end

    def to_unsafe_layoutclass
      @pointer.not_nil!.as(LibPango::LayoutClass*)
    end
  end

  class LayoutIter
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibPango::LayoutIter*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::LayoutIter*)
    end

    def to_unsafe_layoutiter
      @pointer.not_nil!.as(LibPango::LayoutIter*)
    end

    def at_last_line
      __var0 = LibPango.layout_iter_at_last_line(@pointer.as(LibPango::LayoutIter*))
      (__var0 == 1)
    end

    def copy
      __var0 = LibPango.layout_iter_copy(@pointer.as(LibPango::LayoutIter*))
      __var1 = Pango::LayoutIter.new(__var0) if __var0
      __var1
    end

    def free
      LibPango.layout_iter_free(@pointer.as(LibPango::LayoutIter*))
      nil
    end

    def baseline
      __var0 = LibPango.layout_iter_get_baseline(@pointer.as(LibPango::LayoutIter*))
      __var0
    end

    def char_extents(logical_rect : Pango::Rectangle)
      LibPango.layout_iter_get_char_extents(@pointer.as(LibPango::LayoutIter*), logical_rect)
      nil
    end

    def cluster_extents(ink_rect : Pango::Rectangle?, logical_rect : Pango::Rectangle?)
      LibPango.layout_iter_get_cluster_extents(@pointer.as(LibPango::LayoutIter*), ink_rect, logical_rect)
      nil
    end

    def index
      __var0 = LibPango.layout_iter_get_index(@pointer.as(LibPango::LayoutIter*))
      __var0
    end

    def layout
      __var0 = LibPango.layout_iter_get_layout(@pointer.as(LibPango::LayoutIter*))
      GObject.raise_unexpected_null("pango_layout_iter_get_layout") if __var0.null?
      Pango::Layout.new(__var0)
    end

    def layout_extents(ink_rect : Pango::Rectangle?, logical_rect : Pango::Rectangle?)
      LibPango.layout_iter_get_layout_extents(@pointer.as(LibPango::LayoutIter*), ink_rect, logical_rect)
      nil
    end

    def line
      __var0 = LibPango.layout_iter_get_line(@pointer.as(LibPango::LayoutIter*))
      GObject.raise_unexpected_null("pango_layout_iter_get_line") if __var0.null?
      Pango::LayoutLine.new(__var0)
    end

    def line_extents(ink_rect : Pango::Rectangle?, logical_rect : Pango::Rectangle?)
      LibPango.layout_iter_get_line_extents(@pointer.as(LibPango::LayoutIter*), ink_rect, logical_rect)
      nil
    end

    def line_readonly
      __var0 = LibPango.layout_iter_get_line_readonly(@pointer.as(LibPango::LayoutIter*))
      GObject.raise_unexpected_null("pango_layout_iter_get_line_readonly") if __var0.null?
      Pango::LayoutLine.new(__var0)
    end

    def line_yrange
      LibPango.layout_iter_get_line_yrange(@pointer.as(LibPango::LayoutIter*), out y0_, out y1_)
      {y0_, y1_}
    end

    def run
      __var0 = LibPango.layout_iter_get_run(@pointer.as(LibPango::LayoutIter*))
      __var1 = Pango::GlyphItem.new(__var0) if __var0
      __var1
    end

    def run_extents(ink_rect : Pango::Rectangle?, logical_rect : Pango::Rectangle?)
      LibPango.layout_iter_get_run_extents(@pointer.as(LibPango::LayoutIter*), ink_rect, logical_rect)
      nil
    end

    def run_readonly
      __var0 = LibPango.layout_iter_get_run_readonly(@pointer.as(LibPango::LayoutIter*))
      __var1 = Pango::GlyphItem.new(__var0) if __var0
      __var1
    end

    def next_char
      __var0 = LibPango.layout_iter_next_char(@pointer.as(LibPango::LayoutIter*))
      (__var0 == 1)
    end

    def next_cluster
      __var0 = LibPango.layout_iter_next_cluster(@pointer.as(LibPango::LayoutIter*))
      (__var0 == 1)
    end

    def next_line
      __var0 = LibPango.layout_iter_next_line(@pointer.as(LibPango::LayoutIter*))
      (__var0 == 1)
    end

    def next_run
      __var0 = LibPango.layout_iter_next_run(@pointer.as(LibPango::LayoutIter*))
      (__var0 == 1)
    end
  end

  class LayoutLine
    include GObject::WrappedType

    def self.new(layout : Pango::Layout? = nil, start_index : Int32? = nil, length : Int32? = nil, runs : Void*? = nil, is_paragraph_start : UInt32? = nil, resolved_dir : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(32u64, 0u8).as(LibPango::LayoutLine*))
      __var0.layout = layout unless layout.nil?
      __var0.start_index = start_index unless start_index.nil?
      __var0.length = length unless length.nil?
      __var0.runs = runs unless runs.nil?
      __var0.is_paragraph_start = is_paragraph_start unless is_paragraph_start.nil?
      __var0.resolved_dir = resolved_dir unless resolved_dir.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::LayoutLine*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::LayoutLine*)
    end

    def to_unsafe_layoutline
      @pointer.not_nil!.as(LibPango::LayoutLine*)
    end

    def extents(ink_rect : Pango::Rectangle?, logical_rect : Pango::Rectangle?)
      LibPango.layout_line_get_extents(@pointer.as(LibPango::LayoutLine*), ink_rect, logical_rect)
      nil
    end

    def height
      LibPango.layout_line_get_height(@pointer.as(LibPango::LayoutLine*), out height)
      height
    end

    def pixel_extents(ink_rect : Pango::Rectangle?, logical_rect : Pango::Rectangle?)
      LibPango.layout_line_get_pixel_extents(@pointer.as(LibPango::LayoutLine*), ink_rect, logical_rect)
      nil
    end

    def x_ranges(start_index : ::Int, end_index : ::Int, ranges : ::Enumerable)
      LibPango.layout_line_get_x_ranges(@pointer.as(LibPango::LayoutLine*), Int32.new(start_index), Int32.new(end_index), ranges, out n_ranges)
      n_ranges
    end

    def index_to_x(index_ : ::Int, trailing : ::Bool)
      LibPango.layout_line_index_to_x(@pointer.as(LibPango::LayoutLine*), Int32.new(index_), LibC::Int.new(trailing ? 1 : 0), out x_pos)
      x_pos
    end

    def ref
      __var0 = LibPango.layout_line_ref(@pointer.as(LibPango::LayoutLine*))
      GObject.raise_unexpected_null("pango_layout_line_ref") if __var0.null?
      Pango::LayoutLine.new(__var0)
    end

    def unref
      LibPango.layout_line_unref(@pointer.as(LibPango::LayoutLine*))
      nil
    end

    def x_to_index(x_pos : ::Int)
      __var0 = LibPango.layout_line_x_to_index(@pointer.as(LibPango::LayoutLine*), Int32.new(x_pos), out index_, out trailing)
      {(__var0 == 1), index_, trailing}
    end

    def layout
      Pango::Layout.new(to_unsafe.as(LibPango::LayoutLine*).value.layout)
    end

    def layout=(value : Pango::Layout)
      to_unsafe.as(LibPango::LayoutLine*).value.layout = value.to_unsafe_layout
    end

    def start_index
      to_unsafe.as(LibPango::LayoutLine*).value.start_index
    end

    def start_index=(value : Int32)
      to_unsafe.as(LibPango::LayoutLine*).value.start_index = Int32.new(value)
    end

    def length
      to_unsafe.as(LibPango::LayoutLine*).value.length
    end

    def length=(value : Int32)
      to_unsafe.as(LibPango::LayoutLine*).value.length = Int32.new(value)
    end

    def runs
      GLib::SListIterator(Pango::GlyphItem, LibPango::GlyphItem*).new(GLib::SList.new(to_unsafe.as(LibPango::LayoutLine*).value.runs.as(LibGLib::SList*)))
    end

    def runs=(value : Void*)
      to_unsafe.as(LibPango::LayoutLine*).value.runs = value
    end

    def is_paragraph_start
      to_unsafe.as(LibPango::LayoutLine*).value.is_paragraph_start
    end

    def is_paragraph_start=(value : UInt32)
      to_unsafe.as(LibPango::LayoutLine*).value.is_paragraph_start = UInt32.new(value)
    end

    def resolved_dir
      to_unsafe.as(LibPango::LayoutLine*).value.resolved_dir
    end

    def resolved_dir=(value : UInt32)
      to_unsafe.as(LibPango::LayoutLine*).value.resolved_dir = UInt32.new(value)
    end
  end

  class LogAttr
    include GObject::WrappedType

    def self.new(is_line_break : UInt32? = nil, is_mandatory_break : UInt32? = nil, is_char_break : UInt32? = nil, is_white : UInt32? = nil, is_cursor_position : UInt32? = nil, is_word_start : UInt32? = nil, is_word_end : UInt32? = nil, is_sentence_boundary : UInt32? = nil, is_sentence_start : UInt32? = nil, is_sentence_end : UInt32? = nil, backspace_deletes_character : UInt32? = nil, is_expandable_space : UInt32? = nil, is_word_boundary : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(52u64, 0u8).as(LibPango::LogAttr*))
      __var0.is_line_break = is_line_break unless is_line_break.nil?
      __var0.is_mandatory_break = is_mandatory_break unless is_mandatory_break.nil?
      __var0.is_char_break = is_char_break unless is_char_break.nil?
      __var0.is_white = is_white unless is_white.nil?
      __var0.is_cursor_position = is_cursor_position unless is_cursor_position.nil?
      __var0.is_word_start = is_word_start unless is_word_start.nil?
      __var0.is_word_end = is_word_end unless is_word_end.nil?
      __var0.is_sentence_boundary = is_sentence_boundary unless is_sentence_boundary.nil?
      __var0.is_sentence_start = is_sentence_start unless is_sentence_start.nil?
      __var0.is_sentence_end = is_sentence_end unless is_sentence_end.nil?
      __var0.backspace_deletes_character = backspace_deletes_character unless backspace_deletes_character.nil?
      __var0.is_expandable_space = is_expandable_space unless is_expandable_space.nil?
      __var0.is_word_boundary = is_word_boundary unless is_word_boundary.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::LogAttr*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::LogAttr*)
    end

    def to_unsafe_logattr
      @pointer.not_nil!.as(LibPango::LogAttr*)
    end

    def is_line_break
      to_unsafe.as(LibPango::LogAttr*).value.is_line_break
    end

    def is_line_break=(value : UInt32)
      to_unsafe.as(LibPango::LogAttr*).value.is_line_break = UInt32.new(value)
    end

    def is_mandatory_break
      to_unsafe.as(LibPango::LogAttr*).value.is_mandatory_break
    end

    def is_mandatory_break=(value : UInt32)
      to_unsafe.as(LibPango::LogAttr*).value.is_mandatory_break = UInt32.new(value)
    end

    def is_char_break
      to_unsafe.as(LibPango::LogAttr*).value.is_char_break
    end

    def is_char_break=(value : UInt32)
      to_unsafe.as(LibPango::LogAttr*).value.is_char_break = UInt32.new(value)
    end

    def is_white
      to_unsafe.as(LibPango::LogAttr*).value.is_white
    end

    def is_white=(value : UInt32)
      to_unsafe.as(LibPango::LogAttr*).value.is_white = UInt32.new(value)
    end

    def is_cursor_position
      to_unsafe.as(LibPango::LogAttr*).value.is_cursor_position
    end

    def is_cursor_position=(value : UInt32)
      to_unsafe.as(LibPango::LogAttr*).value.is_cursor_position = UInt32.new(value)
    end

    def is_word_start
      to_unsafe.as(LibPango::LogAttr*).value.is_word_start
    end

    def is_word_start=(value : UInt32)
      to_unsafe.as(LibPango::LogAttr*).value.is_word_start = UInt32.new(value)
    end

    def is_word_end
      to_unsafe.as(LibPango::LogAttr*).value.is_word_end
    end

    def is_word_end=(value : UInt32)
      to_unsafe.as(LibPango::LogAttr*).value.is_word_end = UInt32.new(value)
    end

    def is_sentence_boundary
      to_unsafe.as(LibPango::LogAttr*).value.is_sentence_boundary
    end

    def is_sentence_boundary=(value : UInt32)
      to_unsafe.as(LibPango::LogAttr*).value.is_sentence_boundary = UInt32.new(value)
    end

    def is_sentence_start
      to_unsafe.as(LibPango::LogAttr*).value.is_sentence_start
    end

    def is_sentence_start=(value : UInt32)
      to_unsafe.as(LibPango::LogAttr*).value.is_sentence_start = UInt32.new(value)
    end

    def is_sentence_end
      to_unsafe.as(LibPango::LogAttr*).value.is_sentence_end
    end

    def is_sentence_end=(value : UInt32)
      to_unsafe.as(LibPango::LogAttr*).value.is_sentence_end = UInt32.new(value)
    end

    def backspace_deletes_character
      to_unsafe.as(LibPango::LogAttr*).value.backspace_deletes_character
    end

    def backspace_deletes_character=(value : UInt32)
      to_unsafe.as(LibPango::LogAttr*).value.backspace_deletes_character = UInt32.new(value)
    end

    def is_expandable_space
      to_unsafe.as(LibPango::LogAttr*).value.is_expandable_space
    end

    def is_expandable_space=(value : UInt32)
      to_unsafe.as(LibPango::LogAttr*).value.is_expandable_space = UInt32.new(value)
    end

    def is_word_boundary
      to_unsafe.as(LibPango::LogAttr*).value.is_word_boundary
    end

    def is_word_boundary=(value : UInt32)
      to_unsafe.as(LibPango::LogAttr*).value.is_word_boundary = UInt32.new(value)
    end
  end

  class Map
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibPango::Map*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::Map*)
    end

    def to_unsafe_map
      @pointer.not_nil!.as(LibPango::Map*)
    end
  end

  class MapEntry
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibPango::MapEntry*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::MapEntry*)
    end

    def to_unsafe_mapentry
      @pointer.not_nil!.as(LibPango::MapEntry*)
    end
  end

  class Matrix
    include GObject::WrappedType

    def self.new(xx : Float64? = nil, xy : Float64? = nil, yx : Float64? = nil, yy : Float64? = nil, x0 : Float64? = nil, y0 : Float64? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(48u64, 0u8).as(LibPango::Matrix*))
      __var0.xx = xx unless xx.nil?
      __var0.xy = xy unless xy.nil?
      __var0.yx = yx unless yx.nil?
      __var0.yy = yy unless yy.nil?
      __var0.x0 = x0 unless x0.nil?
      __var0.y0 = y0 unless y0.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::Matrix*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::Matrix*)
    end

    def to_unsafe_matrix
      @pointer.not_nil!.as(LibPango::Matrix*)
    end

    def concat(new_matrix : Pango::Matrix)
      LibPango.matrix_concat(@pointer.as(LibPango::Matrix*), new_matrix.to_unsafe.as(LibPango::Matrix*))
      nil
    end

    def copy
      __var0 = LibPango.matrix_copy(@pointer.as(LibPango::Matrix*))
      __var1 = Pango::Matrix.new(__var0) if __var0
      __var1
    end

    def free
      LibPango.matrix_free(@pointer.as(LibPango::Matrix*))
      nil
    end

    def font_scale_factor
      __var0 = LibPango.matrix_get_font_scale_factor(@pointer.as(LibPango::Matrix*))
      __var0
    end

    def font_scale_factors
      LibPango.matrix_get_font_scale_factors(@pointer.as(LibPango::Matrix*), out xscale, out yscale)
      {xscale, yscale}
    end

    def rotate(degrees : ::Float)
      LibPango.matrix_rotate(@pointer.as(LibPango::Matrix*), Float64.new(degrees))
      nil
    end

    def scale(scale_x : ::Float, scale_y : ::Float)
      LibPango.matrix_scale(@pointer.as(LibPango::Matrix*), Float64.new(scale_x), Float64.new(scale_y))
      nil
    end

    def transform_distance(dx : ::Float, dy : ::Float)
      LibPango.matrix_transform_distance(@pointer.as(LibPango::Matrix*), dx, dy)
      nil
    end

    def transform_pixel_rectangle(rect : Pango::Rectangle?)
      LibPango.matrix_transform_pixel_rectangle(@pointer.as(LibPango::Matrix*), rect)
      nil
    end

    def transform_point(x : ::Float, y : ::Float)
      LibPango.matrix_transform_point(@pointer.as(LibPango::Matrix*), x, y)
      nil
    end

    def transform_rectangle(rect : Pango::Rectangle?)
      LibPango.matrix_transform_rectangle(@pointer.as(LibPango::Matrix*), rect)
      nil
    end

    def translate(tx : ::Float, ty : ::Float)
      LibPango.matrix_translate(@pointer.as(LibPango::Matrix*), Float64.new(tx), Float64.new(ty))
      nil
    end

    def xx
      to_unsafe.as(LibPango::Matrix*).value.xx
    end

    def xx=(value : Float64)
      to_unsafe.as(LibPango::Matrix*).value.xx = Float64.new(value)
    end

    def xy
      to_unsafe.as(LibPango::Matrix*).value.xy
    end

    def xy=(value : Float64)
      to_unsafe.as(LibPango::Matrix*).value.xy = Float64.new(value)
    end

    def yx
      to_unsafe.as(LibPango::Matrix*).value.yx
    end

    def yx=(value : Float64)
      to_unsafe.as(LibPango::Matrix*).value.yx = Float64.new(value)
    end

    def yy
      to_unsafe.as(LibPango::Matrix*).value.yy
    end

    def yy=(value : Float64)
      to_unsafe.as(LibPango::Matrix*).value.yy = Float64.new(value)
    end

    def x0
      to_unsafe.as(LibPango::Matrix*).value.x0
    end

    def x0=(value : Float64)
      to_unsafe.as(LibPango::Matrix*).value.x0 = Float64.new(value)
    end

    def y0
      to_unsafe.as(LibPango::Matrix*).value.y0
    end

    def y0=(value : Float64)
      to_unsafe.as(LibPango::Matrix*).value.y0 = Float64.new(value)
    end
  end

  class Rectangle
    include GObject::WrappedType

    def self.new(x : Int32? = nil, y : Int32? = nil, width : Int32? = nil, height : Int32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibPango::Rectangle*))
      __var0.x = x unless x.nil?
      __var0.y = y unless y.nil?
      __var0.width = width unless width.nil?
      __var0.height = height unless height.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibPango::Rectangle*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::Rectangle*)
    end

    def to_unsafe_rectangle
      @pointer.not_nil!.as(LibPango::Rectangle*)
    end

    def x
      to_unsafe.as(LibPango::Rectangle*).value.x
    end

    def x=(value : Int32)
      to_unsafe.as(LibPango::Rectangle*).value.x = Int32.new(value)
    end

    def y
      to_unsafe.as(LibPango::Rectangle*).value.y
    end

    def y=(value : Int32)
      to_unsafe.as(LibPango::Rectangle*).value.y = Int32.new(value)
    end

    def width
      to_unsafe.as(LibPango::Rectangle*).value.width
    end

    def width=(value : Int32)
      to_unsafe.as(LibPango::Rectangle*).value.width = Int32.new(value)
    end

    def height
      to_unsafe.as(LibPango::Rectangle*).value.height
    end

    def height=(value : Int32)
      to_unsafe.as(LibPango::Rectangle*).value.height = Int32.new(value)
    end
  end

  enum RenderPart : UInt32
    FOREGROUND    = 0
    BACKGROUND    = 1
    UNDERLINE     = 2
    STRIKETHROUGH = 3
  end

  class Renderer < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibPango::Renderer*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a PangoRenderer")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibPango._pango_renderer_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::Renderer*)
    end

    def to_unsafe_renderer
      @pointer.not_nil!.as(LibPango::Renderer*)
    end

    def activate
      LibPango.renderer_activate(@pointer.as(LibPango::Renderer*))
      nil
    end

    def deactivate
      LibPango.renderer_deactivate(@pointer.as(LibPango::Renderer*))
      nil
    end

    def draw_error_underline(x : ::Int, y : ::Int, width : ::Int, height : ::Int)
      LibPango.renderer_draw_error_underline(@pointer.as(LibPango::Renderer*), Int32.new(x), Int32.new(y), Int32.new(width), Int32.new(height))
      nil
    end

    def draw_glyph(font : Pango::Font, glyph : ::Int, x : ::Float, y : ::Float)
      LibPango.renderer_draw_glyph(@pointer.as(LibPango::Renderer*), font.to_unsafe_font, UInt32.new(glyph), Float64.new(x), Float64.new(y))
      nil
    end

    def draw_glyph_item(text : ::String?, glyph_item : Pango::GlyphItem, x : ::Int, y : ::Int)
      LibPango.renderer_draw_glyph_item(@pointer.as(LibPango::Renderer*), text ? text.to_unsafe : Pointer(UInt8).null, glyph_item.to_unsafe.as(LibPango::GlyphItem*), Int32.new(x), Int32.new(y))
      nil
    end

    def draw_glyphs(font : Pango::Font, glyphs : Pango::GlyphString, x : ::Int, y : ::Int)
      LibPango.renderer_draw_glyphs(@pointer.as(LibPango::Renderer*), font.to_unsafe_font, glyphs.to_unsafe.as(LibPango::GlyphString*), Int32.new(x), Int32.new(y))
      nil
    end

    def draw_layout(layout : Pango::Layout, x : ::Int, y : ::Int)
      LibPango.renderer_draw_layout(@pointer.as(LibPango::Renderer*), layout.to_unsafe_layout, Int32.new(x), Int32.new(y))
      nil
    end

    def draw_layout_line(line : Pango::LayoutLine, x : ::Int, y : ::Int)
      LibPango.renderer_draw_layout_line(@pointer.as(LibPango::Renderer*), line.to_unsafe.as(LibPango::LayoutLine*), Int32.new(x), Int32.new(y))
      nil
    end

    def draw_rectangle(part : Pango::RenderPart, x : ::Int, y : ::Int, width : ::Int, height : ::Int)
      LibPango.renderer_draw_rectangle(@pointer.as(LibPango::Renderer*), part, Int32.new(x), Int32.new(y), Int32.new(width), Int32.new(height))
      nil
    end

    def draw_trapezoid(part : Pango::RenderPart, y1_ : ::Float, x11 : ::Float, x21 : ::Float, y2 : ::Float, x12 : ::Float, x22 : ::Float)
      LibPango.renderer_draw_trapezoid(@pointer.as(LibPango::Renderer*), part, Float64.new(y1_), Float64.new(x11), Float64.new(x21), Float64.new(y2), Float64.new(x12), Float64.new(x22))
      nil
    end

    def alpha(part : Pango::RenderPart)
      __var0 = LibPango.renderer_get_alpha(@pointer.as(LibPango::Renderer*), part)
      __var0
    end

    def color(part : Pango::RenderPart)
      __var0 = LibPango.renderer_get_color(@pointer.as(LibPango::Renderer*), part)
      __var1 = Pango::Color.new(__var0) if __var0
      __var1
    end

    def layout
      __var0 = LibPango.renderer_get_layout(@pointer.as(LibPango::Renderer*))
      __var1 = Pango::Layout.new(__var0) if __var0
      __var1
    end

    def layout_line
      __var0 = LibPango.renderer_get_layout_line(@pointer.as(LibPango::Renderer*))
      __var1 = Pango::LayoutLine.new(__var0) if __var0
      __var1
    end

    def matrix
      __var0 = LibPango.renderer_get_matrix(@pointer.as(LibPango::Renderer*))
      __var1 = Pango::Matrix.new(__var0) if __var0
      __var1
    end

    def part_changed(part : Pango::RenderPart)
      LibPango.renderer_part_changed(@pointer.as(LibPango::Renderer*), part)
      nil
    end

    def set_alpha(part : Pango::RenderPart, alpha : ::Int)
      LibPango.renderer_set_alpha(@pointer.as(LibPango::Renderer*), part, UInt16.new(alpha))
      nil
    end

    def set_color(part : Pango::RenderPart, color : Pango::Color?)
      LibPango.renderer_set_color(@pointer.as(LibPango::Renderer*), part, color ? color.to_unsafe.as(LibPango::Color*) : Pointer(LibPango::Color).null)
      nil
    end

    def matrix=(matrix : Pango::Matrix?)
      LibPango.renderer_set_matrix(@pointer.as(LibPango::Renderer*), matrix ? matrix.to_unsafe.as(LibPango::Matrix*) : Pointer(LibPango::Matrix).null)
      nil
    end
  end

  class RendererClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(248u64, 0u8).as(LibPango::RendererClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibPango::RendererClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::RendererClass*)
    end

    def to_unsafe_rendererclass
      @pointer.not_nil!.as(LibPango::RendererClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibPango::RendererClass*).value.parent_class)
    end

    def draw_glyphs
      to_unsafe.as(LibPango::RendererClass*).value.draw_glyphs
    end

    def draw_rectangle
      to_unsafe.as(LibPango::RendererClass*).value.draw_rectangle
    end

    def draw_error_underline
      to_unsafe.as(LibPango::RendererClass*).value.draw_error_underline
    end

    def draw_shape
      to_unsafe.as(LibPango::RendererClass*).value.draw_shape
    end

    def draw_trapezoid
      to_unsafe.as(LibPango::RendererClass*).value.draw_trapezoid
    end

    def draw_glyph
      to_unsafe.as(LibPango::RendererClass*).value.draw_glyph
    end

    def part_changed
      to_unsafe.as(LibPango::RendererClass*).value.part_changed
    end

    def begin
      to_unsafe.as(LibPango::RendererClass*).value._begin
    end

    def end
      to_unsafe.as(LibPango::RendererClass*).value._end
    end

    def prepare_run
      to_unsafe.as(LibPango::RendererClass*).value.prepare_run
    end

    def draw_glyph_item
      to_unsafe.as(LibPango::RendererClass*).value.draw_glyph_item
    end

    def _pango_reserved2
      to_unsafe.as(LibPango::RendererClass*).value._pango_reserved2
    end

    def _pango_reserved3
      to_unsafe.as(LibPango::RendererClass*).value._pango_reserved3
    end

    def _pango_reserved4
      to_unsafe.as(LibPango::RendererClass*).value._pango_reserved4
    end
  end

  class RendererPrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibPango::RendererPrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::RendererPrivate*)
    end

    def to_unsafe_rendererprivate
      @pointer.not_nil!.as(LibPango::RendererPrivate*)
    end
  end

  enum Script : Int32
    INVALID_CODE          =  -1
    COMMON                =   0
    INHERITED             =   1
    ARABIC                =   2
    ARMENIAN              =   3
    BENGALI               =   4
    BOPOMOFO              =   5
    CHEROKEE              =   6
    COPTIC                =   7
    CYRILLIC              =   8
    DESERET               =   9
    DEVANAGARI            =  10
    ETHIOPIC              =  11
    GEORGIAN              =  12
    GOTHIC                =  13
    GREEK                 =  14
    GUJARATI              =  15
    GURMUKHI              =  16
    HAN                   =  17
    HANGUL                =  18
    HEBREW                =  19
    HIRAGANA              =  20
    KANNADA               =  21
    KATAKANA              =  22
    KHMER                 =  23
    LAO                   =  24
    LATIN                 =  25
    MALAYALAM             =  26
    MONGOLIAN             =  27
    MYANMAR               =  28
    OGHAM                 =  29
    OLD_ITALIC            =  30
    ORIYA                 =  31
    RUNIC                 =  32
    SINHALA               =  33
    SYRIAC                =  34
    TAMIL                 =  35
    TELUGU                =  36
    THAANA                =  37
    THAI                  =  38
    TIBETAN               =  39
    CANADIAN_ABORIGINAL   =  40
    YI                    =  41
    TAGALOG               =  42
    HANUNOO               =  43
    BUHID                 =  44
    TAGBANWA              =  45
    BRAILLE               =  46
    CYPRIOT               =  47
    LIMBU                 =  48
    OSMANYA               =  49
    SHAVIAN               =  50
    LINEAR_B              =  51
    TAI_LE                =  52
    UGARITIC              =  53
    NEW_TAI_LUE           =  54
    BUGINESE              =  55
    GLAGOLITIC            =  56
    TIFINAGH              =  57
    SYLOTI_NAGRI          =  58
    OLD_PERSIAN           =  59
    KHAROSHTHI            =  60
    UNKNOWN               =  61
    BALINESE              =  62
    CUNEIFORM             =  63
    PHOENICIAN            =  64
    PHAGS_PA              =  65
    NKO                   =  66
    KAYAH_LI              =  67
    LEPCHA                =  68
    REJANG                =  69
    SUNDANESE             =  70
    SAURASHTRA            =  71
    CHAM                  =  72
    OL_CHIKI              =  73
    VAI                   =  74
    CARIAN                =  75
    LYCIAN                =  76
    LYDIAN                =  77
    BATAK                 =  78
    BRAHMI                =  79
    MANDAIC               =  80
    CHAKMA                =  81
    MEROITIC_CURSIVE      =  82
    MEROITIC_HIEROGLYPHS  =  83
    MIAO                  =  84
    SHARADA               =  85
    SORA_SOMPENG          =  86
    TAKRI                 =  87
    BASSA_VAH             =  88
    CAUCASIAN_ALBANIAN    =  89
    DUPLOYAN              =  90
    ELBASAN               =  91
    GRANTHA               =  92
    KHOJKI                =  93
    KHUDAWADI             =  94
    LINEAR_A              =  95
    MAHAJANI              =  96
    MANICHAEAN            =  97
    MENDE_KIKAKUI         =  98
    MODI                  =  99
    MRO                   = 100
    NABATAEAN             = 101
    OLD_NORTH_ARABIAN     = 102
    OLD_PERMIC            = 103
    PAHAWH_HMONG          = 104
    PALMYRENE             = 105
    PAU_CIN_HAU           = 106
    PSALTER_PAHLAVI       = 107
    SIDDHAM               = 108
    TIRHUTA               = 109
    WARANG_CITI           = 110
    AHOM                  = 111
    ANATOLIAN_HIEROGLYPHS = 112
    HATRAN                = 113
    MULTANI               = 114
    OLD_HUNGARIAN         = 115
    SIGNWRITING           = 116
  end

  # Function for_unichar
  # Function get_sample_language

  class ScriptIter
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibPango::ScriptIter*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::ScriptIter*)
    end

    def to_unsafe_scriptiter
      @pointer.not_nil!.as(LibPango::ScriptIter*)
    end

    def self.new(text : ::String, length : ::Int) : self
      __var0 = LibPango.script_iter_new(text.to_unsafe, Int32.new(length))
      GObject.raise_unexpected_null("pango_script_iter_new") if __var0.null?
      cast(Pango::ScriptIter.new(__var0))
    end

    def free
      LibPango.script_iter_free(@pointer.as(LibPango::ScriptIter*))
      nil
    end

    def range(script : Pango::Script?)
      LibPango.script_iter_get_range(@pointer.as(LibPango::ScriptIter*), out start, out _end, script)
      {::String.new(start), ::String.new(_end)}
    end

    def next
      __var0 = LibPango.script_iter_next(@pointer.as(LibPango::ScriptIter*))
      (__var0 == 1)
    end
  end

  @[Flags]
  enum ShapeFlags : UInt32
    NONE            = 0
    ROUND_POSITIONS = 1
  end

  @[Flags]
  enum ShowFlags : UInt32
    NONE        = 0
    SPACES      = 1
    LINE_BREAKS = 2
    IGNORABLES  = 4
  end

  enum Stretch : UInt32
    ULTRA_CONDENSED = 0
    EXTRA_CONDENSED = 1
    CONDENSED       = 2
    SEMI_CONDENSED  = 3
    NORMAL          = 4
    SEMI_EXPANDED   = 5
    EXPANDED        = 6
    EXTRA_EXPANDED  = 7
    ULTRA_EXPANDED  = 8
  end

  enum Style : UInt32
    NORMAL  = 0
    OBLIQUE = 1
    ITALIC  = 2
  end

  enum TabAlign : UInt32
    LEFT = 0
  end

  class TabArray
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibPango::TabArray*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibPango::TabArray*)
    end

    def to_unsafe_tabarray
      @pointer.not_nil!.as(LibPango::TabArray*)
    end

    def self.new(initial_size : ::Int, positions_in_pixels : ::Bool) : self
      __var0 = LibPango.tab_array_new(Int32.new(initial_size), LibC::Int.new(positions_in_pixels ? 1 : 0))
      GObject.raise_unexpected_null("pango_tab_array_new") if __var0.null?
      cast(Pango::TabArray.new(__var0))
    end

    def copy
      __var0 = LibPango.tab_array_copy(@pointer.as(LibPango::TabArray*))
      GObject.raise_unexpected_null("pango_tab_array_copy") if __var0.null?
      Pango::TabArray.new(__var0)
    end

    def free
      LibPango.tab_array_free(@pointer.as(LibPango::TabArray*))
      nil
    end

    def positions_in_pixels
      __var0 = LibPango.tab_array_get_positions_in_pixels(@pointer.as(LibPango::TabArray*))
      (__var0 == 1)
    end

    def size
      __var0 = LibPango.tab_array_get_size(@pointer.as(LibPango::TabArray*))
      __var0
    end

    def tab(tab_index : ::Int, alignment : Pango::TabAlign?)
      LibPango.tab_array_get_tab(@pointer.as(LibPango::TabArray*), Int32.new(tab_index), alignment, out location)
      location
    end

    def tabs(alignments : Pango::TabAlign?, locations : ::Enumerable?)
      LibPango.tab_array_get_tabs(@pointer.as(LibPango::TabArray*), alignments, locations)
      nil
    end

    def resize(new_size : ::Int)
      LibPango.tab_array_resize(@pointer.as(LibPango::TabArray*), Int32.new(new_size))
      nil
    end

    def set_tab(tab_index : ::Int, alignment : Pango::TabAlign, location : ::Int)
      LibPango.tab_array_set_tab(@pointer.as(LibPango::TabArray*), Int32.new(tab_index), alignment, Int32.new(location))
      nil
    end
  end

  enum Underline : UInt32
    NONE   = 0
    SINGLE = 1
    DOUBLE = 2
    LOW    = 3
    ERROR  = 4
  end

  enum Variant : UInt32
    NORMAL     = 0
    SMALL_CAPS = 1
  end

  enum Weight : UInt32
    ZERO_NONE  =    0
    THIN       =  100
    ULTRALIGHT =  200
    LIGHT      =  300
    SEMILIGHT  =  350
    BOOK       =  380
    NORMAL     =  400
    MEDIUM     =  500
    SEMIBOLD   =  600
    BOLD       =  700
    ULTRABOLD  =  800
    HEAVY      =  900
    ULTRAHEAVY = 1000
  end

  enum WrapMode : UInt32
    WORD      = 0
    CHAR      = 1
    WORD_CHAR = 2
  end
end
