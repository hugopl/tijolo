require_gobject("GLib", "2.0")

@[Link("gmodule-2.0", pkg_config: "gmodule-2.0")]
lib LibGModule
  ###########################################
  # #    Structs
  ###########################################

  struct Module # struct
    _data : UInt8[0]
  end

  fun module_close = g_module_close(this : Module*) : LibC::Int
  fun module_make_resident = g_module_make_resident(this : Module*) : Void
  fun module_name = g_module_name(this : Module*) : Pointer(UInt8)
  fun module_symbol = g_module_symbol(this : Module*, symbol_name : Pointer(UInt8), symbol : Pointer(Void)*) : LibC::Int
  fun module_build_path = g_module_build_path(directory : Pointer(UInt8), module_name : Pointer(UInt8)) : Pointer(UInt8)
  fun module_error = g_module_error : Pointer(UInt8)
  fun module_supported = g_module_supported : LibC::Int

  ###########################################
  # #    Flags
  ###########################################

  alias ModuleFlags = UInt32

  ###########################################
  # #    Functions
  ###########################################
  fun module_build_path = g_module_build_path(directory : Pointer(UInt8), module_name : Pointer(UInt8)) : Pointer(UInt8)
  fun module_error = g_module_error : Pointer(UInt8)
  fun module_supported = g_module_supported : LibC::Int

  ###########################################
  # #    Callbacks
  ###########################################
  alias ModuleCheckInit = Pointer(LibGModule::Module) -> Pointer(UInt8)
  alias ModuleUnload = Pointer(LibGModule::Module) -> Void
end

module GModule
  def self.module_build_path(directory : ::String?, module_name : ::String)
    __var0 = LibGModule.module_build_path(directory ? directory.to_unsafe : Pointer(UInt8).null, module_name.to_unsafe)
    GObject.raise_unexpected_null("g_module_build_path") if __var0.null?
    ::String.new(__var0)
  end

  def self.module_error
    __var0 = LibGModule.module_error
    GObject.raise_unexpected_null("g_module_error") if __var0.null?
    ::String.new(__var0)
  end

  def self.module_supported
    __var0 = LibGModule.module_supported
    (__var0 == 1)
  end

  class Module
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGModule::Module*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGModule::Module*)
    end

    def to_unsafe_module
      @pointer.not_nil!.as(LibGModule::Module*)
    end

    def close
      __var0 = LibGModule.module_close(@pointer.as(LibGModule::Module*))
      (__var0 == 1)
    end

    def make_resident
      LibGModule.module_make_resident(@pointer.as(LibGModule::Module*))
      nil
    end

    def name
      __var0 = LibGModule.module_name(@pointer.as(LibGModule::Module*))
      GObject.raise_unexpected_null("g_module_name") if __var0.null?
      ::String.new(__var0)
    end

    def symbol(symbol_name : ::String, symbol : Void*?)
      __var0 = LibGModule.module_symbol(@pointer.as(LibGModule::Module*), symbol_name.to_unsafe, symbol)
      (__var0 == 1)
    end

    def self.build_path(directory : ::String?, module_name : ::String)
      __var0 = LibGModule.module_build_path(directory ? directory.to_unsafe : Pointer(UInt8).null, module_name.to_unsafe)
      GObject.raise_unexpected_null("g_module_build_path") if __var0.null?
      ::String.new(__var0)
    end

    def self.error
      __var0 = LibGModule.module_error
      GObject.raise_unexpected_null("g_module_error") if __var0.null?
      ::String.new(__var0)
    end

    def self.supported
      __var0 = LibGModule.module_supported
      (__var0 == 1)
    end
  end

  alias ModuleCheckInit = LibGModule::ModuleCheckInit

  @[Flags]
  enum ModuleFlags : UInt32
    ZERO_NONE = 0
    LAZY      = 1
    LOCAL     = 2
    MASK      = 3
  end
  alias ModuleUnload = LibGModule::ModuleUnload
end
