require_gobject("GObject", "2.0")
require_gobject("Gio", "2.0")
require_gobject("GLib", "2.0")
require_gobject("GModule", "2.0")

@[Link("gdk_pixbuf-2.0", pkg_config: "gdk_pixbuf-2.0")]
lib LibGdkPixbuf
  ###########################################
  # #    Enums
  ###########################################

  alias Colorspace = UInt32

  alias InterpType = UInt32

  alias PixbufAlphaMode = UInt32

  alias PixbufError = UInt32
  fun pixbuf_error_quark = gdk_pixbuf_error_quark : UInt32

  alias PixbufRotation = UInt32

  ###########################################
  # #    Constants
  ###########################################
  PIXBUF_FEATURES_H =  1       # : Int32
  PIXBUF_MAJOR      =  2       # : Int32
  PIXBUF_MICRO      =  0       # : Int32
  PIXBUF_MINOR      = 40       # : Int32
  PIXBUF_VERSION    = "2.40.0" # : Pointer(UInt8)

  ###########################################
  # #    Objects
  ###########################################

  struct Pixbuf # object
    _data : UInt8[0]
    # Property bits-per-sample : Int32
    # Property colorspace : LibGdkPixbuf::Colorspace
    # Property has-alpha : LibC::Int
    # Property height : Int32
    # Property n-channels : Int32
    # Property pixel-bytes : LibGLib::Bytes
    # Property pixels : Pointer(Void)
    # Property rowstride : Int32
    # Property width : Int32
  end

  fun _gdk_pixbuf_get_type = gdk_pixbuf_get_type : UInt64
  fun pixbuf_new = gdk_pixbuf_new(colorspace : LibGdkPixbuf::Colorspace, has_alpha : LibC::Int, bits_per_sample : Int32, width : Int32, height : Int32) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_new_from_bytes = gdk_pixbuf_new_from_bytes(data : Pointer(LibGLib::Bytes), colorspace : LibGdkPixbuf::Colorspace, has_alpha : LibC::Int, bits_per_sample : Int32, width : Int32, height : Int32, rowstride : Int32) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_new_from_data = gdk_pixbuf_new_from_data(data : Pointer(UInt8), colorspace : LibGdkPixbuf::Colorspace, has_alpha : LibC::Int, bits_per_sample : Int32, width : Int32, height : Int32, rowstride : Int32, destroy_fn : LibGdkPixbuf::PixbufDestroyNotify, destroy_fn_data : Pointer(Void)) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_new_from_file = gdk_pixbuf_new_from_file(filename : Pointer(UInt8), error : LibGLib::Error**) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_new_from_file_at_scale = gdk_pixbuf_new_from_file_at_scale(filename : Pointer(UInt8), width : Int32, height : Int32, preserve_aspect_ratio : LibC::Int, error : LibGLib::Error**) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_new_from_file_at_size = gdk_pixbuf_new_from_file_at_size(filename : Pointer(UInt8), width : Int32, height : Int32, error : LibGLib::Error**) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_new_from_inline = gdk_pixbuf_new_from_inline(data_length : Int32, data : Pointer(UInt8), copy_pixels : LibC::Int, error : LibGLib::Error**) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_new_from_resource = gdk_pixbuf_new_from_resource(resource_path : Pointer(UInt8), error : LibGLib::Error**) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_new_from_resource_at_scale = gdk_pixbuf_new_from_resource_at_scale(resource_path : Pointer(UInt8), width : Int32, height : Int32, preserve_aspect_ratio : LibC::Int, error : LibGLib::Error**) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_new_from_stream = gdk_pixbuf_new_from_stream(stream : Pointer(LibGio::InputStream), cancellable : Pointer(LibGio::Cancellable), error : LibGLib::Error**) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_new_from_stream_at_scale = gdk_pixbuf_new_from_stream_at_scale(stream : Pointer(LibGio::InputStream), width : Int32, height : Int32, preserve_aspect_ratio : LibC::Int, cancellable : Pointer(LibGio::Cancellable), error : LibGLib::Error**) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_new_from_stream_finish = gdk_pixbuf_new_from_stream_finish(async_result : Pointer(LibGio::AsyncResult), error : LibGLib::Error**) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_new_from_xpm_data = gdk_pixbuf_new_from_xpm_data(data : Pointer(Pointer(UInt8))) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_calculate_rowstride = gdk_pixbuf_calculate_rowstride(colorspace : LibGdkPixbuf::Colorspace, has_alpha : LibC::Int, bits_per_sample : Int32, width : Int32, height : Int32) : Int32
  fun pixbuf_get_file_info = gdk_pixbuf_get_file_info(filename : Pointer(UInt8), width : Int32*, height : Int32*) : Pointer(LibGdkPixbuf::PixbufFormat)
  fun pixbuf_get_file_info_async = gdk_pixbuf_get_file_info_async(filename : Pointer(UInt8), cancellable : Pointer(LibGio::Cancellable), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun pixbuf_get_file_info_finish = gdk_pixbuf_get_file_info_finish(async_result : Pointer(LibGio::AsyncResult), width : Int32*, height : Int32*, error : LibGLib::Error**) : Pointer(LibGdkPixbuf::PixbufFormat)
  fun pixbuf_get_formats = gdk_pixbuf_get_formats : Pointer(Void*)
  fun pixbuf_init_modules = gdk_pixbuf_init_modules(path : Pointer(UInt8), error : LibGLib::Error**) : LibC::Int
  fun pixbuf_new_from_stream_async = gdk_pixbuf_new_from_stream_async(stream : Pointer(LibGio::InputStream), cancellable : Pointer(LibGio::Cancellable), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun pixbuf_new_from_stream_at_scale_async = gdk_pixbuf_new_from_stream_at_scale_async(stream : Pointer(LibGio::InputStream), width : Int32, height : Int32, preserve_aspect_ratio : LibC::Int, cancellable : Pointer(LibGio::Cancellable), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun pixbuf_save_to_stream_finish = gdk_pixbuf_save_to_stream_finish(async_result : Pointer(LibGio::AsyncResult), error : LibGLib::Error**) : LibC::Int
  fun pixbuf_add_alpha = gdk_pixbuf_add_alpha(this : Pixbuf*, substitute_color : LibC::Int, r : UInt8, g : UInt8, b : UInt8) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_apply_embedded_orientation = gdk_pixbuf_apply_embedded_orientation(this : Pixbuf*) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_composite = gdk_pixbuf_composite(this : Pixbuf*, dest : Pointer(LibGdkPixbuf::Pixbuf), dest_x : Int32, dest_y : Int32, dest_width : Int32, dest_height : Int32, offset_x : Float64, offset_y : Float64, scale_x : Float64, scale_y : Float64, interp_type : LibGdkPixbuf::InterpType, overall_alpha : Int32) : Void
  fun pixbuf_composite_color = gdk_pixbuf_composite_color(this : Pixbuf*, dest : Pointer(LibGdkPixbuf::Pixbuf), dest_x : Int32, dest_y : Int32, dest_width : Int32, dest_height : Int32, offset_x : Float64, offset_y : Float64, scale_x : Float64, scale_y : Float64, interp_type : LibGdkPixbuf::InterpType, overall_alpha : Int32, check_x : Int32, check_y : Int32, check_size : Int32, color1 : UInt32, color2 : UInt32) : Void
  fun pixbuf_composite_color_simple = gdk_pixbuf_composite_color_simple(this : Pixbuf*, dest_width : Int32, dest_height : Int32, interp_type : LibGdkPixbuf::InterpType, overall_alpha : Int32, check_size : Int32, color1 : UInt32, color2 : UInt32) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_copy = gdk_pixbuf_copy(this : Pixbuf*) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_copy_area = gdk_pixbuf_copy_area(this : Pixbuf*, src_x : Int32, src_y : Int32, width : Int32, height : Int32, dest_pixbuf : Pointer(LibGdkPixbuf::Pixbuf), dest_x : Int32, dest_y : Int32) : Void
  fun pixbuf_copy_options = gdk_pixbuf_copy_options(this : Pixbuf*, dest_pixbuf : Pointer(LibGdkPixbuf::Pixbuf)) : LibC::Int
  fun pixbuf_fill = gdk_pixbuf_fill(this : Pixbuf*, pixel : UInt32) : Void
  fun pixbuf_flip = gdk_pixbuf_flip(this : Pixbuf*, horizontal : LibC::Int) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_get_bits_per_sample = gdk_pixbuf_get_bits_per_sample(this : Pixbuf*) : Int32
  fun pixbuf_get_byte_length = gdk_pixbuf_get_byte_length(this : Pixbuf*) : UInt64
  fun pixbuf_get_colorspace = gdk_pixbuf_get_colorspace(this : Pixbuf*) : LibGdkPixbuf::Colorspace
  fun pixbuf_get_has_alpha = gdk_pixbuf_get_has_alpha(this : Pixbuf*) : LibC::Int
  fun pixbuf_get_height = gdk_pixbuf_get_height(this : Pixbuf*) : Int32
  fun pixbuf_get_n_channels = gdk_pixbuf_get_n_channels(this : Pixbuf*) : Int32
  fun pixbuf_get_option = gdk_pixbuf_get_option(this : Pixbuf*, key : Pointer(UInt8)) : Pointer(UInt8)
  fun pixbuf_get_options = gdk_pixbuf_get_options(this : Pixbuf*) : Pointer(Void*)
  fun pixbuf_get_pixels = gdk_pixbuf_get_pixels_with_length(this : Pixbuf*, length : UInt32*) : Pointer(UInt8)
  fun pixbuf_get_rowstride = gdk_pixbuf_get_rowstride(this : Pixbuf*) : Int32
  fun pixbuf_get_width = gdk_pixbuf_get_width(this : Pixbuf*) : Int32
  fun pixbuf_new_subpixbuf = gdk_pixbuf_new_subpixbuf(this : Pixbuf*, src_x : Int32, src_y : Int32, width : Int32, height : Int32) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_read_pixel_bytes = gdk_pixbuf_read_pixel_bytes(this : Pixbuf*) : Pointer(LibGLib::Bytes)
  fun pixbuf_read_pixels = gdk_pixbuf_read_pixels(this : Pixbuf*) : Pointer(UInt8)
  fun pixbuf_remove_option = gdk_pixbuf_remove_option(this : Pixbuf*, key : Pointer(UInt8)) : LibC::Int
  fun pixbuf_rotate_simple = gdk_pixbuf_rotate_simple(this : Pixbuf*, angle : LibGdkPixbuf::PixbufRotation) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_saturate_and_pixelate = gdk_pixbuf_saturate_and_pixelate(this : Pixbuf*, dest : Pointer(LibGdkPixbuf::Pixbuf), saturation : Float32, pixelate : LibC::Int) : Void
  fun pixbuf_save_to_bufferv = gdk_pixbuf_save_to_bufferv(this : Pixbuf*, buffer : Pointer(UInt8)*, buffer_size : UInt64*, type : Pointer(UInt8), option_keys : Pointer(Pointer(UInt8)), option_values : Pointer(Pointer(UInt8)), error : LibGLib::Error**) : LibC::Int
  fun pixbuf_save_to_callbackv = gdk_pixbuf_save_to_callbackv(this : Pixbuf*, save_func : LibGdkPixbuf::PixbufSaveFunc, user_data : Pointer(Void), type : Pointer(UInt8), option_keys : Pointer(Pointer(UInt8)), option_values : Pointer(Pointer(UInt8)), error : LibGLib::Error**) : LibC::Int
  fun pixbuf_save_to_streamv = gdk_pixbuf_save_to_streamv(this : Pixbuf*, stream : Pointer(LibGio::OutputStream), type : Pointer(UInt8), option_keys : Pointer(Pointer(UInt8)), option_values : Pointer(Pointer(UInt8)), cancellable : Pointer(LibGio::Cancellable), error : LibGLib::Error**) : LibC::Int
  fun pixbuf_save_to_streamv_async = gdk_pixbuf_save_to_streamv_async(this : Pixbuf*, stream : Pointer(LibGio::OutputStream), type : Pointer(UInt8), option_keys : Pointer(Pointer(UInt8)), option_values : Pointer(Pointer(UInt8)), cancellable : Pointer(LibGio::Cancellable), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun pixbuf_savev = gdk_pixbuf_savev(this : Pixbuf*, filename : Pointer(UInt8), type : Pointer(UInt8), option_keys : Pointer(Pointer(UInt8)), option_values : Pointer(Pointer(UInt8)), error : LibGLib::Error**) : LibC::Int
  fun pixbuf_scale = gdk_pixbuf_scale(this : Pixbuf*, dest : Pointer(LibGdkPixbuf::Pixbuf), dest_x : Int32, dest_y : Int32, dest_width : Int32, dest_height : Int32, offset_x : Float64, offset_y : Float64, scale_x : Float64, scale_y : Float64, interp_type : LibGdkPixbuf::InterpType) : Void
  fun pixbuf_scale_simple = gdk_pixbuf_scale_simple(this : Pixbuf*, dest_width : Int32, dest_height : Int32, interp_type : LibGdkPixbuf::InterpType) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_set_option = gdk_pixbuf_set_option(this : Pixbuf*, key : Pointer(UInt8), value : Pointer(UInt8)) : LibC::Int

  struct PixbufAnimation # object
    _data : UInt8[0]
  end

  fun _gdk_pixbuf_animation_get_type = gdk_pixbuf_animation_get_type : UInt64
  fun pixbuf_animation_new_from_file = gdk_pixbuf_animation_new_from_file(filename : Pointer(UInt8), error : LibGLib::Error**) : Pointer(LibGdkPixbuf::PixbufAnimation)
  fun pixbuf_animation_new_from_resource = gdk_pixbuf_animation_new_from_resource(resource_path : Pointer(UInt8), error : LibGLib::Error**) : Pointer(LibGdkPixbuf::PixbufAnimation)
  fun pixbuf_animation_new_from_stream = gdk_pixbuf_animation_new_from_stream(stream : Pointer(LibGio::InputStream), cancellable : Pointer(LibGio::Cancellable), error : LibGLib::Error**) : Pointer(LibGdkPixbuf::PixbufAnimation)
  fun pixbuf_animation_new_from_stream_finish = gdk_pixbuf_animation_new_from_stream_finish(async_result : Pointer(LibGio::AsyncResult), error : LibGLib::Error**) : Pointer(LibGdkPixbuf::PixbufAnimation)
  fun pixbuf_animation_new_from_stream_async = gdk_pixbuf_animation_new_from_stream_async(stream : Pointer(LibGio::InputStream), cancellable : Pointer(LibGio::Cancellable), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun pixbuf_animation_get_height = gdk_pixbuf_animation_get_height(this : PixbufAnimation*) : Int32
  fun pixbuf_animation_get_iter = gdk_pixbuf_animation_get_iter(this : PixbufAnimation*, start_time : Pointer(LibGLib::TimeVal)) : Pointer(LibGdkPixbuf::PixbufAnimationIter)
  fun pixbuf_animation_get_static_image = gdk_pixbuf_animation_get_static_image(this : PixbufAnimation*) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_animation_get_width = gdk_pixbuf_animation_get_width(this : PixbufAnimation*) : Int32
  fun pixbuf_animation_is_static_image = gdk_pixbuf_animation_is_static_image(this : PixbufAnimation*) : LibC::Int

  struct PixbufAnimationIter # object
    _data : UInt8[0]
  end

  fun _gdk_pixbuf_animation_iter_get_type = gdk_pixbuf_animation_iter_get_type : UInt64
  fun pixbuf_animation_iter_advance = gdk_pixbuf_animation_iter_advance(this : PixbufAnimationIter*, current_time : Pointer(LibGLib::TimeVal)) : LibC::Int
  fun pixbuf_animation_iter_get_delay_time = gdk_pixbuf_animation_iter_get_delay_time(this : PixbufAnimationIter*) : Int32
  fun pixbuf_animation_iter_get_pixbuf = gdk_pixbuf_animation_iter_get_pixbuf(this : PixbufAnimationIter*) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_animation_iter_on_currently_loading_frame = gdk_pixbuf_animation_iter_on_currently_loading_frame(this : PixbufAnimationIter*) : LibC::Int

  struct PixbufLoader # object
    parent_instance : LibGObject::Object
    priv : Pointer(Void)
    # Signal area-prepared
    # Signal area-updated
    # Signal closed
    # Signal size-prepared
    # Virtual function area_prepared
    # Virtual function area_updated
    # Virtual function closed
    # Virtual function size_prepared
  end

  fun _gdk_pixbuf_loader_get_type = gdk_pixbuf_loader_get_type : UInt64
  fun pixbuf_loader_new = gdk_pixbuf_loader_new : Pointer(LibGdkPixbuf::PixbufLoader)
  fun pixbuf_loader_new_with_mime_type = gdk_pixbuf_loader_new_with_mime_type(mime_type : Pointer(UInt8), error : LibGLib::Error**) : Pointer(LibGdkPixbuf::PixbufLoader)
  fun pixbuf_loader_new_with_type = gdk_pixbuf_loader_new_with_type(image_type : Pointer(UInt8), error : LibGLib::Error**) : Pointer(LibGdkPixbuf::PixbufLoader)
  fun pixbuf_loader_close = gdk_pixbuf_loader_close(this : PixbufLoader*, error : LibGLib::Error**) : LibC::Int
  fun pixbuf_loader_get_animation = gdk_pixbuf_loader_get_animation(this : PixbufLoader*) : Pointer(LibGdkPixbuf::PixbufAnimation)
  fun pixbuf_loader_get_format = gdk_pixbuf_loader_get_format(this : PixbufLoader*) : Pointer(LibGdkPixbuf::PixbufFormat)
  fun pixbuf_loader_get_pixbuf = gdk_pixbuf_loader_get_pixbuf(this : PixbufLoader*) : Pointer(LibGdkPixbuf::Pixbuf)
  fun pixbuf_loader_set_size = gdk_pixbuf_loader_set_size(this : PixbufLoader*, width : Int32, height : Int32) : Void
  fun pixbuf_loader_write = gdk_pixbuf_loader_write(this : PixbufLoader*, buf : Pointer(UInt8), count : UInt64, error : LibGLib::Error**) : LibC::Int
  fun pixbuf_loader_write_bytes = gdk_pixbuf_loader_write_bytes(this : PixbufLoader*, buffer : Pointer(LibGLib::Bytes), error : LibGLib::Error**) : LibC::Int

  struct PixbufSimpleAnim # object
    _data : UInt8[0]
    # Property loop : LibC::Int
  end

  fun _gdk_pixbuf_simple_anim_get_type = gdk_pixbuf_simple_anim_get_type : UInt64
  fun pixbuf_simple_anim_new = gdk_pixbuf_simple_anim_new(width : Int32, height : Int32, rate : Float32) : Pointer(LibGdkPixbuf::PixbufSimpleAnim)
  fun pixbuf_simple_anim_add_frame = gdk_pixbuf_simple_anim_add_frame(this : PixbufSimpleAnim*, pixbuf : Pointer(LibGdkPixbuf::Pixbuf)) : Void
  fun pixbuf_simple_anim_get_loop = gdk_pixbuf_simple_anim_get_loop(this : PixbufSimpleAnim*) : LibC::Int
  fun pixbuf_simple_anim_set_loop = gdk_pixbuf_simple_anim_set_loop(this : PixbufSimpleAnim*, loop : LibC::Int) : Void

  struct PixbufSimpleAnimIter # object
    _data : UInt8[0]
  end

  fun _gdk_pixbuf_simple_anim_iter_get_type = gdk_pixbuf_simple_anim_iter_get_type : UInt64

  ###########################################
  # #    Structs
  ###########################################

  struct PixbufFormat # struct
    _data : UInt8[0]
  end

  fun _gdk_pixbuf_format_get_type = gdk_pixbuf_format_get_type : UInt64
  fun pixbuf_format_copy = gdk_pixbuf_format_copy(this : PixbufFormat*) : Pointer(LibGdkPixbuf::PixbufFormat)
  fun pixbuf_format_free = gdk_pixbuf_format_free(this : PixbufFormat*) : Void
  fun pixbuf_format_get_description = gdk_pixbuf_format_get_description(this : PixbufFormat*) : Pointer(UInt8)
  fun pixbuf_format_get_extensions = gdk_pixbuf_format_get_extensions(this : PixbufFormat*) : Pointer(Pointer(UInt8))
  fun pixbuf_format_get_license = gdk_pixbuf_format_get_license(this : PixbufFormat*) : Pointer(UInt8)
  fun pixbuf_format_get_mime_types = gdk_pixbuf_format_get_mime_types(this : PixbufFormat*) : Pointer(Pointer(UInt8))
  fun pixbuf_format_get_name = gdk_pixbuf_format_get_name(this : PixbufFormat*) : Pointer(UInt8)
  fun pixbuf_format_is_disabled = gdk_pixbuf_format_is_disabled(this : PixbufFormat*) : LibC::Int
  fun pixbuf_format_is_save_option_supported = gdk_pixbuf_format_is_save_option_supported(this : PixbufFormat*, option_key : Pointer(UInt8)) : LibC::Int
  fun pixbuf_format_is_scalable = gdk_pixbuf_format_is_scalable(this : PixbufFormat*) : LibC::Int
  fun pixbuf_format_is_writable = gdk_pixbuf_format_is_writable(this : PixbufFormat*) : LibC::Int
  fun pixbuf_format_set_disabled = gdk_pixbuf_format_set_disabled(this : PixbufFormat*, disabled : LibC::Int) : Void

  struct PixbufLoaderClass # struct
    parent_class : LibGObject::ObjectClass
    size_prepared : Pointer(LibGdkPixbuf::PixbufLoader), Int32, Int32 -> Void
    area_prepared : Pointer(LibGdkPixbuf::PixbufLoader) -> Void
    area_updated : Pointer(LibGdkPixbuf::PixbufLoader), Int32, Int32, Int32, Int32 -> Void
    closed : Pointer(LibGdkPixbuf::PixbufLoader) -> Void
  end

  struct PixbufSimpleAnimClass # struct
    _data : UInt8[0]
  end

  ###########################################
  # #    Functions
  ###########################################
  fun pixbuf_error_quark = gdk_pixbuf_error_quark : UInt32

  ###########################################
  # #    Callbacks
  ###########################################
  alias PixbufDestroyNotify = Pointer(UInt8), Pointer(Void) -> Void
  alias PixbufSaveFunc = Pointer(UInt8), UInt64, Pointer(LibGLib::Error*), Pointer(Void) -> LibC::Int
end

module GdkPixbuf
  PIXBUF_FEATURES_H = LibGdkPixbuf::PIXBUF_FEATURES_H
  PIXBUF_MAJOR      = LibGdkPixbuf::PIXBUF_MAJOR
  PIXBUF_MICRO      = LibGdkPixbuf::PIXBUF_MICRO
  PIXBUF_MINOR      = LibGdkPixbuf::PIXBUF_MINOR
  PIXBUF_VERSION    = LibGdkPixbuf::PIXBUF_VERSION

  def self.pixbuf_error_quark
    __var0 = LibGdkPixbuf.pixbuf_error_quark
    __var0
  end

  enum Colorspace : UInt32
    RGB = 0
  end

  enum InterpType : UInt32
    NEAREST  = 0
    TILES    = 1
    BILINEAR = 2
    HYPER    = 3
  end

  class Pixbuf < GObject::Object
    include Gio::Icon
    include Gio::LoadableIcon

    @pointer : Void*

    def initialize(pointer : LibGdkPixbuf::Pixbuf*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkPixbuf")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdkPixbuf._gdk_pixbuf_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdkPixbuf::Pixbuf*)
    end

    def to_unsafe_pixbuf
      @pointer.not_nil!.as(LibGdkPixbuf::Pixbuf*)
    end

    def initialize(*, bits_per_sample : Int32? = nil, colorspace : GdkPixbuf::Colorspace? = nil, has_alpha : ::Bool? = nil, height : Int32? = nil, n_channels : Int32? = nil, pixel_bytes : GLib::Bytes? = nil, pixels : Void*? = nil, rowstride : Int32? = nil, width : Int32? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless bits_per_sample.nil?
        __var0 << "bits-per-sample".to_unsafe
        __var1 << bits_per_sample.to_gvalue.to_unsafe.value
      end

      unless colorspace.nil?
        __var0 << "colorspace".to_unsafe
        __var1 << colorspace.to_gvalue.to_unsafe.value
      end

      unless has_alpha.nil?
        __var0 << "has-alpha".to_unsafe
        __var1 << has_alpha.to_gvalue.to_unsafe.value
      end

      unless height.nil?
        __var0 << "height".to_unsafe
        __var1 << height.to_gvalue.to_unsafe.value
      end

      unless n_channels.nil?
        __var0 << "n-channels".to_unsafe
        __var1 << n_channels.to_gvalue.to_unsafe.value
      end

      unless pixel_bytes.nil?
        __var0 << "pixel-bytes".to_unsafe
        __var1 << pixel_bytes.to_gvalue.to_unsafe.value
      end

      unless pixels.nil?
        __var0 << "pixels".to_unsafe
        __var1 << pixels.to_gvalue.to_unsafe.value
      end

      unless rowstride.nil?
        __var0 << "rowstride".to_unsafe
        __var1 << rowstride.to_gvalue.to_unsafe.value
      end

      unless width.nil?
        __var0 << "width".to_unsafe
        __var1 << width.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGdkPixbuf._gdk_pixbuf_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new(colorspace : GdkPixbuf::Colorspace, has_alpha : ::Bool, bits_per_sample : ::Int, width : ::Int, height : ::Int) : self
      __var0 = LibGdkPixbuf.pixbuf_new(colorspace, LibC::Int.new(has_alpha ? 1 : 0), Int32.new(bits_per_sample), Int32.new(width), Int32.new(height))
      __var1 = cast(GdkPixbuf::Pixbuf.new(__var0)) if __var0
      __var1
    end

    def self.new_from_bytes(data : GLib::Bytes, colorspace : GdkPixbuf::Colorspace, has_alpha : ::Bool, bits_per_sample : ::Int, width : ::Int, height : ::Int, rowstride : ::Int) : self
      __var0 = LibGdkPixbuf.pixbuf_new_from_bytes(data.to_unsafe.as(LibGLib::Bytes*), colorspace, LibC::Int.new(has_alpha ? 1 : 0), Int32.new(bits_per_sample), Int32.new(width), Int32.new(height), Int32.new(rowstride))
      GObject.raise_unexpected_null("gdk_pixbuf_new_from_bytes") if __var0.null?
      cast(GdkPixbuf::Pixbuf.new(__var0))
    end

    def self.new_from_data(data : ::Bytes, colorspace : GdkPixbuf::Colorspace, has_alpha : ::Bool, bits_per_sample : ::Int, width : ::Int, height : ::Int, rowstride : ::Int, destroy_fn : GdkPixbuf::PixbufDestroyNotify?, destroy_fn_data : Void*?) : self
      __var0 = LibGdkPixbuf.pixbuf_new_from_data(data.to_unsafe, colorspace, LibC::Int.new(has_alpha ? 1 : 0), Int32.new(bits_per_sample), Int32.new(width), Int32.new(height), Int32.new(rowstride), destroy_fn ? destroy_fn : nil, destroy_fn_data ? destroy_fn_data : Pointer(Void).null)
      GObject.raise_unexpected_null("gdk_pixbuf_new_from_data") if __var0.null?
      cast(GdkPixbuf::Pixbuf.new(__var0))
    end

    def self.new_from_file(filename : ::String) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_new_from_file(filename.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("gdk_pixbuf_new_from_file") if __var1.null?
      cast(GdkPixbuf::Pixbuf.new(__var1))
    end

    def self.new_from_file_at_scale(filename : ::String, width : ::Int, height : ::Int, preserve_aspect_ratio : ::Bool) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_new_from_file_at_scale(filename.to_unsafe, Int32.new(width), Int32.new(height), LibC::Int.new(preserve_aspect_ratio ? 1 : 0), pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("gdk_pixbuf_new_from_file_at_scale") if __var1.null?
      cast(GdkPixbuf::Pixbuf.new(__var1))
    end

    def self.new_from_file_at_size(filename : ::String, width : ::Int, height : ::Int) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_new_from_file_at_size(filename.to_unsafe, Int32.new(width), Int32.new(height), pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("gdk_pixbuf_new_from_file_at_size") if __var1.null?
      cast(GdkPixbuf::Pixbuf.new(__var1))
    end

    def self.new_from_inline(data : ::Bytes, copy_pixels : ::Bool) : self
      data_length = data.size
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_new_from_inline(Int32.new(data_length), data.to_unsafe, LibC::Int.new(copy_pixels ? 1 : 0), pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("gdk_pixbuf_new_from_inline") if __var1.null?
      cast(GdkPixbuf::Pixbuf.new(__var1))
    end

    def self.new_from_resource(resource_path : ::String) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_new_from_resource(resource_path.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("gdk_pixbuf_new_from_resource") if __var1.null?
      cast(GdkPixbuf::Pixbuf.new(__var1))
    end

    def self.new_from_resource_at_scale(resource_path : ::String, width : ::Int, height : ::Int, preserve_aspect_ratio : ::Bool) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_new_from_resource_at_scale(resource_path.to_unsafe, Int32.new(width), Int32.new(height), LibC::Int.new(preserve_aspect_ratio ? 1 : 0), pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("gdk_pixbuf_new_from_resource_at_scale") if __var1.null?
      cast(GdkPixbuf::Pixbuf.new(__var1))
    end

    def self.new_from_stream(stream : Gio::InputStream, cancellable : Gio::Cancellable?) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_new_from_stream(stream.to_unsafe_inputstream, cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("gdk_pixbuf_new_from_stream") if __var1.null?
      cast(GdkPixbuf::Pixbuf.new(__var1))
    end

    def self.new_from_stream_at_scale(stream : Gio::InputStream, width : ::Int, height : ::Int, preserve_aspect_ratio : ::Bool, cancellable : Gio::Cancellable?) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_new_from_stream_at_scale(stream.to_unsafe_inputstream, Int32.new(width), Int32.new(height), LibC::Int.new(preserve_aspect_ratio ? 1 : 0), cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("gdk_pixbuf_new_from_stream_at_scale") if __var1.null?
      cast(GdkPixbuf::Pixbuf.new(__var1))
    end

    def self.new_from_stream_finish(async_result : Gio::AsyncResult) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_new_from_stream_finish(async_result.to_unsafe_asyncresult, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("gdk_pixbuf_new_from_stream_finish") if __var1.null?
      cast(GdkPixbuf::Pixbuf.new(__var1))
    end

    def self.new_from_xpm_data(data : ::Enumerable) : self
      __var0 = LibGdkPixbuf.pixbuf_new_from_xpm_data((__data_ary = data.map { |__item| __item.to_unsafe }.to_a).to_unsafe)
      GObject.raise_unexpected_null("gdk_pixbuf_new_from_xpm_data") if __var0.null?
      cast(GdkPixbuf::Pixbuf.new(__var0))
    end

    def self.calculate_rowstride(colorspace : GdkPixbuf::Colorspace, has_alpha : ::Bool, bits_per_sample : ::Int, width : ::Int, height : ::Int)
      __var0 = LibGdkPixbuf.pixbuf_calculate_rowstride(colorspace, LibC::Int.new(has_alpha ? 1 : 0), Int32.new(bits_per_sample), Int32.new(width), Int32.new(height))
      __var0
    end

    def self.file_info(filename : ::String)
      __var0 = LibGdkPixbuf.pixbuf_get_file_info(filename.to_unsafe, out width, out height)
      __var1 = GdkPixbuf::PixbufFormat.new(__var0) if __var0
      {__var1, width, height}
    end

    def self.file_info_async(filename : ::String, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Void*?)
      LibGdkPixbuf.pixbuf_get_file_info_async(filename.to_unsafe, cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, callback ? callback : nil, user_data ? user_data : Pointer(Void).null)
      nil
    end

    def self.file_info_finish(async_result : Gio::AsyncResult)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_get_file_info_finish(async_result.to_unsafe_asyncresult, out width, out height, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("gdk_pixbuf_get_file_info_finish") if __var1.null?
      {GdkPixbuf::PixbufFormat.new(__var1), width, height}
    end

    def self.formats
      __var0 = LibGdkPixbuf.pixbuf_get_formats
      GObject.raise_unexpected_null("gdk_pixbuf_get_formats") if __var0.null?
      GLib::SListIterator(GdkPixbuf::PixbufFormat, LibGdkPixbuf::PixbufFormat*).new(GLib::SList.new(__var0.as(LibGLib::SList*)))
    end

    def self.init_modules(path : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_init_modules(path.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def self.new_from_stream_async(stream : Gio::InputStream, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Void*?)
      LibGdkPixbuf.pixbuf_new_from_stream_async(stream.to_unsafe_inputstream, cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, callback ? callback : nil, user_data ? user_data : Pointer(Void).null)
      nil
    end

    def self.new_from_stream_at_scale_async(stream : Gio::InputStream, width : ::Int, height : ::Int, preserve_aspect_ratio : ::Bool, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Void*?)
      LibGdkPixbuf.pixbuf_new_from_stream_at_scale_async(stream.to_unsafe_inputstream, Int32.new(width), Int32.new(height), LibC::Int.new(preserve_aspect_ratio ? 1 : 0), cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, callback ? callback : nil, user_data ? user_data : Pointer(Void).null)
      nil
    end

    def self.save_to_stream_finish(async_result : Gio::AsyncResult)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_save_to_stream_finish(async_result.to_unsafe_asyncresult, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def add_alpha(substitute_color : ::Bool, r : ::Int, g : ::Int, b : ::Int)
      __var0 = LibGdkPixbuf.pixbuf_add_alpha(@pointer.as(LibGdkPixbuf::Pixbuf*), LibC::Int.new(substitute_color ? 1 : 0), UInt8.new(r), UInt8.new(g), UInt8.new(b))
      GObject.raise_unexpected_null("gdk_pixbuf_add_alpha") if __var0.null?
      GdkPixbuf::Pixbuf.new(__var0)
    end

    def apply_embedded_orientation
      __var0 = LibGdkPixbuf.pixbuf_apply_embedded_orientation(@pointer.as(LibGdkPixbuf::Pixbuf*))
      GObject.raise_unexpected_null("gdk_pixbuf_apply_embedded_orientation") if __var0.null?
      GdkPixbuf::Pixbuf.new(__var0)
    end

    def composite(dest : GdkPixbuf::Pixbuf, dest_x : ::Int, dest_y : ::Int, dest_width : ::Int, dest_height : ::Int, offset_x : ::Float, offset_y : ::Float, scale_x : ::Float, scale_y : ::Float, interp_type : GdkPixbuf::InterpType, overall_alpha : ::Int)
      LibGdkPixbuf.pixbuf_composite(@pointer.as(LibGdkPixbuf::Pixbuf*), dest.to_unsafe_pixbuf, Int32.new(dest_x), Int32.new(dest_y), Int32.new(dest_width), Int32.new(dest_height), Float64.new(offset_x), Float64.new(offset_y), Float64.new(scale_x), Float64.new(scale_y), interp_type, Int32.new(overall_alpha))
      nil
    end

    def composite_color(dest : GdkPixbuf::Pixbuf, dest_x : ::Int, dest_y : ::Int, dest_width : ::Int, dest_height : ::Int, offset_x : ::Float, offset_y : ::Float, scale_x : ::Float, scale_y : ::Float, interp_type : GdkPixbuf::InterpType, overall_alpha : ::Int, check_x : ::Int, check_y : ::Int, check_size : ::Int, color1 : ::Int, color2 : ::Int)
      LibGdkPixbuf.pixbuf_composite_color(@pointer.as(LibGdkPixbuf::Pixbuf*), dest.to_unsafe_pixbuf, Int32.new(dest_x), Int32.new(dest_y), Int32.new(dest_width), Int32.new(dest_height), Float64.new(offset_x), Float64.new(offset_y), Float64.new(scale_x), Float64.new(scale_y), interp_type, Int32.new(overall_alpha), Int32.new(check_x), Int32.new(check_y), Int32.new(check_size), UInt32.new(color1), UInt32.new(color2))
      nil
    end

    def composite_color_simple(dest_width : ::Int, dest_height : ::Int, interp_type : GdkPixbuf::InterpType, overall_alpha : ::Int, check_size : ::Int, color1 : ::Int, color2 : ::Int)
      __var0 = LibGdkPixbuf.pixbuf_composite_color_simple(@pointer.as(LibGdkPixbuf::Pixbuf*), Int32.new(dest_width), Int32.new(dest_height), interp_type, Int32.new(overall_alpha), Int32.new(check_size), UInt32.new(color1), UInt32.new(color2))
      __var1 = GdkPixbuf::Pixbuf.new(__var0) if __var0
      __var1
    end

    def copy
      __var0 = LibGdkPixbuf.pixbuf_copy(@pointer.as(LibGdkPixbuf::Pixbuf*))
      __var1 = GdkPixbuf::Pixbuf.new(__var0) if __var0
      __var1
    end

    def copy_area(src_x : ::Int, src_y : ::Int, width : ::Int, height : ::Int, dest_pixbuf : GdkPixbuf::Pixbuf, dest_x : ::Int, dest_y : ::Int)
      LibGdkPixbuf.pixbuf_copy_area(@pointer.as(LibGdkPixbuf::Pixbuf*), Int32.new(src_x), Int32.new(src_y), Int32.new(width), Int32.new(height), dest_pixbuf.to_unsafe_pixbuf, Int32.new(dest_x), Int32.new(dest_y))
      nil
    end

    def copy_options(dest_pixbuf : GdkPixbuf::Pixbuf)
      __var0 = LibGdkPixbuf.pixbuf_copy_options(@pointer.as(LibGdkPixbuf::Pixbuf*), dest_pixbuf.to_unsafe_pixbuf)
      (__var0 == 1)
    end

    def fill(pixel : ::Int)
      LibGdkPixbuf.pixbuf_fill(@pointer.as(LibGdkPixbuf::Pixbuf*), UInt32.new(pixel))
      nil
    end

    def flip(horizontal : ::Bool)
      __var0 = LibGdkPixbuf.pixbuf_flip(@pointer.as(LibGdkPixbuf::Pixbuf*), LibC::Int.new(horizontal ? 1 : 0))
      __var1 = GdkPixbuf::Pixbuf.new(__var0) if __var0
      __var1
    end

    def bits_per_sample
      __var0 = LibGdkPixbuf.pixbuf_get_bits_per_sample(@pointer.as(LibGdkPixbuf::Pixbuf*))
      __var0
    end

    def byte_length
      __var0 = LibGdkPixbuf.pixbuf_get_byte_length(@pointer.as(LibGdkPixbuf::Pixbuf*))
      __var0
    end

    def colorspace
      __var0 = LibGdkPixbuf.pixbuf_get_colorspace(@pointer.as(LibGdkPixbuf::Pixbuf*))
      GdkPixbuf::Colorspace.new(__var0)
    end

    def has_alpha
      __var0 = LibGdkPixbuf.pixbuf_get_has_alpha(@pointer.as(LibGdkPixbuf::Pixbuf*))
      (__var0 == 1)
    end

    def height
      __var0 = LibGdkPixbuf.pixbuf_get_height(@pointer.as(LibGdkPixbuf::Pixbuf*))
      __var0
    end

    def n_channels
      __var0 = LibGdkPixbuf.pixbuf_get_n_channels(@pointer.as(LibGdkPixbuf::Pixbuf*))
      __var0
    end

    def option(key : ::String)
      __var0 = LibGdkPixbuf.pixbuf_get_option(@pointer.as(LibGdkPixbuf::Pixbuf*), key.to_unsafe)
      GObject.raise_unexpected_null("gdk_pixbuf_get_option") if __var0.null?
      ::String.new(__var0)
    end

    def options
      __var0 = LibGdkPixbuf.pixbuf_get_options(@pointer.as(LibGdkPixbuf::Pixbuf*))
      GObject.raise_unexpected_null("gdk_pixbuf_get_options") if __var0.null?
      __var0
    end

    def pixels
      __var0 = LibGdkPixbuf.pixbuf_get_pixels(@pointer.as(LibGdkPixbuf::Pixbuf*), out length)
      GObject.raise_unexpected_null("gdk_pixbuf_get_pixels_with_length") if __var0.null?
      {GObject::PointerIterator.new(__var0) { |__var1|
        __var1
      }, length}
    end

    def rowstride
      __var0 = LibGdkPixbuf.pixbuf_get_rowstride(@pointer.as(LibGdkPixbuf::Pixbuf*))
      __var0
    end

    def width
      __var0 = LibGdkPixbuf.pixbuf_get_width(@pointer.as(LibGdkPixbuf::Pixbuf*))
      __var0
    end

    def new_subpixbuf(src_x : ::Int, src_y : ::Int, width : ::Int, height : ::Int)
      __var0 = LibGdkPixbuf.pixbuf_new_subpixbuf(@pointer.as(LibGdkPixbuf::Pixbuf*), Int32.new(src_x), Int32.new(src_y), Int32.new(width), Int32.new(height))
      GObject.raise_unexpected_null("gdk_pixbuf_new_subpixbuf") if __var0.null?
      GdkPixbuf::Pixbuf.new(__var0)
    end

    def read_pixel_bytes
      __var0 = LibGdkPixbuf.pixbuf_read_pixel_bytes(@pointer.as(LibGdkPixbuf::Pixbuf*))
      GObject.raise_unexpected_null("gdk_pixbuf_read_pixel_bytes") if __var0.null?
      GLib::Bytes.new(__var0)
    end

    def read_pixels
      __var0 = LibGdkPixbuf.pixbuf_read_pixels(@pointer.as(LibGdkPixbuf::Pixbuf*))
      GObject.raise_unexpected_null("gdk_pixbuf_read_pixels") if __var0.null?
      __var0
    end

    def remove_option(key : ::String)
      __var0 = LibGdkPixbuf.pixbuf_remove_option(@pointer.as(LibGdkPixbuf::Pixbuf*), key.to_unsafe)
      (__var0 == 1)
    end

    def rotate_simple(angle : GdkPixbuf::PixbufRotation)
      __var0 = LibGdkPixbuf.pixbuf_rotate_simple(@pointer.as(LibGdkPixbuf::Pixbuf*), angle)
      __var1 = GdkPixbuf::Pixbuf.new(__var0) if __var0
      __var1
    end

    def saturate_and_pixelate(dest : GdkPixbuf::Pixbuf, saturation : ::Float, pixelate : ::Bool)
      LibGdkPixbuf.pixbuf_saturate_and_pixelate(@pointer.as(LibGdkPixbuf::Pixbuf*), dest.to_unsafe_pixbuf, Float32.new(saturation), LibC::Int.new(pixelate ? 1 : 0))
      nil
    end

    def save_to_bufferv(buffer : ::Bytes, type : ::String, option_keys : ::Enumerable, option_values : ::Enumerable)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_save_to_bufferv(@pointer.as(LibGdkPixbuf::Pixbuf*), buffer, out buffer_size, type.to_unsafe, (__option_keys_ary = option_keys.map { |__item| __item.to_unsafe }.to_a).to_unsafe, (__option_values_ary = option_values.map { |__item| __item.to_unsafe }.to_a).to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      {(__var1 == 1), buffer_size}
    end

    def save_to_callbackv(save_func : GdkPixbuf::PixbufSaveFunc, user_data : Void*?, type : ::String, option_keys : ::Enumerable, option_values : ::Enumerable)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_save_to_callbackv(@pointer.as(LibGdkPixbuf::Pixbuf*), save_func, user_data ? user_data : Pointer(Void).null, type.to_unsafe, (__option_keys_ary = option_keys.map { |__item| __item.to_unsafe }.to_a).to_unsafe, (__option_values_ary = option_values.map { |__item| __item.to_unsafe }.to_a).to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def save_to_streamv(stream : Gio::OutputStream, type : ::String, option_keys : ::Enumerable, option_values : ::Enumerable, cancellable : Gio::Cancellable?)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_save_to_streamv(@pointer.as(LibGdkPixbuf::Pixbuf*), stream.to_unsafe_outputstream, type.to_unsafe, (__option_keys_ary = option_keys.map { |__item| __item.to_unsafe }.to_a).to_unsafe, (__option_values_ary = option_values.map { |__item| __item.to_unsafe }.to_a).to_unsafe, cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def save_to_streamv_async(stream : Gio::OutputStream, type : ::String, option_keys : ::Enumerable, option_values : ::Enumerable, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Void*?)
      LibGdkPixbuf.pixbuf_save_to_streamv_async(@pointer.as(LibGdkPixbuf::Pixbuf*), stream.to_unsafe_outputstream, type.to_unsafe, (__option_keys_ary = option_keys.map { |__item| __item.to_unsafe }.to_a).to_unsafe, (__option_values_ary = option_values.map { |__item| __item.to_unsafe }.to_a).to_unsafe, cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, callback ? callback : nil, user_data ? user_data : Pointer(Void).null)
      nil
    end

    def savev(filename : ::String, type : ::String, option_keys : ::Enumerable, option_values : ::Enumerable)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_savev(@pointer.as(LibGdkPixbuf::Pixbuf*), filename.to_unsafe, type.to_unsafe, (__option_keys_ary = option_keys.map { |__item| __item.to_unsafe }.to_a).to_unsafe, (__option_values_ary = option_values.map { |__item| __item.to_unsafe }.to_a).to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def scale(dest : GdkPixbuf::Pixbuf, dest_x : ::Int, dest_y : ::Int, dest_width : ::Int, dest_height : ::Int, offset_x : ::Float, offset_y : ::Float, scale_x : ::Float, scale_y : ::Float, interp_type : GdkPixbuf::InterpType)
      LibGdkPixbuf.pixbuf_scale(@pointer.as(LibGdkPixbuf::Pixbuf*), dest.to_unsafe_pixbuf, Int32.new(dest_x), Int32.new(dest_y), Int32.new(dest_width), Int32.new(dest_height), Float64.new(offset_x), Float64.new(offset_y), Float64.new(scale_x), Float64.new(scale_y), interp_type)
      nil
    end

    def scale_simple(dest_width : ::Int, dest_height : ::Int, interp_type : GdkPixbuf::InterpType)
      __var0 = LibGdkPixbuf.pixbuf_scale_simple(@pointer.as(LibGdkPixbuf::Pixbuf*), Int32.new(dest_width), Int32.new(dest_height), interp_type)
      __var1 = GdkPixbuf::Pixbuf.new(__var0) if __var0
      __var1
    end

    def set_option(key : ::String, value : ::String)
      __var0 = LibGdkPixbuf.pixbuf_set_option(@pointer.as(LibGdkPixbuf::Pixbuf*), key.to_unsafe, value.to_unsafe)
      (__var0 == 1)
    end

    def pixel_bytes : GLib::Bytes
      __var0 = GObject::Value.new(type: GObject::Type::OBJECT)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "pixel-bytes", __var0)
      GLib::Bytes.cast(__var0.object)
    end
  end

  enum PixbufAlphaMode : UInt32
    BILEVEL = 0
    FULL    = 1
  end

  class PixbufAnimation < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdkPixbuf::PixbufAnimation*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkPixbufAnimation")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdkPixbuf._gdk_pixbuf_animation_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdkPixbuf::PixbufAnimation*)
    end

    def to_unsafe_pixbufanimation
      @pointer.not_nil!.as(LibGdkPixbuf::PixbufAnimation*)
    end

    def self.new_from_file(filename : ::String) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_animation_new_from_file(filename.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("gdk_pixbuf_animation_new_from_file") if __var1.null?
      cast(GdkPixbuf::PixbufAnimation.new(__var1))
    end

    def self.new_from_resource(resource_path : ::String) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_animation_new_from_resource(resource_path.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("gdk_pixbuf_animation_new_from_resource") if __var1.null?
      cast(GdkPixbuf::PixbufAnimation.new(__var1))
    end

    def self.new_from_stream(stream : Gio::InputStream, cancellable : Gio::Cancellable?) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_animation_new_from_stream(stream.to_unsafe_inputstream, cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("gdk_pixbuf_animation_new_from_stream") if __var1.null?
      cast(GdkPixbuf::PixbufAnimation.new(__var1))
    end

    def self.new_from_stream_finish(async_result : Gio::AsyncResult) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_animation_new_from_stream_finish(async_result.to_unsafe_asyncresult, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("gdk_pixbuf_animation_new_from_stream_finish") if __var1.null?
      cast(GdkPixbuf::PixbufAnimation.new(__var1))
    end

    def self.new_from_stream_async(stream : Gio::InputStream, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Void*?)
      LibGdkPixbuf.pixbuf_animation_new_from_stream_async(stream.to_unsafe_inputstream, cancellable ? cancellable.to_unsafe_cancellable : Pointer(LibGio::Cancellable).null, callback ? callback : nil, user_data ? user_data : Pointer(Void).null)
      nil
    end

    def height
      __var0 = LibGdkPixbuf.pixbuf_animation_get_height(@pointer.as(LibGdkPixbuf::PixbufAnimation*))
      __var0
    end

    def iter(start_time : GLib::TimeVal?)
      __var0 = LibGdkPixbuf.pixbuf_animation_get_iter(@pointer.as(LibGdkPixbuf::PixbufAnimation*), start_time ? start_time.to_unsafe.as(LibGLib::TimeVal*) : Pointer(LibGLib::TimeVal).null)
      GObject.raise_unexpected_null("gdk_pixbuf_animation_get_iter") if __var0.null?
      GdkPixbuf::PixbufAnimationIter.new(__var0)
    end

    def static_image
      __var0 = LibGdkPixbuf.pixbuf_animation_get_static_image(@pointer.as(LibGdkPixbuf::PixbufAnimation*))
      GObject.raise_unexpected_null("gdk_pixbuf_animation_get_static_image") if __var0.null?
      GdkPixbuf::Pixbuf.new(__var0)
    end

    def width
      __var0 = LibGdkPixbuf.pixbuf_animation_get_width(@pointer.as(LibGdkPixbuf::PixbufAnimation*))
      __var0
    end

    def static_image?
      __var0 = LibGdkPixbuf.pixbuf_animation_is_static_image(@pointer.as(LibGdkPixbuf::PixbufAnimation*))
      (__var0 == 1)
    end
  end

  class PixbufAnimationIter < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdkPixbuf::PixbufAnimationIter*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkPixbufAnimationIter")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdkPixbuf._gdk_pixbuf_animation_iter_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdkPixbuf::PixbufAnimationIter*)
    end

    def to_unsafe_pixbufanimationiter
      @pointer.not_nil!.as(LibGdkPixbuf::PixbufAnimationIter*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(LibGdkPixbuf._gdk_pixbuf_animation_iter_get_type, 0, nil, nil).as(Void*)
    end

    def advance(current_time : GLib::TimeVal?)
      __var0 = LibGdkPixbuf.pixbuf_animation_iter_advance(@pointer.as(LibGdkPixbuf::PixbufAnimationIter*), current_time ? current_time.to_unsafe.as(LibGLib::TimeVal*) : Pointer(LibGLib::TimeVal).null)
      (__var0 == 1)
    end

    def delay_time
      __var0 = LibGdkPixbuf.pixbuf_animation_iter_get_delay_time(@pointer.as(LibGdkPixbuf::PixbufAnimationIter*))
      __var0
    end

    def pixbuf
      __var0 = LibGdkPixbuf.pixbuf_animation_iter_get_pixbuf(@pointer.as(LibGdkPixbuf::PixbufAnimationIter*))
      GObject.raise_unexpected_null("gdk_pixbuf_animation_iter_get_pixbuf") if __var0.null?
      GdkPixbuf::Pixbuf.new(__var0)
    end

    def on_currently_loading_frame
      __var0 = LibGdkPixbuf.pixbuf_animation_iter_on_currently_loading_frame(@pointer.as(LibGdkPixbuf::PixbufAnimationIter*))
      (__var0 == 1)
    end
  end

  alias PixbufDestroyNotify = LibGdkPixbuf::PixbufDestroyNotify

  enum PixbufError : UInt32
    CORRUPT_IMAGE         = 0
    INSUFFICIENT_MEMORY   = 1
    BAD_OPTION            = 2
    UNKNOWN_TYPE          = 3
    UNSUPPORTED_OPERATION = 4
    FAILED                = 5
    INCOMPLETE_ANIMATION  = 6
  end

  # Function quark

  class PixbufFormat
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGdkPixbuf::PixbufFormat*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdkPixbuf::PixbufFormat*)
    end

    def to_unsafe_pixbufformat
      @pointer.not_nil!.as(LibGdkPixbuf::PixbufFormat*)
    end

    def copy
      __var0 = LibGdkPixbuf.pixbuf_format_copy(@pointer.as(LibGdkPixbuf::PixbufFormat*))
      GObject.raise_unexpected_null("gdk_pixbuf_format_copy") if __var0.null?
      GdkPixbuf::PixbufFormat.new(__var0)
    end

    def free
      LibGdkPixbuf.pixbuf_format_free(@pointer.as(LibGdkPixbuf::PixbufFormat*))
      nil
    end

    def description
      __var0 = LibGdkPixbuf.pixbuf_format_get_description(@pointer.as(LibGdkPixbuf::PixbufFormat*))
      GObject.raise_unexpected_null("gdk_pixbuf_format_get_description") if __var0.null?
      ::String.new(__var0)
    end

    def extensions
      __var0 = LibGdkPixbuf.pixbuf_format_get_extensions(@pointer.as(LibGdkPixbuf::PixbufFormat*))
      GObject.raise_unexpected_null("gdk_pixbuf_format_get_extensions") if __var0.null?
      GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      }
    end

    def license
      __var0 = LibGdkPixbuf.pixbuf_format_get_license(@pointer.as(LibGdkPixbuf::PixbufFormat*))
      GObject.raise_unexpected_null("gdk_pixbuf_format_get_license") if __var0.null?
      ::String.new(__var0)
    end

    def mime_types
      __var0 = LibGdkPixbuf.pixbuf_format_get_mime_types(@pointer.as(LibGdkPixbuf::PixbufFormat*))
      GObject.raise_unexpected_null("gdk_pixbuf_format_get_mime_types") if __var0.null?
      GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      }
    end

    def name
      __var0 = LibGdkPixbuf.pixbuf_format_get_name(@pointer.as(LibGdkPixbuf::PixbufFormat*))
      GObject.raise_unexpected_null("gdk_pixbuf_format_get_name") if __var0.null?
      ::String.new(__var0)
    end

    def disabled?
      __var0 = LibGdkPixbuf.pixbuf_format_is_disabled(@pointer.as(LibGdkPixbuf::PixbufFormat*))
      (__var0 == 1)
    end

    def save_option_supported?(option_key : ::String)
      __var0 = LibGdkPixbuf.pixbuf_format_is_save_option_supported(@pointer.as(LibGdkPixbuf::PixbufFormat*), option_key.to_unsafe)
      (__var0 == 1)
    end

    def scalable?
      __var0 = LibGdkPixbuf.pixbuf_format_is_scalable(@pointer.as(LibGdkPixbuf::PixbufFormat*))
      (__var0 == 1)
    end

    def writable?
      __var0 = LibGdkPixbuf.pixbuf_format_is_writable(@pointer.as(LibGdkPixbuf::PixbufFormat*))
      (__var0 == 1)
    end

    def disabled=(disabled : ::Bool)
      LibGdkPixbuf.pixbuf_format_set_disabled(@pointer.as(LibGdkPixbuf::PixbufFormat*), LibC::Int.new(disabled ? 1 : 0))
      nil
    end
  end

  class PixbufLoader < GObject::Object
    @pointer : Void*

    def initialize(pointer : LibGdkPixbuf::PixbufLoader*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkPixbufLoader")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdkPixbuf._gdk_pixbuf_loader_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdkPixbuf::PixbufLoader*)
    end

    def to_unsafe_pixbufloader
      @pointer.not_nil!.as(LibGdkPixbuf::PixbufLoader*)
    end

    def self.new : self
      __var0 = LibGdkPixbuf.pixbuf_loader_new
      GObject.raise_unexpected_null("gdk_pixbuf_loader_new") if __var0.null?
      cast(GdkPixbuf::PixbufLoader.new(__var0))
    end

    def self.new_with_mime_type(mime_type : ::String) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_loader_new_with_mime_type(mime_type.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("gdk_pixbuf_loader_new_with_mime_type") if __var1.null?
      cast(GdkPixbuf::PixbufLoader.new(__var1))
    end

    def self.new_with_type(image_type : ::String) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_loader_new_with_type(image_type.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("gdk_pixbuf_loader_new_with_type") if __var1.null?
      cast(GdkPixbuf::PixbufLoader.new(__var1))
    end

    def close
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_loader_close(@pointer.as(LibGdkPixbuf::PixbufLoader*), pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def animation
      __var0 = LibGdkPixbuf.pixbuf_loader_get_animation(@pointer.as(LibGdkPixbuf::PixbufLoader*))
      GObject.raise_unexpected_null("gdk_pixbuf_loader_get_animation") if __var0.null?
      GdkPixbuf::PixbufAnimation.new(__var0)
    end

    def format
      __var0 = LibGdkPixbuf.pixbuf_loader_get_format(@pointer.as(LibGdkPixbuf::PixbufLoader*))
      __var1 = GdkPixbuf::PixbufFormat.new(__var0) if __var0
      __var1
    end

    def pixbuf
      __var0 = LibGdkPixbuf.pixbuf_loader_get_pixbuf(@pointer.as(LibGdkPixbuf::PixbufLoader*))
      GObject.raise_unexpected_null("gdk_pixbuf_loader_get_pixbuf") if __var0.null?
      GdkPixbuf::Pixbuf.new(__var0)
    end

    def set_size(width : ::Int, height : ::Int)
      LibGdkPixbuf.pixbuf_loader_set_size(@pointer.as(LibGdkPixbuf::PixbufLoader*), Int32.new(width), Int32.new(height))
      nil
    end

    def write(buf : ::Bytes)
      count = buf.size
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_loader_write(@pointer.as(LibGdkPixbuf::PixbufLoader*), buf.to_unsafe, UInt64.new(count), pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def write_bytes(buffer : GLib::Bytes)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGdkPixbuf.pixbuf_loader_write_bytes(@pointer.as(LibGdkPixbuf::PixbufLoader*), buffer.to_unsafe.as(LibGLib::Bytes*), pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    alias AreaPreparedSignal = PixbufLoader -> Nil

    def on_area_prepared(*, after = false, &block : AreaPreparedSignal)
      __var0 = ->(arg0 : LibGdkPixbuf::PixbufLoader*, box : Void*) {
        ::Box(AreaPreparedSignal).unbox(box).call(PixbufLoader.new(arg0))
      }

      __var1 = ::Box.box(AreaPreparedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "area-prepared", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_area_prepared(&block : AreaPreparedSignal)
      on_area_prepared(after: true, &block)
    end

    alias AreaUpdatedSignal = PixbufLoader, Int32, Int32, Int32, Int32 -> Nil

    def on_area_updated(*, after = false, &block : AreaUpdatedSignal)
      __var0 = ->(arg0 : LibGdkPixbuf::PixbufLoader*, arg1 : Int32, arg2 : Int32, arg3 : Int32, arg4 : Int32, box : Void*) {
        ::Box(AreaUpdatedSignal).unbox(box).call(PixbufLoader.new(arg0), arg1, arg2, arg3, arg4)
      }

      __var1 = ::Box.box(AreaUpdatedSignal.new { |arg0, arg1, arg2, arg3, arg4|
        block.call(arg0, arg1, arg2, arg3, arg4)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "area-updated", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_area_updated(&block : AreaUpdatedSignal)
      on_area_updated(after: true, &block)
    end

    alias ClosedSignal = PixbufLoader -> Nil

    def on_closed(*, after = false, &block : ClosedSignal)
      __var0 = ->(arg0 : LibGdkPixbuf::PixbufLoader*, box : Void*) {
        ::Box(ClosedSignal).unbox(box).call(PixbufLoader.new(arg0))
      }

      __var1 = ::Box.box(ClosedSignal.new { |arg0|
        block.call(arg0)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "closed", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_closed(&block : ClosedSignal)
      on_closed(after: true, &block)
    end

    alias SizePreparedSignal = PixbufLoader, Int32, Int32 -> Nil

    def on_size_prepared(*, after = false, &block : SizePreparedSignal)
      __var0 = ->(arg0 : LibGdkPixbuf::PixbufLoader*, arg1 : Int32, arg2 : Int32, box : Void*) {
        ::Box(SizePreparedSignal).unbox(box).call(PixbufLoader.new(arg0), arg1, arg2)
      }

      __var1 = ::Box.box(SizePreparedSignal.new { |arg0, arg1, arg2|
        block.call(arg0, arg1, arg2)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "size-prepared", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_size_prepared(&block : SizePreparedSignal)
      on_size_prepared(after: true, &block)
    end
  end

  class PixbufLoaderClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(168u64, 0u8).as(LibGdkPixbuf::PixbufLoaderClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGdkPixbuf::PixbufLoaderClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdkPixbuf::PixbufLoaderClass*)
    end

    def to_unsafe_pixbufloaderclass
      @pointer.not_nil!.as(LibGdkPixbuf::PixbufLoaderClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGdkPixbuf::PixbufLoaderClass*).value.parent_class)
    end

    def size_prepared
      to_unsafe.as(LibGdkPixbuf::PixbufLoaderClass*).value.size_prepared
    end

    def area_prepared
      to_unsafe.as(LibGdkPixbuf::PixbufLoaderClass*).value.area_prepared
    end

    def area_updated
      to_unsafe.as(LibGdkPixbuf::PixbufLoaderClass*).value.area_updated
    end

    def closed
      to_unsafe.as(LibGdkPixbuf::PixbufLoaderClass*).value.closed
    end
  end

  enum PixbufRotation : UInt32
    NONE             =   0
    COUNTERCLOCKWISE =  90
    UPSIDEDOWN       = 180
    CLOCKWISE        = 270
  end
  alias PixbufSaveFunc = LibGdkPixbuf::PixbufSaveFunc

  class PixbufSimpleAnim < PixbufAnimation
    @pointer : Void*

    def initialize(pointer : LibGdkPixbuf::PixbufSimpleAnim*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkPixbufSimpleAnim")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdkPixbuf._gdk_pixbuf_simple_anim_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdkPixbuf::PixbufSimpleAnim*)
    end

    def to_unsafe_pixbufsimpleanim
      @pointer.not_nil!.as(LibGdkPixbuf::PixbufSimpleAnim*)
    end

    def initialize(*, loop : ::Bool? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless loop.nil?
        __var0 << "loop".to_unsafe
        __var1 << loop.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGdkPixbuf._gdk_pixbuf_simple_anim_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def self.new(width : ::Int, height : ::Int, rate : ::Float) : self
      __var0 = LibGdkPixbuf.pixbuf_simple_anim_new(Int32.new(width), Int32.new(height), Float32.new(rate))
      GObject.raise_unexpected_null("gdk_pixbuf_simple_anim_new") if __var0.null?
      cast(GdkPixbuf::PixbufSimpleAnim.new(__var0))
    end

    def add_frame(pixbuf : GdkPixbuf::Pixbuf)
      LibGdkPixbuf.pixbuf_simple_anim_add_frame(@pointer.as(LibGdkPixbuf::PixbufSimpleAnim*), pixbuf.to_unsafe_pixbuf)
      nil
    end

    def loop
      __var0 = LibGdkPixbuf.pixbuf_simple_anim_get_loop(@pointer.as(LibGdkPixbuf::PixbufSimpleAnim*))
      (__var0 == 1)
    end

    def loop=(loop : ::Bool)
      LibGdkPixbuf.pixbuf_simple_anim_set_loop(@pointer.as(LibGdkPixbuf::PixbufSimpleAnim*), LibC::Int.new(loop ? 1 : 0))
      nil
    end
  end

  class PixbufSimpleAnimClass
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGdkPixbuf::PixbufSimpleAnimClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdkPixbuf::PixbufSimpleAnimClass*)
    end

    def to_unsafe_pixbufsimpleanimclass
      @pointer.not_nil!.as(LibGdkPixbuf::PixbufSimpleAnimClass*)
    end
  end

  class PixbufSimpleAnimIter < PixbufAnimationIter
    @pointer : Void*

    def initialize(pointer : LibGdkPixbuf::PixbufSimpleAnimIter*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GdkPixbufSimpleAnimIter")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGdkPixbuf._gdk_pixbuf_simple_anim_iter_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdkPixbuf::PixbufSimpleAnimIter*)
    end

    def to_unsafe_pixbufsimpleanimiter
      @pointer.not_nil!.as(LibGdkPixbuf::PixbufSimpleAnimIter*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(LibGdkPixbuf._gdk_pixbuf_simple_anim_iter_get_type, 0, nil, nil).as(Void*)
    end
  end
end
