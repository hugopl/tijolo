require_gobject("GLib", "2.0")

@[Link("gobject-2.0", pkg_config: "gobject-2.0")]
lib LibGObject
  ###########################################
  # #    Objects
  ###########################################

  struct Binding # object
    _data : UInt8[0]
    # Property flags : LibGObject::BindingFlags
    # Property source : LibGObject::Object
    # Property source-property : Pointer(UInt8)
    # Property target : LibGObject::Object
    # Property target-property : Pointer(UInt8)
  end

  fun _g_binding_get_type = g_binding_get_type : UInt64
  fun binding_get_flags = g_binding_get_flags(this : Binding*) : LibGObject::BindingFlags
  fun binding_get_source = g_binding_get_source(this : Binding*) : Pointer(LibGObject::Object)
  fun binding_get_source_property = g_binding_get_source_property(this : Binding*) : Pointer(UInt8)
  fun binding_get_target = g_binding_get_target(this : Binding*) : Pointer(LibGObject::Object)
  fun binding_get_target_property = g_binding_get_target_property(this : Binding*) : Pointer(UInt8)
  fun binding_unbind = g_binding_unbind(this : Binding*) : Void

  struct InitiallyUnowned # object
    g_type_instance : LibGObject::TypeInstance
    ref_count : UInt32
    qdata : Pointer(LibGLib::Data)
  end

  fun _g_initially_unowned_get_type = g_initially_unowned_get_type : UInt64

  struct Object # object
    g_type_instance : LibGObject::TypeInstance
    ref_count : UInt32
    qdata : Pointer(LibGLib::Data)
    # Signal notify
    # Virtual function constructed
    # Virtual function dispatch_properties_changed
    # Virtual function dispose
    # Virtual function finalize
    # Virtual function get_property
    # Virtual function notify
    # Virtual function set_property
  end

  fun _g_object_get_type = g_object_get_type : UInt64
  fun object_newv = g_object_newv(object_type : UInt64, n_parameters : UInt32, parameters : Pointer(LibGObject::Parameter)) : Pointer(LibGObject::Object)
  fun object_compat_control = g_object_compat_control(what : UInt64, data : Pointer(Void)) : UInt64
  fun object_interface_find_property = g_object_interface_find_property(g_iface : Pointer(LibGObject::TypeInterface), property_name : Pointer(UInt8)) : Pointer(LibGObject::ParamSpec)
  fun object_interface_install_property = g_object_interface_install_property(g_iface : Pointer(LibGObject::TypeInterface), pspec : Pointer(LibGObject::ParamSpec)) : Void
  fun object_interface_list_properties = g_object_interface_list_properties(g_iface : Pointer(LibGObject::TypeInterface), n_properties_p : UInt32*) : Pointer(Pointer(LibGObject::ParamSpec))
  fun object_bind_property = g_object_bind_property(this : Object*, source_property : Pointer(UInt8), target : Pointer(LibGObject::Object), target_property : Pointer(UInt8), flags : LibGObject::BindingFlags) : Pointer(LibGObject::Binding)
  fun object_bind_property_full = g_object_bind_property_with_closures(this : Object*, source_property : Pointer(UInt8), target : Pointer(LibGObject::Object), target_property : Pointer(UInt8), flags : LibGObject::BindingFlags, transform_to : Pointer(LibGObject::Closure), transform_from : Pointer(LibGObject::Closure)) : Pointer(LibGObject::Binding)
  fun object_force_floating = g_object_force_floating(this : Object*) : Void
  fun object_freeze_notify = g_object_freeze_notify(this : Object*) : Void
  fun object_get_data = g_object_get_data(this : Object*, key : Pointer(UInt8)) : Pointer(Void)
  fun object_get_property = g_object_get_property(this : Object*, property_name : Pointer(UInt8), value : Pointer(LibGObject::Value)) : Void
  fun object_get_qdata = g_object_get_qdata(this : Object*, quark : UInt32) : Pointer(Void)
  fun object_getv = g_object_getv(this : Object*, n_properties : UInt32, names : Pointer(Pointer(UInt8)), values : Pointer(LibGObject::Value)) : Void
  fun object_is_floating = g_object_is_floating(this : Object*) : LibC::Int
  fun object_notify = g_object_notify(this : Object*, property_name : Pointer(UInt8)) : Void
  fun object_notify_by_pspec = g_object_notify_by_pspec(this : Object*, pspec : Pointer(LibGObject::ParamSpec)) : Void
  fun object_ref = g_object_ref(this : Object*) : Pointer(LibGObject::Object)
  fun object_ref_sink = g_object_ref_sink(this : Object*) : Pointer(LibGObject::Object)
  fun object_run_dispose = g_object_run_dispose(this : Object*) : Void
  fun object_set_data = g_object_set_data(this : Object*, key : Pointer(UInt8), data : Pointer(Void)) : Void
  fun object_set_property = g_object_set_property(this : Object*, property_name : Pointer(UInt8), value : Pointer(LibGObject::Value)) : Void
  fun object_steal_data = g_object_steal_data(this : Object*, key : Pointer(UInt8)) : Pointer(Void)
  fun object_steal_qdata = g_object_steal_qdata(this : Object*, quark : UInt32) : Pointer(Void)
  fun object_thaw_notify = g_object_thaw_notify(this : Object*) : Void
  fun object_unref = g_object_unref(this : Object*) : Void
  fun object_watch_closure = g_object_watch_closure(this : Object*, closure : Pointer(LibGObject::Closure)) : Void

  struct ParamSpec # object
    g_type_instance : LibGObject::TypeInstance
    name : Pointer(UInt8)
    flags : LibGObject::ParamFlags
    value_type : UInt64
    owner_type : UInt64
    _nick : Pointer(UInt8)
    _blurb : Pointer(UInt8)
    qdata : Pointer(LibGLib::Data)
    ref_count : UInt32
    param_id : UInt32
    # Virtual function finalize
    # Virtual function value_set_default
    # Virtual function value_validate
    # Virtual function values_cmp
  end

  fun param_spec_get_blurb = g_param_spec_get_blurb(this : ParamSpec*) : Pointer(UInt8)
  fun param_spec_get_default_value = g_param_spec_get_default_value(this : ParamSpec*) : Pointer(LibGObject::Value)
  fun param_spec_get_name = g_param_spec_get_name(this : ParamSpec*) : Pointer(UInt8)
  fun param_spec_get_name_quark = g_param_spec_get_name_quark(this : ParamSpec*) : UInt32
  fun param_spec_get_nick = g_param_spec_get_nick(this : ParamSpec*) : Pointer(UInt8)
  fun param_spec_get_qdata = g_param_spec_get_qdata(this : ParamSpec*, quark : UInt32) : Pointer(Void)
  fun param_spec_get_redirect_target = g_param_spec_get_redirect_target(this : ParamSpec*) : Pointer(LibGObject::ParamSpec)
  fun param_spec_set_qdata = g_param_spec_set_qdata(this : ParamSpec*, quark : UInt32, data : Pointer(Void)) : Void
  fun param_spec_sink = g_param_spec_sink(this : ParamSpec*) : Void
  fun param_spec_steal_qdata = g_param_spec_steal_qdata(this : ParamSpec*, quark : UInt32) : Pointer(Void)

  struct ParamSpecBoolean # object
    parent_instance : LibGObject::ParamSpec
    default_value : LibC::Int
  end

  struct ParamSpecBoxed # object
    parent_instance : LibGObject::ParamSpec
  end

  struct ParamSpecChar # object
    parent_instance : LibGObject::ParamSpec
    minimum : Int8
    maximum : Int8
    default_value : Int8
  end

  struct ParamSpecDouble # object
    parent_instance : LibGObject::ParamSpec
    minimum : Float64
    maximum : Float64
    default_value : Float64
    epsilon : Float64
  end

  struct ParamSpecEnum # object
    parent_instance : LibGObject::ParamSpec
    enum_class : Pointer(LibGObject::EnumClass)
    default_value : Int32
  end

  struct ParamSpecFlags # object
    parent_instance : LibGObject::ParamSpec
    flags_class : Pointer(LibGObject::FlagsClass)
    default_value : UInt32
  end

  struct ParamSpecFloat # object
    parent_instance : LibGObject::ParamSpec
    minimum : Float32
    maximum : Float32
    default_value : Float32
    epsilon : Float32
  end

  struct ParamSpecGType # object
    parent_instance : LibGObject::ParamSpec
    is_a_type : UInt64
  end

  struct ParamSpecInt # object
    parent_instance : LibGObject::ParamSpec
    minimum : Int32
    maximum : Int32
    default_value : Int32
  end

  struct ParamSpecInt64 # object
    parent_instance : LibGObject::ParamSpec
    minimum : Int64
    maximum : Int64
    default_value : Int64
  end

  struct ParamSpecLong # object
    parent_instance : LibGObject::ParamSpec
    minimum : Int64
    maximum : Int64
    default_value : Int64
  end

  struct ParamSpecObject # object
    parent_instance : LibGObject::ParamSpec
  end

  struct ParamSpecOverride # object
    parent_instance : LibGObject::ParamSpec
    overridden : Pointer(LibGObject::ParamSpec)
  end

  struct ParamSpecParam # object
    parent_instance : LibGObject::ParamSpec
  end

  struct ParamSpecPointer # object
    parent_instance : LibGObject::ParamSpec
  end

  struct ParamSpecString # object
    parent_instance : LibGObject::ParamSpec
    default_value : Pointer(UInt8)
    cset_first : Pointer(UInt8)
    cset_nth : Pointer(UInt8)
    substitutor : Int8
    null_fold_if_empty : UInt32
    ensure_non_null : UInt32
  end

  struct ParamSpecUChar # object
    parent_instance : LibGObject::ParamSpec
    minimum : UInt8
    maximum : UInt8
    default_value : UInt8
  end

  struct ParamSpecUInt # object
    parent_instance : LibGObject::ParamSpec
    minimum : UInt32
    maximum : UInt32
    default_value : UInt32
  end

  struct ParamSpecUInt64 # object
    parent_instance : LibGObject::ParamSpec
    minimum : UInt64
    maximum : UInt64
    default_value : UInt64
  end

  struct ParamSpecULong # object
    parent_instance : LibGObject::ParamSpec
    minimum : UInt64
    maximum : UInt64
    default_value : UInt64
  end

  struct ParamSpecUnichar # object
    parent_instance : LibGObject::ParamSpec
    default_value : UInt8
  end

  struct ParamSpecValueArray # object
    parent_instance : LibGObject::ParamSpec
    element_spec : Pointer(LibGObject::ParamSpec)
    fixed_n_elements : UInt32
  end

  struct ParamSpecVariant # object
    parent_instance : LibGObject::ParamSpec
    type : Pointer(LibGLib::VariantType)
    default_value : Pointer(LibGLib::Variant)
    padding : Pointer(Void)[4]
  end

  struct TypeModule # object
    parent_instance : LibGObject::Object
    use_count : UInt32
    type_infos : Pointer(Void*)
    interface_infos : Pointer(Void*)
    name : Pointer(UInt8)
    # Virtual function load
    # Virtual function unload
  end

  fun _g_type_module_get_type = g_type_module_get_type : UInt64
  fun type_module_add_interface = g_type_module_add_interface(this : TypeModule*, instance_type : UInt64, interface_type : UInt64, interface_info : Pointer(LibGObject::InterfaceInfo)) : Void
  fun type_module_register_enum = g_type_module_register_enum(this : TypeModule*, name : Pointer(UInt8), const_static_values : Pointer(LibGObject::EnumValue)) : UInt64
  fun type_module_register_flags = g_type_module_register_flags(this : TypeModule*, name : Pointer(UInt8), const_static_values : Pointer(LibGObject::FlagsValue)) : UInt64
  fun type_module_register_type = g_type_module_register_type(this : TypeModule*, parent_type : UInt64, type_name : Pointer(UInt8), type_info : Pointer(LibGObject::TypeInfo), flags : LibGObject::TypeFlags) : UInt64
  fun type_module_set_name = g_type_module_set_name(this : TypeModule*, name : Pointer(UInt8)) : Void
  fun type_module_unuse = g_type_module_unuse(this : TypeModule*) : Void
  fun type_module_use = g_type_module_use(this : TypeModule*) : LibC::Int

  ###########################################
  # #    Flags
  ###########################################

  alias BindingFlags = UInt32

  alias ConnectFlags = UInt32

  alias ParamFlags = UInt32

  alias SignalFlags = UInt32

  alias SignalMatchType = UInt32

  alias TypeDebugFlags = UInt32

  alias TypeFlags = UInt32

  alias TypeFundamentalFlags = UInt32

  ###########################################
  # #    Structs
  ###########################################

  struct CClosure # struct
    closure : LibGObject::Closure
    callback : Pointer(Void)
  end

  fun c_closure_marshal_BOOLEAN__BOXED_BOXED = g_cclosure_marshal_BOOLEAN__BOXED_BOXED(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_BOOLEAN__FLAGS = g_cclosure_marshal_BOOLEAN__FLAGS(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_STRING__OBJECT_POINTER = g_cclosure_marshal_STRING__OBJECT_POINTER(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__BOOLEAN = g_cclosure_marshal_VOID__BOOLEAN(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__BOXED = g_cclosure_marshal_VOID__BOXED(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__CHAR = g_cclosure_marshal_VOID__CHAR(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__DOUBLE = g_cclosure_marshal_VOID__DOUBLE(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__ENUM = g_cclosure_marshal_VOID__ENUM(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__FLAGS = g_cclosure_marshal_VOID__FLAGS(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__FLOAT = g_cclosure_marshal_VOID__FLOAT(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__INT = g_cclosure_marshal_VOID__INT(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__LONG = g_cclosure_marshal_VOID__LONG(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__OBJECT = g_cclosure_marshal_VOID__OBJECT(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__PARAM = g_cclosure_marshal_VOID__PARAM(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__POINTER = g_cclosure_marshal_VOID__POINTER(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__STRING = g_cclosure_marshal_VOID__STRING(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__UCHAR = g_cclosure_marshal_VOID__UCHAR(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__UINT = g_cclosure_marshal_VOID__UINT(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__UINT_POINTER = g_cclosure_marshal_VOID__UINT_POINTER(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__ULONG = g_cclosure_marshal_VOID__ULONG(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__VARIANT = g_cclosure_marshal_VOID__VARIANT(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_VOID__VOID = g_cclosure_marshal_VOID__VOID(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun c_closure_marshal_generic = g_cclosure_marshal_generic(closure : Pointer(LibGObject::Closure), return_gvalue : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void

  struct Closure # struct
    ref_count : UInt32
    meta_marshal_nouse : UInt32
    n_guards : UInt32
    n_fnotifiers : UInt32
    n_inotifiers : UInt32
    in_inotify : UInt32
    floating : UInt32
    derivative_flag : UInt32
    in_marshal : UInt32
    is_invalid : UInt32
    marshal : Pointer(LibGObject::Closure), Pointer(LibGObject::Value), UInt32, Pointer(LibGObject::Value), Pointer(Void), Pointer(Void) -> Void
    data : Pointer(Void)
    notifiers : Pointer(LibGObject::ClosureNotifyData)
  end

  fun _g_closure_get_type = g_closure_get_type : UInt64
  fun closure_new_object = g_closure_new_object(sizeof_closure : UInt32, object : Pointer(LibGObject::Object)) : Pointer(LibGObject::Closure)
  fun closure_new_simple = g_closure_new_simple(sizeof_closure : UInt32, data : Pointer(Void)) : Pointer(LibGObject::Closure)
  fun closure_invalidate = g_closure_invalidate(this : Closure*) : Void
  fun closure_invoke = g_closure_invoke(this : Closure*, return_value : LibGObject::Value*, n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void)) : Void
  fun closure_ref = g_closure_ref(this : Closure*) : Pointer(LibGObject::Closure)
  fun closure_sink = g_closure_sink(this : Closure*) : Void
  fun closure_unref = g_closure_unref(this : Closure*) : Void

  struct ClosureNotifyData # struct
    data : Pointer(Void)
    notify : LibGObject::ClosureNotify
  end

  struct EnumClass # struct
    g_type_class : LibGObject::TypeClass
    minimum : Int32
    maximum : Int32
    n_values : UInt32
    values : Pointer(LibGObject::EnumValue)
  end

  struct EnumValue # struct
    value : Int32
    value_name : Pointer(UInt8)
    value_nick : Pointer(UInt8)
  end

  struct FlagsClass # struct
    g_type_class : LibGObject::TypeClass
    mask : UInt32
    n_values : UInt32
    values : Pointer(LibGObject::FlagsValue)
  end

  struct FlagsValue # struct
    value : UInt32
    value_name : Pointer(UInt8)
    value_nick : Pointer(UInt8)
  end

  struct InitiallyUnownedClass # struct
    g_type_class : LibGObject::TypeClass
    construct_properties : Pointer(Void*)
    constructor : Pointer(Void)
    set_property : Pointer(LibGObject::Object), UInt32, Pointer(LibGObject::Value), Pointer(LibGObject::ParamSpec) -> Void
    get_property : Pointer(LibGObject::Object), UInt32, Pointer(LibGObject::Value), Pointer(LibGObject::ParamSpec) -> Void
    dispose : Pointer(LibGObject::Object) -> Void
    finalize : Pointer(LibGObject::Object) -> Void
    dispatch_properties_changed : Pointer(LibGObject::Object), UInt32, Pointer(LibGObject::ParamSpec) -> Void
    notify : Pointer(LibGObject::Object), Pointer(LibGObject::ParamSpec) -> Void
    constructed : Pointer(LibGObject::Object) -> Void
    flags : UInt64
    pdummy : Pointer(Void)[6]
  end

  struct InterfaceInfo # struct
    interface_init : LibGObject::InterfaceInitFunc
    interface_finalize : LibGObject::InterfaceFinalizeFunc
    interface_data : Pointer(Void)
  end

  struct ObjectClass # struct
    g_type_class : LibGObject::TypeClass
    construct_properties : Pointer(Void*)
    constructor : Pointer(Void)
    set_property : Pointer(LibGObject::Object), UInt32, Pointer(LibGObject::Value), Pointer(LibGObject::ParamSpec) -> Void
    get_property : Pointer(LibGObject::Object), UInt32, Pointer(LibGObject::Value), Pointer(LibGObject::ParamSpec) -> Void
    dispose : Pointer(LibGObject::Object) -> Void
    finalize : Pointer(LibGObject::Object) -> Void
    dispatch_properties_changed : Pointer(LibGObject::Object), UInt32, Pointer(LibGObject::ParamSpec) -> Void
    notify : Pointer(LibGObject::Object), Pointer(LibGObject::ParamSpec) -> Void
    constructed : Pointer(LibGObject::Object) -> Void
    flags : UInt64
    pdummy : Pointer(Void)[6]
  end

  fun object_class_find_property = g_object_class_find_property(this : ObjectClass*, property_name : Pointer(UInt8)) : Pointer(LibGObject::ParamSpec)
  fun object_class_install_properties = g_object_class_install_properties(this : ObjectClass*, n_pspecs : UInt32, pspecs : Pointer(Pointer(LibGObject::ParamSpec))) : Void
  fun object_class_install_property = g_object_class_install_property(this : ObjectClass*, property_id : UInt32, pspec : Pointer(LibGObject::ParamSpec)) : Void
  fun object_class_list_properties = g_object_class_list_properties(this : ObjectClass*, n_properties : UInt32*) : Pointer(Pointer(LibGObject::ParamSpec))
  fun object_class_override_property = g_object_class_override_property(this : ObjectClass*, property_id : UInt32, name : Pointer(UInt8)) : Void

  struct ObjectConstructParam # struct
    pspec : Pointer(LibGObject::ParamSpec)
    value : Pointer(LibGObject::Value)
  end

  struct ParamSpecClass # struct
    g_type_class : LibGObject::TypeClass
    value_type : UInt64
    finalize : Pointer(LibGObject::ParamSpec) -> Void
    value_set_default : Pointer(LibGObject::ParamSpec), Pointer(LibGObject::Value) -> Void
    value_validate : Pointer(LibGObject::ParamSpec), Pointer(LibGObject::Value) -> LibC::Int
    values_cmp : Pointer(LibGObject::ParamSpec), Pointer(LibGObject::Value), Pointer(LibGObject::Value) -> Int32
    dummy : Pointer(Void)[4]
  end

  struct ParamSpecPool # struct
    _data : UInt8[0]
  end

  fun param_spec_pool_insert = g_param_spec_pool_insert(this : ParamSpecPool*, pspec : Pointer(LibGObject::ParamSpec), owner_type : UInt64) : Void
  fun param_spec_pool_list = g_param_spec_pool_list(this : ParamSpecPool*, owner_type : UInt64, n_pspecs_p : UInt32*) : Pointer(Pointer(LibGObject::ParamSpec))
  fun param_spec_pool_list_owned = g_param_spec_pool_list_owned(this : ParamSpecPool*, owner_type : UInt64) : Pointer(Void*)
  fun param_spec_pool_lookup = g_param_spec_pool_lookup(this : ParamSpecPool*, param_name : Pointer(UInt8), owner_type : UInt64, walk_ancestors : LibC::Int) : Pointer(LibGObject::ParamSpec)
  fun param_spec_pool_remove = g_param_spec_pool_remove(this : ParamSpecPool*, pspec : Pointer(LibGObject::ParamSpec)) : Void
  fun param_spec_pool_new = g_param_spec_pool_new(type_prefixing : LibC::Int) : Pointer(LibGObject::ParamSpecPool)

  struct ParamSpecTypeInfo # struct
    instance_size : UInt16
    n_preallocs : UInt16
    instance_init : Pointer(LibGObject::ParamSpec) -> Void
    value_type : UInt64
    finalize : Pointer(LibGObject::ParamSpec) -> Void
    value_set_default : Pointer(LibGObject::ParamSpec), Pointer(LibGObject::Value) -> Void
    value_validate : Pointer(LibGObject::ParamSpec), Pointer(LibGObject::Value) -> LibC::Int
    values_cmp : Pointer(LibGObject::ParamSpec), Pointer(LibGObject::Value), Pointer(LibGObject::Value) -> Int32
  end

  struct Parameter # struct
    name : Pointer(UInt8)
    value : LibGObject::Value
  end

  struct SignalInvocationHint # struct
    signal_id : UInt32
    detail : UInt32
    run_type : LibGObject::SignalFlags
  end

  struct SignalQuery # struct
    signal_id : UInt32
    signal_name : Pointer(UInt8)
    itype : UInt64
    signal_flags : LibGObject::SignalFlags
    return_type : UInt64
    n_params : UInt32
    param_types : Pointer(UInt64)
  end

  struct TypeClass # struct
    g_type : UInt64
  end

  fun type_class_add_private = g_type_class_add_private(this : TypeClass*, private_size : UInt64) : Void
  fun type_class_get_private = g_type_class_get_private(this : TypeClass*, private_type : UInt64) : Pointer(Void)
  fun type_class_peek_parent = g_type_class_peek_parent(this : TypeClass*) : Pointer(LibGObject::TypeClass)
  fun type_class_unref = g_type_class_unref(this : TypeClass*) : Void
  fun type_class_adjust_private_offset = g_type_class_adjust_private_offset(g_class : Pointer(Void), private_size_or_offset : Pointer(Int32)) : Void
  fun type_class_peek = g_type_class_peek(type : UInt64) : Pointer(LibGObject::TypeClass)
  fun type_class_peek_static = g_type_class_peek_static(type : UInt64) : Pointer(LibGObject::TypeClass)
  fun type_class_ref = g_type_class_ref(type : UInt64) : Pointer(LibGObject::TypeClass)

  struct TypeFundamentalInfo # struct
    type_flags : LibGObject::TypeFundamentalFlags
  end

  struct TypeInfo # struct
    class_size : UInt16
    base_init : LibGObject::BaseInitFunc
    base_finalize : LibGObject::BaseFinalizeFunc
    class_init : LibGObject::ClassInitFunc
    class_finalize : LibGObject::ClassFinalizeFunc
    class_data : Pointer(Void)
    instance_size : UInt16
    n_preallocs : UInt16
    instance_init : LibGObject::InstanceInitFunc
    value_table : Pointer(LibGObject::TypeValueTable)
  end

  struct TypeInstance # struct
    g_class : Pointer(LibGObject::TypeClass)
  end

  fun type_instance_get_private = g_type_instance_get_private(this : TypeInstance*, private_type : UInt64) : Pointer(Void)

  struct TypeInterface # struct
    g_type : UInt64
    g_instance_type : UInt64
  end

  fun type_interface_peek_parent = g_type_interface_peek_parent(this : TypeInterface*) : Pointer(LibGObject::TypeInterface)
  fun type_interface_add_prerequisite = g_type_interface_add_prerequisite(interface_type : UInt64, prerequisite_type : UInt64) : Void
  fun type_interface_get_plugin = g_type_interface_get_plugin(instance_type : UInt64, interface_type : UInt64) : Pointer(LibGObject::TypePlugin)
  fun type_interface_peek = g_type_interface_peek(instance_class : Pointer(LibGObject::TypeClass), iface_type : UInt64) : Pointer(LibGObject::TypeInterface)
  fun type_interface_prerequisites = g_type_interface_prerequisites(interface_type : UInt64, n_prerequisites : UInt32*) : Pointer(UInt64)

  struct TypeModuleClass # struct
    parent_class : LibGObject::ObjectClass
    load : Pointer(LibGObject::TypeModule) -> LibC::Int
    unload : Pointer(LibGObject::TypeModule) -> Void
    reserved1 : -> Void
    reserved2 : -> Void
    reserved3 : -> Void
    reserved4 : -> Void
  end

  struct TypePluginClass # struct
    base_iface : LibGObject::TypeInterface
    use_plugin : LibGObject::TypePluginUse
    unuse_plugin : LibGObject::TypePluginUnuse
    complete_type_info : LibGObject::TypePluginCompleteTypeInfo
    complete_interface_info : LibGObject::TypePluginCompleteInterfaceInfo
  end

  struct TypeQuery # struct
    type : UInt64
    type_name : Pointer(UInt8)
    class_size : UInt32
    instance_size : UInt32
  end

  struct TypeValueTable # struct
    value_init : Pointer(LibGObject::Value) -> Void
    value_free : Pointer(LibGObject::Value) -> Void
    value_copy : Pointer(LibGObject::Value), Pointer(LibGObject::Value) -> Void
    value_peek_pointer : Pointer(LibGObject::Value) -> Pointer(Void)
    collect_format : Pointer(UInt8)
    collect_value : Pointer(LibGObject::Value), UInt32, Pointer(LibGObject::TypeCValue), UInt32 -> Pointer(UInt8)
    lcopy_format : Pointer(UInt8)
    lcopy_value : Pointer(LibGObject::Value), UInt32, Pointer(LibGObject::TypeCValue), UInt32 -> Pointer(UInt8)
  end

  struct Value # struct
    g_type : UInt64
    data : LibGObject::G_Value__data__union[2]
  end

  fun _g_value_get_type = g_value_get_type : UInt64
  fun value_copy = g_value_copy(this : Value*, dest_value : Pointer(LibGObject::Value)) : Void
  fun value_dup_object = g_value_dup_object(this : Value*) : Pointer(LibGObject::Object)
  fun value_dup_string = g_value_dup_string(this : Value*) : Pointer(UInt8)
  fun value_dup_variant = g_value_dup_variant(this : Value*) : Pointer(LibGLib::Variant)
  fun value_fits_pointer = g_value_fits_pointer(this : Value*) : LibC::Int
  fun value_get_boolean = g_value_get_boolean(this : Value*) : LibC::Int
  fun value_get_boxed = g_value_get_boxed(this : Value*) : Pointer(Void)
  fun value_get_char = g_value_get_char(this : Value*) : Int8
  fun value_get_double = g_value_get_double(this : Value*) : Float64
  fun value_get_enum = g_value_get_enum(this : Value*) : Int32
  fun value_get_flags = g_value_get_flags(this : Value*) : UInt32
  fun value_get_float = g_value_get_float(this : Value*) : Float32
  fun value_get_gtype = g_value_get_gtype(this : Value*) : UInt64
  fun value_get_int = g_value_get_int(this : Value*) : Int32
  fun value_get_int64 = g_value_get_int64(this : Value*) : Int64
  fun value_get_long = g_value_get_long(this : Value*) : Int64
  fun value_get_object = g_value_get_object(this : Value*) : Pointer(LibGObject::Object)
  fun value_get_param = g_value_get_param(this : Value*) : Pointer(LibGObject::ParamSpec)
  fun value_get_pointer = g_value_get_pointer(this : Value*) : Pointer(Void)
  fun value_get_schar = g_value_get_schar(this : Value*) : Int8
  fun value_get_string = g_value_get_string(this : Value*) : Pointer(UInt8)
  fun value_get_uchar = g_value_get_uchar(this : Value*) : UInt8
  fun value_get_uint = g_value_get_uint(this : Value*) : UInt32
  fun value_get_uint64 = g_value_get_uint64(this : Value*) : UInt64
  fun value_get_ulong = g_value_get_ulong(this : Value*) : UInt64
  fun value_get_variant = g_value_get_variant(this : Value*) : Pointer(LibGLib::Variant)
  fun value_init = g_value_init(this : Value*, g_type : UInt64) : Pointer(LibGObject::Value)
  fun value_init_from_instance = g_value_init_from_instance(this : Value*, instance : Pointer(LibGObject::TypeInstance)) : Void
  fun value_peek_pointer = g_value_peek_pointer(this : Value*) : Pointer(Void)
  fun value_reset = g_value_reset(this : Value*) : Pointer(LibGObject::Value)
  fun value_set_boolean = g_value_set_boolean(this : Value*, v_boolean : LibC::Int) : Void
  fun value_set_boxed = g_value_set_boxed(this : Value*, v_boxed : Pointer(Void)) : Void
  fun value_set_boxed_take_ownership = g_value_set_boxed_take_ownership(this : Value*, v_boxed : Pointer(Void)) : Void
  fun value_set_char = g_value_set_char(this : Value*, v_char : Int8) : Void
  fun value_set_double = g_value_set_double(this : Value*, v_double : Float64) : Void
  fun value_set_enum = g_value_set_enum(this : Value*, v_enum : Int32) : Void
  fun value_set_flags = g_value_set_flags(this : Value*, v_flags : UInt32) : Void
  fun value_set_float = g_value_set_float(this : Value*, v_float : Float32) : Void
  fun value_set_gtype = g_value_set_gtype(this : Value*, v_gtype : UInt64) : Void
  fun value_set_instance = g_value_set_instance(this : Value*, instance : Pointer(Void)) : Void
  fun value_set_int = g_value_set_int(this : Value*, v_int : Int32) : Void
  fun value_set_int64 = g_value_set_int64(this : Value*, v_int64 : Int64) : Void
  fun value_set_long = g_value_set_long(this : Value*, v_long : Int64) : Void
  fun value_set_object = g_value_set_object(this : Value*, v_object : Pointer(LibGObject::Object)) : Void
  fun value_set_param = g_value_set_param(this : Value*, param : Pointer(LibGObject::ParamSpec)) : Void
  fun value_set_pointer = g_value_set_pointer(this : Value*, v_pointer : Pointer(Void)) : Void
  fun value_set_schar = g_value_set_schar(this : Value*, v_char : Int8) : Void
  fun value_set_static_boxed = g_value_set_static_boxed(this : Value*, v_boxed : Pointer(Void)) : Void
  fun value_set_static_string = g_value_set_static_string(this : Value*, v_string : Pointer(UInt8)) : Void
  fun value_set_string = g_value_set_string(this : Value*, v_string : Pointer(UInt8)) : Void
  fun value_set_string_take_ownership = g_value_set_string_take_ownership(this : Value*, v_string : Pointer(UInt8)) : Void
  fun value_set_uchar = g_value_set_uchar(this : Value*, v_uchar : UInt8) : Void
  fun value_set_uint = g_value_set_uint(this : Value*, v_uint : UInt32) : Void
  fun value_set_uint64 = g_value_set_uint64(this : Value*, v_uint64 : UInt64) : Void
  fun value_set_ulong = g_value_set_ulong(this : Value*, v_ulong : UInt64) : Void
  fun value_set_variant = g_value_set_variant(this : Value*, variant : Pointer(LibGLib::Variant)) : Void
  fun value_take_boxed = g_value_take_boxed(this : Value*, v_boxed : Pointer(Void)) : Void
  fun value_take_string = g_value_take_string(this : Value*, v_string : Pointer(UInt8)) : Void
  fun value_take_variant = g_value_take_variant(this : Value*, variant : Pointer(LibGLib::Variant)) : Void
  fun value_transform = g_value_transform(this : Value*, dest_value : Pointer(LibGObject::Value)) : LibC::Int
  fun value_unset = g_value_unset(this : Value*) : Void
  fun value_type_compatible = g_value_type_compatible(src_type : UInt64, dest_type : UInt64) : LibC::Int
  fun value_type_transformable = g_value_type_transformable(src_type : UInt64, dest_type : UInt64) : LibC::Int

  struct ValueArray # struct
    n_values : UInt32
    values : Pointer(LibGObject::Value)
    n_prealloced : UInt32
  end

  fun _g_value_array_get_type = g_value_array_get_type : UInt64
  fun value_array_new = g_value_array_new(n_prealloced : UInt32) : Pointer(LibGObject::ValueArray)
  fun value_array_append = g_value_array_append(this : ValueArray*, value : Pointer(LibGObject::Value)) : Pointer(LibGObject::ValueArray)
  fun value_array_copy = g_value_array_copy(this : ValueArray*) : Pointer(LibGObject::ValueArray)
  fun value_array_get_nth = g_value_array_get_nth(this : ValueArray*, index_ : UInt32) : Pointer(LibGObject::Value)
  fun value_array_insert = g_value_array_insert(this : ValueArray*, index_ : UInt32, value : Pointer(LibGObject::Value)) : Pointer(LibGObject::ValueArray)
  fun value_array_prepend = g_value_array_prepend(this : ValueArray*, value : Pointer(LibGObject::Value)) : Pointer(LibGObject::ValueArray)
  fun value_array_remove = g_value_array_remove(this : ValueArray*, index_ : UInt32) : Pointer(LibGObject::ValueArray)
  fun value_array_sort = g_value_array_sort_with_data(this : ValueArray*, compare_func : LibGLib::CompareDataFunc, user_data : Pointer(Void)) : Pointer(LibGObject::ValueArray)

  struct WeakRef # struct
    _data : UInt8[0]
  end

  ###########################################
  # #    Constants
  ###########################################
  PARAM_MASK                =       255 # : Int32
  PARAM_STATIC_STRINGS      =       224 # : Int32
  PARAM_USER_SHIFT          =         8 # : Int32
  SIGNAL_FLAGS_MASK         =       511 # : Int32
  SIGNAL_MATCH_MASK         =        63 # : Int32
  TYPE_FLAG_RESERVED_ID_BIT =      1u64 # : UInt64
  TYPE_FUNDAMENTAL_MAX      =       255 # : Int32
  TYPE_FUNDAMENTAL_SHIFT    =         2 # : Int32
  TYPE_RESERVED_BSE_FIRST   =        32 # : Int32
  TYPE_RESERVED_BSE_LAST    =        48 # : Int32
  TYPE_RESERVED_GLIB_FIRST  =        22 # : Int32
  TYPE_RESERVED_GLIB_LAST   =        31 # : Int32
  TYPE_RESERVED_USER_FIRST  =        49 # : Int32
  VALUE_NOCOPY_CONTENTS     = 134217728 # : Int32

  ###########################################
  # #    Unions
  ###########################################
  alias TypeCValue = Void*

  union G_Value__data__union
    v_int : Int32
    v_uint : UInt32
    v_long : Int64
    v_ulong : UInt64
    v_int64 : Int64
    v_uint64 : UInt64
    v_float : Float32
    v_double : Float64
    v_pointer : Pointer(Void)
  end

  ###########################################
  # #    Interfaces
  ###########################################

  struct TypePlugin # interface
    _data : UInt8[0]
  end

  fun _g_type_plugin_get_type = g_type_plugin_get_type : UInt64
  fun type_plugin_complete_interface_info = g_type_plugin_complete_interface_info(this : TypePlugin*, instance_type : UInt64, interface_type : UInt64, info : Pointer(LibGObject::InterfaceInfo)) : Void
  fun type_plugin_complete_type_info = g_type_plugin_complete_type_info(this : TypePlugin*, g_type : UInt64, info : Pointer(LibGObject::TypeInfo), value_table : Pointer(LibGObject::TypeValueTable)) : Void
  fun type_plugin_unuse = g_type_plugin_unuse(this : TypePlugin*) : Void
  fun type_plugin_use = g_type_plugin_use(this : TypePlugin*) : Void

  ###########################################
  # #    Functions
  ###########################################
  fun boxed_copy = g_boxed_copy(boxed_type : UInt64, src_boxed : Pointer(Void)) : Pointer(Void)
  fun boxed_free = g_boxed_free(boxed_type : UInt64, boxed : Pointer(Void)) : Void
  fun cclosure_marshal_BOOLEAN__BOXED_BOXED = g_cclosure_marshal_BOOLEAN__BOXED_BOXED(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_BOOLEAN__FLAGS = g_cclosure_marshal_BOOLEAN__FLAGS(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_STRING__OBJECT_POINTER = g_cclosure_marshal_STRING__OBJECT_POINTER(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__BOOLEAN = g_cclosure_marshal_VOID__BOOLEAN(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__BOXED = g_cclosure_marshal_VOID__BOXED(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__CHAR = g_cclosure_marshal_VOID__CHAR(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__DOUBLE = g_cclosure_marshal_VOID__DOUBLE(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__ENUM = g_cclosure_marshal_VOID__ENUM(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__FLAGS = g_cclosure_marshal_VOID__FLAGS(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__FLOAT = g_cclosure_marshal_VOID__FLOAT(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__INT = g_cclosure_marshal_VOID__INT(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__LONG = g_cclosure_marshal_VOID__LONG(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__OBJECT = g_cclosure_marshal_VOID__OBJECT(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__PARAM = g_cclosure_marshal_VOID__PARAM(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__POINTER = g_cclosure_marshal_VOID__POINTER(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__STRING = g_cclosure_marshal_VOID__STRING(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__UCHAR = g_cclosure_marshal_VOID__UCHAR(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__UINT = g_cclosure_marshal_VOID__UINT(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__UINT_POINTER = g_cclosure_marshal_VOID__UINT_POINTER(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__ULONG = g_cclosure_marshal_VOID__ULONG(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__VARIANT = g_cclosure_marshal_VOID__VARIANT(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_VOID__VOID = g_cclosure_marshal_VOID__VOID(closure : Pointer(LibGObject::Closure), return_value : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun cclosure_marshal_generic = g_cclosure_marshal_generic(closure : Pointer(LibGObject::Closure), return_gvalue : Pointer(LibGObject::Value), n_param_values : UInt32, param_values : Pointer(LibGObject::Value), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun clear_signal_handler = g_clear_signal_handler(handler_id_ptr : Pointer(UInt64), instance : Pointer(LibGObject::Object)) : Void
  fun enum_complete_type_info = g_enum_complete_type_info(g_enum_type : UInt64, info : LibGObject::TypeInfo*, const_values : Pointer(LibGObject::EnumValue)) : Void
  fun enum_get_value = g_enum_get_value(enum_class : Pointer(LibGObject::EnumClass), value : Int32) : Pointer(LibGObject::EnumValue)
  fun enum_get_value_by_name = g_enum_get_value_by_name(enum_class : Pointer(LibGObject::EnumClass), name : Pointer(UInt8)) : Pointer(LibGObject::EnumValue)
  fun enum_get_value_by_nick = g_enum_get_value_by_nick(enum_class : Pointer(LibGObject::EnumClass), nick : Pointer(UInt8)) : Pointer(LibGObject::EnumValue)
  fun enum_register_static = g_enum_register_static(name : Pointer(UInt8), const_static_values : Pointer(LibGObject::EnumValue)) : UInt64
  fun enum_to_string = g_enum_to_string(g_enum_type : UInt64, value : Int32) : Pointer(UInt8)
  fun flags_complete_type_info = g_flags_complete_type_info(g_flags_type : UInt64, info : LibGObject::TypeInfo*, const_values : Pointer(LibGObject::FlagsValue)) : Void
  fun flags_get_first_value = g_flags_get_first_value(flags_class : Pointer(LibGObject::FlagsClass), value : UInt32) : Pointer(LibGObject::FlagsValue)
  fun flags_get_value_by_name = g_flags_get_value_by_name(flags_class : Pointer(LibGObject::FlagsClass), name : Pointer(UInt8)) : Pointer(LibGObject::FlagsValue)
  fun flags_get_value_by_nick = g_flags_get_value_by_nick(flags_class : Pointer(LibGObject::FlagsClass), nick : Pointer(UInt8)) : Pointer(LibGObject::FlagsValue)
  fun flags_register_static = g_flags_register_static(name : Pointer(UInt8), const_static_values : Pointer(LibGObject::FlagsValue)) : UInt64
  fun flags_to_string = g_flags_to_string(flags_type : UInt64, value : UInt32) : Pointer(UInt8)
  fun gtype_get_type = g_gtype_get_type : UInt64
  fun param_spec_boolean = g_param_spec_boolean(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), default_value : LibC::Int, flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_boxed = g_param_spec_boxed(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), boxed_type : UInt64, flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_char = g_param_spec_char(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), minimum : Int8, maximum : Int8, default_value : Int8, flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_double = g_param_spec_double(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), minimum : Float64, maximum : Float64, default_value : Float64, flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_enum = g_param_spec_enum(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), enum_type : UInt64, default_value : Int32, flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_flags = g_param_spec_flags(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), flags_type : UInt64, default_value : UInt32, flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_float = g_param_spec_float(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), minimum : Float32, maximum : Float32, default_value : Float32, flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_gtype = g_param_spec_gtype(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), is_a_type : UInt64, flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_int = g_param_spec_int(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), minimum : Int32, maximum : Int32, default_value : Int32, flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_int64 = g_param_spec_int64(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), minimum : Int64, maximum : Int64, default_value : Int64, flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_long = g_param_spec_long(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), minimum : Int64, maximum : Int64, default_value : Int64, flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_object = g_param_spec_object(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), object_type : UInt64, flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_param = g_param_spec_param(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), param_type : UInt64, flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_pointer = g_param_spec_pointer(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_pool_new = g_param_spec_pool_new(type_prefixing : LibC::Int) : Pointer(LibGObject::ParamSpecPool)
  fun param_spec_string = g_param_spec_string(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), default_value : Pointer(UInt8), flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_uchar = g_param_spec_uchar(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), minimum : UInt8, maximum : UInt8, default_value : UInt8, flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_uint = g_param_spec_uint(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), minimum : UInt32, maximum : UInt32, default_value : UInt32, flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_uint64 = g_param_spec_uint64(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), minimum : UInt64, maximum : UInt64, default_value : UInt64, flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_ulong = g_param_spec_ulong(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), minimum : UInt64, maximum : UInt64, default_value : UInt64, flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_unichar = g_param_spec_unichar(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), default_value : UInt8, flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_spec_variant = g_param_spec_variant(name : Pointer(UInt8), nick : Pointer(UInt8), blurb : Pointer(UInt8), type : Pointer(LibGLib::VariantType), default_value : Pointer(LibGLib::Variant), flags : LibGObject::ParamFlags) : Pointer(LibGObject::ParamSpec)
  fun param_type_register_static = g_param_type_register_static(name : Pointer(UInt8), pspec_info : Pointer(LibGObject::ParamSpecTypeInfo)) : UInt64
  fun param_value_convert = g_param_value_convert(pspec : Pointer(LibGObject::ParamSpec), src_value : Pointer(LibGObject::Value), dest_value : Pointer(LibGObject::Value), strict_validation : LibC::Int) : LibC::Int
  fun param_value_defaults = g_param_value_defaults(pspec : Pointer(LibGObject::ParamSpec), value : Pointer(LibGObject::Value)) : LibC::Int
  fun param_value_set_default = g_param_value_set_default(pspec : Pointer(LibGObject::ParamSpec), value : Pointer(LibGObject::Value)) : Void
  fun param_value_validate = g_param_value_validate(pspec : Pointer(LibGObject::ParamSpec), value : Pointer(LibGObject::Value)) : LibC::Int
  fun param_values_cmp = g_param_values_cmp(pspec : Pointer(LibGObject::ParamSpec), value1 : Pointer(LibGObject::Value), value2 : Pointer(LibGObject::Value)) : Int32
  fun pointer_type_register_static = g_pointer_type_register_static(name : Pointer(UInt8)) : UInt64
  fun signal_accumulator_first_wins = g_signal_accumulator_first_wins(ihint : Pointer(LibGObject::SignalInvocationHint), return_accu : Pointer(LibGObject::Value), handler_return : Pointer(LibGObject::Value), dummy : Pointer(Void)) : LibC::Int
  fun signal_accumulator_true_handled = g_signal_accumulator_true_handled(ihint : Pointer(LibGObject::SignalInvocationHint), return_accu : Pointer(LibGObject::Value), handler_return : Pointer(LibGObject::Value), dummy : Pointer(Void)) : LibC::Int
  fun signal_add_emission_hook = g_signal_add_emission_hook(signal_id : UInt32, detail : UInt32, hook_func : LibGObject::SignalEmissionHook, hook_data : Pointer(Void), data_destroy : LibGLib::DestroyNotify) : UInt64
  fun signal_chain_from_overridden = g_signal_chain_from_overridden(instance_and_params : Pointer(LibGObject::Value), return_value : Pointer(LibGObject::Value)) : Void
  fun signal_connect_closure = g_signal_connect_closure(instance : Pointer(LibGObject::Object), detailed_signal : Pointer(UInt8), closure : Pointer(LibGObject::Closure), after : LibC::Int) : UInt64
  fun signal_connect_closure_by_id = g_signal_connect_closure_by_id(instance : Pointer(LibGObject::Object), signal_id : UInt32, detail : UInt32, closure : Pointer(LibGObject::Closure), after : LibC::Int) : UInt64
  fun signal_emitv = g_signal_emitv(instance_and_params : Pointer(LibGObject::Value), signal_id : UInt32, detail : UInt32, return_value : LibGObject::Value*) : Void
  fun signal_get_invocation_hint = g_signal_get_invocation_hint(instance : Pointer(LibGObject::Object)) : Pointer(LibGObject::SignalInvocationHint)
  fun signal_handler_block = g_signal_handler_block(instance : Pointer(LibGObject::Object), handler_id : UInt64) : Void
  fun signal_handler_disconnect = g_signal_handler_disconnect(instance : Pointer(LibGObject::Object), handler_id : UInt64) : Void
  fun signal_handler_find = g_signal_handler_find(instance : Pointer(LibGObject::Object), mask : LibGObject::SignalMatchType, signal_id : UInt32, detail : UInt32, closure : Pointer(LibGObject::Closure), func : Pointer(Void), data : Pointer(Void)) : UInt64
  fun signal_handler_is_connected = g_signal_handler_is_connected(instance : Pointer(LibGObject::Object), handler_id : UInt64) : LibC::Int
  fun signal_handler_unblock = g_signal_handler_unblock(instance : Pointer(LibGObject::Object), handler_id : UInt64) : Void
  fun signal_handlers_block_matched = g_signal_handlers_block_matched(instance : Pointer(LibGObject::Object), mask : LibGObject::SignalMatchType, signal_id : UInt32, detail : UInt32, closure : Pointer(LibGObject::Closure), func : Pointer(Void), data : Pointer(Void)) : UInt32
  fun signal_handlers_destroy = g_signal_handlers_destroy(instance : Pointer(LibGObject::Object)) : Void
  fun signal_handlers_disconnect_matched = g_signal_handlers_disconnect_matched(instance : Pointer(LibGObject::Object), mask : LibGObject::SignalMatchType, signal_id : UInt32, detail : UInt32, closure : Pointer(LibGObject::Closure), func : Pointer(Void), data : Pointer(Void)) : UInt32
  fun signal_handlers_unblock_matched = g_signal_handlers_unblock_matched(instance : Pointer(LibGObject::Object), mask : LibGObject::SignalMatchType, signal_id : UInt32, detail : UInt32, closure : Pointer(LibGObject::Closure), func : Pointer(Void), data : Pointer(Void)) : UInt32
  fun signal_has_handler_pending = g_signal_has_handler_pending(instance : Pointer(LibGObject::Object), signal_id : UInt32, detail : UInt32, may_be_blocked : LibC::Int) : LibC::Int
  fun signal_list_ids = g_signal_list_ids(itype : UInt64, n_ids : UInt32*) : Pointer(UInt32)
  fun signal_lookup = g_signal_lookup(name : Pointer(UInt8), itype : UInt64) : UInt32
  fun signal_name = g_signal_name(signal_id : UInt32) : Pointer(UInt8)
  fun signal_override_class_closure = g_signal_override_class_closure(signal_id : UInt32, instance_type : UInt64, class_closure : Pointer(LibGObject::Closure)) : Void
  fun signal_parse_name = g_signal_parse_name(detailed_signal : Pointer(UInt8), itype : UInt64, signal_id_p : UInt32*, detail_p : UInt32*, force_detail_quark : LibC::Int) : LibC::Int
  fun signal_query = g_signal_query(signal_id : UInt32, query : LibGObject::SignalQuery*) : Void
  fun signal_remove_emission_hook = g_signal_remove_emission_hook(signal_id : UInt32, hook_id : UInt64) : Void
  fun signal_set_va_marshaller = g_signal_set_va_marshaller(signal_id : UInt32, instance_type : UInt64, va_marshaller : Void*) : Void
  fun signal_stop_emission = g_signal_stop_emission(instance : Pointer(LibGObject::Object), signal_id : UInt32, detail : UInt32) : Void
  fun signal_stop_emission_by_name = g_signal_stop_emission_by_name(instance : Pointer(LibGObject::Object), detailed_signal : Pointer(UInt8)) : Void
  fun signal_type_cclosure_new = g_signal_type_cclosure_new(itype : UInt64, struct_offset : UInt32) : Pointer(LibGObject::Closure)
  fun source_set_closure = g_source_set_closure(source : Pointer(LibGLib::Source), closure : Pointer(LibGObject::Closure)) : Void
  fun source_set_dummy_callback = g_source_set_dummy_callback(source : Pointer(LibGLib::Source)) : Void
  fun strdup_value_contents = g_strdup_value_contents(value : Pointer(LibGObject::Value)) : Pointer(UInt8)
  fun type_add_class_private = g_type_add_class_private(class_type : UInt64, private_size : UInt64) : Void
  fun type_add_instance_private = g_type_add_instance_private(class_type : UInt64, private_size : UInt64) : Int32
  fun type_add_interface_dynamic = g_type_add_interface_dynamic(instance_type : UInt64, interface_type : UInt64, plugin : Pointer(LibGObject::TypePlugin)) : Void
  fun type_add_interface_static = g_type_add_interface_static(instance_type : UInt64, interface_type : UInt64, info : Pointer(LibGObject::InterfaceInfo)) : Void
  fun type_check_class_is_a = g_type_check_class_is_a(g_class : Pointer(LibGObject::TypeClass), is_a_type : UInt64) : LibC::Int
  fun type_check_instance = g_type_check_instance(instance : Pointer(LibGObject::TypeInstance)) : LibC::Int
  fun type_check_instance_is_a = g_type_check_instance_is_a(instance : Pointer(LibGObject::TypeInstance), iface_type : UInt64) : LibC::Int
  fun type_check_instance_is_fundamentally_a = g_type_check_instance_is_fundamentally_a(instance : Pointer(LibGObject::TypeInstance), fundamental_type : UInt64) : LibC::Int
  fun type_check_is_value_type = g_type_check_is_value_type(type : UInt64) : LibC::Int
  fun type_check_value = g_type_check_value(value : Pointer(LibGObject::Value)) : LibC::Int
  fun type_check_value_holds = g_type_check_value_holds(value : Pointer(LibGObject::Value), type : UInt64) : LibC::Int
  fun type_children = g_type_children(type : UInt64, n_children : UInt32*) : Pointer(UInt64)
  fun type_class_adjust_private_offset = g_type_class_adjust_private_offset(g_class : Pointer(Void), private_size_or_offset : Pointer(Int32)) : Void
  fun type_class_peek = g_type_class_peek(type : UInt64) : Pointer(LibGObject::TypeClass)
  fun type_class_peek_static = g_type_class_peek_static(type : UInt64) : Pointer(LibGObject::TypeClass)
  fun type_class_ref = g_type_class_ref(type : UInt64) : Pointer(LibGObject::TypeClass)
  fun type_default_interface_peek = g_type_default_interface_peek(g_type : UInt64) : Pointer(LibGObject::TypeInterface)
  fun type_default_interface_ref = g_type_default_interface_ref(g_type : UInt64) : Pointer(LibGObject::TypeInterface)
  fun type_default_interface_unref = g_type_default_interface_unref(g_iface : Pointer(LibGObject::TypeInterface)) : Void
  fun type_depth = g_type_depth(type : UInt64) : UInt32
  fun type_ensure = g_type_ensure(type : UInt64) : Void
  fun type_free_instance = g_type_free_instance(instance : Pointer(LibGObject::TypeInstance)) : Void
  fun type_from_name = g_type_from_name(name : Pointer(UInt8)) : UInt64
  fun type_fundamental = g_type_fundamental(type_id : UInt64) : UInt64
  fun type_fundamental_next = g_type_fundamental_next : UInt64
  fun type_get_instance_count = g_type_get_instance_count(type : UInt64) : Int32
  fun type_get_plugin = g_type_get_plugin(type : UInt64) : Pointer(LibGObject::TypePlugin)
  fun type_get_qdata = g_type_get_qdata(type : UInt64, quark : UInt32) : Pointer(Void)
  fun type_get_type_registration_serial = g_type_get_type_registration_serial : UInt32
  fun type_init = g_type_init : Void
  fun type_init_with_debug_flags = g_type_init_with_debug_flags(debug_flags : LibGObject::TypeDebugFlags) : Void
  fun type_interface_add_prerequisite = g_type_interface_add_prerequisite(interface_type : UInt64, prerequisite_type : UInt64) : Void
  fun type_interface_get_plugin = g_type_interface_get_plugin(instance_type : UInt64, interface_type : UInt64) : Pointer(LibGObject::TypePlugin)
  fun type_interface_peek = g_type_interface_peek(instance_class : Pointer(LibGObject::TypeClass), iface_type : UInt64) : Pointer(LibGObject::TypeInterface)
  fun type_interface_prerequisites = g_type_interface_prerequisites(interface_type : UInt64, n_prerequisites : UInt32*) : Pointer(UInt64)
  fun type_interfaces = g_type_interfaces(type : UInt64, n_interfaces : UInt32*) : Pointer(UInt64)
  fun type_is_a = g_type_is_a(type : UInt64, is_a_type : UInt64) : LibC::Int
  fun type_name = g_type_name(type : UInt64) : Pointer(UInt8)
  fun type_name_from_class = g_type_name_from_class(g_class : Pointer(LibGObject::TypeClass)) : Pointer(UInt8)
  fun type_name_from_instance = g_type_name_from_instance(instance : Pointer(LibGObject::TypeInstance)) : Pointer(UInt8)
  fun type_next_base = g_type_next_base(leaf_type : UInt64, root_type : UInt64) : UInt64
  fun type_parent = g_type_parent(type : UInt64) : UInt64
  fun type_qname = g_type_qname(type : UInt64) : UInt32
  fun type_query = g_type_query(type : UInt64, query : LibGObject::TypeQuery*) : Void
  fun type_register_dynamic = g_type_register_dynamic(parent_type : UInt64, type_name : Pointer(UInt8), plugin : Pointer(LibGObject::TypePlugin), flags : LibGObject::TypeFlags) : UInt64
  fun type_register_fundamental = g_type_register_fundamental(type_id : UInt64, type_name : Pointer(UInt8), info : Pointer(LibGObject::TypeInfo), finfo : Pointer(LibGObject::TypeFundamentalInfo), flags : LibGObject::TypeFlags) : UInt64
  fun type_register_static = g_type_register_static(parent_type : UInt64, type_name : Pointer(UInt8), info : Pointer(LibGObject::TypeInfo), flags : LibGObject::TypeFlags) : UInt64
  fun type_set_qdata = g_type_set_qdata(type : UInt64, quark : UInt32, data : Pointer(Void)) : Void
  fun type_test_flags = g_type_test_flags(type : UInt64, flags : UInt32) : LibC::Int
  fun value_type_compatible = g_value_type_compatible(src_type : UInt64, dest_type : UInt64) : LibC::Int
  fun value_type_transformable = g_value_type_transformable(src_type : UInt64, dest_type : UInt64) : LibC::Int

  ###########################################
  # #    Callbacks
  ###########################################
  alias BaseFinalizeFunc = Pointer(LibGObject::TypeClass) -> Void
  alias BaseInitFunc = Pointer(LibGObject::TypeClass) -> Void
  alias BindingTransformFunc = Pointer(LibGObject::Binding), Pointer(LibGObject::Value), Pointer(LibGObject::Value), Pointer(Void) -> LibC::Int
  alias BoxedCopyFunc = Pointer(Void) -> Pointer(Void)
  alias BoxedFreeFunc = Pointer(Void) -> Void
  alias Callback = -> Void
  alias ClassFinalizeFunc = Pointer(LibGObject::TypeClass), Pointer(Void) -> Void
  alias ClassInitFunc = Pointer(LibGObject::TypeClass), Pointer(Void) -> Void
  alias ClosureMarshal = Pointer(LibGObject::Closure), Pointer(LibGObject::Value), UInt32, Pointer(LibGObject::Value), Pointer(Void), Pointer(Void) -> Void
  alias ClosureNotify = Pointer(Void), Pointer(LibGObject::Closure) -> Void
  alias InstanceInitFunc = Pointer(LibGObject::TypeInstance), Pointer(LibGObject::TypeClass) -> Void
  alias InterfaceFinalizeFunc = Pointer(LibGObject::TypeInterface), Pointer(Void) -> Void
  alias InterfaceInitFunc = Pointer(LibGObject::TypeInterface), Pointer(Void) -> Void
  alias ObjectFinalizeFunc = Pointer(LibGObject::Object) -> Void
  alias ObjectGetPropertyFunc = Pointer(LibGObject::Object), UInt32, Pointer(LibGObject::Value), Pointer(LibGObject::ParamSpec) -> Void
  alias ObjectSetPropertyFunc = Pointer(LibGObject::Object), UInt32, Pointer(LibGObject::Value), Pointer(LibGObject::ParamSpec) -> Void
  alias SignalAccumulator = Pointer(LibGObject::SignalInvocationHint), Pointer(LibGObject::Value), Pointer(LibGObject::Value), Pointer(Void) -> LibC::Int
  alias SignalEmissionHook = Pointer(LibGObject::SignalInvocationHint), UInt32, Pointer(LibGObject::Value), Pointer(Void) -> LibC::Int
  alias ToggleNotify = Pointer(Void), Pointer(LibGObject::Object), LibC::Int -> Void
  alias TypeClassCacheFunc = Pointer(Void), Pointer(LibGObject::TypeClass) -> LibC::Int
  alias TypeInterfaceCheckFunc = Pointer(Void), Pointer(LibGObject::TypeInterface) -> Void
  alias TypePluginCompleteInterfaceInfo = Pointer(LibGObject::TypePlugin), UInt64, UInt64, Pointer(LibGObject::InterfaceInfo) -> Void
  alias TypePluginCompleteTypeInfo = Pointer(LibGObject::TypePlugin), UInt64, Pointer(LibGObject::TypeInfo), Pointer(LibGObject::TypeValueTable) -> Void
  alias TypePluginUnuse = Pointer(LibGObject::TypePlugin) -> Void
  alias TypePluginUse = Pointer(LibGObject::TypePlugin) -> Void
  alias ValueTransform = Pointer(LibGObject::Value), Pointer(LibGObject::Value) -> Void
  alias WeakNotify = Pointer(Void), Pointer(LibGObject::Object) -> Void
end

module GObject
  PARAM_MASK                = LibGObject::PARAM_MASK
  PARAM_STATIC_STRINGS      = LibGObject::PARAM_STATIC_STRINGS
  PARAM_USER_SHIFT          = LibGObject::PARAM_USER_SHIFT
  SIGNAL_FLAGS_MASK         = LibGObject::SIGNAL_FLAGS_MASK
  SIGNAL_MATCH_MASK         = LibGObject::SIGNAL_MATCH_MASK
  TYPE_FLAG_RESERVED_ID_BIT = LibGObject::TYPE_FLAG_RESERVED_ID_BIT
  TYPE_FUNDAMENTAL_MAX      = LibGObject::TYPE_FUNDAMENTAL_MAX
  TYPE_FUNDAMENTAL_SHIFT    = LibGObject::TYPE_FUNDAMENTAL_SHIFT
  TYPE_RESERVED_BSE_FIRST   = LibGObject::TYPE_RESERVED_BSE_FIRST
  TYPE_RESERVED_BSE_LAST    = LibGObject::TYPE_RESERVED_BSE_LAST
  TYPE_RESERVED_GLIB_FIRST  = LibGObject::TYPE_RESERVED_GLIB_FIRST
  TYPE_RESERVED_GLIB_LAST   = LibGObject::TYPE_RESERVED_GLIB_LAST
  TYPE_RESERVED_USER_FIRST  = LibGObject::TYPE_RESERVED_USER_FIRST
  VALUE_NOCOPY_CONTENTS     = LibGObject::VALUE_NOCOPY_CONTENTS

  def self.boxed_copy(boxed_type : UInt64, src_boxed : Void*)
    LibGObject.boxed_copy(UInt64.new(boxed_type), src_boxed)
    nil
  end

  def self.boxed_free(boxed_type : UInt64, boxed : Void*)
    LibGObject.boxed_free(UInt64.new(boxed_type), boxed)
    nil
  end

  def self.cclosure_marshal_boolean__boxed_boxed(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_BOOLEAN__BOXED_BOXED(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_boolean__boxed_boxed(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_boolean__boxed_boxed(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_boolean__flags(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_BOOLEAN__FLAGS(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_boolean__flags(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_boolean__flags(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_string__object_pointer(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_STRING__OBJECT_POINTER(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_string__object_pointer(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_string__object_pointer(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__boolean(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__BOOLEAN(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__boolean(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__boolean(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__boxed(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__BOXED(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__boxed(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__boxed(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__char(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__CHAR(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__char(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__char(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__double(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__DOUBLE(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__double(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__double(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__enum(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__ENUM(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__enum(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__enum(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__flags(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__FLAGS(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__flags(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__flags(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__float(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__FLOAT(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__float(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__float(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__int(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__INT(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__int(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__int(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__long(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__LONG(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__long(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__long(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__object(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__OBJECT(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__object(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__object(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__param(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__PARAM(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__param(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__param(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__pointer(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__POINTER(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__pointer(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__pointer(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__string(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__STRING(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__string(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__string(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__uchar(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__UCHAR(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__uchar(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__uchar(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__uint(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__UINT(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__uint(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__uint(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__uint_pointer(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__UINT_POINTER(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__uint_pointer(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__uint_pointer(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__ulong(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__ULONG(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__ulong(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__ulong(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__variant(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__VARIANT(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__variant(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__variant(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_void__void(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_VOID__VOID(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_void__void(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_void__void(closure, return_value, param_values, invocation_hint, marshal_data)
  end

  def self.cclosure_marshal_generic(closure : GObject::Closure, return_gvalue, param_values, invocation_hint : Void*?, marshal_data : Void*?)
    __param_values = param_values.to_gvalue.to_unsafe
    n_param_values = __param_values_ary.size
    LibGObject.cclosure_marshal_generic(closure.to_unsafe.as(LibGObject::Closure*), return_gvalue.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
    nil
  end

  def self.cclosure_marshal_generic(return_gvalue, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    cclosure_marshal_generic(closure, return_gvalue, param_values, invocation_hint, marshal_data)
  end

  def self.clear_signal_handler(handler_id_ptr : ::Int, instance : GObject::Object)
    LibGObject.clear_signal_handler(handler_id_ptr, instance.to_unsafe_object)
    nil
  end

  def self.enum_complete_type_info(g_enum_type : UInt64, info : GObject::TypeInfo, const_values : GObject::EnumValue)
    LibGObject.enum_complete_type_info(UInt64.new(g_enum_type), info, const_values.to_unsafe.as(LibGObject::EnumValue*))
    nil
  end

  def self.enum_get_value(enum_class : GObject::EnumClass, value : ::Int)
    __var0 = LibGObject.enum_get_value(enum_class.to_unsafe.as(LibGObject::EnumClass*), Int32.new(value))
    GObject.raise_unexpected_null("g_enum_get_value") if __var0.null?
    GObject::EnumValue.new(__var0)
  end

  def self.enum_get_value_by_name(enum_class : GObject::EnumClass, name : ::String)
    __var0 = LibGObject.enum_get_value_by_name(enum_class.to_unsafe.as(LibGObject::EnumClass*), name.to_unsafe)
    GObject.raise_unexpected_null("g_enum_get_value_by_name") if __var0.null?
    GObject::EnumValue.new(__var0)
  end

  def self.enum_get_value_by_nick(enum_class : GObject::EnumClass, nick : ::String)
    __var0 = LibGObject.enum_get_value_by_nick(enum_class.to_unsafe.as(LibGObject::EnumClass*), nick.to_unsafe)
    GObject.raise_unexpected_null("g_enum_get_value_by_nick") if __var0.null?
    GObject::EnumValue.new(__var0)
  end

  def self.enum_register_static(name : ::String, const_static_values : GObject::EnumValue)
    __var0 = LibGObject.enum_register_static(name.to_unsafe, const_static_values.to_unsafe.as(LibGObject::EnumValue*))
    __var0
  end

  def self.enum_to_string(g_enum_type : UInt64, value : ::Int)
    __var0 = LibGObject.enum_to_string(UInt64.new(g_enum_type), Int32.new(value))
    GObject.raise_unexpected_null("g_enum_to_string") if __var0.null?
    ::String.new(__var0)
  end

  def self.flags_complete_type_info(g_flags_type : UInt64, info : GObject::TypeInfo, const_values : GObject::FlagsValue)
    LibGObject.flags_complete_type_info(UInt64.new(g_flags_type), info, const_values.to_unsafe.as(LibGObject::FlagsValue*))
    nil
  end

  def self.flags_get_first_value(flags_class : GObject::FlagsClass, value : ::Int)
    __var0 = LibGObject.flags_get_first_value(flags_class.to_unsafe.as(LibGObject::FlagsClass*), UInt32.new(value))
    GObject.raise_unexpected_null("g_flags_get_first_value") if __var0.null?
    GObject::FlagsValue.new(__var0)
  end

  def self.flags_get_value_by_name(flags_class : GObject::FlagsClass, name : ::String)
    __var0 = LibGObject.flags_get_value_by_name(flags_class.to_unsafe.as(LibGObject::FlagsClass*), name.to_unsafe)
    GObject.raise_unexpected_null("g_flags_get_value_by_name") if __var0.null?
    GObject::FlagsValue.new(__var0)
  end

  def self.flags_get_value_by_nick(flags_class : GObject::FlagsClass, nick : ::String)
    __var0 = LibGObject.flags_get_value_by_nick(flags_class.to_unsafe.as(LibGObject::FlagsClass*), nick.to_unsafe)
    GObject.raise_unexpected_null("g_flags_get_value_by_nick") if __var0.null?
    GObject::FlagsValue.new(__var0)
  end

  def self.flags_register_static(name : ::String, const_static_values : GObject::FlagsValue)
    __var0 = LibGObject.flags_register_static(name.to_unsafe, const_static_values.to_unsafe.as(LibGObject::FlagsValue*))
    __var0
  end

  def self.flags_to_string(flags_type : UInt64, value : ::Int)
    __var0 = LibGObject.flags_to_string(UInt64.new(flags_type), UInt32.new(value))
    GObject.raise_unexpected_null("g_flags_to_string") if __var0.null?
    ::String.new(__var0)
  end

  def self.gtype_get_type
    __var0 = LibGObject.gtype_get_type
    __var0
  end

  def self.param_spec_boolean(name : ::String, nick : ::String, blurb : ::String, default_value : ::Bool, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_boolean(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, LibC::Int.new(default_value ? 1 : 0), flags)
    GObject.raise_unexpected_null("g_param_spec_boolean") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_boxed(name : ::String, nick : ::String, blurb : ::String, boxed_type : UInt64, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_boxed(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, UInt64.new(boxed_type), flags)
    GObject.raise_unexpected_null("g_param_spec_boxed") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_char(name : ::String, nick : ::String, blurb : ::String, minimum : ::Int, maximum : ::Int, default_value : ::Int, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_char(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, Int8.new(minimum), Int8.new(maximum), Int8.new(default_value), flags)
    GObject.raise_unexpected_null("g_param_spec_char") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_double(name : ::String, nick : ::String, blurb : ::String, minimum : ::Float, maximum : ::Float, default_value : ::Float, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_double(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, Float64.new(minimum), Float64.new(maximum), Float64.new(default_value), flags)
    GObject.raise_unexpected_null("g_param_spec_double") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_enum(name : ::String, nick : ::String, blurb : ::String, enum_type : UInt64, default_value : ::Int, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_enum(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, UInt64.new(enum_type), Int32.new(default_value), flags)
    GObject.raise_unexpected_null("g_param_spec_enum") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_flags(name : ::String, nick : ::String, blurb : ::String, flags_type : UInt64, default_value : ::Int, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_flags(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, UInt64.new(flags_type), UInt32.new(default_value), flags)
    GObject.raise_unexpected_null("g_param_spec_flags") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_float(name : ::String, nick : ::String, blurb : ::String, minimum : ::Float, maximum : ::Float, default_value : ::Float, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_float(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, Float32.new(minimum), Float32.new(maximum), Float32.new(default_value), flags)
    GObject.raise_unexpected_null("g_param_spec_float") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_gtype(name : ::String, nick : ::String, blurb : ::String, is_a_type : UInt64, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_gtype(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, UInt64.new(is_a_type), flags)
    GObject.raise_unexpected_null("g_param_spec_gtype") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_int(name : ::String, nick : ::String, blurb : ::String, minimum : ::Int, maximum : ::Int, default_value : ::Int, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_int(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, Int32.new(minimum), Int32.new(maximum), Int32.new(default_value), flags)
    GObject.raise_unexpected_null("g_param_spec_int") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_int64(name : ::String, nick : ::String, blurb : ::String, minimum : ::Int, maximum : ::Int, default_value : ::Int, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_int64(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, Int64.new(minimum), Int64.new(maximum), Int64.new(default_value), flags)
    GObject.raise_unexpected_null("g_param_spec_int64") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_long(name : ::String, nick : ::String, blurb : ::String, minimum : ::Int, maximum : ::Int, default_value : ::Int, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_long(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, Int64.new(minimum), Int64.new(maximum), Int64.new(default_value), flags)
    GObject.raise_unexpected_null("g_param_spec_long") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_object(name : ::String, nick : ::String, blurb : ::String, object_type : UInt64, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_object(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, UInt64.new(object_type), flags)
    GObject.raise_unexpected_null("g_param_spec_object") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_param(name : ::String, nick : ::String, blurb : ::String, param_type : UInt64, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_param(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, UInt64.new(param_type), flags)
    GObject.raise_unexpected_null("g_param_spec_param") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_pointer(name : ::String, nick : ::String, blurb : ::String, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_pointer(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, flags)
    GObject.raise_unexpected_null("g_param_spec_pointer") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_pool_new(type_prefixing : ::Bool)
    __var0 = LibGObject.param_spec_pool_new(LibC::Int.new(type_prefixing ? 1 : 0))
    GObject.raise_unexpected_null("g_param_spec_pool_new") if __var0.null?
    GObject::ParamSpecPool.new(__var0)
  end

  def self.param_spec_string(name : ::String, nick : ::String, blurb : ::String, default_value : ::String?, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_string(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, default_value ? default_value.to_unsafe : Pointer(UInt8).null, flags)
    GObject.raise_unexpected_null("g_param_spec_string") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_uchar(name : ::String, nick : ::String, blurb : ::String, minimum : ::Int, maximum : ::Int, default_value : ::Int, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_uchar(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, UInt8.new(minimum), UInt8.new(maximum), UInt8.new(default_value), flags)
    GObject.raise_unexpected_null("g_param_spec_uchar") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_uint(name : ::String, nick : ::String, blurb : ::String, minimum : ::Int, maximum : ::Int, default_value : ::Int, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_uint(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, UInt32.new(minimum), UInt32.new(maximum), UInt32.new(default_value), flags)
    GObject.raise_unexpected_null("g_param_spec_uint") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_uint64(name : ::String, nick : ::String, blurb : ::String, minimum : ::Int, maximum : ::Int, default_value : ::Int, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_uint64(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, UInt64.new(minimum), UInt64.new(maximum), UInt64.new(default_value), flags)
    GObject.raise_unexpected_null("g_param_spec_uint64") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_ulong(name : ::String, nick : ::String, blurb : ::String, minimum : ::Int, maximum : ::Int, default_value : ::Int, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_ulong(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, UInt64.new(minimum), UInt64.new(maximum), UInt64.new(default_value), flags)
    GObject.raise_unexpected_null("g_param_spec_ulong") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_unichar(name : ::String, nick : ::String, blurb : ::String, default_value : UInt8, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_unichar(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, UInt8.new(default_value), flags)
    GObject.raise_unexpected_null("g_param_spec_unichar") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_spec_variant(name : ::String, nick : ::String, blurb : ::String, type : GLib::VariantType, default_value : GLib::Variant?, flags : GObject::ParamFlags)
    __var0 = LibGObject.param_spec_variant(name.to_unsafe, nick.to_unsafe, blurb.to_unsafe, type.to_unsafe.as(LibGLib::VariantType*), default_value ? default_value.to_unsafe.as(LibGLib::Variant*) : Pointer(LibGLib::Variant).null, flags)
    GObject.raise_unexpected_null("g_param_spec_variant") if __var0.null?
    GObject::ParamSpec.new(__var0)
  end

  def self.param_type_register_static(name : ::String, pspec_info : GObject::ParamSpecTypeInfo)
    __var0 = LibGObject.param_type_register_static(name.to_unsafe, pspec_info.to_unsafe.as(LibGObject::ParamSpecTypeInfo*))
    __var0
  end

  def self.param_value_convert(pspec : GObject::ParamSpec, src_value, dest_value, strict_validation : ::Bool)
    __var0 = LibGObject.param_value_convert(pspec.to_unsafe_paramspec, src_value.to_gvalue.to_unsafe, dest_value.to_gvalue.to_unsafe, LibC::Int.new(strict_validation ? 1 : 0))
    (__var0 == 1)
  end

  def self.param_value_defaults(pspec : GObject::ParamSpec, value)
    __var0 = LibGObject.param_value_defaults(pspec.to_unsafe_paramspec, value.to_gvalue.to_unsafe)
    (__var0 == 1)
  end

  def self.param_value_set_default(pspec : GObject::ParamSpec, value)
    LibGObject.param_value_set_default(pspec.to_unsafe_paramspec, value.to_gvalue.to_unsafe)
    nil
  end

  def self.param_value_validate(pspec : GObject::ParamSpec, value)
    __var0 = LibGObject.param_value_validate(pspec.to_unsafe_paramspec, value.to_gvalue.to_unsafe)
    (__var0 == 1)
  end

  def self.param_values_cmp(pspec : GObject::ParamSpec, value1, value2)
    __var0 = LibGObject.param_values_cmp(pspec.to_unsafe_paramspec, value1.to_gvalue.to_unsafe, value2.to_gvalue.to_unsafe)
    __var0
  end

  def self.pointer_type_register_static(name : ::String)
    __var0 = LibGObject.pointer_type_register_static(name.to_unsafe)
    __var0
  end

  def self.signal_accumulator_first_wins(ihint : GObject::SignalInvocationHint, return_accu, handler_return, dummy : Void*?)
    __var0 = LibGObject.signal_accumulator_first_wins(ihint.to_unsafe.as(LibGObject::SignalInvocationHint*), return_accu.to_gvalue.to_unsafe, handler_return.to_gvalue.to_unsafe, dummy ? dummy : Pointer(Void).null)
    (__var0 == 1)
  end

  def self.signal_accumulator_true_handled(ihint : GObject::SignalInvocationHint, return_accu, handler_return, dummy : Void*?)
    __var0 = LibGObject.signal_accumulator_true_handled(ihint.to_unsafe.as(LibGObject::SignalInvocationHint*), return_accu.to_gvalue.to_unsafe, handler_return.to_gvalue.to_unsafe, dummy ? dummy : Pointer(Void).null)
    (__var0 == 1)
  end

  def self.signal_add_emission_hook(signal_id : ::Int, detail : ::Int, hook_func : GObject::SignalEmissionHook, hook_data : Void*?, data_destroy : GLib::DestroyNotify)
    __var0 = LibGObject.signal_add_emission_hook(UInt32.new(signal_id), UInt32.new(detail), hook_func, hook_data ? hook_data : Pointer(Void).null, data_destroy)
    __var0
  end

  def self.signal_chain_from_overridden(instance_and_params : ::Enumerable, return_value)
    LibGObject.signal_chain_from_overridden((__instance_and_params_ary = instance_and_params.map { |__item| __item.to_gvalue.to_unsafe.value }.to_a).to_unsafe, return_value.to_gvalue.to_unsafe)
    nil
  end

  def self.signal_connect_closure(instance : GObject::Object, detailed_signal : ::String, closure : GObject::Closure, after : ::Bool)
    __var0 = LibGObject.signal_connect_closure(instance.to_unsafe_object, detailed_signal.to_unsafe, closure.to_unsafe.as(LibGObject::Closure*), LibC::Int.new(after ? 1 : 0))
    __var0
  end

  def self.signal_connect_closure(instance : GObject::Object, detailed_signal : ::String, after : ::Bool, &closure)
    closure = GObject::Closure.new(closure)
    signal_connect_closure(instance, detailed_signal, closure, after)
  end

  def self.signal_connect_closure_by_id(instance : GObject::Object, signal_id : ::Int, detail : ::Int, closure : GObject::Closure, after : ::Bool)
    __var0 = LibGObject.signal_connect_closure_by_id(instance.to_unsafe_object, UInt32.new(signal_id), UInt32.new(detail), closure.to_unsafe.as(LibGObject::Closure*), LibC::Int.new(after ? 1 : 0))
    __var0
  end

  def self.signal_connect_closure_by_id(instance : GObject::Object, signal_id : ::Int, detail : ::Int, after : ::Bool, &closure)
    closure = GObject::Closure.new(closure)
    signal_connect_closure_by_id(instance, signal_id, detail, closure, after)
  end

  def self.signal_emitv(instance_and_params : ::Enumerable, signal_id : ::Int, detail : ::Int, return_value)
    LibGObject.signal_emitv((__instance_and_params_ary = instance_and_params.map { |__item| __item.to_gvalue.to_unsafe.value }.to_a).to_unsafe, UInt32.new(signal_id), UInt32.new(detail), return_value)
    nil
  end

  def self.signal_get_invocation_hint(instance : GObject::Object)
    __var0 = LibGObject.signal_get_invocation_hint(instance.to_unsafe_object)
    GObject.raise_unexpected_null("g_signal_get_invocation_hint") if __var0.null?
    GObject::SignalInvocationHint.new(__var0)
  end

  def self.signal_handler_block(instance : GObject::Object, handler_id : ::Int)
    LibGObject.signal_handler_block(instance.to_unsafe_object, UInt64.new(handler_id))
    nil
  end

  def self.signal_handler_disconnect(instance : GObject::Object, handler_id : ::Int)
    LibGObject.signal_handler_disconnect(instance.to_unsafe_object, UInt64.new(handler_id))
    nil
  end

  def self.signal_handler_find(instance : GObject::Object, mask : GObject::SignalMatchType, signal_id : ::Int, detail : ::Int, closure : GObject::Closure?, func : Void*?, data : Void*?)
    __var0 = LibGObject.signal_handler_find(instance.to_unsafe_object, mask, UInt32.new(signal_id), UInt32.new(detail), closure ? closure.to_unsafe.as(LibGObject::Closure*) : Pointer(LibGObject::Closure).null, func ? func : Pointer(Void).null, data ? data : Pointer(Void).null)
    __var0
  end

  def self.signal_handler_find(instance : GObject::Object, mask : GObject::SignalMatchType, signal_id : ::Int, detail : ::Int, func : Void*?, data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    signal_handler_find(instance, mask, signal_id, detail, closure, func, data)
  end

  def self.signal_handler_is_connected(instance : GObject::Object, handler_id : ::Int)
    __var0 = LibGObject.signal_handler_is_connected(instance.to_unsafe_object, UInt64.new(handler_id))
    (__var0 == 1)
  end

  def self.signal_handler_unblock(instance : GObject::Object, handler_id : ::Int)
    LibGObject.signal_handler_unblock(instance.to_unsafe_object, UInt64.new(handler_id))
    nil
  end

  def self.signal_handlers_block_matched(instance : GObject::Object, mask : GObject::SignalMatchType, signal_id : ::Int, detail : ::Int, closure : GObject::Closure?, func : Void*?, data : Void*?)
    __var0 = LibGObject.signal_handlers_block_matched(instance.to_unsafe_object, mask, UInt32.new(signal_id), UInt32.new(detail), closure ? closure.to_unsafe.as(LibGObject::Closure*) : Pointer(LibGObject::Closure).null, func ? func : Pointer(Void).null, data ? data : Pointer(Void).null)
    __var0
  end

  def self.signal_handlers_block_matched(instance : GObject::Object, mask : GObject::SignalMatchType, signal_id : ::Int, detail : ::Int, func : Void*?, data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    signal_handlers_block_matched(instance, mask, signal_id, detail, closure, func, data)
  end

  def self.signal_handlers_destroy(instance : GObject::Object)
    LibGObject.signal_handlers_destroy(instance.to_unsafe_object)
    nil
  end

  def self.signal_handlers_disconnect_matched(instance : GObject::Object, mask : GObject::SignalMatchType, signal_id : ::Int, detail : ::Int, closure : GObject::Closure?, func : Void*?, data : Void*?)
    __var0 = LibGObject.signal_handlers_disconnect_matched(instance.to_unsafe_object, mask, UInt32.new(signal_id), UInt32.new(detail), closure ? closure.to_unsafe.as(LibGObject::Closure*) : Pointer(LibGObject::Closure).null, func ? func : Pointer(Void).null, data ? data : Pointer(Void).null)
    __var0
  end

  def self.signal_handlers_disconnect_matched(instance : GObject::Object, mask : GObject::SignalMatchType, signal_id : ::Int, detail : ::Int, func : Void*?, data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    signal_handlers_disconnect_matched(instance, mask, signal_id, detail, closure, func, data)
  end

  def self.signal_handlers_unblock_matched(instance : GObject::Object, mask : GObject::SignalMatchType, signal_id : ::Int, detail : ::Int, closure : GObject::Closure?, func : Void*?, data : Void*?)
    __var0 = LibGObject.signal_handlers_unblock_matched(instance.to_unsafe_object, mask, UInt32.new(signal_id), UInt32.new(detail), closure ? closure.to_unsafe.as(LibGObject::Closure*) : Pointer(LibGObject::Closure).null, func ? func : Pointer(Void).null, data ? data : Pointer(Void).null)
    __var0
  end

  def self.signal_handlers_unblock_matched(instance : GObject::Object, mask : GObject::SignalMatchType, signal_id : ::Int, detail : ::Int, func : Void*?, data : Void*?, &closure)
    closure = GObject::Closure.new(closure)
    signal_handlers_unblock_matched(instance, mask, signal_id, detail, closure, func, data)
  end

  def self.signal_has_handler_pending(instance : GObject::Object, signal_id : ::Int, detail : ::Int, may_be_blocked : ::Bool)
    __var0 = LibGObject.signal_has_handler_pending(instance.to_unsafe_object, UInt32.new(signal_id), UInt32.new(detail), LibC::Int.new(may_be_blocked ? 1 : 0))
    (__var0 == 1)
  end

  def self.signal_list_ids(itype : UInt64)
    __var0 = LibGObject.signal_list_ids(UInt64.new(itype), out n_ids)
    GObject.raise_unexpected_null("g_signal_list_ids") if __var0.null?
    {GObject::PointerIterator.new(__var0) { |__var1|
      __var1
    }, n_ids}
  end

  def self.signal_lookup(name : ::String, itype : UInt64)
    __var0 = LibGObject.signal_lookup(name.to_unsafe, UInt64.new(itype))
    __var0
  end

  def self.signal_name(signal_id : ::Int)
    __var0 = LibGObject.signal_name(UInt32.new(signal_id))
    GObject.raise_unexpected_null("g_signal_name") if __var0.null?
    ::String.new(__var0)
  end

  def self.signal_override_class_closure(signal_id : ::Int, instance_type : UInt64, class_closure : GObject::Closure)
    LibGObject.signal_override_class_closure(UInt32.new(signal_id), UInt64.new(instance_type), class_closure.to_unsafe.as(LibGObject::Closure*))
    nil
  end

  def self.signal_override_class_closure(signal_id : ::Int, instance_type : UInt64, &class_closure)
    class_closure = GObject::Closure.new(class_closure)
    signal_override_class_closure(signal_id, instance_type, class_closure)
  end

  def self.signal_parse_name(detailed_signal : ::String, itype : UInt64, force_detail_quark : ::Bool)
    __var0 = LibGObject.signal_parse_name(detailed_signal.to_unsafe, UInt64.new(itype), out signal_id_p, out detail_p, LibC::Int.new(force_detail_quark ? 1 : 0))
    {(__var0 == 1), signal_id_p, detail_p}
  end

  def self.signal_query(signal_id : ::Int, query : GObject::SignalQuery)
    LibGObject.signal_query(UInt32.new(signal_id), query)
    nil
  end

  def self.signal_remove_emission_hook(signal_id : ::Int, hook_id : ::Int)
    LibGObject.signal_remove_emission_hook(UInt32.new(signal_id), UInt64.new(hook_id))
    nil
  end

  def self.signal_set_va_marshaller(signal_id : ::Int, instance_type : UInt64, va_marshaller : GObject::VaClosureMarshal)
    LibGObject.signal_set_va_marshaller(UInt32.new(signal_id), UInt64.new(instance_type), va_marshaller)
    nil
  end

  def self.signal_stop_emission(instance : GObject::Object, signal_id : ::Int, detail : ::Int)
    LibGObject.signal_stop_emission(instance.to_unsafe_object, UInt32.new(signal_id), UInt32.new(detail))
    nil
  end

  def self.signal_stop_emission_by_name(instance : GObject::Object, detailed_signal : ::String)
    LibGObject.signal_stop_emission_by_name(instance.to_unsafe_object, detailed_signal.to_unsafe)
    nil
  end

  def self.signal_type_cclosure_new(itype : UInt64, struct_offset : ::Int)
    __var0 = LibGObject.signal_type_cclosure_new(UInt64.new(itype), UInt32.new(struct_offset))
    GObject.raise_unexpected_null("g_signal_type_cclosure_new") if __var0.null?
    GObject::Closure.new(__var0)
  end

  def self.source_set_closure(source : GLib::Source, closure : GObject::Closure)
    LibGObject.source_set_closure(source.to_unsafe.as(LibGLib::Source*), closure.to_unsafe.as(LibGObject::Closure*))
    nil
  end

  def self.source_set_closure(source : GLib::Source, &closure)
    closure = GObject::Closure.new(closure)
    source_set_closure(source, closure)
  end

  def self.source_set_dummy_callback(source : GLib::Source)
    LibGObject.source_set_dummy_callback(source.to_unsafe.as(LibGLib::Source*))
    nil
  end

  def self.strdup_value_contents(value)
    __var0 = LibGObject.strdup_value_contents(value.to_gvalue.to_unsafe)
    GObject.raise_unexpected_null("g_strdup_value_contents") if __var0.null?
    ::String.new(__var0)
  end

  def self.type_add_class_private(class_type : UInt64, private_size : ::Int)
    LibGObject.type_add_class_private(UInt64.new(class_type), UInt64.new(private_size))
    nil
  end

  def self.type_add_instance_private(class_type : UInt64, private_size : ::Int)
    __var0 = LibGObject.type_add_instance_private(UInt64.new(class_type), UInt64.new(private_size))
    __var0
  end

  def self.type_add_interface_dynamic(instance_type : UInt64, interface_type : UInt64, plugin : GObject::TypePlugin)
    LibGObject.type_add_interface_dynamic(UInt64.new(instance_type), UInt64.new(interface_type), plugin.to_unsafe_typeplugin)
    nil
  end

  def self.type_add_interface_static(instance_type : UInt64, interface_type : UInt64, info : GObject::InterfaceInfo)
    LibGObject.type_add_interface_static(UInt64.new(instance_type), UInt64.new(interface_type), info.to_unsafe.as(LibGObject::InterfaceInfo*))
    nil
  end

  def self.type_check_class_is_a(g_class : GObject::TypeClass, is_a_type : UInt64)
    __var0 = LibGObject.type_check_class_is_a(g_class.to_unsafe.as(LibGObject::TypeClass*), UInt64.new(is_a_type))
    (__var0 == 1)
  end

  def self.type_check_instance(instance : GObject::TypeInstance)
    __var0 = LibGObject.type_check_instance(instance.to_unsafe.as(LibGObject::TypeInstance*))
    (__var0 == 1)
  end

  def self.type_check_instance_is_a(instance : GObject::TypeInstance, iface_type : UInt64)
    __var0 = LibGObject.type_check_instance_is_a(instance.to_unsafe.as(LibGObject::TypeInstance*), UInt64.new(iface_type))
    (__var0 == 1)
  end

  def self.type_check_instance_is_fundamentally_a(instance : GObject::TypeInstance, fundamental_type : UInt64)
    __var0 = LibGObject.type_check_instance_is_fundamentally_a(instance.to_unsafe.as(LibGObject::TypeInstance*), UInt64.new(fundamental_type))
    (__var0 == 1)
  end

  def self.type_check_is_value_type(type : UInt64)
    __var0 = LibGObject.type_check_is_value_type(UInt64.new(type))
    (__var0 == 1)
  end

  def self.type_check_value(value)
    __var0 = LibGObject.type_check_value(value.to_gvalue.to_unsafe)
    (__var0 == 1)
  end

  def self.type_check_value_holds(value, type : UInt64)
    __var0 = LibGObject.type_check_value_holds(value.to_gvalue.to_unsafe, UInt64.new(type))
    (__var0 == 1)
  end

  def self.type_children(type : UInt64)
    __var0 = LibGObject.type_children(UInt64.new(type), out n_children)
    GObject.raise_unexpected_null("g_type_children") if __var0.null?
    {GObject::PointerIterator.new(__var0) { |__var1|
      __var1
    }, n_children}
  end

  def self.type_class_adjust_private_offset(g_class : Void*?, private_size_or_offset : ::Int)
    LibGObject.type_class_adjust_private_offset(g_class ? g_class : Pointer(Void).null, private_size_or_offset)
    nil
  end

  def self.type_class_peek(type : UInt64)
    __var0 = LibGObject.type_class_peek(UInt64.new(type))
    GObject.raise_unexpected_null("g_type_class_peek") if __var0.null?
    GObject::TypeClass.new(__var0)
  end

  def self.type_class_peek_static(type : UInt64)
    __var0 = LibGObject.type_class_peek_static(UInt64.new(type))
    GObject.raise_unexpected_null("g_type_class_peek_static") if __var0.null?
    GObject::TypeClass.new(__var0)
  end

  def self.type_class_ref(type : UInt64)
    __var0 = LibGObject.type_class_ref(UInt64.new(type))
    GObject.raise_unexpected_null("g_type_class_ref") if __var0.null?
    GObject::TypeClass.new(__var0)
  end

  def self.type_default_interface_peek(g_type : UInt64)
    __var0 = LibGObject.type_default_interface_peek(UInt64.new(g_type))
    GObject.raise_unexpected_null("g_type_default_interface_peek") if __var0.null?
    GObject::TypeInterface.new(__var0)
  end

  def self.type_default_interface_ref(g_type : UInt64)
    __var0 = LibGObject.type_default_interface_ref(UInt64.new(g_type))
    GObject.raise_unexpected_null("g_type_default_interface_ref") if __var0.null?
    GObject::TypeInterface.new(__var0)
  end

  def self.type_default_interface_unref(g_iface : GObject::TypeInterface)
    LibGObject.type_default_interface_unref(g_iface.to_unsafe.as(LibGObject::TypeInterface*))
    nil
  end

  def self.type_depth(type : UInt64)
    __var0 = LibGObject.type_depth(UInt64.new(type))
    __var0
  end

  def self.type_ensure(type : UInt64)
    LibGObject.type_ensure(UInt64.new(type))
    nil
  end

  def self.type_free_instance(instance : GObject::TypeInstance)
    LibGObject.type_free_instance(instance.to_unsafe.as(LibGObject::TypeInstance*))
    nil
  end

  def self.type_from_name(name : ::String)
    __var0 = LibGObject.type_from_name(name.to_unsafe)
    __var0
  end

  def self.type_fundamental(type_id : UInt64)
    __var0 = LibGObject.type_fundamental(UInt64.new(type_id))
    __var0
  end

  def self.type_fundamental_next
    __var0 = LibGObject.type_fundamental_next
    __var0
  end

  def self.type_get_instance_count(type : UInt64)
    __var0 = LibGObject.type_get_instance_count(UInt64.new(type))
    __var0
  end

  def self.type_get_plugin(type : UInt64)
    __var0 = LibGObject.type_get_plugin(UInt64.new(type))
    GObject.raise_unexpected_null("g_type_get_plugin") if __var0.null?
    GObject::TypePlugin::Wrapper.new(__var0)
  end

  def self.type_get_qdata(type : UInt64, quark : ::Int)
    LibGObject.type_get_qdata(UInt64.new(type), UInt32.new(quark))
    nil
  end

  def self.type_get_type_registration_serial
    __var0 = LibGObject.type_get_type_registration_serial
    __var0
  end

  def self.type_init
    LibGObject.type_init
    nil
  end

  def self.type_init_with_debug_flags(debug_flags : GObject::TypeDebugFlags)
    LibGObject.type_init_with_debug_flags(debug_flags)
    nil
  end

  def self.type_interface_add_prerequisite(interface_type : UInt64, prerequisite_type : UInt64)
    LibGObject.type_interface_add_prerequisite(UInt64.new(interface_type), UInt64.new(prerequisite_type))
    nil
  end

  def self.type_interface_get_plugin(instance_type : UInt64, interface_type : UInt64)
    __var0 = LibGObject.type_interface_get_plugin(UInt64.new(instance_type), UInt64.new(interface_type))
    GObject.raise_unexpected_null("g_type_interface_get_plugin") if __var0.null?
    GObject::TypePlugin::Wrapper.new(__var0)
  end

  def self.type_interface_peek(instance_class : GObject::TypeClass, iface_type : UInt64)
    __var0 = LibGObject.type_interface_peek(instance_class.to_unsafe.as(LibGObject::TypeClass*), UInt64.new(iface_type))
    GObject.raise_unexpected_null("g_type_interface_peek") if __var0.null?
    GObject::TypeInterface.new(__var0)
  end

  def self.type_interface_prerequisites(interface_type : UInt64)
    __var0 = LibGObject.type_interface_prerequisites(UInt64.new(interface_type), out n_prerequisites)
    GObject.raise_unexpected_null("g_type_interface_prerequisites") if __var0.null?
    {GObject::PointerIterator.new(__var0) { |__var1|
      __var1
    }, n_prerequisites}
  end

  def self.type_interfaces(type : UInt64)
    __var0 = LibGObject.type_interfaces(UInt64.new(type), out n_interfaces)
    GObject.raise_unexpected_null("g_type_interfaces") if __var0.null?
    {GObject::PointerIterator.new(__var0) { |__var1|
      __var1
    }, n_interfaces}
  end

  def self.type_is_a(type : UInt64, is_a_type : UInt64)
    __var0 = LibGObject.type_is_a(UInt64.new(type), UInt64.new(is_a_type))
    (__var0 == 1)
  end

  def self.type_name(type : UInt64)
    __var0 = LibGObject.type_name(UInt64.new(type))
    GObject.raise_unexpected_null("g_type_name") if __var0.null?
    ::String.new(__var0)
  end

  def self.type_name_from_class(g_class : GObject::TypeClass)
    __var0 = LibGObject.type_name_from_class(g_class.to_unsafe.as(LibGObject::TypeClass*))
    GObject.raise_unexpected_null("g_type_name_from_class") if __var0.null?
    ::String.new(__var0)
  end

  def self.type_name_from_instance(instance : GObject::TypeInstance)
    __var0 = LibGObject.type_name_from_instance(instance.to_unsafe.as(LibGObject::TypeInstance*))
    GObject.raise_unexpected_null("g_type_name_from_instance") if __var0.null?
    ::String.new(__var0)
  end

  def self.type_next_base(leaf_type : UInt64, root_type : UInt64)
    __var0 = LibGObject.type_next_base(UInt64.new(leaf_type), UInt64.new(root_type))
    __var0
  end

  def self.type_parent(type : UInt64)
    __var0 = LibGObject.type_parent(UInt64.new(type))
    __var0
  end

  def self.type_qname(type : UInt64)
    __var0 = LibGObject.type_qname(UInt64.new(type))
    __var0
  end

  def self.type_query(type : UInt64, query : GObject::TypeQuery)
    LibGObject.type_query(UInt64.new(type), query)
    nil
  end

  def self.type_register_dynamic(parent_type : UInt64, type_name : ::String, plugin : GObject::TypePlugin, flags : GObject::TypeFlags)
    __var0 = LibGObject.type_register_dynamic(UInt64.new(parent_type), type_name.to_unsafe, plugin.to_unsafe_typeplugin, flags)
    __var0
  end

  def self.type_register_fundamental(type_id : UInt64, type_name : ::String, info : GObject::TypeInfo, finfo : GObject::TypeFundamentalInfo, flags : GObject::TypeFlags)
    __var0 = LibGObject.type_register_fundamental(UInt64.new(type_id), type_name.to_unsafe, info.to_unsafe.as(LibGObject::TypeInfo*), finfo.to_unsafe.as(LibGObject::TypeFundamentalInfo*), flags)
    __var0
  end

  def self.type_register_static(parent_type : UInt64, type_name : ::String, info : GObject::TypeInfo, flags : GObject::TypeFlags)
    __var0 = LibGObject.type_register_static(UInt64.new(parent_type), type_name.to_unsafe, info.to_unsafe.as(LibGObject::TypeInfo*), flags)
    __var0
  end

  def self.type_set_qdata(type : UInt64, quark : ::Int, data : Void*?)
    LibGObject.type_set_qdata(UInt64.new(type), UInt32.new(quark), data ? data : Pointer(Void).null)
    nil
  end

  def self.type_test_flags(type : UInt64, flags : ::Int)
    __var0 = LibGObject.type_test_flags(UInt64.new(type), UInt32.new(flags))
    (__var0 == 1)
  end

  def self.value_type_compatible(src_type : UInt64, dest_type : UInt64)
    __var0 = LibGObject.value_type_compatible(UInt64.new(src_type), UInt64.new(dest_type))
    (__var0 == 1)
  end

  def self.value_type_transformable(src_type : UInt64, dest_type : UInt64)
    __var0 = LibGObject.value_type_transformable(UInt64.new(src_type), UInt64.new(dest_type))
    (__var0 == 1)
  end

  alias BaseFinalizeFunc = LibGObject::BaseFinalizeFunc
  alias BaseInitFunc = LibGObject::BaseInitFunc

  class Object
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGObject::Object*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GObject")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGObject._g_object_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::Object*)
    end

    def to_unsafe_object
      @pointer.not_nil!.as(LibGObject::Object*)
    end

    def self.newv(object_type : UInt64, parameters : ::Enumerable) : self
      n_parameters = parameters.size
      __parameters = (__parameters_ary = parameters.map { |__item| __item }.to_a).to_unsafe
      n_parameters = __parameters_ary.size
      __var0 = LibGObject.object_newv(UInt64.new(object_type), UInt32.new(n_parameters), __parameters)
      GObject.raise_unexpected_null("g_object_newv") if __var0.null?
      cast(GObject::Object.new(__var0))
    end

    def self.compat_control(what : ::Int, data : Void*?)
      __var0 = LibGObject.object_compat_control(UInt64.new(what), data ? data : Pointer(Void).null)
      __var0
    end

    def self.interface_find_property(g_iface : GObject::TypeInterface, property_name : ::String)
      __var0 = LibGObject.object_interface_find_property(g_iface.to_unsafe.as(LibGObject::TypeInterface*), property_name.to_unsafe)
      GObject.raise_unexpected_null("g_object_interface_find_property") if __var0.null?
      GObject::ParamSpec.new(__var0)
    end

    def self.interface_install_property(g_iface : GObject::TypeInterface, pspec : GObject::ParamSpec)
      LibGObject.object_interface_install_property(g_iface.to_unsafe.as(LibGObject::TypeInterface*), pspec.to_unsafe_paramspec)
      nil
    end

    def self.interface_list_properties(g_iface : GObject::TypeInterface)
      __var0 = LibGObject.object_interface_list_properties(g_iface.to_unsafe.as(LibGObject::TypeInterface*), out n_properties_p)
      GObject.raise_unexpected_null("g_object_interface_list_properties") if __var0.null?
      {GObject::PointerIterator.new(__var0) { |__var1|
        GObject::ParamSpec.new(__var1)
      }, n_properties_p}
    end

    def bind_property(source_property : ::String, target : GObject::Object, target_property : ::String, flags : GObject::BindingFlags)
      __var0 = LibGObject.object_bind_property(@pointer.as(LibGObject::Object*), source_property.to_unsafe, target.to_unsafe_object, target_property.to_unsafe, flags)
      GObject.raise_unexpected_null("g_object_bind_property") if __var0.null?
      GObject::Binding.new(__var0)
    end

    def bind_property_full(source_property : ::String, target : GObject::Object, target_property : ::String, flags : GObject::BindingFlags, transform_to : GObject::Closure, transform_from : GObject::Closure)
      __var0 = LibGObject.object_bind_property_full(@pointer.as(LibGObject::Object*), source_property.to_unsafe, target.to_unsafe_object, target_property.to_unsafe, flags, transform_to.to_unsafe.as(LibGObject::Closure*), transform_from.to_unsafe.as(LibGObject::Closure*))
      GObject.raise_unexpected_null("g_object_bind_property_with_closures") if __var0.null?
      GObject::Binding.new(__var0)
    end

    def force_floating
      LibGObject.object_force_floating(@pointer.as(LibGObject::Object*))
      nil
    end

    def freeze_notify
      LibGObject.object_freeze_notify(@pointer.as(LibGObject::Object*))
      nil
    end

    def data(key : ::String)
      LibGObject.object_get_data(@pointer.as(LibGObject::Object*), key.to_unsafe)
      nil
    end

    def property(property_name : ::String, value)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), property_name.to_unsafe, value.to_gvalue.to_unsafe)
      nil
    end

    def qdata(quark : ::Int)
      LibGObject.object_get_qdata(@pointer.as(LibGObject::Object*), UInt32.new(quark))
      nil
    end

    def getv(names : ::Enumerable, values : ::Enumerable)
      n_properties = names.size
      n_properties = values.size
      LibGObject.object_getv(@pointer.as(LibGObject::Object*), UInt32.new(n_properties), (__names_ary = names.map { |__item| __item.to_unsafe }.to_a).to_unsafe, (__values_ary = values.map { |__item| __item.to_gvalue.to_unsafe.value }.to_a).to_unsafe)
      nil
    end

    def floating?
      __var0 = LibGObject.object_is_floating(@pointer.as(LibGObject::Object*))
      (__var0 == 1)
    end

    def notify(property_name : ::String)
      LibGObject.object_notify(@pointer.as(LibGObject::Object*), property_name.to_unsafe)
      nil
    end

    def notify_by_pspec(pspec : GObject::ParamSpec)
      LibGObject.object_notify_by_pspec(@pointer.as(LibGObject::Object*), pspec.to_unsafe_paramspec)
      nil
    end

    def ref
      __var0 = LibGObject.object_ref(@pointer.as(LibGObject::Object*))
      GObject.raise_unexpected_null("g_object_ref") if __var0.null?
      GObject::Object.new(__var0)
    end

    def ref_sink
      __var0 = LibGObject.object_ref_sink(@pointer.as(LibGObject::Object*))
      GObject.raise_unexpected_null("g_object_ref_sink") if __var0.null?
      GObject::Object.new(__var0)
    end

    def run_dispose
      LibGObject.object_run_dispose(@pointer.as(LibGObject::Object*))
      nil
    end

    def set_data(key : ::String, data : Void*?)
      LibGObject.object_set_data(@pointer.as(LibGObject::Object*), key.to_unsafe, data ? data : Pointer(Void).null)
      nil
    end

    def set_property(property_name : ::String, value)
      LibGObject.object_set_property(@pointer.as(LibGObject::Object*), property_name.to_unsafe, value.to_gvalue.to_unsafe)
      nil
    end

    def steal_data(key : ::String)
      LibGObject.object_steal_data(@pointer.as(LibGObject::Object*), key.to_unsafe)
      nil
    end

    def steal_qdata(quark : ::Int)
      LibGObject.object_steal_qdata(@pointer.as(LibGObject::Object*), UInt32.new(quark))
      nil
    end

    def thaw_notify
      LibGObject.object_thaw_notify(@pointer.as(LibGObject::Object*))
      nil
    end

    def unref
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      nil
    end

    def watch_closure(closure : GObject::Closure)
      LibGObject.object_watch_closure(@pointer.as(LibGObject::Object*), closure.to_unsafe.as(LibGObject::Closure*))
      nil
    end

    def watch_closure(&closure)
      closure = GObject::Closure.new(closure)
      watch_closure(closure)
    end

    alias NotifySignal = Object, GObject::ParamSpec -> Nil

    def on_notify(*, after = false, &block : NotifySignal)
      __var0 = ->(arg0 : LibGObject::Object*, arg1 : LibGObject::ParamSpec*, box : Void*) {
        ::Box(NotifySignal).unbox(box).call(Object.new(arg0), arg1.null? ? GObject.raise_unexpected_null("pspec in notify") : GObject::ParamSpec.new(arg1))
      }

      __var1 = ::Box.box(NotifySignal.new { |arg0, arg1|
        block.call(arg0, arg1)
      })
      LibGObject.signal_connect_data(@pointer.as(LibGObject::Object*), "notify", LibGObject::Callback.new(__var0.pointer, Pointer(Void).null), GObject::ClosureDataManager.register(__var1), ->GObject::ClosureDataManager.deregister, after ? GObject::ConnectFlags::AFTER : GObject::ConnectFlags::None)
    end

    def after_notify(&block : NotifySignal)
      on_notify(after: true, &block)
    end
  end

  @[Flags]
  enum BindingFlags : UInt32
    DEFAULT        = 0
    BIDIRECTIONAL  = 1
    SYNC_CREATE    = 2
    INVERT_BOOLEAN = 4
  end
  alias BindingTransformFunc = LibGObject::BindingTransformFunc
  alias BoxedCopyFunc = LibGObject::BoxedCopyFunc
  alias BoxedFreeFunc = LibGObject::BoxedFreeFunc

  class CClosure
    include GObject::WrappedType

    def self.new(closure : GObject::Closure? = nil, callback : Void*? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(72u64, 0u8).as(LibGObject::CClosure*))
      __var0.closure = closure unless closure.nil?
      __var0.callback = callback unless callback.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::CClosure*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::CClosure*)
    end

    def to_unsafe_cclosure
      @pointer.not_nil!.as(LibGObject::CClosure*)
    end

    def self.marshal_boolean__boxed_boxed(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_BOOLEAN__BOXED_BOXED(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_boolean__boxed_boxed(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_boolean__boxed_boxed(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_boolean__flags(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_BOOLEAN__FLAGS(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_boolean__flags(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_boolean__flags(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_string__object_pointer(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_STRING__OBJECT_POINTER(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_string__object_pointer(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_string__object_pointer(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__boolean(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__BOOLEAN(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__boolean(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__boolean(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__boxed(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__BOXED(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__boxed(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__boxed(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__char(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__CHAR(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__char(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__char(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__double(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__DOUBLE(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__double(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__double(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__enum(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__ENUM(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__enum(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__enum(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__flags(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__FLAGS(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__flags(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__flags(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__float(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__FLOAT(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__float(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__float(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__int(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__INT(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__int(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__int(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__long(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__LONG(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__long(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__long(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__object(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__OBJECT(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__object(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__object(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__param(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__PARAM(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__param(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__param(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__pointer(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__POINTER(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__pointer(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__pointer(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__string(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__STRING(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__string(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__string(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__uchar(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__UCHAR(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__uchar(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__uchar(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__uint(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__UINT(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__uint(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__uint(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__uint_pointer(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__UINT_POINTER(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__uint_pointer(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__uint_pointer(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__ulong(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__ULONG(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__ulong(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__ulong(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__variant(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__VARIANT(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__variant(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__variant(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_void__void(closure : GObject::Closure, return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_VOID__VOID(closure.to_unsafe.as(LibGObject::Closure*), return_value.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_void__void(return_value, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_void__void(closure, return_value, param_values, invocation_hint, marshal_data)
    end

    def self.marshal_generic(closure : GObject::Closure, return_gvalue, param_values, invocation_hint : Void*?, marshal_data : Void*?)
      __param_values = param_values.to_gvalue.to_unsafe
      n_param_values = __param_values_ary.size
      LibGObject.c_closure_marshal_generic(closure.to_unsafe.as(LibGObject::Closure*), return_gvalue.to_gvalue.to_unsafe, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null, marshal_data ? marshal_data : Pointer(Void).null)
      nil
    end

    def self.marshal_generic(return_gvalue, param_values, invocation_hint : Void*?, marshal_data : Void*?, &closure)
      closure = GObject::Closure.new(closure)
      marshal_generic(closure, return_gvalue, param_values, invocation_hint, marshal_data)
    end

    def closure
      GObject::Closure.new(to_unsafe.as(LibGObject::CClosure*).value.closure)
    end

    def closure=(value : GObject::Closure)
      to_unsafe.as(LibGObject::CClosure*).value.closure = value
    end

    def callback
      to_unsafe.as(LibGObject::CClosure*).value.callback
    end

    def callback=(value : Void*)
      to_unsafe.as(LibGObject::CClosure*).value.callback = value
    end
  end

  alias Callback = LibGObject::Callback
  alias ClassFinalizeFunc = LibGObject::ClassFinalizeFunc
  alias ClassInitFunc = LibGObject::ClassInitFunc

  class Closure
    include GObject::WrappedType

    def self.new(in_marshal : UInt32? = nil, is_invalid : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(64u64, 0u8).as(LibGObject::Closure*))
      __var0.in_marshal = in_marshal unless in_marshal.nil?
      __var0.is_invalid = is_invalid unless is_invalid.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::Closure*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::Closure*)
    end

    def to_unsafe_closure
      @pointer.not_nil!.as(LibGObject::Closure*)
    end

    def self.new_object(sizeof_closure : ::Int, object : GObject::Object) : self
      __var0 = LibGObject.closure_new_object(UInt32.new(sizeof_closure), object.to_unsafe_object)
      GObject.raise_unexpected_null("g_closure_new_object") if __var0.null?
      cast(GObject::Closure.new(__var0))
    end

    def self.new_simple(sizeof_closure : ::Int, data : Void*?) : self
      __var0 = LibGObject.closure_new_simple(UInt32.new(sizeof_closure), data ? data : Pointer(Void).null)
      GObject.raise_unexpected_null("g_closure_new_simple") if __var0.null?
      cast(GObject::Closure.new(__var0))
    end

    def invalidate
      LibGObject.closure_invalidate(@pointer.as(LibGObject::Closure*))
      nil
    end

    def invoke(param_values : ::Enumerable, invocation_hint : Void*?) : GObject::Value
      n_param_values = param_values.size
      __param_values = (__param_values_ary = param_values.map { |__item| __item.to_gvalue.to_unsafe.value }.to_a).to_unsafe
      n_param_values = __param_values_ary.size
      return_value = GObject::Value.new
      LibGObject.closure_invoke(@pointer.as(LibGObject::Closure*), return_value, UInt32.new(n_param_values), __param_values, invocation_hint ? invocation_hint : Pointer(Void).null)
      return_value
    end

    def ref
      __var0 = LibGObject.closure_ref(@pointer.as(LibGObject::Closure*))
      GObject.raise_unexpected_null("g_closure_ref") if __var0.null?
      GObject::Closure.new(__var0)
    end

    def sink
      LibGObject.closure_sink(@pointer.as(LibGObject::Closure*))
      nil
    end

    def unref
      LibGObject.closure_unref(@pointer.as(LibGObject::Closure*))
      nil
    end

    def ref_count
      to_unsafe.as(LibGObject::Closure*).value.ref_count
    end

    def meta_marshal_nouse
      to_unsafe.as(LibGObject::Closure*).value.meta_marshal_nouse
    end

    def n_guards
      to_unsafe.as(LibGObject::Closure*).value.n_guards
    end

    def n_fnotifiers
      to_unsafe.as(LibGObject::Closure*).value.n_fnotifiers
    end

    def n_inotifiers
      to_unsafe.as(LibGObject::Closure*).value.n_inotifiers
    end

    def in_inotify
      to_unsafe.as(LibGObject::Closure*).value.in_inotify
    end

    def floating
      to_unsafe.as(LibGObject::Closure*).value.floating
    end

    def derivative_flag
      to_unsafe.as(LibGObject::Closure*).value.derivative_flag
    end

    def in_marshal
      to_unsafe.as(LibGObject::Closure*).value.in_marshal
    end

    def in_marshal=(value : UInt32)
      to_unsafe.as(LibGObject::Closure*).value.in_marshal = UInt32.new(value)
    end

    def is_invalid
      to_unsafe.as(LibGObject::Closure*).value.is_invalid
    end

    def is_invalid=(value : UInt32)
      to_unsafe.as(LibGObject::Closure*).value.is_invalid = UInt32.new(value)
    end

    def marshal
      to_unsafe.as(LibGObject::Closure*).value.marshal
    end

    def data
      to_unsafe.as(LibGObject::Closure*).value.data
    end

    def notifiers
      GObject::ClosureNotifyData.new(to_unsafe.as(LibGObject::Closure*).value.notifiers)
    end
  end

  alias ClosureMarshal = LibGObject::ClosureMarshal
  alias ClosureNotify = LibGObject::ClosureNotify

  class ClosureNotifyData
    include GObject::WrappedType

    def self.new(data : Void*? = nil, notify : GObject::ClosureNotify? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibGObject::ClosureNotifyData*))
      __var0.data = data unless data.nil?
      __var0.notify = notify unless notify.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::ClosureNotifyData*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ClosureNotifyData*)
    end

    def to_unsafe_closurenotifydata
      @pointer.not_nil!.as(LibGObject::ClosureNotifyData*)
    end

    def data
      to_unsafe.as(LibGObject::ClosureNotifyData*).value.data
    end

    def data=(value : Void*)
      to_unsafe.as(LibGObject::ClosureNotifyData*).value.data = value
    end

    def notify
      to_unsafe.as(LibGObject::ClosureNotifyData*).value.notify
    end

    def notify=(value : GObject::ClosureNotify)
      to_unsafe.as(LibGObject::ClosureNotifyData*).value.notify = value
    end
  end

  @[Flags]
  enum ConnectFlags : UInt32
    ZERO_NONE = 0
    AFTER     = 1
    SWAPPED   = 2
  end

  class EnumClass
    include GObject::WrappedType

    def self.new(g_type_class : GObject::TypeClass? = nil, minimum : Int32? = nil, maximum : Int32? = nil, n_values : UInt32? = nil, values : GObject::EnumValue? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(32u64, 0u8).as(LibGObject::EnumClass*))
      __var0.g_type_class = g_type_class unless g_type_class.nil?
      __var0.minimum = minimum unless minimum.nil?
      __var0.maximum = maximum unless maximum.nil?
      __var0.n_values = n_values unless n_values.nil?
      __var0.values = values unless values.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::EnumClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::EnumClass*)
    end

    def to_unsafe_enumclass
      @pointer.not_nil!.as(LibGObject::EnumClass*)
    end

    def g_type_class
      GObject::TypeClass.new(to_unsafe.as(LibGObject::EnumClass*).value.g_type_class)
    end

    def g_type_class=(value : GObject::TypeClass)
      to_unsafe.as(LibGObject::EnumClass*).value.g_type_class = value
    end

    def minimum
      to_unsafe.as(LibGObject::EnumClass*).value.minimum
    end

    def minimum=(value : Int32)
      to_unsafe.as(LibGObject::EnumClass*).value.minimum = Int32.new(value)
    end

    def maximum
      to_unsafe.as(LibGObject::EnumClass*).value.maximum
    end

    def maximum=(value : Int32)
      to_unsafe.as(LibGObject::EnumClass*).value.maximum = Int32.new(value)
    end

    def n_values
      to_unsafe.as(LibGObject::EnumClass*).value.n_values
    end

    def n_values=(value : UInt32)
      to_unsafe.as(LibGObject::EnumClass*).value.n_values = UInt32.new(value)
    end

    def values
      GObject::EnumValue.new(to_unsafe.as(LibGObject::EnumClass*).value.values)
    end

    def values=(value : GObject::EnumValue)
      to_unsafe.as(LibGObject::EnumClass*).value.values = value.to_unsafe.as(LibGObject::EnumValue*)
    end
  end

  class EnumValue
    include GObject::WrappedType

    def self.new(value : Int32? = nil, value_name : ::String? = nil, value_nick : ::String? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGObject::EnumValue*))
      __var0.value = value unless value.nil?
      __var0.value_name = value_name unless value_name.nil?
      __var0.value_nick = value_nick unless value_nick.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::EnumValue*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::EnumValue*)
    end

    def to_unsafe_enumvalue
      @pointer.not_nil!.as(LibGObject::EnumValue*)
    end

    def value
      to_unsafe.as(LibGObject::EnumValue*).value.value
    end

    def value=(value : Int32)
      to_unsafe.as(LibGObject::EnumValue*).value.value = Int32.new(value)
    end

    def value_name
      ::String.new(to_unsafe.as(LibGObject::EnumValue*).value.value_name)
    end

    def value_name=(value : ::String)
      to_unsafe.as(LibGObject::EnumValue*).value.value_name = value.to_unsafe
    end

    def value_nick
      ::String.new(to_unsafe.as(LibGObject::EnumValue*).value.value_nick)
    end

    def value_nick=(value : ::String)
      to_unsafe.as(LibGObject::EnumValue*).value.value_nick = value.to_unsafe
    end
  end

  class FlagsClass
    include GObject::WrappedType

    def self.new(g_type_class : GObject::TypeClass? = nil, mask : UInt32? = nil, n_values : UInt32? = nil, values : GObject::FlagsValue? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGObject::FlagsClass*))
      __var0.g_type_class = g_type_class unless g_type_class.nil?
      __var0.mask = mask unless mask.nil?
      __var0.n_values = n_values unless n_values.nil?
      __var0.values = values unless values.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::FlagsClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::FlagsClass*)
    end

    def to_unsafe_flagsclass
      @pointer.not_nil!.as(LibGObject::FlagsClass*)
    end

    def g_type_class
      GObject::TypeClass.new(to_unsafe.as(LibGObject::FlagsClass*).value.g_type_class)
    end

    def g_type_class=(value : GObject::TypeClass)
      to_unsafe.as(LibGObject::FlagsClass*).value.g_type_class = value
    end

    def mask
      to_unsafe.as(LibGObject::FlagsClass*).value.mask
    end

    def mask=(value : UInt32)
      to_unsafe.as(LibGObject::FlagsClass*).value.mask = UInt32.new(value)
    end

    def n_values
      to_unsafe.as(LibGObject::FlagsClass*).value.n_values
    end

    def n_values=(value : UInt32)
      to_unsafe.as(LibGObject::FlagsClass*).value.n_values = UInt32.new(value)
    end

    def values
      GObject::FlagsValue.new(to_unsafe.as(LibGObject::FlagsClass*).value.values)
    end

    def values=(value : GObject::FlagsValue)
      to_unsafe.as(LibGObject::FlagsClass*).value.values = value.to_unsafe.as(LibGObject::FlagsValue*)
    end
  end

  class FlagsValue
    include GObject::WrappedType

    def self.new(value : UInt32? = nil, value_name : ::String? = nil, value_nick : ::String? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGObject::FlagsValue*))
      __var0.value = value unless value.nil?
      __var0.value_name = value_name unless value_name.nil?
      __var0.value_nick = value_nick unless value_nick.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::FlagsValue*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::FlagsValue*)
    end

    def to_unsafe_flagsvalue
      @pointer.not_nil!.as(LibGObject::FlagsValue*)
    end

    def value
      to_unsafe.as(LibGObject::FlagsValue*).value.value
    end

    def value=(value : UInt32)
      to_unsafe.as(LibGObject::FlagsValue*).value.value = UInt32.new(value)
    end

    def value_name
      ::String.new(to_unsafe.as(LibGObject::FlagsValue*).value.value_name)
    end

    def value_name=(value : ::String)
      to_unsafe.as(LibGObject::FlagsValue*).value.value_name = value.to_unsafe
    end

    def value_nick
      ::String.new(to_unsafe.as(LibGObject::FlagsValue*).value.value_nick)
    end

    def value_nick=(value : ::String)
      to_unsafe.as(LibGObject::FlagsValue*).value.value_nick = value.to_unsafe
    end
  end

  class InitiallyUnowned < Object
    @pointer : Void*

    def initialize(pointer : LibGObject::InitiallyUnowned*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GInitiallyUnowned")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGObject._g_initially_unowned_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::InitiallyUnowned*)
    end

    def to_unsafe_initiallyunowned
      @pointer.not_nil!.as(LibGObject::InitiallyUnowned*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(LibGObject._g_initially_unowned_get_type, 0, nil, nil).as(Void*)
    end
  end

  class InitiallyUnownedClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(136u64, 0u8).as(LibGObject::InitiallyUnownedClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::InitiallyUnownedClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::InitiallyUnownedClass*)
    end

    def to_unsafe_initiallyunownedclass
      @pointer.not_nil!.as(LibGObject::InitiallyUnownedClass*)
    end

    def g_type_class
      GObject::TypeClass.new(to_unsafe.as(LibGObject::InitiallyUnownedClass*).value.g_type_class)
    end

    def construct_properties
      GLib::SListIterator(Void*, Pointer(Void)*).new(GLib::SList.new(to_unsafe.as(LibGObject::InitiallyUnownedClass*).value.construct_properties.as(LibGLib::SList*)))
    end

    def constructor
      to_unsafe.as(LibGObject::InitiallyUnownedClass*).value.constructor
    end

    def set_property
      to_unsafe.as(LibGObject::InitiallyUnownedClass*).value.set_property
    end

    def get_property
      to_unsafe.as(LibGObject::InitiallyUnownedClass*).value.get_property
    end

    def dispose
      to_unsafe.as(LibGObject::InitiallyUnownedClass*).value.dispose
    end

    def _finalize
      to_unsafe.as(LibGObject::InitiallyUnownedClass*).value.finalize
    end

    def dispatch_properties_changed
      to_unsafe.as(LibGObject::InitiallyUnownedClass*).value.dispatch_properties_changed
    end

    def notify
      to_unsafe.as(LibGObject::InitiallyUnownedClass*).value.notify
    end

    def constructed
      to_unsafe.as(LibGObject::InitiallyUnownedClass*).value.constructed
    end

    def flags
      to_unsafe.as(LibGObject::InitiallyUnownedClass*).value.flags
    end

    def pdummy
      GObject::PointerIterator.new(to_unsafe.as(LibGObject::InitiallyUnownedClass*).value.pdummy) { |__var0|
        __var0
      }
    end
  end

  alias InstanceInitFunc = LibGObject::InstanceInitFunc
  alias InterfaceFinalizeFunc = LibGObject::InterfaceFinalizeFunc

  class InterfaceInfo
    include GObject::WrappedType

    def self.new(interface_init : GObject::InterfaceInitFunc? = nil, interface_finalize : GObject::InterfaceFinalizeFunc? = nil, interface_data : Void*? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGObject::InterfaceInfo*))
      __var0.interface_init = interface_init unless interface_init.nil?
      __var0.interface_finalize = interface_finalize unless interface_finalize.nil?
      __var0.interface_data = interface_data unless interface_data.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::InterfaceInfo*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::InterfaceInfo*)
    end

    def to_unsafe_interfaceinfo
      @pointer.not_nil!.as(LibGObject::InterfaceInfo*)
    end

    def interface_init
      to_unsafe.as(LibGObject::InterfaceInfo*).value.interface_init
    end

    def interface_init=(value : GObject::InterfaceInitFunc)
      to_unsafe.as(LibGObject::InterfaceInfo*).value.interface_init = value
    end

    def interface_finalize
      to_unsafe.as(LibGObject::InterfaceInfo*).value.interface_finalize
    end

    def interface_finalize=(value : GObject::InterfaceFinalizeFunc)
      to_unsafe.as(LibGObject::InterfaceInfo*).value.interface_finalize = value
    end

    def interface_data
      to_unsafe.as(LibGObject::InterfaceInfo*).value.interface_data
    end

    def interface_data=(value : Void*)
      to_unsafe.as(LibGObject::InterfaceInfo*).value.interface_data = value
    end
  end

  alias InterfaceInitFunc = LibGObject::InterfaceInitFunc

  class Binding < Object
    @pointer : Void*

    def initialize(pointer : LibGObject::Binding*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GBinding")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGObject._g_binding_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::Binding*)
    end

    def to_unsafe_binding
      @pointer.not_nil!.as(LibGObject::Binding*)
    end

    def initialize(*, flags : GObject::BindingFlags? = nil, source : GObject::Object? = nil, source_property : ::String? = nil, target : GObject::Object? = nil, target_property : ::String? = nil)
      __var0 = [] of UInt8*
      __var1 = [] of LibGObject::Value
      unless flags.nil?
        __var0 << "flags".to_unsafe
        __var1 << flags.to_gvalue.to_unsafe.value
      end

      unless source.nil?
        __var0 << "source".to_unsafe
        __var1 << source.to_gvalue.to_unsafe.value
      end

      unless source_property.nil?
        __var0 << "source-property".to_unsafe
        __var1 << source_property.to_gvalue.to_unsafe.value
      end

      unless target.nil?
        __var0 << "target".to_unsafe
        __var1 << target.to_gvalue.to_unsafe.value
      end

      unless target_property.nil?
        __var0 << "target-property".to_unsafe
        __var1 << target_property.to_gvalue.to_unsafe.value
      end

      @pointer = LibGObject.new_with_properties(LibGObject._g_binding_get_type, __var0.size, __var0, __var1).as(Void*)
    end

    def flags
      __var0 = LibGObject.binding_get_flags(@pointer.as(LibGObject::Binding*))
      GObject::BindingFlags.new(__var0)
    end

    def source
      __var0 = LibGObject.binding_get_source(@pointer.as(LibGObject::Binding*))
      GObject.raise_unexpected_null("g_binding_get_source") if __var0.null?
      GObject::Object.new(__var0)
    end

    def source_property
      __var0 = LibGObject.binding_get_source_property(@pointer.as(LibGObject::Binding*))
      GObject.raise_unexpected_null("g_binding_get_source_property") if __var0.null?
      ::String.new(__var0)
    end

    def target
      __var0 = LibGObject.binding_get_target(@pointer.as(LibGObject::Binding*))
      GObject.raise_unexpected_null("g_binding_get_target") if __var0.null?
      GObject::Object.new(__var0)
    end

    def target_property
      __var0 = LibGObject.binding_get_target_property(@pointer.as(LibGObject::Binding*))
      GObject.raise_unexpected_null("g_binding_get_target_property") if __var0.null?
      ::String.new(__var0)
    end

    def unbind
      LibGObject.binding_unbind(@pointer.as(LibGObject::Binding*))
      nil
    end
  end

  class ObjectClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(136u64, 0u8).as(LibGObject::ObjectClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::ObjectClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ObjectClass*)
    end

    def to_unsafe_objectclass
      @pointer.not_nil!.as(LibGObject::ObjectClass*)
    end

    def find_property(property_name : ::String)
      __var0 = LibGObject.object_class_find_property(@pointer.as(LibGObject::ObjectClass*), property_name.to_unsafe)
      GObject.raise_unexpected_null("g_object_class_find_property") if __var0.null?
      GObject::ParamSpec.new(__var0)
    end

    def install_properties(pspecs : ::Enumerable)
      n_pspecs = pspecs.size
      __pspecs = (__pspecs_ary = pspecs.map { |__item| __item.to_unsafe_paramspec }.to_a).to_unsafe
      n_pspecs = __pspecs_ary.size
      LibGObject.object_class_install_properties(@pointer.as(LibGObject::ObjectClass*), UInt32.new(n_pspecs), __pspecs)
      nil
    end

    def install_property(property_id : ::Int, pspec : GObject::ParamSpec)
      LibGObject.object_class_install_property(@pointer.as(LibGObject::ObjectClass*), UInt32.new(property_id), pspec.to_unsafe_paramspec)
      nil
    end

    def list_properties
      __var0 = LibGObject.object_class_list_properties(@pointer.as(LibGObject::ObjectClass*), out n_properties)
      GObject.raise_unexpected_null("g_object_class_list_properties") if __var0.null?
      {GObject::PointerIterator.new(__var0) { |__var1|
        GObject::ParamSpec.new(__var1)
      }, n_properties}
    end

    def override_property(property_id : ::Int, name : ::String)
      LibGObject.object_class_override_property(@pointer.as(LibGObject::ObjectClass*), UInt32.new(property_id), name.to_unsafe)
      nil
    end

    def g_type_class
      GObject::TypeClass.new(to_unsafe.as(LibGObject::ObjectClass*).value.g_type_class)
    end

    def construct_properties
      GLib::SListIterator(Void*, Pointer(Void)*).new(GLib::SList.new(to_unsafe.as(LibGObject::ObjectClass*).value.construct_properties.as(LibGLib::SList*)))
    end

    def constructor
      to_unsafe.as(LibGObject::ObjectClass*).value.constructor
    end

    def set_property
      to_unsafe.as(LibGObject::ObjectClass*).value.set_property
    end

    def get_property
      to_unsafe.as(LibGObject::ObjectClass*).value.get_property
    end

    def dispose
      to_unsafe.as(LibGObject::ObjectClass*).value.dispose
    end

    def _finalize
      to_unsafe.as(LibGObject::ObjectClass*).value.finalize
    end

    def dispatch_properties_changed
      to_unsafe.as(LibGObject::ObjectClass*).value.dispatch_properties_changed
    end

    def notify
      to_unsafe.as(LibGObject::ObjectClass*).value.notify
    end

    def constructed
      to_unsafe.as(LibGObject::ObjectClass*).value.constructed
    end

    def flags
      to_unsafe.as(LibGObject::ObjectClass*).value.flags
    end

    def pdummy
      GObject::PointerIterator.new(to_unsafe.as(LibGObject::ObjectClass*).value.pdummy) { |__var0|
        __var0
      }
    end
  end

  class ObjectConstructParam
    include GObject::WrappedType

    def self.new(pspec : GObject::ParamSpec? = nil, value : GObject::Value? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibGObject::ObjectConstructParam*))
      __var0.pspec = pspec unless pspec.nil?
      __var0.value = value unless value.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::ObjectConstructParam*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ObjectConstructParam*)
    end

    def to_unsafe_objectconstructparam
      @pointer.not_nil!.as(LibGObject::ObjectConstructParam*)
    end

    def pspec
      GObject::ParamSpec.new(to_unsafe.as(LibGObject::ObjectConstructParam*).value.pspec)
    end

    def pspec=(value : GObject::ParamSpec)
      to_unsafe.as(LibGObject::ObjectConstructParam*).value.pspec = value.to_unsafe_paramspec
    end

    def value
      GObject::Value.new(to_unsafe.as(LibGObject::ObjectConstructParam*).value.value)
    end

    def value=(value : GObject::Value)
      to_unsafe.as(LibGObject::ObjectConstructParam*).value.value = value.to_gvalue.to_unsafe
    end
  end

  alias ObjectFinalizeFunc = LibGObject::ObjectFinalizeFunc
  alias ObjectGetPropertyFunc = LibGObject::ObjectGetPropertyFunc
  alias ObjectSetPropertyFunc = LibGObject::ObjectSetPropertyFunc

  @[Flags]
  enum ParamFlags : UInt32
    ZERO_NONE       =          0
    READABLE        =          1
    WRITABLE        =          2
    READWRITE       =          3
    CONSTRUCT       =          4
    CONSTRUCT_ONLY  =          8
    LAX_VALIDATION  =         16
    STATIC_NAME     =         32
    PRIVATE         =         32
    STATIC_NICK     =         64
    STATIC_BLURB    =        128
    EXPLICIT_NOTIFY = 1073741824
    DEPRECATED      = 2147483648
  end

  class ParamSpec
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpec*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParam")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParam"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpec*)
    end

    def to_unsafe_paramspec
      @pointer.not_nil!.as(LibGObject::ParamSpec*)
    end

    def blurb
      __var0 = LibGObject.param_spec_get_blurb(@pointer.as(LibGObject::ParamSpec*))
      GObject.raise_unexpected_null("g_param_spec_get_blurb") if __var0.null?
      ::String.new(__var0)
    end

    def default_value
      __var0 = LibGObject.param_spec_get_default_value(@pointer.as(LibGObject::ParamSpec*))
      GObject.raise_unexpected_null("g_param_spec_get_default_value") if __var0.null?
      GObject::Value.new(__var0)
    end

    def name
      __var0 = LibGObject.param_spec_get_name(@pointer.as(LibGObject::ParamSpec*))
      GObject.raise_unexpected_null("g_param_spec_get_name") if __var0.null?
      ::String.new(__var0)
    end

    def name_quark
      __var0 = LibGObject.param_spec_get_name_quark(@pointer.as(LibGObject::ParamSpec*))
      __var0
    end

    def nick
      __var0 = LibGObject.param_spec_get_nick(@pointer.as(LibGObject::ParamSpec*))
      GObject.raise_unexpected_null("g_param_spec_get_nick") if __var0.null?
      ::String.new(__var0)
    end

    def qdata(quark : ::Int)
      LibGObject.param_spec_get_qdata(@pointer.as(LibGObject::ParamSpec*), UInt32.new(quark))
      nil
    end

    def redirect_target
      __var0 = LibGObject.param_spec_get_redirect_target(@pointer.as(LibGObject::ParamSpec*))
      GObject.raise_unexpected_null("g_param_spec_get_redirect_target") if __var0.null?
      GObject::ParamSpec.new(__var0)
    end

    def set_qdata(quark : ::Int, data : Void*?)
      LibGObject.param_spec_set_qdata(@pointer.as(LibGObject::ParamSpec*), UInt32.new(quark), data ? data : Pointer(Void).null)
      nil
    end

    def sink
      LibGObject.param_spec_sink(@pointer.as(LibGObject::ParamSpec*))
      nil
    end

    def steal_qdata(quark : ::Int)
      LibGObject.param_spec_steal_qdata(@pointer.as(LibGObject::ParamSpec*), UInt32.new(quark))
      nil
    end
  end

  class ParamSpecBoolean < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecBoolean*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamBoolean")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamBoolean"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecBoolean*)
    end

    def to_unsafe_paramspecboolean
      @pointer.not_nil!.as(LibGObject::ParamSpecBoolean*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamBoolean"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecBoxed < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecBoxed*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamBoxed")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamBoxed"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecBoxed*)
    end

    def to_unsafe_paramspecboxed
      @pointer.not_nil!.as(LibGObject::ParamSpecBoxed*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamBoxed"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecChar < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecChar*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamChar")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamChar"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecChar*)
    end

    def to_unsafe_paramspecchar
      @pointer.not_nil!.as(LibGObject::ParamSpecChar*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamChar"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(80u64, 0u8).as(LibGObject::ParamSpecClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecClass*)
    end

    def to_unsafe_paramspecclass
      @pointer.not_nil!.as(LibGObject::ParamSpecClass*)
    end

    def g_type_class
      GObject::TypeClass.new(to_unsafe.as(LibGObject::ParamSpecClass*).value.g_type_class)
    end

    def value_type
      to_unsafe.as(LibGObject::ParamSpecClass*).value.value_type
    end

    def _finalize
      to_unsafe.as(LibGObject::ParamSpecClass*).value.finalize
    end

    def value_set_default
      to_unsafe.as(LibGObject::ParamSpecClass*).value.value_set_default
    end

    def value_validate
      to_unsafe.as(LibGObject::ParamSpecClass*).value.value_validate
    end

    def values_cmp
      to_unsafe.as(LibGObject::ParamSpecClass*).value.values_cmp
    end

    def dummy
      GObject::PointerIterator.new(to_unsafe.as(LibGObject::ParamSpecClass*).value.dummy) { |__var0|
        __var0
      }
    end
  end

  class ParamSpecDouble < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecDouble*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamDouble")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamDouble"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecDouble*)
    end

    def to_unsafe_paramspecdouble
      @pointer.not_nil!.as(LibGObject::ParamSpecDouble*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamDouble"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecEnum < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecEnum*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamEnum")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamEnum"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecEnum*)
    end

    def to_unsafe_paramspecenum
      @pointer.not_nil!.as(LibGObject::ParamSpecEnum*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamEnum"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecFlags < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecFlags*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamFlags")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamFlags"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecFlags*)
    end

    def to_unsafe_paramspecflags
      @pointer.not_nil!.as(LibGObject::ParamSpecFlags*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamFlags"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecFloat < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecFloat*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamFloat")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamFloat"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecFloat*)
    end

    def to_unsafe_paramspecfloat
      @pointer.not_nil!.as(LibGObject::ParamSpecFloat*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamFloat"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecGType < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecGType*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamGType")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamGType"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecGType*)
    end

    def to_unsafe_paramspecgtype
      @pointer.not_nil!.as(LibGObject::ParamSpecGType*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamGType"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecInt < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecInt*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamInt")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamInt"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecInt*)
    end

    def to_unsafe_paramspecint
      @pointer.not_nil!.as(LibGObject::ParamSpecInt*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamInt"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecInt64 < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecInt64*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamInt64")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamInt64"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecInt64*)
    end

    def to_unsafe_paramspecint64
      @pointer.not_nil!.as(LibGObject::ParamSpecInt64*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamInt64"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecLong < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecLong*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamLong")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamLong"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecLong*)
    end

    def to_unsafe_paramspeclong
      @pointer.not_nil!.as(LibGObject::ParamSpecLong*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamLong"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecObject < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecObject*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamObject")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamObject"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecObject*)
    end

    def to_unsafe_paramspecobject
      @pointer.not_nil!.as(LibGObject::ParamSpecObject*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamObject"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecOverride < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecOverride*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamOverride")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamOverride"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecOverride*)
    end

    def to_unsafe_paramspecoverride
      @pointer.not_nil!.as(LibGObject::ParamSpecOverride*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamOverride"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecParam < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecParam*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamParam")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamParam"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecParam*)
    end

    def to_unsafe_paramspecparam
      @pointer.not_nil!.as(LibGObject::ParamSpecParam*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamParam"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecPointer < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecPointer*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamPointer")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamPointer"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecPointer*)
    end

    def to_unsafe_paramspecpointer
      @pointer.not_nil!.as(LibGObject::ParamSpecPointer*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamPointer"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecPool
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecPool*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecPool*)
    end

    def to_unsafe_paramspecpool
      @pointer.not_nil!.as(LibGObject::ParamSpecPool*)
    end

    def insert(pspec : GObject::ParamSpec, owner_type : UInt64)
      LibGObject.param_spec_pool_insert(@pointer.as(LibGObject::ParamSpecPool*), pspec.to_unsafe_paramspec, UInt64.new(owner_type))
      nil
    end

    def list(owner_type : UInt64)
      __var0 = LibGObject.param_spec_pool_list(@pointer.as(LibGObject::ParamSpecPool*), UInt64.new(owner_type), out n_pspecs_p)
      GObject.raise_unexpected_null("g_param_spec_pool_list") if __var0.null?
      {GObject::PointerIterator.new(__var0) { |__var1|
        GObject::ParamSpec.new(__var1)
      }, n_pspecs_p}
    end

    def list_owned(owner_type : UInt64)
      __var0 = LibGObject.param_spec_pool_list_owned(@pointer.as(LibGObject::ParamSpecPool*), UInt64.new(owner_type))
      GObject.raise_unexpected_null("g_param_spec_pool_list_owned") if __var0.null?
      GLib::ListIterator(GObject::ParamSpec, LibGObject::ParamSpec*).new(GLib::List.new(__var0.as(LibGLib::List*)))
    end

    def lookup(param_name : ::String, owner_type : UInt64, walk_ancestors : ::Bool)
      __var0 = LibGObject.param_spec_pool_lookup(@pointer.as(LibGObject::ParamSpecPool*), param_name.to_unsafe, UInt64.new(owner_type), LibC::Int.new(walk_ancestors ? 1 : 0))
      GObject.raise_unexpected_null("g_param_spec_pool_lookup") if __var0.null?
      GObject::ParamSpec.new(__var0)
    end

    def remove(pspec : GObject::ParamSpec)
      LibGObject.param_spec_pool_remove(@pointer.as(LibGObject::ParamSpecPool*), pspec.to_unsafe_paramspec)
      nil
    end

    def self.new(type_prefixing : ::Bool)
      __var0 = LibGObject.param_spec_pool_new(LibC::Int.new(type_prefixing ? 1 : 0))
      GObject.raise_unexpected_null("g_param_spec_pool_new") if __var0.null?
      GObject::ParamSpecPool.new(__var0)
    end
  end

  class ParamSpecString < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecString*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamString")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamString"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecString*)
    end

    def to_unsafe_paramspecstring
      @pointer.not_nil!.as(LibGObject::ParamSpecString*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamString"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecTypeInfo
    include GObject::WrappedType

    def self.new(instance_size : UInt16? = nil, n_preallocs : UInt16? = nil, value_type : UInt64? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(56u64, 0u8).as(LibGObject::ParamSpecTypeInfo*))
      __var0.instance_size = instance_size unless instance_size.nil?
      __var0.n_preallocs = n_preallocs unless n_preallocs.nil?
      __var0.value_type = value_type unless value_type.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecTypeInfo*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecTypeInfo*)
    end

    def to_unsafe_paramspectypeinfo
      @pointer.not_nil!.as(LibGObject::ParamSpecTypeInfo*)
    end

    def instance_size
      to_unsafe.as(LibGObject::ParamSpecTypeInfo*).value.instance_size
    end

    def instance_size=(value : UInt16)
      to_unsafe.as(LibGObject::ParamSpecTypeInfo*).value.instance_size = UInt16.new(value)
    end

    def n_preallocs
      to_unsafe.as(LibGObject::ParamSpecTypeInfo*).value.n_preallocs
    end

    def n_preallocs=(value : UInt16)
      to_unsafe.as(LibGObject::ParamSpecTypeInfo*).value.n_preallocs = UInt16.new(value)
    end

    def instance_init
      to_unsafe.as(LibGObject::ParamSpecTypeInfo*).value.instance_init
    end

    def value_type
      to_unsafe.as(LibGObject::ParamSpecTypeInfo*).value.value_type
    end

    def value_type=(value : UInt64)
      to_unsafe.as(LibGObject::ParamSpecTypeInfo*).value.value_type = UInt64.new(value)
    end

    def _finalize
      to_unsafe.as(LibGObject::ParamSpecTypeInfo*).value.finalize
    end

    def value_set_default
      to_unsafe.as(LibGObject::ParamSpecTypeInfo*).value.value_set_default
    end

    def value_validate
      to_unsafe.as(LibGObject::ParamSpecTypeInfo*).value.value_validate
    end

    def values_cmp
      to_unsafe.as(LibGObject::ParamSpecTypeInfo*).value.values_cmp
    end
  end

  class ParamSpecUChar < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecUChar*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamUChar")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamUChar"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecUChar*)
    end

    def to_unsafe_paramspecuchar
      @pointer.not_nil!.as(LibGObject::ParamSpecUChar*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamUChar"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecUInt < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecUInt*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamUInt")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamUInt"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecUInt*)
    end

    def to_unsafe_paramspecuint
      @pointer.not_nil!.as(LibGObject::ParamSpecUInt*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamUInt"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecUInt64 < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecUInt64*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamUInt64")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamUInt64"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecUInt64*)
    end

    def to_unsafe_paramspecuint64
      @pointer.not_nil!.as(LibGObject::ParamSpecUInt64*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamUInt64"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecULong < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecULong*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamULong")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamULong"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecULong*)
    end

    def to_unsafe_paramspeculong
      @pointer.not_nil!.as(LibGObject::ParamSpecULong*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamULong"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecUnichar < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecUnichar*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamUnichar")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamUnichar"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecUnichar*)
    end

    def to_unsafe_paramspecunichar
      @pointer.not_nil!.as(LibGObject::ParamSpecUnichar*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamUnichar"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecValueArray < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecValueArray*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamValueArray")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamValueArray"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecValueArray*)
    end

    def to_unsafe_paramspecvaluearray
      @pointer.not_nil!.as(LibGObject::ParamSpecValueArray*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamValueArray"), 0, nil, nil).as(Void*)
    end
  end

  class ParamSpecVariant < ParamSpec
    @pointer : Void*

    def initialize(pointer : LibGObject::ParamSpecVariant*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GParamVariant")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), GObject.type_from_name("GParamVariant"))
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ParamSpecVariant*)
    end

    def to_unsafe_paramspecvariant
      @pointer.not_nil!.as(LibGObject::ParamSpecVariant*)
    end

    def initialize
      @pointer = LibGObject.new_with_properties(GObject.type_from_name("GParamVariant"), 0, nil, nil).as(Void*)
    end
  end

  class Parameter
    include GObject::WrappedType

    def self.new(name : ::String? = nil, value : GObject::Value? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(32u64, 0u8).as(LibGObject::Parameter*))
      __var0.name = name unless name.nil?
      __var0.value = value unless value.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::Parameter*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::Parameter*)
    end

    def to_unsafe_parameter
      @pointer.not_nil!.as(LibGObject::Parameter*)
    end

    def name
      ::String.new(to_unsafe.as(LibGObject::Parameter*).value.name)
    end

    def name=(value : ::String)
      to_unsafe.as(LibGObject::Parameter*).value.name = value.to_unsafe
    end

    def value
      GObject::Value.new(to_unsafe.as(LibGObject::Parameter*).value.value)
    end

    def value=(value : GObject::Value)
      to_unsafe.as(LibGObject::Parameter*).value.value = value.to_gvalue.to_unsafe.value
    end
  end

  alias SignalAccumulator = LibGObject::SignalAccumulator
  alias SignalEmissionHook = LibGObject::SignalEmissionHook

  @[Flags]
  enum SignalFlags : UInt32
    ZERO_NONE    =   0
    RUN_FIRST    =   1
    RUN_LAST     =   2
    RUN_CLEANUP  =   4
    NO_RECURSE   =   8
    DETAILED     =  16
    ACTION       =  32
    NO_HOOKS     =  64
    MUST_COLLECT = 128
    DEPRECATED   = 256
  end

  class SignalInvocationHint
    include GObject::WrappedType

    def self.new(signal_id : UInt32? = nil, detail : UInt32? = nil, run_type : GObject::SignalFlags? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(12u64, 0u8).as(LibGObject::SignalInvocationHint*))
      __var0.signal_id = signal_id unless signal_id.nil?
      __var0.detail = detail unless detail.nil?
      __var0.run_type = run_type unless run_type.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::SignalInvocationHint*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::SignalInvocationHint*)
    end

    def to_unsafe_signalinvocationhint
      @pointer.not_nil!.as(LibGObject::SignalInvocationHint*)
    end

    def signal_id
      to_unsafe.as(LibGObject::SignalInvocationHint*).value.signal_id
    end

    def signal_id=(value : UInt32)
      to_unsafe.as(LibGObject::SignalInvocationHint*).value.signal_id = UInt32.new(value)
    end

    def detail
      to_unsafe.as(LibGObject::SignalInvocationHint*).value.detail
    end

    def detail=(value : UInt32)
      to_unsafe.as(LibGObject::SignalInvocationHint*).value.detail = UInt32.new(value)
    end

    def run_type
      GObject::SignalFlags.new(to_unsafe.as(LibGObject::SignalInvocationHint*).value.run_type)
    end

    def run_type=(value : GObject::SignalFlags)
      to_unsafe.as(LibGObject::SignalInvocationHint*).value.run_type = value
    end
  end

  @[Flags]
  enum SignalMatchType : UInt32
    ZERO_NONE =  0
    ID        =  1
    DETAIL    =  2
    CLOSURE   =  4
    FUNC      =  8
    DATA      = 16
    UNBLOCKED = 32
  end

  class SignalQuery
    include GObject::WrappedType

    def self.new(signal_id : UInt32? = nil, signal_name : ::String? = nil, itype : UInt64? = nil, signal_flags : GObject::SignalFlags? = nil, return_type : UInt64? = nil, n_params : UInt32? = nil, param_types : ::Enumerable(UInt64)? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(56u64, 0u8).as(LibGObject::SignalQuery*))
      __var0.signal_id = signal_id unless signal_id.nil?
      __var0.signal_name = signal_name unless signal_name.nil?
      __var0.itype = itype unless itype.nil?
      __var0.signal_flags = signal_flags unless signal_flags.nil?
      __var0.return_type = return_type unless return_type.nil?
      __var0.n_params = n_params unless n_params.nil?
      __var0.param_types = param_types unless param_types.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::SignalQuery*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::SignalQuery*)
    end

    def to_unsafe_signalquery
      @pointer.not_nil!.as(LibGObject::SignalQuery*)
    end

    def signal_id
      to_unsafe.as(LibGObject::SignalQuery*).value.signal_id
    end

    def signal_id=(value : UInt32)
      to_unsafe.as(LibGObject::SignalQuery*).value.signal_id = UInt32.new(value)
    end

    def signal_name
      ::String.new(to_unsafe.as(LibGObject::SignalQuery*).value.signal_name)
    end

    def signal_name=(value : ::String)
      to_unsafe.as(LibGObject::SignalQuery*).value.signal_name = value.to_unsafe
    end

    def itype
      to_unsafe.as(LibGObject::SignalQuery*).value.itype
    end

    def itype=(value : UInt64)
      to_unsafe.as(LibGObject::SignalQuery*).value.itype = UInt64.new(value)
    end

    def signal_flags
      GObject::SignalFlags.new(to_unsafe.as(LibGObject::SignalQuery*).value.signal_flags)
    end

    def signal_flags=(value : GObject::SignalFlags)
      to_unsafe.as(LibGObject::SignalQuery*).value.signal_flags = value
    end

    def return_type
      to_unsafe.as(LibGObject::SignalQuery*).value.return_type
    end

    def return_type=(value : UInt64)
      to_unsafe.as(LibGObject::SignalQuery*).value.return_type = UInt64.new(value)
    end

    def n_params
      to_unsafe.as(LibGObject::SignalQuery*).value.n_params
    end

    def n_params=(value : UInt32)
      to_unsafe.as(LibGObject::SignalQuery*).value.n_params = UInt32.new(value)
    end

    def param_types
      GObject::PointerIterator.new(to_unsafe.as(LibGObject::SignalQuery*).value.param_types) { |__var0|
        __var0
      }
    end

    def param_types=(value : ::Enumerable(UInt64))
      to_unsafe.as(LibGObject::SignalQuery*).value.param_types = (__value_ary = value.map { |__item| UInt64.new(__item) }.to_a).to_unsafe
    end
  end

  alias ToggleNotify = LibGObject::ToggleNotify

  class TypeCValue
    include GObject::WrappedType
    alias Union = TypeCValue

    @pointer : Void*

    def initialize(pointer : LibGObject::TypeCValue*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::TypeCValue*)
    end

    def to_unsafe_typecvalue
      @pointer.not_nil!.as(LibGObject::TypeCValue*)
    end
  end

  class TypeClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(8u64, 0u8).as(LibGObject::TypeClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::TypeClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::TypeClass*)
    end

    def to_unsafe_typeclass
      @pointer.not_nil!.as(LibGObject::TypeClass*)
    end

    def add_private(private_size : ::Int)
      LibGObject.type_class_add_private(@pointer.as(LibGObject::TypeClass*), UInt64.new(private_size))
      nil
    end

    def private(private_type : UInt64)
      LibGObject.type_class_get_private(@pointer.as(LibGObject::TypeClass*), UInt64.new(private_type))
      nil
    end

    def peek_parent
      __var0 = LibGObject.type_class_peek_parent(@pointer.as(LibGObject::TypeClass*))
      GObject.raise_unexpected_null("g_type_class_peek_parent") if __var0.null?
      GObject::TypeClass.new(__var0)
    end

    def unref
      LibGObject.type_class_unref(@pointer.as(LibGObject::TypeClass*))
      nil
    end

    def self.adjust_private_offset(g_class : Void*?, private_size_or_offset : ::Int)
      LibGObject.type_class_adjust_private_offset(g_class ? g_class : Pointer(Void).null, private_size_or_offset)
      nil
    end

    def self.peek(type : UInt64)
      __var0 = LibGObject.type_class_peek(UInt64.new(type))
      GObject.raise_unexpected_null("g_type_class_peek") if __var0.null?
      GObject::TypeClass.new(__var0)
    end

    def self.peek_static(type : UInt64)
      __var0 = LibGObject.type_class_peek_static(UInt64.new(type))
      GObject.raise_unexpected_null("g_type_class_peek_static") if __var0.null?
      GObject::TypeClass.new(__var0)
    end

    def self.ref(type : UInt64)
      __var0 = LibGObject.type_class_ref(UInt64.new(type))
      GObject.raise_unexpected_null("g_type_class_ref") if __var0.null?
      GObject::TypeClass.new(__var0)
    end

    def g_type
      to_unsafe.as(LibGObject::TypeClass*).value.g_type
    end
  end

  alias TypeClassCacheFunc = LibGObject::TypeClassCacheFunc

  @[Flags]
  enum TypeDebugFlags : UInt32
    NONE           = 0
    OBJECTS        = 1
    SIGNALS        = 2
    INSTANCE_COUNT = 4
    MASK           = 7
  end

  @[Flags]
  enum TypeFlags : UInt32
    ZERO_NONE      =  0
    ABSTRACT       = 16
    VALUE_ABSTRACT = 32
  end

  @[Flags]
  enum TypeFundamentalFlags : UInt32
    ZERO_NONE      = 0
    CLASSED        = 1
    INSTANTIATABLE = 2
    DERIVABLE      = 4
    DEEP_DERIVABLE = 8
  end

  class TypeFundamentalInfo
    include GObject::WrappedType

    def self.new(type_flags : GObject::TypeFundamentalFlags? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(4u64, 0u8).as(LibGObject::TypeFundamentalInfo*))
      __var0.type_flags = type_flags unless type_flags.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::TypeFundamentalInfo*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::TypeFundamentalInfo*)
    end

    def to_unsafe_typefundamentalinfo
      @pointer.not_nil!.as(LibGObject::TypeFundamentalInfo*)
    end

    def type_flags
      GObject::TypeFundamentalFlags.new(to_unsafe.as(LibGObject::TypeFundamentalInfo*).value.type_flags)
    end

    def type_flags=(value : GObject::TypeFundamentalFlags)
      to_unsafe.as(LibGObject::TypeFundamentalInfo*).value.type_flags = value
    end
  end

  class TypeInfo
    include GObject::WrappedType

    def self.new(class_size : UInt16? = nil, base_init : GObject::BaseInitFunc? = nil, base_finalize : GObject::BaseFinalizeFunc? = nil, class_init : GObject::ClassInitFunc? = nil, class_finalize : GObject::ClassFinalizeFunc? = nil, class_data : Void*? = nil, instance_size : UInt16? = nil, n_preallocs : UInt16? = nil, instance_init : GObject::InstanceInitFunc? = nil, value_table : GObject::TypeValueTable? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(72u64, 0u8).as(LibGObject::TypeInfo*))
      __var0.class_size = class_size unless class_size.nil?
      __var0.base_init = base_init unless base_init.nil?
      __var0.base_finalize = base_finalize unless base_finalize.nil?
      __var0.class_init = class_init unless class_init.nil?
      __var0.class_finalize = class_finalize unless class_finalize.nil?
      __var0.class_data = class_data unless class_data.nil?
      __var0.instance_size = instance_size unless instance_size.nil?
      __var0.n_preallocs = n_preallocs unless n_preallocs.nil?
      __var0.instance_init = instance_init unless instance_init.nil?
      __var0.value_table = value_table unless value_table.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::TypeInfo*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::TypeInfo*)
    end

    def to_unsafe_typeinfo
      @pointer.not_nil!.as(LibGObject::TypeInfo*)
    end

    def class_size
      to_unsafe.as(LibGObject::TypeInfo*).value.class_size
    end

    def class_size=(value : UInt16)
      to_unsafe.as(LibGObject::TypeInfo*).value.class_size = UInt16.new(value)
    end

    def base_init
      to_unsafe.as(LibGObject::TypeInfo*).value.base_init
    end

    def base_init=(value : GObject::BaseInitFunc)
      to_unsafe.as(LibGObject::TypeInfo*).value.base_init = value
    end

    def base_finalize
      to_unsafe.as(LibGObject::TypeInfo*).value.base_finalize
    end

    def base_finalize=(value : GObject::BaseFinalizeFunc)
      to_unsafe.as(LibGObject::TypeInfo*).value.base_finalize = value
    end

    def class_init
      to_unsafe.as(LibGObject::TypeInfo*).value.class_init
    end

    def class_init=(value : GObject::ClassInitFunc)
      to_unsafe.as(LibGObject::TypeInfo*).value.class_init = value
    end

    def class_finalize
      to_unsafe.as(LibGObject::TypeInfo*).value.class_finalize
    end

    def class_finalize=(value : GObject::ClassFinalizeFunc)
      to_unsafe.as(LibGObject::TypeInfo*).value.class_finalize = value
    end

    def class_data
      to_unsafe.as(LibGObject::TypeInfo*).value.class_data
    end

    def class_data=(value : Void*)
      to_unsafe.as(LibGObject::TypeInfo*).value.class_data = value
    end

    def instance_size
      to_unsafe.as(LibGObject::TypeInfo*).value.instance_size
    end

    def instance_size=(value : UInt16)
      to_unsafe.as(LibGObject::TypeInfo*).value.instance_size = UInt16.new(value)
    end

    def n_preallocs
      to_unsafe.as(LibGObject::TypeInfo*).value.n_preallocs
    end

    def n_preallocs=(value : UInt16)
      to_unsafe.as(LibGObject::TypeInfo*).value.n_preallocs = UInt16.new(value)
    end

    def instance_init
      to_unsafe.as(LibGObject::TypeInfo*).value.instance_init
    end

    def instance_init=(value : GObject::InstanceInitFunc)
      to_unsafe.as(LibGObject::TypeInfo*).value.instance_init = value
    end

    def value_table
      GObject::TypeValueTable.new(to_unsafe.as(LibGObject::TypeInfo*).value.value_table)
    end

    def value_table=(value : GObject::TypeValueTable)
      to_unsafe.as(LibGObject::TypeInfo*).value.value_table = value.to_unsafe.as(LibGObject::TypeValueTable*)
    end
  end

  class TypeInstance
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(8u64, 0u8).as(LibGObject::TypeInstance*))
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::TypeInstance*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::TypeInstance*)
    end

    def to_unsafe_typeinstance
      @pointer.not_nil!.as(LibGObject::TypeInstance*)
    end

    def private(private_type : UInt64)
      LibGObject.type_instance_get_private(@pointer.as(LibGObject::TypeInstance*), UInt64.new(private_type))
      nil
    end

    def g_class
      GObject::TypeClass.new(to_unsafe.as(LibGObject::TypeInstance*).value.g_class)
    end
  end

  class TypeInterface
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(16u64, 0u8).as(LibGObject::TypeInterface*))
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::TypeInterface*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::TypeInterface*)
    end

    def to_unsafe_typeinterface
      @pointer.not_nil!.as(LibGObject::TypeInterface*)
    end

    def peek_parent
      __var0 = LibGObject.type_interface_peek_parent(@pointer.as(LibGObject::TypeInterface*))
      GObject.raise_unexpected_null("g_type_interface_peek_parent") if __var0.null?
      GObject::TypeInterface.new(__var0)
    end

    def self.add_prerequisite(interface_type : UInt64, prerequisite_type : UInt64)
      LibGObject.type_interface_add_prerequisite(UInt64.new(interface_type), UInt64.new(prerequisite_type))
      nil
    end

    def self.plugin(instance_type : UInt64, interface_type : UInt64)
      __var0 = LibGObject.type_interface_get_plugin(UInt64.new(instance_type), UInt64.new(interface_type))
      GObject.raise_unexpected_null("g_type_interface_get_plugin") if __var0.null?
      GObject::TypePlugin::Wrapper.new(__var0)
    end

    def self.peek(instance_class : GObject::TypeClass, iface_type : UInt64)
      __var0 = LibGObject.type_interface_peek(instance_class.to_unsafe.as(LibGObject::TypeClass*), UInt64.new(iface_type))
      GObject.raise_unexpected_null("g_type_interface_peek") if __var0.null?
      GObject::TypeInterface.new(__var0)
    end

    def self.prerequisites(interface_type : UInt64)
      __var0 = LibGObject.type_interface_prerequisites(UInt64.new(interface_type), out n_prerequisites)
      GObject.raise_unexpected_null("g_type_interface_prerequisites") if __var0.null?
      {GObject::PointerIterator.new(__var0) { |__var1|
        __var1
      }, n_prerequisites}
    end

    def g_type
      to_unsafe.as(LibGObject::TypeInterface*).value.g_type
    end

    def g_instance_type
      to_unsafe.as(LibGObject::TypeInterface*).value.g_instance_type
    end
  end

  alias TypeInterfaceCheckFunc = LibGObject::TypeInterfaceCheckFunc

  module TypePlugin
    # :nodoc:
    class Wrapper < GObject::Object
      include GObject::WrappedType
      include TypePlugin
      @pointer : Void*

      def initialize(pointer : LibGObject::TypePlugin*)
        @pointer = pointer.as(Void*)
        raise(ArgumentError.new("#{type_name} is not a GTypePlugin")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGObject._g_type_plugin_get_type)
        LibGObject.object_ref(pointer.as(LibGObject::Object*))
      end

      def finalize
        LibGObject.object_unref(@pointer.as(LibGObject::Object*))
      end

      def to_unsafe
        @pointer.not_nil!.as(LibGObject::TypePlugin*)
      end

      def to_unsafe_typeplugin
        @pointer.not_nil!.as(LibGObject::TypePlugin*)
      end
    end

    def to_unsafe_typeplugin
      @pointer.not_nil!.as(LibGObject::TypePlugin*)
    end

    def complete_interface_info(instance_type : UInt64, interface_type : UInt64, info : GObject::InterfaceInfo)
      LibGObject.type_plugin_complete_interface_info(@pointer.as(LibGObject::TypePlugin*), UInt64.new(instance_type), UInt64.new(interface_type), info.to_unsafe.as(LibGObject::InterfaceInfo*))
      nil
    end

    def complete_type_info(g_type : UInt64, info : GObject::TypeInfo, value_table : GObject::TypeValueTable)
      LibGObject.type_plugin_complete_type_info(@pointer.as(LibGObject::TypePlugin*), UInt64.new(g_type), info.to_unsafe.as(LibGObject::TypeInfo*), value_table.to_unsafe.as(LibGObject::TypeValueTable*))
      nil
    end

    def unuse
      LibGObject.type_plugin_unuse(@pointer.as(LibGObject::TypePlugin*))
      nil
    end

    def use
      LibGObject.type_plugin_use(@pointer.as(LibGObject::TypePlugin*))
      nil
    end
  end

  class TypeModuleClass
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(184u64, 0u8).as(LibGObject::TypeModuleClass*))
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::TypeModuleClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::TypeModuleClass*)
    end

    def to_unsafe_typemoduleclass
      @pointer.not_nil!.as(LibGObject::TypeModuleClass*)
    end

    def parent_class
      GObject::ObjectClass.new(to_unsafe.as(LibGObject::TypeModuleClass*).value.parent_class)
    end

    def load
      to_unsafe.as(LibGObject::TypeModuleClass*).value.load
    end

    def unload
      to_unsafe.as(LibGObject::TypeModuleClass*).value.unload
    end

    def reserved1
      to_unsafe.as(LibGObject::TypeModuleClass*).value.reserved1
    end

    def reserved2
      to_unsafe.as(LibGObject::TypeModuleClass*).value.reserved2
    end

    def reserved3
      to_unsafe.as(LibGObject::TypeModuleClass*).value.reserved3
    end

    def reserved4
      to_unsafe.as(LibGObject::TypeModuleClass*).value.reserved4
    end
  end

  class TypeModule < Object
    include GObject::TypePlugin

    @pointer : Void*

    def initialize(pointer : LibGObject::TypeModule*)
      @pointer = pointer.as(Void*)
      raise(ArgumentError.new("#{type_name} is not a GTypeModule")) unless LibGObject.type_check_instance_is_a(pointer.as(LibGObject::TypeInstance*), LibGObject._g_type_module_get_type)
      LibGObject.object_ref(pointer.as(LibGObject::Object*))
    end

    def finalize
      LibGObject.object_unref(@pointer.as(LibGObject::Object*))
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::TypeModule*)
    end

    def to_unsafe_typemodule
      @pointer.not_nil!.as(LibGObject::TypeModule*)
    end

    def add_interface(instance_type : UInt64, interface_type : UInt64, interface_info : GObject::InterfaceInfo)
      LibGObject.type_module_add_interface(@pointer.as(LibGObject::TypeModule*), UInt64.new(instance_type), UInt64.new(interface_type), interface_info.to_unsafe.as(LibGObject::InterfaceInfo*))
      nil
    end

    def register_enum(name : ::String, const_static_values : GObject::EnumValue)
      __var0 = LibGObject.type_module_register_enum(@pointer.as(LibGObject::TypeModule*), name.to_unsafe, const_static_values.to_unsafe.as(LibGObject::EnumValue*))
      __var0
    end

    def register_flags(name : ::String, const_static_values : GObject::FlagsValue)
      __var0 = LibGObject.type_module_register_flags(@pointer.as(LibGObject::TypeModule*), name.to_unsafe, const_static_values.to_unsafe.as(LibGObject::FlagsValue*))
      __var0
    end

    def register_type(parent_type : UInt64, type_name : ::String, type_info : GObject::TypeInfo, flags : GObject::TypeFlags)
      __var0 = LibGObject.type_module_register_type(@pointer.as(LibGObject::TypeModule*), UInt64.new(parent_type), type_name.to_unsafe, type_info.to_unsafe.as(LibGObject::TypeInfo*), flags)
      __var0
    end

    def name=(name : ::String)
      LibGObject.type_module_set_name(@pointer.as(LibGObject::TypeModule*), name.to_unsafe)
      nil
    end

    def unuse
      LibGObject.type_module_unuse(@pointer.as(LibGObject::TypeModule*))
      nil
    end

    def use
      __var0 = LibGObject.type_module_use(@pointer.as(LibGObject::TypeModule*))
      (__var0 == 1)
    end
  end

  class TypePluginClass
    include GObject::WrappedType

    def self.new(use_plugin : GObject::TypePluginUse? = nil, unuse_plugin : GObject::TypePluginUnuse? = nil, complete_type_info : GObject::TypePluginCompleteTypeInfo? = nil, complete_interface_info : GObject::TypePluginCompleteInterfaceInfo? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(48u64, 0u8).as(LibGObject::TypePluginClass*))
      __var0.use_plugin = use_plugin unless use_plugin.nil?
      __var0.unuse_plugin = unuse_plugin unless unuse_plugin.nil?
      __var0.complete_type_info = complete_type_info unless complete_type_info.nil?
      __var0.complete_interface_info = complete_interface_info unless complete_interface_info.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::TypePluginClass*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::TypePluginClass*)
    end

    def to_unsafe_typepluginclass
      @pointer.not_nil!.as(LibGObject::TypePluginClass*)
    end

    def base_iface
      GObject::TypeInterface.new(to_unsafe.as(LibGObject::TypePluginClass*).value.base_iface)
    end

    def use_plugin
      to_unsafe.as(LibGObject::TypePluginClass*).value.use_plugin
    end

    def use_plugin=(value : GObject::TypePluginUse)
      to_unsafe.as(LibGObject::TypePluginClass*).value.use_plugin = value
    end

    def unuse_plugin
      to_unsafe.as(LibGObject::TypePluginClass*).value.unuse_plugin
    end

    def unuse_plugin=(value : GObject::TypePluginUnuse)
      to_unsafe.as(LibGObject::TypePluginClass*).value.unuse_plugin = value
    end

    def complete_type_info
      to_unsafe.as(LibGObject::TypePluginClass*).value.complete_type_info
    end

    def complete_type_info=(value : GObject::TypePluginCompleteTypeInfo)
      to_unsafe.as(LibGObject::TypePluginClass*).value.complete_type_info = value
    end

    def complete_interface_info
      to_unsafe.as(LibGObject::TypePluginClass*).value.complete_interface_info
    end

    def complete_interface_info=(value : GObject::TypePluginCompleteInterfaceInfo)
      to_unsafe.as(LibGObject::TypePluginClass*).value.complete_interface_info = value
    end
  end

  alias TypePluginCompleteInterfaceInfo = LibGObject::TypePluginCompleteInterfaceInfo
  alias TypePluginCompleteTypeInfo = LibGObject::TypePluginCompleteTypeInfo
  alias TypePluginUnuse = LibGObject::TypePluginUnuse
  alias TypePluginUse = LibGObject::TypePluginUse

  class TypeQuery
    include GObject::WrappedType

    def self.new(type : UInt64? = nil, type_name : ::String? = nil, class_size : UInt32? = nil, instance_size : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGObject::TypeQuery*))
      __var0.type = type unless type.nil?
      __var0.type_name = type_name unless type_name.nil?
      __var0.class_size = class_size unless class_size.nil?
      __var0.instance_size = instance_size unless instance_size.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::TypeQuery*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::TypeQuery*)
    end

    def to_unsafe_typequery
      @pointer.not_nil!.as(LibGObject::TypeQuery*)
    end

    def type
      to_unsafe.as(LibGObject::TypeQuery*).value.type
    end

    def type=(value : UInt64)
      to_unsafe.as(LibGObject::TypeQuery*).value.type = UInt64.new(value)
    end

    def type_name
      ::String.new(to_unsafe.as(LibGObject::TypeQuery*).value.type_name)
    end

    def type_name=(value : ::String)
      to_unsafe.as(LibGObject::TypeQuery*).value.type_name = value.to_unsafe
    end

    def class_size
      to_unsafe.as(LibGObject::TypeQuery*).value.class_size
    end

    def class_size=(value : UInt32)
      to_unsafe.as(LibGObject::TypeQuery*).value.class_size = UInt32.new(value)
    end

    def instance_size
      to_unsafe.as(LibGObject::TypeQuery*).value.instance_size
    end

    def instance_size=(value : UInt32)
      to_unsafe.as(LibGObject::TypeQuery*).value.instance_size = UInt32.new(value)
    end
  end

  class TypeValueTable
    include GObject::WrappedType

    def self.new(collect_format : ::String? = nil, lcopy_format : ::String? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(64u64, 0u8).as(LibGObject::TypeValueTable*))
      __var0.collect_format = collect_format unless collect_format.nil?
      __var0.lcopy_format = lcopy_format unless lcopy_format.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::TypeValueTable*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::TypeValueTable*)
    end

    def to_unsafe_typevaluetable
      @pointer.not_nil!.as(LibGObject::TypeValueTable*)
    end

    def value_init
      to_unsafe.as(LibGObject::TypeValueTable*).value.value_init
    end

    def value_free
      to_unsafe.as(LibGObject::TypeValueTable*).value.value_free
    end

    def value_copy
      to_unsafe.as(LibGObject::TypeValueTable*).value.value_copy
    end

    def value_peek_pointer
      to_unsafe.as(LibGObject::TypeValueTable*).value.value_peek_pointer
    end

    def collect_format
      ::String.new(to_unsafe.as(LibGObject::TypeValueTable*).value.collect_format)
    end

    def collect_format=(value : ::String)
      to_unsafe.as(LibGObject::TypeValueTable*).value.collect_format = value.to_unsafe
    end

    def collect_value
      to_unsafe.as(LibGObject::TypeValueTable*).value.collect_value
    end

    def lcopy_format
      ::String.new(to_unsafe.as(LibGObject::TypeValueTable*).value.lcopy_format)
    end

    def lcopy_format=(value : ::String)
      to_unsafe.as(LibGObject::TypeValueTable*).value.lcopy_format = value.to_unsafe
    end

    def lcopy_value
      to_unsafe.as(LibGObject::TypeValueTable*).value.lcopy_value
    end
  end

  class Value
    include GObject::WrappedType

    def self.new(data : ::Enumerable(GObject::G_Value__data__union)? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGObject::Value*))
      __var0.data = data unless data.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::Value*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::Value*)
    end

    def to_unsafe_value
      @pointer.not_nil!.as(LibGObject::Value*)
    end

    def copy(dest_value)
      LibGObject.value_copy(@pointer.as(LibGObject::Value*), dest_value.to_gvalue.to_unsafe)
      nil
    end

    def dup_object
      __var0 = LibGObject.value_dup_object(@pointer.as(LibGObject::Value*))
      GObject.raise_unexpected_null("g_value_dup_object") if __var0.null?
      GObject::Object.new(__var0)
    end

    def dup_string
      __var0 = LibGObject.value_dup_string(@pointer.as(LibGObject::Value*))
      GObject.raise_unexpected_null("g_value_dup_string") if __var0.null?
      ::String.new(__var0)
    end

    def dup_variant
      __var0 = LibGObject.value_dup_variant(@pointer.as(LibGObject::Value*))
      __var1 = GLib::Variant.new(__var0) if __var0
      __var1
    end

    def fits_pointer
      __var0 = LibGObject.value_fits_pointer(@pointer.as(LibGObject::Value*))
      (__var0 == 1)
    end

    def boolean
      __var0 = LibGObject.value_get_boolean(@pointer.as(LibGObject::Value*))
      (__var0 == 1)
    end

    def boxed
      LibGObject.value_get_boxed(@pointer.as(LibGObject::Value*))
      nil
    end

    def char
      __var0 = LibGObject.value_get_char(@pointer.as(LibGObject::Value*))
      __var0
    end

    def double
      __var0 = LibGObject.value_get_double(@pointer.as(LibGObject::Value*))
      __var0
    end

    def enum
      __var0 = LibGObject.value_get_enum(@pointer.as(LibGObject::Value*))
      __var0
    end

    def flags
      __var0 = LibGObject.value_get_flags(@pointer.as(LibGObject::Value*))
      __var0
    end

    def float
      __var0 = LibGObject.value_get_float(@pointer.as(LibGObject::Value*))
      __var0
    end

    def gtype
      __var0 = LibGObject.value_get_gtype(@pointer.as(LibGObject::Value*))
      __var0
    end

    def int
      __var0 = LibGObject.value_get_int(@pointer.as(LibGObject::Value*))
      __var0
    end

    def int64
      __var0 = LibGObject.value_get_int64(@pointer.as(LibGObject::Value*))
      __var0
    end

    def long
      __var0 = LibGObject.value_get_long(@pointer.as(LibGObject::Value*))
      __var0
    end

    def object
      __var0 = LibGObject.value_get_object(@pointer.as(LibGObject::Value*))
      GObject.raise_unexpected_null("g_value_get_object") if __var0.null?
      GObject::Object.new(__var0)
    end

    def param
      __var0 = LibGObject.value_get_param(@pointer.as(LibGObject::Value*))
      GObject.raise_unexpected_null("g_value_get_param") if __var0.null?
      GObject::ParamSpec.new(__var0)
    end

    def pointer
      LibGObject.value_get_pointer(@pointer.as(LibGObject::Value*))
      nil
    end

    def schar
      __var0 = LibGObject.value_get_schar(@pointer.as(LibGObject::Value*))
      __var0
    end

    def string
      __var0 = LibGObject.value_get_string(@pointer.as(LibGObject::Value*))
      GObject.raise_unexpected_null("g_value_get_string") if __var0.null?
      ::String.new(__var0)
    end

    def uchar
      __var0 = LibGObject.value_get_uchar(@pointer.as(LibGObject::Value*))
      __var0
    end

    def uint
      __var0 = LibGObject.value_get_uint(@pointer.as(LibGObject::Value*))
      __var0
    end

    def uint64
      __var0 = LibGObject.value_get_uint64(@pointer.as(LibGObject::Value*))
      __var0
    end

    def ulong
      __var0 = LibGObject.value_get_ulong(@pointer.as(LibGObject::Value*))
      __var0
    end

    def variant
      __var0 = LibGObject.value_get_variant(@pointer.as(LibGObject::Value*))
      __var1 = GLib::Variant.new(__var0) if __var0
      __var1
    end

    def init(g_type : UInt64)
      __var0 = LibGObject.value_init(@pointer.as(LibGObject::Value*), UInt64.new(g_type))
      GObject.raise_unexpected_null("g_value_init") if __var0.null?
      GObject::Value.new(__var0)
    end

    def init_from_instance(instance : GObject::TypeInstance)
      LibGObject.value_init_from_instance(@pointer.as(LibGObject::Value*), instance.to_unsafe.as(LibGObject::TypeInstance*))
      nil
    end

    def peek_pointer
      LibGObject.value_peek_pointer(@pointer.as(LibGObject::Value*))
      nil
    end

    def reset
      __var0 = LibGObject.value_reset(@pointer.as(LibGObject::Value*))
      GObject.raise_unexpected_null("g_value_reset") if __var0.null?
      GObject::Value.new(__var0)
    end

    def boolean=(v_boolean : ::Bool)
      LibGObject.value_set_boolean(@pointer.as(LibGObject::Value*), LibC::Int.new(v_boolean ? 1 : 0))
      nil
    end

    def boxed=(v_boxed : Void*?)
      LibGObject.value_set_boxed(@pointer.as(LibGObject::Value*), v_boxed ? v_boxed : Pointer(Void).null)
      nil
    end

    def boxed_take_ownership=(v_boxed : Void*?)
      LibGObject.value_set_boxed_take_ownership(@pointer.as(LibGObject::Value*), v_boxed ? v_boxed : Pointer(Void).null)
      nil
    end

    def char=(v_char : ::Int)
      LibGObject.value_set_char(@pointer.as(LibGObject::Value*), Int8.new(v_char))
      nil
    end

    def double=(v_double : ::Float)
      LibGObject.value_set_double(@pointer.as(LibGObject::Value*), Float64.new(v_double))
      nil
    end

    def enum=(v_enum : ::Int)
      LibGObject.value_set_enum(@pointer.as(LibGObject::Value*), Int32.new(v_enum))
      nil
    end

    def flags=(v_flags : ::Int)
      LibGObject.value_set_flags(@pointer.as(LibGObject::Value*), UInt32.new(v_flags))
      nil
    end

    def float=(v_float : ::Float)
      LibGObject.value_set_float(@pointer.as(LibGObject::Value*), Float32.new(v_float))
      nil
    end

    def gtype=(v_gtype : UInt64)
      LibGObject.value_set_gtype(@pointer.as(LibGObject::Value*), UInt64.new(v_gtype))
      nil
    end

    def instance=(instance : Void*?)
      LibGObject.value_set_instance(@pointer.as(LibGObject::Value*), instance ? instance : Pointer(Void).null)
      nil
    end

    def int=(v_int : ::Int)
      LibGObject.value_set_int(@pointer.as(LibGObject::Value*), Int32.new(v_int))
      nil
    end

    def int64=(v_int64 : ::Int)
      LibGObject.value_set_int64(@pointer.as(LibGObject::Value*), Int64.new(v_int64))
      nil
    end

    def long=(v_long : ::Int)
      LibGObject.value_set_long(@pointer.as(LibGObject::Value*), Int64.new(v_long))
      nil
    end

    def object=(v_object : GObject::Object?)
      LibGObject.value_set_object(@pointer.as(LibGObject::Value*), v_object ? v_object.to_unsafe_object : Pointer(LibGObject::Object).null)
      nil
    end

    def param=(param : GObject::ParamSpec?)
      LibGObject.value_set_param(@pointer.as(LibGObject::Value*), param ? param.to_unsafe_paramspec : Pointer(LibGObject::ParamSpec).null)
      nil
    end

    def pointer=(v_pointer : Void*?)
      LibGObject.value_set_pointer(@pointer.as(LibGObject::Value*), v_pointer ? v_pointer : Pointer(Void).null)
      nil
    end

    def schar=(v_char : ::Int)
      LibGObject.value_set_schar(@pointer.as(LibGObject::Value*), Int8.new(v_char))
      nil
    end

    def static_boxed=(v_boxed : Void*?)
      LibGObject.value_set_static_boxed(@pointer.as(LibGObject::Value*), v_boxed ? v_boxed : Pointer(Void).null)
      nil
    end

    def static_string=(v_string : ::String?)
      LibGObject.value_set_static_string(@pointer.as(LibGObject::Value*), v_string ? v_string.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def string=(v_string : ::String?)
      LibGObject.value_set_string(@pointer.as(LibGObject::Value*), v_string ? v_string.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def string_take_ownership=(v_string : ::String?)
      LibGObject.value_set_string_take_ownership(@pointer.as(LibGObject::Value*), v_string ? v_string.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def uchar=(v_uchar : ::Int)
      LibGObject.value_set_uchar(@pointer.as(LibGObject::Value*), UInt8.new(v_uchar))
      nil
    end

    def uint=(v_uint : ::Int)
      LibGObject.value_set_uint(@pointer.as(LibGObject::Value*), UInt32.new(v_uint))
      nil
    end

    def uint64=(v_uint64 : ::Int)
      LibGObject.value_set_uint64(@pointer.as(LibGObject::Value*), UInt64.new(v_uint64))
      nil
    end

    def ulong=(v_ulong : ::Int)
      LibGObject.value_set_ulong(@pointer.as(LibGObject::Value*), UInt64.new(v_ulong))
      nil
    end

    def variant=(variant : GLib::Variant?)
      LibGObject.value_set_variant(@pointer.as(LibGObject::Value*), variant ? variant.to_unsafe.as(LibGLib::Variant*) : Pointer(LibGLib::Variant).null)
      nil
    end

    def take_boxed(v_boxed : Void*?)
      LibGObject.value_take_boxed(@pointer.as(LibGObject::Value*), v_boxed ? v_boxed : Pointer(Void).null)
      nil
    end

    def take_string(v_string : ::String?)
      LibGObject.value_take_string(@pointer.as(LibGObject::Value*), v_string ? v_string.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def take_variant(variant : GLib::Variant?)
      LibGObject.value_take_variant(@pointer.as(LibGObject::Value*), variant ? variant.to_unsafe.as(LibGLib::Variant*) : Pointer(LibGLib::Variant).null)
      nil
    end

    def transform(dest_value)
      __var0 = LibGObject.value_transform(@pointer.as(LibGObject::Value*), dest_value.to_gvalue.to_unsafe)
      (__var0 == 1)
    end

    def unset
      LibGObject.value_unset(@pointer.as(LibGObject::Value*))
      nil
    end

    def self.type_compatible(src_type : UInt64, dest_type : UInt64)
      __var0 = LibGObject.value_type_compatible(UInt64.new(src_type), UInt64.new(dest_type))
      (__var0 == 1)
    end

    def self.type_transformable(src_type : UInt64, dest_type : UInt64)
      __var0 = LibGObject.value_type_transformable(UInt64.new(src_type), UInt64.new(dest_type))
      (__var0 == 1)
    end

    def g_type
      to_unsafe.as(LibGObject::Value*).value.g_type
    end

    def data
      GObject::PointerIterator.new(to_unsafe.as(LibGObject::Value*).value.data) { |__var0|
        GObject::G_Value__data__union.new(__var0)
      }
    end

    def data=(value : ::Enumerable(GObject::G_Value__data__union))
      to_unsafe.as(LibGObject::Value*).value.data = (__value_ary = value.map { |__item| __item }.to_a).to_unsafe
    end
  end

  class ValueArray
    include GObject::WrappedType

    def self.new(n_values : UInt32? = nil, values : GObject::Value? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGObject::ValueArray*))
      __var0.n_values = n_values unless n_values.nil?
      __var0.values = values unless values.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::ValueArray*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::ValueArray*)
    end

    def to_unsafe_valuearray
      @pointer.not_nil!.as(LibGObject::ValueArray*)
    end

    def self.new(n_prealloced : ::Int) : self
      __var0 = LibGObject.value_array_new(UInt32.new(n_prealloced))
      GObject.raise_unexpected_null("g_value_array_new") if __var0.null?
      cast(GObject::ValueArray.new(__var0))
    end

    def append(value)
      __var0 = LibGObject.value_array_append(@pointer.as(LibGObject::ValueArray*), value ? value.to_gvalue.to_unsafe : Pointer(LibGObject::Value).null)
      GObject.raise_unexpected_null("g_value_array_append") if __var0.null?
      GObject::ValueArray.new(__var0)
    end

    def copy
      __var0 = LibGObject.value_array_copy(@pointer.as(LibGObject::ValueArray*))
      GObject.raise_unexpected_null("g_value_array_copy") if __var0.null?
      GObject::ValueArray.new(__var0)
    end

    def nth(index_ : ::Int)
      __var0 = LibGObject.value_array_get_nth(@pointer.as(LibGObject::ValueArray*), UInt32.new(index_))
      GObject.raise_unexpected_null("g_value_array_get_nth") if __var0.null?
      GObject::Value.new(__var0)
    end

    def insert(index_ : ::Int, value)
      __var0 = LibGObject.value_array_insert(@pointer.as(LibGObject::ValueArray*), UInt32.new(index_), value ? value.to_gvalue.to_unsafe : Pointer(LibGObject::Value).null)
      GObject.raise_unexpected_null("g_value_array_insert") if __var0.null?
      GObject::ValueArray.new(__var0)
    end

    def prepend(value)
      __var0 = LibGObject.value_array_prepend(@pointer.as(LibGObject::ValueArray*), value ? value.to_gvalue.to_unsafe : Pointer(LibGObject::Value).null)
      GObject.raise_unexpected_null("g_value_array_prepend") if __var0.null?
      GObject::ValueArray.new(__var0)
    end

    def remove(index_ : ::Int)
      __var0 = LibGObject.value_array_remove(@pointer.as(LibGObject::ValueArray*), UInt32.new(index_))
      GObject.raise_unexpected_null("g_value_array_remove") if __var0.null?
      GObject::ValueArray.new(__var0)
    end

    def sort(compare_func : GLib::CompareDataFunc, user_data : Void*?)
      __var0 = LibGObject.value_array_sort(@pointer.as(LibGObject::ValueArray*), compare_func, user_data ? user_data : Pointer(Void).null)
      GObject.raise_unexpected_null("g_value_array_sort_with_data") if __var0.null?
      GObject::ValueArray.new(__var0)
    end

    def n_values
      to_unsafe.as(LibGObject::ValueArray*).value.n_values
    end

    def n_values=(value : UInt32)
      to_unsafe.as(LibGObject::ValueArray*).value.n_values = UInt32.new(value)
    end

    def values
      GObject::Value.new(to_unsafe.as(LibGObject::ValueArray*).value.values)
    end

    def values=(value : GObject::Value)
      to_unsafe.as(LibGObject::ValueArray*).value.values = value.to_gvalue.to_unsafe
    end

    def n_prealloced
      to_unsafe.as(LibGObject::ValueArray*).value.n_prealloced
    end
  end

  alias ValueTransform = LibGObject::ValueTransform
  alias WeakNotify = LibGObject::WeakNotify

  class WeakRef
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGObject::WeakRef*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::WeakRef*)
    end

    def to_unsafe_weakref
      @pointer.not_nil!.as(LibGObject::WeakRef*)
    end
  end

  class G_Value__data__union
    include GObject::WrappedType
    alias Union = G_Value__data__union | Int32 | UInt32 | Int64 | UInt64 | Int64 | UInt64 | Float32 | Float64 | Void*

    def v_int
      to_unsafe.as(LibGObject::G_Value__data__union*).value.v_int
    end

    def v_uint
      to_unsafe.as(LibGObject::G_Value__data__union*).value.v_uint
    end

    def v_long
      to_unsafe.as(LibGObject::G_Value__data__union*).value.v_long
    end

    def v_ulong
      to_unsafe.as(LibGObject::G_Value__data__union*).value.v_ulong
    end

    def v_int64
      to_unsafe.as(LibGObject::G_Value__data__union*).value.v_int64
    end

    def v_uint64
      to_unsafe.as(LibGObject::G_Value__data__union*).value.v_uint64
    end

    def v_float
      to_unsafe.as(LibGObject::G_Value__data__union*).value.v_float
    end

    def v_double
      to_unsafe.as(LibGObject::G_Value__data__union*).value.v_double
    end

    def v_pointer
      to_unsafe.as(LibGObject::G_Value__data__union*).value.v_pointer
    end

    @pointer : Void*

    def initialize(pointer : LibGObject::G_Value__data__union*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGObject::G_Value__data__union*)
    end

    def to_unsafe_g_value__data__union
      @pointer.not_nil!.as(LibGObject::G_Value__data__union*)
    end
  end
end
