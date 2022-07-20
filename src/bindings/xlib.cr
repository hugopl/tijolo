lib LibXlib
  ###########################################
  # #    Structs
  ###########################################

  struct Display # struct
    _data : UInt8[0]
  end

  struct Screen # struct
    _data : UInt8[0]
  end

  struct Visual # struct
    _data : UInt8[0]
  end

  struct XConfigureEvent # struct
    _data : UInt8[0]
  end

  struct XImage # struct
    _data : UInt8[0]
  end

  struct XFontStruct # struct
    _data : UInt8[0]
  end

  struct XTrapezoid # struct
    _data : UInt8[0]
  end

  struct XVisualInfo # struct
    _data : UInt8[0]
  end

  struct XWindowAttributes # struct
    _data : UInt8[0]
  end

  ###########################################
  # #    Unions
  ###########################################
  alias XEvent = Void*

  ###########################################
  # #    Functions
  ###########################################
  fun open_display = XOpenDisplay : Void
end

module Xlib
  def self.open_display
    LibXlib.open_display
    nil
  end

  class Display
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibXlib::Display*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibXlib::Display*)
    end

    def to_unsafe_display
      @pointer.not_nil!.as(LibXlib::Display*)
    end
  end

  class Screen
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibXlib::Screen*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibXlib::Screen*)
    end

    def to_unsafe_screen
      @pointer.not_nil!.as(LibXlib::Screen*)
    end
  end

  class Visual
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibXlib::Visual*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibXlib::Visual*)
    end

    def to_unsafe_visual
      @pointer.not_nil!.as(LibXlib::Visual*)
    end
  end

  class XEvent
    include GObject::WrappedType
    alias Union = XEvent

    @pointer : Void*

    def initialize(pointer : LibXlib::XEvent*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibXlib::XEvent*)
    end

    def to_unsafe_xevent
      @pointer.not_nil!.as(LibXlib::XEvent*)
    end
  end

  class XConfigureEvent
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibXlib::XConfigureEvent*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibXlib::XConfigureEvent*)
    end

    def to_unsafe_xconfigureevent
      @pointer.not_nil!.as(LibXlib::XConfigureEvent*)
    end
  end

  class XImage
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibXlib::XImage*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibXlib::XImage*)
    end

    def to_unsafe_ximage
      @pointer.not_nil!.as(LibXlib::XImage*)
    end
  end

  class XFontStruct
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibXlib::XFontStruct*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibXlib::XFontStruct*)
    end

    def to_unsafe_xfontstruct
      @pointer.not_nil!.as(LibXlib::XFontStruct*)
    end
  end

  class XTrapezoid
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibXlib::XTrapezoid*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibXlib::XTrapezoid*)
    end

    def to_unsafe_xtrapezoid
      @pointer.not_nil!.as(LibXlib::XTrapezoid*)
    end
  end

  class XVisualInfo
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibXlib::XVisualInfo*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibXlib::XVisualInfo*)
    end

    def to_unsafe_xvisualinfo
      @pointer.not_nil!.as(LibXlib::XVisualInfo*)
    end
  end

  class XWindowAttributes
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibXlib::XWindowAttributes*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibXlib::XWindowAttributes*)
    end

    def to_unsafe_xwindowattributes
      @pointer.not_nil!.as(LibXlib::XWindowAttributes*)
    end
  end
end
