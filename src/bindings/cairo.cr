@[Link("cairo-gobject", pkg_config: "cairo-gobject")]
lib LibCairo
  ###########################################
  # #    Structs
  ###########################################

  struct Context # struct
    _data : UInt8[0]
  end

  fun _cairo_gobject_context_get_type = cairo_gobject_context_get_type : UInt64

  struct Device # struct
    _data : UInt8[0]
  end

  fun _cairo_gobject_device_get_type = cairo_gobject_device_get_type : UInt64

  struct Surface # struct
    _data : UInt8[0]
  end

  fun _cairo_gobject_surface_get_type = cairo_gobject_surface_get_type : UInt64

  struct Matrix # struct
    _data : UInt8[0]
  end

  struct Pattern # struct
    _data : UInt8[0]
  end

  fun _cairo_gobject_pattern_get_type = cairo_gobject_pattern_get_type : UInt64

  struct Region # struct
    _data : UInt8[0]
  end

  fun _cairo_gobject_region_get_type = cairo_gobject_region_get_type : UInt64

  struct FontOptions # struct
    _data : UInt8[0]
  end

  fun _cairo_gobject_font_options_get_type = cairo_gobject_font_options_get_type : UInt64

  struct FontFace # struct
    _data : UInt8[0]
  end

  fun _cairo_gobject_font_face_get_type = cairo_gobject_font_face_get_type : UInt64

  struct ScaledFont # struct
    _data : UInt8[0]
  end

  fun _cairo_gobject_scaled_font_get_type = cairo_gobject_scaled_font_get_type : UInt64

  struct Path # struct
    _data : UInt8[0]
  end

  struct Rectangle # struct
    x : Float64
    y : Float64
    width : Float64
    height : Float64
  end

  fun _cairo_gobject_rectangle_get_type = cairo_gobject_rectangle_get_type : UInt64

  struct RectangleInt # struct
    x : Int32
    y : Int32
    width : Int32
    height : Int32
  end

  fun _cairo_gobject_rectangle_int_get_type = cairo_gobject_rectangle_int_get_type : UInt64

  ###########################################
  # #    Enums
  ###########################################

  alias Status = UInt32

  alias Content = UInt32

  alias Operator = UInt32

  alias Antialias = UInt32

  alias FillRule = UInt32

  alias LineCap = UInt32

  alias LineJoin = UInt32

  alias TextClusterFlags = UInt32

  alias FontSlant = UInt32

  alias FontWeight = UInt32

  alias SubpixelOrder = UInt32

  alias HintStyle = UInt32

  alias HintMetrics = UInt32

  alias FontType = UInt32

  alias PathDataType = UInt32

  alias DeviceType = Int32

  alias SurfaceType = UInt32

  alias Format = Int32

  alias PatternType = UInt32

  alias Extend = UInt32

  alias Filter = UInt32

  alias RegionOverlap = UInt32

  ###########################################
  # #    Functions
  ###########################################
  fun image_surface_create = cairo_image_surface_create : Void
end

module Cairo
  def self.image_surface_create
    LibCairo.image_surface_create
    nil
  end

  class Context
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibCairo::Context*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibCairo::Context*)
    end

    def to_unsafe_context
      @pointer.not_nil!.as(LibCairo::Context*)
    end
  end

  class Device
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibCairo::Device*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibCairo::Device*)
    end

    def to_unsafe_device
      @pointer.not_nil!.as(LibCairo::Device*)
    end
  end

  class Surface
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibCairo::Surface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibCairo::Surface*)
    end

    def to_unsafe_surface
      @pointer.not_nil!.as(LibCairo::Surface*)
    end
  end

  class Matrix
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibCairo::Matrix*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibCairo::Matrix*)
    end

    def to_unsafe_matrix
      @pointer.not_nil!.as(LibCairo::Matrix*)
    end
  end

  class Pattern
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibCairo::Pattern*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibCairo::Pattern*)
    end

    def to_unsafe_pattern
      @pointer.not_nil!.as(LibCairo::Pattern*)
    end
  end

  class Region
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibCairo::Region*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibCairo::Region*)
    end

    def to_unsafe_region
      @pointer.not_nil!.as(LibCairo::Region*)
    end
  end

  enum Status : UInt32
    SUCCESS                   =  0
    NO_MEMORY                 =  1
    INVALID_RESTORE           =  2
    INVALID_POP_GROUP         =  3
    NO_CURRENT_POINT          =  4
    INVALID_MATRIX            =  5
    INVALID_STATUS            =  6
    NULL_POINTER              =  7
    INVALID_STRING            =  8
    INVALID_PATH_DATA         =  9
    READ_ERROR                = 10
    WRITE_ERROR               = 11
    SURFACE_FINISHED          = 12
    SURFACE_TYPE_MISMATCH     = 13
    PATTERN_TYPE_MISMATCH     = 14
    INVALID_CONTENT           = 15
    INVALID_FORMAT            = 16
    INVALID_VISUAL            = 17
    FILE_NOT_FOUND            = 18
    INVALID_DASH              = 19
    INVALID_DSC_COMMENT       = 20
    INVALID_INDEX             = 21
    CLIP_NOT_REPRESENTABLE    = 22
    TEMP_FILE_ERROR           = 23
    INVALID_STRIDE            = 24
    FONT_TYPE_MISMATCH        = 25
    USER_FONT_IMMUTABLE       = 26
    USER_FONT_ERROR           = 27
    NEGATIVE_COUNT            = 28
    INVALID_CLUSTERS          = 29
    INVALID_SLANT             = 30
    INVALID_WEIGHT            = 31
    INVALID_SIZE              = 32
    USER_FONT_NOT_IMPLEMENTED = 33
    DEVICE_TYPE_MISMATCH      = 34
    DEVICE_ERROR              = 35
    INVALID_MESH_CONSTRUCTION = 36
    DEVICE_FINISHED           = 37
    JBIG2_GLOBAL_MISSING      = 38
  end

  enum Content : UInt32
    ZERO_NONE   =     0
    COLOR       =  4096
    ALPHA       =  8192
    COLOR_ALPHA = 12288
  end

  enum Operator : UInt32
    CLEAR          =  0
    SOURCE         =  1
    OVER           =  2
    IN             =  3
    OUT            =  4
    ATOP           =  5
    DEST           =  6
    DEST_OVER      =  7
    DEST_IN        =  8
    DEST_OUT       =  9
    DEST_ATOP      = 10
    XOR            = 11
    ADD            = 12
    SATURATE       = 13
    MULTIPLY       = 14
    SCREEN         = 15
    OVERLAY        = 16
    DARKEN         = 17
    LIGHTEN        = 18
    COLOR_DODGE    = 19
    COLOR_BURN     = 20
    HARD_LIGHT     = 21
    SOFT_LIGHT     = 22
    DIFFERENCE     = 23
    EXCLUSION      = 24
    HSL_HUE        = 25
    HSL_SATURATION = 26
    HSL_COLOR      = 27
    HSL_LUMINOSITY = 28
  end

  enum Antialias : UInt32
    DEFAULT  = 0
    NONE     = 1
    GRAY     = 2
    SUBPIXEL = 3
    FAST     = 4
    GOOD     = 5
    BEST     = 6
  end

  enum FillRule : UInt32
    WINDING  = 0
    EVEN_ODD = 1
  end

  enum LineCap : UInt32
    BUTT   = 0
    ROUND  = 1
    SQUARE = 2
  end

  enum LineJoin : UInt32
    MITER = 0
    ROUND = 1
    BEVEL = 2
  end

  enum TextClusterFlags : UInt32
    ZERO_NONE = 0
    BACKWARD  = 1
  end

  enum FontSlant : UInt32
    NORMAL  = 0
    ITALIC  = 1
    OBLIQUE = 2
  end

  enum FontWeight : UInt32
    NORMAL = 0
    BOLD   = 1
  end

  enum SubpixelOrder : UInt32
    DEFAULT = 0
    RGB     = 1
    BGR     = 2
    VRGB    = 3
    VBGR    = 4
  end

  enum HintStyle : UInt32
    DEFAULT = 0
    NONE    = 1
    SLIGHT  = 2
    MEDIUM  = 3
    FULL    = 4
  end

  enum HintMetrics : UInt32
    DEFAULT = 0
    OFF     = 1
    ON      = 2
  end

  class FontOptions
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibCairo::FontOptions*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibCairo::FontOptions*)
    end

    def to_unsafe_fontoptions
      @pointer.not_nil!.as(LibCairo::FontOptions*)
    end
  end

  enum FontType : UInt32
    TOY    = 0
    FT     = 1
    WIN32  = 2
    QUARTZ = 3
    USER   = 4
  end

  enum PathDataType : UInt32
    MOVE_TO    = 0
    LINE_TO    = 1
    CURVE_TO   = 2
    CLOSE_PATH = 3
  end

  enum DeviceType : Int32
    DRM     =  0
    GL      =  1
    SCRIPT  =  2
    XCB     =  3
    XLIB    =  4
    XML     =  5
    COGL    =  6
    WIN32   =  7
    INVALID = -1
  end

  enum SurfaceType : UInt32
    IMAGE          =  0
    PDF            =  1
    PS             =  2
    XLIB           =  3
    XCB            =  4
    GLITZ          =  5
    QUARTZ         =  6
    WIN32          =  7
    BEOS           =  8
    DIRECTFB       =  9
    SVG            = 10
    OS2            = 11
    WIN32_PRINTING = 12
    QUARTZ_IMAGE   = 13
    SCRIPT         = 14
    QT             = 15
    RECORDING      = 16
    VG             = 17
    GL             = 18
    DRM            = 19
    TEE            = 20
    XML            = 21
    SKIA           = 22
    SUBSURFACE     = 23
    COGL           = 24
  end

  enum Format : Int32
    INVALID   = -1
    ARGB32    =  0
    RGB24     =  1
    A8        =  2
    A1        =  3
    RGB16_565 =  4
    RGB30     =  5
  end

  enum PatternType : UInt32
    SOLID         = 0
    SURFACE       = 1
    LINEAR        = 2
    RADIAL        = 3
    MESH          = 4
    RASTER_SOURCE = 5
  end

  enum Extend : UInt32
    NONE    = 0
    REPEAT  = 1
    REFLECT = 2
    PAD     = 3
  end

  enum Filter : UInt32
    FAST     = 0
    GOOD     = 1
    BEST     = 2
    NEAREST  = 3
    BILINEAR = 4
    GAUSSIAN = 5
  end

  enum RegionOverlap : UInt32
    IN   = 0
    OUT  = 1
    PART = 2
  end

  class FontFace
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibCairo::FontFace*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibCairo::FontFace*)
    end

    def to_unsafe_fontface
      @pointer.not_nil!.as(LibCairo::FontFace*)
    end
  end

  class ScaledFont
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibCairo::ScaledFont*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibCairo::ScaledFont*)
    end

    def to_unsafe_scaledfont
      @pointer.not_nil!.as(LibCairo::ScaledFont*)
    end
  end

  class Path
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibCairo::Path*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibCairo::Path*)
    end

    def to_unsafe_path
      @pointer.not_nil!.as(LibCairo::Path*)
    end
  end

  class Rectangle
    include GObject::WrappedType

    def self.new(x : Float64? = nil, y : Float64? = nil, width : Float64? = nil, height : Float64? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(32u64, 0u8).as(LibCairo::Rectangle*))
      __var0.x = x unless x.nil?
      __var0.y = y unless y.nil?
      __var0.width = width unless width.nil?
      __var0.height = height unless height.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibCairo::Rectangle*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibCairo::Rectangle*)
    end

    def to_unsafe_rectangle
      @pointer.not_nil!.as(LibCairo::Rectangle*)
    end

    def x
      to_unsafe.as(LibCairo::Rectangle*).value.x
    end

    def x=(value : Float64)
      to_unsafe.as(LibCairo::Rectangle*).value.x = Float64.new(value)
    end

    def y
      to_unsafe.as(LibCairo::Rectangle*).value.y
    end

    def y=(value : Float64)
      to_unsafe.as(LibCairo::Rectangle*).value.y = Float64.new(value)
    end

    def width
      to_unsafe.as(LibCairo::Rectangle*).value.width
    end

    def width=(value : Float64)
      to_unsafe.as(LibCairo::Rectangle*).value.width = Float64.new(value)
    end

    def height
      to_unsafe.as(LibCairo::Rectangle*).value.height
    end

    def height=(value : Float64)
      to_unsafe.as(LibCairo::Rectangle*).value.height = Float64.new(value)
    end
  end

  class RectangleInt
    include GObject::WrappedType

    def self.new(x : Int32? = nil, y : Int32? = nil, width : Int32? = nil, height : Int32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibCairo::RectangleInt*))
      __var0.x = x unless x.nil?
      __var0.y = y unless y.nil?
      __var0.width = width unless width.nil?
      __var0.height = height unless height.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibCairo::RectangleInt*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibCairo::RectangleInt*)
    end

    def to_unsafe_rectangleint
      @pointer.not_nil!.as(LibCairo::RectangleInt*)
    end

    def x
      to_unsafe.as(LibCairo::RectangleInt*).value.x
    end

    def x=(value : Int32)
      to_unsafe.as(LibCairo::RectangleInt*).value.x = Int32.new(value)
    end

    def y
      to_unsafe.as(LibCairo::RectangleInt*).value.y
    end

    def y=(value : Int32)
      to_unsafe.as(LibCairo::RectangleInt*).value.y = Int32.new(value)
    end

    def width
      to_unsafe.as(LibCairo::RectangleInt*).value.width
    end

    def width=(value : Int32)
      to_unsafe.as(LibCairo::RectangleInt*).value.width = Int32.new(value)
    end

    def height
      to_unsafe.as(LibCairo::RectangleInt*).value.height
    end

    def height=(value : Int32)
      to_unsafe.as(LibCairo::RectangleInt*).value.height = Int32.new(value)
    end
  end
end
