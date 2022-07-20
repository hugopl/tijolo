@[Link("gobject-2.0", pkg_config: "gobject-2.0")]
@[Link("glib-2.0", pkg_config: "glib-2.0")]
lib LibGLib
  ###########################################
  # #    Constants
  ###########################################
  ANALYZER_ANALYZING                         =    1                         # : Int32
  ASCII_DTOSTR_BUF_SIZE                      =   39                         # : Int32
  BIG_ENDIAN                                 = 4321                         # : Int32
  CSET_A_2_Z                                 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" # : Pointer(UInt8)
  CSET_DIGITS                                = "0123456789"                 # : Pointer(UInt8)
  CSET_a_2_z                                 = "abcdefghijklmnopqrstuvwxyz" # : Pointer(UInt8)
  DATALIST_FLAGS_MASK                        =  3                           # : Int32
  DATE_BAD_DAY                               =  0                           # : Int32
  DATE_BAD_JULIAN                            =  0                           # : Int32
  DATE_BAD_YEAR                              =  0                           # : Int32
  DIR_SEPARATOR                              = 47                           # : Int32
  DIR_SEPARATOR_S                            = "/"                          # : Pointer(UInt8)
  E                                          = 2.718282                     # : Float64
  GINT16_FORMAT                              = "hi"                         # : Pointer(UInt8)
  GINT16_MODIFIER                            = "h"                          # : Pointer(UInt8)
  GINT32_FORMAT                              = "i"                          # : Pointer(UInt8)
  GINT32_MODIFIER                            = ""                           # : Pointer(UInt8)
  GINT64_FORMAT                              = "li"                         # : Pointer(UInt8)
  GINT64_MODIFIER                            = "l"                          # : Pointer(UInt8)
  GINTPTR_FORMAT                             = "li"                         # : Pointer(UInt8)
  GINTPTR_MODIFIER                           = "l"                          # : Pointer(UInt8)
  GNUC_FUNCTION                              = ""                           # : Pointer(UInt8)
  GNUC_PRETTY_FUNCTION                       = ""                           # : Pointer(UInt8)
  GSIZE_FORMAT                               = "lu"                         # : Pointer(UInt8)
  GSIZE_MODIFIER                             = "l"                          # : Pointer(UInt8)
  GSSIZE_FORMAT                              = "li"                         # : Pointer(UInt8)
  GSSIZE_MODIFIER                            = "l"                          # : Pointer(UInt8)
  GUINT16_FORMAT                             = "hu"                         # : Pointer(UInt8)
  GUINT32_FORMAT                             = "u"                          # : Pointer(UInt8)
  GUINT64_FORMAT                             = "lu"                         # : Pointer(UInt8)
  GUINTPTR_FORMAT                            = "lu"                         # : Pointer(UInt8)
  HAVE_GINT64                                =    1                         # : Int32
  HAVE_GNUC_VARARGS                          =    1                         # : Int32
  HAVE_GNUC_VISIBILITY                       =    1                         # : Int32
  HAVE_GROWING_STACK                         =    0                         # : Int32
  HAVE_ISO_VARARGS                           =    1                         # : Int32
  HOOK_FLAG_USER_SHIFT                       =    4                         # : Int32
  IEEE754_DOUBLE_BIAS                        = 1023                         # : Int32
  IEEE754_FLOAT_BIAS                         =  127                         # : Int32
  KEY_FILE_DESKTOP_GROUP                     = "Desktop Entry"              # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_ACTIONS               = "Actions"                    # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_CATEGORIES            = "Categories"                 # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_COMMENT               = "Comment"                    # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_DBUS_ACTIVATABLE      = "DBusActivatable"            # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_EXEC                  = "Exec"                       # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_GENERIC_NAME          = "GenericName"                # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_HIDDEN                = "Hidden"                     # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_ICON                  = "Icon"                       # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_MIME_TYPE             = "MimeType"                   # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_NAME                  = "Name"                       # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN           = "NotShowIn"                  # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_NO_DISPLAY            = "NoDisplay"                  # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN          = "OnlyShowIn"                 # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_PATH                  = "Path"                       # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY        = "StartupNotify"              # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS      = "StartupWMClass"             # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_TERMINAL              = "Terminal"                   # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_TRY_EXEC              = "TryExec"                    # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_TYPE                  = "Type"                       # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_URL                   = "URL"                        # : Pointer(UInt8)
  KEY_FILE_DESKTOP_KEY_VERSION               = "Version"                    # : Pointer(UInt8)
  KEY_FILE_DESKTOP_TYPE_APPLICATION          = "Application"                # : Pointer(UInt8)
  KEY_FILE_DESKTOP_TYPE_DIRECTORY            = "Directory"                  # : Pointer(UInt8)
  KEY_FILE_DESKTOP_TYPE_LINK                 = "Link"                       # : Pointer(UInt8)
  LITTLE_ENDIAN                              =                    1234      # : Int32
  LN10                                       =                2.302585      # : Float64
  LN2                                        =                0.693147      # : Float64
  LOG_2_BASE_10                              =                 0.30103      # : Float64
  LOG_DOMAIN                                 =                     0i8      # : Int8
  LOG_FATAL_MASK                             =                       5      # : Int32
  LOG_LEVEL_USER_SHIFT                       =                       8      # : Int32
  MAJOR_VERSION                              =                       2      # : Int32
  MAXINT16                                   =                32767i16      # : Int16
  MAXINT32                                   =              2147483647      # : Int32
  MAXINT64                                   =  9223372036854775807i64      # : Int64
  MAXINT8                                    =                   127i8      # : Int8
  MAXUINT16                                  =                65535u16      # : UInt16
  MAXUINT32                                  =              4294967295      # : UInt32
  MAXUINT64                                  = 18446744073709551615u64      # : UInt64
  MAXUINT8                                   =                   255u8      # : UInt8
  MICRO_VERSION                              =                       2      # : Int32
  MININT16                                   =               -32768i16      # : Int16
  MININT32                                   =             -2147483648      # : Int32
  MININT64                                   = -9223372036854775808i64      # : Int64
  MININT8                                    =                  -128i8      # : Int8
  MINOR_VERSION                              =                      64      # : Int32
  MODULE_SUFFIX                              = "so"                         # : Pointer(UInt8)
  OPTION_REMAINING                           = ""                           # : Pointer(UInt8)
  PDP_ENDIAN                                 =     3412                     # : Int32
  PI                                         = 3.141593                     # : Float64
  PID_FORMAT                                 = "i"                          # : Pointer(UInt8)
  PI_2                                       = 1.570796                     # : Float64
  PI_4                                       = 0.785398                     # : Float64
  POLLFD_FORMAT                              = "%d"                         # : Pointer(UInt8)
  PRIORITY_DEFAULT                           =    0                         # : Int32
  PRIORITY_DEFAULT_IDLE                      =  200                         # : Int32
  PRIORITY_HIGH                              = -100                         # : Int32
  PRIORITY_HIGH_IDLE                         =  100                         # : Int32
  PRIORITY_LOW                               =  300                         # : Int32
  SEARCHPATH_SEPARATOR                       =   58                         # : Int32
  SEARCHPATH_SEPARATOR_S                     = ":"                          # : Pointer(UInt8)
  SIZEOF_LONG                                =        8                     # : Int32
  SIZEOF_SIZE_T                              =        8                     # : Int32
  SIZEOF_SSIZE_T                             =        8                     # : Int32
  SIZEOF_VOID_P                              =        8                     # : Int32
  SOURCE_CONTINUE                            =        1                     # : LibC::Int
  SOURCE_REMOVE                              =        0                     # : LibC::Int
  SQRT2                                      = 1.414214                     # : Float64
  STR_DELIMITERS                             = "_-|> <."                    # : Pointer(UInt8)
  SYSDEF_AF_INET                             =  2                           # : Int32
  SYSDEF_AF_INET6                            = 10                           # : Int32
  SYSDEF_AF_UNIX                             =  1                           # : Int32
  SYSDEF_MSG_DONTROUTE                       =  4                           # : Int32
  SYSDEF_MSG_OOB                             =  1                           # : Int32
  SYSDEF_MSG_PEEK                            =  2                           # : Int32
  TEST_OPTION_ISOLATE_DIRS                   = "isolate_dirs"               # : Pointer(UInt8)
  TIME_SPAN_DAY                              = 86400000000i64               # : Int64
  TIME_SPAN_HOUR                             =  3600000000i64               # : Int64
  TIME_SPAN_MILLISECOND                      =        1000i64               # : Int64
  TIME_SPAN_MINUTE                           =    60000000i64               # : Int64
  TIME_SPAN_SECOND                           =     1000000i64               # : Int64
  UNICHAR_MAX_DECOMPOSITION_LENGTH           =             18               # : Int32
  URI_RESERVED_CHARS_GENERIC_DELIMITERS      = ":/?#[]@"                    # : Pointer(UInt8)
  URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = "!$&'()*+,;="                # : Pointer(UInt8)
  USEC_PER_SEC                               =  1000000                     # : Int32
  VA_COPY_AS_ARRAY                           =        1                     # : Int32
  VERSION_MIN_REQUIRED                       =        2                     # : Int32
  WIN32_MSG_HANDLE                           = 19981206                     # : Int32

  ###########################################
  # #    Structs
  ###########################################

  struct Array # struct
    data : Pointer(UInt8)
    len : UInt32
  end

  fun _g_array_get_type = g_array_get_type : UInt64

  struct AsyncQueue # struct
    _data : UInt8[0]
  end

  fun async_queue_length = g_async_queue_length(this : AsyncQueue*) : Int32
  fun async_queue_length_unlocked = g_async_queue_length_unlocked(this : AsyncQueue*) : Int32
  fun async_queue_lock = g_async_queue_lock(this : AsyncQueue*) : Void
  fun async_queue_pop = g_async_queue_pop(this : AsyncQueue*) : Pointer(Void)
  fun async_queue_pop_unlocked = g_async_queue_pop_unlocked(this : AsyncQueue*) : Pointer(Void)
  fun async_queue_push = g_async_queue_push(this : AsyncQueue*, data : Pointer(Void)) : Void
  fun async_queue_push_front = g_async_queue_push_front(this : AsyncQueue*, item : Pointer(Void)) : Void
  fun async_queue_push_front_unlocked = g_async_queue_push_front_unlocked(this : AsyncQueue*, item : Pointer(Void)) : Void
  fun async_queue_push_unlocked = g_async_queue_push_unlocked(this : AsyncQueue*, data : Pointer(Void)) : Void
  fun async_queue_ref_unlocked = g_async_queue_ref_unlocked(this : AsyncQueue*) : Void
  fun async_queue_remove = g_async_queue_remove(this : AsyncQueue*, item : Pointer(Void)) : LibC::Int
  fun async_queue_remove_unlocked = g_async_queue_remove_unlocked(this : AsyncQueue*, item : Pointer(Void)) : LibC::Int
  fun async_queue_timed_pop = g_async_queue_timed_pop(this : AsyncQueue*, end_time : Pointer(LibGLib::TimeVal)) : Pointer(Void)
  fun async_queue_timed_pop_unlocked = g_async_queue_timed_pop_unlocked(this : AsyncQueue*, end_time : Pointer(LibGLib::TimeVal)) : Pointer(Void)
  fun async_queue_timeout_pop = g_async_queue_timeout_pop(this : AsyncQueue*, timeout : UInt64) : Pointer(Void)
  fun async_queue_timeout_pop_unlocked = g_async_queue_timeout_pop_unlocked(this : AsyncQueue*, timeout : UInt64) : Pointer(Void)
  fun async_queue_try_pop = g_async_queue_try_pop(this : AsyncQueue*) : Pointer(Void)
  fun async_queue_try_pop_unlocked = g_async_queue_try_pop_unlocked(this : AsyncQueue*) : Pointer(Void)
  fun async_queue_unlock = g_async_queue_unlock(this : AsyncQueue*) : Void
  fun async_queue_unref = g_async_queue_unref(this : AsyncQueue*) : Void
  fun async_queue_unref_and_unlock = g_async_queue_unref_and_unlock(this : AsyncQueue*) : Void

  struct BookmarkFile # struct
    _data : UInt8[0]
  end

  fun bookmark_file_add_application = g_bookmark_file_add_application(this : BookmarkFile*, uri : Pointer(UInt8), name : Pointer(UInt8), exec : Pointer(UInt8)) : Void
  fun bookmark_file_add_group = g_bookmark_file_add_group(this : BookmarkFile*, uri : Pointer(UInt8), group : Pointer(UInt8)) : Void
  fun bookmark_file_free = g_bookmark_file_free(this : BookmarkFile*) : Void
  fun bookmark_file_get_added = g_bookmark_file_get_added(this : BookmarkFile*, uri : Pointer(UInt8), error : LibGLib::Error**) : Int64
  fun bookmark_file_get_app_info = g_bookmark_file_get_app_info(this : BookmarkFile*, uri : Pointer(UInt8), name : Pointer(UInt8), exec : Pointer(UInt8)*, count : UInt32*, stamp : Int64*, error : LibGLib::Error**) : LibC::Int
  fun bookmark_file_get_applications = g_bookmark_file_get_applications(this : BookmarkFile*, uri : Pointer(UInt8), length : UInt64*, error : LibGLib::Error**) : Pointer(Pointer(UInt8))
  fun bookmark_file_get_description = g_bookmark_file_get_description(this : BookmarkFile*, uri : Pointer(UInt8), error : LibGLib::Error**) : Pointer(UInt8)
  fun bookmark_file_get_groups = g_bookmark_file_get_groups(this : BookmarkFile*, uri : Pointer(UInt8), length : UInt64*, error : LibGLib::Error**) : Pointer(Pointer(UInt8))
  fun bookmark_file_get_icon = g_bookmark_file_get_icon(this : BookmarkFile*, uri : Pointer(UInt8), href : Pointer(UInt8)*, mime_type : Pointer(UInt8)*, error : LibGLib::Error**) : LibC::Int
  fun bookmark_file_get_is_private = g_bookmark_file_get_is_private(this : BookmarkFile*, uri : Pointer(UInt8), error : LibGLib::Error**) : LibC::Int
  fun bookmark_file_get_mime_type = g_bookmark_file_get_mime_type(this : BookmarkFile*, uri : Pointer(UInt8), error : LibGLib::Error**) : Pointer(UInt8)
  fun bookmark_file_get_modified = g_bookmark_file_get_modified(this : BookmarkFile*, uri : Pointer(UInt8), error : LibGLib::Error**) : Int64
  fun bookmark_file_get_size = g_bookmark_file_get_size(this : BookmarkFile*) : Int32
  fun bookmark_file_get_title = g_bookmark_file_get_title(this : BookmarkFile*, uri : Pointer(UInt8), error : LibGLib::Error**) : Pointer(UInt8)
  fun bookmark_file_get_uris = g_bookmark_file_get_uris(this : BookmarkFile*, length : UInt64*) : Pointer(Pointer(UInt8))
  fun bookmark_file_get_visited = g_bookmark_file_get_visited(this : BookmarkFile*, uri : Pointer(UInt8), error : LibGLib::Error**) : Int64
  fun bookmark_file_has_application = g_bookmark_file_has_application(this : BookmarkFile*, uri : Pointer(UInt8), name : Pointer(UInt8), error : LibGLib::Error**) : LibC::Int
  fun bookmark_file_has_group = g_bookmark_file_has_group(this : BookmarkFile*, uri : Pointer(UInt8), group : Pointer(UInt8), error : LibGLib::Error**) : LibC::Int
  fun bookmark_file_has_item = g_bookmark_file_has_item(this : BookmarkFile*, uri : Pointer(UInt8)) : LibC::Int
  fun bookmark_file_load_from_data = g_bookmark_file_load_from_data(this : BookmarkFile*, data : Pointer(UInt8), length : UInt64, error : LibGLib::Error**) : LibC::Int
  fun bookmark_file_load_from_data_dirs = g_bookmark_file_load_from_data_dirs(this : BookmarkFile*, file : Pointer(UInt8), full_path : Pointer(UInt8)*, error : LibGLib::Error**) : LibC::Int
  fun bookmark_file_load_from_file = g_bookmark_file_load_from_file(this : BookmarkFile*, filename : Pointer(UInt8), error : LibGLib::Error**) : LibC::Int
  fun bookmark_file_move_item = g_bookmark_file_move_item(this : BookmarkFile*, old_uri : Pointer(UInt8), new_uri : Pointer(UInt8), error : LibGLib::Error**) : LibC::Int
  fun bookmark_file_remove_application = g_bookmark_file_remove_application(this : BookmarkFile*, uri : Pointer(UInt8), name : Pointer(UInt8), error : LibGLib::Error**) : LibC::Int
  fun bookmark_file_remove_group = g_bookmark_file_remove_group(this : BookmarkFile*, uri : Pointer(UInt8), group : Pointer(UInt8), error : LibGLib::Error**) : LibC::Int
  fun bookmark_file_remove_item = g_bookmark_file_remove_item(this : BookmarkFile*, uri : Pointer(UInt8), error : LibGLib::Error**) : LibC::Int
  fun bookmark_file_set_added = g_bookmark_file_set_added(this : BookmarkFile*, uri : Pointer(UInt8), added : Int64) : Void
  fun bookmark_file_set_app_info = g_bookmark_file_set_app_info(this : BookmarkFile*, uri : Pointer(UInt8), name : Pointer(UInt8), exec : Pointer(UInt8), count : Int32, stamp : Int64, error : LibGLib::Error**) : LibC::Int
  fun bookmark_file_set_description = g_bookmark_file_set_description(this : BookmarkFile*, uri : Pointer(UInt8), description : Pointer(UInt8)) : Void
  fun bookmark_file_set_groups = g_bookmark_file_set_groups(this : BookmarkFile*, uri : Pointer(UInt8), groups : Pointer(Pointer(UInt8)), length : UInt64) : Void
  fun bookmark_file_set_icon = g_bookmark_file_set_icon(this : BookmarkFile*, uri : Pointer(UInt8), href : Pointer(UInt8), mime_type : Pointer(UInt8)) : Void
  fun bookmark_file_set_is_private = g_bookmark_file_set_is_private(this : BookmarkFile*, uri : Pointer(UInt8), is_private : LibC::Int) : Void
  fun bookmark_file_set_mime_type = g_bookmark_file_set_mime_type(this : BookmarkFile*, uri : Pointer(UInt8), mime_type : Pointer(UInt8)) : Void
  fun bookmark_file_set_modified = g_bookmark_file_set_modified(this : BookmarkFile*, uri : Pointer(UInt8), modified : Int64) : Void
  fun bookmark_file_set_title = g_bookmark_file_set_title(this : BookmarkFile*, uri : Pointer(UInt8), title : Pointer(UInt8)) : Void
  fun bookmark_file_set_visited = g_bookmark_file_set_visited(this : BookmarkFile*, uri : Pointer(UInt8), visited : Int64) : Void
  fun bookmark_file_to_data = g_bookmark_file_to_data(this : BookmarkFile*, length : UInt64*, error : LibGLib::Error**) : Pointer(UInt8)
  fun bookmark_file_to_file = g_bookmark_file_to_file(this : BookmarkFile*, filename : Pointer(UInt8), error : LibGLib::Error**) : LibC::Int
  fun bookmark_file_error_quark = g_bookmark_file_error_quark : UInt32

  struct ByteArray # struct
    data : Pointer(UInt8)
    len : UInt32
  end

  fun _g_byte_array_get_type = g_byte_array_get_type : UInt64
  fun byte_array_free = g_byte_array_free(array : Pointer(Void), free_segment : LibC::Int) : Pointer(UInt8)
  fun byte_array_free_to_bytes = g_byte_array_free_to_bytes(array : Pointer(Void)) : Pointer(LibGLib::Bytes)
  fun byte_array_new = g_byte_array_new : Pointer(Void)
  fun byte_array_new_take = g_byte_array_new_take(data : Pointer(UInt8), len : UInt64) : Pointer(Void)
  fun byte_array_steal = g_byte_array_steal(array : Pointer(Void), len : UInt64*) : Pointer(UInt8)
  fun byte_array_unref = g_byte_array_unref(array : Pointer(Void)) : Void

  struct Bytes # struct
    _data : UInt8[0]
  end

  fun _g_bytes_get_type = g_bytes_get_type : UInt64
  fun bytes_new = g_bytes_new(data : Pointer(UInt8), size : UInt64) : Pointer(LibGLib::Bytes)
  fun bytes_new_take = g_bytes_new_take(data : Pointer(UInt8), size : UInt64) : Pointer(LibGLib::Bytes)
  fun bytes_compare = g_bytes_compare(this : Bytes*, bytes2 : Pointer(LibGLib::Bytes)) : Int32
  fun bytes_equal = g_bytes_equal(this : Bytes*, bytes2 : Pointer(LibGLib::Bytes)) : LibC::Int
  fun bytes_get_data = g_bytes_get_data(this : Bytes*, size : UInt64*) : Pointer(UInt8)
  fun bytes_get_size = g_bytes_get_size(this : Bytes*) : UInt64
  fun bytes_hash = g_bytes_hash(this : Bytes*) : UInt32
  fun bytes_new_from_bytes = g_bytes_new_from_bytes(this : Bytes*, offset : UInt64, length : UInt64) : Pointer(LibGLib::Bytes)
  fun bytes_ref = g_bytes_ref(this : Bytes*) : Pointer(LibGLib::Bytes)
  fun bytes_unref = g_bytes_unref(this : Bytes*) : Void
  fun bytes_unref_to_array = g_bytes_unref_to_array(this : Bytes*) : Pointer(Void)
  fun bytes_unref_to_data = g_bytes_unref_to_data(this : Bytes*, size : UInt64*) : Pointer(UInt8)

  struct Checksum # struct
    _data : UInt8[0]
  end

  fun _g_checksum_get_type = g_checksum_get_type : UInt64
  fun checksum_new = g_checksum_new(checksum_type : LibGLib::ChecksumType) : Pointer(LibGLib::Checksum)
  fun checksum_copy = g_checksum_copy(this : Checksum*) : Pointer(LibGLib::Checksum)
  fun checksum_free = g_checksum_free(this : Checksum*) : Void
  fun checksum_get_string = g_checksum_get_string(this : Checksum*) : Pointer(UInt8)
  fun checksum_reset = g_checksum_reset(this : Checksum*) : Void
  fun checksum_update = g_checksum_update(this : Checksum*, data : Pointer(UInt8), length : Int64) : Void
  fun checksum_type_get_length = g_checksum_type_get_length(checksum_type : LibGLib::ChecksumType) : Int64

  struct Cond # struct
    p : Pointer(Void)
    i : UInt32[2]
  end

  fun cond_broadcast = g_cond_broadcast(this : Cond*) : Void
  fun cond_clear = g_cond_clear(this : Cond*) : Void
  fun cond_init = g_cond_init(this : Cond*) : Void
  fun cond_signal = g_cond_signal(this : Cond*) : Void
  fun cond_wait = g_cond_wait(this : Cond*, mutex : Pointer(LibGLib::Mutex)) : Void
  fun cond_wait_until = g_cond_wait_until(this : Cond*, mutex : Pointer(LibGLib::Mutex), end_time : Int64) : LibC::Int

  struct Data # struct
    _data : UInt8[0]
  end

  struct Date # struct
    julian_days : UInt32
    julian : UInt32
    dmy : UInt32
    day : UInt32
    month : UInt32
    year : UInt32
  end

  fun _g_date_get_type = g_date_get_type : UInt64
  fun date_new = g_date_new : Pointer(LibGLib::Date)
  fun date_new_dmy = g_date_new_dmy(day : UInt8, month : LibGLib::DateMonth, year : UInt16) : Pointer(LibGLib::Date)
  fun date_new_julian = g_date_new_julian(julian_day : UInt32) : Pointer(LibGLib::Date)
  fun date_add_days = g_date_add_days(this : Date*, n_days : UInt32) : Void
  fun date_add_months = g_date_add_months(this : Date*, n_months : UInt32) : Void
  fun date_add_years = g_date_add_years(this : Date*, n_years : UInt32) : Void
  fun date_clamp = g_date_clamp(this : Date*, min_date : Pointer(LibGLib::Date), max_date : Pointer(LibGLib::Date)) : Void
  fun date_clear = g_date_clear(this : Date*, n_dates : UInt32) : Void
  fun date_compare = g_date_compare(this : Date*, rhs : Pointer(LibGLib::Date)) : Int32
  fun date_copy = g_date_copy(this : Date*) : Pointer(LibGLib::Date)
  fun date_days_between = g_date_days_between(this : Date*, date2 : Pointer(LibGLib::Date)) : Int32
  fun date_free = g_date_free(this : Date*) : Void
  fun date_get_day = g_date_get_day(this : Date*) : UInt8
  fun date_get_day_of_year = g_date_get_day_of_year(this : Date*) : UInt32
  fun date_get_iso8601_week_of_year = g_date_get_iso8601_week_of_year(this : Date*) : UInt32
  fun date_get_julian = g_date_get_julian(this : Date*) : UInt32
  fun date_get_monday_week_of_year = g_date_get_monday_week_of_year(this : Date*) : UInt32
  fun date_get_month = g_date_get_month(this : Date*) : LibGLib::DateMonth
  fun date_get_sunday_week_of_year = g_date_get_sunday_week_of_year(this : Date*) : UInt32
  fun date_get_weekday = g_date_get_weekday(this : Date*) : LibGLib::DateWeekday
  fun date_get_year = g_date_get_year(this : Date*) : UInt16
  fun date_is_first_of_month = g_date_is_first_of_month(this : Date*) : LibC::Int
  fun date_is_last_of_month = g_date_is_last_of_month(this : Date*) : LibC::Int
  fun date_order = g_date_order(this : Date*, date2 : Pointer(LibGLib::Date)) : Void
  fun date_set_day = g_date_set_day(this : Date*, day : UInt8) : Void
  fun date_set_dmy = g_date_set_dmy(this : Date*, day : UInt8, month : LibGLib::DateMonth, y : UInt16) : Void
  fun date_set_julian = g_date_set_julian(this : Date*, julian_date : UInt32) : Void
  fun date_set_month = g_date_set_month(this : Date*, month : LibGLib::DateMonth) : Void
  fun date_set_parse = g_date_set_parse(this : Date*, str : Pointer(UInt8)) : Void
  fun date_set_time = g_date_set_time(this : Date*, time_ : Int32) : Void
  fun date_set_time_t = g_date_set_time_t(this : Date*, timet : Int64) : Void
  fun date_set_time_val = g_date_set_time_val(this : Date*, timeval : Pointer(LibGLib::TimeVal)) : Void
  fun date_set_year = g_date_set_year(this : Date*, year : UInt16) : Void
  fun date_subtract_days = g_date_subtract_days(this : Date*, n_days : UInt32) : Void
  fun date_subtract_months = g_date_subtract_months(this : Date*, n_months : UInt32) : Void
  fun date_subtract_years = g_date_subtract_years(this : Date*, n_years : UInt32) : Void
  fun date_to_struct_tm = g_date_to_struct_tm(this : Date*, tm : Pointer(Void)) : Void
  fun date_valid = g_date_valid(this : Date*) : LibC::Int
  fun date_get_days_in_month = g_date_get_days_in_month(month : LibGLib::DateMonth, year : UInt16) : UInt8
  fun date_get_monday_weeks_in_year = g_date_get_monday_weeks_in_year(year : UInt16) : UInt8
  fun date_get_sunday_weeks_in_year = g_date_get_sunday_weeks_in_year(year : UInt16) : UInt8
  fun date_is_leap_year = g_date_is_leap_year(year : UInt16) : LibC::Int
  fun date_strftime = g_date_strftime(s : Pointer(UInt8), slen : UInt64, format : Pointer(UInt8), date : Pointer(LibGLib::Date)) : UInt64
  fun date_valid_day = g_date_valid_day(day : UInt8) : LibC::Int
  fun date_valid_dmy = g_date_valid_dmy(day : UInt8, month : LibGLib::DateMonth, year : UInt16) : LibC::Int
  fun date_valid_julian = g_date_valid_julian(julian_date : UInt32) : LibC::Int
  fun date_valid_month = g_date_valid_month(month : LibGLib::DateMonth) : LibC::Int
  fun date_valid_weekday = g_date_valid_weekday(weekday : LibGLib::DateWeekday) : LibC::Int
  fun date_valid_year = g_date_valid_year(year : UInt16) : LibC::Int

  struct DateTime # struct
    _data : UInt8[0]
  end

  fun _g_date_time_get_type = g_date_time_get_type : UInt64
  fun date_time_new = g_date_time_new(tz : Pointer(LibGLib::TimeZone), year : Int32, month : Int32, day : Int32, hour : Int32, minute : Int32, seconds : Float64) : Pointer(LibGLib::DateTime)
  fun date_time_new_from_iso8601 = g_date_time_new_from_iso8601(text : Pointer(UInt8), default_tz : Pointer(LibGLib::TimeZone)) : Pointer(LibGLib::DateTime)
  fun date_time_new_from_timeval_local = g_date_time_new_from_timeval_local(tv : Pointer(LibGLib::TimeVal)) : Pointer(LibGLib::DateTime)
  fun date_time_new_from_timeval_utc = g_date_time_new_from_timeval_utc(tv : Pointer(LibGLib::TimeVal)) : Pointer(LibGLib::DateTime)
  fun date_time_new_from_unix_local = g_date_time_new_from_unix_local(t : Int64) : Pointer(LibGLib::DateTime)
  fun date_time_new_from_unix_utc = g_date_time_new_from_unix_utc(t : Int64) : Pointer(LibGLib::DateTime)
  fun date_time_new_local = g_date_time_new_local(year : Int32, month : Int32, day : Int32, hour : Int32, minute : Int32, seconds : Float64) : Pointer(LibGLib::DateTime)
  fun date_time_new_now = g_date_time_new_now(tz : Pointer(LibGLib::TimeZone)) : Pointer(LibGLib::DateTime)
  fun date_time_new_now_local = g_date_time_new_now_local : Pointer(LibGLib::DateTime)
  fun date_time_new_now_utc = g_date_time_new_now_utc : Pointer(LibGLib::DateTime)
  fun date_time_new_utc = g_date_time_new_utc(year : Int32, month : Int32, day : Int32, hour : Int32, minute : Int32, seconds : Float64) : Pointer(LibGLib::DateTime)
  fun date_time_add = g_date_time_add(this : DateTime*, timespan : Int64) : Pointer(LibGLib::DateTime)
  fun date_time_add_days = g_date_time_add_days(this : DateTime*, days : Int32) : Pointer(LibGLib::DateTime)
  fun date_time_add_full = g_date_time_add_full(this : DateTime*, years : Int32, months : Int32, days : Int32, hours : Int32, minutes : Int32, seconds : Float64) : Pointer(LibGLib::DateTime)
  fun date_time_add_hours = g_date_time_add_hours(this : DateTime*, hours : Int32) : Pointer(LibGLib::DateTime)
  fun date_time_add_minutes = g_date_time_add_minutes(this : DateTime*, minutes : Int32) : Pointer(LibGLib::DateTime)
  fun date_time_add_months = g_date_time_add_months(this : DateTime*, months : Int32) : Pointer(LibGLib::DateTime)
  fun date_time_add_seconds = g_date_time_add_seconds(this : DateTime*, seconds : Float64) : Pointer(LibGLib::DateTime)
  fun date_time_add_weeks = g_date_time_add_weeks(this : DateTime*, weeks : Int32) : Pointer(LibGLib::DateTime)
  fun date_time_add_years = g_date_time_add_years(this : DateTime*, years : Int32) : Pointer(LibGLib::DateTime)
  fun date_time_difference = g_date_time_difference(this : DateTime*, _begin : Pointer(LibGLib::DateTime)) : Int64
  fun date_time_format = g_date_time_format(this : DateTime*, format : Pointer(UInt8)) : Pointer(UInt8)
  fun date_time_format_iso8601 = g_date_time_format_iso8601(this : DateTime*) : Pointer(UInt8)
  fun date_time_get_day_of_month = g_date_time_get_day_of_month(this : DateTime*) : Int32
  fun date_time_get_day_of_week = g_date_time_get_day_of_week(this : DateTime*) : Int32
  fun date_time_get_day_of_year = g_date_time_get_day_of_year(this : DateTime*) : Int32
  fun date_time_get_hour = g_date_time_get_hour(this : DateTime*) : Int32
  fun date_time_get_microsecond = g_date_time_get_microsecond(this : DateTime*) : Int32
  fun date_time_get_minute = g_date_time_get_minute(this : DateTime*) : Int32
  fun date_time_get_month = g_date_time_get_month(this : DateTime*) : Int32
  fun date_time_get_second = g_date_time_get_second(this : DateTime*) : Int32
  fun date_time_get_seconds = g_date_time_get_seconds(this : DateTime*) : Float64
  fun date_time_get_timezone = g_date_time_get_timezone(this : DateTime*) : Pointer(LibGLib::TimeZone)
  fun date_time_get_timezone_abbreviation = g_date_time_get_timezone_abbreviation(this : DateTime*) : Pointer(UInt8)
  fun date_time_get_utc_offset = g_date_time_get_utc_offset(this : DateTime*) : Int64
  fun date_time_get_week_numbering_year = g_date_time_get_week_numbering_year(this : DateTime*) : Int32
  fun date_time_get_week_of_year = g_date_time_get_week_of_year(this : DateTime*) : Int32
  fun date_time_get_year = g_date_time_get_year(this : DateTime*) : Int32
  fun date_time_get_ymd = g_date_time_get_ymd(this : DateTime*, year : Int32*, month : Int32*, day : Int32*) : Void
  fun date_time_is_daylight_savings = g_date_time_is_daylight_savings(this : DateTime*) : LibC::Int
  fun date_time_ref = g_date_time_ref(this : DateTime*) : Pointer(LibGLib::DateTime)
  fun date_time_to_local = g_date_time_to_local(this : DateTime*) : Pointer(LibGLib::DateTime)
  fun date_time_to_timeval = g_date_time_to_timeval(this : DateTime*, tv : Pointer(LibGLib::TimeVal)) : LibC::Int
  fun date_time_to_timezone = g_date_time_to_timezone(this : DateTime*, tz : Pointer(LibGLib::TimeZone)) : Pointer(LibGLib::DateTime)
  fun date_time_to_unix = g_date_time_to_unix(this : DateTime*) : Int64
  fun date_time_to_utc = g_date_time_to_utc(this : DateTime*) : Pointer(LibGLib::DateTime)
  fun date_time_unref = g_date_time_unref(this : DateTime*) : Void
  fun date_time_compare = g_date_time_compare(dt1 : Pointer(Void), dt2 : Pointer(Void)) : Int32
  fun date_time_equal = g_date_time_equal(dt1 : Pointer(Void), dt2 : Pointer(Void)) : LibC::Int
  fun date_time_hash = g_date_time_hash(datetime : Pointer(Void)) : UInt32

  struct DebugKey # struct
    key : Pointer(UInt8)
    value : UInt32
  end

  struct Dir # struct
    _data : UInt8[0]
  end

  fun dir_close = g_dir_close(this : Dir*) : Void
  fun dir_read_name = g_dir_read_name(this : Dir*) : Pointer(UInt8)
  fun dir_rewind = g_dir_rewind(this : Dir*) : Void
  fun dir_make_tmp = g_dir_make_tmp(tmpl : Pointer(UInt8), error : LibGLib::Error**) : Pointer(UInt8)

  struct Error # struct
    domain : UInt32
    code : Int32
    message : Pointer(UInt8)
  end

  fun _g_error_get_type = g_error_get_type : UInt64
  fun error_new_literal = g_error_new_literal(domain : UInt32, code : Int32, message : Pointer(UInt8)) : Pointer(LibGLib::Error*)
  fun error_copy = g_error_copy(this : Error*) : Pointer(LibGLib::Error*)
  fun error_free = g_error_free(this : Error*) : Void
  fun error_matches = g_error_matches(this : Error*, domain : UInt32, code : Int32) : LibC::Int

  struct HashTable # struct
    _data : UInt8[0]
  end

  fun _g_hash_table_get_type = g_hash_table_get_type : UInt64
  fun hash_table_add = g_hash_table_add(hash_table : Pointer(Void*), key : Pointer(Void)) : LibC::Int
  fun hash_table_contains = g_hash_table_contains(hash_table : Pointer(Void*), key : Pointer(Void)) : LibC::Int
  fun hash_table_destroy = g_hash_table_destroy(hash_table : Pointer(Void*)) : Void
  fun hash_table_insert = g_hash_table_insert(hash_table : Pointer(Void*), key : Pointer(Void), value : Pointer(Void)) : LibC::Int
  fun hash_table_lookup = g_hash_table_lookup(hash_table : Pointer(Void*), key : Pointer(Void)) : Pointer(Void)
  fun hash_table_lookup_extended = g_hash_table_lookup_extended(hash_table : Pointer(Void*), lookup_key : Pointer(Void), orig_key : Pointer(Void)*, value : Pointer(Void)*) : LibC::Int
  fun hash_table_remove = g_hash_table_remove(hash_table : Pointer(Void*), key : Pointer(Void)) : LibC::Int
  fun hash_table_remove_all = g_hash_table_remove_all(hash_table : Pointer(Void*)) : Void
  fun hash_table_replace = g_hash_table_replace(hash_table : Pointer(Void*), key : Pointer(Void), value : Pointer(Void)) : LibC::Int
  fun hash_table_size = g_hash_table_size(hash_table : Pointer(Void*)) : UInt32
  fun hash_table_steal = g_hash_table_steal(hash_table : Pointer(Void*), key : Pointer(Void)) : LibC::Int
  fun hash_table_steal_all = g_hash_table_steal_all(hash_table : Pointer(Void*)) : Void
  fun hash_table_steal_extended = g_hash_table_steal_extended(hash_table : Pointer(Void*), lookup_key : Pointer(Void), stolen_key : Pointer(Void)*, stolen_value : Pointer(Void)*) : LibC::Int
  fun hash_table_unref = g_hash_table_unref(hash_table : Pointer(Void*)) : Void

  struct HashTableIter # struct
    dummy1 : Pointer(Void)
    dummy2 : Pointer(Void)
    dummy3 : Pointer(Void)
    dummy4 : Int32
    dummy5 : LibC::Int
    dummy6 : Pointer(Void)
  end

  fun hash_table_iter_init = g_hash_table_iter_init(this : HashTableIter*, hash_table : Pointer(Void*)) : Void
  fun hash_table_iter_next = g_hash_table_iter_next(this : HashTableIter*, key : Pointer(Void)*, value : Pointer(Void)*) : LibC::Int
  fun hash_table_iter_remove = g_hash_table_iter_remove(this : HashTableIter*) : Void
  fun hash_table_iter_replace = g_hash_table_iter_replace(this : HashTableIter*, value : Pointer(Void)) : Void
  fun hash_table_iter_steal = g_hash_table_iter_steal(this : HashTableIter*) : Void

  struct Hmac # struct
    _data : UInt8[0]
  end

  fun hmac_get_digest = g_hmac_get_digest(this : Hmac*, buffer : Pointer(UInt8), digest_len : UInt64*) : Void
  fun hmac_get_string = g_hmac_get_string(this : Hmac*) : Pointer(UInt8)
  fun hmac_unref = g_hmac_unref(this : Hmac*) : Void
  fun hmac_update = g_hmac_update(this : Hmac*, data : Pointer(UInt8), length : Int64) : Void

  struct Hook # struct
    data : Pointer(Void)
    _next : Pointer(LibGLib::Hook)
    prev : Pointer(LibGLib::Hook)
    ref_count : UInt32
    hook_id : UInt64
    flags : UInt32
    func : Pointer(Void)
    destroy : LibGLib::DestroyNotify
  end

  fun hook_compare_ids = g_hook_compare_ids(this : Hook*, sibling : Pointer(LibGLib::Hook)) : Int32
  fun hook_destroy = g_hook_destroy(hook_list : Pointer(LibGLib::HookList), hook_id : UInt64) : LibC::Int
  fun hook_destroy_link = g_hook_destroy_link(hook_list : Pointer(LibGLib::HookList), hook : Pointer(LibGLib::Hook)) : Void
  fun hook_free = g_hook_free(hook_list : Pointer(LibGLib::HookList), hook : Pointer(LibGLib::Hook)) : Void
  fun hook_insert_before = g_hook_insert_before(hook_list : Pointer(LibGLib::HookList), sibling : Pointer(LibGLib::Hook), hook : Pointer(LibGLib::Hook)) : Void
  fun hook_prepend = g_hook_prepend(hook_list : Pointer(LibGLib::HookList), hook : Pointer(LibGLib::Hook)) : Void
  fun hook_unref = g_hook_unref(hook_list : Pointer(LibGLib::HookList), hook : Pointer(LibGLib::Hook)) : Void

  struct HookList # struct
    seq_id : UInt64
    hook_size : UInt32
    is_setup : UInt32
    hooks : Pointer(LibGLib::Hook)
    dummy3 : Pointer(Void)
    finalize_hook : LibGLib::HookFinalizeFunc
    dummy : Pointer(Void)[2]
  end

  fun hook_list_clear = g_hook_list_clear(this : HookList*) : Void
  fun hook_list_init = g_hook_list_init(this : HookList*, hook_size : UInt32) : Void
  fun hook_list_invoke = g_hook_list_invoke(this : HookList*, may_recurse : LibC::Int) : Void
  fun hook_list_invoke_check = g_hook_list_invoke_check(this : HookList*, may_recurse : LibC::Int) : Void

  struct IOChannel # struct
    ref_count : Int32
    funcs : Pointer(LibGLib::IOFuncs)
    encoding : Pointer(UInt8)
    read_cd : Pointer(Void)
    write_cd : Pointer(Void)
    line_term : Pointer(UInt8)
    line_term_len : UInt32
    buf_size : UInt64
    read_buf : Pointer(LibGLib::String)
    encoded_read_buf : Pointer(LibGLib::String)
    write_buf : Pointer(LibGLib::String)
    partial_write_buf : Int8[6]
    use_buffer : UInt32
    do_encode : UInt32
    close_on_unref : UInt32
    is_readable : UInt32
    is_writeable : UInt32
    is_seekable : UInt32
    reserved1 : Pointer(Void)
    reserved2 : Pointer(Void)
  end

  fun _g_io_channel_get_type = g_io_channel_get_type : UInt64
  fun i_o_channel_new_file = g_io_channel_new_file(filename : Pointer(UInt8), mode : Pointer(UInt8), error : LibGLib::Error**) : Pointer(LibGLib::IOChannel)
  fun i_o_channel_unix_new = g_io_channel_unix_new(fd : Int32) : Pointer(LibGLib::IOChannel)
  fun i_o_channel_close = g_io_channel_close(this : IOChannel*) : Void
  fun i_o_channel_flush = g_io_channel_flush(this : IOChannel*, error : LibGLib::Error**) : LibGLib::IOStatus
  fun i_o_channel_get_buffer_condition = g_io_channel_get_buffer_condition(this : IOChannel*) : LibGLib::IOCondition
  fun i_o_channel_get_buffer_size = g_io_channel_get_buffer_size(this : IOChannel*) : UInt64
  fun i_o_channel_get_buffered = g_io_channel_get_buffered(this : IOChannel*) : LibC::Int
  fun i_o_channel_get_close_on_unref = g_io_channel_get_close_on_unref(this : IOChannel*) : LibC::Int
  fun i_o_channel_get_encoding = g_io_channel_get_encoding(this : IOChannel*) : Pointer(UInt8)
  fun i_o_channel_get_flags = g_io_channel_get_flags(this : IOChannel*) : LibGLib::IOFlags
  fun i_o_channel_get_line_term = g_io_channel_get_line_term(this : IOChannel*, length : Pointer(Int32)) : Pointer(UInt8)
  fun i_o_channel_init = g_io_channel_init(this : IOChannel*) : Void
  fun i_o_channel_read = g_io_channel_read(this : IOChannel*, buf : Pointer(UInt8), count : UInt64, bytes_read : Pointer(UInt64)) : LibGLib::IOError
  fun i_o_channel_read_chars = g_io_channel_read_chars(this : IOChannel*, buf : Pointer(UInt8)*, count : UInt64, bytes_read : UInt64*, error : LibGLib::Error**) : LibGLib::IOStatus
  fun i_o_channel_read_line = g_io_channel_read_line(this : IOChannel*, str_return : Pointer(UInt8)*, length : UInt64*, terminator_pos : UInt64*, error : LibGLib::Error**) : LibGLib::IOStatus
  fun i_o_channel_read_line_string = g_io_channel_read_line_string(this : IOChannel*, buffer : Pointer(LibGLib::String), terminator_pos : Pointer(UInt64), error : LibGLib::Error**) : LibGLib::IOStatus
  fun i_o_channel_read_to_end = g_io_channel_read_to_end(this : IOChannel*, str_return : Pointer(UInt8)*, length : UInt64*, error : LibGLib::Error**) : LibGLib::IOStatus
  fun i_o_channel_read_unichar = g_io_channel_read_unichar(this : IOChannel*, thechar : UInt8*, error : LibGLib::Error**) : LibGLib::IOStatus
  fun i_o_channel_ref = g_io_channel_ref(this : IOChannel*) : Pointer(LibGLib::IOChannel)
  fun i_o_channel_seek = g_io_channel_seek(this : IOChannel*, offset : Int64, type : LibGLib::SeekType) : LibGLib::IOError
  fun i_o_channel_seek_position = g_io_channel_seek_position(this : IOChannel*, offset : Int64, type : LibGLib::SeekType, error : LibGLib::Error**) : LibGLib::IOStatus
  fun i_o_channel_set_buffer_size = g_io_channel_set_buffer_size(this : IOChannel*, size : UInt64) : Void
  fun i_o_channel_set_buffered = g_io_channel_set_buffered(this : IOChannel*, buffered : LibC::Int) : Void
  fun i_o_channel_set_close_on_unref = g_io_channel_set_close_on_unref(this : IOChannel*, do_close : LibC::Int) : Void
  fun i_o_channel_set_encoding = g_io_channel_set_encoding(this : IOChannel*, encoding : Pointer(UInt8), error : LibGLib::Error**) : LibGLib::IOStatus
  fun i_o_channel_set_flags = g_io_channel_set_flags(this : IOChannel*, flags : LibGLib::IOFlags, error : LibGLib::Error**) : LibGLib::IOStatus
  fun i_o_channel_set_line_term = g_io_channel_set_line_term(this : IOChannel*, line_term : Pointer(UInt8), length : Int32) : Void
  fun i_o_channel_shutdown = g_io_channel_shutdown(this : IOChannel*, flush : LibC::Int, error : LibGLib::Error**) : LibGLib::IOStatus
  fun i_o_channel_unix_get_fd = g_io_channel_unix_get_fd(this : IOChannel*) : Int32
  fun i_o_channel_unref = g_io_channel_unref(this : IOChannel*) : Void
  fun i_o_channel_write = g_io_channel_write(this : IOChannel*, buf : Pointer(UInt8), count : UInt64, bytes_written : Pointer(UInt64)) : LibGLib::IOError
  fun i_o_channel_write_chars = g_io_channel_write_chars(this : IOChannel*, buf : Pointer(UInt8), count : Int64, bytes_written : UInt64*, error : LibGLib::Error**) : LibGLib::IOStatus
  fun i_o_channel_write_unichar = g_io_channel_write_unichar(this : IOChannel*, thechar : UInt8, error : LibGLib::Error**) : LibGLib::IOStatus
  fun i_o_channel_error_from_errno = g_io_channel_error_from_errno(en : Int32) : LibGLib::IOChannelError
  fun i_o_channel_error_quark = g_io_channel_error_quark : UInt32

  struct IOFuncs # struct
    io_read : Pointer(LibGLib::IOChannel), Pointer(UInt8), UInt64, Pointer(UInt64), LibGLib::Error* -> LibGLib::IOStatus
    io_write : Pointer(LibGLib::IOChannel), Pointer(UInt8), UInt64, Pointer(UInt64), LibGLib::Error* -> LibGLib::IOStatus
    io_seek : Pointer(LibGLib::IOChannel), Int64, LibGLib::SeekType, LibGLib::Error* -> LibGLib::IOStatus
    io_close : Pointer(LibGLib::IOChannel), LibGLib::Error* -> LibGLib::IOStatus
    io_create_watch : Pointer(LibGLib::IOChannel), LibGLib::IOCondition -> Pointer(LibGLib::Source)
    io_free : Pointer(LibGLib::IOChannel) -> Void
    io_set_flags : Pointer(LibGLib::IOChannel), LibGLib::IOFlags, LibGLib::Error* -> LibGLib::IOStatus
    io_get_flags : Pointer(LibGLib::IOChannel) -> LibGLib::IOFlags
  end

  struct KeyFile # struct
    _data : UInt8[0]
  end

  fun _g_key_file_get_type = g_key_file_get_type : UInt64
  fun key_file_new = g_key_file_new : Pointer(LibGLib::KeyFile)
  fun key_file_get_boolean = g_key_file_get_boolean(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), error : LibGLib::Error**) : LibC::Int
  fun key_file_get_boolean_list = g_key_file_get_boolean_list(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), length : UInt64*, error : LibGLib::Error**) : Pointer(LibC::Int)
  fun key_file_get_comment = g_key_file_get_comment(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), error : LibGLib::Error**) : Pointer(UInt8)
  fun key_file_get_double = g_key_file_get_double(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), error : LibGLib::Error**) : Float64
  fun key_file_get_double_list = g_key_file_get_double_list(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), length : UInt64*, error : LibGLib::Error**) : Pointer(Float64)
  fun key_file_get_groups = g_key_file_get_groups(this : KeyFile*, length : UInt64*) : Pointer(Pointer(UInt8))
  fun key_file_get_int64 = g_key_file_get_int64(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), error : LibGLib::Error**) : Int64
  fun key_file_get_integer = g_key_file_get_integer(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), error : LibGLib::Error**) : Int32
  fun key_file_get_integer_list = g_key_file_get_integer_list(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), length : UInt64*, error : LibGLib::Error**) : Pointer(Int32)
  fun key_file_get_keys = g_key_file_get_keys(this : KeyFile*, group_name : Pointer(UInt8), length : UInt64*, error : LibGLib::Error**) : Pointer(Pointer(UInt8))
  fun key_file_get_locale_for_key = g_key_file_get_locale_for_key(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), locale : Pointer(UInt8)) : Pointer(UInt8)
  fun key_file_get_locale_string = g_key_file_get_locale_string(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), locale : Pointer(UInt8), error : LibGLib::Error**) : Pointer(UInt8)
  fun key_file_get_locale_string_list = g_key_file_get_locale_string_list(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), locale : Pointer(UInt8), length : UInt64*, error : LibGLib::Error**) : Pointer(Pointer(UInt8))
  fun key_file_get_start_group = g_key_file_get_start_group(this : KeyFile*) : Pointer(UInt8)
  fun key_file_get_string = g_key_file_get_string(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), error : LibGLib::Error**) : Pointer(UInt8)
  fun key_file_get_string_list = g_key_file_get_string_list(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), length : UInt64*, error : LibGLib::Error**) : Pointer(Pointer(UInt8))
  fun key_file_get_uint64 = g_key_file_get_uint64(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), error : LibGLib::Error**) : UInt64
  fun key_file_get_value = g_key_file_get_value(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), error : LibGLib::Error**) : Pointer(UInt8)
  fun key_file_has_group = g_key_file_has_group(this : KeyFile*, group_name : Pointer(UInt8)) : LibC::Int
  fun key_file_load_from_bytes = g_key_file_load_from_bytes(this : KeyFile*, bytes : Pointer(LibGLib::Bytes), flags : LibGLib::KeyFileFlags, error : LibGLib::Error**) : LibC::Int
  fun key_file_load_from_data = g_key_file_load_from_data(this : KeyFile*, data : Pointer(UInt8), length : UInt64, flags : LibGLib::KeyFileFlags, error : LibGLib::Error**) : LibC::Int
  fun key_file_load_from_data_dirs = g_key_file_load_from_data_dirs(this : KeyFile*, file : Pointer(UInt8), full_path : Pointer(UInt8)*, flags : LibGLib::KeyFileFlags, error : LibGLib::Error**) : LibC::Int
  fun key_file_load_from_dirs = g_key_file_load_from_dirs(this : KeyFile*, file : Pointer(UInt8), search_dirs : Pointer(Pointer(UInt8)), full_path : Pointer(UInt8)*, flags : LibGLib::KeyFileFlags, error : LibGLib::Error**) : LibC::Int
  fun key_file_load_from_file = g_key_file_load_from_file(this : KeyFile*, file : Pointer(UInt8), flags : LibGLib::KeyFileFlags, error : LibGLib::Error**) : LibC::Int
  fun key_file_remove_comment = g_key_file_remove_comment(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), error : LibGLib::Error**) : LibC::Int
  fun key_file_remove_group = g_key_file_remove_group(this : KeyFile*, group_name : Pointer(UInt8), error : LibGLib::Error**) : LibC::Int
  fun key_file_remove_key = g_key_file_remove_key(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), error : LibGLib::Error**) : LibC::Int
  fun key_file_save_to_file = g_key_file_save_to_file(this : KeyFile*, filename : Pointer(UInt8), error : LibGLib::Error**) : LibC::Int
  fun key_file_set_boolean = g_key_file_set_boolean(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), value : LibC::Int) : Void
  fun key_file_set_boolean_list = g_key_file_set_boolean_list(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), list : Pointer(LibC::Int), length : UInt64) : Void
  fun key_file_set_comment = g_key_file_set_comment(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), comment : Pointer(UInt8), error : LibGLib::Error**) : LibC::Int
  fun key_file_set_double = g_key_file_set_double(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), value : Float64) : Void
  fun key_file_set_double_list = g_key_file_set_double_list(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), list : Pointer(Float64), length : UInt64) : Void
  fun key_file_set_int64 = g_key_file_set_int64(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), value : Int64) : Void
  fun key_file_set_integer = g_key_file_set_integer(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), value : Int32) : Void
  fun key_file_set_integer_list = g_key_file_set_integer_list(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), list : Pointer(Int32), length : UInt64) : Void
  fun key_file_set_list_separator = g_key_file_set_list_separator(this : KeyFile*, separator : Int8) : Void
  fun key_file_set_locale_string = g_key_file_set_locale_string(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), locale : Pointer(UInt8), string : Pointer(UInt8)) : Void
  fun key_file_set_locale_string_list = g_key_file_set_locale_string_list(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), locale : Pointer(UInt8), list : Pointer(Pointer(UInt8)), length : UInt64) : Void
  fun key_file_set_string = g_key_file_set_string(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), string : Pointer(UInt8)) : Void
  fun key_file_set_string_list = g_key_file_set_string_list(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), list : Pointer(Pointer(UInt8)), length : UInt64) : Void
  fun key_file_set_uint64 = g_key_file_set_uint64(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), value : UInt64) : Void
  fun key_file_set_value = g_key_file_set_value(this : KeyFile*, group_name : Pointer(UInt8), key : Pointer(UInt8), value : Pointer(UInt8)) : Void
  fun key_file_to_data = g_key_file_to_data(this : KeyFile*, length : UInt64*, error : LibGLib::Error**) : Pointer(UInt8)
  fun key_file_unref = g_key_file_unref(this : KeyFile*) : Void
  fun key_file_error_quark = g_key_file_error_quark : UInt32

  struct List # struct
    data : Pointer(Void)
    _next : Pointer(Void*)
    prev : Pointer(Void*)
  end

  struct LogField # struct
    key : Pointer(UInt8)
    value : Pointer(Void)
    length : Int64
  end

  struct MainContext # struct
    _data : UInt8[0]
  end

  fun _g_main_context_get_type = g_main_context_get_type : UInt64
  fun main_context_new = g_main_context_new : Pointer(LibGLib::MainContext)
  fun main_context_acquire = g_main_context_acquire(this : MainContext*) : LibC::Int
  fun main_context_add_poll = g_main_context_add_poll(this : MainContext*, fd : Pointer(LibGLib::PollFD), priority : Int32) : Void
  fun main_context_check = g_main_context_check(this : MainContext*, max_priority : Int32, fds : Pointer(LibGLib::PollFD), n_fds : Int32) : LibC::Int
  fun main_context_dispatch = g_main_context_dispatch(this : MainContext*) : Void
  fun main_context_find_source_by_funcs_user_data = g_main_context_find_source_by_funcs_user_data(this : MainContext*, funcs : Pointer(LibGLib::SourceFuncs), user_data : Pointer(Void)) : Pointer(LibGLib::Source)
  fun main_context_find_source_by_id = g_main_context_find_source_by_id(this : MainContext*, source_id : UInt32) : Pointer(LibGLib::Source)
  fun main_context_find_source_by_user_data = g_main_context_find_source_by_user_data(this : MainContext*, user_data : Pointer(Void)) : Pointer(LibGLib::Source)
  fun main_context_invoke_full = g_main_context_invoke_full(this : MainContext*, priority : Int32, function : LibGLib::SourceFunc, data : Pointer(Void), notify : LibGLib::DestroyNotify) : Void
  fun main_context_is_owner = g_main_context_is_owner(this : MainContext*) : LibC::Int
  fun main_context_iteration = g_main_context_iteration(this : MainContext*, may_block : LibC::Int) : LibC::Int
  fun main_context_pending = g_main_context_pending(this : MainContext*) : LibC::Int
  fun main_context_pop_thread_default = g_main_context_pop_thread_default(this : MainContext*) : Void
  fun main_context_prepare = g_main_context_prepare(this : MainContext*, priority : Int32*) : LibC::Int
  fun main_context_push_thread_default = g_main_context_push_thread_default(this : MainContext*) : Void
  fun main_context_query = g_main_context_query(this : MainContext*, max_priority : Int32, timeout_ : Int32*, fds : Pointer(LibGLib::PollFD)*, n_fds : Int32) : Int32
  fun main_context_ref = g_main_context_ref(this : MainContext*) : Pointer(LibGLib::MainContext)
  fun main_context_release = g_main_context_release(this : MainContext*) : Void
  fun main_context_remove_poll = g_main_context_remove_poll(this : MainContext*, fd : Pointer(LibGLib::PollFD)) : Void
  fun main_context_unref = g_main_context_unref(this : MainContext*) : Void
  fun main_context_wait = g_main_context_wait(this : MainContext*, cond : Pointer(LibGLib::Cond), mutex : Pointer(LibGLib::Mutex)) : LibC::Int
  fun main_context_wakeup = g_main_context_wakeup(this : MainContext*) : Void
  fun main_context_default = g_main_context_default : Pointer(LibGLib::MainContext)
  fun main_context_get_thread_default = g_main_context_get_thread_default : Pointer(LibGLib::MainContext)
  fun main_context_ref_thread_default = g_main_context_ref_thread_default : Pointer(LibGLib::MainContext)

  struct MainLoop # struct
    _data : UInt8[0]
  end

  fun _g_main_loop_get_type = g_main_loop_get_type : UInt64
  fun main_loop_new = g_main_loop_new(context : Pointer(LibGLib::MainContext), is_running : LibC::Int) : Pointer(LibGLib::MainLoop)
  fun main_loop_get_context = g_main_loop_get_context(this : MainLoop*) : Pointer(LibGLib::MainContext)
  fun main_loop_is_running = g_main_loop_is_running(this : MainLoop*) : LibC::Int
  fun main_loop_quit = g_main_loop_quit(this : MainLoop*) : Void
  fun main_loop_ref = g_main_loop_ref(this : MainLoop*) : Pointer(LibGLib::MainLoop)
  fun main_loop_run = g_main_loop_run(this : MainLoop*) : Void
  fun main_loop_unref = g_main_loop_unref(this : MainLoop*) : Void

  struct MappedFile # struct
    _data : UInt8[0]
  end

  fun _g_mapped_file_get_type = g_mapped_file_get_type : UInt64
  fun mapped_file_new = g_mapped_file_new(filename : Pointer(UInt8), writable : LibC::Int, error : LibGLib::Error**) : Pointer(LibGLib::MappedFile)
  fun mapped_file_new_from_fd = g_mapped_file_new_from_fd(fd : Int32, writable : LibC::Int, error : LibGLib::Error**) : Pointer(LibGLib::MappedFile)
  fun mapped_file_free = g_mapped_file_free(this : MappedFile*) : Void
  fun mapped_file_get_bytes = g_mapped_file_get_bytes(this : MappedFile*) : Pointer(LibGLib::Bytes)
  fun mapped_file_get_contents = g_mapped_file_get_contents(this : MappedFile*) : Pointer(UInt8)
  fun mapped_file_get_length = g_mapped_file_get_length(this : MappedFile*) : UInt64
  fun mapped_file_ref = g_mapped_file_ref(this : MappedFile*) : Pointer(LibGLib::MappedFile)
  fun mapped_file_unref = g_mapped_file_unref(this : MappedFile*) : Void

  struct MarkupParseContext # struct
    _data : UInt8[0]
  end

  fun _g_markup_parse_context_get_type = g_markup_parse_context_get_type : UInt64
  fun markup_parse_context_new = g_markup_parse_context_new(parser : Pointer(LibGLib::MarkupParser), flags : LibGLib::MarkupParseFlags, user_data : Pointer(Void), user_data_dnotify : LibGLib::DestroyNotify) : Pointer(LibGLib::MarkupParseContext)
  fun markup_parse_context_end_parse = g_markup_parse_context_end_parse(this : MarkupParseContext*, error : LibGLib::Error**) : LibC::Int
  fun markup_parse_context_free = g_markup_parse_context_free(this : MarkupParseContext*) : Void
  fun markup_parse_context_get_element = g_markup_parse_context_get_element(this : MarkupParseContext*) : Pointer(UInt8)
  fun markup_parse_context_get_position = g_markup_parse_context_get_position(this : MarkupParseContext*, line_number : Int32*, char_number : Int32*) : Void
  fun markup_parse_context_get_user_data = g_markup_parse_context_get_user_data(this : MarkupParseContext*) : Pointer(Void)
  fun markup_parse_context_parse = g_markup_parse_context_parse(this : MarkupParseContext*, text : Pointer(UInt8), text_len : Int64, error : LibGLib::Error**) : LibC::Int
  fun markup_parse_context_pop = g_markup_parse_context_pop(this : MarkupParseContext*) : Pointer(Void)
  fun markup_parse_context_push = g_markup_parse_context_push(this : MarkupParseContext*, parser : Pointer(LibGLib::MarkupParser), user_data : Pointer(Void)) : Void
  fun markup_parse_context_ref = g_markup_parse_context_ref(this : MarkupParseContext*) : Pointer(LibGLib::MarkupParseContext)
  fun markup_parse_context_unref = g_markup_parse_context_unref(this : MarkupParseContext*) : Void

  struct MarkupParser # struct
    start_element : Pointer(LibGLib::MarkupParseContext), Pointer(UInt8), Pointer(UInt8), Pointer(UInt8), Pointer(Void), LibGLib::Error* -> Void
    end_element : Pointer(LibGLib::MarkupParseContext), Pointer(UInt8), Pointer(Void), LibGLib::Error* -> Void
    text : Pointer(LibGLib::MarkupParseContext), Pointer(UInt8), UInt64, Pointer(Void), LibGLib::Error* -> Void
    passthrough : Pointer(LibGLib::MarkupParseContext), Pointer(UInt8), UInt64, Pointer(Void), LibGLib::Error* -> Void
    error : Pointer(LibGLib::MarkupParseContext), Pointer(LibGLib::Error*), Pointer(Void) -> Void
  end

  struct MatchInfo # struct
    _data : UInt8[0]
  end

  fun _g_match_info_get_type = g_match_info_get_type : UInt64
  fun match_info_expand_references = g_match_info_expand_references(this : MatchInfo*, string_to_expand : Pointer(UInt8), error : LibGLib::Error**) : Pointer(UInt8)
  fun match_info_fetch = g_match_info_fetch(this : MatchInfo*, match_num : Int32) : Pointer(UInt8)
  fun match_info_fetch_all = g_match_info_fetch_all(this : MatchInfo*) : Pointer(Pointer(UInt8))
  fun match_info_fetch_named = g_match_info_fetch_named(this : MatchInfo*, name : Pointer(UInt8)) : Pointer(UInt8)
  fun match_info_fetch_named_pos = g_match_info_fetch_named_pos(this : MatchInfo*, name : Pointer(UInt8), start_pos : Int32*, end_pos : Int32*) : LibC::Int
  fun match_info_fetch_pos = g_match_info_fetch_pos(this : MatchInfo*, match_num : Int32, start_pos : Int32*, end_pos : Int32*) : LibC::Int
  fun match_info_free = g_match_info_free(this : MatchInfo*) : Void
  fun match_info_get_match_count = g_match_info_get_match_count(this : MatchInfo*) : Int32
  fun match_info_get_regex = g_match_info_get_regex(this : MatchInfo*) : Pointer(LibGLib::Regex)
  fun match_info_get_string = g_match_info_get_string(this : MatchInfo*) : Pointer(UInt8)
  fun match_info_is_partial_match = g_match_info_is_partial_match(this : MatchInfo*) : LibC::Int
  fun match_info_matches = g_match_info_matches(this : MatchInfo*) : LibC::Int
  fun match_info_next = g_match_info_next(this : MatchInfo*, error : LibGLib::Error**) : LibC::Int
  fun match_info_ref = g_match_info_ref(this : MatchInfo*) : Pointer(LibGLib::MatchInfo)
  fun match_info_unref = g_match_info_unref(this : MatchInfo*) : Void

  struct MemVTable # struct
    malloc : UInt64 -> Pointer(Void)
    realloc : Pointer(Void), UInt64 -> Pointer(Void)
    free : Pointer(Void) -> Void
    calloc : UInt64, UInt64 -> Pointer(Void)
    try_malloc : UInt64 -> Pointer(Void)
    try_realloc : Pointer(Void), UInt64 -> Pointer(Void)
  end

  struct Node # struct
    data : Pointer(Void)
    _next : Pointer(LibGLib::Node)
    prev : Pointer(LibGLib::Node)
    parent : Pointer(LibGLib::Node)
    children : Pointer(LibGLib::Node)
  end

  fun node_child_index = g_node_child_index(this : Node*, data : Pointer(Void)) : Int32
  fun node_child_position = g_node_child_position(this : Node*, child : Pointer(LibGLib::Node)) : Int32
  fun node_depth = g_node_depth(this : Node*) : UInt32
  fun node_destroy = g_node_destroy(this : Node*) : Void
  fun node_is_ancestor = g_node_is_ancestor(this : Node*, descendant : Pointer(LibGLib::Node)) : LibC::Int
  fun node_max_height = g_node_max_height(this : Node*) : UInt32
  fun node_n_children = g_node_n_children(this : Node*) : UInt32
  fun node_n_nodes = g_node_n_nodes(this : Node*, flags : LibGLib::TraverseFlags) : UInt32
  fun node_reverse_children = g_node_reverse_children(this : Node*) : Void
  fun node_unlink = g_node_unlink(this : Node*) : Void

  struct Once # struct
    status : LibGLib::OnceStatus
    retval : Pointer(Void)
  end

  fun once_init_enter = g_once_init_enter(location : Pointer(Void)) : LibC::Int
  fun once_init_leave = g_once_init_leave(location : Pointer(Void), result : UInt64) : Void

  struct OptionContext # struct
    _data : UInt8[0]
  end

  fun option_context_add_group = g_option_context_add_group(this : OptionContext*, group : Pointer(LibGLib::OptionGroup)) : Void
  fun option_context_add_main_entries = g_option_context_add_main_entries(this : OptionContext*, entries : Pointer(LibGLib::OptionEntry), translation_domain : Pointer(UInt8)) : Void
  fun option_context_free = g_option_context_free(this : OptionContext*) : Void
  fun option_context_get_description = g_option_context_get_description(this : OptionContext*) : Pointer(UInt8)
  fun option_context_get_help = g_option_context_get_help(this : OptionContext*, main_help : LibC::Int, group : Pointer(LibGLib::OptionGroup)) : Pointer(UInt8)
  fun option_context_get_help_enabled = g_option_context_get_help_enabled(this : OptionContext*) : LibC::Int
  fun option_context_get_ignore_unknown_options = g_option_context_get_ignore_unknown_options(this : OptionContext*) : LibC::Int
  fun option_context_get_main_group = g_option_context_get_main_group(this : OptionContext*) : Pointer(LibGLib::OptionGroup)
  fun option_context_get_strict_posix = g_option_context_get_strict_posix(this : OptionContext*) : LibC::Int
  fun option_context_get_summary = g_option_context_get_summary(this : OptionContext*) : Pointer(UInt8)
  fun option_context_parse = g_option_context_parse(this : OptionContext*, argc : Int32*, argv : Pointer(Pointer(UInt8))*, error : LibGLib::Error**) : LibC::Int
  fun option_context_parse_strv = g_option_context_parse_strv(this : OptionContext*, arguments : Pointer(Pointer(UInt8))*, error : LibGLib::Error**) : LibC::Int
  fun option_context_set_description = g_option_context_set_description(this : OptionContext*, description : Pointer(UInt8)) : Void
  fun option_context_set_help_enabled = g_option_context_set_help_enabled(this : OptionContext*, help_enabled : LibC::Int) : Void
  fun option_context_set_ignore_unknown_options = g_option_context_set_ignore_unknown_options(this : OptionContext*, ignore_unknown : LibC::Int) : Void
  fun option_context_set_main_group = g_option_context_set_main_group(this : OptionContext*, group : Pointer(LibGLib::OptionGroup)) : Void
  fun option_context_set_strict_posix = g_option_context_set_strict_posix(this : OptionContext*, strict_posix : LibC::Int) : Void
  fun option_context_set_summary = g_option_context_set_summary(this : OptionContext*, summary : Pointer(UInt8)) : Void
  fun option_context_set_translate_func = g_option_context_set_translate_func(this : OptionContext*, func : LibGLib::TranslateFunc, data : Pointer(Void), destroy_notify : LibGLib::DestroyNotify) : Void
  fun option_context_set_translation_domain = g_option_context_set_translation_domain(this : OptionContext*, domain : Pointer(UInt8)) : Void

  struct OptionEntry # struct
    long_name : Pointer(UInt8)
    short_name : Int8
    flags : Int32
    arg : LibGLib::OptionArg
    arg_data : Pointer(Void)
    description : Pointer(UInt8)
    arg_description : Pointer(UInt8)
  end

  struct OptionGroup # struct
    _data : UInt8[0]
  end

  fun _g_option_group_get_type = g_option_group_get_type : UInt64
  fun option_group_new = g_option_group_new(name : Pointer(UInt8), description : Pointer(UInt8), help_description : Pointer(UInt8), user_data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Pointer(LibGLib::OptionGroup)
  fun option_group_add_entries = g_option_group_add_entries(this : OptionGroup*, entries : Pointer(LibGLib::OptionEntry)) : Void
  fun option_group_free = g_option_group_free(this : OptionGroup*) : Void
  fun option_group_ref = g_option_group_ref(this : OptionGroup*) : Pointer(LibGLib::OptionGroup)
  fun option_group_set_translate_func = g_option_group_set_translate_func(this : OptionGroup*, func : LibGLib::TranslateFunc, data : Pointer(Void), destroy_notify : LibGLib::DestroyNotify) : Void
  fun option_group_set_translation_domain = g_option_group_set_translation_domain(this : OptionGroup*, domain : Pointer(UInt8)) : Void
  fun option_group_unref = g_option_group_unref(this : OptionGroup*) : Void

  struct PatternSpec # struct
    _data : UInt8[0]
  end

  fun pattern_spec_equal = g_pattern_spec_equal(this : PatternSpec*, pspec2 : Pointer(LibGLib::PatternSpec)) : LibC::Int
  fun pattern_spec_free = g_pattern_spec_free(this : PatternSpec*) : Void

  struct PollFD # struct
    fd : Int32
    events : UInt16
    revents : UInt16
  end

  fun _g_pollfd_get_type = g_pollfd_get_type : UInt64

  struct Private # struct
    p : Pointer(Void)
    notify : LibGLib::DestroyNotify
    future : Pointer(Void)[2]
  end

  fun private_get = g_private_get(this : Private*) : Pointer(Void)
  fun private_replace = g_private_replace(this : Private*, value : Pointer(Void)) : Void
  fun private_set = g_private_set(this : Private*, value : Pointer(Void)) : Void

  struct PtrArray # struct
    pdata : Pointer(Void)
    len : UInt32
  end

  fun _g_ptr_array_get_type = g_ptr_array_get_type : UInt64

  struct Queue # struct
    head : Pointer(Void*)
    tail : Pointer(Void*)
    length : UInt32
  end

  fun queue_clear = g_queue_clear(this : Queue*) : Void
  fun queue_clear_full = g_queue_clear_full(this : Queue*, free_func : LibGLib::DestroyNotify) : Void
  fun queue_free = g_queue_free(this : Queue*) : Void
  fun queue_free_full = g_queue_free_full(this : Queue*, free_func : LibGLib::DestroyNotify) : Void
  fun queue_get_length = g_queue_get_length(this : Queue*) : UInt32
  fun queue_index = g_queue_index(this : Queue*, data : Pointer(Void)) : Int32
  fun queue_init = g_queue_init(this : Queue*) : Void
  fun queue_is_empty = g_queue_is_empty(this : Queue*) : LibC::Int
  fun queue_peek_head = g_queue_peek_head(this : Queue*) : Pointer(Void)
  fun queue_peek_nth = g_queue_peek_nth(this : Queue*, n : UInt32) : Pointer(Void)
  fun queue_peek_tail = g_queue_peek_tail(this : Queue*) : Pointer(Void)
  fun queue_pop_head = g_queue_pop_head(this : Queue*) : Pointer(Void)
  fun queue_pop_nth = g_queue_pop_nth(this : Queue*, n : UInt32) : Pointer(Void)
  fun queue_pop_tail = g_queue_pop_tail(this : Queue*) : Pointer(Void)
  fun queue_push_head = g_queue_push_head(this : Queue*, data : Pointer(Void)) : Void
  fun queue_push_nth = g_queue_push_nth(this : Queue*, data : Pointer(Void), n : Int32) : Void
  fun queue_push_tail = g_queue_push_tail(this : Queue*, data : Pointer(Void)) : Void
  fun queue_remove = g_queue_remove(this : Queue*, data : Pointer(Void)) : LibC::Int
  fun queue_remove_all = g_queue_remove_all(this : Queue*, data : Pointer(Void)) : UInt32
  fun queue_reverse = g_queue_reverse(this : Queue*) : Void

  struct RWLock # struct
    p : Pointer(Void)
    i : UInt32[2]
  end

  fun r_w_lock_clear = g_rw_lock_clear(this : RWLock*) : Void
  fun r_w_lock_init = g_rw_lock_init(this : RWLock*) : Void
  fun r_w_lock_reader_lock = g_rw_lock_reader_lock(this : RWLock*) : Void
  fun r_w_lock_reader_trylock = g_rw_lock_reader_trylock(this : RWLock*) : LibC::Int
  fun r_w_lock_reader_unlock = g_rw_lock_reader_unlock(this : RWLock*) : Void
  fun r_w_lock_writer_lock = g_rw_lock_writer_lock(this : RWLock*) : Void
  fun r_w_lock_writer_trylock = g_rw_lock_writer_trylock(this : RWLock*) : LibC::Int
  fun r_w_lock_writer_unlock = g_rw_lock_writer_unlock(this : RWLock*) : Void

  struct Rand # struct
    _data : UInt8[0]
  end

  fun rand_double = g_rand_double(this : Rand*) : Float64
  fun rand_double_range = g_rand_double_range(this : Rand*, _begin : Float64, _end : Float64) : Float64
  fun rand_free = g_rand_free(this : Rand*) : Void
  fun rand_int = g_rand_int(this : Rand*) : UInt32
  fun rand_int_range = g_rand_int_range(this : Rand*, _begin : Int32, _end : Int32) : Int32
  fun rand_set_seed = g_rand_set_seed(this : Rand*, seed : UInt32) : Void
  fun rand_set_seed_array = g_rand_set_seed_array(this : Rand*, seed : Pointer(UInt32), seed_length : UInt32) : Void

  struct RecMutex # struct
    p : Pointer(Void)
    i : UInt32[2]
  end

  fun rec_mutex_clear = g_rec_mutex_clear(this : RecMutex*) : Void
  fun rec_mutex_init = g_rec_mutex_init(this : RecMutex*) : Void
  fun rec_mutex_lock = g_rec_mutex_lock(this : RecMutex*) : Void
  fun rec_mutex_trylock = g_rec_mutex_trylock(this : RecMutex*) : LibC::Int
  fun rec_mutex_unlock = g_rec_mutex_unlock(this : RecMutex*) : Void

  struct Regex # struct
    _data : UInt8[0]
  end

  fun _g_regex_get_type = g_regex_get_type : UInt64
  fun regex_new = g_regex_new(pattern : Pointer(UInt8), compile_options : LibGLib::RegexCompileFlags, match_options : LibGLib::RegexMatchFlags, error : LibGLib::Error**) : Pointer(LibGLib::Regex)
  fun regex_get_capture_count = g_regex_get_capture_count(this : Regex*) : Int32
  fun regex_get_compile_flags = g_regex_get_compile_flags(this : Regex*) : LibGLib::RegexCompileFlags
  fun regex_get_has_cr_or_lf = g_regex_get_has_cr_or_lf(this : Regex*) : LibC::Int
  fun regex_get_match_flags = g_regex_get_match_flags(this : Regex*) : LibGLib::RegexMatchFlags
  fun regex_get_max_backref = g_regex_get_max_backref(this : Regex*) : Int32
  fun regex_get_max_lookbehind = g_regex_get_max_lookbehind(this : Regex*) : Int32
  fun regex_get_pattern = g_regex_get_pattern(this : Regex*) : Pointer(UInt8)
  fun regex_get_string_number = g_regex_get_string_number(this : Regex*, name : Pointer(UInt8)) : Int32
  fun regex_match = g_regex_match(this : Regex*, string : Pointer(UInt8), match_options : LibGLib::RegexMatchFlags, match_info : Pointer(LibGLib::MatchInfo)*) : LibC::Int
  fun regex_match_all = g_regex_match_all(this : Regex*, string : Pointer(UInt8), match_options : LibGLib::RegexMatchFlags, match_info : Pointer(LibGLib::MatchInfo)*) : LibC::Int
  fun regex_match_all_full = g_regex_match_all_full(this : Regex*, string : Pointer(Pointer(UInt8)), string_len : Int64, start_position : Int32, match_options : LibGLib::RegexMatchFlags, match_info : Pointer(LibGLib::MatchInfo)*, error : LibGLib::Error**) : LibC::Int
  fun regex_match_full = g_regex_match_full(this : Regex*, string : Pointer(Pointer(UInt8)), string_len : Int64, start_position : Int32, match_options : LibGLib::RegexMatchFlags, match_info : Pointer(LibGLib::MatchInfo)*, error : LibGLib::Error**) : LibC::Int
  fun regex_ref = g_regex_ref(this : Regex*) : Pointer(LibGLib::Regex)
  fun regex_replace = g_regex_replace(this : Regex*, string : Pointer(Pointer(UInt8)), string_len : Int64, start_position : Int32, replacement : Pointer(UInt8), match_options : LibGLib::RegexMatchFlags, error : LibGLib::Error**) : Pointer(UInt8)
  fun regex_replace_literal = g_regex_replace_literal(this : Regex*, string : Pointer(Pointer(UInt8)), string_len : Int64, start_position : Int32, replacement : Pointer(UInt8), match_options : LibGLib::RegexMatchFlags, error : LibGLib::Error**) : Pointer(UInt8)
  fun regex_split = g_regex_split(this : Regex*, string : Pointer(UInt8), match_options : LibGLib::RegexMatchFlags) : Pointer(Pointer(UInt8))
  fun regex_split_full = g_regex_split_full(this : Regex*, string : Pointer(Pointer(UInt8)), string_len : Int64, start_position : Int32, match_options : LibGLib::RegexMatchFlags, max_tokens : Int32, error : LibGLib::Error**) : Pointer(Pointer(UInt8))
  fun regex_unref = g_regex_unref(this : Regex*) : Void
  fun regex_check_replacement = g_regex_check_replacement(replacement : Pointer(UInt8), has_references : LibC::Int*, error : LibGLib::Error**) : LibC::Int
  fun regex_error_quark = g_regex_error_quark : UInt32
  fun regex_escape_nul = g_regex_escape_nul(string : Pointer(UInt8), length : Int32) : Pointer(UInt8)
  fun regex_escape_string = g_regex_escape_string(string : Pointer(Pointer(UInt8)), length : Int32) : Pointer(UInt8)
  fun regex_match_simple = g_regex_match_simple(pattern : Pointer(UInt8), string : Pointer(UInt8), compile_options : LibGLib::RegexCompileFlags, match_options : LibGLib::RegexMatchFlags) : LibC::Int
  fun regex_split_simple = g_regex_split_simple(pattern : Pointer(UInt8), string : Pointer(UInt8), compile_options : LibGLib::RegexCompileFlags, match_options : LibGLib::RegexMatchFlags) : Pointer(Pointer(UInt8))

  struct SList # struct
    data : Pointer(Void)
    _next : Pointer(Void*)
  end

  struct Scanner # struct
    user_data : Pointer(Void)
    max_parse_errors : UInt32
    parse_errors : UInt32
    input_name : Pointer(UInt8)
    qdata : Pointer(LibGLib::Data)
    config : Pointer(LibGLib::ScannerConfig)
    token : LibGLib::TokenType
    value : LibGLib::TokenValue
    line : UInt32
    position : UInt32
    next_token : LibGLib::TokenType
    next_value : LibGLib::TokenValue
    next_line : UInt32
    next_position : UInt32
    symbol_table : Pointer(Void*)
    input_fd : Int32
    text : Pointer(UInt8)
    text_end : Pointer(UInt8)
    buffer : Pointer(UInt8)
    scope_id : UInt32
    msg_handler : LibGLib::ScannerMsgFunc
  end

  fun scanner_cur_line = g_scanner_cur_line(this : Scanner*) : UInt32
  fun scanner_cur_position = g_scanner_cur_position(this : Scanner*) : UInt32
  fun scanner_cur_token = g_scanner_cur_token(this : Scanner*) : LibGLib::TokenType
  fun scanner_destroy = g_scanner_destroy(this : Scanner*) : Void
  fun scanner_eof = g_scanner_eof(this : Scanner*) : LibC::Int
  fun scanner_get_next_token = g_scanner_get_next_token(this : Scanner*) : LibGLib::TokenType
  fun scanner_input_file = g_scanner_input_file(this : Scanner*, input_fd : Int32) : Void
  fun scanner_input_text = g_scanner_input_text(this : Scanner*, text : Pointer(UInt8), text_len : UInt32) : Void
  fun scanner_lookup_symbol = g_scanner_lookup_symbol(this : Scanner*, symbol : Pointer(UInt8)) : Pointer(Void)
  fun scanner_peek_next_token = g_scanner_peek_next_token(this : Scanner*) : LibGLib::TokenType
  fun scanner_scope_add_symbol = g_scanner_scope_add_symbol(this : Scanner*, scope_id : UInt32, symbol : Pointer(UInt8), value : Pointer(Void)) : Void
  fun scanner_scope_lookup_symbol = g_scanner_scope_lookup_symbol(this : Scanner*, scope_id : UInt32, symbol : Pointer(UInt8)) : Pointer(Void)
  fun scanner_scope_remove_symbol = g_scanner_scope_remove_symbol(this : Scanner*, scope_id : UInt32, symbol : Pointer(UInt8)) : Void
  fun scanner_set_scope = g_scanner_set_scope(this : Scanner*, scope_id : UInt32) : UInt32
  fun scanner_sync_file_offset = g_scanner_sync_file_offset(this : Scanner*) : Void
  fun scanner_unexp_token = g_scanner_unexp_token(this : Scanner*, expected_token : LibGLib::TokenType, identifier_spec : Pointer(UInt8), symbol_spec : Pointer(UInt8), symbol_name : Pointer(UInt8), message : Pointer(UInt8), is_error : Int32) : Void

  struct ScannerConfig # struct
    cset_skip_characters : Pointer(UInt8)
    cset_identifier_first : Pointer(UInt8)
    cset_identifier_nth : Pointer(UInt8)
    cpair_comment_single : Pointer(UInt8)
    case_sensitive : UInt32
    skip_comment_multi : UInt32
    skip_comment_single : UInt32
    scan_comment_multi : UInt32
    scan_identifier : UInt32
    scan_identifier_1char : UInt32
    scan_identifier_NULL : UInt32
    scan_symbols : UInt32
    scan_binary : UInt32
    scan_octal : UInt32
    scan_float : UInt32
    scan_hex : UInt32
    scan_hex_dollar : UInt32
    scan_string_sq : UInt32
    scan_string_dq : UInt32
    numbers_2_int : UInt32
    int_2_float : UInt32
    identifier_2_string : UInt32
    char_2_token : UInt32
    symbol_2_token : UInt32
    scope_0_fallback : UInt32
    store_int64 : UInt32
    padding_dummy : UInt32
  end

  struct Sequence # struct
    _data : UInt8[0]
  end

  fun sequence_append = g_sequence_append(this : Sequence*, data : Pointer(Void)) : Pointer(LibGLib::SequenceIter)
  fun sequence_free = g_sequence_free(this : Sequence*) : Void
  fun sequence_get_begin_iter = g_sequence_get_begin_iter(this : Sequence*) : Pointer(LibGLib::SequenceIter)
  fun sequence_get_end_iter = g_sequence_get_end_iter(this : Sequence*) : Pointer(LibGLib::SequenceIter)
  fun sequence_get_iter_at_pos = g_sequence_get_iter_at_pos(this : Sequence*, pos : Int32) : Pointer(LibGLib::SequenceIter)
  fun sequence_get_length = g_sequence_get_length(this : Sequence*) : Int32
  fun sequence_is_empty = g_sequence_is_empty(this : Sequence*) : LibC::Int
  fun sequence_prepend = g_sequence_prepend(this : Sequence*, data : Pointer(Void)) : Pointer(LibGLib::SequenceIter)
  fun sequence_get = g_sequence_get(iter : Pointer(LibGLib::SequenceIter)) : Pointer(Void)
  fun sequence_insert_before = g_sequence_insert_before(iter : Pointer(LibGLib::SequenceIter), data : Pointer(Void)) : Pointer(LibGLib::SequenceIter)
  fun sequence_move = g_sequence_move(src : Pointer(LibGLib::SequenceIter), dest : Pointer(LibGLib::SequenceIter)) : Void
  fun sequence_move_range = g_sequence_move_range(dest : Pointer(LibGLib::SequenceIter), _begin : Pointer(LibGLib::SequenceIter), _end : Pointer(LibGLib::SequenceIter)) : Void
  fun sequence_range_get_midpoint = g_sequence_range_get_midpoint(_begin : Pointer(LibGLib::SequenceIter), _end : Pointer(LibGLib::SequenceIter)) : Pointer(LibGLib::SequenceIter)
  fun sequence_remove = g_sequence_remove(iter : Pointer(LibGLib::SequenceIter)) : Void
  fun sequence_remove_range = g_sequence_remove_range(_begin : Pointer(LibGLib::SequenceIter), _end : Pointer(LibGLib::SequenceIter)) : Void
  fun sequence_set = g_sequence_set(iter : Pointer(LibGLib::SequenceIter), data : Pointer(Void)) : Void
  fun sequence_swap = g_sequence_swap(a : Pointer(LibGLib::SequenceIter), b : Pointer(LibGLib::SequenceIter)) : Void

  struct SequenceIter # struct
    _data : UInt8[0]
  end

  fun sequence_iter_compare = g_sequence_iter_compare(this : SequenceIter*, b : Pointer(LibGLib::SequenceIter)) : Int32
  fun sequence_iter_get_position = g_sequence_iter_get_position(this : SequenceIter*) : Int32
  fun sequence_iter_get_sequence = g_sequence_iter_get_sequence(this : SequenceIter*) : Pointer(LibGLib::Sequence)
  fun sequence_iter_is_begin = g_sequence_iter_is_begin(this : SequenceIter*) : LibC::Int
  fun sequence_iter_is_end = g_sequence_iter_is_end(this : SequenceIter*) : LibC::Int
  fun sequence_iter_move = g_sequence_iter_move(this : SequenceIter*, delta : Int32) : Pointer(LibGLib::SequenceIter)
  fun sequence_iter_next = g_sequence_iter_next(this : SequenceIter*) : Pointer(LibGLib::SequenceIter)
  fun sequence_iter_prev = g_sequence_iter_prev(this : SequenceIter*) : Pointer(LibGLib::SequenceIter)

  struct Source # struct
    callback_data : Pointer(Void)
    callback_funcs : Pointer(LibGLib::SourceCallbackFuncs)
    source_funcs : Pointer(LibGLib::SourceFuncs)
    ref_count : UInt32
    context : Pointer(LibGLib::MainContext)
    priority : Int32
    flags : UInt32
    source_id : UInt32
    poll_fds : Pointer(Void*)
    prev : Pointer(LibGLib::Source)
    _next : Pointer(LibGLib::Source)
    name : Pointer(UInt8)
    priv : Pointer(LibGLib::SourcePrivate)
  end

  fun _g_source_get_type = g_source_get_type : UInt64
  fun source_new = g_source_new(source_funcs : Pointer(LibGLib::SourceFuncs), struct_size : UInt32) : Pointer(LibGLib::Source)
  fun source_add_child_source = g_source_add_child_source(this : Source*, child_source : Pointer(LibGLib::Source)) : Void
  fun source_add_poll = g_source_add_poll(this : Source*, fd : Pointer(LibGLib::PollFD)) : Void
  fun source_add_unix_fd = g_source_add_unix_fd(this : Source*, fd : Int32, events : LibGLib::IOCondition) : Pointer(Void)
  fun source_attach = g_source_attach(this : Source*, context : Pointer(LibGLib::MainContext)) : UInt32
  fun source_destroy = g_source_destroy(this : Source*) : Void
  fun source_get_can_recurse = g_source_get_can_recurse(this : Source*) : LibC::Int
  fun source_get_context = g_source_get_context(this : Source*) : Pointer(LibGLib::MainContext)
  fun source_get_current_time = g_source_get_current_time(this : Source*, timeval : Pointer(LibGLib::TimeVal)) : Void
  fun source_get_id = g_source_get_id(this : Source*) : UInt32
  fun source_get_name = g_source_get_name(this : Source*) : Pointer(UInt8)
  fun source_get_priority = g_source_get_priority(this : Source*) : Int32
  fun source_get_ready_time = g_source_get_ready_time(this : Source*) : Int64
  fun source_get_time = g_source_get_time(this : Source*) : Int64
  fun source_is_destroyed = g_source_is_destroyed(this : Source*) : LibC::Int
  fun source_modify_unix_fd = g_source_modify_unix_fd(this : Source*, tag : Pointer(Void), new_events : LibGLib::IOCondition) : Void
  fun source_query_unix_fd = g_source_query_unix_fd(this : Source*, tag : Pointer(Void)) : LibGLib::IOCondition
  fun source_ref = g_source_ref(this : Source*) : Pointer(LibGLib::Source)
  fun source_remove_child_source = g_source_remove_child_source(this : Source*, child_source : Pointer(LibGLib::Source)) : Void
  fun source_remove_poll = g_source_remove_poll(this : Source*, fd : Pointer(LibGLib::PollFD)) : Void
  fun source_remove_unix_fd = g_source_remove_unix_fd(this : Source*, tag : Pointer(Void)) : Void
  fun source_set_callback = g_source_set_callback(this : Source*, func : LibGLib::SourceFunc, data : Pointer(Void), notify : LibGLib::DestroyNotify) : Void
  fun source_set_callback_indirect = g_source_set_callback_indirect(this : Source*, callback_data : Pointer(Void), callback_funcs : Pointer(LibGLib::SourceCallbackFuncs)) : Void
  fun source_set_can_recurse = g_source_set_can_recurse(this : Source*, can_recurse : LibC::Int) : Void
  fun source_set_funcs = g_source_set_funcs(this : Source*, funcs : Pointer(LibGLib::SourceFuncs)) : Void
  fun source_set_name = g_source_set_name(this : Source*, name : Pointer(UInt8)) : Void
  fun source_set_priority = g_source_set_priority(this : Source*, priority : Int32) : Void
  fun source_set_ready_time = g_source_set_ready_time(this : Source*, ready_time : Int64) : Void
  fun source_unref = g_source_unref(this : Source*) : Void
  fun source_remove = g_source_remove(tag : UInt32) : LibC::Int
  fun source_remove_by_funcs_user_data = g_source_remove_by_funcs_user_data(funcs : Pointer(LibGLib::SourceFuncs), user_data : Pointer(Void)) : LibC::Int
  fun source_remove_by_user_data = g_source_remove_by_user_data(user_data : Pointer(Void)) : LibC::Int
  fun source_set_name_by_id = g_source_set_name_by_id(tag : UInt32, name : Pointer(UInt8)) : Void

  struct SourceCallbackFuncs # struct
    ref : Pointer(Void) -> Void
    unref : Pointer(Void) -> Void
    get : Pointer(Void)
  end

  struct SourceFuncs # struct
    prepare : Pointer(LibGLib::Source), Pointer(Int32) -> LibC::Int
    check : Pointer(LibGLib::Source) -> LibC::Int
    dispatch : Pointer(Void)
    finalize : Pointer(LibGLib::Source) -> Void
    closure_callback : LibGLib::SourceFunc
    closure_marshal : LibGLib::SourceDummyMarshal
  end

  struct SourcePrivate # struct
    _data : UInt8[0]
  end

  struct StatBuf # struct
    _data : UInt8[0]
  end

  struct String # struct
    str : Pointer(UInt8)
    len : UInt64
    allocated_len : UInt64
  end

  fun _g_gstring_get_type = g_gstring_get_type : UInt64
  fun string_append = g_string_append(this : String*, val : Pointer(UInt8)) : Pointer(LibGLib::String)
  fun string_append_c = g_string_append_c(this : String*, c : Int8) : Pointer(LibGLib::String)
  fun string_append_len = g_string_append_len(this : String*, val : Pointer(UInt8), len : Int64) : Pointer(LibGLib::String)
  fun string_append_unichar = g_string_append_unichar(this : String*, wc : UInt8) : Pointer(LibGLib::String)
  fun string_append_uri_escaped = g_string_append_uri_escaped(this : String*, unescaped : Pointer(UInt8), reserved_chars_allowed : Pointer(UInt8), allow_utf8 : LibC::Int) : Pointer(LibGLib::String)
  fun string_ascii_down = g_string_ascii_down(this : String*) : Pointer(LibGLib::String)
  fun string_ascii_up = g_string_ascii_up(this : String*) : Pointer(LibGLib::String)
  fun string_assign = g_string_assign(this : String*, rval : Pointer(UInt8)) : Pointer(LibGLib::String)
  fun string_down = g_string_down(this : String*) : Pointer(LibGLib::String)
  fun string_equal = g_string_equal(this : String*, v2 : Pointer(LibGLib::String)) : LibC::Int
  fun string_erase = g_string_erase(this : String*, pos : Int64, len : Int64) : Pointer(LibGLib::String)
  fun string_free = g_string_free(this : String*, free_segment : LibC::Int) : Pointer(UInt8)
  fun string_free_to_bytes = g_string_free_to_bytes(this : String*) : Pointer(LibGLib::Bytes)
  fun string_hash = g_string_hash(this : String*) : UInt32
  fun string_insert = g_string_insert(this : String*, pos : Int64, val : Pointer(UInt8)) : Pointer(LibGLib::String)
  fun string_insert_c = g_string_insert_c(this : String*, pos : Int64, c : Int8) : Pointer(LibGLib::String)
  fun string_insert_len = g_string_insert_len(this : String*, pos : Int64, val : Pointer(UInt8), len : Int64) : Pointer(LibGLib::String)
  fun string_insert_unichar = g_string_insert_unichar(this : String*, pos : Int64, wc : UInt8) : Pointer(LibGLib::String)
  fun string_overwrite = g_string_overwrite(this : String*, pos : UInt64, val : Pointer(UInt8)) : Pointer(LibGLib::String)
  fun string_overwrite_len = g_string_overwrite_len(this : String*, pos : UInt64, val : Pointer(UInt8), len : Int64) : Pointer(LibGLib::String)
  fun string_prepend = g_string_prepend(this : String*, val : Pointer(UInt8)) : Pointer(LibGLib::String)
  fun string_prepend_c = g_string_prepend_c(this : String*, c : Int8) : Pointer(LibGLib::String)
  fun string_prepend_len = g_string_prepend_len(this : String*, val : Pointer(UInt8), len : Int64) : Pointer(LibGLib::String)
  fun string_prepend_unichar = g_string_prepend_unichar(this : String*, wc : UInt8) : Pointer(LibGLib::String)
  fun string_set_size = g_string_set_size(this : String*, len : UInt64) : Pointer(LibGLib::String)
  fun string_truncate = g_string_truncate(this : String*, len : UInt64) : Pointer(LibGLib::String)
  fun string_up = g_string_up(this : String*) : Pointer(LibGLib::String)

  struct StringChunk # struct
    _data : UInt8[0]
  end

  fun string_chunk_clear = g_string_chunk_clear(this : StringChunk*) : Void
  fun string_chunk_free = g_string_chunk_free(this : StringChunk*) : Void
  fun string_chunk_insert = g_string_chunk_insert(this : StringChunk*, string : Pointer(UInt8)) : Pointer(UInt8)
  fun string_chunk_insert_const = g_string_chunk_insert_const(this : StringChunk*, string : Pointer(UInt8)) : Pointer(UInt8)
  fun string_chunk_insert_len = g_string_chunk_insert_len(this : StringChunk*, string : Pointer(UInt8), len : Int64) : Pointer(UInt8)

  struct TestCase # struct
    _data : UInt8[0]
  end

  struct TestConfig # struct
    test_initialized : LibC::Int
    test_quick : LibC::Int
    test_perf : LibC::Int
    test_verbose : LibC::Int
    test_quiet : LibC::Int
    test_undefined : LibC::Int
  end

  struct TestLogBuffer # struct
    data : Pointer(LibGLib::String)
    msgs : Pointer(Void*)
  end

  fun test_log_buffer_free = g_test_log_buffer_free(this : TestLogBuffer*) : Void
  fun test_log_buffer_push = g_test_log_buffer_push(this : TestLogBuffer*, n_bytes : UInt32, bytes : Pointer(UInt8)) : Void

  struct TestLogMsg # struct
    log_type : LibGLib::TestLogType
    n_strings : UInt32
    strings : Pointer(UInt8)
    n_nums : UInt32
    nums : Pointer(Void)
  end

  fun test_log_msg_free = g_test_log_msg_free(this : TestLogMsg*) : Void

  struct TestSuite # struct
    _data : UInt8[0]
  end

  fun test_suite_add = g_test_suite_add(this : TestSuite*, test_case : Pointer(LibGLib::TestCase)) : Void
  fun test_suite_add_suite = g_test_suite_add_suite(this : TestSuite*, nestedsuite : Pointer(LibGLib::TestSuite)) : Void

  struct Thread # struct
    _data : UInt8[0]
  end

  fun _g_thread_get_type = g_thread_get_type : UInt64
  fun thread_join = g_thread_join(this : Thread*) : Pointer(Void)
  fun thread_ref = g_thread_ref(this : Thread*) : Pointer(LibGLib::Thread)
  fun thread_unref = g_thread_unref(this : Thread*) : Void
  fun thread_error_quark = g_thread_error_quark : UInt32
  fun thread_exit = g_thread_exit(retval : Pointer(Void)) : Void
  fun thread_self = g_thread_self : Pointer(LibGLib::Thread)
  fun thread_yield = g_thread_yield : Void

  struct ThreadPool # struct
    func : LibGLib::Func
    user_data : Pointer(Void)
    exclusive : LibC::Int
  end

  fun thread_pool_free = g_thread_pool_free(this : ThreadPool*, immediate : LibC::Int, wait_ : LibC::Int) : Void
  fun thread_pool_get_max_threads = g_thread_pool_get_max_threads(this : ThreadPool*) : Int32
  fun thread_pool_get_num_threads = g_thread_pool_get_num_threads(this : ThreadPool*) : UInt32
  fun thread_pool_move_to_front = g_thread_pool_move_to_front(this : ThreadPool*, data : Pointer(Void)) : LibC::Int
  fun thread_pool_push = g_thread_pool_push(this : ThreadPool*, data : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun thread_pool_set_max_threads = g_thread_pool_set_max_threads(this : ThreadPool*, max_threads : Int32, error : LibGLib::Error**) : LibC::Int
  fun thread_pool_unprocessed = g_thread_pool_unprocessed(this : ThreadPool*) : UInt32
  fun thread_pool_get_max_idle_time = g_thread_pool_get_max_idle_time : UInt32
  fun thread_pool_get_max_unused_threads = g_thread_pool_get_max_unused_threads : Int32
  fun thread_pool_get_num_unused_threads = g_thread_pool_get_num_unused_threads : UInt32
  fun thread_pool_set_max_idle_time = g_thread_pool_set_max_idle_time(interval : UInt32) : Void
  fun thread_pool_set_max_unused_threads = g_thread_pool_set_max_unused_threads(max_threads : Int32) : Void
  fun thread_pool_stop_unused_threads = g_thread_pool_stop_unused_threads : Void

  struct TimeVal # struct
    tv_sec : Int64
    tv_usec : Int64
  end

  fun time_val_add = g_time_val_add(this : TimeVal*, microseconds : Int64) : Void
  fun time_val_to_iso8601 = g_time_val_to_iso8601(this : TimeVal*) : Pointer(UInt8)
  fun time_val_from_iso8601 = g_time_val_from_iso8601(iso_date : Pointer(UInt8), time_ : LibGLib::TimeVal*) : LibC::Int

  struct TimeZone # struct
    _data : UInt8[0]
  end

  fun _g_time_zone_get_type = g_time_zone_get_type : UInt64
  fun time_zone_new = g_time_zone_new(identifier : Pointer(UInt8)) : Pointer(LibGLib::TimeZone)
  fun time_zone_new_local = g_time_zone_new_local : Pointer(LibGLib::TimeZone)
  fun time_zone_new_offset = g_time_zone_new_offset(seconds : Int32) : Pointer(LibGLib::TimeZone)
  fun time_zone_new_utc = g_time_zone_new_utc : Pointer(LibGLib::TimeZone)
  fun time_zone_adjust_time = g_time_zone_adjust_time(this : TimeZone*, type : LibGLib::TimeType, time_ : Pointer(Int64)) : Int32
  fun time_zone_find_interval = g_time_zone_find_interval(this : TimeZone*, type : LibGLib::TimeType, time_ : Int64) : Int32
  fun time_zone_get_abbreviation = g_time_zone_get_abbreviation(this : TimeZone*, interval : Int32) : Pointer(UInt8)
  fun time_zone_get_identifier = g_time_zone_get_identifier(this : TimeZone*) : Pointer(UInt8)
  fun time_zone_get_offset = g_time_zone_get_offset(this : TimeZone*, interval : Int32) : Int32
  fun time_zone_is_dst = g_time_zone_is_dst(this : TimeZone*, interval : Int32) : LibC::Int
  fun time_zone_ref = g_time_zone_ref(this : TimeZone*) : Pointer(LibGLib::TimeZone)
  fun time_zone_unref = g_time_zone_unref(this : TimeZone*) : Void

  struct Timer # struct
    _data : UInt8[0]
  end

  fun timer_continue = g_timer_continue(this : Timer*) : Void
  fun timer_destroy = g_timer_destroy(this : Timer*) : Void
  fun timer_elapsed = g_timer_elapsed(this : Timer*, microseconds : Pointer(UInt64)) : Float64
  fun timer_is_active = g_timer_is_active(this : Timer*) : LibC::Int
  fun timer_reset = g_timer_reset(this : Timer*) : Void
  fun timer_start = g_timer_start(this : Timer*) : Void
  fun timer_stop = g_timer_stop(this : Timer*) : Void

  struct TrashStack # struct
    _next : Pointer(LibGLib::TrashStack)
  end

  fun trash_stack_height = g_trash_stack_height(stack_p : Pointer(LibGLib::TrashStack)) : UInt32
  fun trash_stack_peek = g_trash_stack_peek(stack_p : Pointer(LibGLib::TrashStack)) : Pointer(Void)
  fun trash_stack_pop = g_trash_stack_pop(stack_p : Pointer(LibGLib::TrashStack)) : Pointer(Void)
  fun trash_stack_push = g_trash_stack_push(stack_p : Pointer(LibGLib::TrashStack), data_p : Pointer(Void)) : Void

  struct Tree # struct
    _data : UInt8[0]
  end

  fun tree_destroy = g_tree_destroy(this : Tree*) : Void
  fun tree_height = g_tree_height(this : Tree*) : Int32
  fun tree_insert = g_tree_insert(this : Tree*, key : Pointer(Void), value : Pointer(Void)) : Void
  fun tree_lookup = g_tree_lookup(this : Tree*, key : Pointer(Void)) : Pointer(Void)
  fun tree_lookup_extended = g_tree_lookup_extended(this : Tree*, lookup_key : Pointer(Void), orig_key : Pointer(Void)*, value : Pointer(Void)*) : LibC::Int
  fun tree_nnodes = g_tree_nnodes(this : Tree*) : Int32
  fun tree_remove = g_tree_remove(this : Tree*, key : Pointer(Void)) : LibC::Int
  fun tree_replace = g_tree_replace(this : Tree*, key : Pointer(Void), value : Pointer(Void)) : Void
  fun tree_steal = g_tree_steal(this : Tree*, key : Pointer(Void)) : LibC::Int
  fun tree_unref = g_tree_unref(this : Tree*) : Void

  struct Variant # struct
    _data : UInt8[0]
  end

  fun variant_new_array = g_variant_new_array(child_type : Pointer(LibGLib::VariantType), children : Pointer(Pointer(LibGLib::Variant)), n_children : UInt64) : Pointer(LibGLib::Variant)
  fun variant_new_boolean = g_variant_new_boolean(value : LibC::Int) : Pointer(LibGLib::Variant)
  fun variant_new_byte = g_variant_new_byte(value : UInt8) : Pointer(LibGLib::Variant)
  fun variant_new_bytestring = g_variant_new_bytestring(string : Pointer(UInt8)) : Pointer(LibGLib::Variant)
  fun variant_new_bytestring_array = g_variant_new_bytestring_array(strv : Pointer(Pointer(UInt8)), length : Int64) : Pointer(LibGLib::Variant)
  fun variant_new_dict_entry = g_variant_new_dict_entry(key : Pointer(LibGLib::Variant), value : Pointer(LibGLib::Variant)) : Pointer(LibGLib::Variant)
  fun variant_new_double = g_variant_new_double(value : Float64) : Pointer(LibGLib::Variant)
  fun variant_new_fixed_array = g_variant_new_fixed_array(element_type : Pointer(LibGLib::VariantType), elements : Pointer(Void), n_elements : UInt64, element_size : UInt64) : Pointer(LibGLib::Variant)
  fun variant_new_from_bytes = g_variant_new_from_bytes(type : Pointer(LibGLib::VariantType), bytes : Pointer(LibGLib::Bytes), trusted : LibC::Int) : Pointer(LibGLib::Variant)
  fun variant_new_from_data = g_variant_new_from_data(type : Pointer(LibGLib::VariantType), data : Pointer(UInt8), size : UInt64, trusted : LibC::Int, notify : LibGLib::DestroyNotify, user_data : Pointer(Void)) : Pointer(LibGLib::Variant)
  fun variant_new_handle = g_variant_new_handle(value : Int32) : Pointer(LibGLib::Variant)
  fun variant_new_int16 = g_variant_new_int16(value : Int16) : Pointer(LibGLib::Variant)
  fun variant_new_int32 = g_variant_new_int32(value : Int32) : Pointer(LibGLib::Variant)
  fun variant_new_int64 = g_variant_new_int64(value : Int64) : Pointer(LibGLib::Variant)
  fun variant_new_maybe = g_variant_new_maybe(child_type : Pointer(LibGLib::VariantType), child : Pointer(LibGLib::Variant)) : Pointer(LibGLib::Variant)
  fun variant_new_object_path = g_variant_new_object_path(object_path : Pointer(UInt8)) : Pointer(LibGLib::Variant)
  fun variant_new_objv = g_variant_new_objv(strv : Pointer(Pointer(UInt8)), length : Int64) : Pointer(LibGLib::Variant)
  fun variant_new_signature = g_variant_new_signature(signature : Pointer(UInt8)) : Pointer(LibGLib::Variant)
  fun variant_new_string = g_variant_new_string(string : Pointer(UInt8)) : Pointer(LibGLib::Variant)
  fun variant_new_strv = g_variant_new_strv(strv : Pointer(Pointer(UInt8)), length : Int64) : Pointer(LibGLib::Variant)
  fun variant_new_tuple = g_variant_new_tuple(children : Pointer(Pointer(LibGLib::Variant)), n_children : UInt64) : Pointer(LibGLib::Variant)
  fun variant_new_uint16 = g_variant_new_uint16(value : UInt16) : Pointer(LibGLib::Variant)
  fun variant_new_uint32 = g_variant_new_uint32(value : UInt32) : Pointer(LibGLib::Variant)
  fun variant_new_uint64 = g_variant_new_uint64(value : UInt64) : Pointer(LibGLib::Variant)
  fun variant_new_variant = g_variant_new_variant(value : Pointer(LibGLib::Variant)) : Pointer(LibGLib::Variant)
  fun variant_byteswap = g_variant_byteswap(this : Variant*) : Pointer(LibGLib::Variant)
  fun variant_check_format_string = g_variant_check_format_string(this : Variant*, format_string : Pointer(UInt8), copy_only : LibC::Int) : LibC::Int
  fun variant_classify = g_variant_classify(this : Variant*) : LibGLib::VariantClass
  fun variant_compare = g_variant_compare(this : Variant*, two : Pointer(LibGLib::Variant)) : Int32
  fun variant_dup_bytestring = g_variant_dup_bytestring(this : Variant*, length : UInt64*) : Pointer(UInt8)
  fun variant_dup_bytestring_array = g_variant_dup_bytestring_array(this : Variant*, length : UInt64*) : Pointer(Pointer(UInt8))
  fun variant_dup_objv = g_variant_dup_objv(this : Variant*, length : UInt64*) : Pointer(Pointer(UInt8))
  fun variant_dup_string = g_variant_dup_string(this : Variant*, length : UInt64*) : Pointer(UInt8)
  fun variant_dup_strv = g_variant_dup_strv(this : Variant*, length : UInt64*) : Pointer(Pointer(UInt8))
  fun variant_equal = g_variant_equal(this : Variant*, two : Pointer(LibGLib::Variant)) : LibC::Int
  fun variant_get_boolean = g_variant_get_boolean(this : Variant*) : LibC::Int
  fun variant_get_byte = g_variant_get_byte(this : Variant*) : UInt8
  fun variant_get_bytestring = g_variant_get_bytestring(this : Variant*) : Pointer(UInt8)
  fun variant_get_bytestring_array = g_variant_get_bytestring_array(this : Variant*, length : UInt64*) : Pointer(Pointer(UInt8))
  fun variant_get_child_value = g_variant_get_child_value(this : Variant*, index_ : UInt64) : Pointer(LibGLib::Variant)
  fun variant_get_data = g_variant_get_data(this : Variant*) : Pointer(Void)
  fun variant_get_data_as_bytes = g_variant_get_data_as_bytes(this : Variant*) : Pointer(LibGLib::Bytes)
  fun variant_get_double = g_variant_get_double(this : Variant*) : Float64
  fun variant_get_handle = g_variant_get_handle(this : Variant*) : Int32
  fun variant_get_int16 = g_variant_get_int16(this : Variant*) : Int16
  fun variant_get_int32 = g_variant_get_int32(this : Variant*) : Int32
  fun variant_get_int64 = g_variant_get_int64(this : Variant*) : Int64
  fun variant_get_maybe = g_variant_get_maybe(this : Variant*) : Pointer(LibGLib::Variant)
  fun variant_get_normal_form = g_variant_get_normal_form(this : Variant*) : Pointer(LibGLib::Variant)
  fun variant_get_objv = g_variant_get_objv(this : Variant*, length : UInt64*) : Pointer(Pointer(UInt8))
  fun variant_get_size = g_variant_get_size(this : Variant*) : UInt64
  fun variant_get_string = g_variant_get_string(this : Variant*, length : UInt64*) : Pointer(UInt8)
  fun variant_get_strv = g_variant_get_strv(this : Variant*, length : UInt64*) : Pointer(Pointer(UInt8))
  fun variant_get_type = g_variant_get_type(this : Variant*) : Pointer(LibGLib::VariantType)
  fun variant_get_type_string = g_variant_get_type_string(this : Variant*) : Pointer(UInt8)
  fun variant_get_uint16 = g_variant_get_uint16(this : Variant*) : UInt16
  fun variant_get_uint32 = g_variant_get_uint32(this : Variant*) : UInt32
  fun variant_get_uint64 = g_variant_get_uint64(this : Variant*) : UInt64
  fun variant_get_variant = g_variant_get_variant(this : Variant*) : Pointer(LibGLib::Variant)
  fun variant_hash = g_variant_hash(this : Variant*) : UInt32
  fun variant_is_container = g_variant_is_container(this : Variant*) : LibC::Int
  fun variant_is_floating = g_variant_is_floating(this : Variant*) : LibC::Int
  fun variant_is_normal_form = g_variant_is_normal_form(this : Variant*) : LibC::Int
  fun variant_is_of_type = g_variant_is_of_type(this : Variant*, type : Pointer(LibGLib::VariantType)) : LibC::Int
  fun variant_lookup_value = g_variant_lookup_value(this : Variant*, key : Pointer(UInt8), expected_type : Pointer(LibGLib::VariantType)) : Pointer(LibGLib::Variant)
  fun variant_n_children = g_variant_n_children(this : Variant*) : UInt64
  fun variant_print = g_variant_print(this : Variant*, type_annotate : LibC::Int) : Pointer(UInt8)
  fun variant_ref = g_variant_ref(this : Variant*) : Pointer(LibGLib::Variant)
  fun variant_ref_sink = g_variant_ref_sink(this : Variant*) : Pointer(LibGLib::Variant)
  fun variant_store = g_variant_store(this : Variant*, data : Pointer(Void)) : Void
  fun variant_take_ref = g_variant_take_ref(this : Variant*) : Pointer(LibGLib::Variant)
  fun variant_unref = g_variant_unref(this : Variant*) : Void
  fun variant_is_object_path = g_variant_is_object_path(string : Pointer(UInt8)) : LibC::Int
  fun variant_is_signature = g_variant_is_signature(string : Pointer(UInt8)) : LibC::Int
  fun variant_parse = g_variant_parse(type : Pointer(LibGLib::VariantType), text : Pointer(UInt8), limit : Pointer(UInt8), endptr : Pointer(UInt8), error : LibGLib::Error**) : Pointer(LibGLib::Variant)
  fun variant_parse_error_print_context = g_variant_parse_error_print_context(error : Pointer(LibGLib::Error*), source_str : Pointer(UInt8)) : Pointer(UInt8)
  fun variant_parse_error_quark = g_variant_parse_error_quark : UInt32
  fun variant_parser_get_error_quark = g_variant_parser_get_error_quark : UInt32

  struct VariantBuilder # struct
    _data : UInt8[0]
  end

  fun _g_variant_builder_get_type = g_variant_builder_get_type : UInt64
  fun variant_builder_new = g_variant_builder_new(type : Pointer(LibGLib::VariantType)) : Pointer(LibGLib::VariantBuilder)
  fun variant_builder_add_value = g_variant_builder_add_value(this : VariantBuilder*, value : Pointer(LibGLib::Variant)) : Void
  fun variant_builder_close = g_variant_builder_close(this : VariantBuilder*) : Void
  fun variant_builder_end = g_variant_builder_end(this : VariantBuilder*) : Pointer(LibGLib::Variant)
  fun variant_builder_open = g_variant_builder_open(this : VariantBuilder*, type : Pointer(LibGLib::VariantType)) : Void
  fun variant_builder_ref = g_variant_builder_ref(this : VariantBuilder*) : Pointer(LibGLib::VariantBuilder)
  fun variant_builder_unref = g_variant_builder_unref(this : VariantBuilder*) : Void

  struct VariantDict # struct
    _data : UInt8[0]
  end

  fun _g_variant_dict_get_type = g_variant_dict_get_type : UInt64
  fun variant_dict_new = g_variant_dict_new(from_asv : Pointer(LibGLib::Variant)) : Pointer(LibGLib::VariantDict)
  fun variant_dict_clear = g_variant_dict_clear(this : VariantDict*) : Void
  fun variant_dict_contains = g_variant_dict_contains(this : VariantDict*, key : Pointer(UInt8)) : LibC::Int
  fun variant_dict_end = g_variant_dict_end(this : VariantDict*) : Pointer(LibGLib::Variant)
  fun variant_dict_insert_value = g_variant_dict_insert_value(this : VariantDict*, key : Pointer(UInt8), value : Pointer(LibGLib::Variant)) : Void
  fun variant_dict_lookup_value = g_variant_dict_lookup_value(this : VariantDict*, key : Pointer(UInt8), expected_type : Pointer(LibGLib::VariantType)) : Pointer(LibGLib::Variant)
  fun variant_dict_ref = g_variant_dict_ref(this : VariantDict*) : Pointer(LibGLib::VariantDict)
  fun variant_dict_remove = g_variant_dict_remove(this : VariantDict*, key : Pointer(UInt8)) : LibC::Int
  fun variant_dict_unref = g_variant_dict_unref(this : VariantDict*) : Void

  struct VariantType # struct
    _data : UInt8[0]
  end

  fun _g_variant_type_get_gtype = g_variant_type_get_gtype : UInt64
  fun variant_type_new = g_variant_type_new(type_string : Pointer(UInt8)) : Pointer(LibGLib::VariantType)
  fun variant_type_new_array = g_variant_type_new_array(element : Pointer(LibGLib::VariantType)) : Pointer(LibGLib::VariantType)
  fun variant_type_new_dict_entry = g_variant_type_new_dict_entry(key : Pointer(LibGLib::VariantType), value : Pointer(LibGLib::VariantType)) : Pointer(LibGLib::VariantType)
  fun variant_type_new_maybe = g_variant_type_new_maybe(element : Pointer(LibGLib::VariantType)) : Pointer(LibGLib::VariantType)
  fun variant_type_new_tuple = g_variant_type_new_tuple(items : Pointer(Pointer(LibGLib::VariantType)), length : Int32) : Pointer(LibGLib::VariantType)
  fun variant_type_copy = g_variant_type_copy(this : VariantType*) : Pointer(LibGLib::VariantType)
  fun variant_type_dup_string = g_variant_type_dup_string(this : VariantType*) : Pointer(UInt8)
  fun variant_type_element = g_variant_type_element(this : VariantType*) : Pointer(LibGLib::VariantType)
  fun variant_type_equal = g_variant_type_equal(this : VariantType*, type2 : Pointer(LibGLib::VariantType)) : LibC::Int
  fun variant_type_first = g_variant_type_first(this : VariantType*) : Pointer(LibGLib::VariantType)
  fun variant_type_free = g_variant_type_free(this : VariantType*) : Void
  fun variant_type_get_string_length = g_variant_type_get_string_length(this : VariantType*) : UInt64
  fun variant_type_hash = g_variant_type_hash(this : VariantType*) : UInt32
  fun variant_type_is_array = g_variant_type_is_array(this : VariantType*) : LibC::Int
  fun variant_type_is_basic = g_variant_type_is_basic(this : VariantType*) : LibC::Int
  fun variant_type_is_container = g_variant_type_is_container(this : VariantType*) : LibC::Int
  fun variant_type_is_definite = g_variant_type_is_definite(this : VariantType*) : LibC::Int
  fun variant_type_is_dict_entry = g_variant_type_is_dict_entry(this : VariantType*) : LibC::Int
  fun variant_type_is_maybe = g_variant_type_is_maybe(this : VariantType*) : LibC::Int
  fun variant_type_is_subtype_of = g_variant_type_is_subtype_of(this : VariantType*, supertype : Pointer(LibGLib::VariantType)) : LibC::Int
  fun variant_type_is_tuple = g_variant_type_is_tuple(this : VariantType*) : LibC::Int
  fun variant_type_is_variant = g_variant_type_is_variant(this : VariantType*) : LibC::Int
  fun variant_type_key = g_variant_type_key(this : VariantType*) : Pointer(LibGLib::VariantType)
  fun variant_type_n_items = g_variant_type_n_items(this : VariantType*) : UInt64
  fun variant_type_next = g_variant_type_next(this : VariantType*) : Pointer(LibGLib::VariantType)
  fun variant_type_value = g_variant_type_value(this : VariantType*) : Pointer(LibGLib::VariantType)
  fun variant_type_checked_ = g_variant_type_checked_(arg0 : Pointer(UInt8)) : Pointer(LibGLib::VariantType)
  fun variant_type_string_get_depth_ = g_variant_type_string_get_depth_(type_string : Pointer(UInt8)) : UInt64
  fun variant_type_string_is_valid = g_variant_type_string_is_valid(type_string : Pointer(UInt8)) : LibC::Int
  fun variant_type_string_scan = g_variant_type_string_scan(string : Pointer(UInt8), limit : Pointer(UInt8), endptr : Pointer(UInt8)*) : LibC::Int

  ###########################################
  # #    Flags
  ###########################################

  alias AsciiType = UInt32

  alias FileTest = UInt32

  alias FormatSizeFlags = UInt32

  alias HookFlagMask = UInt32

  alias IOCondition = UInt32

  alias IOFlags = UInt32

  alias KeyFileFlags = UInt32

  alias LogLevelFlags = Int32

  alias MarkupCollectType = UInt32

  alias MarkupParseFlags = UInt32

  alias OptionFlags = UInt32

  alias RegexCompileFlags = UInt32

  alias RegexMatchFlags = UInt32

  alias SpawnFlags = UInt32

  alias TestSubprocessFlags = UInt32

  alias TestTrapFlags = UInt32

  alias TraverseFlags = UInt32

  ###########################################
  # #    Enums
  ###########################################

  alias BookmarkFileError = UInt32

  alias ChecksumType = UInt32

  alias ConvertError = UInt32

  alias DateDMY = UInt32

  alias DateMonth = UInt32

  alias DateWeekday = UInt32

  alias ErrorType = UInt32

  alias FileError = UInt32

  alias IOChannelError = UInt32

  alias IOError = UInt32

  alias IOStatus = UInt32

  alias KeyFileError = UInt32

  alias LogWriterOutput = UInt32

  alias MarkupError = UInt32

  alias NormalizeMode = UInt32

  alias NumberParserError = UInt32

  alias OnceStatus = UInt32

  alias OptionArg = UInt32

  alias OptionError = UInt32

  alias RegexError = UInt32

  alias SeekType = UInt32

  alias ShellError = UInt32

  alias SliceConfig = UInt32

  alias SpawnError = UInt32

  alias TestFileType = UInt32

  alias TestLogType = UInt32

  alias TestResult = UInt32

  alias ThreadError = UInt32

  alias TimeType = UInt32

  alias TokenType = UInt32

  alias TraverseType = UInt32

  alias UnicodeBreakType = UInt32

  alias UnicodeScript = Int32

  alias UnicodeType = UInt32

  alias UserDirectory = UInt32

  alias VariantClass = UInt32

  alias VariantParseError = UInt32

  ###########################################
  # #    Unions
  ###########################################

  union DoubleIEEE754
    v_double : Float64
  end

  union FloatIEEE754
    v_float : Float32
  end

  union Mutex
    p : Pointer(Void)
    i : UInt32[2]
  end

  fun mutex_clear = g_mutex_clear(this : Mutex*) : Void
  fun mutex_init = g_mutex_init(this : Mutex*) : Void
  fun mutex_lock = g_mutex_lock(this : Mutex*) : Void
  fun mutex_trylock = g_mutex_trylock(this : Mutex*) : LibC::Int
  fun mutex_unlock = g_mutex_unlock(this : Mutex*) : Void

  union TokenValue
    v_symbol : Pointer(Void)
    v_identifier : Pointer(UInt8)
    v_binary : UInt64
    v_octal : UInt64
    v_int : UInt64
    v_int64 : UInt64
    v_float : Float64
    v_hex : UInt64
    v_string : Pointer(UInt8)
    v_comment : Pointer(UInt8)
    v_char : UInt8
    v_error : UInt32
  end

  ###########################################
  # #    Functions
  ###########################################
  fun access = g_access(filename : Pointer(UInt8), mode : Int32) : Int32
  fun ascii_digit_value = g_ascii_digit_value(c : Int8) : Int32
  fun ascii_dtostr = g_ascii_dtostr(buffer : Pointer(UInt8), buf_len : Int32, d : Float64) : Pointer(UInt8)
  fun ascii_formatd = g_ascii_formatd(buffer : Pointer(UInt8), buf_len : Int32, format : Pointer(UInt8), d : Float64) : Pointer(UInt8)
  fun ascii_strcasecmp = g_ascii_strcasecmp(s1 : Pointer(UInt8), s2 : Pointer(UInt8)) : Int32
  fun ascii_strdown = g_ascii_strdown(str : Pointer(UInt8), len : Int64) : Pointer(UInt8)
  fun ascii_string_to_signed = g_ascii_string_to_signed(str : Pointer(UInt8), base : UInt32, min : Int64, max : Int64, out_num : Int64*, error : LibGLib::Error**) : LibC::Int
  fun ascii_string_to_unsigned = g_ascii_string_to_unsigned(str : Pointer(UInt8), base : UInt32, min : UInt64, max : UInt64, out_num : UInt64*, error : LibGLib::Error**) : LibC::Int
  fun ascii_strncasecmp = g_ascii_strncasecmp(s1 : Pointer(UInt8), s2 : Pointer(UInt8), n : UInt64) : Int32
  fun ascii_strtod = g_ascii_strtod(nptr : Pointer(UInt8), endptr : Pointer(UInt8)*) : Float64
  fun ascii_strtoll = g_ascii_strtoll(nptr : Pointer(UInt8), endptr : Pointer(UInt8)*, base : UInt32) : Int64
  fun ascii_strtoull = g_ascii_strtoull(nptr : Pointer(UInt8), endptr : Pointer(UInt8)*, base : UInt32) : UInt64
  fun ascii_strup = g_ascii_strup(str : Pointer(UInt8), len : Int64) : Pointer(UInt8)
  fun ascii_tolower = g_ascii_tolower(c : Int8) : Int8
  fun ascii_toupper = g_ascii_toupper(c : Int8) : Int8
  fun ascii_xdigit_value = g_ascii_xdigit_value(c : Int8) : Int32
  fun assert_warning = g_assert_warning(log_domain : Pointer(UInt8), file : Pointer(UInt8), line : Int32, pretty_function : Pointer(UInt8), expression : Pointer(UInt8)) : Void
  fun assertion_message = g_assertion_message(domain : Pointer(UInt8), file : Pointer(UInt8), line : Int32, func : Pointer(UInt8), message : Pointer(UInt8)) : Void
  fun assertion_message_cmpstr = g_assertion_message_cmpstr(domain : Pointer(UInt8), file : Pointer(UInt8), line : Int32, func : Pointer(UInt8), expr : Pointer(UInt8), arg1 : Pointer(UInt8), cmp : Pointer(UInt8), arg2 : Pointer(UInt8)) : Void
  fun assertion_message_error = g_assertion_message_error(domain : Pointer(UInt8), file : Pointer(UInt8), line : Int32, func : Pointer(UInt8), expr : Pointer(UInt8), error : Pointer(LibGLib::Error*), error_domain : UInt32, error_code : Int32) : Void
  fun atexit = g_atexit(func : LibGLib::VoidFunc) : Void
  fun atomic_int_add = g_atomic_int_add(atomic : Pointer(Int32), val : Int32) : Int32
  fun atomic_int_and = g_atomic_int_and(atomic : Pointer(UInt32), val : UInt32) : UInt32
  fun atomic_int_compare_and_exchange = g_atomic_int_compare_and_exchange(atomic : Pointer(Int32), oldval : Int32, newval : Int32) : LibC::Int
  fun atomic_int_dec_and_test = g_atomic_int_dec_and_test(atomic : Pointer(Int32)) : LibC::Int
  fun atomic_int_exchange_and_add = g_atomic_int_exchange_and_add(atomic : Pointer(Int32), val : Int32) : Int32
  fun atomic_int_get = g_atomic_int_get(atomic : Pointer(Int32)) : Int32
  fun atomic_int_inc = g_atomic_int_inc(atomic : Pointer(Int32)) : Void
  fun atomic_int_or = g_atomic_int_or(atomic : Pointer(UInt32), val : UInt32) : UInt32
  fun atomic_int_set = g_atomic_int_set(atomic : Pointer(Int32), newval : Int32) : Void
  fun atomic_int_xor = g_atomic_int_xor(atomic : Pointer(UInt32), val : UInt32) : UInt32
  fun atomic_pointer_add = g_atomic_pointer_add(atomic : Pointer(Void), val : Int64) : Int64
  fun atomic_pointer_and = g_atomic_pointer_and(atomic : Pointer(Void), val : UInt64) : UInt64
  fun atomic_pointer_compare_and_exchange = g_atomic_pointer_compare_and_exchange(atomic : Pointer(Void), oldval : Pointer(Void), newval : Pointer(Void)) : LibC::Int
  fun atomic_pointer_get = g_atomic_pointer_get(atomic : Pointer(Void)) : Pointer(Void)
  fun atomic_pointer_or = g_atomic_pointer_or(atomic : Pointer(Void), val : UInt64) : UInt64
  fun atomic_pointer_set = g_atomic_pointer_set(atomic : Pointer(Void), newval : Pointer(Void)) : Void
  fun atomic_pointer_xor = g_atomic_pointer_xor(atomic : Pointer(Void), val : UInt64) : UInt64
  fun atomic_rc_box_acquire = g_atomic_rc_box_acquire(mem_block : Pointer(Void)) : Pointer(Void)
  fun atomic_rc_box_alloc = g_atomic_rc_box_alloc(block_size : UInt64) : Pointer(Void)
  fun atomic_rc_box_alloc0 = g_atomic_rc_box_alloc0(block_size : UInt64) : Pointer(Void)
  fun atomic_rc_box_dup = g_atomic_rc_box_dup(block_size : UInt64, mem_block : Pointer(Void)) : Pointer(Void)
  fun atomic_rc_box_get_size = g_atomic_rc_box_get_size(mem_block : Pointer(Void)) : UInt64
  fun atomic_rc_box_release = g_atomic_rc_box_release(mem_block : Pointer(Void)) : Void
  fun atomic_rc_box_release_full = g_atomic_rc_box_release_full(mem_block : Pointer(Void), clear_func : LibGLib::DestroyNotify) : Void
  fun atomic_ref_count_compare = g_atomic_ref_count_compare(arc : Pointer(Int32), val : Int32) : LibC::Int
  fun atomic_ref_count_dec = g_atomic_ref_count_dec(arc : Pointer(Int32)) : LibC::Int
  fun atomic_ref_count_inc = g_atomic_ref_count_inc(arc : Pointer(Int32)) : Void
  fun atomic_ref_count_init = g_atomic_ref_count_init(arc : Pointer(Int32)) : Void
  fun base64_decode = g_base64_decode(text : Pointer(UInt8), out_len : UInt64*) : Pointer(UInt8)
  fun base64_decode_inplace = g_base64_decode_inplace(text : Pointer(UInt8)*, out_len : UInt64*) : Pointer(UInt8)
  fun base64_encode = g_base64_encode(data : Pointer(UInt8), len : UInt64) : Pointer(UInt8)
  fun base64_encode_close = g_base64_encode_close(break_lines : LibC::Int, _out : Pointer(UInt8)*, state : Int32*, save : Int32*) : UInt64
  fun base64_encode_step = g_base64_encode_step(_in : Pointer(UInt8), len : UInt64, break_lines : LibC::Int, _out : Pointer(UInt8)*, state : Int32*, save : Int32*) : UInt64
  fun basename = g_basename(file_name : Pointer(UInt8)) : Pointer(UInt8)
  fun bit_lock = g_bit_lock(address : Pointer(Int32), lock_bit : Int32) : Void
  fun bit_nth_lsf = g_bit_nth_lsf(mask : UInt64, nth_bit : Int32) : Int32
  fun bit_nth_msf = g_bit_nth_msf(mask : UInt64, nth_bit : Int32) : Int32
  fun bit_storage = g_bit_storage(number : UInt64) : UInt32
  fun bit_trylock = g_bit_trylock(address : Pointer(Int32), lock_bit : Int32) : LibC::Int
  fun bit_unlock = g_bit_unlock(address : Pointer(Int32), lock_bit : Int32) : Void
  fun bookmark_file_error_quark = g_bookmark_file_error_quark : UInt32
  fun build_filenamev = g_build_filenamev(args : Pointer(Pointer(UInt8))) : Pointer(UInt8)
  fun build_pathv = g_build_pathv(separator : Pointer(UInt8), args : Pointer(Pointer(UInt8))) : Pointer(UInt8)
  fun byte_array_free = g_byte_array_free(array : Pointer(Void), free_segment : LibC::Int) : Pointer(UInt8)
  fun byte_array_free_to_bytes = g_byte_array_free_to_bytes(array : Pointer(Void)) : Pointer(LibGLib::Bytes)
  fun byte_array_new = g_byte_array_new : Pointer(Void)
  fun byte_array_new_take = g_byte_array_new_take(data : Pointer(UInt8), len : UInt64) : Pointer(Void)
  fun byte_array_steal = g_byte_array_steal(array : Pointer(Void), len : UInt64*) : Pointer(UInt8)
  fun byte_array_unref = g_byte_array_unref(array : Pointer(Void)) : Void
  fun canonicalize_filename = g_canonicalize_filename(filename : Pointer(UInt8), relative_to : Pointer(UInt8)) : Pointer(UInt8)
  fun chdir = g_chdir(path : Pointer(UInt8)) : Int32
  fun check_version = glib_check_version(required_major : UInt32, required_minor : UInt32, required_micro : UInt32) : Pointer(UInt8)
  fun checksum_type_get_length = g_checksum_type_get_length(checksum_type : LibGLib::ChecksumType) : Int64
  fun child_watch_add = g_child_watch_add_full(priority : Int32, pid : Int32, function : LibGLib::ChildWatchFunc, data : Pointer(Void), notify : LibGLib::DestroyNotify) : UInt32
  fun child_watch_source_new = g_child_watch_source_new(pid : Int32) : Pointer(LibGLib::Source)
  fun clear_error = g_clear_error(error : LibGLib::Error**) : Void
  fun close = g_close(fd : Int32, error : LibGLib::Error**) : LibC::Int
  fun compute_checksum_for_bytes = g_compute_checksum_for_bytes(checksum_type : LibGLib::ChecksumType, data : Pointer(LibGLib::Bytes)) : Pointer(UInt8)
  fun compute_checksum_for_data = g_compute_checksum_for_data(checksum_type : LibGLib::ChecksumType, data : Pointer(UInt8), length : UInt64) : Pointer(UInt8)
  fun compute_checksum_for_string = g_compute_checksum_for_string(checksum_type : LibGLib::ChecksumType, str : Pointer(UInt8), length : Int64) : Pointer(UInt8)
  fun compute_hmac_for_bytes = g_compute_hmac_for_bytes(digest_type : LibGLib::ChecksumType, key : Pointer(LibGLib::Bytes), data : Pointer(LibGLib::Bytes)) : Pointer(UInt8)
  fun compute_hmac_for_data = g_compute_hmac_for_data(digest_type : LibGLib::ChecksumType, key : Pointer(UInt8), key_len : UInt64, data : Pointer(UInt8), length : UInt64) : Pointer(UInt8)
  fun compute_hmac_for_string = g_compute_hmac_for_string(digest_type : LibGLib::ChecksumType, key : Pointer(UInt8), key_len : UInt64, str : Pointer(UInt8), length : Int64) : Pointer(UInt8)
  fun convert = g_convert(str : Pointer(UInt8), len : Int64, to_codeset : Pointer(UInt8), from_codeset : Pointer(UInt8), bytes_read : UInt64*, bytes_written : UInt64*, error : LibGLib::Error**) : Pointer(UInt8)
  fun convert_error_quark = g_convert_error_quark : UInt32
  fun convert_with_fallback = g_convert_with_fallback(str : Pointer(UInt8), len : Int64, to_codeset : Pointer(UInt8), from_codeset : Pointer(UInt8), fallback : Pointer(UInt8), bytes_read : UInt64*, bytes_written : UInt64*, error : LibGLib::Error**) : Pointer(UInt8)
  fun datalist_foreach = g_datalist_foreach(datalist : Pointer(LibGLib::Data), func : LibGLib::DataForeachFunc, user_data : Pointer(Void)) : Void
  fun datalist_get_data = g_datalist_get_data(datalist : Pointer(LibGLib::Data), key : Pointer(UInt8)) : Pointer(Void)
  fun datalist_get_flags = g_datalist_get_flags(datalist : Pointer(LibGLib::Data)) : UInt32
  fun datalist_id_get_data = g_datalist_id_get_data(datalist : Pointer(LibGLib::Data), key_id : UInt32) : Pointer(Void)
  fun datalist_set_flags = g_datalist_set_flags(datalist : Pointer(LibGLib::Data), flags : UInt32) : Void
  fun datalist_unset_flags = g_datalist_unset_flags(datalist : Pointer(LibGLib::Data), flags : UInt32) : Void
  fun dataset_destroy = g_dataset_destroy(dataset_location : Pointer(Void)) : Void
  fun dataset_foreach = g_dataset_foreach(dataset_location : Pointer(Void), func : LibGLib::DataForeachFunc, user_data : Pointer(Void)) : Void
  fun dataset_id_get_data = g_dataset_id_get_data(dataset_location : Pointer(Void), key_id : UInt32) : Pointer(Void)
  fun date_get_days_in_month = g_date_get_days_in_month(month : LibGLib::DateMonth, year : UInt16) : UInt8
  fun date_get_monday_weeks_in_year = g_date_get_monday_weeks_in_year(year : UInt16) : UInt8
  fun date_get_sunday_weeks_in_year = g_date_get_sunday_weeks_in_year(year : UInt16) : UInt8
  fun date_is_leap_year = g_date_is_leap_year(year : UInt16) : LibC::Int
  fun date_strftime = g_date_strftime(s : Pointer(UInt8), slen : UInt64, format : Pointer(UInt8), date : Pointer(LibGLib::Date)) : UInt64
  fun date_time_compare = g_date_time_compare(dt1 : Pointer(Void), dt2 : Pointer(Void)) : Int32
  fun date_time_equal = g_date_time_equal(dt1 : Pointer(Void), dt2 : Pointer(Void)) : LibC::Int
  fun date_time_hash = g_date_time_hash(datetime : Pointer(Void)) : UInt32
  fun date_valid_day = g_date_valid_day(day : UInt8) : LibC::Int
  fun date_valid_dmy = g_date_valid_dmy(day : UInt8, month : LibGLib::DateMonth, year : UInt16) : LibC::Int
  fun date_valid_julian = g_date_valid_julian(julian_date : UInt32) : LibC::Int
  fun date_valid_month = g_date_valid_month(month : LibGLib::DateMonth) : LibC::Int
  fun date_valid_weekday = g_date_valid_weekday(weekday : LibGLib::DateWeekday) : LibC::Int
  fun date_valid_year = g_date_valid_year(year : UInt16) : LibC::Int
  fun dcgettext = g_dcgettext(domain : Pointer(UInt8), msgid : Pointer(UInt8), category : Int32) : Pointer(UInt8)
  fun dgettext = g_dgettext(domain : Pointer(UInt8), msgid : Pointer(UInt8)) : Pointer(UInt8)
  fun dir_make_tmp = g_dir_make_tmp(tmpl : Pointer(UInt8), error : LibGLib::Error**) : Pointer(UInt8)
  fun direct_equal = g_direct_equal(v1 : Pointer(Void), v2 : Pointer(Void)) : LibC::Int
  fun direct_hash = g_direct_hash(v : Pointer(Void)) : UInt32
  fun dngettext = g_dngettext(domain : Pointer(UInt8), msgid : Pointer(UInt8), msgid_plural : Pointer(UInt8), n : UInt64) : Pointer(UInt8)
  fun double_equal = g_double_equal(v1 : Pointer(Void), v2 : Pointer(Void)) : LibC::Int
  fun double_hash = g_double_hash(v : Pointer(Void)) : UInt32
  fun dpgettext = g_dpgettext(domain : Pointer(UInt8), msgctxtid : Pointer(UInt8), msgidoffset : UInt64) : Pointer(UInt8)
  fun dpgettext2 = g_dpgettext2(domain : Pointer(UInt8), context : Pointer(UInt8), msgid : Pointer(UInt8)) : Pointer(UInt8)
  fun environ_getenv = g_environ_getenv(envp : Pointer(Pointer(UInt8)), variable : Pointer(UInt8)) : Pointer(UInt8)
  fun environ_setenv = g_environ_setenv(envp : Pointer(Pointer(UInt8)), variable : Pointer(UInt8), value : Pointer(UInt8), overwrite : LibC::Int) : Pointer(Pointer(UInt8))
  fun environ_unsetenv = g_environ_unsetenv(envp : Pointer(Pointer(UInt8)), variable : Pointer(UInt8)) : Pointer(Pointer(UInt8))
  fun file_error_from_errno = g_file_error_from_errno(err_no : Int32) : LibGLib::FileError
  fun file_error_quark = g_file_error_quark : UInt32
  fun file_get_contents = g_file_get_contents(filename : Pointer(UInt8), contents : Pointer(UInt8)*, length : UInt64*, error : LibGLib::Error**) : LibC::Int
  fun file_open_tmp = g_file_open_tmp(tmpl : Pointer(UInt8), name_used : Pointer(UInt8)*, error : LibGLib::Error**) : Int32
  fun file_read_link = g_file_read_link(filename : Pointer(UInt8), error : LibGLib::Error**) : Pointer(UInt8)
  fun file_set_contents = g_file_set_contents(filename : Pointer(UInt8), contents : Pointer(UInt8), length : Int64, error : LibGLib::Error**) : LibC::Int
  fun file_test = g_file_test(filename : Pointer(UInt8), test : LibGLib::FileTest) : LibC::Int
  fun filename_display_basename = g_filename_display_basename(filename : Pointer(UInt8)) : Pointer(UInt8)
  fun filename_display_name = g_filename_display_name(filename : Pointer(UInt8)) : Pointer(UInt8)
  fun filename_from_uri = g_filename_from_uri(uri : Pointer(UInt8), hostname : Pointer(UInt8)*, error : LibGLib::Error**) : Pointer(UInt8)
  fun filename_from_utf8 = g_filename_from_utf8(utf8string : Pointer(UInt8), len : Int64, bytes_read : UInt64*, bytes_written : UInt64*, error : LibGLib::Error**) : Pointer(UInt8)
  fun filename_to_uri = g_filename_to_uri(filename : Pointer(UInt8), hostname : Pointer(UInt8), error : LibGLib::Error**) : Pointer(UInt8)
  fun filename_to_utf8 = g_filename_to_utf8(opsysstring : Pointer(UInt8), len : Int64, bytes_read : UInt64*, bytes_written : UInt64*, error : LibGLib::Error**) : Pointer(UInt8)
  fun find_program_in_path = g_find_program_in_path(program : Pointer(UInt8)) : Pointer(UInt8)
  fun format_size = g_format_size(size : UInt64) : Pointer(UInt8)
  fun format_size_for_display = g_format_size_for_display(size : Int64) : Pointer(UInt8)
  fun format_size_full = g_format_size_full(size : UInt64, flags : LibGLib::FormatSizeFlags) : Pointer(UInt8)
  fun free = g_free(mem : Pointer(Void)) : Void
  fun get_application_name = g_get_application_name : Pointer(UInt8)
  fun get_charset = g_get_charset(charset : Pointer(UInt8)*) : LibC::Int
  fun get_codeset = g_get_codeset : Pointer(UInt8)
  fun get_console_charset = g_get_console_charset(charset : Pointer(UInt8)*) : LibC::Int
  fun get_current_dir = g_get_current_dir : Pointer(UInt8)
  fun get_current_time = g_get_current_time(result : Pointer(LibGLib::TimeVal)) : Void
  fun get_environ = g_get_environ : Pointer(Pointer(UInt8))
  fun get_filename_charsets = g_get_filename_charsets(filename_charsets : Pointer(Pointer(UInt8))*) : LibC::Int
  fun get_home_dir = g_get_home_dir : Pointer(UInt8)
  fun get_host_name = g_get_host_name : Pointer(UInt8)
  fun get_language_names = g_get_language_names : Pointer(Pointer(UInt8))
  fun get_language_names_with_category = g_get_language_names_with_category(category_name : Pointer(UInt8)) : Pointer(Pointer(UInt8))
  fun get_locale_variants = g_get_locale_variants(locale : Pointer(UInt8)) : Pointer(Pointer(UInt8))
  fun get_monotonic_time = g_get_monotonic_time : Int64
  fun get_num_processors = g_get_num_processors : UInt32
  fun get_os_info = g_get_os_info(key_name : Pointer(UInt8)) : Pointer(UInt8)
  fun get_prgname = g_get_prgname : Pointer(UInt8)
  fun get_real_name = g_get_real_name : Pointer(UInt8)
  fun get_real_time = g_get_real_time : Int64
  fun get_system_config_dirs = g_get_system_config_dirs : Pointer(Pointer(UInt8))
  fun get_system_data_dirs = g_get_system_data_dirs : Pointer(Pointer(UInt8))
  fun get_tmp_dir = g_get_tmp_dir : Pointer(UInt8)
  fun get_user_cache_dir = g_get_user_cache_dir : Pointer(UInt8)
  fun get_user_config_dir = g_get_user_config_dir : Pointer(UInt8)
  fun get_user_data_dir = g_get_user_data_dir : Pointer(UInt8)
  fun get_user_name = g_get_user_name : Pointer(UInt8)
  fun get_user_runtime_dir = g_get_user_runtime_dir : Pointer(UInt8)
  fun get_user_special_dir = g_get_user_special_dir(directory : LibGLib::UserDirectory) : Pointer(UInt8)
  fun getenv = g_getenv(variable : Pointer(UInt8)) : Pointer(UInt8)
  fun hash_table_add = g_hash_table_add(hash_table : Pointer(Void*), key : Pointer(Void)) : LibC::Int
  fun hash_table_contains = g_hash_table_contains(hash_table : Pointer(Void*), key : Pointer(Void)) : LibC::Int
  fun hash_table_destroy = g_hash_table_destroy(hash_table : Pointer(Void*)) : Void
  fun hash_table_insert = g_hash_table_insert(hash_table : Pointer(Void*), key : Pointer(Void), value : Pointer(Void)) : LibC::Int
  fun hash_table_lookup = g_hash_table_lookup(hash_table : Pointer(Void*), key : Pointer(Void)) : Pointer(Void)
  fun hash_table_lookup_extended = g_hash_table_lookup_extended(hash_table : Pointer(Void*), lookup_key : Pointer(Void), orig_key : Pointer(Void)*, value : Pointer(Void)*) : LibC::Int
  fun hash_table_remove = g_hash_table_remove(hash_table : Pointer(Void*), key : Pointer(Void)) : LibC::Int
  fun hash_table_remove_all = g_hash_table_remove_all(hash_table : Pointer(Void*)) : Void
  fun hash_table_replace = g_hash_table_replace(hash_table : Pointer(Void*), key : Pointer(Void), value : Pointer(Void)) : LibC::Int
  fun hash_table_size = g_hash_table_size(hash_table : Pointer(Void*)) : UInt32
  fun hash_table_steal = g_hash_table_steal(hash_table : Pointer(Void*), key : Pointer(Void)) : LibC::Int
  fun hash_table_steal_all = g_hash_table_steal_all(hash_table : Pointer(Void*)) : Void
  fun hash_table_steal_extended = g_hash_table_steal_extended(hash_table : Pointer(Void*), lookup_key : Pointer(Void), stolen_key : Pointer(Void)*, stolen_value : Pointer(Void)*) : LibC::Int
  fun hash_table_unref = g_hash_table_unref(hash_table : Pointer(Void*)) : Void
  fun hook_destroy = g_hook_destroy(hook_list : Pointer(LibGLib::HookList), hook_id : UInt64) : LibC::Int
  fun hook_destroy_link = g_hook_destroy_link(hook_list : Pointer(LibGLib::HookList), hook : Pointer(LibGLib::Hook)) : Void
  fun hook_free = g_hook_free(hook_list : Pointer(LibGLib::HookList), hook : Pointer(LibGLib::Hook)) : Void
  fun hook_insert_before = g_hook_insert_before(hook_list : Pointer(LibGLib::HookList), sibling : Pointer(LibGLib::Hook), hook : Pointer(LibGLib::Hook)) : Void
  fun hook_prepend = g_hook_prepend(hook_list : Pointer(LibGLib::HookList), hook : Pointer(LibGLib::Hook)) : Void
  fun hook_unref = g_hook_unref(hook_list : Pointer(LibGLib::HookList), hook : Pointer(LibGLib::Hook)) : Void
  fun hostname_is_ascii_encoded = g_hostname_is_ascii_encoded(hostname : Pointer(UInt8)) : LibC::Int
  fun hostname_is_ip_address = g_hostname_is_ip_address(hostname : Pointer(UInt8)) : LibC::Int
  fun hostname_is_non_ascii = g_hostname_is_non_ascii(hostname : Pointer(UInt8)) : LibC::Int
  fun hostname_to_ascii = g_hostname_to_ascii(hostname : Pointer(UInt8)) : Pointer(UInt8)
  fun hostname_to_unicode = g_hostname_to_unicode(hostname : Pointer(UInt8)) : Pointer(UInt8)
  fun idle_add = g_idle_add_full(priority : Int32, function : LibGLib::SourceFunc, data : Pointer(Void), notify : LibGLib::DestroyNotify) : UInt32
  fun idle_remove_by_data = g_idle_remove_by_data(data : Pointer(Void)) : LibC::Int
  fun idle_source_new = g_idle_source_new : Pointer(LibGLib::Source)
  fun int64_equal = g_int64_equal(v1 : Pointer(Void), v2 : Pointer(Void)) : LibC::Int
  fun int64_hash = g_int64_hash(v : Pointer(Void)) : UInt32
  fun int_equal = g_int_equal(v1 : Pointer(Void), v2 : Pointer(Void)) : LibC::Int
  fun int_hash = g_int_hash(v : Pointer(Void)) : UInt32
  fun intern_static_string = g_intern_static_string(string : Pointer(UInt8)) : Pointer(UInt8)
  fun intern_string = g_intern_string(string : Pointer(UInt8)) : Pointer(UInt8)
  fun io_add_watch = g_io_add_watch_full(channel : Pointer(LibGLib::IOChannel), priority : Int32, condition : LibGLib::IOCondition, func : LibGLib::IOFunc, user_data : Pointer(Void), notify : LibGLib::DestroyNotify) : UInt32
  fun io_channel_error_from_errno = g_io_channel_error_from_errno(en : Int32) : LibGLib::IOChannelError
  fun io_channel_error_quark = g_io_channel_error_quark : UInt32
  fun io_create_watch = g_io_create_watch(channel : Pointer(LibGLib::IOChannel), condition : LibGLib::IOCondition) : Pointer(LibGLib::Source)
  fun key_file_error_quark = g_key_file_error_quark : UInt32
  fun listenv = g_listenv : Pointer(Pointer(UInt8))
  fun locale_from_utf8 = g_locale_from_utf8(utf8string : Pointer(UInt8), len : Int64, bytes_read : UInt64*, bytes_written : UInt64*, error : LibGLib::Error**) : Pointer(UInt8)
  fun locale_to_utf8 = g_locale_to_utf8(opsysstring : Pointer(UInt8), len : Int64, bytes_read : UInt64*, bytes_written : UInt64*, error : LibGLib::Error**) : Pointer(UInt8)
  fun log_default_handler = g_log_default_handler(log_domain : Pointer(UInt8), log_level : LibGLib::LogLevelFlags, message : Pointer(UInt8), unused_data : Pointer(Void)) : Void
  fun log_remove_handler = g_log_remove_handler(log_domain : Pointer(UInt8), handler_id : UInt32) : Void
  fun log_set_always_fatal = g_log_set_always_fatal(fatal_mask : LibGLib::LogLevelFlags) : LibGLib::LogLevelFlags
  fun log_set_fatal_mask = g_log_set_fatal_mask(log_domain : Pointer(UInt8), fatal_mask : LibGLib::LogLevelFlags) : LibGLib::LogLevelFlags
  fun log_set_handler = g_log_set_handler_full(log_domain : Pointer(UInt8), log_levels : LibGLib::LogLevelFlags, log_func : LibGLib::LogFunc, user_data : Pointer(Void), destroy : LibGLib::DestroyNotify) : UInt32
  fun log_set_writer_func = g_log_set_writer_func(func : LibGLib::LogWriterFunc, user_data : Pointer(Void), user_data_free : LibGLib::DestroyNotify) : Void
  fun log_structured_array = g_log_structured_array(log_level : LibGLib::LogLevelFlags, fields : Pointer(LibGLib::LogField), n_fields : UInt64) : Void
  fun log_variant = g_log_variant(log_domain : Pointer(UInt8), log_level : LibGLib::LogLevelFlags, fields : Pointer(LibGLib::Variant)) : Void
  fun log_writer_default = g_log_writer_default(log_level : LibGLib::LogLevelFlags, fields : Pointer(LibGLib::LogField), n_fields : UInt64, user_data : Pointer(Void)) : LibGLib::LogWriterOutput
  fun log_writer_format_fields = g_log_writer_format_fields(log_level : LibGLib::LogLevelFlags, fields : Pointer(LibGLib::LogField), n_fields : UInt64, use_color : LibC::Int) : Pointer(UInt8)
  fun log_writer_is_journald = g_log_writer_is_journald(output_fd : Int32) : LibC::Int
  fun log_writer_journald = g_log_writer_journald(log_level : LibGLib::LogLevelFlags, fields : Pointer(LibGLib::LogField), n_fields : UInt64, user_data : Pointer(Void)) : LibGLib::LogWriterOutput
  fun log_writer_standard_streams = g_log_writer_standard_streams(log_level : LibGLib::LogLevelFlags, fields : Pointer(LibGLib::LogField), n_fields : UInt64, user_data : Pointer(Void)) : LibGLib::LogWriterOutput
  fun log_writer_supports_color = g_log_writer_supports_color(output_fd : Int32) : LibC::Int
  fun main_context_default = g_main_context_default : Pointer(LibGLib::MainContext)
  fun main_context_get_thread_default = g_main_context_get_thread_default : Pointer(LibGLib::MainContext)
  fun main_context_ref_thread_default = g_main_context_ref_thread_default : Pointer(LibGLib::MainContext)
  fun main_current_source = g_main_current_source : Pointer(LibGLib::Source)
  fun main_depth = g_main_depth : Int32
  fun malloc = g_malloc(n_bytes : UInt64) : Pointer(Void)
  fun malloc0 = g_malloc0(n_bytes : UInt64) : Pointer(Void)
  fun malloc0_n = g_malloc0_n(n_blocks : UInt64, n_block_bytes : UInt64) : Pointer(Void)
  fun malloc_n = g_malloc_n(n_blocks : UInt64, n_block_bytes : UInt64) : Pointer(Void)
  fun markup_error_quark = g_markup_error_quark : UInt32
  fun markup_escape_text = g_markup_escape_text(text : Pointer(UInt8), length : Int64) : Pointer(UInt8)
  fun mem_is_system_malloc = g_mem_is_system_malloc : LibC::Int
  fun mem_profile = g_mem_profile : Void
  fun mem_set_vtable = g_mem_set_vtable(vtable : Pointer(LibGLib::MemVTable)) : Void
  fun memdup = g_memdup(mem : Pointer(Void), byte_size : UInt32) : Pointer(Void)
  fun mkdir_with_parents = g_mkdir_with_parents(pathname : Pointer(UInt8), mode : Int32) : Int32
  fun nullify_pointer = g_nullify_pointer(nullify_location : Pointer(Void)) : Void
  fun number_parser_error_quark = g_number_parser_error_quark : UInt32
  fun on_error_query = g_on_error_query(prg_name : Pointer(UInt8)) : Void
  fun on_error_stack_trace = g_on_error_stack_trace(prg_name : Pointer(UInt8)) : Void
  fun once_init_enter = g_once_init_enter(location : Pointer(Void)) : LibC::Int
  fun once_init_leave = g_once_init_leave(location : Pointer(Void), result : UInt64) : Void
  fun option_error_quark = g_option_error_quark : UInt32
  fun parse_debug_string = g_parse_debug_string(string : Pointer(UInt8), keys : Pointer(LibGLib::DebugKey), nkeys : UInt32) : UInt32
  fun path_get_basename = g_path_get_basename(file_name : Pointer(UInt8)) : Pointer(UInt8)
  fun path_get_dirname = g_path_get_dirname(file_name : Pointer(UInt8)) : Pointer(UInt8)
  fun path_is_absolute = g_path_is_absolute(file_name : Pointer(UInt8)) : LibC::Int
  fun path_skip_root = g_path_skip_root(file_name : Pointer(UInt8)) : Pointer(UInt8)
  fun pattern_match = g_pattern_match(pspec : Pointer(LibGLib::PatternSpec), string_length : UInt32, string : Pointer(UInt8), string_reversed : Pointer(UInt8)) : LibC::Int
  fun pattern_match_simple = g_pattern_match_simple(pattern : Pointer(UInt8), string : Pointer(UInt8)) : LibC::Int
  fun pattern_match_string = g_pattern_match_string(pspec : Pointer(LibGLib::PatternSpec), string : Pointer(UInt8)) : LibC::Int
  fun pointer_bit_lock = g_pointer_bit_lock(address : Pointer(Void), lock_bit : Int32) : Void
  fun pointer_bit_trylock = g_pointer_bit_trylock(address : Pointer(Void), lock_bit : Int32) : LibC::Int
  fun pointer_bit_unlock = g_pointer_bit_unlock(address : Pointer(Void), lock_bit : Int32) : Void
  fun poll = g_poll(fds : Pointer(LibGLib::PollFD), nfds : UInt32, timeout : Int32) : Int32
  fun propagate_error = g_propagate_error(dest : Pointer(LibGLib::Error*)*, src : Pointer(LibGLib::Error*)) : Void
  fun quark_from_static_string = g_quark_from_static_string(string : Pointer(UInt8)) : UInt32
  fun quark_from_string = g_quark_from_string(string : Pointer(UInt8)) : UInt32
  fun quark_to_string = g_quark_to_string(quark : UInt32) : Pointer(UInt8)
  fun quark_try_string = g_quark_try_string(string : Pointer(UInt8)) : UInt32
  fun random_double = g_random_double : Float64
  fun random_double_range = g_random_double_range(_begin : Float64, _end : Float64) : Float64
  fun random_int = g_random_int : UInt32
  fun random_int_range = g_random_int_range(_begin : Int32, _end : Int32) : Int32
  fun random_set_seed = g_random_set_seed(seed : UInt32) : Void
  fun rc_box_acquire = g_rc_box_acquire(mem_block : Pointer(Void)) : Pointer(Void)
  fun rc_box_alloc = g_rc_box_alloc(block_size : UInt64) : Pointer(Void)
  fun rc_box_alloc0 = g_rc_box_alloc0(block_size : UInt64) : Pointer(Void)
  fun rc_box_dup = g_rc_box_dup(block_size : UInt64, mem_block : Pointer(Void)) : Pointer(Void)
  fun rc_box_get_size = g_rc_box_get_size(mem_block : Pointer(Void)) : UInt64
  fun rc_box_release = g_rc_box_release(mem_block : Pointer(Void)) : Void
  fun rc_box_release_full = g_rc_box_release_full(mem_block : Pointer(Void), clear_func : LibGLib::DestroyNotify) : Void
  fun realloc = g_realloc(mem : Pointer(Void), n_bytes : UInt64) : Pointer(Void)
  fun realloc_n = g_realloc_n(mem : Pointer(Void), n_blocks : UInt64, n_block_bytes : UInt64) : Pointer(Void)
  fun ref_count_compare = g_ref_count_compare(rc : Pointer(Int32), val : Int32) : LibC::Int
  fun ref_count_dec = g_ref_count_dec(rc : Pointer(Int32)) : LibC::Int
  fun ref_count_inc = g_ref_count_inc(rc : Pointer(Int32)) : Void
  fun ref_count_init = g_ref_count_init(rc : Pointer(Int32)) : Void
  fun ref_string_acquire = g_ref_string_acquire(str : Pointer(UInt8)) : Pointer(UInt8)
  fun ref_string_length = g_ref_string_length(str : Pointer(UInt8)) : UInt64
  fun ref_string_new = g_ref_string_new(str : Pointer(UInt8)) : Pointer(UInt8)
  fun ref_string_new_intern = g_ref_string_new_intern(str : Pointer(UInt8)) : Pointer(UInt8)
  fun ref_string_new_len = g_ref_string_new_len(str : Pointer(UInt8), len : Int64) : Pointer(UInt8)
  fun ref_string_release = g_ref_string_release(str : Pointer(UInt8)) : Void
  fun regex_check_replacement = g_regex_check_replacement(replacement : Pointer(UInt8), has_references : LibC::Int*, error : LibGLib::Error**) : LibC::Int
  fun regex_error_quark = g_regex_error_quark : UInt32
  fun regex_escape_nul = g_regex_escape_nul(string : Pointer(UInt8), length : Int32) : Pointer(UInt8)
  fun regex_escape_string = g_regex_escape_string(string : Pointer(Pointer(UInt8)), length : Int32) : Pointer(UInt8)
  fun regex_match_simple = g_regex_match_simple(pattern : Pointer(UInt8), string : Pointer(UInt8), compile_options : LibGLib::RegexCompileFlags, match_options : LibGLib::RegexMatchFlags) : LibC::Int
  fun regex_split_simple = g_regex_split_simple(pattern : Pointer(UInt8), string : Pointer(UInt8), compile_options : LibGLib::RegexCompileFlags, match_options : LibGLib::RegexMatchFlags) : Pointer(Pointer(UInt8))
  fun reload_user_special_dirs_cache = g_reload_user_special_dirs_cache : Void
  fun rmdir = g_rmdir(filename : Pointer(UInt8)) : Int32
  fun sequence_get = g_sequence_get(iter : Pointer(LibGLib::SequenceIter)) : Pointer(Void)
  fun sequence_insert_before = g_sequence_insert_before(iter : Pointer(LibGLib::SequenceIter), data : Pointer(Void)) : Pointer(LibGLib::SequenceIter)
  fun sequence_move = g_sequence_move(src : Pointer(LibGLib::SequenceIter), dest : Pointer(LibGLib::SequenceIter)) : Void
  fun sequence_move_range = g_sequence_move_range(dest : Pointer(LibGLib::SequenceIter), _begin : Pointer(LibGLib::SequenceIter), _end : Pointer(LibGLib::SequenceIter)) : Void
  fun sequence_range_get_midpoint = g_sequence_range_get_midpoint(_begin : Pointer(LibGLib::SequenceIter), _end : Pointer(LibGLib::SequenceIter)) : Pointer(LibGLib::SequenceIter)
  fun sequence_remove = g_sequence_remove(iter : Pointer(LibGLib::SequenceIter)) : Void
  fun sequence_remove_range = g_sequence_remove_range(_begin : Pointer(LibGLib::SequenceIter), _end : Pointer(LibGLib::SequenceIter)) : Void
  fun sequence_set = g_sequence_set(iter : Pointer(LibGLib::SequenceIter), data : Pointer(Void)) : Void
  fun sequence_swap = g_sequence_swap(a : Pointer(LibGLib::SequenceIter), b : Pointer(LibGLib::SequenceIter)) : Void
  fun set_application_name = g_set_application_name(application_name : Pointer(UInt8)) : Void
  fun set_error_literal = g_set_error_literal(err : Pointer(LibGLib::Error*)*, domain : UInt32, code : Int32, message : Pointer(UInt8)) : Void
  fun set_prgname = g_set_prgname(prgname : Pointer(UInt8)) : Void
  fun setenv = g_setenv(variable : Pointer(UInt8), value : Pointer(UInt8), overwrite : LibC::Int) : LibC::Int
  fun shell_error_quark = g_shell_error_quark : UInt32
  fun shell_parse_argv = g_shell_parse_argv(command_line : Pointer(UInt8), argcp : Int32*, argvp : Pointer(Pointer(UInt8))*, error : LibGLib::Error**) : LibC::Int
  fun shell_quote = g_shell_quote(unquoted_string : Pointer(UInt8)) : Pointer(UInt8)
  fun shell_unquote = g_shell_unquote(quoted_string : Pointer(UInt8), error : LibGLib::Error**) : Pointer(UInt8)
  fun slice_alloc = g_slice_alloc(block_size : UInt64) : Pointer(Void)
  fun slice_alloc0 = g_slice_alloc0(block_size : UInt64) : Pointer(Void)
  fun slice_copy = g_slice_copy(block_size : UInt64, mem_block : Pointer(Void)) : Pointer(Void)
  fun slice_free1 = g_slice_free1(block_size : UInt64, mem_block : Pointer(Void)) : Void
  fun slice_free_chain_with_offset = g_slice_free_chain_with_offset(block_size : UInt64, mem_chain : Pointer(Void), next_offset : UInt64) : Void
  fun slice_get_config = g_slice_get_config(ckey : LibGLib::SliceConfig) : Int64
  fun slice_get_config_state = g_slice_get_config_state(ckey : LibGLib::SliceConfig, address : Int64, n_values : Pointer(UInt32)) : Pointer(Int64)
  fun slice_set_config = g_slice_set_config(ckey : LibGLib::SliceConfig, value : Int64) : Void
  fun source_remove = g_source_remove(tag : UInt32) : LibC::Int
  fun source_remove_by_funcs_user_data = g_source_remove_by_funcs_user_data(funcs : Pointer(LibGLib::SourceFuncs), user_data : Pointer(Void)) : LibC::Int
  fun source_remove_by_user_data = g_source_remove_by_user_data(user_data : Pointer(Void)) : LibC::Int
  fun source_set_name_by_id = g_source_set_name_by_id(tag : UInt32, name : Pointer(UInt8)) : Void
  fun spaced_primes_closest = g_spaced_primes_closest(num : UInt32) : UInt32
  fun spawn_async = g_spawn_async(working_directory : Pointer(UInt8), argv : Pointer(Pointer(UInt8)), envp : Pointer(Pointer(UInt8)), flags : LibGLib::SpawnFlags, child_setup : LibGLib::SpawnChildSetupFunc, user_data : Pointer(Void), child_pid : Int32*, error : LibGLib::Error**) : LibC::Int
  fun spawn_async_with_fds = g_spawn_async_with_fds(working_directory : Pointer(UInt8), argv : Pointer(Pointer(UInt8)), envp : Pointer(Pointer(UInt8)), flags : LibGLib::SpawnFlags, child_setup : LibGLib::SpawnChildSetupFunc, user_data : Pointer(Void), child_pid : Int32*, stdin_fd : Int32, stdout_fd : Int32, stderr_fd : Int32, error : LibGLib::Error**) : LibC::Int
  fun spawn_async_with_pipes = g_spawn_async_with_pipes(working_directory : Pointer(UInt8), argv : Pointer(Pointer(UInt8)), envp : Pointer(Pointer(UInt8)), flags : LibGLib::SpawnFlags, child_setup : LibGLib::SpawnChildSetupFunc, user_data : Pointer(Void), child_pid : Int32*, standard_input : Int32*, standard_output : Int32*, standard_error : Int32*, error : LibGLib::Error**) : LibC::Int
  fun spawn_check_exit_status = g_spawn_check_exit_status(exit_status : Int32, error : LibGLib::Error**) : LibC::Int
  fun spawn_close_pid = g_spawn_close_pid(pid : Int32) : Void
  fun spawn_command_line_async = g_spawn_command_line_async(command_line : Pointer(UInt8), error : LibGLib::Error**) : LibC::Int
  fun spawn_command_line_sync = g_spawn_command_line_sync(command_line : Pointer(UInt8), standard_output : Pointer(UInt8)*, standard_error : Pointer(UInt8)*, exit_status : Int32*, error : LibGLib::Error**) : LibC::Int
  fun spawn_error_quark = g_spawn_error_quark : UInt32
  fun spawn_exit_error_quark = g_spawn_exit_error_quark : UInt32
  fun spawn_sync = g_spawn_sync(working_directory : Pointer(UInt8), argv : Pointer(Pointer(UInt8)), envp : Pointer(Pointer(UInt8)), flags : LibGLib::SpawnFlags, child_setup : LibGLib::SpawnChildSetupFunc, user_data : Pointer(Void), standard_output : Pointer(UInt8)*, standard_error : Pointer(UInt8)*, exit_status : Int32*, error : LibGLib::Error**) : LibC::Int
  fun stpcpy = g_stpcpy(dest : Pointer(UInt8), src : Pointer(UInt8)) : Pointer(UInt8)
  fun str_equal = g_str_equal(v1 : Pointer(Void), v2 : Pointer(Void)) : LibC::Int
  fun str_has_prefix = g_str_has_prefix(str : Pointer(UInt8), prefix : Pointer(UInt8)) : LibC::Int
  fun str_has_suffix = g_str_has_suffix(str : Pointer(UInt8), suffix : Pointer(UInt8)) : LibC::Int
  fun str_hash = g_str_hash(v : Pointer(Void)) : UInt32
  fun str_is_ascii = g_str_is_ascii(str : Pointer(UInt8)) : LibC::Int
  fun str_match_string = g_str_match_string(search_term : Pointer(UInt8), potential_hit : Pointer(UInt8), accept_alternates : LibC::Int) : LibC::Int
  fun str_to_ascii = g_str_to_ascii(str : Pointer(UInt8), from_locale : Pointer(UInt8)) : Pointer(UInt8)
  fun str_tokenize_and_fold = g_str_tokenize_and_fold(string : Pointer(UInt8), translit_locale : Pointer(UInt8), ascii_alternates : Pointer(Pointer(UInt8))*) : Pointer(Pointer(UInt8))
  fun strcanon = g_strcanon(string : Pointer(UInt8), valid_chars : Pointer(UInt8), substitutor : Int8) : Pointer(UInt8)
  fun strcasecmp = g_strcasecmp(s1 : Pointer(UInt8), s2 : Pointer(UInt8)) : Int32
  fun strchomp = g_strchomp(string : Pointer(UInt8)) : Pointer(UInt8)
  fun strchug = g_strchug(string : Pointer(UInt8)) : Pointer(UInt8)
  fun strcmp0 = g_strcmp0(str1 : Pointer(UInt8), str2 : Pointer(UInt8)) : Int32
  fun strcompress = g_strcompress(source : Pointer(UInt8)) : Pointer(UInt8)
  fun strdelimit = g_strdelimit(string : Pointer(UInt8), delimiters : Pointer(UInt8), new_delimiter : Int8) : Pointer(UInt8)
  fun strdown = g_strdown(string : Pointer(UInt8)) : Pointer(UInt8)
  fun strdup = g_strdup(str : Pointer(UInt8)) : Pointer(UInt8)
  fun strerror = g_strerror(errnum : Int32) : Pointer(UInt8)
  fun strescape = g_strescape(source : Pointer(UInt8), exceptions : Pointer(UInt8)) : Pointer(UInt8)
  fun strfreev = g_strfreev(str_array : Pointer(UInt8)) : Void
  fun string_new = g_string_new(init : Pointer(UInt8)) : Pointer(LibGLib::String)
  fun string_new_len = g_string_new_len(init : Pointer(UInt8), len : Int64) : Pointer(LibGLib::String)
  fun string_sized_new = g_string_sized_new(dfl_size : UInt64) : Pointer(LibGLib::String)
  fun strip_context = g_strip_context(msgid : Pointer(UInt8), msgval : Pointer(UInt8)) : Pointer(UInt8)
  fun strjoinv = g_strjoinv(separator : Pointer(UInt8), str_array : Pointer(UInt8)) : Pointer(UInt8)
  fun strlcat = g_strlcat(dest : Pointer(UInt8), src : Pointer(UInt8), dest_size : UInt64) : UInt64
  fun strlcpy = g_strlcpy(dest : Pointer(UInt8), src : Pointer(UInt8), dest_size : UInt64) : UInt64
  fun strncasecmp = g_strncasecmp(s1 : Pointer(UInt8), s2 : Pointer(UInt8), n : UInt32) : Int32
  fun strndup = g_strndup(str : Pointer(UInt8), n : UInt64) : Pointer(UInt8)
  fun strnfill = g_strnfill(length : UInt64, fill_char : Int8) : Pointer(UInt8)
  fun strreverse = g_strreverse(string : Pointer(UInt8)) : Pointer(UInt8)
  fun strrstr = g_strrstr(haystack : Pointer(UInt8), needle : Pointer(UInt8)) : Pointer(UInt8)
  fun strrstr_len = g_strrstr_len(haystack : Pointer(UInt8), haystack_len : Int64, needle : Pointer(UInt8)) : Pointer(UInt8)
  fun strsignal = g_strsignal(signum : Int32) : Pointer(UInt8)
  fun strstr_len = g_strstr_len(haystack : Pointer(UInt8), haystack_len : Int64, needle : Pointer(UInt8)) : Pointer(UInt8)
  fun strtod = g_strtod(nptr : Pointer(UInt8), endptr : Pointer(UInt8)*) : Float64
  fun strup = g_strup(string : Pointer(UInt8)) : Pointer(UInt8)
  fun strv_contains = g_strv_contains(strv : Pointer(UInt8), str : Pointer(UInt8)) : LibC::Int
  fun strv_equal = g_strv_equal(strv1 : Pointer(UInt8), strv2 : Pointer(UInt8)) : LibC::Int
  fun strv_get_type = g_strv_get_type : UInt64
  fun strv_length = g_strv_length(str_array : Pointer(UInt8)) : UInt32
  fun test_add_data_func = g_test_add_data_func(testpath : Pointer(UInt8), test_data : Pointer(Void), test_func : LibGLib::TestDataFunc) : Void
  fun test_add_data_func_full = g_test_add_data_func_full(testpath : Pointer(UInt8), test_data : Pointer(Void), test_func : LibGLib::TestDataFunc, data_free_func : LibGLib::DestroyNotify) : Void
  fun test_add_func = g_test_add_func(testpath : Pointer(UInt8), test_func : LibGLib::TestFunc) : Void
  fun test_assert_expected_messages_internal = g_test_assert_expected_messages_internal(domain : Pointer(UInt8), file : Pointer(UInt8), line : Int32, func : Pointer(UInt8)) : Void
  fun test_bug = g_test_bug(bug_uri_snippet : Pointer(UInt8)) : Void
  fun test_bug_base = g_test_bug_base(uri_pattern : Pointer(UInt8)) : Void
  fun test_expect_message = g_test_expect_message(log_domain : Pointer(UInt8), log_level : LibGLib::LogLevelFlags, pattern : Pointer(UInt8)) : Void
  fun test_fail = g_test_fail : Void
  fun test_failed = g_test_failed : LibC::Int
  fun test_get_dir = g_test_get_dir(file_type : LibGLib::TestFileType) : Pointer(UInt8)
  fun test_incomplete = g_test_incomplete(msg : Pointer(UInt8)) : Void
  fun test_log_type_name = g_test_log_type_name(log_type : LibGLib::TestLogType) : Pointer(UInt8)
  fun test_queue_destroy = g_test_queue_destroy(destroy_func : LibGLib::DestroyNotify, destroy_data : Pointer(Void)) : Void
  fun test_queue_free = g_test_queue_free(gfree_pointer : Pointer(Void)) : Void
  fun test_rand_double = g_test_rand_double : Float64
  fun test_rand_double_range = g_test_rand_double_range(range_start : Float64, range_end : Float64) : Float64
  fun test_rand_int = g_test_rand_int : Int32
  fun test_rand_int_range = g_test_rand_int_range(_begin : Int32, _end : Int32) : Int32
  fun test_run = g_test_run : Int32
  fun test_run_suite = g_test_run_suite(suite : Pointer(LibGLib::TestSuite)) : Int32
  fun test_set_nonfatal_assertions = g_test_set_nonfatal_assertions : Void
  fun test_skip = g_test_skip(msg : Pointer(UInt8)) : Void
  fun test_subprocess = g_test_subprocess : LibC::Int
  fun test_summary = g_test_summary(summary : Pointer(UInt8)) : Void
  fun test_timer_elapsed = g_test_timer_elapsed : Float64
  fun test_timer_last = g_test_timer_last : Float64
  fun test_timer_start = g_test_timer_start : Void
  fun test_trap_assertions = g_test_trap_assertions(domain : Pointer(UInt8), file : Pointer(UInt8), line : Int32, func : Pointer(UInt8), assertion_flags : UInt64, pattern : Pointer(UInt8)) : Void
  fun test_trap_fork = g_test_trap_fork(usec_timeout : UInt64, test_trap_flags : LibGLib::TestTrapFlags) : LibC::Int
  fun test_trap_has_passed = g_test_trap_has_passed : LibC::Int
  fun test_trap_reached_timeout = g_test_trap_reached_timeout : LibC::Int
  fun test_trap_subprocess = g_test_trap_subprocess(test_path : Pointer(UInt8), usec_timeout : UInt64, test_flags : LibGLib::TestSubprocessFlags) : Void
  fun thread_error_quark = g_thread_error_quark : UInt32
  fun thread_exit = g_thread_exit(retval : Pointer(Void)) : Void
  fun thread_pool_get_max_idle_time = g_thread_pool_get_max_idle_time : UInt32
  fun thread_pool_get_max_unused_threads = g_thread_pool_get_max_unused_threads : Int32
  fun thread_pool_get_num_unused_threads = g_thread_pool_get_num_unused_threads : UInt32
  fun thread_pool_set_max_idle_time = g_thread_pool_set_max_idle_time(interval : UInt32) : Void
  fun thread_pool_set_max_unused_threads = g_thread_pool_set_max_unused_threads(max_threads : Int32) : Void
  fun thread_pool_stop_unused_threads = g_thread_pool_stop_unused_threads : Void
  fun thread_self = g_thread_self : Pointer(LibGLib::Thread)
  fun thread_yield = g_thread_yield : Void
  fun time_val_from_iso8601 = g_time_val_from_iso8601(iso_date : Pointer(UInt8), time_ : LibGLib::TimeVal*) : LibC::Int
  fun timeout_add = g_timeout_add_full(priority : Int32, interval : UInt32, function : LibGLib::SourceFunc, data : Pointer(Void), notify : LibGLib::DestroyNotify) : UInt32
  fun timeout_add_seconds = g_timeout_add_seconds_full(priority : Int32, interval : UInt32, function : LibGLib::SourceFunc, data : Pointer(Void), notify : LibGLib::DestroyNotify) : UInt32
  fun timeout_source_new = g_timeout_source_new(interval : UInt32) : Pointer(LibGLib::Source)
  fun timeout_source_new_seconds = g_timeout_source_new_seconds(interval : UInt32) : Pointer(LibGLib::Source)
  fun trash_stack_height = g_trash_stack_height(stack_p : Pointer(LibGLib::TrashStack)) : UInt32
  fun trash_stack_peek = g_trash_stack_peek(stack_p : Pointer(LibGLib::TrashStack)) : Pointer(Void)
  fun trash_stack_pop = g_trash_stack_pop(stack_p : Pointer(LibGLib::TrashStack)) : Pointer(Void)
  fun trash_stack_push = g_trash_stack_push(stack_p : Pointer(LibGLib::TrashStack), data_p : Pointer(Void)) : Void
  fun try_malloc = g_try_malloc(n_bytes : UInt64) : Pointer(Void)
  fun try_malloc0 = g_try_malloc0(n_bytes : UInt64) : Pointer(Void)
  fun try_malloc0_n = g_try_malloc0_n(n_blocks : UInt64, n_block_bytes : UInt64) : Pointer(Void)
  fun try_malloc_n = g_try_malloc_n(n_blocks : UInt64, n_block_bytes : UInt64) : Pointer(Void)
  fun try_realloc = g_try_realloc(mem : Pointer(Void), n_bytes : UInt64) : Pointer(Void)
  fun try_realloc_n = g_try_realloc_n(mem : Pointer(Void), n_blocks : UInt64, n_block_bytes : UInt64) : Pointer(Void)
  fun ucs4_to_utf16 = g_ucs4_to_utf16(str : Pointer(UInt8), len : Int64, items_read : Int64*, items_written : Int64*, error : LibGLib::Error**) : Pointer(UInt16)
  fun ucs4_to_utf8 = g_ucs4_to_utf8(str : Pointer(UInt8), len : Int64, items_read : Int64*, items_written : Int64*, error : LibGLib::Error**) : Pointer(UInt8)
  fun unichar_break_type = g_unichar_break_type(c : UInt8) : LibGLib::UnicodeBreakType
  fun unichar_combining_class = g_unichar_combining_class(uc : UInt8) : Int32
  fun unichar_compose = g_unichar_compose(a : UInt8, b : UInt8, ch : UInt8*) : LibC::Int
  fun unichar_decompose = g_unichar_decompose(ch : UInt8, a : UInt8*, b : UInt8*) : LibC::Int
  fun unichar_digit_value = g_unichar_digit_value(c : UInt8) : Int32
  fun unichar_fully_decompose = g_unichar_fully_decompose(ch : UInt8, compat : LibC::Int, result : UInt8*, result_len : UInt64) : UInt64
  fun unichar_get_mirror_char = g_unichar_get_mirror_char(ch : UInt8, mirrored_ch : Pointer(UInt8)) : LibC::Int
  fun unichar_get_script = g_unichar_get_script(ch : UInt8) : LibGLib::UnicodeScript
  fun unichar_isalnum = g_unichar_isalnum(c : UInt8) : LibC::Int
  fun unichar_isalpha = g_unichar_isalpha(c : UInt8) : LibC::Int
  fun unichar_iscntrl = g_unichar_iscntrl(c : UInt8) : LibC::Int
  fun unichar_isdefined = g_unichar_isdefined(c : UInt8) : LibC::Int
  fun unichar_isdigit = g_unichar_isdigit(c : UInt8) : LibC::Int
  fun unichar_isgraph = g_unichar_isgraph(c : UInt8) : LibC::Int
  fun unichar_islower = g_unichar_islower(c : UInt8) : LibC::Int
  fun unichar_ismark = g_unichar_ismark(c : UInt8) : LibC::Int
  fun unichar_isprint = g_unichar_isprint(c : UInt8) : LibC::Int
  fun unichar_ispunct = g_unichar_ispunct(c : UInt8) : LibC::Int
  fun unichar_isspace = g_unichar_isspace(c : UInt8) : LibC::Int
  fun unichar_istitle = g_unichar_istitle(c : UInt8) : LibC::Int
  fun unichar_isupper = g_unichar_isupper(c : UInt8) : LibC::Int
  fun unichar_iswide = g_unichar_iswide(c : UInt8) : LibC::Int
  fun unichar_iswide_cjk = g_unichar_iswide_cjk(c : UInt8) : LibC::Int
  fun unichar_isxdigit = g_unichar_isxdigit(c : UInt8) : LibC::Int
  fun unichar_iszerowidth = g_unichar_iszerowidth(c : UInt8) : LibC::Int
  fun unichar_to_utf8 = g_unichar_to_utf8(c : UInt8, outbuf : Pointer(UInt8)*) : Int32
  fun unichar_tolower = g_unichar_tolower(c : UInt8) : UInt8
  fun unichar_totitle = g_unichar_totitle(c : UInt8) : UInt8
  fun unichar_toupper = g_unichar_toupper(c : UInt8) : UInt8
  fun unichar_type = g_unichar_type(c : UInt8) : LibGLib::UnicodeType
  fun unichar_validate = g_unichar_validate(ch : UInt8) : LibC::Int
  fun unichar_xdigit_value = g_unichar_xdigit_value(c : UInt8) : Int32
  fun unicode_canonical_decomposition = g_unicode_canonical_decomposition(ch : UInt8, result_len : Pointer(UInt64)) : Pointer(UInt8)
  fun unicode_canonical_ordering = g_unicode_canonical_ordering(string : Pointer(UInt8), len : UInt64) : Void
  fun unicode_script_from_iso15924 = g_unicode_script_from_iso15924(iso15924 : UInt32) : LibGLib::UnicodeScript
  fun unicode_script_to_iso15924 = g_unicode_script_to_iso15924(script : LibGLib::UnicodeScript) : UInt32
  fun unix_error_quark = g_unix_error_quark : UInt32
  fun unix_fd_add_full = g_unix_fd_add_full(priority : Int32, fd : Int32, condition : LibGLib::IOCondition, function : LibGLib::UnixFDSourceFunc, user_data : Pointer(Void), notify : LibGLib::DestroyNotify) : UInt32
  fun unix_fd_source_new = g_unix_fd_source_new(fd : Int32, condition : LibGLib::IOCondition) : Pointer(LibGLib::Source)
  fun unix_get_passwd_entry = g_unix_get_passwd_entry(user_name : Pointer(UInt8), error : LibGLib::Error**) : Pointer(Void)
  fun unix_open_pipe = g_unix_open_pipe(fds : Pointer(Int32), flags : Int32, error : LibGLib::Error**) : LibC::Int
  fun unix_set_fd_nonblocking = g_unix_set_fd_nonblocking(fd : Int32, nonblock : LibC::Int, error : LibGLib::Error**) : LibC::Int
  fun unix_signal_add = g_unix_signal_add_full(priority : Int32, signum : Int32, handler : LibGLib::SourceFunc, user_data : Pointer(Void), notify : LibGLib::DestroyNotify) : UInt32
  fun unix_signal_source_new = g_unix_signal_source_new(signum : Int32) : Pointer(LibGLib::Source)
  fun unlink = g_unlink(filename : Pointer(UInt8)) : Int32
  fun unsetenv = g_unsetenv(variable : Pointer(UInt8)) : Void
  fun uri_escape_string = g_uri_escape_string(unescaped : Pointer(UInt8), reserved_chars_allowed : Pointer(UInt8), allow_utf8 : LibC::Int) : Pointer(UInt8)
  fun uri_list_extract_uris = g_uri_list_extract_uris(uri_list : Pointer(UInt8)) : Pointer(Pointer(UInt8))
  fun uri_parse_scheme = g_uri_parse_scheme(uri : Pointer(UInt8)) : Pointer(UInt8)
  fun uri_unescape_segment = g_uri_unescape_segment(escaped_string : Pointer(UInt8), escaped_string_end : Pointer(UInt8), illegal_characters : Pointer(UInt8)) : Pointer(UInt8)
  fun uri_unescape_string = g_uri_unescape_string(escaped_string : Pointer(UInt8), illegal_characters : Pointer(UInt8)) : Pointer(UInt8)
  fun usleep = g_usleep(microseconds : UInt64) : Void
  fun utf16_to_ucs4 = g_utf16_to_ucs4(str : Pointer(UInt16), len : Int64, items_read : Int64*, items_written : Int64*, error : LibGLib::Error**) : Pointer(UInt8)
  fun utf16_to_utf8 = g_utf16_to_utf8(str : Pointer(UInt16), len : Int64, items_read : Int64*, items_written : Int64*, error : LibGLib::Error**) : Pointer(UInt8)
  fun utf8_casefold = g_utf8_casefold(str : Pointer(UInt8), len : Int64) : Pointer(UInt8)
  fun utf8_collate = g_utf8_collate(str1 : Pointer(UInt8), str2 : Pointer(UInt8)) : Int32
  fun utf8_collate_key = g_utf8_collate_key(str : Pointer(UInt8), len : Int64) : Pointer(UInt8)
  fun utf8_collate_key_for_filename = g_utf8_collate_key_for_filename(str : Pointer(UInt8), len : Int64) : Pointer(UInt8)
  fun utf8_find_next_char = g_utf8_find_next_char(p : Pointer(UInt8), _end : Pointer(UInt8)) : Pointer(UInt8)
  fun utf8_find_prev_char = g_utf8_find_prev_char(str : Pointer(UInt8), p : Pointer(UInt8)) : Pointer(UInt8)
  fun utf8_get_char = g_utf8_get_char(p : Pointer(UInt8)) : UInt8
  fun utf8_get_char_validated = g_utf8_get_char_validated(p : Pointer(UInt8), max_len : Int64) : UInt8
  fun utf8_make_valid = g_utf8_make_valid(str : Pointer(UInt8), len : Int64) : Pointer(UInt8)
  fun utf8_normalize = g_utf8_normalize(str : Pointer(UInt8), len : Int64, mode : LibGLib::NormalizeMode) : Pointer(UInt8)
  fun utf8_offset_to_pointer = g_utf8_offset_to_pointer(str : Pointer(UInt8), offset : Int64) : Pointer(UInt8)
  fun utf8_pointer_to_offset = g_utf8_pointer_to_offset(str : Pointer(UInt8), pos : Pointer(UInt8)) : Int64
  fun utf8_prev_char = g_utf8_prev_char(p : Pointer(UInt8)) : Pointer(UInt8)
  fun utf8_strchr = g_utf8_strchr(p : Pointer(UInt8), len : Int64, c : UInt8) : Pointer(UInt8)
  fun utf8_strdown = g_utf8_strdown(str : Pointer(UInt8), len : Int64) : Pointer(UInt8)
  fun utf8_strlen = g_utf8_strlen(p : Pointer(UInt8), max : Int64) : Int64
  fun utf8_strncpy = g_utf8_strncpy(dest : Pointer(UInt8), src : Pointer(UInt8), n : UInt64) : Pointer(UInt8)
  fun utf8_strrchr = g_utf8_strrchr(p : Pointer(UInt8), len : Int64, c : UInt8) : Pointer(UInt8)
  fun utf8_strreverse = g_utf8_strreverse(str : Pointer(UInt8), len : Int64) : Pointer(UInt8)
  fun utf8_strup = g_utf8_strup(str : Pointer(UInt8), len : Int64) : Pointer(UInt8)
  fun utf8_substring = g_utf8_substring(str : Pointer(UInt8), start_pos : Int64, end_pos : Int64) : Pointer(UInt8)
  fun utf8_to_ucs4 = g_utf8_to_ucs4(str : Pointer(UInt8), len : Int64, items_read : Int64*, items_written : Int64*, error : LibGLib::Error**) : Pointer(UInt8)
  fun utf8_to_ucs4_fast = g_utf8_to_ucs4_fast(str : Pointer(UInt8), len : Int64, items_written : Int64*) : Pointer(UInt8)
  fun utf8_to_utf16 = g_utf8_to_utf16(str : Pointer(UInt8), len : Int64, items_read : Int64*, items_written : Int64*, error : LibGLib::Error**) : Pointer(UInt16)
  fun utf8_validate = g_utf8_validate(str : Pointer(UInt8), max_len : Int64, _end : Pointer(UInt8)*) : LibC::Int
  fun utf8_validate_len = g_utf8_validate_len(str : Pointer(UInt8), max_len : UInt64, _end : Pointer(UInt8)*) : LibC::Int
  fun uuid_string_is_valid = g_uuid_string_is_valid(str : Pointer(UInt8)) : LibC::Int
  fun uuid_string_random = g_uuid_string_random : Pointer(UInt8)
  fun variant_get_gtype = g_variant_get_gtype : UInt64
  fun variant_is_object_path = g_variant_is_object_path(string : Pointer(UInt8)) : LibC::Int
  fun variant_is_signature = g_variant_is_signature(string : Pointer(UInt8)) : LibC::Int
  fun variant_parse = g_variant_parse(type : Pointer(LibGLib::VariantType), text : Pointer(UInt8), limit : Pointer(UInt8), endptr : Pointer(UInt8), error : LibGLib::Error**) : Pointer(LibGLib::Variant)
  fun variant_parse_error_print_context = g_variant_parse_error_print_context(error : Pointer(LibGLib::Error*), source_str : Pointer(UInt8)) : Pointer(UInt8)
  fun variant_parse_error_quark = g_variant_parse_error_quark : UInt32
  fun variant_parser_get_error_quark = g_variant_parser_get_error_quark : UInt32
  fun variant_type_checked_ = g_variant_type_checked_(arg0 : Pointer(UInt8)) : Pointer(LibGLib::VariantType)
  fun variant_type_string_get_depth_ = g_variant_type_string_get_depth_(type_string : Pointer(UInt8)) : UInt64
  fun variant_type_string_is_valid = g_variant_type_string_is_valid(type_string : Pointer(UInt8)) : LibC::Int
  fun variant_type_string_scan = g_variant_type_string_scan(string : Pointer(UInt8), limit : Pointer(UInt8), endptr : Pointer(UInt8)*) : LibC::Int

  ###########################################
  # #    Callbacks
  ###########################################
  alias ChildWatchFunc = Int32, Int32, Pointer(Void) -> Void
  alias ClearHandleFunc = UInt32 -> Void
  alias CompareDataFunc = Pointer(Void), Pointer(Void), Pointer(Void) -> Int32
  alias CompareFunc = Pointer(Void), Pointer(Void) -> Int32
  alias CopyFunc = Pointer(Void), Pointer(Void) -> Pointer(Void)
  alias DataForeachFunc = UInt32, Pointer(Void), Pointer(Void) -> Void
  alias DestroyNotify = Pointer(Void) -> Void
  alias DuplicateFunc = Pointer(Void), Pointer(Void) -> Pointer(Void)
  alias EqualFunc = Pointer(Void), Pointer(Void) -> LibC::Int
  alias FreeFunc = Pointer(Void) -> Void
  alias Func = Pointer(Void), Pointer(Void) -> Void
  alias HFunc = Pointer(Void), Pointer(Void), Pointer(Void) -> Void
  alias HRFunc = Pointer(Void), Pointer(Void), Pointer(Void) -> LibC::Int
  alias HashFunc = Pointer(Void) -> UInt32
  alias HookCheckFunc = Pointer(Void) -> LibC::Int
  alias HookCheckMarshaller = Pointer(LibGLib::Hook), Pointer(Void) -> LibC::Int
  alias HookCompareFunc = Pointer(LibGLib::Hook), Pointer(LibGLib::Hook) -> Int32
  alias HookFinalizeFunc = Pointer(LibGLib::HookList), Pointer(LibGLib::Hook) -> Void
  alias HookFindFunc = Pointer(LibGLib::Hook), Pointer(Void) -> LibC::Int
  alias HookFunc = Pointer(Void) -> Void
  alias HookMarshaller = Pointer(LibGLib::Hook), Pointer(Void) -> Void
  alias IOFunc = Pointer(LibGLib::IOChannel), LibGLib::IOCondition, Pointer(Void) -> LibC::Int
  alias LogFunc = Pointer(UInt8), LibGLib::LogLevelFlags, Pointer(UInt8), Pointer(Void) -> Void
  alias LogWriterFunc = LibGLib::LogLevelFlags, Pointer(LibGLib::LogField), UInt64, Pointer(Void) -> LibGLib::LogWriterOutput
  alias NodeForeachFunc = Pointer(LibGLib::Node), Pointer(Void) -> Void
  alias NodeTraverseFunc = Pointer(LibGLib::Node), Pointer(Void) -> LibC::Int
  alias OptionArgFunc = Pointer(UInt8), Pointer(UInt8), Pointer(Void), LibGLib::Error* -> LibC::Int
  alias OptionErrorFunc = Pointer(LibGLib::OptionContext), Pointer(LibGLib::OptionGroup), Pointer(Void), LibGLib::Error* -> Void
  alias OptionParseFunc = Pointer(LibGLib::OptionContext), Pointer(LibGLib::OptionGroup), Pointer(Void), LibGLib::Error* -> LibC::Int
  alias PollFunc = Pointer(LibGLib::PollFD), UInt32, Int32 -> Int32
  alias PrintFunc = Pointer(UInt8) -> Void
  alias RegexEvalCallback = Pointer(LibGLib::MatchInfo), Pointer(LibGLib::String), Pointer(Void) -> LibC::Int
  alias ScannerMsgFunc = Pointer(LibGLib::Scanner), Pointer(UInt8), LibC::Int -> Void
  alias SequenceIterCompareFunc = Pointer(LibGLib::SequenceIter), Pointer(LibGLib::SequenceIter), Pointer(Void) -> Int32
  alias SourceDisposeFunc = Pointer(LibGLib::Source) -> Void
  alias SourceDummyMarshal = -> Void
  alias SourceFunc = Pointer(Void) -> LibC::Int
  alias SpawnChildSetupFunc = Pointer(Void) -> Void
  alias TestDataFunc = Pointer(Void) -> Void
  alias TestFixtureFunc = Pointer(Void), Pointer(Void) -> Void
  alias TestFunc = -> Void
  alias TestLogFatalFunc = Pointer(UInt8), LibGLib::LogLevelFlags, Pointer(UInt8), Pointer(Void) -> LibC::Int
  alias ThreadFunc = Pointer(Void) -> Pointer(Void)
  alias TranslateFunc = Pointer(UInt8), Pointer(Void) -> Pointer(UInt8)
  alias TraverseFunc = Pointer(Void), Pointer(Void), Pointer(Void) -> LibC::Int
  alias UnixFDSourceFunc = Int32, LibGLib::IOCondition, Pointer(Void) -> LibC::Int
  alias VoidFunc = -> Void
end

module GLib
  ANALYZER_ANALYZING                         = LibGLib::ANALYZER_ANALYZING
  ASCII_DTOSTR_BUF_SIZE                      = LibGLib::ASCII_DTOSTR_BUF_SIZE
  BIG_ENDIAN                                 = LibGLib::BIG_ENDIAN
  CSET_A_2_Z                                 = LibGLib::CSET_A_2_Z
  CSET_DIGITS                                = LibGLib::CSET_DIGITS
  CSET_a_2_z                                 = LibGLib::CSET_a_2_z
  DATALIST_FLAGS_MASK                        = LibGLib::DATALIST_FLAGS_MASK
  DATE_BAD_DAY                               = LibGLib::DATE_BAD_DAY
  DATE_BAD_JULIAN                            = LibGLib::DATE_BAD_JULIAN
  DATE_BAD_YEAR                              = LibGLib::DATE_BAD_YEAR
  DIR_SEPARATOR                              = LibGLib::DIR_SEPARATOR
  DIR_SEPARATOR_S                            = LibGLib::DIR_SEPARATOR_S
  E                                          = LibGLib::E
  GINT16_FORMAT                              = LibGLib::GINT16_FORMAT
  GINT16_MODIFIER                            = LibGLib::GINT16_MODIFIER
  GINT32_FORMAT                              = LibGLib::GINT32_FORMAT
  GINT32_MODIFIER                            = LibGLib::GINT32_MODIFIER
  GINT64_FORMAT                              = LibGLib::GINT64_FORMAT
  GINT64_MODIFIER                            = LibGLib::GINT64_MODIFIER
  GINTPTR_FORMAT                             = LibGLib::GINTPTR_FORMAT
  GINTPTR_MODIFIER                           = LibGLib::GINTPTR_MODIFIER
  GNUC_FUNCTION                              = LibGLib::GNUC_FUNCTION
  GNUC_PRETTY_FUNCTION                       = LibGLib::GNUC_PRETTY_FUNCTION
  GSIZE_FORMAT                               = LibGLib::GSIZE_FORMAT
  GSIZE_MODIFIER                             = LibGLib::GSIZE_MODIFIER
  GSSIZE_FORMAT                              = LibGLib::GSSIZE_FORMAT
  GSSIZE_MODIFIER                            = LibGLib::GSSIZE_MODIFIER
  GUINT16_FORMAT                             = LibGLib::GUINT16_FORMAT
  GUINT32_FORMAT                             = LibGLib::GUINT32_FORMAT
  GUINT64_FORMAT                             = LibGLib::GUINT64_FORMAT
  GUINTPTR_FORMAT                            = LibGLib::GUINTPTR_FORMAT
  HAVE_GINT64                                = LibGLib::HAVE_GINT64
  HAVE_GNUC_VARARGS                          = LibGLib::HAVE_GNUC_VARARGS
  HAVE_GNUC_VISIBILITY                       = LibGLib::HAVE_GNUC_VISIBILITY
  HAVE_GROWING_STACK                         = LibGLib::HAVE_GROWING_STACK
  HAVE_ISO_VARARGS                           = LibGLib::HAVE_ISO_VARARGS
  HOOK_FLAG_USER_SHIFT                       = LibGLib::HOOK_FLAG_USER_SHIFT
  IEEE754_DOUBLE_BIAS                        = LibGLib::IEEE754_DOUBLE_BIAS
  IEEE754_FLOAT_BIAS                         = LibGLib::IEEE754_FLOAT_BIAS
  KEY_FILE_DESKTOP_GROUP                     = LibGLib::KEY_FILE_DESKTOP_GROUP
  KEY_FILE_DESKTOP_KEY_ACTIONS               = LibGLib::KEY_FILE_DESKTOP_KEY_ACTIONS
  KEY_FILE_DESKTOP_KEY_CATEGORIES            = LibGLib::KEY_FILE_DESKTOP_KEY_CATEGORIES
  KEY_FILE_DESKTOP_KEY_COMMENT               = LibGLib::KEY_FILE_DESKTOP_KEY_COMMENT
  KEY_FILE_DESKTOP_KEY_DBUS_ACTIVATABLE      = LibGLib::KEY_FILE_DESKTOP_KEY_DBUS_ACTIVATABLE
  KEY_FILE_DESKTOP_KEY_EXEC                  = LibGLib::KEY_FILE_DESKTOP_KEY_EXEC
  KEY_FILE_DESKTOP_KEY_GENERIC_NAME          = LibGLib::KEY_FILE_DESKTOP_KEY_GENERIC_NAME
  KEY_FILE_DESKTOP_KEY_HIDDEN                = LibGLib::KEY_FILE_DESKTOP_KEY_HIDDEN
  KEY_FILE_DESKTOP_KEY_ICON                  = LibGLib::KEY_FILE_DESKTOP_KEY_ICON
  KEY_FILE_DESKTOP_KEY_MIME_TYPE             = LibGLib::KEY_FILE_DESKTOP_KEY_MIME_TYPE
  KEY_FILE_DESKTOP_KEY_NAME                  = LibGLib::KEY_FILE_DESKTOP_KEY_NAME
  KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN           = LibGLib::KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN
  KEY_FILE_DESKTOP_KEY_NO_DISPLAY            = LibGLib::KEY_FILE_DESKTOP_KEY_NO_DISPLAY
  KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN          = LibGLib::KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN
  KEY_FILE_DESKTOP_KEY_PATH                  = LibGLib::KEY_FILE_DESKTOP_KEY_PATH
  KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY        = LibGLib::KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY
  KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS      = LibGLib::KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS
  KEY_FILE_DESKTOP_KEY_TERMINAL              = LibGLib::KEY_FILE_DESKTOP_KEY_TERMINAL
  KEY_FILE_DESKTOP_KEY_TRY_EXEC              = LibGLib::KEY_FILE_DESKTOP_KEY_TRY_EXEC
  KEY_FILE_DESKTOP_KEY_TYPE                  = LibGLib::KEY_FILE_DESKTOP_KEY_TYPE
  KEY_FILE_DESKTOP_KEY_URL                   = LibGLib::KEY_FILE_DESKTOP_KEY_URL
  KEY_FILE_DESKTOP_KEY_VERSION               = LibGLib::KEY_FILE_DESKTOP_KEY_VERSION
  KEY_FILE_DESKTOP_TYPE_APPLICATION          = LibGLib::KEY_FILE_DESKTOP_TYPE_APPLICATION
  KEY_FILE_DESKTOP_TYPE_DIRECTORY            = LibGLib::KEY_FILE_DESKTOP_TYPE_DIRECTORY
  KEY_FILE_DESKTOP_TYPE_LINK                 = LibGLib::KEY_FILE_DESKTOP_TYPE_LINK
  LITTLE_ENDIAN                              = LibGLib::LITTLE_ENDIAN
  LN10                                       = LibGLib::LN10
  LN2                                        = LibGLib::LN2
  LOG_2_BASE_10                              = LibGLib::LOG_2_BASE_10
  LOG_DOMAIN                                 = LibGLib::LOG_DOMAIN
  LOG_FATAL_MASK                             = LibGLib::LOG_FATAL_MASK
  LOG_LEVEL_USER_SHIFT                       = LibGLib::LOG_LEVEL_USER_SHIFT
  MAJOR_VERSION                              = LibGLib::MAJOR_VERSION
  MAXINT16                                   = LibGLib::MAXINT16
  MAXINT32                                   = LibGLib::MAXINT32
  MAXINT64                                   = LibGLib::MAXINT64
  MAXINT8                                    = LibGLib::MAXINT8
  MAXUINT16                                  = LibGLib::MAXUINT16
  MAXUINT32                                  = LibGLib::MAXUINT32
  MAXUINT64                                  = LibGLib::MAXUINT64
  MAXUINT8                                   = LibGLib::MAXUINT8
  MICRO_VERSION                              = LibGLib::MICRO_VERSION
  MININT16                                   = LibGLib::MININT16
  MININT32                                   = LibGLib::MININT32
  MININT64                                   = LibGLib::MININT64
  MININT8                                    = LibGLib::MININT8
  MINOR_VERSION                              = LibGLib::MINOR_VERSION
  MODULE_SUFFIX                              = LibGLib::MODULE_SUFFIX
  OPTION_REMAINING                           = LibGLib::OPTION_REMAINING
  PDP_ENDIAN                                 = LibGLib::PDP_ENDIAN
  PI                                         = LibGLib::PI
  PID_FORMAT                                 = LibGLib::PID_FORMAT
  PI_2                                       = LibGLib::PI_2
  PI_4                                       = LibGLib::PI_4
  POLLFD_FORMAT                              = LibGLib::POLLFD_FORMAT
  PRIORITY_DEFAULT                           = LibGLib::PRIORITY_DEFAULT
  PRIORITY_DEFAULT_IDLE                      = LibGLib::PRIORITY_DEFAULT_IDLE
  PRIORITY_HIGH                              = LibGLib::PRIORITY_HIGH
  PRIORITY_HIGH_IDLE                         = LibGLib::PRIORITY_HIGH_IDLE
  PRIORITY_LOW                               = LibGLib::PRIORITY_LOW
  SEARCHPATH_SEPARATOR                       = LibGLib::SEARCHPATH_SEPARATOR
  SEARCHPATH_SEPARATOR_S                     = LibGLib::SEARCHPATH_SEPARATOR_S
  SIZEOF_LONG                                = LibGLib::SIZEOF_LONG
  SIZEOF_SIZE_T                              = LibGLib::SIZEOF_SIZE_T
  SIZEOF_SSIZE_T                             = LibGLib::SIZEOF_SSIZE_T
  SIZEOF_VOID_P                              = LibGLib::SIZEOF_VOID_P
  SOURCE_CONTINUE                            = LibGLib::SOURCE_CONTINUE
  SOURCE_REMOVE                              = LibGLib::SOURCE_REMOVE
  SQRT2                                      = LibGLib::SQRT2
  STR_DELIMITERS                             = LibGLib::STR_DELIMITERS
  SYSDEF_AF_INET                             = LibGLib::SYSDEF_AF_INET
  SYSDEF_AF_INET6                            = LibGLib::SYSDEF_AF_INET6
  SYSDEF_AF_UNIX                             = LibGLib::SYSDEF_AF_UNIX
  SYSDEF_MSG_DONTROUTE                       = LibGLib::SYSDEF_MSG_DONTROUTE
  SYSDEF_MSG_OOB                             = LibGLib::SYSDEF_MSG_OOB
  SYSDEF_MSG_PEEK                            = LibGLib::SYSDEF_MSG_PEEK
  TEST_OPTION_ISOLATE_DIRS                   = LibGLib::TEST_OPTION_ISOLATE_DIRS
  TIME_SPAN_DAY                              = LibGLib::TIME_SPAN_DAY
  TIME_SPAN_HOUR                             = LibGLib::TIME_SPAN_HOUR
  TIME_SPAN_MILLISECOND                      = LibGLib::TIME_SPAN_MILLISECOND
  TIME_SPAN_MINUTE                           = LibGLib::TIME_SPAN_MINUTE
  TIME_SPAN_SECOND                           = LibGLib::TIME_SPAN_SECOND
  UNICHAR_MAX_DECOMPOSITION_LENGTH           = LibGLib::UNICHAR_MAX_DECOMPOSITION_LENGTH
  URI_RESERVED_CHARS_GENERIC_DELIMITERS      = LibGLib::URI_RESERVED_CHARS_GENERIC_DELIMITERS
  URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = LibGLib::URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS
  USEC_PER_SEC                               = LibGLib::USEC_PER_SEC
  VA_COPY_AS_ARRAY                           = LibGLib::VA_COPY_AS_ARRAY
  VERSION_MIN_REQUIRED                       = LibGLib::VERSION_MIN_REQUIRED
  WIN32_MSG_HANDLE                           = LibGLib::WIN32_MSG_HANDLE

  def self.access(filename : ::String, mode : ::Int)
    __var0 = LibGLib.access(filename.to_unsafe, Int32.new(mode))
    __var0
  end

  def self.ascii_digit_value(c : ::Int)
    __var0 = LibGLib.ascii_digit_value(Int8.new(c))
    __var0
  end

  def self.ascii_dtostr(buffer : ::String, buf_len : ::Int, d : ::Float)
    __var0 = LibGLib.ascii_dtostr(buffer.to_unsafe, Int32.new(buf_len), Float64.new(d))
    GObject.raise_unexpected_null("g_ascii_dtostr") if __var0.null?
    ::String.new(__var0)
  end

  def self.ascii_formatd(buffer : ::String, buf_len : ::Int, format : ::String, d : ::Float)
    __var0 = LibGLib.ascii_formatd(buffer.to_unsafe, Int32.new(buf_len), format.to_unsafe, Float64.new(d))
    GObject.raise_unexpected_null("g_ascii_formatd") if __var0.null?
    ::String.new(__var0)
  end

  def self.ascii_strcasecmp(s1 : ::String, s2 : ::String)
    __var0 = LibGLib.ascii_strcasecmp(s1.to_unsafe, s2.to_unsafe)
    __var0
  end

  def self.ascii_strdown(str : ::String, len : ::Int)
    __var0 = LibGLib.ascii_strdown(str.to_unsafe, Int64.new(len))
    GObject.raise_unexpected_null("g_ascii_strdown") if __var0.null?
    ::String.new(__var0)
  end

  def self.ascii_string_to_signed(str : ::String, base : ::Int, min : ::Int, max : ::Int)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.ascii_string_to_signed(str.to_unsafe, UInt32.new(base), Int64.new(min), Int64.new(max), out out_num, pointerof(__var0))
    GLib::Error.assert(__var0)
    {(__var1 == 1), out_num}
  end

  def self.ascii_string_to_unsigned(str : ::String, base : ::Int, min : ::Int, max : ::Int)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.ascii_string_to_unsigned(str.to_unsafe, UInt32.new(base), UInt64.new(min), UInt64.new(max), out out_num, pointerof(__var0))
    GLib::Error.assert(__var0)
    {(__var1 == 1), out_num}
  end

  def self.ascii_strncasecmp(s1 : ::String, s2 : ::String, n : ::Int)
    __var0 = LibGLib.ascii_strncasecmp(s1.to_unsafe, s2.to_unsafe, UInt64.new(n))
    __var0
  end

  def self.ascii_strtod(nptr : ::String)
    __var0 = LibGLib.ascii_strtod(nptr.to_unsafe, out endptr)
    {__var0, ::String.new(endptr)}
  end

  def self.ascii_strtoll(nptr : ::String, base : ::Int)
    __var0 = LibGLib.ascii_strtoll(nptr.to_unsafe, out endptr, UInt32.new(base))
    {__var0, ::String.new(endptr)}
  end

  def self.ascii_strtoull(nptr : ::String, base : ::Int)
    __var0 = LibGLib.ascii_strtoull(nptr.to_unsafe, out endptr, UInt32.new(base))
    {__var0, ::String.new(endptr)}
  end

  def self.ascii_strup(str : ::String, len : ::Int)
    __var0 = LibGLib.ascii_strup(str.to_unsafe, Int64.new(len))
    GObject.raise_unexpected_null("g_ascii_strup") if __var0.null?
    ::String.new(__var0)
  end

  def self.ascii_tolower(c : ::Int)
    __var0 = LibGLib.ascii_tolower(Int8.new(c))
    __var0
  end

  def self.ascii_toupper(c : ::Int)
    __var0 = LibGLib.ascii_toupper(Int8.new(c))
    __var0
  end

  def self.ascii_xdigit_value(c : ::Int)
    __var0 = LibGLib.ascii_xdigit_value(Int8.new(c))
    __var0
  end

  def self.assert_warning(log_domain : ::String, file : ::String, line : ::Int, pretty_function : ::String, expression : ::String)
    LibGLib.assert_warning(log_domain.to_unsafe, file.to_unsafe, Int32.new(line), pretty_function.to_unsafe, expression.to_unsafe)
    nil
  end

  def self.assertion_message(domain : ::String, file : ::String, line : ::Int, func : ::String, message : ::String)
    LibGLib.assertion_message(domain.to_unsafe, file.to_unsafe, Int32.new(line), func.to_unsafe, message.to_unsafe)
    nil
  end

  def self.assertion_message_cmpstr(domain : ::String, file : ::String, line : ::Int, func : ::String, expr : ::String, arg1 : ::String, cmp : ::String, arg2 : ::String)
    LibGLib.assertion_message_cmpstr(domain.to_unsafe, file.to_unsafe, Int32.new(line), func.to_unsafe, expr.to_unsafe, arg1.to_unsafe, cmp.to_unsafe, arg2.to_unsafe)
    nil
  end

  def self.assertion_message_error(domain : ::String, file : ::String, line : ::Int, func : ::String, expr : ::String, error : LibGLib::Error*, error_domain : ::Int, error_code : ::Int)
    LibGLib.assertion_message_error(domain.to_unsafe, file.to_unsafe, Int32.new(line), func.to_unsafe, expr.to_unsafe, error, UInt32.new(error_domain), Int32.new(error_code))
    nil
  end

  def self.atexit(func : GLib::VoidFunc)
    LibGLib.atexit(func)
    nil
  end

  def self.atomic_int_add(atomic : ::Int, val : ::Int)
    __var0 = LibGLib.atomic_int_add(atomic, Int32.new(val))
    __var0
  end

  def self.atomic_int_and(atomic : ::Int, val : ::Int)
    __var0 = LibGLib.atomic_int_and(atomic, UInt32.new(val))
    __var0
  end

  def self.atomic_int_compare_and_exchange(atomic : ::Int, oldval : ::Int, newval : ::Int)
    __var0 = LibGLib.atomic_int_compare_and_exchange(atomic, Int32.new(oldval), Int32.new(newval))
    (__var0 == 1)
  end

  def self.atomic_int_dec_and_test(atomic : ::Int)
    __var0 = LibGLib.atomic_int_dec_and_test(atomic)
    (__var0 == 1)
  end

  def self.atomic_int_exchange_and_add(atomic : ::Int, val : ::Int)
    __var0 = LibGLib.atomic_int_exchange_and_add(atomic, Int32.new(val))
    __var0
  end

  def self.atomic_int_get(atomic : ::Int)
    __var0 = LibGLib.atomic_int_get(atomic)
    __var0
  end

  def self.atomic_int_inc(atomic : ::Int)
    LibGLib.atomic_int_inc(atomic)
    nil
  end

  def self.atomic_int_or(atomic : ::Int, val : ::Int)
    __var0 = LibGLib.atomic_int_or(atomic, UInt32.new(val))
    __var0
  end

  def self.atomic_int_set(atomic : ::Int, newval : ::Int)
    LibGLib.atomic_int_set(atomic, Int32.new(newval))
    nil
  end

  def self.atomic_int_xor(atomic : ::Int, val : ::Int)
    __var0 = LibGLib.atomic_int_xor(atomic, UInt32.new(val))
    __var0
  end

  def self.atomic_pointer_add(atomic : Void*, val : ::Int)
    __var0 = LibGLib.atomic_pointer_add(atomic, Int64.new(val))
    __var0
  end

  def self.atomic_pointer_and(atomic : Void*, val : ::Int)
    __var0 = LibGLib.atomic_pointer_and(atomic, UInt64.new(val))
    __var0
  end

  def self.atomic_pointer_compare_and_exchange(atomic : Void*, oldval : Void*?, newval : Void*?)
    __var0 = LibGLib.atomic_pointer_compare_and_exchange(atomic, oldval ? oldval : Pointer(Void).null, newval ? newval : Pointer(Void).null)
    (__var0 == 1)
  end

  def self.atomic_pointer_get(atomic : Void*)
    LibGLib.atomic_pointer_get(atomic)
    nil
  end

  def self.atomic_pointer_or(atomic : Void*, val : ::Int)
    __var0 = LibGLib.atomic_pointer_or(atomic, UInt64.new(val))
    __var0
  end

  def self.atomic_pointer_set(atomic : Void*, newval : Void*?)
    LibGLib.atomic_pointer_set(atomic, newval ? newval : Pointer(Void).null)
    nil
  end

  def self.atomic_pointer_xor(atomic : Void*, val : ::Int)
    __var0 = LibGLib.atomic_pointer_xor(atomic, UInt64.new(val))
    __var0
  end

  def self.atomic_rc_box_acquire(mem_block : Void*)
    LibGLib.atomic_rc_box_acquire(mem_block)
    nil
  end

  def self.atomic_rc_box_alloc(block_size : ::Int)
    LibGLib.atomic_rc_box_alloc(UInt64.new(block_size))
    nil
  end

  def self.atomic_rc_box_alloc0(block_size : ::Int)
    LibGLib.atomic_rc_box_alloc0(UInt64.new(block_size))
    nil
  end

  def self.atomic_rc_box_dup(block_size : ::Int, mem_block : Void*)
    LibGLib.atomic_rc_box_dup(UInt64.new(block_size), mem_block)
    nil
  end

  def self.atomic_rc_box_get_size(mem_block : Void*)
    __var0 = LibGLib.atomic_rc_box_get_size(mem_block)
    __var0
  end

  def self.atomic_rc_box_release(mem_block : Void*)
    LibGLib.atomic_rc_box_release(mem_block)
    nil
  end

  def self.atomic_rc_box_release_full(mem_block : Void*, clear_func : GLib::DestroyNotify)
    LibGLib.atomic_rc_box_release_full(mem_block, clear_func)
    nil
  end

  def self.atomic_ref_count_compare(arc : ::Int, val : ::Int)
    __var0 = LibGLib.atomic_ref_count_compare(arc, Int32.new(val))
    (__var0 == 1)
  end

  def self.atomic_ref_count_dec(arc : ::Int)
    __var0 = LibGLib.atomic_ref_count_dec(arc)
    (__var0 == 1)
  end

  def self.atomic_ref_count_inc(arc : ::Int)
    LibGLib.atomic_ref_count_inc(arc)
    nil
  end

  def self.atomic_ref_count_init(arc : ::Int)
    LibGLib.atomic_ref_count_init(arc)
    nil
  end

  def self.base64_decode(text : ::String)
    __var0 = LibGLib.base64_decode(text.to_unsafe, out out_len)
    GObject.raise_unexpected_null("g_base64_decode") if __var0.null?
    {GObject::PointerIterator.new(__var0) { |__var1|
      __var1
    }, out_len}
  end

  def self.base64_decode_inplace(text : ::Bytes, out_len : ::Int)
    __var0 = LibGLib.base64_decode_inplace(text, out_len)
    GObject.raise_unexpected_null("g_base64_decode_inplace") if __var0.null?
    __var0
  end

  def self.base64_encode(data : ::Bytes?)
    len = data ? data.size : 0
    __var0 = LibGLib.base64_encode(data ? data.to_unsafe : Pointer(UInt8).null, UInt64.new(len))
    GObject.raise_unexpected_null("g_base64_encode") if __var0.null?
    ::String.new(__var0)
  end

  def self.base64_encode_close(break_lines : ::Bool, _out : ::Bytes, state : ::Int, save : ::Int)
    __var0 = LibGLib.base64_encode_close(LibC::Int.new(break_lines ? 1 : 0), _out, state, save)
    __var0
  end

  def self.base64_encode_step(_in : ::Bytes, break_lines : ::Bool, _out : ::Bytes, state : ::Int, save : ::Int)
    len = _in.size
    __var0 = LibGLib.base64_encode_step(_in.to_unsafe, UInt64.new(len), LibC::Int.new(break_lines ? 1 : 0), _out, state, save)
    __var0
  end

  def self.basename(file_name : ::String)
    __var0 = LibGLib.basename(file_name.to_unsafe)
    GObject.raise_unexpected_null("g_basename") if __var0.null?
    ::String.new(__var0)
  end

  def self.bit_lock(address : ::Int, lock_bit : ::Int)
    LibGLib.bit_lock(address, Int32.new(lock_bit))
    nil
  end

  def self.bit_nth_lsf(mask : ::Int, nth_bit : ::Int)
    __var0 = LibGLib.bit_nth_lsf(UInt64.new(mask), Int32.new(nth_bit))
    __var0
  end

  def self.bit_nth_msf(mask : ::Int, nth_bit : ::Int)
    __var0 = LibGLib.bit_nth_msf(UInt64.new(mask), Int32.new(nth_bit))
    __var0
  end

  def self.bit_storage(number : ::Int)
    __var0 = LibGLib.bit_storage(UInt64.new(number))
    __var0
  end

  def self.bit_trylock(address : ::Int, lock_bit : ::Int)
    __var0 = LibGLib.bit_trylock(address, Int32.new(lock_bit))
    (__var0 == 1)
  end

  def self.bit_unlock(address : ::Int, lock_bit : ::Int)
    LibGLib.bit_unlock(address, Int32.new(lock_bit))
    nil
  end

  def self.bookmark_file_error_quark
    __var0 = LibGLib.bookmark_file_error_quark
    __var0
  end

  def self.build_filenamev(args : ::Enumerable)
    __var0 = LibGLib.build_filenamev((__args_ary = args.map { |__item| __item.to_unsafe }.to_a).to_unsafe)
    GObject.raise_unexpected_null("g_build_filenamev") if __var0.null?
    ::String.new(__var0)
  end

  def self.build_pathv(separator : ::String, args : ::Enumerable)
    __var0 = LibGLib.build_pathv(separator.to_unsafe, (__args_ary = args.map { |__item| __item.to_unsafe }.to_a).to_unsafe)
    GObject.raise_unexpected_null("g_build_pathv") if __var0.null?
    ::String.new(__var0)
  end

  def self.byte_array_free(array : ::Bytes, free_segment : ::Bool)
    __var0 = LibGLib.byte_array_free(array.to_unsafe, LibC::Int.new(free_segment ? 1 : 0))
    GObject.raise_unexpected_null("g_byte_array_free") if __var0.null?
    __var0
  end

  def self.byte_array_free_to_bytes(array : ::Bytes)
    __var0 = LibGLib.byte_array_free_to_bytes(array.to_unsafe)
    GObject.raise_unexpected_null("g_byte_array_free_to_bytes") if __var0.null?
    GLib::Bytes.new(__var0)
  end

  def self.byte_array_new
    __var0 = LibGLib.byte_array_new
    GObject.raise_unexpected_null("g_byte_array_new") if __var0.null?
    __var0
  end

  def self.byte_array_new_take(data : ::Bytes)
    len = data.size
    __var0 = LibGLib.byte_array_new_take(data.to_unsafe, UInt64.new(len))
    GObject.raise_unexpected_null("g_byte_array_new_take") if __var0.null?
    __var0
  end

  def self.byte_array_steal(array : ::Bytes)
    __var0 = LibGLib.byte_array_steal(array.to_unsafe, out len)
    GObject.raise_unexpected_null("g_byte_array_steal") if __var0.null?
    {__var0, len}
  end

  def self.byte_array_unref(array : ::Bytes)
    LibGLib.byte_array_unref(array.to_unsafe)
    nil
  end

  def self.canonicalize_filename(filename : ::String, relative_to : ::String?)
    __var0 = LibGLib.canonicalize_filename(filename.to_unsafe, relative_to ? relative_to.to_unsafe : Pointer(UInt8).null)
    GObject.raise_unexpected_null("g_canonicalize_filename") if __var0.null?
    ::String.new(__var0)
  end

  def self.chdir(path : ::String)
    __var0 = LibGLib.chdir(path.to_unsafe)
    __var0
  end

  def self.check_version(required_major : ::Int, required_minor : ::Int, required_micro : ::Int)
    __var0 = LibGLib.check_version(UInt32.new(required_major), UInt32.new(required_minor), UInt32.new(required_micro))
    GObject.raise_unexpected_null("glib_check_version") if __var0.null?
    ::String.new(__var0)
  end

  def self.checksum_type_get_length(checksum_type : GLib::ChecksumType)
    __var0 = LibGLib.checksum_type_get_length(checksum_type)
    __var0
  end

  def self.child_watch_add(priority : ::Int, pid : ::Int, function : GLib::ChildWatchFunc, data : Void*?, notify : GLib::DestroyNotify?)
    __var0 = LibGLib.child_watch_add(Int32.new(priority), Int32.new(pid), function, data ? data : Pointer(Void).null, notify ? notify : nil)
    __var0
  end

  def self.child_watch_source_new(pid : ::Int)
    __var0 = LibGLib.child_watch_source_new(Int32.new(pid))
    GObject.raise_unexpected_null("g_child_watch_source_new") if __var0.null?
    GLib::Source.new(__var0)
  end

  def self.clear_error
    __var0 = Pointer(LibGLib::Error).null
    LibGLib.clear_error(pointerof(__var0))
    GLib::Error.assert(__var0)
    nil
  end

  def self.close(fd : ::Int)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.close(Int32.new(fd), pointerof(__var0))
    GLib::Error.assert(__var0)
    (__var1 == 1)
  end

  def self.compute_checksum_for_bytes(checksum_type : GLib::ChecksumType, data : GLib::Bytes)
    __var0 = LibGLib.compute_checksum_for_bytes(checksum_type, data.to_unsafe.as(LibGLib::Bytes*))
    GObject.raise_unexpected_null("g_compute_checksum_for_bytes") if __var0.null?
    ::String.new(__var0)
  end

  def self.compute_checksum_for_data(checksum_type : GLib::ChecksumType, data : ::Bytes)
    length = data.size
    __var0 = LibGLib.compute_checksum_for_data(checksum_type, data.to_unsafe, UInt64.new(length))
    GObject.raise_unexpected_null("g_compute_checksum_for_data") if __var0.null?
    ::String.new(__var0)
  end

  def self.compute_checksum_for_string(checksum_type : GLib::ChecksumType, str : ::String, length : ::Int)
    __var0 = LibGLib.compute_checksum_for_string(checksum_type, str.to_unsafe, Int64.new(length))
    GObject.raise_unexpected_null("g_compute_checksum_for_string") if __var0.null?
    ::String.new(__var0)
  end

  def self.compute_hmac_for_bytes(digest_type : GLib::ChecksumType, key : GLib::Bytes, data : GLib::Bytes)
    __var0 = LibGLib.compute_hmac_for_bytes(digest_type, key.to_unsafe.as(LibGLib::Bytes*), data.to_unsafe.as(LibGLib::Bytes*))
    GObject.raise_unexpected_null("g_compute_hmac_for_bytes") if __var0.null?
    ::String.new(__var0)
  end

  def self.compute_hmac_for_data(digest_type : GLib::ChecksumType, key : ::Bytes, data : ::Bytes)
    key_len = key.size
    length = data.size
    __var0 = LibGLib.compute_hmac_for_data(digest_type, key.to_unsafe, UInt64.new(key_len), data.to_unsafe, UInt64.new(length))
    GObject.raise_unexpected_null("g_compute_hmac_for_data") if __var0.null?
    ::String.new(__var0)
  end

  def self.compute_hmac_for_string(digest_type : GLib::ChecksumType, key : ::Bytes, str : ::String, length : ::Int)
    key_len = key.size
    __var0 = LibGLib.compute_hmac_for_string(digest_type, key.to_unsafe, UInt64.new(key_len), str.to_unsafe, Int64.new(length))
    GObject.raise_unexpected_null("g_compute_hmac_for_string") if __var0.null?
    ::String.new(__var0)
  end

  def self.convert(str : ::Bytes, to_codeset : ::String, from_codeset : ::String)
    len = str.size
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.convert(str.to_unsafe, Int64.new(len), to_codeset.to_unsafe, from_codeset.to_unsafe, out bytes_read, out bytes_written, pointerof(__var0))
    GLib::Error.assert(__var0)
    GObject.raise_unexpected_null("g_convert") if __var1.null?
    {GObject::PointerIterator.new(__var1) { |__var2|
      __var2
    }, bytes_read, bytes_written}
  end

  def self.convert_error_quark
    __var0 = LibGLib.convert_error_quark
    __var0
  end

  def self.convert_with_fallback(str : ::Bytes, to_codeset : ::String, from_codeset : ::String, fallback : ::String)
    len = str.size
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.convert_with_fallback(str.to_unsafe, Int64.new(len), to_codeset.to_unsafe, from_codeset.to_unsafe, fallback.to_unsafe, out bytes_read, out bytes_written, pointerof(__var0))
    GLib::Error.assert(__var0)
    GObject.raise_unexpected_null("g_convert_with_fallback") if __var1.null?
    {GObject::PointerIterator.new(__var1) { |__var2|
      __var2
    }, bytes_read, bytes_written}
  end

  def self.datalist_foreach(datalist : GLib::Data, func : GLib::DataForeachFunc, user_data : Void*?)
    LibGLib.datalist_foreach(datalist.to_unsafe.as(LibGLib::Data*), func, user_data ? user_data : Pointer(Void).null)
    nil
  end

  def self.datalist_get_data(datalist : GLib::Data, key : ::String)
    LibGLib.datalist_get_data(datalist.to_unsafe.as(LibGLib::Data*), key.to_unsafe)
    nil
  end

  def self.datalist_get_flags(datalist : GLib::Data)
    __var0 = LibGLib.datalist_get_flags(datalist.to_unsafe.as(LibGLib::Data*))
    __var0
  end

  def self.datalist_id_get_data(datalist : GLib::Data, key_id : ::Int)
    LibGLib.datalist_id_get_data(datalist.to_unsafe.as(LibGLib::Data*), UInt32.new(key_id))
    nil
  end

  def self.datalist_set_flags(datalist : GLib::Data, flags : ::Int)
    LibGLib.datalist_set_flags(datalist.to_unsafe.as(LibGLib::Data*), UInt32.new(flags))
    nil
  end

  def self.datalist_unset_flags(datalist : GLib::Data, flags : ::Int)
    LibGLib.datalist_unset_flags(datalist.to_unsafe.as(LibGLib::Data*), UInt32.new(flags))
    nil
  end

  def self.dataset_destroy(dataset_location : Void*)
    LibGLib.dataset_destroy(dataset_location)
    nil
  end

  def self.dataset_foreach(dataset_location : Void*, func : GLib::DataForeachFunc, user_data : Void*?)
    LibGLib.dataset_foreach(dataset_location, func, user_data ? user_data : Pointer(Void).null)
    nil
  end

  def self.dataset_id_get_data(dataset_location : Void*, key_id : ::Int)
    LibGLib.dataset_id_get_data(dataset_location, UInt32.new(key_id))
    nil
  end

  def self.date_get_days_in_month(month : GLib::DateMonth, year : ::Int)
    __var0 = LibGLib.date_get_days_in_month(month, UInt16.new(year))
    __var0
  end

  def self.date_get_monday_weeks_in_year(year : ::Int)
    __var0 = LibGLib.date_get_monday_weeks_in_year(UInt16.new(year))
    __var0
  end

  def self.date_get_sunday_weeks_in_year(year : ::Int)
    __var0 = LibGLib.date_get_sunday_weeks_in_year(UInt16.new(year))
    __var0
  end

  def self.date_is_leap_year(year : ::Int)
    __var0 = LibGLib.date_is_leap_year(UInt16.new(year))
    (__var0 == 1)
  end

  def self.date_strftime(s : ::String, slen : ::Int, format : ::String, date : GLib::Date)
    __var0 = LibGLib.date_strftime(s.to_unsafe, UInt64.new(slen), format.to_unsafe, date.to_unsafe.as(LibGLib::Date*))
    __var0
  end

  def self.date_time_compare(dt1 : Void*, dt2 : Void*)
    __var0 = LibGLib.date_time_compare(dt1, dt2)
    __var0
  end

  def self.date_time_equal(dt1 : Void*, dt2 : Void*)
    __var0 = LibGLib.date_time_equal(dt1, dt2)
    (__var0 == 1)
  end

  def self.date_time_hash(datetime : Void*)
    __var0 = LibGLib.date_time_hash(datetime)
    __var0
  end

  def self.date_valid_day(day : ::Int)
    __var0 = LibGLib.date_valid_day(UInt8.new(day))
    (__var0 == 1)
  end

  def self.date_valid_dmy(day : ::Int, month : GLib::DateMonth, year : ::Int)
    __var0 = LibGLib.date_valid_dmy(UInt8.new(day), month, UInt16.new(year))
    (__var0 == 1)
  end

  def self.date_valid_julian(julian_date : ::Int)
    __var0 = LibGLib.date_valid_julian(UInt32.new(julian_date))
    (__var0 == 1)
  end

  def self.date_valid_month(month : GLib::DateMonth)
    __var0 = LibGLib.date_valid_month(month)
    (__var0 == 1)
  end

  def self.date_valid_weekday(weekday : GLib::DateWeekday)
    __var0 = LibGLib.date_valid_weekday(weekday)
    (__var0 == 1)
  end

  def self.date_valid_year(year : ::Int)
    __var0 = LibGLib.date_valid_year(UInt16.new(year))
    (__var0 == 1)
  end

  def self.dcgettext(domain : ::String?, msgid : ::String, category : ::Int)
    __var0 = LibGLib.dcgettext(domain ? domain.to_unsafe : Pointer(UInt8).null, msgid.to_unsafe, Int32.new(category))
    GObject.raise_unexpected_null("g_dcgettext") if __var0.null?
    ::String.new(__var0)
  end

  def self.dgettext(domain : ::String?, msgid : ::String)
    __var0 = LibGLib.dgettext(domain ? domain.to_unsafe : Pointer(UInt8).null, msgid.to_unsafe)
    GObject.raise_unexpected_null("g_dgettext") if __var0.null?
    ::String.new(__var0)
  end

  def self.dir_make_tmp(tmpl : ::String?)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.dir_make_tmp(tmpl ? tmpl.to_unsafe : Pointer(UInt8).null, pointerof(__var0))
    GLib::Error.assert(__var0)
    GObject.raise_unexpected_null("g_dir_make_tmp") if __var1.null?
    ::String.new(__var1)
  end

  def self.direct_equal(v1 : Void*?, v2 : Void*?)
    __var0 = LibGLib.direct_equal(v1 ? v1 : Pointer(Void).null, v2 ? v2 : Pointer(Void).null)
    (__var0 == 1)
  end

  def self.direct_hash(v : Void*?)
    __var0 = LibGLib.direct_hash(v ? v : Pointer(Void).null)
    __var0
  end

  def self.dngettext(domain : ::String?, msgid : ::String, msgid_plural : ::String, n : ::Int)
    __var0 = LibGLib.dngettext(domain ? domain.to_unsafe : Pointer(UInt8).null, msgid.to_unsafe, msgid_plural.to_unsafe, UInt64.new(n))
    GObject.raise_unexpected_null("g_dngettext") if __var0.null?
    ::String.new(__var0)
  end

  def self.double_equal(v1 : Void*, v2 : Void*)
    __var0 = LibGLib.double_equal(v1, v2)
    (__var0 == 1)
  end

  def self.double_hash(v : Void*)
    __var0 = LibGLib.double_hash(v)
    __var0
  end

  def self.dpgettext(domain : ::String?, msgctxtid : ::String, msgidoffset : ::Int)
    __var0 = LibGLib.dpgettext(domain ? domain.to_unsafe : Pointer(UInt8).null, msgctxtid.to_unsafe, UInt64.new(msgidoffset))
    GObject.raise_unexpected_null("g_dpgettext") if __var0.null?
    ::String.new(__var0)
  end

  def self.dpgettext2(domain : ::String?, context : ::String, msgid : ::String)
    __var0 = LibGLib.dpgettext2(domain ? domain.to_unsafe : Pointer(UInt8).null, context.to_unsafe, msgid.to_unsafe)
    GObject.raise_unexpected_null("g_dpgettext2") if __var0.null?
    ::String.new(__var0)
  end

  def self.environ_getenv(envp : ::Enumerable?, variable : ::String)
    __var0 = LibGLib.environ_getenv(envp ? (__envp_ary = envp.map { |__item| __item.to_unsafe }.to_a).to_unsafe : Pointer(Pointer(UInt8)).null, variable.to_unsafe)
    GObject.raise_unexpected_null("g_environ_getenv") if __var0.null?
    ::String.new(__var0)
  end

  def self.environ_setenv(envp : ::Enumerable?, variable : ::String, value : ::String, overwrite : ::Bool)
    __var0 = LibGLib.environ_setenv(envp ? (__envp_ary = envp.map { |__item| __item.to_unsafe }.to_a).to_unsafe : Pointer(Pointer(UInt8)).null, variable.to_unsafe, value.to_unsafe, LibC::Int.new(overwrite ? 1 : 0))
    GObject.raise_unexpected_null("g_environ_setenv") if __var0.null?
    GObject::PointerIterator.new(__var0) { |__var1|
      ::String.new(__var1)
    }
  end

  def self.environ_unsetenv(envp : ::Enumerable?, variable : ::String)
    __var0 = LibGLib.environ_unsetenv(envp ? (__envp_ary = envp.map { |__item| __item.to_unsafe }.to_a).to_unsafe : Pointer(Pointer(UInt8)).null, variable.to_unsafe)
    GObject.raise_unexpected_null("g_environ_unsetenv") if __var0.null?
    GObject::PointerIterator.new(__var0) { |__var1|
      ::String.new(__var1)
    }
  end

  def self.file_error_from_errno(err_no : ::Int)
    __var0 = LibGLib.file_error_from_errno(Int32.new(err_no))
    GLib::FileError.new(__var0)
  end

  def self.file_error_quark
    __var0 = LibGLib.file_error_quark
    __var0
  end

  def self.file_get_contents(filename : ::String, contents : ::Bytes)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.file_get_contents(filename.to_unsafe, contents, out length, pointerof(__var0))
    GLib::Error.assert(__var0)
    {(__var1 == 1), length}
  end

  def self.file_open_tmp(tmpl : ::String?)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.file_open_tmp(tmpl ? tmpl.to_unsafe : Pointer(UInt8).null, out name_used, pointerof(__var0))
    GLib::Error.assert(__var0)
    {__var1, ::String.new(name_used)}
  end

  def self.file_read_link(filename : ::String)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.file_read_link(filename.to_unsafe, pointerof(__var0))
    GLib::Error.assert(__var0)
    GObject.raise_unexpected_null("g_file_read_link") if __var1.null?
    ::String.new(__var1)
  end

  def self.file_set_contents(filename : ::String, contents : ::Bytes)
    length = contents.size
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.file_set_contents(filename.to_unsafe, contents.to_unsafe, Int64.new(length), pointerof(__var0))
    GLib::Error.assert(__var0)
    (__var1 == 1)
  end

  def self.file_test(filename : ::String, test : GLib::FileTest)
    __var0 = LibGLib.file_test(filename.to_unsafe, test)
    (__var0 == 1)
  end

  def self.filename_display_basename(filename : ::String)
    __var0 = LibGLib.filename_display_basename(filename.to_unsafe)
    GObject.raise_unexpected_null("g_filename_display_basename") if __var0.null?
    ::String.new(__var0)
  end

  def self.filename_display_name(filename : ::String)
    __var0 = LibGLib.filename_display_name(filename.to_unsafe)
    GObject.raise_unexpected_null("g_filename_display_name") if __var0.null?
    ::String.new(__var0)
  end

  def self.filename_from_uri(uri : ::String)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.filename_from_uri(uri.to_unsafe, out hostname, pointerof(__var0))
    GLib::Error.assert(__var0)
    GObject.raise_unexpected_null("g_filename_from_uri") if __var1.null?
    {::String.new(__var1), ::String.new(hostname)}
  end

  def self.filename_from_utf8(utf8string : ::String, len : ::Int)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.filename_from_utf8(utf8string.to_unsafe, Int64.new(len), out bytes_read, out bytes_written, pointerof(__var0))
    GLib::Error.assert(__var0)
    GObject.raise_unexpected_null("g_filename_from_utf8") if __var1.null?
    {::String.new(__var1), bytes_read, bytes_written}
  end

  def self.filename_to_uri(filename : ::String, hostname : ::String?)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.filename_to_uri(filename.to_unsafe, hostname ? hostname.to_unsafe : Pointer(UInt8).null, pointerof(__var0))
    GLib::Error.assert(__var0)
    GObject.raise_unexpected_null("g_filename_to_uri") if __var1.null?
    ::String.new(__var1)
  end

  def self.filename_to_utf8(opsysstring : ::String, len : ::Int)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.filename_to_utf8(opsysstring.to_unsafe, Int64.new(len), out bytes_read, out bytes_written, pointerof(__var0))
    GLib::Error.assert(__var0)
    GObject.raise_unexpected_null("g_filename_to_utf8") if __var1.null?
    {::String.new(__var1), bytes_read, bytes_written}
  end

  def self.find_program_in_path(program : ::String)
    __var0 = LibGLib.find_program_in_path(program.to_unsafe)
    __var1 = ::String.new(__var0) if __var0
    __var1
  end

  def self.format_size(size : ::Int)
    __var0 = LibGLib.format_size(UInt64.new(size))
    GObject.raise_unexpected_null("g_format_size") if __var0.null?
    ::String.new(__var0)
  end

  def self.format_size_for_display(size : ::Int)
    __var0 = LibGLib.format_size_for_display(Int64.new(size))
    GObject.raise_unexpected_null("g_format_size_for_display") if __var0.null?
    ::String.new(__var0)
  end

  def self.format_size_full(size : ::Int, flags : GLib::FormatSizeFlags)
    __var0 = LibGLib.format_size_full(UInt64.new(size), flags)
    GObject.raise_unexpected_null("g_format_size_full") if __var0.null?
    ::String.new(__var0)
  end

  def self.free(mem : Void*?)
    LibGLib.free(mem ? mem : Pointer(Void).null)
    nil
  end

  def self.application_name
    __var0 = LibGLib.get_application_name
    __var1 = ::String.new(__var0) if __var0
    __var1
  end

  def self.charset
    __var0 = LibGLib.get_charset(out charset)
    {(__var0 == 1), ::String.new(charset)}
  end

  def self.codeset
    __var0 = LibGLib.get_codeset
    GObject.raise_unexpected_null("g_get_codeset") if __var0.null?
    ::String.new(__var0)
  end

  def self.console_charset
    __var0 = LibGLib.get_console_charset(out charset)
    {(__var0 == 1), ::String.new(charset)}
  end

  def self.current_dir
    __var0 = LibGLib.get_current_dir
    GObject.raise_unexpected_null("g_get_current_dir") if __var0.null?
    ::String.new(__var0)
  end

  def self.current_time(result : GLib::TimeVal)
    LibGLib.get_current_time(result.to_unsafe.as(LibGLib::TimeVal*))
    nil
  end

  def self.environ
    __var0 = LibGLib.get_environ
    GObject.raise_unexpected_null("g_get_environ") if __var0.null?
    GObject::PointerIterator.new(__var0) { |__var1|
      ::String.new(__var1)
    }
  end

  def self.filename_charsets(filename_charsets : ::Enumerable)
    __var0 = LibGLib.get_filename_charsets(filename_charsets)
    (__var0 == 1)
  end

  def self.home_dir
    __var0 = LibGLib.get_home_dir
    GObject.raise_unexpected_null("g_get_home_dir") if __var0.null?
    ::String.new(__var0)
  end

  def self.host_name
    __var0 = LibGLib.get_host_name
    GObject.raise_unexpected_null("g_get_host_name") if __var0.null?
    ::String.new(__var0)
  end

  def self.language_names
    __var0 = LibGLib.get_language_names
    GObject.raise_unexpected_null("g_get_language_names") if __var0.null?
    GObject::PointerIterator.new(__var0) { |__var1|
      ::String.new(__var1)
    }
  end

  def self.language_names_with_category(category_name : ::String)
    __var0 = LibGLib.get_language_names_with_category(category_name.to_unsafe)
    GObject.raise_unexpected_null("g_get_language_names_with_category") if __var0.null?
    GObject::PointerIterator.new(__var0) { |__var1|
      ::String.new(__var1)
    }
  end

  def self.locale_variants(locale : ::String)
    __var0 = LibGLib.get_locale_variants(locale.to_unsafe)
    GObject.raise_unexpected_null("g_get_locale_variants") if __var0.null?
    GObject::PointerIterator.new(__var0) { |__var1|
      ::String.new(__var1)
    }
  end

  def self.monotonic_time
    __var0 = LibGLib.get_monotonic_time
    __var0
  end

  def self.num_processors
    __var0 = LibGLib.get_num_processors
    __var0
  end

  def self.os_info(key_name : ::String)
    __var0 = LibGLib.get_os_info(key_name.to_unsafe)
    __var1 = ::String.new(__var0) if __var0
    __var1
  end

  def self.prgname
    __var0 = LibGLib.get_prgname
    __var1 = ::String.new(__var0) if __var0
    __var1
  end

  def self.real_name
    __var0 = LibGLib.get_real_name
    GObject.raise_unexpected_null("g_get_real_name") if __var0.null?
    ::String.new(__var0)
  end

  def self.real_time
    __var0 = LibGLib.get_real_time
    __var0
  end

  def self.system_config_dirs
    __var0 = LibGLib.get_system_config_dirs
    GObject.raise_unexpected_null("g_get_system_config_dirs") if __var0.null?
    GObject::PointerIterator.new(__var0) { |__var1|
      ::String.new(__var1)
    }
  end

  def self.system_data_dirs
    __var0 = LibGLib.get_system_data_dirs
    GObject.raise_unexpected_null("g_get_system_data_dirs") if __var0.null?
    GObject::PointerIterator.new(__var0) { |__var1|
      ::String.new(__var1)
    }
  end

  def self.tmp_dir
    __var0 = LibGLib.get_tmp_dir
    GObject.raise_unexpected_null("g_get_tmp_dir") if __var0.null?
    ::String.new(__var0)
  end

  def self.user_cache_dir
    __var0 = LibGLib.get_user_cache_dir
    GObject.raise_unexpected_null("g_get_user_cache_dir") if __var0.null?
    ::String.new(__var0)
  end

  def self.user_config_dir
    __var0 = LibGLib.get_user_config_dir
    GObject.raise_unexpected_null("g_get_user_config_dir") if __var0.null?
    ::String.new(__var0)
  end

  def self.user_data_dir
    __var0 = LibGLib.get_user_data_dir
    GObject.raise_unexpected_null("g_get_user_data_dir") if __var0.null?
    ::String.new(__var0)
  end

  def self.user_name
    __var0 = LibGLib.get_user_name
    GObject.raise_unexpected_null("g_get_user_name") if __var0.null?
    ::String.new(__var0)
  end

  def self.user_runtime_dir
    __var0 = LibGLib.get_user_runtime_dir
    GObject.raise_unexpected_null("g_get_user_runtime_dir") if __var0.null?
    ::String.new(__var0)
  end

  def self.user_special_dir(directory : GLib::UserDirectory)
    __var0 = LibGLib.get_user_special_dir(directory)
    GObject.raise_unexpected_null("g_get_user_special_dir") if __var0.null?
    ::String.new(__var0)
  end

  def self.getenv(variable : ::String)
    __var0 = LibGLib.getenv(variable.to_unsafe)
    GObject.raise_unexpected_null("g_getenv") if __var0.null?
    ::String.new(__var0)
  end

  def self.hash_table_add(hash_table : Void*, key : Void*?)
    __var0 = LibGLib.hash_table_add(hash_table, key ? key : Pointer(Void).null)
    (__var0 == 1)
  end

  def self.hash_table_contains(hash_table : Void*, key : Void*?)
    __var0 = LibGLib.hash_table_contains(hash_table, key ? key : Pointer(Void).null)
    (__var0 == 1)
  end

  def self.hash_table_destroy(hash_table : Void*)
    LibGLib.hash_table_destroy(hash_table)
    nil
  end

  def self.hash_table_insert(hash_table : Void*, key : Void*?, value : Void*?)
    __var0 = LibGLib.hash_table_insert(hash_table, key ? key : Pointer(Void).null, value ? value : Pointer(Void).null)
    (__var0 == 1)
  end

  def self.hash_table_lookup(hash_table : Void*, key : Void*?)
    LibGLib.hash_table_lookup(hash_table, key ? key : Pointer(Void).null)
    nil
  end

  def self.hash_table_lookup_extended(hash_table : Void*, lookup_key : Void*?, orig_key : Void*?, value : Void*?)
    __var0 = LibGLib.hash_table_lookup_extended(hash_table, lookup_key ? lookup_key : Pointer(Void).null, orig_key, value)
    (__var0 == 1)
  end

  def self.hash_table_remove(hash_table : Void*, key : Void*?)
    __var0 = LibGLib.hash_table_remove(hash_table, key ? key : Pointer(Void).null)
    (__var0 == 1)
  end

  def self.hash_table_remove_all(hash_table : Void*)
    LibGLib.hash_table_remove_all(hash_table)
    nil
  end

  def self.hash_table_replace(hash_table : Void*, key : Void*?, value : Void*?)
    __var0 = LibGLib.hash_table_replace(hash_table, key ? key : Pointer(Void).null, value ? value : Pointer(Void).null)
    (__var0 == 1)
  end

  def self.hash_table_size(hash_table : Void*)
    __var0 = LibGLib.hash_table_size(hash_table)
    __var0
  end

  def self.hash_table_steal(hash_table : Void*, key : Void*?)
    __var0 = LibGLib.hash_table_steal(hash_table, key ? key : Pointer(Void).null)
    (__var0 == 1)
  end

  def self.hash_table_steal_all(hash_table : Void*)
    LibGLib.hash_table_steal_all(hash_table)
    nil
  end

  def self.hash_table_steal_extended(hash_table : Void*, lookup_key : Void*?, stolen_key : Void*?, stolen_value : Void*?)
    __var0 = LibGLib.hash_table_steal_extended(hash_table, lookup_key ? lookup_key : Pointer(Void).null, stolen_key, stolen_value)
    (__var0 == 1)
  end

  def self.hash_table_unref(hash_table : Void*)
    LibGLib.hash_table_unref(hash_table)
    nil
  end

  def self.hook_destroy(hook_list : GLib::HookList, hook_id : ::Int)
    __var0 = LibGLib.hook_destroy(hook_list.to_unsafe.as(LibGLib::HookList*), UInt64.new(hook_id))
    (__var0 == 1)
  end

  def self.hook_destroy_link(hook_list : GLib::HookList, hook : GLib::Hook)
    LibGLib.hook_destroy_link(hook_list.to_unsafe.as(LibGLib::HookList*), hook.to_unsafe.as(LibGLib::Hook*))
    nil
  end

  def self.hook_free(hook_list : GLib::HookList, hook : GLib::Hook)
    LibGLib.hook_free(hook_list.to_unsafe.as(LibGLib::HookList*), hook.to_unsafe.as(LibGLib::Hook*))
    nil
  end

  def self.hook_insert_before(hook_list : GLib::HookList, sibling : GLib::Hook?, hook : GLib::Hook)
    LibGLib.hook_insert_before(hook_list.to_unsafe.as(LibGLib::HookList*), sibling ? sibling.to_unsafe.as(LibGLib::Hook*) : Pointer(LibGLib::Hook).null, hook.to_unsafe.as(LibGLib::Hook*))
    nil
  end

  def self.hook_prepend(hook_list : GLib::HookList, hook : GLib::Hook)
    LibGLib.hook_prepend(hook_list.to_unsafe.as(LibGLib::HookList*), hook.to_unsafe.as(LibGLib::Hook*))
    nil
  end

  def self.hook_unref(hook_list : GLib::HookList, hook : GLib::Hook)
    LibGLib.hook_unref(hook_list.to_unsafe.as(LibGLib::HookList*), hook.to_unsafe.as(LibGLib::Hook*))
    nil
  end

  def self.hostname_is_ascii_encoded(hostname : ::String)
    __var0 = LibGLib.hostname_is_ascii_encoded(hostname.to_unsafe)
    (__var0 == 1)
  end

  def self.hostname_is_ip_address(hostname : ::String)
    __var0 = LibGLib.hostname_is_ip_address(hostname.to_unsafe)
    (__var0 == 1)
  end

  def self.hostname_is_non_ascii(hostname : ::String)
    __var0 = LibGLib.hostname_is_non_ascii(hostname.to_unsafe)
    (__var0 == 1)
  end

  def self.hostname_to_ascii(hostname : ::String)
    __var0 = LibGLib.hostname_to_ascii(hostname.to_unsafe)
    GObject.raise_unexpected_null("g_hostname_to_ascii") if __var0.null?
    ::String.new(__var0)
  end

  def self.hostname_to_unicode(hostname : ::String)
    __var0 = LibGLib.hostname_to_unicode(hostname.to_unsafe)
    GObject.raise_unexpected_null("g_hostname_to_unicode") if __var0.null?
    ::String.new(__var0)
  end

  def self.idle_add(priority : ::Int, function : GLib::SourceFunc, data : Void*?, notify : GLib::DestroyNotify?)
    __var0 = LibGLib.idle_add(Int32.new(priority), function, data ? data : Pointer(Void).null, notify ? notify : nil)
    __var0
  end

  def self.idle_remove_by_data(data : Void*?)
    __var0 = LibGLib.idle_remove_by_data(data ? data : Pointer(Void).null)
    (__var0 == 1)
  end

  def self.idle_source_new
    __var0 = LibGLib.idle_source_new
    GObject.raise_unexpected_null("g_idle_source_new") if __var0.null?
    GLib::Source.new(__var0)
  end

  def self.int64_equal(v1 : Void*, v2 : Void*)
    __var0 = LibGLib.int64_equal(v1, v2)
    (__var0 == 1)
  end

  def self.int64_hash(v : Void*)
    __var0 = LibGLib.int64_hash(v)
    __var0
  end

  def self.int_equal(v1 : Void*, v2 : Void*)
    __var0 = LibGLib.int_equal(v1, v2)
    (__var0 == 1)
  end

  def self.int_hash(v : Void*)
    __var0 = LibGLib.int_hash(v)
    __var0
  end

  def self.intern_static_string(string : ::String?)
    __var0 = LibGLib.intern_static_string(string ? string.to_unsafe : Pointer(UInt8).null)
    GObject.raise_unexpected_null("g_intern_static_string") if __var0.null?
    ::String.new(__var0)
  end

  def self.intern_string(string : ::String?)
    __var0 = LibGLib.intern_string(string ? string.to_unsafe : Pointer(UInt8).null)
    GObject.raise_unexpected_null("g_intern_string") if __var0.null?
    ::String.new(__var0)
  end

  def self.io_add_watch(channel : GLib::IOChannel, priority : ::Int, condition : GLib::IOCondition, func : GLib::IOFunc, user_data : Void*?, notify : GLib::DestroyNotify)
    __var0 = LibGLib.io_add_watch(channel.to_unsafe.as(LibGLib::IOChannel*), Int32.new(priority), condition, func, user_data ? user_data : Pointer(Void).null, notify)
    __var0
  end

  def self.io_channel_error_from_errno(en : ::Int)
    __var0 = LibGLib.io_channel_error_from_errno(Int32.new(en))
    GLib::IOChannelError.new(__var0)
  end

  def self.io_channel_error_quark
    __var0 = LibGLib.io_channel_error_quark
    __var0
  end

  def self.io_create_watch(channel : GLib::IOChannel, condition : GLib::IOCondition)
    __var0 = LibGLib.io_create_watch(channel.to_unsafe.as(LibGLib::IOChannel*), condition)
    GObject.raise_unexpected_null("g_io_create_watch") if __var0.null?
    GLib::Source.new(__var0)
  end

  def self.key_file_error_quark
    __var0 = LibGLib.key_file_error_quark
    __var0
  end

  def self.listenv
    __var0 = LibGLib.listenv
    GObject.raise_unexpected_null("g_listenv") if __var0.null?
    GObject::PointerIterator.new(__var0) { |__var1|
      ::String.new(__var1)
    }
  end

  def self.locale_from_utf8(utf8string : ::String, len : ::Int)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.locale_from_utf8(utf8string.to_unsafe, Int64.new(len), out bytes_read, out bytes_written, pointerof(__var0))
    GLib::Error.assert(__var0)
    GObject.raise_unexpected_null("g_locale_from_utf8") if __var1.null?
    {GObject::PointerIterator.new(__var1) { |__var2|
      __var2
    }, bytes_read, bytes_written}
  end

  def self.locale_to_utf8(opsysstring : ::Bytes)
    len = opsysstring.size
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.locale_to_utf8(opsysstring.to_unsafe, Int64.new(len), out bytes_read, out bytes_written, pointerof(__var0))
    GLib::Error.assert(__var0)
    GObject.raise_unexpected_null("g_locale_to_utf8") if __var1.null?
    {::String.new(__var1), bytes_read, bytes_written}
  end

  def self.log_default_handler(log_domain : ::String?, log_level : GLib::LogLevelFlags, message : ::String?, unused_data : Void*?)
    LibGLib.log_default_handler(log_domain ? log_domain.to_unsafe : Pointer(UInt8).null, log_level, message ? message.to_unsafe : Pointer(UInt8).null, unused_data ? unused_data : Pointer(Void).null)
    nil
  end

  def self.log_remove_handler(log_domain : ::String, handler_id : ::Int)
    LibGLib.log_remove_handler(log_domain.to_unsafe, UInt32.new(handler_id))
    nil
  end

  def self.log_set_always_fatal(fatal_mask : GLib::LogLevelFlags)
    __var0 = LibGLib.log_set_always_fatal(fatal_mask)
    GLib::LogLevelFlags.new(__var0)
  end

  def self.log_set_fatal_mask(log_domain : ::String, fatal_mask : GLib::LogLevelFlags)
    __var0 = LibGLib.log_set_fatal_mask(log_domain.to_unsafe, fatal_mask)
    GLib::LogLevelFlags.new(__var0)
  end

  def self.log_set_handler(log_domain : ::String?, log_levels : GLib::LogLevelFlags, log_func : GLib::LogFunc, user_data : Void*?, destroy : GLib::DestroyNotify)
    __var0 = LibGLib.log_set_handler(log_domain ? log_domain.to_unsafe : Pointer(UInt8).null, log_levels, log_func, user_data ? user_data : Pointer(Void).null, destroy)
    __var0
  end

  def self.log_set_writer_func(func : GLib::LogWriterFunc?, user_data : Void*?, user_data_free : GLib::DestroyNotify)
    LibGLib.log_set_writer_func(func ? func : nil, user_data ? user_data : Pointer(Void).null, user_data_free)
    nil
  end

  def self.log_structured_array(log_level : GLib::LogLevelFlags, fields : ::Enumerable)
    n_fields = fields.size
    __fields = (__fields_ary = fields.map { |__item| __item }.to_a).to_unsafe
    n_fields = __fields_ary.size
    LibGLib.log_structured_array(log_level, __fields, UInt64.new(n_fields))
    nil
  end

  def self.log_variant(log_domain : ::String?, log_level : GLib::LogLevelFlags, fields : GLib::Variant)
    LibGLib.log_variant(log_domain ? log_domain.to_unsafe : Pointer(UInt8).null, log_level, fields.to_unsafe.as(LibGLib::Variant*))
    nil
  end

  def self.log_writer_default(log_level : GLib::LogLevelFlags, fields : ::Enumerable, user_data : Void*?)
    n_fields = fields.size
    __fields = (__fields_ary = fields.map { |__item| __item }.to_a).to_unsafe
    n_fields = __fields_ary.size
    __var0 = LibGLib.log_writer_default(log_level, __fields, UInt64.new(n_fields), user_data ? user_data : Pointer(Void).null)
    GLib::LogWriterOutput.new(__var0)
  end

  def self.log_writer_format_fields(log_level : GLib::LogLevelFlags, fields : ::Enumerable, use_color : ::Bool)
    n_fields = fields.size
    __fields = (__fields_ary = fields.map { |__item| __item }.to_a).to_unsafe
    n_fields = __fields_ary.size
    __var0 = LibGLib.log_writer_format_fields(log_level, __fields, UInt64.new(n_fields), LibC::Int.new(use_color ? 1 : 0))
    GObject.raise_unexpected_null("g_log_writer_format_fields") if __var0.null?
    ::String.new(__var0)
  end

  def self.log_writer_is_journald(output_fd : ::Int)
    __var0 = LibGLib.log_writer_is_journald(Int32.new(output_fd))
    (__var0 == 1)
  end

  def self.log_writer_journald(log_level : GLib::LogLevelFlags, fields : ::Enumerable, user_data : Void*?)
    n_fields = fields.size
    __fields = (__fields_ary = fields.map { |__item| __item }.to_a).to_unsafe
    n_fields = __fields_ary.size
    __var0 = LibGLib.log_writer_journald(log_level, __fields, UInt64.new(n_fields), user_data ? user_data : Pointer(Void).null)
    GLib::LogWriterOutput.new(__var0)
  end

  def self.log_writer_standard_streams(log_level : GLib::LogLevelFlags, fields : ::Enumerable, user_data : Void*?)
    n_fields = fields.size
    __fields = (__fields_ary = fields.map { |__item| __item }.to_a).to_unsafe
    n_fields = __fields_ary.size
    __var0 = LibGLib.log_writer_standard_streams(log_level, __fields, UInt64.new(n_fields), user_data ? user_data : Pointer(Void).null)
    GLib::LogWriterOutput.new(__var0)
  end

  def self.log_writer_supports_color(output_fd : ::Int)
    __var0 = LibGLib.log_writer_supports_color(Int32.new(output_fd))
    (__var0 == 1)
  end

  def self.main_context_default
    __var0 = LibGLib.main_context_default
    GObject.raise_unexpected_null("g_main_context_default") if __var0.null?
    GLib::MainContext.new(__var0)
  end

  def self.main_context_get_thread_default
    __var0 = LibGLib.main_context_get_thread_default
    GObject.raise_unexpected_null("g_main_context_get_thread_default") if __var0.null?
    GLib::MainContext.new(__var0)
  end

  def self.main_context_ref_thread_default
    __var0 = LibGLib.main_context_ref_thread_default
    GObject.raise_unexpected_null("g_main_context_ref_thread_default") if __var0.null?
    GLib::MainContext.new(__var0)
  end

  def self.main_current_source
    __var0 = LibGLib.main_current_source
    GObject.raise_unexpected_null("g_main_current_source") if __var0.null?
    GLib::Source.new(__var0)
  end

  def self.main_depth
    __var0 = LibGLib.main_depth
    __var0
  end

  def self.malloc(n_bytes : ::Int)
    LibGLib.malloc(UInt64.new(n_bytes))
    nil
  end

  def self.malloc0(n_bytes : ::Int)
    LibGLib.malloc0(UInt64.new(n_bytes))
    nil
  end

  def self.malloc0_n(n_blocks : ::Int, n_block_bytes : ::Int)
    LibGLib.malloc0_n(UInt64.new(n_blocks), UInt64.new(n_block_bytes))
    nil
  end

  def self.malloc_n(n_blocks : ::Int, n_block_bytes : ::Int)
    LibGLib.malloc_n(UInt64.new(n_blocks), UInt64.new(n_block_bytes))
    nil
  end

  def self.markup_error_quark
    __var0 = LibGLib.markup_error_quark
    __var0
  end

  def self.markup_escape_text(text : ::String, length : ::Int)
    __var0 = LibGLib.markup_escape_text(text.to_unsafe, Int64.new(length))
    GObject.raise_unexpected_null("g_markup_escape_text") if __var0.null?
    ::String.new(__var0)
  end

  def self.mem_is_system_malloc
    __var0 = LibGLib.mem_is_system_malloc
    (__var0 == 1)
  end

  def self.mem_profile
    LibGLib.mem_profile
    nil
  end

  def self.mem_set_vtable(vtable : GLib::MemVTable)
    LibGLib.mem_set_vtable(vtable.to_unsafe.as(LibGLib::MemVTable*))
    nil
  end

  def self.memdup(mem : Void*?, byte_size : ::Int)
    LibGLib.memdup(mem ? mem : Pointer(Void).null, UInt32.new(byte_size))
    nil
  end

  def self.mkdir_with_parents(pathname : ::String, mode : ::Int)
    __var0 = LibGLib.mkdir_with_parents(pathname.to_unsafe, Int32.new(mode))
    __var0
  end

  def self.nullify_pointer(nullify_location : Void*)
    LibGLib.nullify_pointer(nullify_location)
    nil
  end

  def self.number_parser_error_quark
    __var0 = LibGLib.number_parser_error_quark
    __var0
  end

  def self.on_error_query(prg_name : ::String)
    LibGLib.on_error_query(prg_name.to_unsafe)
    nil
  end

  def self.on_error_stack_trace(prg_name : ::String)
    LibGLib.on_error_stack_trace(prg_name.to_unsafe)
    nil
  end

  def self.once_init_enter(location : Void*)
    __var0 = LibGLib.once_init_enter(location)
    (__var0 == 1)
  end

  def self.once_init_leave(location : Void*, result : ::Int)
    LibGLib.once_init_leave(location, UInt64.new(result))
    nil
  end

  def self.option_error_quark
    __var0 = LibGLib.option_error_quark
    __var0
  end

  def self.parse_debug_string(string : ::String?, keys : ::Enumerable)
    nkeys = keys.size
    __var0 = LibGLib.parse_debug_string(string ? string.to_unsafe : Pointer(UInt8).null, (__keys_ary = keys.map { |__item| __item }.to_a).to_unsafe, UInt32.new(nkeys))
    __var0
  end

  def self.path_get_basename(file_name : ::String)
    __var0 = LibGLib.path_get_basename(file_name.to_unsafe)
    GObject.raise_unexpected_null("g_path_get_basename") if __var0.null?
    ::String.new(__var0)
  end

  def self.path_get_dirname(file_name : ::String)
    __var0 = LibGLib.path_get_dirname(file_name.to_unsafe)
    GObject.raise_unexpected_null("g_path_get_dirname") if __var0.null?
    ::String.new(__var0)
  end

  def self.path_is_absolute(file_name : ::String)
    __var0 = LibGLib.path_is_absolute(file_name.to_unsafe)
    (__var0 == 1)
  end

  def self.path_skip_root(file_name : ::String)
    __var0 = LibGLib.path_skip_root(file_name.to_unsafe)
    __var1 = ::String.new(__var0) if __var0
    __var1
  end

  def self.pattern_match(pspec : GLib::PatternSpec, string_length : ::Int, string : ::String, string_reversed : ::String?)
    __var0 = LibGLib.pattern_match(pspec.to_unsafe.as(LibGLib::PatternSpec*), UInt32.new(string_length), string.to_unsafe, string_reversed ? string_reversed.to_unsafe : Pointer(UInt8).null)
    (__var0 == 1)
  end

  def self.pattern_match_simple(pattern : ::String, string : ::String)
    __var0 = LibGLib.pattern_match_simple(pattern.to_unsafe, string.to_unsafe)
    (__var0 == 1)
  end

  def self.pattern_match_string(pspec : GLib::PatternSpec, string : ::String)
    __var0 = LibGLib.pattern_match_string(pspec.to_unsafe.as(LibGLib::PatternSpec*), string.to_unsafe)
    (__var0 == 1)
  end

  def self.pointer_bit_lock(address : Void*, lock_bit : ::Int)
    LibGLib.pointer_bit_lock(address, Int32.new(lock_bit))
    nil
  end

  def self.pointer_bit_trylock(address : Void*, lock_bit : ::Int)
    __var0 = LibGLib.pointer_bit_trylock(address, Int32.new(lock_bit))
    (__var0 == 1)
  end

  def self.pointer_bit_unlock(address : Void*, lock_bit : ::Int)
    LibGLib.pointer_bit_unlock(address, Int32.new(lock_bit))
    nil
  end

  def self.poll(fds : GLib::PollFD, nfds : ::Int, timeout : ::Int)
    __var0 = LibGLib.poll(fds.to_unsafe.as(LibGLib::PollFD*), UInt32.new(nfds), Int32.new(timeout))
    __var0
  end

  def self.propagate_error(dest : LibGLib::Error*?, src : LibGLib::Error*)
    LibGLib.propagate_error(dest, src)
    nil
  end

  def self.quark_from_static_string(string : ::String?)
    __var0 = LibGLib.quark_from_static_string(string ? string.to_unsafe : Pointer(UInt8).null)
    __var0
  end

  def self.quark_from_string(string : ::String?)
    __var0 = LibGLib.quark_from_string(string ? string.to_unsafe : Pointer(UInt8).null)
    __var0
  end

  def self.quark_to_string(quark : ::Int)
    __var0 = LibGLib.quark_to_string(UInt32.new(quark))
    GObject.raise_unexpected_null("g_quark_to_string") if __var0.null?
    ::String.new(__var0)
  end

  def self.quark_try_string(string : ::String?)
    __var0 = LibGLib.quark_try_string(string ? string.to_unsafe : Pointer(UInt8).null)
    __var0
  end

  def self.random_double
    __var0 = LibGLib.random_double
    __var0
  end

  def self.random_double_range(_begin : ::Float, _end : ::Float)
    __var0 = LibGLib.random_double_range(Float64.new(_begin), Float64.new(_end))
    __var0
  end

  def self.random_int
    __var0 = LibGLib.random_int
    __var0
  end

  def self.random_int_range(_begin : ::Int, _end : ::Int)
    __var0 = LibGLib.random_int_range(Int32.new(_begin), Int32.new(_end))
    __var0
  end

  def self.random_set_seed(seed : ::Int)
    LibGLib.random_set_seed(UInt32.new(seed))
    nil
  end

  def self.rc_box_acquire(mem_block : Void*)
    LibGLib.rc_box_acquire(mem_block)
    nil
  end

  def self.rc_box_alloc(block_size : ::Int)
    LibGLib.rc_box_alloc(UInt64.new(block_size))
    nil
  end

  def self.rc_box_alloc0(block_size : ::Int)
    LibGLib.rc_box_alloc0(UInt64.new(block_size))
    nil
  end

  def self.rc_box_dup(block_size : ::Int, mem_block : Void*)
    LibGLib.rc_box_dup(UInt64.new(block_size), mem_block)
    nil
  end

  def self.rc_box_get_size(mem_block : Void*)
    __var0 = LibGLib.rc_box_get_size(mem_block)
    __var0
  end

  def self.rc_box_release(mem_block : Void*)
    LibGLib.rc_box_release(mem_block)
    nil
  end

  def self.rc_box_release_full(mem_block : Void*, clear_func : GLib::DestroyNotify)
    LibGLib.rc_box_release_full(mem_block, clear_func)
    nil
  end

  def self.realloc(mem : Void*?, n_bytes : ::Int)
    LibGLib.realloc(mem ? mem : Pointer(Void).null, UInt64.new(n_bytes))
    nil
  end

  def self.realloc_n(mem : Void*?, n_blocks : ::Int, n_block_bytes : ::Int)
    LibGLib.realloc_n(mem ? mem : Pointer(Void).null, UInt64.new(n_blocks), UInt64.new(n_block_bytes))
    nil
  end

  def self.ref_count_compare(rc : ::Int, val : ::Int)
    __var0 = LibGLib.ref_count_compare(rc, Int32.new(val))
    (__var0 == 1)
  end

  def self.ref_count_dec(rc : ::Int)
    __var0 = LibGLib.ref_count_dec(rc)
    (__var0 == 1)
  end

  def self.ref_count_inc(rc : ::Int)
    LibGLib.ref_count_inc(rc)
    nil
  end

  def self.ref_count_init(rc : ::Int)
    LibGLib.ref_count_init(rc)
    nil
  end

  def self.ref_string_acquire(str : ::String)
    __var0 = LibGLib.ref_string_acquire(str.to_unsafe)
    GObject.raise_unexpected_null("g_ref_string_acquire") if __var0.null?
    ::String.new(__var0)
  end

  def self.ref_string_length(str : ::String)
    __var0 = LibGLib.ref_string_length(str.to_unsafe)
    __var0
  end

  def self.ref_string_new(str : ::String)
    __var0 = LibGLib.ref_string_new(str.to_unsafe)
    GObject.raise_unexpected_null("g_ref_string_new") if __var0.null?
    ::String.new(__var0)
  end

  def self.ref_string_new_intern(str : ::String)
    __var0 = LibGLib.ref_string_new_intern(str.to_unsafe)
    GObject.raise_unexpected_null("g_ref_string_new_intern") if __var0.null?
    ::String.new(__var0)
  end

  def self.ref_string_new_len(str : ::String, len : ::Int)
    __var0 = LibGLib.ref_string_new_len(str.to_unsafe, Int64.new(len))
    GObject.raise_unexpected_null("g_ref_string_new_len") if __var0.null?
    ::String.new(__var0)
  end

  def self.ref_string_release(str : ::String)
    LibGLib.ref_string_release(str.to_unsafe)
    nil
  end

  def self.regex_check_replacement(replacement : ::String)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.regex_check_replacement(replacement.to_unsafe, out has_references, pointerof(__var0))
    GLib::Error.assert(__var0)
    {(__var1 == 1), (has_references == 1)}
  end

  def self.regex_error_quark
    __var0 = LibGLib.regex_error_quark
    __var0
  end

  def self.regex_escape_nul(string : ::String, length : ::Int)
    __var0 = LibGLib.regex_escape_nul(string.to_unsafe, Int32.new(length))
    GObject.raise_unexpected_null("g_regex_escape_nul") if __var0.null?
    ::String.new(__var0)
  end

  def self.regex_escape_string(string : ::Enumerable)
    length = string.size
    __var0 = LibGLib.regex_escape_string((__string_ary = string.map { |__item| __item.to_unsafe }.to_a).to_unsafe, Int32.new(length))
    GObject.raise_unexpected_null("g_regex_escape_string") if __var0.null?
    ::String.new(__var0)
  end

  def self.regex_match_simple(pattern : ::String, string : ::String, compile_options : GLib::RegexCompileFlags, match_options : GLib::RegexMatchFlags)
    __var0 = LibGLib.regex_match_simple(pattern.to_unsafe, string.to_unsafe, compile_options, match_options)
    (__var0 == 1)
  end

  def self.regex_split_simple(pattern : ::String, string : ::String, compile_options : GLib::RegexCompileFlags, match_options : GLib::RegexMatchFlags)
    __var0 = LibGLib.regex_split_simple(pattern.to_unsafe, string.to_unsafe, compile_options, match_options)
    GObject.raise_unexpected_null("g_regex_split_simple") if __var0.null?
    GObject::PointerIterator.new(__var0) { |__var1|
      ::String.new(__var1)
    }
  end

  def self.reload_user_special_dirs_cache
    LibGLib.reload_user_special_dirs_cache
    nil
  end

  def self.rmdir(filename : ::String)
    __var0 = LibGLib.rmdir(filename.to_unsafe)
    __var0
  end

  def self.sequence_get(iter : GLib::SequenceIter)
    LibGLib.sequence_get(iter.to_unsafe.as(LibGLib::SequenceIter*))
    nil
  end

  def self.sequence_insert_before(iter : GLib::SequenceIter, data : Void*?)
    __var0 = LibGLib.sequence_insert_before(iter.to_unsafe.as(LibGLib::SequenceIter*), data ? data : Pointer(Void).null)
    GObject.raise_unexpected_null("g_sequence_insert_before") if __var0.null?
    GLib::SequenceIter.new(__var0)
  end

  def self.sequence_move(src : GLib::SequenceIter, dest : GLib::SequenceIter)
    LibGLib.sequence_move(src.to_unsafe.as(LibGLib::SequenceIter*), dest.to_unsafe.as(LibGLib::SequenceIter*))
    nil
  end

  def self.sequence_move_range(dest : GLib::SequenceIter, _begin : GLib::SequenceIter, _end : GLib::SequenceIter)
    LibGLib.sequence_move_range(dest.to_unsafe.as(LibGLib::SequenceIter*), _begin.to_unsafe.as(LibGLib::SequenceIter*), _end.to_unsafe.as(LibGLib::SequenceIter*))
    nil
  end

  def self.sequence_range_get_midpoint(_begin : GLib::SequenceIter, _end : GLib::SequenceIter)
    __var0 = LibGLib.sequence_range_get_midpoint(_begin.to_unsafe.as(LibGLib::SequenceIter*), _end.to_unsafe.as(LibGLib::SequenceIter*))
    GObject.raise_unexpected_null("g_sequence_range_get_midpoint") if __var0.null?
    GLib::SequenceIter.new(__var0)
  end

  def self.sequence_remove(iter : GLib::SequenceIter)
    LibGLib.sequence_remove(iter.to_unsafe.as(LibGLib::SequenceIter*))
    nil
  end

  def self.sequence_remove_range(_begin : GLib::SequenceIter, _end : GLib::SequenceIter)
    LibGLib.sequence_remove_range(_begin.to_unsafe.as(LibGLib::SequenceIter*), _end.to_unsafe.as(LibGLib::SequenceIter*))
    nil
  end

  def self.sequence_set(iter : GLib::SequenceIter, data : Void*?)
    LibGLib.sequence_set(iter.to_unsafe.as(LibGLib::SequenceIter*), data ? data : Pointer(Void).null)
    nil
  end

  def self.sequence_swap(a : GLib::SequenceIter, b : GLib::SequenceIter)
    LibGLib.sequence_swap(a.to_unsafe.as(LibGLib::SequenceIter*), b.to_unsafe.as(LibGLib::SequenceIter*))
    nil
  end

  def self.set_application_name(application_name : ::String)
    LibGLib.set_application_name(application_name.to_unsafe)
    nil
  end

  def self.set_error_literal(err : LibGLib::Error*?, domain : ::Int, code : ::Int, message : ::String)
    LibGLib.set_error_literal(err, UInt32.new(domain), Int32.new(code), message.to_unsafe)
    nil
  end

  def self.set_prgname(prgname : ::String)
    LibGLib.set_prgname(prgname.to_unsafe)
    nil
  end

  def self.setenv(variable : ::String, value : ::String, overwrite : ::Bool)
    __var0 = LibGLib.setenv(variable.to_unsafe, value.to_unsafe, LibC::Int.new(overwrite ? 1 : 0))
    (__var0 == 1)
  end

  def self.shell_error_quark
    __var0 = LibGLib.shell_error_quark
    __var0
  end

  def self.shell_parse_argv(command_line : ::String, argvp : ::Enumerable?)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.shell_parse_argv(command_line.to_unsafe, out argcp, argvp, pointerof(__var0))
    GLib::Error.assert(__var0)
    {(__var1 == 1), argcp}
  end

  def self.shell_quote(unquoted_string : ::String)
    __var0 = LibGLib.shell_quote(unquoted_string.to_unsafe)
    GObject.raise_unexpected_null("g_shell_quote") if __var0.null?
    ::String.new(__var0)
  end

  def self.shell_unquote(quoted_string : ::String)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.shell_unquote(quoted_string.to_unsafe, pointerof(__var0))
    GLib::Error.assert(__var0)
    GObject.raise_unexpected_null("g_shell_unquote") if __var1.null?
    ::String.new(__var1)
  end

  def self.slice_alloc(block_size : ::Int)
    LibGLib.slice_alloc(UInt64.new(block_size))
    nil
  end

  def self.slice_alloc0(block_size : ::Int)
    LibGLib.slice_alloc0(UInt64.new(block_size))
    nil
  end

  def self.slice_copy(block_size : ::Int, mem_block : Void*?)
    LibGLib.slice_copy(UInt64.new(block_size), mem_block ? mem_block : Pointer(Void).null)
    nil
  end

  def self.slice_free1(block_size : ::Int, mem_block : Void*?)
    LibGLib.slice_free1(UInt64.new(block_size), mem_block ? mem_block : Pointer(Void).null)
    nil
  end

  def self.slice_free_chain_with_offset(block_size : ::Int, mem_chain : Void*?, next_offset : ::Int)
    LibGLib.slice_free_chain_with_offset(UInt64.new(block_size), mem_chain ? mem_chain : Pointer(Void).null, UInt64.new(next_offset))
    nil
  end

  def self.slice_get_config(ckey : GLib::SliceConfig)
    __var0 = LibGLib.slice_get_config(ckey)
    __var0
  end

  def self.slice_get_config_state(ckey : GLib::SliceConfig, address : ::Int, n_values : ::Int)
    __var0 = LibGLib.slice_get_config_state(ckey, Int64.new(address), n_values)
    GObject.raise_unexpected_null("g_slice_get_config_state") if __var0.null?
    __var0
  end

  def self.slice_set_config(ckey : GLib::SliceConfig, value : ::Int)
    LibGLib.slice_set_config(ckey, Int64.new(value))
    nil
  end

  def self.source_remove(tag : ::Int)
    __var0 = LibGLib.source_remove(UInt32.new(tag))
    (__var0 == 1)
  end

  def self.source_remove_by_funcs_user_data(funcs : GLib::SourceFuncs, user_data : Void*?)
    __var0 = LibGLib.source_remove_by_funcs_user_data(funcs.to_unsafe.as(LibGLib::SourceFuncs*), user_data ? user_data : Pointer(Void).null)
    (__var0 == 1)
  end

  def self.source_remove_by_user_data(user_data : Void*?)
    __var0 = LibGLib.source_remove_by_user_data(user_data ? user_data : Pointer(Void).null)
    (__var0 == 1)
  end

  def self.source_set_name_by_id(tag : ::Int, name : ::String)
    LibGLib.source_set_name_by_id(UInt32.new(tag), name.to_unsafe)
    nil
  end

  def self.spaced_primes_closest(num : ::Int)
    __var0 = LibGLib.spaced_primes_closest(UInt32.new(num))
    __var0
  end

  def self.spawn_async(working_directory : ::String?, argv : ::Enumerable, envp : ::Enumerable?, flags : GLib::SpawnFlags, child_setup : GLib::SpawnChildSetupFunc?, user_data : Void*?)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.spawn_async(working_directory ? working_directory.to_unsafe : Pointer(UInt8).null, (__argv_ary = argv.map { |__item| __item.to_unsafe }.to_a).to_unsafe, envp ? (__envp_ary = envp.map { |__item| __item.to_unsafe }.to_a).to_unsafe : Pointer(Pointer(UInt8)).null, flags, child_setup ? child_setup : nil, user_data ? user_data : Pointer(Void).null, out child_pid, pointerof(__var0))
    GLib::Error.assert(__var0)
    {(__var1 == 1), child_pid}
  end

  def self.spawn_async_with_fds(working_directory : ::String?, argv : ::Enumerable, envp : ::Enumerable?, flags : GLib::SpawnFlags, child_setup : GLib::SpawnChildSetupFunc?, user_data : Void*?, stdin_fd : ::Int, stdout_fd : ::Int, stderr_fd : ::Int)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.spawn_async_with_fds(working_directory ? working_directory.to_unsafe : Pointer(UInt8).null, (__argv_ary = argv.map { |__item| __item.to_unsafe }.to_a).to_unsafe, envp ? (__envp_ary = envp.map { |__item| __item.to_unsafe }.to_a).to_unsafe : Pointer(Pointer(UInt8)).null, flags, child_setup ? child_setup : nil, user_data ? user_data : Pointer(Void).null, out child_pid, Int32.new(stdin_fd), Int32.new(stdout_fd), Int32.new(stderr_fd), pointerof(__var0))
    GLib::Error.assert(__var0)
    {(__var1 == 1), child_pid}
  end

  def self.spawn_async_with_pipes(working_directory : ::String?, argv : ::Enumerable, envp : ::Enumerable?, flags : GLib::SpawnFlags, child_setup : GLib::SpawnChildSetupFunc?, user_data : Void*?)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.spawn_async_with_pipes(working_directory ? working_directory.to_unsafe : Pointer(UInt8).null, (__argv_ary = argv.map { |__item| __item.to_unsafe }.to_a).to_unsafe, envp ? (__envp_ary = envp.map { |__item| __item.to_unsafe }.to_a).to_unsafe : Pointer(Pointer(UInt8)).null, flags, child_setup ? child_setup : nil, user_data ? user_data : Pointer(Void).null, out child_pid, out standard_input, out standard_output, out standard_error, pointerof(__var0))
    GLib::Error.assert(__var0)
    {(__var1 == 1), child_pid, standard_input, standard_output, standard_error}
  end

  def self.spawn_check_exit_status(exit_status : ::Int)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.spawn_check_exit_status(Int32.new(exit_status), pointerof(__var0))
    GLib::Error.assert(__var0)
    (__var1 == 1)
  end

  def self.spawn_close_pid(pid : ::Int)
    LibGLib.spawn_close_pid(Int32.new(pid))
    nil
  end

  def self.spawn_command_line_async(command_line : ::String)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.spawn_command_line_async(command_line.to_unsafe, pointerof(__var0))
    GLib::Error.assert(__var0)
    (__var1 == 1)
  end

  def self.spawn_command_line_sync(command_line : ::String, standard_output : ::Bytes?, standard_error : ::Bytes?)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.spawn_command_line_sync(command_line.to_unsafe, standard_output, standard_error, out exit_status, pointerof(__var0))
    GLib::Error.assert(__var0)
    {(__var1 == 1), exit_status}
  end

  def self.spawn_error_quark
    __var0 = LibGLib.spawn_error_quark
    __var0
  end

  def self.spawn_exit_error_quark
    __var0 = LibGLib.spawn_exit_error_quark
    __var0
  end

  def self.spawn_sync(working_directory : ::String?, argv : ::Enumerable, envp : ::Enumerable?, flags : GLib::SpawnFlags, child_setup : GLib::SpawnChildSetupFunc?, user_data : Void*?, standard_output : ::Bytes?, standard_error : ::Bytes?)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.spawn_sync(working_directory ? working_directory.to_unsafe : Pointer(UInt8).null, (__argv_ary = argv.map { |__item| __item.to_unsafe }.to_a).to_unsafe, envp ? (__envp_ary = envp.map { |__item| __item.to_unsafe }.to_a).to_unsafe : Pointer(Pointer(UInt8)).null, flags, child_setup ? child_setup : nil, user_data ? user_data : Pointer(Void).null, standard_output, standard_error, out exit_status, pointerof(__var0))
    GLib::Error.assert(__var0)
    {(__var1 == 1), exit_status}
  end

  def self.stpcpy(dest : ::String, src : ::String)
    __var0 = LibGLib.stpcpy(dest.to_unsafe, src.to_unsafe)
    GObject.raise_unexpected_null("g_stpcpy") if __var0.null?
    ::String.new(__var0)
  end

  def self.str_equal(v1 : Void*, v2 : Void*)
    __var0 = LibGLib.str_equal(v1, v2)
    (__var0 == 1)
  end

  def self.str_has_prefix(str : ::String, prefix : ::String)
    __var0 = LibGLib.str_has_prefix(str.to_unsafe, prefix.to_unsafe)
    (__var0 == 1)
  end

  def self.str_has_suffix(str : ::String, suffix : ::String)
    __var0 = LibGLib.str_has_suffix(str.to_unsafe, suffix.to_unsafe)
    (__var0 == 1)
  end

  def self.str_hash(v : Void*)
    __var0 = LibGLib.str_hash(v)
    __var0
  end

  def self.str_is_ascii(str : ::String)
    __var0 = LibGLib.str_is_ascii(str.to_unsafe)
    (__var0 == 1)
  end

  def self.str_match_string(search_term : ::String, potential_hit : ::String, accept_alternates : ::Bool)
    __var0 = LibGLib.str_match_string(search_term.to_unsafe, potential_hit.to_unsafe, LibC::Int.new(accept_alternates ? 1 : 0))
    (__var0 == 1)
  end

  def self.str_to_ascii(str : ::String, from_locale : ::String?)
    __var0 = LibGLib.str_to_ascii(str.to_unsafe, from_locale ? from_locale.to_unsafe : Pointer(UInt8).null)
    GObject.raise_unexpected_null("g_str_to_ascii") if __var0.null?
    ::String.new(__var0)
  end

  def self.str_tokenize_and_fold(string : ::String, translit_locale : ::String?, ascii_alternates : ::Enumerable)
    __var0 = LibGLib.str_tokenize_and_fold(string.to_unsafe, translit_locale ? translit_locale.to_unsafe : Pointer(UInt8).null, ascii_alternates)
    GObject.raise_unexpected_null("g_str_tokenize_and_fold") if __var0.null?
    GObject::PointerIterator.new(__var0) { |__var1|
      ::String.new(__var1)
    }
  end

  def self.strcanon(string : ::String, valid_chars : ::String, substitutor : ::Int)
    __var0 = LibGLib.strcanon(string.to_unsafe, valid_chars.to_unsafe, Int8.new(substitutor))
    GObject.raise_unexpected_null("g_strcanon") if __var0.null?
    ::String.new(__var0)
  end

  def self.strcasecmp(s1 : ::String, s2 : ::String)
    __var0 = LibGLib.strcasecmp(s1.to_unsafe, s2.to_unsafe)
    __var0
  end

  def self.strchomp(string : ::String)
    __var0 = LibGLib.strchomp(string.to_unsafe)
    GObject.raise_unexpected_null("g_strchomp") if __var0.null?
    ::String.new(__var0)
  end

  def self.strchug(string : ::String)
    __var0 = LibGLib.strchug(string.to_unsafe)
    GObject.raise_unexpected_null("g_strchug") if __var0.null?
    ::String.new(__var0)
  end

  def self.strcmp0(str1 : ::String?, str2 : ::String?)
    __var0 = LibGLib.strcmp0(str1 ? str1.to_unsafe : Pointer(UInt8).null, str2 ? str2.to_unsafe : Pointer(UInt8).null)
    __var0
  end

  def self.strcompress(source : ::String)
    __var0 = LibGLib.strcompress(source.to_unsafe)
    GObject.raise_unexpected_null("g_strcompress") if __var0.null?
    ::String.new(__var0)
  end

  def self.strdelimit(string : ::String, delimiters : ::String?, new_delimiter : ::Int)
    __var0 = LibGLib.strdelimit(string.to_unsafe, delimiters ? delimiters.to_unsafe : Pointer(UInt8).null, Int8.new(new_delimiter))
    GObject.raise_unexpected_null("g_strdelimit") if __var0.null?
    ::String.new(__var0)
  end

  def self.strdown(string : ::String)
    __var0 = LibGLib.strdown(string.to_unsafe)
    GObject.raise_unexpected_null("g_strdown") if __var0.null?
    ::String.new(__var0)
  end

  def self.strdup(str : ::String?)
    __var0 = LibGLib.strdup(str ? str.to_unsafe : Pointer(UInt8).null)
    GObject.raise_unexpected_null("g_strdup") if __var0.null?
    ::String.new(__var0)
  end

  def self.strerror(errnum : ::Int)
    __var0 = LibGLib.strerror(Int32.new(errnum))
    GObject.raise_unexpected_null("g_strerror") if __var0.null?
    ::String.new(__var0)
  end

  def self.strescape(source : ::String, exceptions : ::String?)
    __var0 = LibGLib.strescape(source.to_unsafe, exceptions ? exceptions.to_unsafe : Pointer(UInt8).null)
    GObject.raise_unexpected_null("g_strescape") if __var0.null?
    ::String.new(__var0)
  end

  def self.strfreev(str_array : ::String?)
    LibGLib.strfreev(str_array ? str_array.to_unsafe : Pointer(UInt8).null)
    nil
  end

  def self.string_new(init : ::String?)
    __var0 = LibGLib.string_new(init ? init.to_unsafe : Pointer(UInt8).null)
    GObject.raise_unexpected_null("g_string_new") if __var0.null?
    GLib::String.new(__var0)
  end

  def self.string_new_len(init : ::String, len : ::Int)
    __var0 = LibGLib.string_new_len(init.to_unsafe, Int64.new(len))
    GObject.raise_unexpected_null("g_string_new_len") if __var0.null?
    GLib::String.new(__var0)
  end

  def self.string_sized_new(dfl_size : ::Int)
    __var0 = LibGLib.string_sized_new(UInt64.new(dfl_size))
    GObject.raise_unexpected_null("g_string_sized_new") if __var0.null?
    GLib::String.new(__var0)
  end

  def self.strip_context(msgid : ::String, msgval : ::String)
    __var0 = LibGLib.strip_context(msgid.to_unsafe, msgval.to_unsafe)
    GObject.raise_unexpected_null("g_strip_context") if __var0.null?
    ::String.new(__var0)
  end

  def self.strjoinv(separator : ::String?, str_array : ::String)
    __var0 = LibGLib.strjoinv(separator ? separator.to_unsafe : Pointer(UInt8).null, str_array.to_unsafe)
    GObject.raise_unexpected_null("g_strjoinv") if __var0.null?
    ::String.new(__var0)
  end

  def self.strlcat(dest : ::String, src : ::String, dest_size : ::Int)
    __var0 = LibGLib.strlcat(dest.to_unsafe, src.to_unsafe, UInt64.new(dest_size))
    __var0
  end

  def self.strlcpy(dest : ::String, src : ::String, dest_size : ::Int)
    __var0 = LibGLib.strlcpy(dest.to_unsafe, src.to_unsafe, UInt64.new(dest_size))
    __var0
  end

  def self.strncasecmp(s1 : ::String, s2 : ::String, n : ::Int)
    __var0 = LibGLib.strncasecmp(s1.to_unsafe, s2.to_unsafe, UInt32.new(n))
    __var0
  end

  def self.strndup(str : ::String, n : ::Int)
    __var0 = LibGLib.strndup(str.to_unsafe, UInt64.new(n))
    GObject.raise_unexpected_null("g_strndup") if __var0.null?
    ::String.new(__var0)
  end

  def self.strnfill(length : ::Int, fill_char : ::Int)
    __var0 = LibGLib.strnfill(UInt64.new(length), Int8.new(fill_char))
    GObject.raise_unexpected_null("g_strnfill") if __var0.null?
    ::String.new(__var0)
  end

  def self.strreverse(string : ::String)
    __var0 = LibGLib.strreverse(string.to_unsafe)
    GObject.raise_unexpected_null("g_strreverse") if __var0.null?
    ::String.new(__var0)
  end

  def self.strrstr(haystack : ::String, needle : ::String)
    __var0 = LibGLib.strrstr(haystack.to_unsafe, needle.to_unsafe)
    GObject.raise_unexpected_null("g_strrstr") if __var0.null?
    ::String.new(__var0)
  end

  def self.strrstr_len(haystack : ::String, haystack_len : ::Int, needle : ::String)
    __var0 = LibGLib.strrstr_len(haystack.to_unsafe, Int64.new(haystack_len), needle.to_unsafe)
    GObject.raise_unexpected_null("g_strrstr_len") if __var0.null?
    ::String.new(__var0)
  end

  def self.strsignal(signum : ::Int)
    __var0 = LibGLib.strsignal(Int32.new(signum))
    GObject.raise_unexpected_null("g_strsignal") if __var0.null?
    ::String.new(__var0)
  end

  def self.strstr_len(haystack : ::String, haystack_len : ::Int, needle : ::String)
    __var0 = LibGLib.strstr_len(haystack.to_unsafe, Int64.new(haystack_len), needle.to_unsafe)
    GObject.raise_unexpected_null("g_strstr_len") if __var0.null?
    ::String.new(__var0)
  end

  def self.strtod(nptr : ::String)
    __var0 = LibGLib.strtod(nptr.to_unsafe, out endptr)
    {__var0, ::String.new(endptr)}
  end

  def self.strup(string : ::String)
    __var0 = LibGLib.strup(string.to_unsafe)
    GObject.raise_unexpected_null("g_strup") if __var0.null?
    ::String.new(__var0)
  end

  def self.strv_contains(strv : ::String, str : ::String)
    __var0 = LibGLib.strv_contains(strv.to_unsafe, str.to_unsafe)
    (__var0 == 1)
  end

  def self.strv_equal(strv1 : ::String, strv2 : ::String)
    __var0 = LibGLib.strv_equal(strv1.to_unsafe, strv2.to_unsafe)
    (__var0 == 1)
  end

  def self.strv_get_type
    __var0 = LibGLib.strv_get_type
    __var0
  end

  def self.strv_length(str_array : ::String)
    __var0 = LibGLib.strv_length(str_array.to_unsafe)
    __var0
  end

  def self.test_add_data_func(testpath : ::String, test_data : Void*?, test_func : GLib::TestDataFunc)
    LibGLib.test_add_data_func(testpath.to_unsafe, test_data ? test_data : Pointer(Void).null, test_func)
    nil
  end

  def self.test_add_data_func_full(testpath : ::String, test_data : Void*?, test_func : GLib::TestDataFunc, data_free_func : GLib::DestroyNotify)
    LibGLib.test_add_data_func_full(testpath.to_unsafe, test_data ? test_data : Pointer(Void).null, test_func, data_free_func)
    nil
  end

  def self.test_add_func(testpath : ::String, test_func : GLib::TestFunc)
    LibGLib.test_add_func(testpath.to_unsafe, test_func)
    nil
  end

  def self.test_assert_expected_messages_internal(domain : ::String, file : ::String, line : ::Int, func : ::String)
    LibGLib.test_assert_expected_messages_internal(domain.to_unsafe, file.to_unsafe, Int32.new(line), func.to_unsafe)
    nil
  end

  def self.test_bug(bug_uri_snippet : ::String)
    LibGLib.test_bug(bug_uri_snippet.to_unsafe)
    nil
  end

  def self.test_bug_base(uri_pattern : ::String)
    LibGLib.test_bug_base(uri_pattern.to_unsafe)
    nil
  end

  def self.test_expect_message(log_domain : ::String?, log_level : GLib::LogLevelFlags, pattern : ::String)
    LibGLib.test_expect_message(log_domain ? log_domain.to_unsafe : Pointer(UInt8).null, log_level, pattern.to_unsafe)
    nil
  end

  def self.test_fail
    LibGLib.test_fail
    nil
  end

  def self.test_failed
    __var0 = LibGLib.test_failed
    (__var0 == 1)
  end

  def self.test_get_dir(file_type : GLib::TestFileType)
    __var0 = LibGLib.test_get_dir(file_type)
    GObject.raise_unexpected_null("g_test_get_dir") if __var0.null?
    ::String.new(__var0)
  end

  def self.test_incomplete(msg : ::String?)
    LibGLib.test_incomplete(msg ? msg.to_unsafe : Pointer(UInt8).null)
    nil
  end

  def self.test_log_type_name(log_type : GLib::TestLogType)
    __var0 = LibGLib.test_log_type_name(log_type)
    GObject.raise_unexpected_null("g_test_log_type_name") if __var0.null?
    ::String.new(__var0)
  end

  def self.test_queue_destroy(destroy_func : GLib::DestroyNotify, destroy_data : Void*?)
    LibGLib.test_queue_destroy(destroy_func, destroy_data ? destroy_data : Pointer(Void).null)
    nil
  end

  def self.test_queue_free(gfree_pointer : Void*?)
    LibGLib.test_queue_free(gfree_pointer ? gfree_pointer : Pointer(Void).null)
    nil
  end

  def self.test_rand_double
    __var0 = LibGLib.test_rand_double
    __var0
  end

  def self.test_rand_double_range(range_start : ::Float, range_end : ::Float)
    __var0 = LibGLib.test_rand_double_range(Float64.new(range_start), Float64.new(range_end))
    __var0
  end

  def self.test_rand_int
    __var0 = LibGLib.test_rand_int
    __var0
  end

  def self.test_rand_int_range(_begin : ::Int, _end : ::Int)
    __var0 = LibGLib.test_rand_int_range(Int32.new(_begin), Int32.new(_end))
    __var0
  end

  def self.test_run
    __var0 = LibGLib.test_run
    __var0
  end

  def self.test_run_suite(suite : GLib::TestSuite)
    __var0 = LibGLib.test_run_suite(suite.to_unsafe.as(LibGLib::TestSuite*))
    __var0
  end

  def self.test_set_nonfatal_assertions
    LibGLib.test_set_nonfatal_assertions
    nil
  end

  def self.test_skip(msg : ::String?)
    LibGLib.test_skip(msg ? msg.to_unsafe : Pointer(UInt8).null)
    nil
  end

  def self.test_subprocess
    __var0 = LibGLib.test_subprocess
    (__var0 == 1)
  end

  def self.test_summary(summary : ::String)
    LibGLib.test_summary(summary.to_unsafe)
    nil
  end

  def self.test_timer_elapsed
    __var0 = LibGLib.test_timer_elapsed
    __var0
  end

  def self.test_timer_last
    __var0 = LibGLib.test_timer_last
    __var0
  end

  def self.test_timer_start
    LibGLib.test_timer_start
    nil
  end

  def self.test_trap_assertions(domain : ::String, file : ::String, line : ::Int, func : ::String, assertion_flags : ::Int, pattern : ::String)
    LibGLib.test_trap_assertions(domain.to_unsafe, file.to_unsafe, Int32.new(line), func.to_unsafe, UInt64.new(assertion_flags), pattern.to_unsafe)
    nil
  end

  def self.test_trap_fork(usec_timeout : ::Int, test_trap_flags : GLib::TestTrapFlags)
    __var0 = LibGLib.test_trap_fork(UInt64.new(usec_timeout), test_trap_flags)
    (__var0 == 1)
  end

  def self.test_trap_has_passed
    __var0 = LibGLib.test_trap_has_passed
    (__var0 == 1)
  end

  def self.test_trap_reached_timeout
    __var0 = LibGLib.test_trap_reached_timeout
    (__var0 == 1)
  end

  def self.test_trap_subprocess(test_path : ::String?, usec_timeout : ::Int, test_flags : GLib::TestSubprocessFlags)
    LibGLib.test_trap_subprocess(test_path ? test_path.to_unsafe : Pointer(UInt8).null, UInt64.new(usec_timeout), test_flags)
    nil
  end

  def self.thread_error_quark
    __var0 = LibGLib.thread_error_quark
    __var0
  end

  def self.thread_exit(retval : Void*?)
    LibGLib.thread_exit(retval ? retval : Pointer(Void).null)
    nil
  end

  def self.thread_pool_get_max_idle_time
    __var0 = LibGLib.thread_pool_get_max_idle_time
    __var0
  end

  def self.thread_pool_get_max_unused_threads
    __var0 = LibGLib.thread_pool_get_max_unused_threads
    __var0
  end

  def self.thread_pool_get_num_unused_threads
    __var0 = LibGLib.thread_pool_get_num_unused_threads
    __var0
  end

  def self.thread_pool_set_max_idle_time(interval : ::Int)
    LibGLib.thread_pool_set_max_idle_time(UInt32.new(interval))
    nil
  end

  def self.thread_pool_set_max_unused_threads(max_threads : ::Int)
    LibGLib.thread_pool_set_max_unused_threads(Int32.new(max_threads))
    nil
  end

  def self.thread_pool_stop_unused_threads
    LibGLib.thread_pool_stop_unused_threads
    nil
  end

  def self.thread_self
    __var0 = LibGLib.thread_self
    GObject.raise_unexpected_null("g_thread_self") if __var0.null?
    GLib::Thread.new(__var0)
  end

  def self.thread_yield
    LibGLib.thread_yield
    nil
  end

  def self.time_val_from_iso8601(iso_date : ::String, time_ : GLib::TimeVal)
    __var0 = LibGLib.time_val_from_iso8601(iso_date.to_unsafe, time_)
    (__var0 == 1)
  end

  def self.timeout_add(priority : ::Int, interval : ::Int, function : GLib::SourceFunc, data : Void*?, notify : GLib::DestroyNotify?)
    __var0 = LibGLib.timeout_add(Int32.new(priority), UInt32.new(interval), function, data ? data : Pointer(Void).null, notify ? notify : nil)
    __var0
  end

  def self.timeout_add_seconds(priority : ::Int, interval : ::Int, function : GLib::SourceFunc, data : Void*?, notify : GLib::DestroyNotify?)
    __var0 = LibGLib.timeout_add_seconds(Int32.new(priority), UInt32.new(interval), function, data ? data : Pointer(Void).null, notify ? notify : nil)
    __var0
  end

  def self.timeout_source_new(interval : ::Int)
    __var0 = LibGLib.timeout_source_new(UInt32.new(interval))
    GObject.raise_unexpected_null("g_timeout_source_new") if __var0.null?
    GLib::Source.new(__var0)
  end

  def self.timeout_source_new_seconds(interval : ::Int)
    __var0 = LibGLib.timeout_source_new_seconds(UInt32.new(interval))
    GObject.raise_unexpected_null("g_timeout_source_new_seconds") if __var0.null?
    GLib::Source.new(__var0)
  end

  def self.trash_stack_height(stack_p : GLib::TrashStack)
    __var0 = LibGLib.trash_stack_height(stack_p.to_unsafe.as(LibGLib::TrashStack*))
    __var0
  end

  def self.trash_stack_peek(stack_p : GLib::TrashStack)
    LibGLib.trash_stack_peek(stack_p.to_unsafe.as(LibGLib::TrashStack*))
    nil
  end

  def self.trash_stack_pop(stack_p : GLib::TrashStack)
    LibGLib.trash_stack_pop(stack_p.to_unsafe.as(LibGLib::TrashStack*))
    nil
  end

  def self.trash_stack_push(stack_p : GLib::TrashStack, data_p : Void*)
    LibGLib.trash_stack_push(stack_p.to_unsafe.as(LibGLib::TrashStack*), data_p)
    nil
  end

  def self.try_malloc(n_bytes : ::Int)
    LibGLib.try_malloc(UInt64.new(n_bytes))
    nil
  end

  def self.try_malloc0(n_bytes : ::Int)
    LibGLib.try_malloc0(UInt64.new(n_bytes))
    nil
  end

  def self.try_malloc0_n(n_blocks : ::Int, n_block_bytes : ::Int)
    LibGLib.try_malloc0_n(UInt64.new(n_blocks), UInt64.new(n_block_bytes))
    nil
  end

  def self.try_malloc_n(n_blocks : ::Int, n_block_bytes : ::Int)
    LibGLib.try_malloc_n(UInt64.new(n_blocks), UInt64.new(n_block_bytes))
    nil
  end

  def self.try_realloc(mem : Void*?, n_bytes : ::Int)
    LibGLib.try_realloc(mem ? mem : Pointer(Void).null, UInt64.new(n_bytes))
    nil
  end

  def self.try_realloc_n(mem : Void*?, n_blocks : ::Int, n_block_bytes : ::Int)
    LibGLib.try_realloc_n(mem ? mem : Pointer(Void).null, UInt64.new(n_blocks), UInt64.new(n_block_bytes))
    nil
  end

  def self.ucs4_to_utf16(str : UInt8, len : ::Int)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.ucs4_to_utf16(str, Int64.new(len), out items_read, out items_written, pointerof(__var0))
    GLib::Error.assert(__var0)
    GObject.raise_unexpected_null("g_ucs4_to_utf16") if __var1.null?
    {__var1, items_read, items_written}
  end

  def self.ucs4_to_utf8(str : UInt8, len : ::Int)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.ucs4_to_utf8(str, Int64.new(len), out items_read, out items_written, pointerof(__var0))
    GLib::Error.assert(__var0)
    GObject.raise_unexpected_null("g_ucs4_to_utf8") if __var1.null?
    {::String.new(__var1), items_read, items_written}
  end

  def self.unichar_break_type(c : UInt8)
    __var0 = LibGLib.unichar_break_type(UInt8.new(c))
    GLib::UnicodeBreakType.new(__var0)
  end

  def self.unichar_combining_class(uc : UInt8)
    __var0 = LibGLib.unichar_combining_class(UInt8.new(uc))
    __var0
  end

  def self.unichar_compose(a : UInt8, b : UInt8)
    __var0 = LibGLib.unichar_compose(UInt8.new(a), UInt8.new(b), out ch)
    {(__var0 == 1), ch}
  end

  def self.unichar_decompose(ch : UInt8)
    __var0 = LibGLib.unichar_decompose(UInt8.new(ch), out a, out b)
    {(__var0 == 1), a, b}
  end

  def self.unichar_digit_value(c : UInt8)
    __var0 = LibGLib.unichar_digit_value(UInt8.new(c))
    __var0
  end

  def self.unichar_fully_decompose(ch : UInt8, compat : ::Bool, result_len : ::Int)
    __var0 = LibGLib.unichar_fully_decompose(UInt8.new(ch), LibC::Int.new(compat ? 1 : 0), out result, UInt64.new(result_len))
    {__var0, result}
  end

  def self.unichar_get_mirror_char(ch : UInt8, mirrored_ch : UInt8)
    __var0 = LibGLib.unichar_get_mirror_char(UInt8.new(ch), mirrored_ch)
    (__var0 == 1)
  end

  def self.unichar_get_script(ch : UInt8)
    __var0 = LibGLib.unichar_get_script(UInt8.new(ch))
    GLib::UnicodeScript.new(__var0)
  end

  def self.unichar_isalnum(c : UInt8)
    __var0 = LibGLib.unichar_isalnum(UInt8.new(c))
    (__var0 == 1)
  end

  def self.unichar_isalpha(c : UInt8)
    __var0 = LibGLib.unichar_isalpha(UInt8.new(c))
    (__var0 == 1)
  end

  def self.unichar_iscntrl(c : UInt8)
    __var0 = LibGLib.unichar_iscntrl(UInt8.new(c))
    (__var0 == 1)
  end

  def self.unichar_isdefined(c : UInt8)
    __var0 = LibGLib.unichar_isdefined(UInt8.new(c))
    (__var0 == 1)
  end

  def self.unichar_isdigit(c : UInt8)
    __var0 = LibGLib.unichar_isdigit(UInt8.new(c))
    (__var0 == 1)
  end

  def self.unichar_isgraph(c : UInt8)
    __var0 = LibGLib.unichar_isgraph(UInt8.new(c))
    (__var0 == 1)
  end

  def self.unichar_islower(c : UInt8)
    __var0 = LibGLib.unichar_islower(UInt8.new(c))
    (__var0 == 1)
  end

  def self.unichar_ismark(c : UInt8)
    __var0 = LibGLib.unichar_ismark(UInt8.new(c))
    (__var0 == 1)
  end

  def self.unichar_isprint(c : UInt8)
    __var0 = LibGLib.unichar_isprint(UInt8.new(c))
    (__var0 == 1)
  end

  def self.unichar_ispunct(c : UInt8)
    __var0 = LibGLib.unichar_ispunct(UInt8.new(c))
    (__var0 == 1)
  end

  def self.unichar_isspace(c : UInt8)
    __var0 = LibGLib.unichar_isspace(UInt8.new(c))
    (__var0 == 1)
  end

  def self.unichar_istitle(c : UInt8)
    __var0 = LibGLib.unichar_istitle(UInt8.new(c))
    (__var0 == 1)
  end

  def self.unichar_isupper(c : UInt8)
    __var0 = LibGLib.unichar_isupper(UInt8.new(c))
    (__var0 == 1)
  end

  def self.unichar_iswide(c : UInt8)
    __var0 = LibGLib.unichar_iswide(UInt8.new(c))
    (__var0 == 1)
  end

  def self.unichar_iswide_cjk(c : UInt8)
    __var0 = LibGLib.unichar_iswide_cjk(UInt8.new(c))
    (__var0 == 1)
  end

  def self.unichar_isxdigit(c : UInt8)
    __var0 = LibGLib.unichar_isxdigit(UInt8.new(c))
    (__var0 == 1)
  end

  def self.unichar_iszerowidth(c : UInt8)
    __var0 = LibGLib.unichar_iszerowidth(UInt8.new(c))
    (__var0 == 1)
  end

  def self.unichar_to_utf8(c : UInt8)
    __var0 = LibGLib.unichar_to_utf8(UInt8.new(c), out outbuf)
    {__var0, ::String.new(outbuf)}
  end

  def self.unichar_tolower(c : UInt8)
    __var0 = LibGLib.unichar_tolower(UInt8.new(c))
    __var0
  end

  def self.unichar_totitle(c : UInt8)
    __var0 = LibGLib.unichar_totitle(UInt8.new(c))
    __var0
  end

  def self.unichar_toupper(c : UInt8)
    __var0 = LibGLib.unichar_toupper(UInt8.new(c))
    __var0
  end

  def self.unichar_type(c : UInt8)
    __var0 = LibGLib.unichar_type(UInt8.new(c))
    GLib::UnicodeType.new(__var0)
  end

  def self.unichar_validate(ch : UInt8)
    __var0 = LibGLib.unichar_validate(UInt8.new(ch))
    (__var0 == 1)
  end

  def self.unichar_xdigit_value(c : UInt8)
    __var0 = LibGLib.unichar_xdigit_value(UInt8.new(c))
    __var0
  end

  def self.unicode_canonical_decomposition(ch : UInt8, result_len : ::Int)
    __var0 = LibGLib.unicode_canonical_decomposition(UInt8.new(ch), result_len)
    GObject.raise_unexpected_null("g_unicode_canonical_decomposition") if __var0.null?
    __var0
  end

  def self.unicode_canonical_ordering(string : UInt8, len : ::Int)
    LibGLib.unicode_canonical_ordering(string, UInt64.new(len))
    nil
  end

  def self.unicode_script_from_iso15924(iso15924 : ::Int)
    __var0 = LibGLib.unicode_script_from_iso15924(UInt32.new(iso15924))
    GLib::UnicodeScript.new(__var0)
  end

  def self.unicode_script_to_iso15924(script : GLib::UnicodeScript)
    __var0 = LibGLib.unicode_script_to_iso15924(script)
    __var0
  end

  def self.unix_error_quark
    __var0 = LibGLib.unix_error_quark
    __var0
  end

  def self.unix_fd_add_full(priority : ::Int, fd : ::Int, condition : GLib::IOCondition, function : GLib::UnixFDSourceFunc, user_data : Void*?, notify : GLib::DestroyNotify)
    __var0 = LibGLib.unix_fd_add_full(Int32.new(priority), Int32.new(fd), condition, function, user_data ? user_data : Pointer(Void).null, notify)
    __var0
  end

  def self.unix_fd_source_new(fd : ::Int, condition : GLib::IOCondition)
    __var0 = LibGLib.unix_fd_source_new(Int32.new(fd), condition)
    GObject.raise_unexpected_null("g_unix_fd_source_new") if __var0.null?
    GLib::Source.new(__var0)
  end

  def self.unix_get_passwd_entry(user_name : ::String)
    __var0 = Pointer(LibGLib::Error).null
    LibGLib.unix_get_passwd_entry(user_name.to_unsafe, pointerof(__var0))
    GLib::Error.assert(__var0)
    nil
  end

  def self.unix_open_pipe(fds : ::Int, flags : ::Int)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.unix_open_pipe(fds, Int32.new(flags), pointerof(__var0))
    GLib::Error.assert(__var0)
    (__var1 == 1)
  end

  def self.unix_set_fd_nonblocking(fd : ::Int, nonblock : ::Bool)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.unix_set_fd_nonblocking(Int32.new(fd), LibC::Int.new(nonblock ? 1 : 0), pointerof(__var0))
    GLib::Error.assert(__var0)
    (__var1 == 1)
  end

  def self.unix_signal_add(priority : ::Int, signum : ::Int, handler : GLib::SourceFunc, user_data : Void*?, notify : GLib::DestroyNotify)
    __var0 = LibGLib.unix_signal_add(Int32.new(priority), Int32.new(signum), handler, user_data ? user_data : Pointer(Void).null, notify)
    __var0
  end

  def self.unix_signal_source_new(signum : ::Int)
    __var0 = LibGLib.unix_signal_source_new(Int32.new(signum))
    GObject.raise_unexpected_null("g_unix_signal_source_new") if __var0.null?
    GLib::Source.new(__var0)
  end

  def self.unlink(filename : ::String)
    __var0 = LibGLib.unlink(filename.to_unsafe)
    __var0
  end

  def self.unsetenv(variable : ::String)
    LibGLib.unsetenv(variable.to_unsafe)
    nil
  end

  def self.uri_escape_string(unescaped : ::String, reserved_chars_allowed : ::String?, allow_utf8 : ::Bool)
    __var0 = LibGLib.uri_escape_string(unescaped.to_unsafe, reserved_chars_allowed ? reserved_chars_allowed.to_unsafe : Pointer(UInt8).null, LibC::Int.new(allow_utf8 ? 1 : 0))
    GObject.raise_unexpected_null("g_uri_escape_string") if __var0.null?
    ::String.new(__var0)
  end

  def self.uri_list_extract_uris(uri_list : ::String)
    __var0 = LibGLib.uri_list_extract_uris(uri_list.to_unsafe)
    GObject.raise_unexpected_null("g_uri_list_extract_uris") if __var0.null?
    GObject::PointerIterator.new(__var0) { |__var1|
      ::String.new(__var1)
    }
  end

  def self.uri_parse_scheme(uri : ::String)
    __var0 = LibGLib.uri_parse_scheme(uri.to_unsafe)
    GObject.raise_unexpected_null("g_uri_parse_scheme") if __var0.null?
    ::String.new(__var0)
  end

  def self.uri_unescape_segment(escaped_string : ::String?, escaped_string_end : ::String?, illegal_characters : ::String?)
    __var0 = LibGLib.uri_unescape_segment(escaped_string ? escaped_string.to_unsafe : Pointer(UInt8).null, escaped_string_end ? escaped_string_end.to_unsafe : Pointer(UInt8).null, illegal_characters ? illegal_characters.to_unsafe : Pointer(UInt8).null)
    GObject.raise_unexpected_null("g_uri_unescape_segment") if __var0.null?
    ::String.new(__var0)
  end

  def self.uri_unescape_string(escaped_string : ::String, illegal_characters : ::String?)
    __var0 = LibGLib.uri_unescape_string(escaped_string.to_unsafe, illegal_characters ? illegal_characters.to_unsafe : Pointer(UInt8).null)
    GObject.raise_unexpected_null("g_uri_unescape_string") if __var0.null?
    ::String.new(__var0)
  end

  def self.usleep(microseconds : ::Int)
    LibGLib.usleep(UInt64.new(microseconds))
    nil
  end

  def self.utf16_to_ucs4(str : ::Int, len : ::Int)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.utf16_to_ucs4(str, Int64.new(len), out items_read, out items_written, pointerof(__var0))
    GLib::Error.assert(__var0)
    GObject.raise_unexpected_null("g_utf16_to_ucs4") if __var1.null?
    {__var1, items_read, items_written}
  end

  def self.utf16_to_utf8(str : ::Int, len : ::Int)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.utf16_to_utf8(str, Int64.new(len), out items_read, out items_written, pointerof(__var0))
    GLib::Error.assert(__var0)
    GObject.raise_unexpected_null("g_utf16_to_utf8") if __var1.null?
    {::String.new(__var1), items_read, items_written}
  end

  def self.utf8_casefold(str : ::String, len : ::Int)
    __var0 = LibGLib.utf8_casefold(str.to_unsafe, Int64.new(len))
    GObject.raise_unexpected_null("g_utf8_casefold") if __var0.null?
    ::String.new(__var0)
  end

  def self.utf8_collate(str1 : ::String, str2 : ::String)
    __var0 = LibGLib.utf8_collate(str1.to_unsafe, str2.to_unsafe)
    __var0
  end

  def self.utf8_collate_key(str : ::String, len : ::Int)
    __var0 = LibGLib.utf8_collate_key(str.to_unsafe, Int64.new(len))
    GObject.raise_unexpected_null("g_utf8_collate_key") if __var0.null?
    ::String.new(__var0)
  end

  def self.utf8_collate_key_for_filename(str : ::String, len : ::Int)
    __var0 = LibGLib.utf8_collate_key_for_filename(str.to_unsafe, Int64.new(len))
    GObject.raise_unexpected_null("g_utf8_collate_key_for_filename") if __var0.null?
    ::String.new(__var0)
  end

  def self.utf8_find_next_char(p : ::String, _end : ::String?)
    __var0 = LibGLib.utf8_find_next_char(p.to_unsafe, _end ? _end.to_unsafe : Pointer(UInt8).null)
    __var1 = ::String.new(__var0) if __var0
    __var1
  end

  def self.utf8_find_prev_char(str : ::String, p : ::String)
    __var0 = LibGLib.utf8_find_prev_char(str.to_unsafe, p.to_unsafe)
    __var1 = ::String.new(__var0) if __var0
    __var1
  end

  def self.utf8_get_char(p : ::String)
    __var0 = LibGLib.utf8_get_char(p.to_unsafe)
    __var0
  end

  def self.utf8_get_char_validated(p : ::String, max_len : ::Int)
    __var0 = LibGLib.utf8_get_char_validated(p.to_unsafe, Int64.new(max_len))
    __var0
  end

  def self.utf8_make_valid(str : ::String, len : ::Int)
    __var0 = LibGLib.utf8_make_valid(str.to_unsafe, Int64.new(len))
    GObject.raise_unexpected_null("g_utf8_make_valid") if __var0.null?
    ::String.new(__var0)
  end

  def self.utf8_normalize(str : ::String, len : ::Int, mode : GLib::NormalizeMode)
    __var0 = LibGLib.utf8_normalize(str.to_unsafe, Int64.new(len), mode)
    __var1 = ::String.new(__var0) if __var0
    __var1
  end

  def self.utf8_offset_to_pointer(str : ::String, offset : ::Int)
    __var0 = LibGLib.utf8_offset_to_pointer(str.to_unsafe, Int64.new(offset))
    GObject.raise_unexpected_null("g_utf8_offset_to_pointer") if __var0.null?
    ::String.new(__var0)
  end

  def self.utf8_pointer_to_offset(str : ::String, pos : ::String)
    __var0 = LibGLib.utf8_pointer_to_offset(str.to_unsafe, pos.to_unsafe)
    __var0
  end

  def self.utf8_prev_char(p : ::String)
    __var0 = LibGLib.utf8_prev_char(p.to_unsafe)
    GObject.raise_unexpected_null("g_utf8_prev_char") if __var0.null?
    ::String.new(__var0)
  end

  def self.utf8_strchr(p : ::String, len : ::Int, c : UInt8)
    __var0 = LibGLib.utf8_strchr(p.to_unsafe, Int64.new(len), UInt8.new(c))
    __var1 = ::String.new(__var0) if __var0
    __var1
  end

  def self.utf8_strdown(str : ::String, len : ::Int)
    __var0 = LibGLib.utf8_strdown(str.to_unsafe, Int64.new(len))
    GObject.raise_unexpected_null("g_utf8_strdown") if __var0.null?
    ::String.new(__var0)
  end

  def self.utf8_strlen(p : ::String, max : ::Int)
    __var0 = LibGLib.utf8_strlen(p.to_unsafe, Int64.new(max))
    __var0
  end

  def self.utf8_strncpy(dest : ::String, src : ::String, n : ::Int)
    __var0 = LibGLib.utf8_strncpy(dest.to_unsafe, src.to_unsafe, UInt64.new(n))
    GObject.raise_unexpected_null("g_utf8_strncpy") if __var0.null?
    ::String.new(__var0)
  end

  def self.utf8_strrchr(p : ::String, len : ::Int, c : UInt8)
    __var0 = LibGLib.utf8_strrchr(p.to_unsafe, Int64.new(len), UInt8.new(c))
    __var1 = ::String.new(__var0) if __var0
    __var1
  end

  def self.utf8_strreverse(str : ::String, len : ::Int)
    __var0 = LibGLib.utf8_strreverse(str.to_unsafe, Int64.new(len))
    GObject.raise_unexpected_null("g_utf8_strreverse") if __var0.null?
    ::String.new(__var0)
  end

  def self.utf8_strup(str : ::String, len : ::Int)
    __var0 = LibGLib.utf8_strup(str.to_unsafe, Int64.new(len))
    GObject.raise_unexpected_null("g_utf8_strup") if __var0.null?
    ::String.new(__var0)
  end

  def self.utf8_substring(str : ::String, start_pos : ::Int, end_pos : ::Int)
    __var0 = LibGLib.utf8_substring(str.to_unsafe, Int64.new(start_pos), Int64.new(end_pos))
    GObject.raise_unexpected_null("g_utf8_substring") if __var0.null?
    ::String.new(__var0)
  end

  def self.utf8_to_ucs4(str : ::String, len : ::Int)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.utf8_to_ucs4(str.to_unsafe, Int64.new(len), out items_read, out items_written, pointerof(__var0))
    GLib::Error.assert(__var0)
    GObject.raise_unexpected_null("g_utf8_to_ucs4") if __var1.null?
    {__var1, items_read, items_written}
  end

  def self.utf8_to_ucs4_fast(str : ::String, len : ::Int)
    __var0 = LibGLib.utf8_to_ucs4_fast(str.to_unsafe, Int64.new(len), out items_written)
    GObject.raise_unexpected_null("g_utf8_to_ucs4_fast") if __var0.null?
    {__var0, items_written}
  end

  def self.utf8_to_utf16(str : ::String, len : ::Int)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.utf8_to_utf16(str.to_unsafe, Int64.new(len), out items_read, out items_written, pointerof(__var0))
    GLib::Error.assert(__var0)
    GObject.raise_unexpected_null("g_utf8_to_utf16") if __var1.null?
    {__var1, items_read, items_written}
  end

  def self.utf8_validate(str : ::Bytes)
    max_len = str.size
    __var0 = LibGLib.utf8_validate(str.to_unsafe, Int64.new(max_len), out _end)
    {(__var0 == 1), ::String.new(_end)}
  end

  def self.utf8_validate_len(str : ::Bytes)
    max_len = str.size
    __var0 = LibGLib.utf8_validate_len(str.to_unsafe, UInt64.new(max_len), out _end)
    {(__var0 == 1), ::String.new(_end)}
  end

  def self.uuid_string_is_valid(str : ::String)
    __var0 = LibGLib.uuid_string_is_valid(str.to_unsafe)
    (__var0 == 1)
  end

  def self.uuid_string_random
    __var0 = LibGLib.uuid_string_random
    GObject.raise_unexpected_null("g_uuid_string_random") if __var0.null?
    ::String.new(__var0)
  end

  def self.variant_get_gtype
    __var0 = LibGLib.variant_get_gtype
    __var0
  end

  def self.variant_is_object_path(string : ::String)
    __var0 = LibGLib.variant_is_object_path(string.to_unsafe)
    (__var0 == 1)
  end

  def self.variant_is_signature(string : ::String)
    __var0 = LibGLib.variant_is_signature(string.to_unsafe)
    (__var0 == 1)
  end

  def self.variant_parse(type : GLib::VariantType?, text : ::String, limit : ::String?, endptr : ::String?)
    __var0 = Pointer(LibGLib::Error).null
    __var1 = LibGLib.variant_parse(type ? type.to_unsafe.as(LibGLib::VariantType*) : Pointer(LibGLib::VariantType).null, text.to_unsafe, limit ? limit.to_unsafe : Pointer(UInt8).null, endptr ? endptr.to_unsafe : Pointer(UInt8).null, pointerof(__var0))
    GLib::Error.assert(__var0)
    GObject.raise_unexpected_null("g_variant_parse") if __var1.null?
    GLib::Variant.new(__var1)
  end

  def self.variant_parse_error_print_context(error : LibGLib::Error*, source_str : ::String)
    __var0 = LibGLib.variant_parse_error_print_context(error, source_str.to_unsafe)
    GObject.raise_unexpected_null("g_variant_parse_error_print_context") if __var0.null?
    ::String.new(__var0)
  end

  def self.variant_parse_error_quark
    __var0 = LibGLib.variant_parse_error_quark
    __var0
  end

  def self.variant_parser_get_error_quark
    __var0 = LibGLib.variant_parser_get_error_quark
    __var0
  end

  def self.variant_type_checked_(arg0 : ::String)
    __var0 = LibGLib.variant_type_checked_(arg0.to_unsafe)
    GObject.raise_unexpected_null("g_variant_type_checked_") if __var0.null?
    GLib::VariantType.new(__var0)
  end

  def self.variant_type_string_get_depth_(type_string : ::String)
    __var0 = LibGLib.variant_type_string_get_depth_(type_string.to_unsafe)
    __var0
  end

  def self.variant_type_string_is_valid(type_string : ::String)
    __var0 = LibGLib.variant_type_string_is_valid(type_string.to_unsafe)
    (__var0 == 1)
  end

  def self.variant_type_string_scan(string : ::String, limit : ::String?)
    __var0 = LibGLib.variant_type_string_scan(string.to_unsafe, limit ? limit.to_unsafe : Pointer(UInt8).null, out endptr)
    {(__var0 == 1), ::String.new(endptr)}
  end

  class Array
    include GObject::WrappedType

    def self.new(data : ::String? = nil, len : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibGLib::Array*))
      __var0.data = data unless data.nil?
      __var0.len = len unless len.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::Array*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Array*)
    end

    def to_unsafe_array
      @pointer.not_nil!.as(LibGLib::Array*)
    end

    def data
      ::String.new(to_unsafe.as(LibGLib::Array*).value.data)
    end

    def data=(value : ::String)
      to_unsafe.as(LibGLib::Array*).value.data = value.to_unsafe
    end

    def len
      to_unsafe.as(LibGLib::Array*).value.len
    end

    def len=(value : UInt32)
      to_unsafe.as(LibGLib::Array*).value.len = UInt32.new(value)
    end
  end

  @[Flags]
  enum AsciiType : UInt32
    ZERO_NONE =    0
    ALNUM     =    1
    ALPHA     =    2
    CNTRL     =    4
    DIGIT     =    8
    GRAPH     =   16
    LOWER     =   32
    PRINT     =   64
    PUNCT     =  128
    SPACE     =  256
    UPPER     =  512
    XDIGIT    = 1024
  end

  class AsyncQueue
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::AsyncQueue*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::AsyncQueue*)
    end

    def to_unsafe_asyncqueue
      @pointer.not_nil!.as(LibGLib::AsyncQueue*)
    end

    def length
      __var0 = LibGLib.async_queue_length(@pointer.as(LibGLib::AsyncQueue*))
      __var0
    end

    def length_unlocked
      __var0 = LibGLib.async_queue_length_unlocked(@pointer.as(LibGLib::AsyncQueue*))
      __var0
    end

    def lock
      LibGLib.async_queue_lock(@pointer.as(LibGLib::AsyncQueue*))
      nil
    end

    def pop
      LibGLib.async_queue_pop(@pointer.as(LibGLib::AsyncQueue*))
      nil
    end

    def pop_unlocked
      LibGLib.async_queue_pop_unlocked(@pointer.as(LibGLib::AsyncQueue*))
      nil
    end

    def push(data : Void*?)
      LibGLib.async_queue_push(@pointer.as(LibGLib::AsyncQueue*), data ? data : Pointer(Void).null)
      nil
    end

    def push_front(item : Void*?)
      LibGLib.async_queue_push_front(@pointer.as(LibGLib::AsyncQueue*), item ? item : Pointer(Void).null)
      nil
    end

    def push_front_unlocked(item : Void*?)
      LibGLib.async_queue_push_front_unlocked(@pointer.as(LibGLib::AsyncQueue*), item ? item : Pointer(Void).null)
      nil
    end

    def push_unlocked(data : Void*?)
      LibGLib.async_queue_push_unlocked(@pointer.as(LibGLib::AsyncQueue*), data ? data : Pointer(Void).null)
      nil
    end

    def ref_unlocked
      LibGLib.async_queue_ref_unlocked(@pointer.as(LibGLib::AsyncQueue*))
      nil
    end

    def remove(item : Void*?)
      __var0 = LibGLib.async_queue_remove(@pointer.as(LibGLib::AsyncQueue*), item ? item : Pointer(Void).null)
      (__var0 == 1)
    end

    def remove_unlocked(item : Void*?)
      __var0 = LibGLib.async_queue_remove_unlocked(@pointer.as(LibGLib::AsyncQueue*), item ? item : Pointer(Void).null)
      (__var0 == 1)
    end

    def timed_pop(end_time : GLib::TimeVal)
      LibGLib.async_queue_timed_pop(@pointer.as(LibGLib::AsyncQueue*), end_time.to_unsafe.as(LibGLib::TimeVal*))
      nil
    end

    def timed_pop_unlocked(end_time : GLib::TimeVal)
      LibGLib.async_queue_timed_pop_unlocked(@pointer.as(LibGLib::AsyncQueue*), end_time.to_unsafe.as(LibGLib::TimeVal*))
      nil
    end

    def timeout_pop(timeout : ::Int)
      LibGLib.async_queue_timeout_pop(@pointer.as(LibGLib::AsyncQueue*), UInt64.new(timeout))
      nil
    end

    def timeout_pop_unlocked(timeout : ::Int)
      LibGLib.async_queue_timeout_pop_unlocked(@pointer.as(LibGLib::AsyncQueue*), UInt64.new(timeout))
      nil
    end

    def try_pop
      LibGLib.async_queue_try_pop(@pointer.as(LibGLib::AsyncQueue*))
      nil
    end

    def try_pop_unlocked
      LibGLib.async_queue_try_pop_unlocked(@pointer.as(LibGLib::AsyncQueue*))
      nil
    end

    def unlock
      LibGLib.async_queue_unlock(@pointer.as(LibGLib::AsyncQueue*))
      nil
    end

    def unref
      LibGLib.async_queue_unref(@pointer.as(LibGLib::AsyncQueue*))
      nil
    end

    def unref_and_unlock
      LibGLib.async_queue_unref_and_unlock(@pointer.as(LibGLib::AsyncQueue*))
      nil
    end
  end

  class BookmarkFile
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::BookmarkFile*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::BookmarkFile*)
    end

    def to_unsafe_bookmarkfile
      @pointer.not_nil!.as(LibGLib::BookmarkFile*)
    end

    def add_application(uri : ::String, name : ::String?, exec : ::String?)
      LibGLib.bookmark_file_add_application(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, name ? name.to_unsafe : Pointer(UInt8).null, exec ? exec.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def add_group(uri : ::String, group : ::String)
      LibGLib.bookmark_file_add_group(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, group.to_unsafe)
      nil
    end

    def free
      LibGLib.bookmark_file_free(@pointer.as(LibGLib::BookmarkFile*))
      nil
    end

    def added(uri : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_get_added(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      __var1
    end

    def app_info(uri : ::String, name : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_get_app_info(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, name.to_unsafe, out exec, out count, out stamp, pointerof(__var0))
      GLib::Error.assert(__var0)
      {(__var1 == 1), ::String.new(exec), count, stamp}
    end

    def applications(uri : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_get_applications(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, out length, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_bookmark_file_get_applications") if __var1.null?
      {GObject::PointerIterator.new(__var1) { |__var2|
        ::String.new(__var2)
      }, length}
    end

    def description(uri : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_get_description(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_bookmark_file_get_description") if __var1.null?
      ::String.new(__var1)
    end

    def groups(uri : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_get_groups(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, out length, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_bookmark_file_get_groups") if __var1.null?
      {GObject::PointerIterator.new(__var1) { |__var2|
        ::String.new(__var2)
      }, length}
    end

    def icon(uri : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_get_icon(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, out href, out mime_type, pointerof(__var0))
      GLib::Error.assert(__var0)
      {(__var1 == 1), ::String.new(href), ::String.new(mime_type)}
    end

    def is_private(uri : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_get_is_private(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def mime_type(uri : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_get_mime_type(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_bookmark_file_get_mime_type") if __var1.null?
      ::String.new(__var1)
    end

    def modified(uri : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_get_modified(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      __var1
    end

    def size
      __var0 = LibGLib.bookmark_file_get_size(@pointer.as(LibGLib::BookmarkFile*))
      __var0
    end

    def title(uri : ::String?)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_get_title(@pointer.as(LibGLib::BookmarkFile*), uri ? uri.to_unsafe : Pointer(UInt8).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_bookmark_file_get_title") if __var1.null?
      ::String.new(__var1)
    end

    def uris
      __var0 = LibGLib.bookmark_file_get_uris(@pointer.as(LibGLib::BookmarkFile*), out length)
      GObject.raise_unexpected_null("g_bookmark_file_get_uris") if __var0.null?
      {GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      }, length}
    end

    def visited(uri : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_get_visited(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      __var1
    end

    def has_application(uri : ::String, name : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_has_application(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, name.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def has_group(uri : ::String, group : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_has_group(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, group.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def has_item(uri : ::String)
      __var0 = LibGLib.bookmark_file_has_item(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe)
      (__var0 == 1)
    end

    def load_from_data(data : ::Bytes)
      length = data.size
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_load_from_data(@pointer.as(LibGLib::BookmarkFile*), data.to_unsafe, UInt64.new(length), pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def load_from_data_dirs(file : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_load_from_data_dirs(@pointer.as(LibGLib::BookmarkFile*), file.to_unsafe, out full_path, pointerof(__var0))
      GLib::Error.assert(__var0)
      {(__var1 == 1), ::String.new(full_path)}
    end

    def load_from_file(filename : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_load_from_file(@pointer.as(LibGLib::BookmarkFile*), filename.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def move_item(old_uri : ::String, new_uri : ::String?)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_move_item(@pointer.as(LibGLib::BookmarkFile*), old_uri.to_unsafe, new_uri ? new_uri.to_unsafe : Pointer(UInt8).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def remove_application(uri : ::String, name : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_remove_application(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, name.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def remove_group(uri : ::String, group : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_remove_group(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, group.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def remove_item(uri : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_remove_item(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def set_added(uri : ::String, added : ::Int)
      LibGLib.bookmark_file_set_added(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, Int64.new(added))
      nil
    end

    def set_app_info(uri : ::String, name : ::String, exec : ::String, count : ::Int, stamp : ::Int)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_set_app_info(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, name.to_unsafe, exec.to_unsafe, Int32.new(count), Int64.new(stamp), pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def set_description(uri : ::String?, description : ::String)
      LibGLib.bookmark_file_set_description(@pointer.as(LibGLib::BookmarkFile*), uri ? uri.to_unsafe : Pointer(UInt8).null, description.to_unsafe)
      nil
    end

    def set_groups(uri : ::String, groups : ::Enumerable?)
      length = groups ? groups.size : 0
      LibGLib.bookmark_file_set_groups(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, groups ? (__groups_ary = groups.map { |__item| __item.to_unsafe }.to_a).to_unsafe : Pointer(Pointer(UInt8)).null, UInt64.new(length))
      nil
    end

    def set_icon(uri : ::String, href : ::String?, mime_type : ::String)
      LibGLib.bookmark_file_set_icon(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, href ? href.to_unsafe : Pointer(UInt8).null, mime_type.to_unsafe)
      nil
    end

    def set_is_private(uri : ::String, is_private : ::Bool)
      LibGLib.bookmark_file_set_is_private(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, LibC::Int.new(is_private ? 1 : 0))
      nil
    end

    def set_mime_type(uri : ::String, mime_type : ::String)
      LibGLib.bookmark_file_set_mime_type(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, mime_type.to_unsafe)
      nil
    end

    def set_modified(uri : ::String, modified : ::Int)
      LibGLib.bookmark_file_set_modified(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, Int64.new(modified))
      nil
    end

    def set_title(uri : ::String?, title : ::String)
      LibGLib.bookmark_file_set_title(@pointer.as(LibGLib::BookmarkFile*), uri ? uri.to_unsafe : Pointer(UInt8).null, title.to_unsafe)
      nil
    end

    def set_visited(uri : ::String, visited : ::Int)
      LibGLib.bookmark_file_set_visited(@pointer.as(LibGLib::BookmarkFile*), uri.to_unsafe, Int64.new(visited))
      nil
    end

    def to_data
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_to_data(@pointer.as(LibGLib::BookmarkFile*), out length, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_bookmark_file_to_data") if __var1.null?
      {GObject::PointerIterator.new(__var1) { |__var2|
        __var2
      }, length}
    end

    def to_file(filename : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.bookmark_file_to_file(@pointer.as(LibGLib::BookmarkFile*), filename.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def self.error_quark
      __var0 = LibGLib.bookmark_file_error_quark
      __var0
    end
  end

  enum BookmarkFileError : UInt32
    INVALID_URI        = 0
    INVALID_VALUE      = 1
    APP_NOT_REGISTERED = 2
    URI_NOT_FOUND      = 3
    READ               = 4
    UNKNOWN_ENCODING   = 5
    WRITE              = 6
    FILE_NOT_FOUND     = 7
  end

  class ByteArray
    include GObject::WrappedType

    def self.new(data : UInt8? = nil, len : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibGLib::ByteArray*))
      __var0.data = data unless data.nil?
      __var0.len = len unless len.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::ByteArray*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::ByteArray*)
    end

    def to_unsafe_bytearray
      @pointer.not_nil!.as(LibGLib::ByteArray*)
    end

    def self.free(array : ::Bytes, free_segment : ::Bool)
      __var0 = LibGLib.byte_array_free(array.to_unsafe, LibC::Int.new(free_segment ? 1 : 0))
      GObject.raise_unexpected_null("g_byte_array_free") if __var0.null?
      __var0
    end

    def self.free_to_bytes(array : ::Bytes)
      __var0 = LibGLib.byte_array_free_to_bytes(array.to_unsafe)
      GObject.raise_unexpected_null("g_byte_array_free_to_bytes") if __var0.null?
      GLib::Bytes.new(__var0)
    end

    def self.new
      __var0 = LibGLib.byte_array_new
      GObject.raise_unexpected_null("g_byte_array_new") if __var0.null?
      __var0
    end

    def self.new_take(data : ::Bytes)
      len = data.size
      __var0 = LibGLib.byte_array_new_take(data.to_unsafe, UInt64.new(len))
      GObject.raise_unexpected_null("g_byte_array_new_take") if __var0.null?
      __var0
    end

    def self.steal(array : ::Bytes)
      __var0 = LibGLib.byte_array_steal(array.to_unsafe, out len)
      GObject.raise_unexpected_null("g_byte_array_steal") if __var0.null?
      {__var0, len}
    end

    def self.unref(array : ::Bytes)
      LibGLib.byte_array_unref(array.to_unsafe)
      nil
    end

    def data
      to_unsafe.as(LibGLib::ByteArray*).value.data
    end

    def data=(value : UInt8)
      to_unsafe.as(LibGLib::ByteArray*).value.data = value
    end

    def len
      to_unsafe.as(LibGLib::ByteArray*).value.len
    end

    def len=(value : UInt32)
      to_unsafe.as(LibGLib::ByteArray*).value.len = UInt32.new(value)
    end
  end

  class Bytes
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::Bytes*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Bytes*)
    end

    def to_unsafe_bytes
      @pointer.not_nil!.as(LibGLib::Bytes*)
    end

    def self.new(data : ::Bytes?) : self
      size = data ? data.size : 0
      __var0 = LibGLib.bytes_new(data ? data.to_unsafe : Pointer(UInt8).null, UInt64.new(size))
      GObject.raise_unexpected_null("g_bytes_new") if __var0.null?
      cast(GLib::Bytes.new(__var0))
    end

    def self.new_take(data : ::Bytes?) : self
      size = data ? data.size : 0
      __var0 = LibGLib.bytes_new_take(data ? data.to_unsafe : Pointer(UInt8).null, UInt64.new(size))
      GObject.raise_unexpected_null("g_bytes_new_take") if __var0.null?
      cast(GLib::Bytes.new(__var0))
    end

    def compare(bytes2 : GLib::Bytes)
      __var0 = LibGLib.bytes_compare(@pointer.as(LibGLib::Bytes*), bytes2.to_unsafe.as(LibGLib::Bytes*))
      __var0
    end

    def equal(bytes2 : GLib::Bytes)
      __var0 = LibGLib.bytes_equal(@pointer.as(LibGLib::Bytes*), bytes2.to_unsafe.as(LibGLib::Bytes*))
      (__var0 == 1)
    end

    def data
      __var0 = LibGLib.bytes_get_data(@pointer.as(LibGLib::Bytes*), out size)
      __var2 = GObject::PointerIterator.new(__var0) { |__var1|
        __var1
      } if __var0
      {__var2, size}
    end

    def size
      __var0 = LibGLib.bytes_get_size(@pointer.as(LibGLib::Bytes*))
      __var0
    end

    def hash
      __var0 = LibGLib.bytes_hash(@pointer.as(LibGLib::Bytes*))
      __var0
    end

    def new_from_bytes(offset : ::Int, length : ::Int)
      __var0 = LibGLib.bytes_new_from_bytes(@pointer.as(LibGLib::Bytes*), UInt64.new(offset), UInt64.new(length))
      GObject.raise_unexpected_null("g_bytes_new_from_bytes") if __var0.null?
      GLib::Bytes.new(__var0)
    end

    def ref
      __var0 = LibGLib.bytes_ref(@pointer.as(LibGLib::Bytes*))
      GObject.raise_unexpected_null("g_bytes_ref") if __var0.null?
      GLib::Bytes.new(__var0)
    end

    def unref
      LibGLib.bytes_unref(@pointer.as(LibGLib::Bytes*))
      nil
    end

    def unref_to_array
      __var0 = LibGLib.bytes_unref_to_array(@pointer.as(LibGLib::Bytes*))
      GObject.raise_unexpected_null("g_bytes_unref_to_array") if __var0.null?
      __var0
    end

    def unref_to_data
      __var0 = LibGLib.bytes_unref_to_data(@pointer.as(LibGLib::Bytes*), out size)
      GObject.raise_unexpected_null("g_bytes_unref_to_data") if __var0.null?
      {GObject::PointerIterator.new(__var0) { |__var1|
        __var1
      }, size}
    end
  end

  class Checksum
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::Checksum*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Checksum*)
    end

    def to_unsafe_checksum
      @pointer.not_nil!.as(LibGLib::Checksum*)
    end

    def self.new(checksum_type : GLib::ChecksumType) : self
      __var0 = LibGLib.checksum_new(checksum_type)
      GObject.raise_unexpected_null("g_checksum_new") if __var0.null?
      cast(GLib::Checksum.new(__var0))
    end

    def copy
      __var0 = LibGLib.checksum_copy(@pointer.as(LibGLib::Checksum*))
      GObject.raise_unexpected_null("g_checksum_copy") if __var0.null?
      GLib::Checksum.new(__var0)
    end

    def free
      LibGLib.checksum_free(@pointer.as(LibGLib::Checksum*))
      nil
    end

    def string
      __var0 = LibGLib.checksum_get_string(@pointer.as(LibGLib::Checksum*))
      GObject.raise_unexpected_null("g_checksum_get_string") if __var0.null?
      ::String.new(__var0)
    end

    def reset
      LibGLib.checksum_reset(@pointer.as(LibGLib::Checksum*))
      nil
    end

    def update(data : ::Bytes)
      length = data.size
      LibGLib.checksum_update(@pointer.as(LibGLib::Checksum*), data.to_unsafe, Int64.new(length))
      nil
    end

    def self.type_get_length(checksum_type : GLib::ChecksumType)
      __var0 = LibGLib.checksum_type_get_length(checksum_type)
      __var0
    end
  end

  enum ChecksumType : UInt32
    MD5    = 0
    SHA1   = 1
    SHA256 = 2
    SHA512 = 3
    SHA384 = 4
  end
  alias ChildWatchFunc = LibGLib::ChildWatchFunc
  alias ClearHandleFunc = LibGLib::ClearHandleFunc
  alias CompareDataFunc = LibGLib::CompareDataFunc
  alias CompareFunc = LibGLib::CompareFunc

  class Cond
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(16u64, 0u8).as(LibGLib::Cond*))
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::Cond*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Cond*)
    end

    def to_unsafe_cond
      @pointer.not_nil!.as(LibGLib::Cond*)
    end

    def broadcast
      LibGLib.cond_broadcast(@pointer.as(LibGLib::Cond*))
      nil
    end

    def clear
      LibGLib.cond_clear(@pointer.as(LibGLib::Cond*))
      nil
    end

    def init
      LibGLib.cond_init(@pointer.as(LibGLib::Cond*))
      nil
    end

    def signal
      LibGLib.cond_signal(@pointer.as(LibGLib::Cond*))
      nil
    end

    def wait(mutex : GLib::Mutex::Union)
      LibGLib.cond_wait(@pointer.as(LibGLib::Cond*), mutex.to_unsafe.as(LibGLib::Mutex*))
      nil
    end

    def wait_until(mutex : GLib::Mutex::Union, end_time : ::Int)
      __var0 = LibGLib.cond_wait_until(@pointer.as(LibGLib::Cond*), mutex.to_unsafe.as(LibGLib::Mutex*), Int64.new(end_time))
      (__var0 == 1)
    end

    def p
      to_unsafe.as(LibGLib::Cond*).value.p
    end

    def i
      GObject::PointerIterator.new(to_unsafe.as(LibGLib::Cond*).value.i) { |__var0|
        __var0
      }
    end
  end

  enum ConvertError : UInt32
    NO_CONVERSION     = 0
    ILLEGAL_SEQUENCE  = 1
    FAILED            = 2
    PARTIAL_INPUT     = 3
    BAD_URI           = 4
    NOT_ABSOLUTE_PATH = 5
    NO_MEMORY         = 6
    EMBEDDED_NUL      = 7
  end
  alias CopyFunc = LibGLib::CopyFunc

  class Data
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::Data*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Data*)
    end

    def to_unsafe_data
      @pointer.not_nil!.as(LibGLib::Data*)
    end
  end

  alias DataForeachFunc = LibGLib::DataForeachFunc

  class Date
    include GObject::WrappedType

    def self.new(julian_days : UInt32? = nil, julian : UInt32? = nil, dmy : UInt32? = nil, day : UInt32? = nil, month : UInt32? = nil, year : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGLib::Date*))
      __var0.julian_days = julian_days unless julian_days.nil?
      __var0.julian = julian unless julian.nil?
      __var0.dmy = dmy unless dmy.nil?
      __var0.day = day unless day.nil?
      __var0.month = month unless month.nil?
      __var0.year = year unless year.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::Date*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Date*)
    end

    def to_unsafe_date
      @pointer.not_nil!.as(LibGLib::Date*)
    end

    def self.new : self
      __var0 = LibGLib.date_new
      GObject.raise_unexpected_null("g_date_new") if __var0.null?
      cast(GLib::Date.new(__var0))
    end

    def self.new_dmy(day : ::Int, month : GLib::DateMonth, year : ::Int) : self
      __var0 = LibGLib.date_new_dmy(UInt8.new(day), month, UInt16.new(year))
      GObject.raise_unexpected_null("g_date_new_dmy") if __var0.null?
      cast(GLib::Date.new(__var0))
    end

    def self.new_julian(julian_day : ::Int) : self
      __var0 = LibGLib.date_new_julian(UInt32.new(julian_day))
      GObject.raise_unexpected_null("g_date_new_julian") if __var0.null?
      cast(GLib::Date.new(__var0))
    end

    def add_days(n_days : ::Int)
      LibGLib.date_add_days(@pointer.as(LibGLib::Date*), UInt32.new(n_days))
      nil
    end

    def add_months(n_months : ::Int)
      LibGLib.date_add_months(@pointer.as(LibGLib::Date*), UInt32.new(n_months))
      nil
    end

    def add_years(n_years : ::Int)
      LibGLib.date_add_years(@pointer.as(LibGLib::Date*), UInt32.new(n_years))
      nil
    end

    def clamp(min_date : GLib::Date, max_date : GLib::Date)
      LibGLib.date_clamp(@pointer.as(LibGLib::Date*), min_date.to_unsafe.as(LibGLib::Date*), max_date.to_unsafe.as(LibGLib::Date*))
      nil
    end

    def clear(n_dates : ::Int)
      LibGLib.date_clear(@pointer.as(LibGLib::Date*), UInt32.new(n_dates))
      nil
    end

    def compare(rhs : GLib::Date)
      __var0 = LibGLib.date_compare(@pointer.as(LibGLib::Date*), rhs.to_unsafe.as(LibGLib::Date*))
      __var0
    end

    def copy
      __var0 = LibGLib.date_copy(@pointer.as(LibGLib::Date*))
      GObject.raise_unexpected_null("g_date_copy") if __var0.null?
      GLib::Date.new(__var0)
    end

    def days_between(date2 : GLib::Date)
      __var0 = LibGLib.date_days_between(@pointer.as(LibGLib::Date*), date2.to_unsafe.as(LibGLib::Date*))
      __var0
    end

    def free
      LibGLib.date_free(@pointer.as(LibGLib::Date*))
      nil
    end

    def day
      __var0 = LibGLib.date_get_day(@pointer.as(LibGLib::Date*))
      __var0
    end

    def day_of_year
      __var0 = LibGLib.date_get_day_of_year(@pointer.as(LibGLib::Date*))
      __var0
    end

    def iso8601_week_of_year
      __var0 = LibGLib.date_get_iso8601_week_of_year(@pointer.as(LibGLib::Date*))
      __var0
    end

    def julian
      __var0 = LibGLib.date_get_julian(@pointer.as(LibGLib::Date*))
      __var0
    end

    def monday_week_of_year
      __var0 = LibGLib.date_get_monday_week_of_year(@pointer.as(LibGLib::Date*))
      __var0
    end

    def month
      __var0 = LibGLib.date_get_month(@pointer.as(LibGLib::Date*))
      GLib::DateMonth.new(__var0)
    end

    def sunday_week_of_year
      __var0 = LibGLib.date_get_sunday_week_of_year(@pointer.as(LibGLib::Date*))
      __var0
    end

    def weekday
      __var0 = LibGLib.date_get_weekday(@pointer.as(LibGLib::Date*))
      GLib::DateWeekday.new(__var0)
    end

    def year
      __var0 = LibGLib.date_get_year(@pointer.as(LibGLib::Date*))
      __var0
    end

    def first_of_month?
      __var0 = LibGLib.date_is_first_of_month(@pointer.as(LibGLib::Date*))
      (__var0 == 1)
    end

    def last_of_month?
      __var0 = LibGLib.date_is_last_of_month(@pointer.as(LibGLib::Date*))
      (__var0 == 1)
    end

    def order(date2 : GLib::Date)
      LibGLib.date_order(@pointer.as(LibGLib::Date*), date2.to_unsafe.as(LibGLib::Date*))
      nil
    end

    def day=(day : ::Int)
      LibGLib.date_set_day(@pointer.as(LibGLib::Date*), UInt8.new(day))
      nil
    end

    def set_dmy(day : ::Int, month : GLib::DateMonth, y : ::Int)
      LibGLib.date_set_dmy(@pointer.as(LibGLib::Date*), UInt8.new(day), month, UInt16.new(y))
      nil
    end

    def julian=(julian_date : ::Int)
      LibGLib.date_set_julian(@pointer.as(LibGLib::Date*), UInt32.new(julian_date))
      nil
    end

    def month=(month : GLib::DateMonth)
      LibGLib.date_set_month(@pointer.as(LibGLib::Date*), month)
      nil
    end

    def parse=(str : ::String)
      LibGLib.date_set_parse(@pointer.as(LibGLib::Date*), str.to_unsafe)
      nil
    end

    def time=(time_ : ::Int)
      LibGLib.date_set_time(@pointer.as(LibGLib::Date*), Int32.new(time_))
      nil
    end

    def time_t=(timet : ::Int)
      LibGLib.date_set_time_t(@pointer.as(LibGLib::Date*), Int64.new(timet))
      nil
    end

    def time_val=(timeval : GLib::TimeVal)
      LibGLib.date_set_time_val(@pointer.as(LibGLib::Date*), timeval.to_unsafe.as(LibGLib::TimeVal*))
      nil
    end

    def year=(year : ::Int)
      LibGLib.date_set_year(@pointer.as(LibGLib::Date*), UInt16.new(year))
      nil
    end

    def subtract_days(n_days : ::Int)
      LibGLib.date_subtract_days(@pointer.as(LibGLib::Date*), UInt32.new(n_days))
      nil
    end

    def subtract_months(n_months : ::Int)
      LibGLib.date_subtract_months(@pointer.as(LibGLib::Date*), UInt32.new(n_months))
      nil
    end

    def subtract_years(n_years : ::Int)
      LibGLib.date_subtract_years(@pointer.as(LibGLib::Date*), UInt32.new(n_years))
      nil
    end

    def to_struct_tm(tm : Void*)
      LibGLib.date_to_struct_tm(@pointer.as(LibGLib::Date*), tm)
      nil
    end

    def valid
      __var0 = LibGLib.date_valid(@pointer.as(LibGLib::Date*))
      (__var0 == 1)
    end

    def self.days_in_month(month : GLib::DateMonth, year : ::Int)
      __var0 = LibGLib.date_get_days_in_month(month, UInt16.new(year))
      __var0
    end

    def self.monday_weeks_in_year(year : ::Int)
      __var0 = LibGLib.date_get_monday_weeks_in_year(UInt16.new(year))
      __var0
    end

    def self.sunday_weeks_in_year(year : ::Int)
      __var0 = LibGLib.date_get_sunday_weeks_in_year(UInt16.new(year))
      __var0
    end

    def self.leap_year?(year : ::Int)
      __var0 = LibGLib.date_is_leap_year(UInt16.new(year))
      (__var0 == 1)
    end

    def self.strftime(s : ::String, slen : ::Int, format : ::String, date : GLib::Date)
      __var0 = LibGLib.date_strftime(s.to_unsafe, UInt64.new(slen), format.to_unsafe, date.to_unsafe.as(LibGLib::Date*))
      __var0
    end

    def self.valid_day(day : ::Int)
      __var0 = LibGLib.date_valid_day(UInt8.new(day))
      (__var0 == 1)
    end

    def self.valid_dmy(day : ::Int, month : GLib::DateMonth, year : ::Int)
      __var0 = LibGLib.date_valid_dmy(UInt8.new(day), month, UInt16.new(year))
      (__var0 == 1)
    end

    def self.valid_julian(julian_date : ::Int)
      __var0 = LibGLib.date_valid_julian(UInt32.new(julian_date))
      (__var0 == 1)
    end

    def self.valid_month(month : GLib::DateMonth)
      __var0 = LibGLib.date_valid_month(month)
      (__var0 == 1)
    end

    def self.valid_weekday(weekday : GLib::DateWeekday)
      __var0 = LibGLib.date_valid_weekday(weekday)
      (__var0 == 1)
    end

    def self.valid_year(year : ::Int)
      __var0 = LibGLib.date_valid_year(UInt16.new(year))
      (__var0 == 1)
    end

    def julian_days
      to_unsafe.as(LibGLib::Date*).value.julian_days
    end

    def julian_days=(value : UInt32)
      to_unsafe.as(LibGLib::Date*).value.julian_days = UInt32.new(value)
    end

    def dmy
      to_unsafe.as(LibGLib::Date*).value.dmy
    end

    def dmy=(value : UInt32)
      to_unsafe.as(LibGLib::Date*).value.dmy = UInt32.new(value)
    end
  end

  enum DateDMY : UInt32
    DAY   = 0
    MONTH = 1
    YEAR  = 2
  end

  enum DateMonth : UInt32
    BAD_MONTH =  0
    JANUARY   =  1
    FEBRUARY  =  2
    MARCH     =  3
    APRIL     =  4
    MAY       =  5
    JUNE      =  6
    JULY      =  7
    AUGUST    =  8
    SEPTEMBER =  9
    OCTOBER   = 10
    NOVEMBER  = 11
    DECEMBER  = 12
  end

  class DateTime
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::DateTime*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::DateTime*)
    end

    def to_unsafe_datetime
      @pointer.not_nil!.as(LibGLib::DateTime*)
    end

    def self.new(tz : GLib::TimeZone, year : ::Int, month : ::Int, day : ::Int, hour : ::Int, minute : ::Int, seconds : ::Float) : self
      __var0 = LibGLib.date_time_new(tz.to_unsafe.as(LibGLib::TimeZone*), Int32.new(year), Int32.new(month), Int32.new(day), Int32.new(hour), Int32.new(minute), Float64.new(seconds))
      GObject.raise_unexpected_null("g_date_time_new") if __var0.null?
      cast(GLib::DateTime.new(__var0))
    end

    def self.new_from_iso8601(text : ::String, default_tz : GLib::TimeZone?) : self
      __var0 = LibGLib.date_time_new_from_iso8601(text.to_unsafe, default_tz ? default_tz.to_unsafe.as(LibGLib::TimeZone*) : Pointer(LibGLib::TimeZone).null)
      __var1 = cast(GLib::DateTime.new(__var0)) if __var0
      __var1
    end

    def self.new_from_timeval_local(tv : GLib::TimeVal) : self
      __var0 = LibGLib.date_time_new_from_timeval_local(tv.to_unsafe.as(LibGLib::TimeVal*))
      GObject.raise_unexpected_null("g_date_time_new_from_timeval_local") if __var0.null?
      cast(GLib::DateTime.new(__var0))
    end

    def self.new_from_timeval_utc(tv : GLib::TimeVal) : self
      __var0 = LibGLib.date_time_new_from_timeval_utc(tv.to_unsafe.as(LibGLib::TimeVal*))
      GObject.raise_unexpected_null("g_date_time_new_from_timeval_utc") if __var0.null?
      cast(GLib::DateTime.new(__var0))
    end

    def self.new_from_unix_local(t : ::Int) : self
      __var0 = LibGLib.date_time_new_from_unix_local(Int64.new(t))
      GObject.raise_unexpected_null("g_date_time_new_from_unix_local") if __var0.null?
      cast(GLib::DateTime.new(__var0))
    end

    def self.new_from_unix_utc(t : ::Int) : self
      __var0 = LibGLib.date_time_new_from_unix_utc(Int64.new(t))
      GObject.raise_unexpected_null("g_date_time_new_from_unix_utc") if __var0.null?
      cast(GLib::DateTime.new(__var0))
    end

    def self.new_local(year : ::Int, month : ::Int, day : ::Int, hour : ::Int, minute : ::Int, seconds : ::Float) : self
      __var0 = LibGLib.date_time_new_local(Int32.new(year), Int32.new(month), Int32.new(day), Int32.new(hour), Int32.new(minute), Float64.new(seconds))
      GObject.raise_unexpected_null("g_date_time_new_local") if __var0.null?
      cast(GLib::DateTime.new(__var0))
    end

    def self.new_now(tz : GLib::TimeZone) : self
      __var0 = LibGLib.date_time_new_now(tz.to_unsafe.as(LibGLib::TimeZone*))
      GObject.raise_unexpected_null("g_date_time_new_now") if __var0.null?
      cast(GLib::DateTime.new(__var0))
    end

    def self.new_now_local : self
      __var0 = LibGLib.date_time_new_now_local
      GObject.raise_unexpected_null("g_date_time_new_now_local") if __var0.null?
      cast(GLib::DateTime.new(__var0))
    end

    def self.new_now_utc : self
      __var0 = LibGLib.date_time_new_now_utc
      GObject.raise_unexpected_null("g_date_time_new_now_utc") if __var0.null?
      cast(GLib::DateTime.new(__var0))
    end

    def self.new_utc(year : ::Int, month : ::Int, day : ::Int, hour : ::Int, minute : ::Int, seconds : ::Float) : self
      __var0 = LibGLib.date_time_new_utc(Int32.new(year), Int32.new(month), Int32.new(day), Int32.new(hour), Int32.new(minute), Float64.new(seconds))
      GObject.raise_unexpected_null("g_date_time_new_utc") if __var0.null?
      cast(GLib::DateTime.new(__var0))
    end

    def add(timespan : ::Int)
      __var0 = LibGLib.date_time_add(@pointer.as(LibGLib::DateTime*), Int64.new(timespan))
      GObject.raise_unexpected_null("g_date_time_add") if __var0.null?
      GLib::DateTime.new(__var0)
    end

    def add_days(days : ::Int)
      __var0 = LibGLib.date_time_add_days(@pointer.as(LibGLib::DateTime*), Int32.new(days))
      GObject.raise_unexpected_null("g_date_time_add_days") if __var0.null?
      GLib::DateTime.new(__var0)
    end

    def add_full(years : ::Int, months : ::Int, days : ::Int, hours : ::Int, minutes : ::Int, seconds : ::Float)
      __var0 = LibGLib.date_time_add_full(@pointer.as(LibGLib::DateTime*), Int32.new(years), Int32.new(months), Int32.new(days), Int32.new(hours), Int32.new(minutes), Float64.new(seconds))
      GObject.raise_unexpected_null("g_date_time_add_full") if __var0.null?
      GLib::DateTime.new(__var0)
    end

    def add_hours(hours : ::Int)
      __var0 = LibGLib.date_time_add_hours(@pointer.as(LibGLib::DateTime*), Int32.new(hours))
      GObject.raise_unexpected_null("g_date_time_add_hours") if __var0.null?
      GLib::DateTime.new(__var0)
    end

    def add_minutes(minutes : ::Int)
      __var0 = LibGLib.date_time_add_minutes(@pointer.as(LibGLib::DateTime*), Int32.new(minutes))
      GObject.raise_unexpected_null("g_date_time_add_minutes") if __var0.null?
      GLib::DateTime.new(__var0)
    end

    def add_months(months : ::Int)
      __var0 = LibGLib.date_time_add_months(@pointer.as(LibGLib::DateTime*), Int32.new(months))
      GObject.raise_unexpected_null("g_date_time_add_months") if __var0.null?
      GLib::DateTime.new(__var0)
    end

    def add_seconds(seconds : ::Float)
      __var0 = LibGLib.date_time_add_seconds(@pointer.as(LibGLib::DateTime*), Float64.new(seconds))
      GObject.raise_unexpected_null("g_date_time_add_seconds") if __var0.null?
      GLib::DateTime.new(__var0)
    end

    def add_weeks(weeks : ::Int)
      __var0 = LibGLib.date_time_add_weeks(@pointer.as(LibGLib::DateTime*), Int32.new(weeks))
      GObject.raise_unexpected_null("g_date_time_add_weeks") if __var0.null?
      GLib::DateTime.new(__var0)
    end

    def add_years(years : ::Int)
      __var0 = LibGLib.date_time_add_years(@pointer.as(LibGLib::DateTime*), Int32.new(years))
      GObject.raise_unexpected_null("g_date_time_add_years") if __var0.null?
      GLib::DateTime.new(__var0)
    end

    def difference(_begin : GLib::DateTime)
      __var0 = LibGLib.date_time_difference(@pointer.as(LibGLib::DateTime*), _begin.to_unsafe.as(LibGLib::DateTime*))
      __var0
    end

    def format(format : ::String)
      __var0 = LibGLib.date_time_format(@pointer.as(LibGLib::DateTime*), format.to_unsafe)
      GObject.raise_unexpected_null("g_date_time_format") if __var0.null?
      ::String.new(__var0)
    end

    def format_iso8601
      __var0 = LibGLib.date_time_format_iso8601(@pointer.as(LibGLib::DateTime*))
      GObject.raise_unexpected_null("g_date_time_format_iso8601") if __var0.null?
      ::String.new(__var0)
    end

    def day_of_month
      __var0 = LibGLib.date_time_get_day_of_month(@pointer.as(LibGLib::DateTime*))
      __var0
    end

    def day_of_week
      __var0 = LibGLib.date_time_get_day_of_week(@pointer.as(LibGLib::DateTime*))
      __var0
    end

    def day_of_year
      __var0 = LibGLib.date_time_get_day_of_year(@pointer.as(LibGLib::DateTime*))
      __var0
    end

    def hour
      __var0 = LibGLib.date_time_get_hour(@pointer.as(LibGLib::DateTime*))
      __var0
    end

    def microsecond
      __var0 = LibGLib.date_time_get_microsecond(@pointer.as(LibGLib::DateTime*))
      __var0
    end

    def minute
      __var0 = LibGLib.date_time_get_minute(@pointer.as(LibGLib::DateTime*))
      __var0
    end

    def month
      __var0 = LibGLib.date_time_get_month(@pointer.as(LibGLib::DateTime*))
      __var0
    end

    def second
      __var0 = LibGLib.date_time_get_second(@pointer.as(LibGLib::DateTime*))
      __var0
    end

    def seconds
      __var0 = LibGLib.date_time_get_seconds(@pointer.as(LibGLib::DateTime*))
      __var0
    end

    def timezone
      __var0 = LibGLib.date_time_get_timezone(@pointer.as(LibGLib::DateTime*))
      GObject.raise_unexpected_null("g_date_time_get_timezone") if __var0.null?
      GLib::TimeZone.new(__var0)
    end

    def timezone_abbreviation
      __var0 = LibGLib.date_time_get_timezone_abbreviation(@pointer.as(LibGLib::DateTime*))
      GObject.raise_unexpected_null("g_date_time_get_timezone_abbreviation") if __var0.null?
      ::String.new(__var0)
    end

    def utc_offset
      __var0 = LibGLib.date_time_get_utc_offset(@pointer.as(LibGLib::DateTime*))
      __var0
    end

    def week_numbering_year
      __var0 = LibGLib.date_time_get_week_numbering_year(@pointer.as(LibGLib::DateTime*))
      __var0
    end

    def week_of_year
      __var0 = LibGLib.date_time_get_week_of_year(@pointer.as(LibGLib::DateTime*))
      __var0
    end

    def year
      __var0 = LibGLib.date_time_get_year(@pointer.as(LibGLib::DateTime*))
      __var0
    end

    def ymd
      LibGLib.date_time_get_ymd(@pointer.as(LibGLib::DateTime*), out year, out month, out day)
      {year, month, day}
    end

    def daylight_savings?
      __var0 = LibGLib.date_time_is_daylight_savings(@pointer.as(LibGLib::DateTime*))
      (__var0 == 1)
    end

    def ref
      __var0 = LibGLib.date_time_ref(@pointer.as(LibGLib::DateTime*))
      GObject.raise_unexpected_null("g_date_time_ref") if __var0.null?
      GLib::DateTime.new(__var0)
    end

    def to_local
      __var0 = LibGLib.date_time_to_local(@pointer.as(LibGLib::DateTime*))
      GObject.raise_unexpected_null("g_date_time_to_local") if __var0.null?
      GLib::DateTime.new(__var0)
    end

    def to_timeval(tv : GLib::TimeVal)
      __var0 = LibGLib.date_time_to_timeval(@pointer.as(LibGLib::DateTime*), tv.to_unsafe.as(LibGLib::TimeVal*))
      (__var0 == 1)
    end

    def to_timezone(tz : GLib::TimeZone)
      __var0 = LibGLib.date_time_to_timezone(@pointer.as(LibGLib::DateTime*), tz.to_unsafe.as(LibGLib::TimeZone*))
      GObject.raise_unexpected_null("g_date_time_to_timezone") if __var0.null?
      GLib::DateTime.new(__var0)
    end

    def to_unix
      __var0 = LibGLib.date_time_to_unix(@pointer.as(LibGLib::DateTime*))
      __var0
    end

    def to_utc
      __var0 = LibGLib.date_time_to_utc(@pointer.as(LibGLib::DateTime*))
      GObject.raise_unexpected_null("g_date_time_to_utc") if __var0.null?
      GLib::DateTime.new(__var0)
    end

    def unref
      LibGLib.date_time_unref(@pointer.as(LibGLib::DateTime*))
      nil
    end

    def self.compare(dt1 : Void*, dt2 : Void*)
      __var0 = LibGLib.date_time_compare(dt1, dt2)
      __var0
    end

    def self.equal(dt1 : Void*, dt2 : Void*)
      __var0 = LibGLib.date_time_equal(dt1, dt2)
      (__var0 == 1)
    end

    def self.hash(datetime : Void*)
      __var0 = LibGLib.date_time_hash(datetime)
      __var0
    end
  end

  enum DateWeekday : UInt32
    BAD_WEEKDAY = 0
    MONDAY      = 1
    TUESDAY     = 2
    WEDNESDAY   = 3
    THURSDAY    = 4
    FRIDAY      = 5
    SATURDAY    = 6
    SUNDAY      = 7
  end

  class DebugKey
    include GObject::WrappedType

    def self.new(key : ::String? = nil, value : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibGLib::DebugKey*))
      __var0.key = key unless key.nil?
      __var0.value = value unless value.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::DebugKey*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::DebugKey*)
    end

    def to_unsafe_debugkey
      @pointer.not_nil!.as(LibGLib::DebugKey*)
    end

    def key
      ::String.new(to_unsafe.as(LibGLib::DebugKey*).value.key)
    end

    def key=(value : ::String)
      to_unsafe.as(LibGLib::DebugKey*).value.key = value.to_unsafe
    end

    def value
      to_unsafe.as(LibGLib::DebugKey*).value.value
    end

    def value=(value : UInt32)
      to_unsafe.as(LibGLib::DebugKey*).value.value = UInt32.new(value)
    end
  end

  alias DestroyNotify = LibGLib::DestroyNotify

  class Dir
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::Dir*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Dir*)
    end

    def to_unsafe_dir
      @pointer.not_nil!.as(LibGLib::Dir*)
    end

    def close
      LibGLib.dir_close(@pointer.as(LibGLib::Dir*))
      nil
    end

    def read_name
      __var0 = LibGLib.dir_read_name(@pointer.as(LibGLib::Dir*))
      GObject.raise_unexpected_null("g_dir_read_name") if __var0.null?
      ::String.new(__var0)
    end

    def rewind
      LibGLib.dir_rewind(@pointer.as(LibGLib::Dir*))
      nil
    end

    def self.make_tmp(tmpl : ::String?)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.dir_make_tmp(tmpl ? tmpl.to_unsafe : Pointer(UInt8).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_dir_make_tmp") if __var1.null?
      ::String.new(__var1)
    end
  end

  class DoubleIEEE754
    include GObject::WrappedType
    alias Union = DoubleIEEE754 | Float64

    def v_double
      to_unsafe.as(LibGLib::DoubleIEEE754*).value.v_double
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::DoubleIEEE754*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::DoubleIEEE754*)
    end

    def to_unsafe_doubleieee754
      @pointer.not_nil!.as(LibGLib::DoubleIEEE754*)
    end
  end

  alias DuplicateFunc = LibGLib::DuplicateFunc
  alias EqualFunc = LibGLib::EqualFunc

  class Error
    include GObject::WrappedType

    def self.new(domain : UInt32? = nil, code : Int32? = nil, message : ::String? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibGLib::Error*))
      __var0.domain = domain unless domain.nil?
      __var0.code = code unless code.nil?
      __var0.message = message unless message.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::Error*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Error*)
    end

    def to_unsafe_error
      @pointer.not_nil!.as(LibGLib::Error*)
    end

    def self.new_literal(domain : ::Int, code : ::Int, message : ::String) : self
      __var0 = LibGLib.error_new_literal(UInt32.new(domain), Int32.new(code), message.to_unsafe)
      GObject.raise_unexpected_null("g_error_new_literal") if __var0.null?
      cast(__var0)
    end

    def copy
      __var0 = LibGLib.error_copy(@pointer.as(LibGLib::Error*))
      GObject.raise_unexpected_null("g_error_copy") if __var0.null?
      __var0
    end

    def free
      LibGLib.error_free(@pointer.as(LibGLib::Error*))
      nil
    end

    def matches(domain : ::Int, code : ::Int)
      __var0 = LibGLib.error_matches(@pointer.as(LibGLib::Error*), UInt32.new(domain), Int32.new(code))
      (__var0 == 1)
    end

    def domain
      to_unsafe.as(LibGLib::Error*).value.domain
    end

    def domain=(value : UInt32)
      to_unsafe.as(LibGLib::Error*).value.domain = UInt32.new(value)
    end

    def code
      to_unsafe.as(LibGLib::Error*).value.code
    end

    def code=(value : Int32)
      to_unsafe.as(LibGLib::Error*).value.code = Int32.new(value)
    end

    def message
      ::String.new(to_unsafe.as(LibGLib::Error*).value.message)
    end

    def message=(value : ::String)
      to_unsafe.as(LibGLib::Error*).value.message = value.to_unsafe
    end
  end

  enum ErrorType : UInt32
    UNKNOWN              = 0
    UNEXP_EOF            = 1
    UNEXP_EOF_IN_STRING  = 2
    UNEXP_EOF_IN_COMMENT = 3
    NON_DIGIT_IN_CONST   = 4
    DIGIT_RADIX          = 5
    FLOAT_RADIX          = 6
    FLOAT_MALFORMED      = 7
  end

  enum FileError : UInt32
    EXIST       =  0
    ISDIR       =  1
    ACCES       =  2
    NAMETOOLONG =  3
    NOENT       =  4
    NOTDIR      =  5
    NXIO        =  6
    NODEV       =  7
    ROFS        =  8
    TXTBSY      =  9
    FAULT       = 10
    LOOP        = 11
    NOSPC       = 12
    NOMEM       = 13
    MFILE       = 14
    NFILE       = 15
    BADF        = 16
    INVAL       = 17
    PIPE        = 18
    AGAIN       = 19
    INTR        = 20
    IO          = 21
    PERM        = 22
    NOSYS       = 23
    FAILED      = 24
  end

  @[Flags]
  enum FileTest : UInt32
    ZERO_NONE     =  0
    IS_REGULAR    =  1
    IS_SYMLINK    =  2
    IS_DIR        =  4
    IS_EXECUTABLE =  8
    EXISTS        = 16
  end

  class FloatIEEE754
    include GObject::WrappedType
    alias Union = FloatIEEE754 | Float32

    def v_float
      to_unsafe.as(LibGLib::FloatIEEE754*).value.v_float
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::FloatIEEE754*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::FloatIEEE754*)
    end

    def to_unsafe_floatieee754
      @pointer.not_nil!.as(LibGLib::FloatIEEE754*)
    end
  end

  @[Flags]
  enum FormatSizeFlags : UInt32
    DEFAULT     = 0
    LONG_FORMAT = 1
    IEC_UNITS   = 2
    BITS        = 4
  end
  alias FreeFunc = LibGLib::FreeFunc
  alias Func = LibGLib::Func
  alias HFunc = LibGLib::HFunc
  alias HRFunc = LibGLib::HRFunc
  alias HashFunc = LibGLib::HashFunc

  class HashTable
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::HashTable*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::HashTable*)
    end

    def to_unsafe_hashtable
      @pointer.not_nil!.as(LibGLib::HashTable*)
    end

    def self.add(hash_table : Void*, key : Void*?)
      __var0 = LibGLib.hash_table_add(hash_table, key ? key : Pointer(Void).null)
      (__var0 == 1)
    end

    def self.contains(hash_table : Void*, key : Void*?)
      __var0 = LibGLib.hash_table_contains(hash_table, key ? key : Pointer(Void).null)
      (__var0 == 1)
    end

    def self.destroy(hash_table : Void*)
      LibGLib.hash_table_destroy(hash_table)
      nil
    end

    def self.insert(hash_table : Void*, key : Void*?, value : Void*?)
      __var0 = LibGLib.hash_table_insert(hash_table, key ? key : Pointer(Void).null, value ? value : Pointer(Void).null)
      (__var0 == 1)
    end

    def self.lookup(hash_table : Void*, key : Void*?)
      LibGLib.hash_table_lookup(hash_table, key ? key : Pointer(Void).null)
      nil
    end

    def self.lookup_extended(hash_table : Void*, lookup_key : Void*?, orig_key : Void*?, value : Void*?)
      __var0 = LibGLib.hash_table_lookup_extended(hash_table, lookup_key ? lookup_key : Pointer(Void).null, orig_key, value)
      (__var0 == 1)
    end

    def self.remove(hash_table : Void*, key : Void*?)
      __var0 = LibGLib.hash_table_remove(hash_table, key ? key : Pointer(Void).null)
      (__var0 == 1)
    end

    def self.remove_all(hash_table : Void*)
      LibGLib.hash_table_remove_all(hash_table)
      nil
    end

    def self.replace(hash_table : Void*, key : Void*?, value : Void*?)
      __var0 = LibGLib.hash_table_replace(hash_table, key ? key : Pointer(Void).null, value ? value : Pointer(Void).null)
      (__var0 == 1)
    end

    def self.size(hash_table : Void*)
      __var0 = LibGLib.hash_table_size(hash_table)
      __var0
    end

    def self.steal(hash_table : Void*, key : Void*?)
      __var0 = LibGLib.hash_table_steal(hash_table, key ? key : Pointer(Void).null)
      (__var0 == 1)
    end

    def self.steal_all(hash_table : Void*)
      LibGLib.hash_table_steal_all(hash_table)
      nil
    end

    def self.steal_extended(hash_table : Void*, lookup_key : Void*?, stolen_key : Void*?, stolen_value : Void*?)
      __var0 = LibGLib.hash_table_steal_extended(hash_table, lookup_key ? lookup_key : Pointer(Void).null, stolen_key, stolen_value)
      (__var0 == 1)
    end

    def self.unref(hash_table : Void*)
      LibGLib.hash_table_unref(hash_table)
      nil
    end
  end

  class HashTableIter
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(40u64, 0u8).as(LibGLib::HashTableIter*))
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::HashTableIter*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::HashTableIter*)
    end

    def to_unsafe_hashtableiter
      @pointer.not_nil!.as(LibGLib::HashTableIter*)
    end

    def init(hash_table : Void*)
      LibGLib.hash_table_iter_init(@pointer.as(LibGLib::HashTableIter*), hash_table)
      nil
    end

    def next(key : Void*?, value : Void*?)
      __var0 = LibGLib.hash_table_iter_next(@pointer.as(LibGLib::HashTableIter*), key, value)
      (__var0 == 1)
    end

    def remove
      LibGLib.hash_table_iter_remove(@pointer.as(LibGLib::HashTableIter*))
      nil
    end

    def replace(value : Void*?)
      LibGLib.hash_table_iter_replace(@pointer.as(LibGLib::HashTableIter*), value ? value : Pointer(Void).null)
      nil
    end

    def steal
      LibGLib.hash_table_iter_steal(@pointer.as(LibGLib::HashTableIter*))
      nil
    end

    def dummy1
      to_unsafe.as(LibGLib::HashTableIter*).value.dummy1
    end

    def dummy2
      to_unsafe.as(LibGLib::HashTableIter*).value.dummy2
    end

    def dummy3
      to_unsafe.as(LibGLib::HashTableIter*).value.dummy3
    end

    def dummy4
      to_unsafe.as(LibGLib::HashTableIter*).value.dummy4
    end

    def dummy5
      (to_unsafe.as(LibGLib::HashTableIter*).value.dummy5 == 1)
    end

    def dummy6
      to_unsafe.as(LibGLib::HashTableIter*).value.dummy6
    end
  end

  class Hmac
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::Hmac*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Hmac*)
    end

    def to_unsafe_hmac
      @pointer.not_nil!.as(LibGLib::Hmac*)
    end

    def digest(buffer : ::Bytes)
      digest_len = buffer.size
      LibGLib.hmac_get_digest(@pointer.as(LibGLib::Hmac*), buffer.to_unsafe, digest_len)
      nil
    end

    def string
      __var0 = LibGLib.hmac_get_string(@pointer.as(LibGLib::Hmac*))
      GObject.raise_unexpected_null("g_hmac_get_string") if __var0.null?
      ::String.new(__var0)
    end

    def unref
      LibGLib.hmac_unref(@pointer.as(LibGLib::Hmac*))
      nil
    end

    def update(data : ::Bytes)
      length = data.size
      LibGLib.hmac_update(@pointer.as(LibGLib::Hmac*), data.to_unsafe, Int64.new(length))
      nil
    end
  end

  class Hook
    include GObject::WrappedType

    def self.new(data : Void*? = nil, next _next : GLib::Hook? = nil, prev : GLib::Hook? = nil, ref_count : UInt32? = nil, hook_id : UInt64? = nil, flags : UInt32? = nil, func : Void*? = nil, destroy : GLib::DestroyNotify? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(64u64, 0u8).as(LibGLib::Hook*))
      __var0.data = data unless data.nil?
      __var0.next = _next unless _next.nil?
      __var0.prev = prev unless prev.nil?
      __var0.ref_count = ref_count unless ref_count.nil?
      __var0.hook_id = hook_id unless hook_id.nil?
      __var0.flags = flags unless flags.nil?
      __var0.func = func unless func.nil?
      __var0.destroy = destroy unless destroy.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::Hook*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Hook*)
    end

    def to_unsafe_hook
      @pointer.not_nil!.as(LibGLib::Hook*)
    end

    def compare_ids(sibling : GLib::Hook)
      __var0 = LibGLib.hook_compare_ids(@pointer.as(LibGLib::Hook*), sibling.to_unsafe.as(LibGLib::Hook*))
      __var0
    end

    def self.destroy(hook_list : GLib::HookList, hook_id : ::Int)
      __var0 = LibGLib.hook_destroy(hook_list.to_unsafe.as(LibGLib::HookList*), UInt64.new(hook_id))
      (__var0 == 1)
    end

    def self.destroy_link(hook_list : GLib::HookList, hook : GLib::Hook)
      LibGLib.hook_destroy_link(hook_list.to_unsafe.as(LibGLib::HookList*), hook.to_unsafe.as(LibGLib::Hook*))
      nil
    end

    def self.free(hook_list : GLib::HookList, hook : GLib::Hook)
      LibGLib.hook_free(hook_list.to_unsafe.as(LibGLib::HookList*), hook.to_unsafe.as(LibGLib::Hook*))
      nil
    end

    def self.insert_before(hook_list : GLib::HookList, sibling : GLib::Hook?, hook : GLib::Hook)
      LibGLib.hook_insert_before(hook_list.to_unsafe.as(LibGLib::HookList*), sibling ? sibling.to_unsafe.as(LibGLib::Hook*) : Pointer(LibGLib::Hook).null, hook.to_unsafe.as(LibGLib::Hook*))
      nil
    end

    def self.prepend(hook_list : GLib::HookList, hook : GLib::Hook)
      LibGLib.hook_prepend(hook_list.to_unsafe.as(LibGLib::HookList*), hook.to_unsafe.as(LibGLib::Hook*))
      nil
    end

    def self.unref(hook_list : GLib::HookList, hook : GLib::Hook)
      LibGLib.hook_unref(hook_list.to_unsafe.as(LibGLib::HookList*), hook.to_unsafe.as(LibGLib::Hook*))
      nil
    end

    def data
      to_unsafe.as(LibGLib::Hook*).value.data
    end

    def data=(value : Void*)
      to_unsafe.as(LibGLib::Hook*).value.data = value
    end

    def next
      GLib::Hook.new(to_unsafe.as(LibGLib::Hook*).value._next)
    end

    def next=(value : GLib::Hook)
      to_unsafe.as(LibGLib::Hook*).value._next = value.to_unsafe.as(LibGLib::Hook*)
    end

    def prev
      GLib::Hook.new(to_unsafe.as(LibGLib::Hook*).value.prev)
    end

    def prev=(value : GLib::Hook)
      to_unsafe.as(LibGLib::Hook*).value.prev = value.to_unsafe.as(LibGLib::Hook*)
    end

    def ref_count
      to_unsafe.as(LibGLib::Hook*).value.ref_count
    end

    def ref_count=(value : UInt32)
      to_unsafe.as(LibGLib::Hook*).value.ref_count = UInt32.new(value)
    end

    def hook_id
      to_unsafe.as(LibGLib::Hook*).value.hook_id
    end

    def hook_id=(value : UInt64)
      to_unsafe.as(LibGLib::Hook*).value.hook_id = UInt64.new(value)
    end

    def flags
      to_unsafe.as(LibGLib::Hook*).value.flags
    end

    def flags=(value : UInt32)
      to_unsafe.as(LibGLib::Hook*).value.flags = UInt32.new(value)
    end

    def func
      to_unsafe.as(LibGLib::Hook*).value.func
    end

    def func=(value : Void*)
      to_unsafe.as(LibGLib::Hook*).value.func = value
    end
  end

  alias HookCheckFunc = LibGLib::HookCheckFunc
  alias HookCheckMarshaller = LibGLib::HookCheckMarshaller
  alias HookCompareFunc = LibGLib::HookCompareFunc
  alias HookFinalizeFunc = LibGLib::HookFinalizeFunc
  alias HookFindFunc = LibGLib::HookFindFunc

  @[Flags]
  enum HookFlagMask : UInt32
    ZERO_NONE =  0
    ACTIVE    =  1
    IN_CALL   =  2
    MASK      = 15
  end
  alias HookFunc = LibGLib::HookFunc

  class HookList
    include GObject::WrappedType

    def self.new(seq_id : UInt64? = nil, hook_size : UInt32? = nil, is_setup : UInt32? = nil, hooks : GLib::Hook? = nil, dummy3 : Void*? = nil, finalize_hook : GLib::HookFinalizeFunc? = nil, dummy : ::Enumerable(Void*)? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(56u64, 0u8).as(LibGLib::HookList*))
      __var0.seq_id = seq_id unless seq_id.nil?
      __var0.hook_size = hook_size unless hook_size.nil?
      __var0.is_setup = is_setup unless is_setup.nil?
      __var0.hooks = hooks unless hooks.nil?
      __var0.dummy3 = dummy3 unless dummy3.nil?
      __var0.finalize_hook = finalize_hook unless finalize_hook.nil?
      __var0.dummy = dummy unless dummy.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::HookList*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::HookList*)
    end

    def to_unsafe_hooklist
      @pointer.not_nil!.as(LibGLib::HookList*)
    end

    def clear
      LibGLib.hook_list_clear(@pointer.as(LibGLib::HookList*))
      nil
    end

    def init(hook_size : ::Int)
      LibGLib.hook_list_init(@pointer.as(LibGLib::HookList*), UInt32.new(hook_size))
      nil
    end

    def invoke(may_recurse : ::Bool)
      LibGLib.hook_list_invoke(@pointer.as(LibGLib::HookList*), LibC::Int.new(may_recurse ? 1 : 0))
      nil
    end

    def invoke_check(may_recurse : ::Bool)
      LibGLib.hook_list_invoke_check(@pointer.as(LibGLib::HookList*), LibC::Int.new(may_recurse ? 1 : 0))
      nil
    end

    def seq_id
      to_unsafe.as(LibGLib::HookList*).value.seq_id
    end

    def seq_id=(value : UInt64)
      to_unsafe.as(LibGLib::HookList*).value.seq_id = UInt64.new(value)
    end

    def hook_size
      to_unsafe.as(LibGLib::HookList*).value.hook_size
    end

    def hook_size=(value : UInt32)
      to_unsafe.as(LibGLib::HookList*).value.hook_size = UInt32.new(value)
    end

    def is_setup
      to_unsafe.as(LibGLib::HookList*).value.is_setup
    end

    def is_setup=(value : UInt32)
      to_unsafe.as(LibGLib::HookList*).value.is_setup = UInt32.new(value)
    end

    def hooks
      GLib::Hook.new(to_unsafe.as(LibGLib::HookList*).value.hooks)
    end

    def hooks=(value : GLib::Hook)
      to_unsafe.as(LibGLib::HookList*).value.hooks = value.to_unsafe.as(LibGLib::Hook*)
    end

    def dummy3
      to_unsafe.as(LibGLib::HookList*).value.dummy3
    end

    def dummy3=(value : Void*)
      to_unsafe.as(LibGLib::HookList*).value.dummy3 = value
    end

    def finalize_hook
      to_unsafe.as(LibGLib::HookList*).value.finalize_hook
    end

    def finalize_hook=(value : GLib::HookFinalizeFunc)
      to_unsafe.as(LibGLib::HookList*).value.finalize_hook = value
    end

    def dummy
      GObject::PointerIterator.new(to_unsafe.as(LibGLib::HookList*).value.dummy) { |__var0|
        __var0
      }
    end

    def dummy=(value : ::Enumerable(Void*))
      to_unsafe.as(LibGLib::HookList*).value.dummy = (__value_ary = value.map { |__item| __item }.to_a).to_unsafe
    end
  end

  alias HookMarshaller = LibGLib::HookMarshaller

  class IOChannel
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(136u64, 0u8).as(LibGLib::IOChannel*))
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::IOChannel*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::IOChannel*)
    end

    def to_unsafe_iochannel
      @pointer.not_nil!.as(LibGLib::IOChannel*)
    end

    def self.new_file(filename : ::String, mode : ::String) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.i_o_channel_new_file(filename.to_unsafe, mode.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_io_channel_new_file") if __var1.null?
      cast(GLib::IOChannel.new(__var1))
    end

    def self.unix_new(fd : ::Int) : self
      __var0 = LibGLib.i_o_channel_unix_new(Int32.new(fd))
      GObject.raise_unexpected_null("g_io_channel_unix_new") if __var0.null?
      cast(GLib::IOChannel.new(__var0))
    end

    def close
      LibGLib.i_o_channel_close(@pointer.as(LibGLib::IOChannel*))
      nil
    end

    def flush
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.i_o_channel_flush(@pointer.as(LibGLib::IOChannel*), pointerof(__var0))
      GLib::Error.assert(__var0)
      GLib::IOStatus.new(__var1)
    end

    def buffer_condition
      __var0 = LibGLib.i_o_channel_get_buffer_condition(@pointer.as(LibGLib::IOChannel*))
      GLib::IOCondition.new(__var0)
    end

    def buffer_size
      __var0 = LibGLib.i_o_channel_get_buffer_size(@pointer.as(LibGLib::IOChannel*))
      __var0
    end

    def buffered
      __var0 = LibGLib.i_o_channel_get_buffered(@pointer.as(LibGLib::IOChannel*))
      (__var0 == 1)
    end

    def close_on_unref
      __var0 = LibGLib.i_o_channel_get_close_on_unref(@pointer.as(LibGLib::IOChannel*))
      (__var0 == 1)
    end

    def encoding
      __var0 = LibGLib.i_o_channel_get_encoding(@pointer.as(LibGLib::IOChannel*))
      GObject.raise_unexpected_null("g_io_channel_get_encoding") if __var0.null?
      ::String.new(__var0)
    end

    def flags
      __var0 = LibGLib.i_o_channel_get_flags(@pointer.as(LibGLib::IOChannel*))
      GLib::IOFlags.new(__var0)
    end

    def line_term(length : ::Int)
      __var0 = LibGLib.i_o_channel_get_line_term(@pointer.as(LibGLib::IOChannel*), length)
      GObject.raise_unexpected_null("g_io_channel_get_line_term") if __var0.null?
      ::String.new(__var0)
    end

    def init
      LibGLib.i_o_channel_init(@pointer.as(LibGLib::IOChannel*))
      nil
    end

    def read(buf : ::String, count : ::Int, bytes_read : ::Int)
      __var0 = LibGLib.i_o_channel_read(@pointer.as(LibGLib::IOChannel*), buf.to_unsafe, UInt64.new(count), bytes_read)
      GLib::IOError.new(__var0)
    end

    def read_chars(buf : ::Bytes, count : ::Int)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.i_o_channel_read_chars(@pointer.as(LibGLib::IOChannel*), buf, UInt64.new(count), out bytes_read, pointerof(__var0))
      GLib::Error.assert(__var0)
      {GLib::IOStatus.new(__var1), bytes_read}
    end

    def read_line
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.i_o_channel_read_line(@pointer.as(LibGLib::IOChannel*), out str_return, out length, out terminator_pos, pointerof(__var0))
      GLib::Error.assert(__var0)
      {GLib::IOStatus.new(__var1), ::String.new(str_return), length, terminator_pos}
    end

    def read_line_string(buffer : GLib::String, terminator_pos : ::Int)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.i_o_channel_read_line_string(@pointer.as(LibGLib::IOChannel*), buffer.to_unsafe.as(LibGLib::String*), terminator_pos ? terminator_pos : Pointer(UInt64).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      GLib::IOStatus.new(__var1)
    end

    def read_to_end(str_return : ::Bytes)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.i_o_channel_read_to_end(@pointer.as(LibGLib::IOChannel*), str_return, out length, pointerof(__var0))
      GLib::Error.assert(__var0)
      {GLib::IOStatus.new(__var1), length}
    end

    def read_unichar
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.i_o_channel_read_unichar(@pointer.as(LibGLib::IOChannel*), out thechar, pointerof(__var0))
      GLib::Error.assert(__var0)
      {GLib::IOStatus.new(__var1), thechar}
    end

    def ref
      __var0 = LibGLib.i_o_channel_ref(@pointer.as(LibGLib::IOChannel*))
      GObject.raise_unexpected_null("g_io_channel_ref") if __var0.null?
      GLib::IOChannel.new(__var0)
    end

    def seek(offset : ::Int, type : GLib::SeekType)
      __var0 = LibGLib.i_o_channel_seek(@pointer.as(LibGLib::IOChannel*), Int64.new(offset), type)
      GLib::IOError.new(__var0)
    end

    def seek_position(offset : ::Int, type : GLib::SeekType)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.i_o_channel_seek_position(@pointer.as(LibGLib::IOChannel*), Int64.new(offset), type, pointerof(__var0))
      GLib::Error.assert(__var0)
      GLib::IOStatus.new(__var1)
    end

    def buffer_size=(size : ::Int)
      LibGLib.i_o_channel_set_buffer_size(@pointer.as(LibGLib::IOChannel*), UInt64.new(size))
      nil
    end

    def buffered=(buffered : ::Bool)
      LibGLib.i_o_channel_set_buffered(@pointer.as(LibGLib::IOChannel*), LibC::Int.new(buffered ? 1 : 0))
      nil
    end

    def close_on_unref=(do_close : ::Bool)
      LibGLib.i_o_channel_set_close_on_unref(@pointer.as(LibGLib::IOChannel*), LibC::Int.new(do_close ? 1 : 0))
      nil
    end

    def set_encoding(encoding : ::String?)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.i_o_channel_set_encoding(@pointer.as(LibGLib::IOChannel*), encoding ? encoding.to_unsafe : Pointer(UInt8).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      GLib::IOStatus.new(__var1)
    end

    def set_flags(flags : GLib::IOFlags)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.i_o_channel_set_flags(@pointer.as(LibGLib::IOChannel*), flags, pointerof(__var0))
      GLib::Error.assert(__var0)
      GLib::IOStatus.new(__var1)
    end

    def set_line_term(line_term : ::String?, length : ::Int)
      LibGLib.i_o_channel_set_line_term(@pointer.as(LibGLib::IOChannel*), line_term ? line_term.to_unsafe : Pointer(UInt8).null, Int32.new(length))
      nil
    end

    def shutdown(flush : ::Bool)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.i_o_channel_shutdown(@pointer.as(LibGLib::IOChannel*), LibC::Int.new(flush ? 1 : 0), pointerof(__var0))
      GLib::Error.assert(__var0)
      GLib::IOStatus.new(__var1)
    end

    def unix_get_fd
      __var0 = LibGLib.i_o_channel_unix_get_fd(@pointer.as(LibGLib::IOChannel*))
      __var0
    end

    def unref
      LibGLib.i_o_channel_unref(@pointer.as(LibGLib::IOChannel*))
      nil
    end

    def write(buf : ::String, count : ::Int, bytes_written : ::Int)
      __var0 = LibGLib.i_o_channel_write(@pointer.as(LibGLib::IOChannel*), buf.to_unsafe, UInt64.new(count), bytes_written)
      GLib::IOError.new(__var0)
    end

    def write_chars(buf : ::Bytes, count : ::Int)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.i_o_channel_write_chars(@pointer.as(LibGLib::IOChannel*), buf.to_unsafe, Int64.new(count), out bytes_written, pointerof(__var0))
      GLib::Error.assert(__var0)
      {GLib::IOStatus.new(__var1), bytes_written}
    end

    def write_unichar(thechar : UInt8)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.i_o_channel_write_unichar(@pointer.as(LibGLib::IOChannel*), UInt8.new(thechar), pointerof(__var0))
      GLib::Error.assert(__var0)
      GLib::IOStatus.new(__var1)
    end

    def self.error_from_errno(en : ::Int)
      __var0 = LibGLib.i_o_channel_error_from_errno(Int32.new(en))
      GLib::IOChannelError.new(__var0)
    end

    def self.error_quark
      __var0 = LibGLib.i_o_channel_error_quark
      __var0
    end

    def ref_count
      to_unsafe.as(LibGLib::IOChannel*).value.ref_count
    end

    def funcs
      GLib::IOFuncs.new(to_unsafe.as(LibGLib::IOChannel*).value.funcs)
    end

    def read_cd
      to_unsafe.as(LibGLib::IOChannel*).value.read_cd
    end

    def write_cd
      to_unsafe.as(LibGLib::IOChannel*).value.write_cd
    end

    def line_term_len
      to_unsafe.as(LibGLib::IOChannel*).value.line_term_len
    end

    def buf_size
      to_unsafe.as(LibGLib::IOChannel*).value.buf_size
    end

    def read_buf
      GLib::String.new(to_unsafe.as(LibGLib::IOChannel*).value.read_buf)
    end

    def encoded_read_buf
      GLib::String.new(to_unsafe.as(LibGLib::IOChannel*).value.encoded_read_buf)
    end

    def write_buf
      GLib::String.new(to_unsafe.as(LibGLib::IOChannel*).value.write_buf)
    end

    def partial_write_buf
      GObject::PointerIterator.new(to_unsafe.as(LibGLib::IOChannel*).value.partial_write_buf) { |__var0|
        __var0
      }
    end

    def use_buffer
      to_unsafe.as(LibGLib::IOChannel*).value.use_buffer
    end

    def do_encode
      to_unsafe.as(LibGLib::IOChannel*).value.do_encode
    end

    def is_readable
      to_unsafe.as(LibGLib::IOChannel*).value.is_readable
    end

    def is_writeable
      to_unsafe.as(LibGLib::IOChannel*).value.is_writeable
    end

    def is_seekable
      to_unsafe.as(LibGLib::IOChannel*).value.is_seekable
    end

    def reserved1
      to_unsafe.as(LibGLib::IOChannel*).value.reserved1
    end

    def reserved2
      to_unsafe.as(LibGLib::IOChannel*).value.reserved2
    end
  end

  enum IOChannelError : UInt32
    FBIG     = 0
    INVAL    = 1
    IO       = 2
    ISDIR    = 3
    NOSPC    = 4
    NXIO     = 5
    OVERFLOW = 6
    PIPE     = 7
    FAILED   = 8
  end

  @[Flags]
  enum IOCondition : UInt32
    ZERO_NONE =  0
    IN        =  1
    OUT       =  4
    PRI       =  2
    ERR       =  8
    HUP       = 16
    NVAL      = 32
  end

  enum IOError : UInt32
    NONE    = 0
    AGAIN   = 1
    INVAL   = 2
    UNKNOWN = 3
  end

  @[Flags]
  enum IOFlags : UInt32
    ZERO_NONE    =  0
    APPEND       =  1
    NONBLOCK     =  2
    IS_READABLE  =  4
    IS_WRITABLE  =  8
    IS_WRITEABLE =  8
    IS_SEEKABLE  = 16
    MASK         = 31
    GET_MASK     = 31
    SET_MASK     =  3
  end
  alias IOFunc = LibGLib::IOFunc

  class IOFuncs
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(64u64, 0u8).as(LibGLib::IOFuncs*))
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::IOFuncs*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::IOFuncs*)
    end

    def to_unsafe_iofuncs
      @pointer.not_nil!.as(LibGLib::IOFuncs*)
    end

    def io_read
      to_unsafe.as(LibGLib::IOFuncs*).value.io_read
    end

    def io_write
      to_unsafe.as(LibGLib::IOFuncs*).value.io_write
    end

    def io_seek
      to_unsafe.as(LibGLib::IOFuncs*).value.io_seek
    end

    def io_close
      to_unsafe.as(LibGLib::IOFuncs*).value.io_close
    end

    def io_create_watch
      to_unsafe.as(LibGLib::IOFuncs*).value.io_create_watch
    end

    def io_free
      to_unsafe.as(LibGLib::IOFuncs*).value.io_free
    end

    def io_set_flags
      to_unsafe.as(LibGLib::IOFuncs*).value.io_set_flags
    end

    def io_get_flags
      to_unsafe.as(LibGLib::IOFuncs*).value.io_get_flags
    end
  end

  enum IOStatus : UInt32
    ERROR  = 0
    NORMAL = 1
    EOF    = 2
    AGAIN  = 3
  end

  class KeyFile
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::KeyFile*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::KeyFile*)
    end

    def to_unsafe_keyfile
      @pointer.not_nil!.as(LibGLib::KeyFile*)
    end

    def self.new : self
      __var0 = LibGLib.key_file_new
      GObject.raise_unexpected_null("g_key_file_new") if __var0.null?
      cast(GLib::KeyFile.new(__var0))
    end

    def boolean(group_name : ::String, key : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_get_boolean(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def boolean_list(group_name : ::String, key : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_get_boolean_list(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, out length, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_key_file_get_boolean_list") if __var1.null?
      {GObject::PointerIterator.new(__var1) { |__var2|
        (__var2 == 1)
      }, length}
    end

    def comment(group_name : ::String?, key : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_get_comment(@pointer.as(LibGLib::KeyFile*), group_name ? group_name.to_unsafe : Pointer(UInt8).null, key.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_key_file_get_comment") if __var1.null?
      ::String.new(__var1)
    end

    def double(group_name : ::String, key : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_get_double(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      __var1
    end

    def double_list(group_name : ::String, key : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_get_double_list(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, out length, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_key_file_get_double_list") if __var1.null?
      {GObject::PointerIterator.new(__var1) { |__var2|
        __var2
      }, length}
    end

    def groups
      __var0 = LibGLib.key_file_get_groups(@pointer.as(LibGLib::KeyFile*), out length)
      GObject.raise_unexpected_null("g_key_file_get_groups") if __var0.null?
      {GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      }, length}
    end

    def int64(group_name : ::String, key : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_get_int64(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      __var1
    end

    def integer(group_name : ::String, key : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_get_integer(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      __var1
    end

    def integer_list(group_name : ::String, key : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_get_integer_list(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, out length, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_key_file_get_integer_list") if __var1.null?
      {GObject::PointerIterator.new(__var1) { |__var2|
        __var2
      }, length}
    end

    def keys(group_name : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_get_keys(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, out length, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_key_file_get_keys") if __var1.null?
      {GObject::PointerIterator.new(__var1) { |__var2|
        ::String.new(__var2)
      }, length}
    end

    def locale_for_key(group_name : ::String, key : ::String, locale : ::String?)
      __var0 = LibGLib.key_file_get_locale_for_key(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, locale ? locale.to_unsafe : Pointer(UInt8).null)
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def locale_string(group_name : ::String, key : ::String, locale : ::String?)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_get_locale_string(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, locale ? locale.to_unsafe : Pointer(UInt8).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_key_file_get_locale_string") if __var1.null?
      ::String.new(__var1)
    end

    def locale_string_list(group_name : ::String, key : ::String, locale : ::String?)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_get_locale_string_list(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, locale ? locale.to_unsafe : Pointer(UInt8).null, out length, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_key_file_get_locale_string_list") if __var1.null?
      {GObject::PointerIterator.new(__var1) { |__var2|
        ::String.new(__var2)
      }, length}
    end

    def start_group
      __var0 = LibGLib.key_file_get_start_group(@pointer.as(LibGLib::KeyFile*))
      GObject.raise_unexpected_null("g_key_file_get_start_group") if __var0.null?
      ::String.new(__var0)
    end

    def string(group_name : ::String, key : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_get_string(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_key_file_get_string") if __var1.null?
      ::String.new(__var1)
    end

    def string_list(group_name : ::String, key : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_get_string_list(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, out length, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_key_file_get_string_list") if __var1.null?
      {GObject::PointerIterator.new(__var1) { |__var2|
        ::String.new(__var2)
      }, length}
    end

    def uint64(group_name : ::String, key : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_get_uint64(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      __var1
    end

    def value(group_name : ::String, key : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_get_value(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_key_file_get_value") if __var1.null?
      ::String.new(__var1)
    end

    def has_group(group_name : ::String)
      __var0 = LibGLib.key_file_has_group(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe)
      (__var0 == 1)
    end

    def load_from_bytes(bytes : GLib::Bytes, flags : GLib::KeyFileFlags)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_load_from_bytes(@pointer.as(LibGLib::KeyFile*), bytes.to_unsafe.as(LibGLib::Bytes*), flags, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def load_from_data(data : ::String, length : ::Int, flags : GLib::KeyFileFlags)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_load_from_data(@pointer.as(LibGLib::KeyFile*), data.to_unsafe, UInt64.new(length), flags, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def load_from_data_dirs(file : ::String, flags : GLib::KeyFileFlags)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_load_from_data_dirs(@pointer.as(LibGLib::KeyFile*), file.to_unsafe, out full_path, flags, pointerof(__var0))
      GLib::Error.assert(__var0)
      {(__var1 == 1), ::String.new(full_path)}
    end

    def load_from_dirs(file : ::String, search_dirs : ::Enumerable, flags : GLib::KeyFileFlags)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_load_from_dirs(@pointer.as(LibGLib::KeyFile*), file.to_unsafe, (__search_dirs_ary = search_dirs.map { |__item| __item.to_unsafe }.to_a).to_unsafe, out full_path, flags, pointerof(__var0))
      GLib::Error.assert(__var0)
      {(__var1 == 1), ::String.new(full_path)}
    end

    def load_from_file(file : ::String, flags : GLib::KeyFileFlags)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_load_from_file(@pointer.as(LibGLib::KeyFile*), file.to_unsafe, flags, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def remove_comment(group_name : ::String?, key : ::String?)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_remove_comment(@pointer.as(LibGLib::KeyFile*), group_name ? group_name.to_unsafe : Pointer(UInt8).null, key ? key.to_unsafe : Pointer(UInt8).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def remove_group(group_name : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_remove_group(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def remove_key(group_name : ::String, key : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_remove_key(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def save_to_file(filename : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_save_to_file(@pointer.as(LibGLib::KeyFile*), filename.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def set_boolean(group_name : ::String, key : ::String, value : ::Bool)
      LibGLib.key_file_set_boolean(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, LibC::Int.new(value ? 1 : 0))
      nil
    end

    def set_boolean_list(group_name : ::String, key : ::String, list : ::Enumerable)
      length = list.size
      LibGLib.key_file_set_boolean_list(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, (__list_ary = list.map { |__item| LibC::Int.new(__item ? 1 : 0) }.to_a).to_unsafe, UInt64.new(length))
      nil
    end

    def set_comment(group_name : ::String?, key : ::String?, comment : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_set_comment(@pointer.as(LibGLib::KeyFile*), group_name ? group_name.to_unsafe : Pointer(UInt8).null, key ? key.to_unsafe : Pointer(UInt8).null, comment.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def set_double(group_name : ::String, key : ::String, value : ::Float)
      LibGLib.key_file_set_double(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, Float64.new(value))
      nil
    end

    def set_double_list(group_name : ::String, key : ::String, list : ::Enumerable)
      length = list.size
      LibGLib.key_file_set_double_list(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, (__list_ary = list.map { |__item| Float64.new(__item) }.to_a).to_unsafe, UInt64.new(length))
      nil
    end

    def set_int64(group_name : ::String, key : ::String, value : ::Int)
      LibGLib.key_file_set_int64(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, Int64.new(value))
      nil
    end

    def set_integer(group_name : ::String, key : ::String, value : ::Int)
      LibGLib.key_file_set_integer(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, Int32.new(value))
      nil
    end

    def set_integer_list(group_name : ::String, key : ::String, list : ::Enumerable)
      length = list.size
      LibGLib.key_file_set_integer_list(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, (__list_ary = list.map { |__item| Int32.new(__item) }.to_a).to_unsafe, UInt64.new(length))
      nil
    end

    def list_separator=(separator : ::Int)
      LibGLib.key_file_set_list_separator(@pointer.as(LibGLib::KeyFile*), Int8.new(separator))
      nil
    end

    def set_locale_string(group_name : ::String, key : ::String, locale : ::String, string : ::String)
      LibGLib.key_file_set_locale_string(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, locale.to_unsafe, string.to_unsafe)
      nil
    end

    def set_locale_string_list(group_name : ::String, key : ::String, locale : ::String, list : ::Enumerable)
      length = list.size
      LibGLib.key_file_set_locale_string_list(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, locale.to_unsafe, (__list_ary = list.map { |__item| __item.to_unsafe }.to_a).to_unsafe, UInt64.new(length))
      nil
    end

    def set_string(group_name : ::String, key : ::String, string : ::String)
      LibGLib.key_file_set_string(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, string.to_unsafe)
      nil
    end

    def set_string_list(group_name : ::String, key : ::String, list : ::Enumerable)
      length = list.size
      LibGLib.key_file_set_string_list(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, (__list_ary = list.map { |__item| __item.to_unsafe }.to_a).to_unsafe, UInt64.new(length))
      nil
    end

    def set_uint64(group_name : ::String, key : ::String, value : ::Int)
      LibGLib.key_file_set_uint64(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, UInt64.new(value))
      nil
    end

    def set_value(group_name : ::String, key : ::String, value : ::String)
      LibGLib.key_file_set_value(@pointer.as(LibGLib::KeyFile*), group_name.to_unsafe, key.to_unsafe, value.to_unsafe)
      nil
    end

    def to_data
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.key_file_to_data(@pointer.as(LibGLib::KeyFile*), out length, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_key_file_to_data") if __var1.null?
      {::String.new(__var1), length}
    end

    def unref
      LibGLib.key_file_unref(@pointer.as(LibGLib::KeyFile*))
      nil
    end

    def self.error_quark
      __var0 = LibGLib.key_file_error_quark
      __var0
    end
  end

  enum KeyFileError : UInt32
    UNKNOWN_ENCODING = 0
    PARSE            = 1
    NOT_FOUND        = 2
    KEY_NOT_FOUND    = 3
    GROUP_NOT_FOUND  = 4
    INVALID_VALUE    = 5
  end

  @[Flags]
  enum KeyFileFlags : UInt32
    NONE              = 0
    KEEP_COMMENTS     = 1
    KEEP_TRANSLATIONS = 2
  end

  class List
    include GObject::WrappedType

    def self.new(data : Void*? = nil, next _next : Void*? = nil, prev : Void*? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGLib::List*))
      __var0.data = data unless data.nil?
      __var0.next = _next unless _next.nil?
      __var0.prev = prev unless prev.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::List*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::List*)
    end

    def to_unsafe_list
      @pointer.not_nil!.as(LibGLib::List*)
    end

    def data
      to_unsafe.as(LibGLib::List*).value.data
    end

    def data=(value : Void*)
      to_unsafe.as(LibGLib::List*).value.data = value
    end

    def next
      GLib::ListIterator(Void*, Pointer(Void)*).new(GLib::List.new(to_unsafe.as(LibGLib::List*).value._next.as(LibGLib::List*)))
    end

    def next=(value : Void*)
      to_unsafe.as(LibGLib::List*).value._next = value
    end

    def prev
      GLib::ListIterator(Void*, Pointer(Void)*).new(GLib::List.new(to_unsafe.as(LibGLib::List*).value.prev.as(LibGLib::List*)))
    end

    def prev=(value : Void*)
      to_unsafe.as(LibGLib::List*).value.prev = value
    end
  end

  class LogField
    include GObject::WrappedType

    def self.new(key : ::String? = nil, value : Void*? = nil, length : Int64? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGLib::LogField*))
      __var0.key = key unless key.nil?
      __var0.value = value unless value.nil?
      __var0.length = length unless length.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::LogField*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::LogField*)
    end

    def to_unsafe_logfield
      @pointer.not_nil!.as(LibGLib::LogField*)
    end

    def key
      ::String.new(to_unsafe.as(LibGLib::LogField*).value.key)
    end

    def key=(value : ::String)
      to_unsafe.as(LibGLib::LogField*).value.key = value.to_unsafe
    end

    def value
      to_unsafe.as(LibGLib::LogField*).value.value
    end

    def value=(value : Void*)
      to_unsafe.as(LibGLib::LogField*).value.value = value
    end

    def length
      to_unsafe.as(LibGLib::LogField*).value.length
    end

    def length=(value : Int64)
      to_unsafe.as(LibGLib::LogField*).value.length = Int64.new(value)
    end
  end

  alias LogFunc = LibGLib::LogFunc

  @[Flags]
  enum LogLevelFlags : Int32
    ZERO_NONE      =   0
    FLAG_RECURSION =   1
    FLAG_FATAL     =   2
    LEVEL_ERROR    =   4
    LEVEL_CRITICAL =   8
    LEVEL_WARNING  =  16
    LEVEL_MESSAGE  =  32
    LEVEL_INFO     =  64
    LEVEL_DEBUG    = 128
    LEVEL_MASK     =  -4
  end
  alias LogWriterFunc = LibGLib::LogWriterFunc

  enum LogWriterOutput : UInt32
    HANDLED   = 1
    UNHANDLED = 0
  end

  class MainContext
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::MainContext*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::MainContext*)
    end

    def to_unsafe_maincontext
      @pointer.not_nil!.as(LibGLib::MainContext*)
    end

    def self.new : self
      __var0 = LibGLib.main_context_new
      GObject.raise_unexpected_null("g_main_context_new") if __var0.null?
      cast(GLib::MainContext.new(__var0))
    end

    def acquire
      __var0 = LibGLib.main_context_acquire(@pointer.as(LibGLib::MainContext*))
      (__var0 == 1)
    end

    def add_poll(fd : GLib::PollFD, priority : ::Int)
      LibGLib.main_context_add_poll(@pointer.as(LibGLib::MainContext*), fd.to_unsafe.as(LibGLib::PollFD*), Int32.new(priority))
      nil
    end

    def check(max_priority : ::Int, fds : ::Enumerable)
      n_fds = fds.size
      __fds = (__fds_ary = fds.map { |__item| __item }.to_a).to_unsafe
      n_fds = __fds_ary.size
      __var0 = LibGLib.main_context_check(@pointer.as(LibGLib::MainContext*), Int32.new(max_priority), __fds, Int32.new(n_fds))
      (__var0 == 1)
    end

    def dispatch
      LibGLib.main_context_dispatch(@pointer.as(LibGLib::MainContext*))
      nil
    end

    def find_source_by_funcs_user_data(funcs : GLib::SourceFuncs, user_data : Void*?)
      __var0 = LibGLib.main_context_find_source_by_funcs_user_data(@pointer.as(LibGLib::MainContext*), funcs.to_unsafe.as(LibGLib::SourceFuncs*), user_data ? user_data : Pointer(Void).null)
      GObject.raise_unexpected_null("g_main_context_find_source_by_funcs_user_data") if __var0.null?
      GLib::Source.new(__var0)
    end

    def find_source_by_id(source_id : ::Int)
      __var0 = LibGLib.main_context_find_source_by_id(@pointer.as(LibGLib::MainContext*), UInt32.new(source_id))
      GObject.raise_unexpected_null("g_main_context_find_source_by_id") if __var0.null?
      GLib::Source.new(__var0)
    end

    def find_source_by_user_data(user_data : Void*?)
      __var0 = LibGLib.main_context_find_source_by_user_data(@pointer.as(LibGLib::MainContext*), user_data ? user_data : Pointer(Void).null)
      GObject.raise_unexpected_null("g_main_context_find_source_by_user_data") if __var0.null?
      GLib::Source.new(__var0)
    end

    def invoke_full(priority : ::Int, function : GLib::SourceFunc, data : Void*?, notify : GLib::DestroyNotify?)
      LibGLib.main_context_invoke_full(@pointer.as(LibGLib::MainContext*), Int32.new(priority), function, data ? data : Pointer(Void).null, notify ? notify : nil)
      nil
    end

    def owner?
      __var0 = LibGLib.main_context_is_owner(@pointer.as(LibGLib::MainContext*))
      (__var0 == 1)
    end

    def iteration(may_block : ::Bool)
      __var0 = LibGLib.main_context_iteration(@pointer.as(LibGLib::MainContext*), LibC::Int.new(may_block ? 1 : 0))
      (__var0 == 1)
    end

    def pending
      __var0 = LibGLib.main_context_pending(@pointer.as(LibGLib::MainContext*))
      (__var0 == 1)
    end

    def pop_thread_default
      LibGLib.main_context_pop_thread_default(@pointer.as(LibGLib::MainContext*))
      nil
    end

    def prepare
      __var0 = LibGLib.main_context_prepare(@pointer.as(LibGLib::MainContext*), out priority)
      {(__var0 == 1), priority}
    end

    def push_thread_default
      LibGLib.main_context_push_thread_default(@pointer.as(LibGLib::MainContext*))
      nil
    end

    def query(max_priority : ::Int, fds : ::Enumerable, n_fds : ::Int)
      __var0 = LibGLib.main_context_query(@pointer.as(LibGLib::MainContext*), Int32.new(max_priority), out timeout_, fds, Int32.new(n_fds))
      {__var0, timeout_}
    end

    def ref
      __var0 = LibGLib.main_context_ref(@pointer.as(LibGLib::MainContext*))
      GObject.raise_unexpected_null("g_main_context_ref") if __var0.null?
      GLib::MainContext.new(__var0)
    end

    def release
      LibGLib.main_context_release(@pointer.as(LibGLib::MainContext*))
      nil
    end

    def remove_poll(fd : GLib::PollFD)
      LibGLib.main_context_remove_poll(@pointer.as(LibGLib::MainContext*), fd.to_unsafe.as(LibGLib::PollFD*))
      nil
    end

    def unref
      LibGLib.main_context_unref(@pointer.as(LibGLib::MainContext*))
      nil
    end

    def wait(cond : GLib::Cond, mutex : GLib::Mutex::Union)
      __var0 = LibGLib.main_context_wait(@pointer.as(LibGLib::MainContext*), cond.to_unsafe.as(LibGLib::Cond*), mutex.to_unsafe.as(LibGLib::Mutex*))
      (__var0 == 1)
    end

    def wakeup
      LibGLib.main_context_wakeup(@pointer.as(LibGLib::MainContext*))
      nil
    end

    def self.default
      __var0 = LibGLib.main_context_default
      GObject.raise_unexpected_null("g_main_context_default") if __var0.null?
      GLib::MainContext.new(__var0)
    end

    def self.thread_default
      __var0 = LibGLib.main_context_get_thread_default
      GObject.raise_unexpected_null("g_main_context_get_thread_default") if __var0.null?
      GLib::MainContext.new(__var0)
    end

    def self.ref_thread_default
      __var0 = LibGLib.main_context_ref_thread_default
      GObject.raise_unexpected_null("g_main_context_ref_thread_default") if __var0.null?
      GLib::MainContext.new(__var0)
    end
  end

  class MainLoop
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::MainLoop*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::MainLoop*)
    end

    def to_unsafe_mainloop
      @pointer.not_nil!.as(LibGLib::MainLoop*)
    end

    def self.new(context : GLib::MainContext?, is_running : ::Bool) : self
      __var0 = LibGLib.main_loop_new(context ? context.to_unsafe.as(LibGLib::MainContext*) : Pointer(LibGLib::MainContext).null, LibC::Int.new(is_running ? 1 : 0))
      GObject.raise_unexpected_null("g_main_loop_new") if __var0.null?
      cast(GLib::MainLoop.new(__var0))
    end

    def context
      __var0 = LibGLib.main_loop_get_context(@pointer.as(LibGLib::MainLoop*))
      GObject.raise_unexpected_null("g_main_loop_get_context") if __var0.null?
      GLib::MainContext.new(__var0)
    end

    def running?
      __var0 = LibGLib.main_loop_is_running(@pointer.as(LibGLib::MainLoop*))
      (__var0 == 1)
    end

    def quit
      LibGLib.main_loop_quit(@pointer.as(LibGLib::MainLoop*))
      nil
    end

    def ref
      __var0 = LibGLib.main_loop_ref(@pointer.as(LibGLib::MainLoop*))
      GObject.raise_unexpected_null("g_main_loop_ref") if __var0.null?
      GLib::MainLoop.new(__var0)
    end

    def run
      LibGLib.main_loop_run(@pointer.as(LibGLib::MainLoop*))
      nil
    end

    def unref
      LibGLib.main_loop_unref(@pointer.as(LibGLib::MainLoop*))
      nil
    end
  end

  class MappedFile
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::MappedFile*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::MappedFile*)
    end

    def to_unsafe_mappedfile
      @pointer.not_nil!.as(LibGLib::MappedFile*)
    end

    def self.new(filename : ::String, writable : ::Bool) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.mapped_file_new(filename.to_unsafe, LibC::Int.new(writable ? 1 : 0), pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_mapped_file_new") if __var1.null?
      cast(GLib::MappedFile.new(__var1))
    end

    def self.new_from_fd(fd : ::Int, writable : ::Bool) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.mapped_file_new_from_fd(Int32.new(fd), LibC::Int.new(writable ? 1 : 0), pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_mapped_file_new_from_fd") if __var1.null?
      cast(GLib::MappedFile.new(__var1))
    end

    def free
      LibGLib.mapped_file_free(@pointer.as(LibGLib::MappedFile*))
      nil
    end

    def bytes
      __var0 = LibGLib.mapped_file_get_bytes(@pointer.as(LibGLib::MappedFile*))
      GObject.raise_unexpected_null("g_mapped_file_get_bytes") if __var0.null?
      GLib::Bytes.new(__var0)
    end

    def contents
      __var0 = LibGLib.mapped_file_get_contents(@pointer.as(LibGLib::MappedFile*))
      GObject.raise_unexpected_null("g_mapped_file_get_contents") if __var0.null?
      ::String.new(__var0)
    end

    def length
      __var0 = LibGLib.mapped_file_get_length(@pointer.as(LibGLib::MappedFile*))
      __var0
    end

    def ref
      __var0 = LibGLib.mapped_file_ref(@pointer.as(LibGLib::MappedFile*))
      GObject.raise_unexpected_null("g_mapped_file_ref") if __var0.null?
      GLib::MappedFile.new(__var0)
    end

    def unref
      LibGLib.mapped_file_unref(@pointer.as(LibGLib::MappedFile*))
      nil
    end
  end

  @[Flags]
  enum MarkupCollectType : UInt32
    INVALID  =     0
    STRING   =     1
    STRDUP   =     2
    BOOLEAN  =     3
    TRISTATE =     4
    OPTIONAL = 65536
  end

  enum MarkupError : UInt32
    BAD_UTF8          = 0
    EMPTY             = 1
    PARSE             = 2
    UNKNOWN_ELEMENT   = 3
    UNKNOWN_ATTRIBUTE = 4
    INVALID_CONTENT   = 5
    MISSING_ATTRIBUTE = 6
  end

  class MarkupParseContext
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::MarkupParseContext*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::MarkupParseContext*)
    end

    def to_unsafe_markupparsecontext
      @pointer.not_nil!.as(LibGLib::MarkupParseContext*)
    end

    def self.new(parser : GLib::MarkupParser, flags : GLib::MarkupParseFlags, user_data : Void*?, user_data_dnotify : GLib::DestroyNotify) : self
      __var0 = LibGLib.markup_parse_context_new(parser.to_unsafe.as(LibGLib::MarkupParser*), flags, user_data ? user_data : Pointer(Void).null, user_data_dnotify)
      GObject.raise_unexpected_null("g_markup_parse_context_new") if __var0.null?
      cast(GLib::MarkupParseContext.new(__var0))
    end

    def end_parse
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.markup_parse_context_end_parse(@pointer.as(LibGLib::MarkupParseContext*), pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def free
      LibGLib.markup_parse_context_free(@pointer.as(LibGLib::MarkupParseContext*))
      nil
    end

    def element
      __var0 = LibGLib.markup_parse_context_get_element(@pointer.as(LibGLib::MarkupParseContext*))
      GObject.raise_unexpected_null("g_markup_parse_context_get_element") if __var0.null?
      ::String.new(__var0)
    end

    def position
      LibGLib.markup_parse_context_get_position(@pointer.as(LibGLib::MarkupParseContext*), out line_number, out char_number)
      {line_number, char_number}
    end

    def user_data
      LibGLib.markup_parse_context_get_user_data(@pointer.as(LibGLib::MarkupParseContext*))
      nil
    end

    def parse(text : ::String, text_len : ::Int)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.markup_parse_context_parse(@pointer.as(LibGLib::MarkupParseContext*), text.to_unsafe, Int64.new(text_len), pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def pop
      LibGLib.markup_parse_context_pop(@pointer.as(LibGLib::MarkupParseContext*))
      nil
    end

    def push(parser : GLib::MarkupParser, user_data : Void*?)
      LibGLib.markup_parse_context_push(@pointer.as(LibGLib::MarkupParseContext*), parser.to_unsafe.as(LibGLib::MarkupParser*), user_data ? user_data : Pointer(Void).null)
      nil
    end

    def ref
      __var0 = LibGLib.markup_parse_context_ref(@pointer.as(LibGLib::MarkupParseContext*))
      GObject.raise_unexpected_null("g_markup_parse_context_ref") if __var0.null?
      GLib::MarkupParseContext.new(__var0)
    end

    def unref
      LibGLib.markup_parse_context_unref(@pointer.as(LibGLib::MarkupParseContext*))
      nil
    end
  end

  @[Flags]
  enum MarkupParseFlags : UInt32
    ZERO_NONE                        = 0
    DO_NOT_USE_THIS_UNSUPPORTED_FLAG = 1
    TREAT_CDATA_AS_TEXT              = 2
    PREFIX_ERROR_POSITION            = 4
    IGNORE_QUALIFIED                 = 8
  end

  class MarkupParser
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(40u64, 0u8).as(LibGLib::MarkupParser*))
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::MarkupParser*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::MarkupParser*)
    end

    def to_unsafe_markupparser
      @pointer.not_nil!.as(LibGLib::MarkupParser*)
    end

    def start_element
      to_unsafe.as(LibGLib::MarkupParser*).value.start_element
    end

    def end_element
      to_unsafe.as(LibGLib::MarkupParser*).value.end_element
    end

    def text
      to_unsafe.as(LibGLib::MarkupParser*).value.text
    end

    def passthrough
      to_unsafe.as(LibGLib::MarkupParser*).value.passthrough
    end

    def error
      to_unsafe.as(LibGLib::MarkupParser*).value.error
    end
  end

  class MatchInfo
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::MatchInfo*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::MatchInfo*)
    end

    def to_unsafe_matchinfo
      @pointer.not_nil!.as(LibGLib::MatchInfo*)
    end

    def expand_references(string_to_expand : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.match_info_expand_references(@pointer.as(LibGLib::MatchInfo*), string_to_expand.to_unsafe, pointerof(__var0))
      GLib::Error.assert(__var0)
      __var2 = ::String.new(__var1) if __var1
      __var2
    end

    def fetch(match_num : ::Int)
      __var0 = LibGLib.match_info_fetch(@pointer.as(LibGLib::MatchInfo*), Int32.new(match_num))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def fetch_all
      __var0 = LibGLib.match_info_fetch_all(@pointer.as(LibGLib::MatchInfo*))
      GObject.raise_unexpected_null("g_match_info_fetch_all") if __var0.null?
      GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      }
    end

    def fetch_named(name : ::String)
      __var0 = LibGLib.match_info_fetch_named(@pointer.as(LibGLib::MatchInfo*), name.to_unsafe)
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def fetch_named_pos(name : ::String)
      __var0 = LibGLib.match_info_fetch_named_pos(@pointer.as(LibGLib::MatchInfo*), name.to_unsafe, out start_pos, out end_pos)
      {(__var0 == 1), start_pos, end_pos}
    end

    def fetch_pos(match_num : ::Int)
      __var0 = LibGLib.match_info_fetch_pos(@pointer.as(LibGLib::MatchInfo*), Int32.new(match_num), out start_pos, out end_pos)
      {(__var0 == 1), start_pos, end_pos}
    end

    def free
      LibGLib.match_info_free(@pointer.as(LibGLib::MatchInfo*))
      nil
    end

    def match_count
      __var0 = LibGLib.match_info_get_match_count(@pointer.as(LibGLib::MatchInfo*))
      __var0
    end

    def regex
      __var0 = LibGLib.match_info_get_regex(@pointer.as(LibGLib::MatchInfo*))
      GObject.raise_unexpected_null("g_match_info_get_regex") if __var0.null?
      GLib::Regex.new(__var0)
    end

    def string
      __var0 = LibGLib.match_info_get_string(@pointer.as(LibGLib::MatchInfo*))
      GObject.raise_unexpected_null("g_match_info_get_string") if __var0.null?
      ::String.new(__var0)
    end

    def partial_match?
      __var0 = LibGLib.match_info_is_partial_match(@pointer.as(LibGLib::MatchInfo*))
      (__var0 == 1)
    end

    def matches
      __var0 = LibGLib.match_info_matches(@pointer.as(LibGLib::MatchInfo*))
      (__var0 == 1)
    end

    def next
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.match_info_next(@pointer.as(LibGLib::MatchInfo*), pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def ref
      __var0 = LibGLib.match_info_ref(@pointer.as(LibGLib::MatchInfo*))
      GObject.raise_unexpected_null("g_match_info_ref") if __var0.null?
      GLib::MatchInfo.new(__var0)
    end

    def unref
      LibGLib.match_info_unref(@pointer.as(LibGLib::MatchInfo*))
      nil
    end
  end

  class MemVTable
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(48u64, 0u8).as(LibGLib::MemVTable*))
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::MemVTable*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::MemVTable*)
    end

    def to_unsafe_memvtable
      @pointer.not_nil!.as(LibGLib::MemVTable*)
    end

    def malloc
      to_unsafe.as(LibGLib::MemVTable*).value.malloc
    end

    def realloc
      to_unsafe.as(LibGLib::MemVTable*).value.realloc
    end

    def free
      to_unsafe.as(LibGLib::MemVTable*).value.free
    end

    def calloc
      to_unsafe.as(LibGLib::MemVTable*).value.calloc
    end

    def try_malloc
      to_unsafe.as(LibGLib::MemVTable*).value.try_malloc
    end

    def try_realloc
      to_unsafe.as(LibGLib::MemVTable*).value.try_realloc
    end
  end

  class Mutex
    include GObject::WrappedType
    alias Union = Mutex | Void* | ::Enumerable(UInt32)

    def p
      to_unsafe.as(LibGLib::Mutex*).value.p
    end

    def i
      GObject::PointerIterator.new(to_unsafe.as(LibGLib::Mutex*).value.i) { |__var0|
        __var0
      }
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::Mutex*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Mutex*)
    end

    def to_unsafe_mutex
      @pointer.not_nil!.as(LibGLib::Mutex*)
    end

    def clear
      LibGLib.mutex_clear(@pointer.as(LibGLib::Mutex*))
      nil
    end

    def init
      LibGLib.mutex_init(@pointer.as(LibGLib::Mutex*))
      nil
    end

    def lock
      LibGLib.mutex_lock(@pointer.as(LibGLib::Mutex*))
      nil
    end

    def trylock
      __var0 = LibGLib.mutex_trylock(@pointer.as(LibGLib::Mutex*))
      (__var0 == 1)
    end

    def unlock
      LibGLib.mutex_unlock(@pointer.as(LibGLib::Mutex*))
      nil
    end
  end

  class Node
    include GObject::WrappedType

    def self.new(data : Void*? = nil, next _next : GLib::Node? = nil, prev : GLib::Node? = nil, parent : GLib::Node? = nil, children : GLib::Node? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(40u64, 0u8).as(LibGLib::Node*))
      __var0.data = data unless data.nil?
      __var0.next = _next unless _next.nil?
      __var0.prev = prev unless prev.nil?
      __var0.parent = parent unless parent.nil?
      __var0.children = children unless children.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::Node*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Node*)
    end

    def to_unsafe_node
      @pointer.not_nil!.as(LibGLib::Node*)
    end

    def child_index(data : Void*?)
      __var0 = LibGLib.node_child_index(@pointer.as(LibGLib::Node*), data ? data : Pointer(Void).null)
      __var0
    end

    def child_position(child : GLib::Node)
      __var0 = LibGLib.node_child_position(@pointer.as(LibGLib::Node*), child.to_unsafe.as(LibGLib::Node*))
      __var0
    end

    def depth
      __var0 = LibGLib.node_depth(@pointer.as(LibGLib::Node*))
      __var0
    end

    def destroy
      LibGLib.node_destroy(@pointer.as(LibGLib::Node*))
      nil
    end

    def ancestor?(descendant : GLib::Node)
      __var0 = LibGLib.node_is_ancestor(@pointer.as(LibGLib::Node*), descendant.to_unsafe.as(LibGLib::Node*))
      (__var0 == 1)
    end

    def max_height
      __var0 = LibGLib.node_max_height(@pointer.as(LibGLib::Node*))
      __var0
    end

    def n_children
      __var0 = LibGLib.node_n_children(@pointer.as(LibGLib::Node*))
      __var0
    end

    def n_nodes(flags : GLib::TraverseFlags)
      __var0 = LibGLib.node_n_nodes(@pointer.as(LibGLib::Node*), flags)
      __var0
    end

    def reverse_children
      LibGLib.node_reverse_children(@pointer.as(LibGLib::Node*))
      nil
    end

    def unlink
      LibGLib.node_unlink(@pointer.as(LibGLib::Node*))
      nil
    end

    def data
      to_unsafe.as(LibGLib::Node*).value.data
    end

    def data=(value : Void*)
      to_unsafe.as(LibGLib::Node*).value.data = value
    end

    def next
      GLib::Node.new(to_unsafe.as(LibGLib::Node*).value._next)
    end

    def next=(value : GLib::Node)
      to_unsafe.as(LibGLib::Node*).value._next = value.to_unsafe.as(LibGLib::Node*)
    end

    def prev
      GLib::Node.new(to_unsafe.as(LibGLib::Node*).value.prev)
    end

    def prev=(value : GLib::Node)
      to_unsafe.as(LibGLib::Node*).value.prev = value.to_unsafe.as(LibGLib::Node*)
    end

    def parent
      GLib::Node.new(to_unsafe.as(LibGLib::Node*).value.parent)
    end

    def parent=(value : GLib::Node)
      to_unsafe.as(LibGLib::Node*).value.parent = value.to_unsafe.as(LibGLib::Node*)
    end

    def children
      GLib::Node.new(to_unsafe.as(LibGLib::Node*).value.children)
    end

    def children=(value : GLib::Node)
      to_unsafe.as(LibGLib::Node*).value.children = value.to_unsafe.as(LibGLib::Node*)
    end
  end

  alias NodeForeachFunc = LibGLib::NodeForeachFunc
  alias NodeTraverseFunc = LibGLib::NodeTraverseFunc

  enum NormalizeMode : UInt32
    DEFAULT         = 0
    NFD             = 0
    DEFAULT_COMPOSE = 1
    NFC             = 1
    ALL             = 2
    NFKD            = 2
    ALL_COMPOSE     = 3
    NFKC            = 3
  end

  enum NumberParserError : UInt32
    INVALID       = 0
    OUT_OF_BOUNDS = 1
  end

  class Once
    include GObject::WrappedType

    def self.new(status : GLib::OnceStatus? = nil, retval : Void*? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibGLib::Once*))
      __var0.status = status unless status.nil?
      __var0.retval = retval unless retval.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::Once*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Once*)
    end

    def to_unsafe_once
      @pointer.not_nil!.as(LibGLib::Once*)
    end

    def self.init_enter(location : Void*)
      __var0 = LibGLib.once_init_enter(location)
      (__var0 == 1)
    end

    def self.init_leave(location : Void*, result : ::Int)
      LibGLib.once_init_leave(location, UInt64.new(result))
      nil
    end

    def status
      GLib::OnceStatus.new(to_unsafe.as(LibGLib::Once*).value.status)
    end

    def status=(value : GLib::OnceStatus)
      to_unsafe.as(LibGLib::Once*).value.status = value
    end

    def retval
      to_unsafe.as(LibGLib::Once*).value.retval
    end

    def retval=(value : Void*)
      to_unsafe.as(LibGLib::Once*).value.retval = value
    end
  end

  enum OnceStatus : UInt32
    NOTCALLED = 0
    PROGRESS  = 1
    READY     = 2
  end

  enum OptionArg : UInt32
    NONE           = 0
    STRING         = 1
    INT            = 2
    CALLBACK       = 3
    FILENAME       = 4
    STRING_ARRAY   = 5
    FILENAME_ARRAY = 6
    DOUBLE         = 7
    INT64          = 8
  end
  alias OptionArgFunc = LibGLib::OptionArgFunc

  class OptionContext
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::OptionContext*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::OptionContext*)
    end

    def to_unsafe_optioncontext
      @pointer.not_nil!.as(LibGLib::OptionContext*)
    end

    def add_group(group : GLib::OptionGroup)
      LibGLib.option_context_add_group(@pointer.as(LibGLib::OptionContext*), group.to_unsafe.as(LibGLib::OptionGroup*))
      nil
    end

    def add_main_entries(entries : ::Enumerable, translation_domain : ::String?)
      LibGLib.option_context_add_main_entries(@pointer.as(LibGLib::OptionContext*), (__entries_ary = entries.map { |__item| __item }.to_a).to_unsafe, translation_domain ? translation_domain.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def free
      LibGLib.option_context_free(@pointer.as(LibGLib::OptionContext*))
      nil
    end

    def description
      __var0 = LibGLib.option_context_get_description(@pointer.as(LibGLib::OptionContext*))
      GObject.raise_unexpected_null("g_option_context_get_description") if __var0.null?
      ::String.new(__var0)
    end

    def help(main_help : ::Bool, group : GLib::OptionGroup?)
      __var0 = LibGLib.option_context_get_help(@pointer.as(LibGLib::OptionContext*), LibC::Int.new(main_help ? 1 : 0), group ? group.to_unsafe.as(LibGLib::OptionGroup*) : Pointer(LibGLib::OptionGroup).null)
      GObject.raise_unexpected_null("g_option_context_get_help") if __var0.null?
      ::String.new(__var0)
    end

    def help_enabled
      __var0 = LibGLib.option_context_get_help_enabled(@pointer.as(LibGLib::OptionContext*))
      (__var0 == 1)
    end

    def ignore_unknown_options
      __var0 = LibGLib.option_context_get_ignore_unknown_options(@pointer.as(LibGLib::OptionContext*))
      (__var0 == 1)
    end

    def main_group
      __var0 = LibGLib.option_context_get_main_group(@pointer.as(LibGLib::OptionContext*))
      GObject.raise_unexpected_null("g_option_context_get_main_group") if __var0.null?
      GLib::OptionGroup.new(__var0)
    end

    def strict_posix
      __var0 = LibGLib.option_context_get_strict_posix(@pointer.as(LibGLib::OptionContext*))
      (__var0 == 1)
    end

    def summary
      __var0 = LibGLib.option_context_get_summary(@pointer.as(LibGLib::OptionContext*))
      GObject.raise_unexpected_null("g_option_context_get_summary") if __var0.null?
      ::String.new(__var0)
    end

    def parse(argc : ::Int, argv : ::Enumerable?)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.option_context_parse(@pointer.as(LibGLib::OptionContext*), argc, argv, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def parse_strv(arguments : ::Enumerable?)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.option_context_parse_strv(@pointer.as(LibGLib::OptionContext*), arguments, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def description=(description : ::String?)
      LibGLib.option_context_set_description(@pointer.as(LibGLib::OptionContext*), description ? description.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def help_enabled=(help_enabled : ::Bool)
      LibGLib.option_context_set_help_enabled(@pointer.as(LibGLib::OptionContext*), LibC::Int.new(help_enabled ? 1 : 0))
      nil
    end

    def ignore_unknown_options=(ignore_unknown : ::Bool)
      LibGLib.option_context_set_ignore_unknown_options(@pointer.as(LibGLib::OptionContext*), LibC::Int.new(ignore_unknown ? 1 : 0))
      nil
    end

    def main_group=(group : GLib::OptionGroup)
      LibGLib.option_context_set_main_group(@pointer.as(LibGLib::OptionContext*), group.to_unsafe.as(LibGLib::OptionGroup*))
      nil
    end

    def strict_posix=(strict_posix : ::Bool)
      LibGLib.option_context_set_strict_posix(@pointer.as(LibGLib::OptionContext*), LibC::Int.new(strict_posix ? 1 : 0))
      nil
    end

    def summary=(summary : ::String?)
      LibGLib.option_context_set_summary(@pointer.as(LibGLib::OptionContext*), summary ? summary.to_unsafe : Pointer(UInt8).null)
      nil
    end

    def set_translate_func(func : GLib::TranslateFunc?, data : Void*?, destroy_notify : GLib::DestroyNotify?)
      LibGLib.option_context_set_translate_func(@pointer.as(LibGLib::OptionContext*), func ? func : nil, data ? data : Pointer(Void).null, destroy_notify ? destroy_notify : nil)
      nil
    end

    def translation_domain=(domain : ::String)
      LibGLib.option_context_set_translation_domain(@pointer.as(LibGLib::OptionContext*), domain.to_unsafe)
      nil
    end
  end

  class OptionEntry
    include GObject::WrappedType

    def self.new(long_name : ::String? = nil, short_name : Int8? = nil, flags : Int32? = nil, arg : GLib::OptionArg? = nil, arg_data : Void*? = nil, description : ::String? = nil, arg_description : ::String? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(48u64, 0u8).as(LibGLib::OptionEntry*))
      __var0.long_name = long_name unless long_name.nil?
      __var0.short_name = short_name unless short_name.nil?
      __var0.flags = flags unless flags.nil?
      __var0.arg = arg unless arg.nil?
      __var0.arg_data = arg_data unless arg_data.nil?
      __var0.description = description unless description.nil?
      __var0.arg_description = arg_description unless arg_description.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::OptionEntry*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::OptionEntry*)
    end

    def to_unsafe_optionentry
      @pointer.not_nil!.as(LibGLib::OptionEntry*)
    end

    def long_name
      ::String.new(to_unsafe.as(LibGLib::OptionEntry*).value.long_name)
    end

    def long_name=(value : ::String)
      to_unsafe.as(LibGLib::OptionEntry*).value.long_name = value.to_unsafe
    end

    def short_name
      to_unsafe.as(LibGLib::OptionEntry*).value.short_name
    end

    def short_name=(value : Int8)
      to_unsafe.as(LibGLib::OptionEntry*).value.short_name = Int8.new(value)
    end

    def flags
      to_unsafe.as(LibGLib::OptionEntry*).value.flags
    end

    def flags=(value : Int32)
      to_unsafe.as(LibGLib::OptionEntry*).value.flags = Int32.new(value)
    end

    def arg
      GLib::OptionArg.new(to_unsafe.as(LibGLib::OptionEntry*).value.arg)
    end

    def arg=(value : GLib::OptionArg)
      to_unsafe.as(LibGLib::OptionEntry*).value.arg = value
    end

    def arg_data
      to_unsafe.as(LibGLib::OptionEntry*).value.arg_data
    end

    def arg_data=(value : Void*)
      to_unsafe.as(LibGLib::OptionEntry*).value.arg_data = value
    end

    def description
      ::String.new(to_unsafe.as(LibGLib::OptionEntry*).value.description)
    end

    def description=(value : ::String)
      to_unsafe.as(LibGLib::OptionEntry*).value.description = value.to_unsafe
    end

    def arg_description
      ::String.new(to_unsafe.as(LibGLib::OptionEntry*).value.arg_description)
    end

    def arg_description=(value : ::String)
      to_unsafe.as(LibGLib::OptionEntry*).value.arg_description = value.to_unsafe
    end
  end

  enum OptionError : UInt32
    UNKNOWN_OPTION = 0
    BAD_VALUE      = 1
    FAILED         = 2
  end
  alias OptionErrorFunc = LibGLib::OptionErrorFunc

  @[Flags]
  enum OptionFlags : UInt32
    NONE         =  0
    HIDDEN       =  1
    IN_MAIN      =  2
    REVERSE      =  4
    NO_ARG       =  8
    FILENAME     = 16
    OPTIONAL_ARG = 32
    NOALIAS      = 64
  end

  class OptionGroup
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::OptionGroup*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::OptionGroup*)
    end

    def to_unsafe_optiongroup
      @pointer.not_nil!.as(LibGLib::OptionGroup*)
    end

    def self.new(name : ::String, description : ::String, help_description : ::String, user_data : Void*?, destroy : GLib::DestroyNotify?) : self
      __var0 = LibGLib.option_group_new(name.to_unsafe, description.to_unsafe, help_description.to_unsafe, user_data ? user_data : Pointer(Void).null, destroy ? destroy : nil)
      GObject.raise_unexpected_null("g_option_group_new") if __var0.null?
      cast(GLib::OptionGroup.new(__var0))
    end

    def add_entries(entries : ::Enumerable)
      LibGLib.option_group_add_entries(@pointer.as(LibGLib::OptionGroup*), (__entries_ary = entries.map { |__item| __item }.to_a).to_unsafe)
      nil
    end

    def free
      LibGLib.option_group_free(@pointer.as(LibGLib::OptionGroup*))
      nil
    end

    def ref
      __var0 = LibGLib.option_group_ref(@pointer.as(LibGLib::OptionGroup*))
      GObject.raise_unexpected_null("g_option_group_ref") if __var0.null?
      GLib::OptionGroup.new(__var0)
    end

    def set_translate_func(func : GLib::TranslateFunc?, data : Void*?, destroy_notify : GLib::DestroyNotify?)
      LibGLib.option_group_set_translate_func(@pointer.as(LibGLib::OptionGroup*), func ? func : nil, data ? data : Pointer(Void).null, destroy_notify ? destroy_notify : nil)
      nil
    end

    def translation_domain=(domain : ::String)
      LibGLib.option_group_set_translation_domain(@pointer.as(LibGLib::OptionGroup*), domain.to_unsafe)
      nil
    end

    def unref
      LibGLib.option_group_unref(@pointer.as(LibGLib::OptionGroup*))
      nil
    end
  end

  alias OptionParseFunc = LibGLib::OptionParseFunc

  class PatternSpec
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::PatternSpec*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::PatternSpec*)
    end

    def to_unsafe_patternspec
      @pointer.not_nil!.as(LibGLib::PatternSpec*)
    end

    def equal(pspec2 : GLib::PatternSpec)
      __var0 = LibGLib.pattern_spec_equal(@pointer.as(LibGLib::PatternSpec*), pspec2.to_unsafe.as(LibGLib::PatternSpec*))
      (__var0 == 1)
    end

    def free
      LibGLib.pattern_spec_free(@pointer.as(LibGLib::PatternSpec*))
      nil
    end
  end

  class PollFD
    include GObject::WrappedType

    def self.new(fd : Int32? = nil, events : UInt16? = nil, revents : UInt16? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(8u64, 0u8).as(LibGLib::PollFD*))
      __var0.fd = fd unless fd.nil?
      __var0.events = events unless events.nil?
      __var0.revents = revents unless revents.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::PollFD*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::PollFD*)
    end

    def to_unsafe_pollfd
      @pointer.not_nil!.as(LibGLib::PollFD*)
    end

    def fd
      to_unsafe.as(LibGLib::PollFD*).value.fd
    end

    def fd=(value : Int32)
      to_unsafe.as(LibGLib::PollFD*).value.fd = Int32.new(value)
    end

    def events
      to_unsafe.as(LibGLib::PollFD*).value.events
    end

    def events=(value : UInt16)
      to_unsafe.as(LibGLib::PollFD*).value.events = UInt16.new(value)
    end

    def revents
      to_unsafe.as(LibGLib::PollFD*).value.revents
    end

    def revents=(value : UInt16)
      to_unsafe.as(LibGLib::PollFD*).value.revents = UInt16.new(value)
    end
  end

  alias PollFunc = LibGLib::PollFunc
  alias PrintFunc = LibGLib::PrintFunc

  class Private
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(32u64, 0u8).as(LibGLib::Private*))
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::Private*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Private*)
    end

    def to_unsafe_private
      @pointer.not_nil!.as(LibGLib::Private*)
    end

    def get
      LibGLib.private_get(@pointer.as(LibGLib::Private*))
      nil
    end

    def replace(value : Void*?)
      LibGLib.private_replace(@pointer.as(LibGLib::Private*), value ? value : Pointer(Void).null)
      nil
    end

    def set(value : Void*?)
      LibGLib.private_set(@pointer.as(LibGLib::Private*), value ? value : Pointer(Void).null)
      nil
    end

    def p
      to_unsafe.as(LibGLib::Private*).value.p
    end

    def notify
      to_unsafe.as(LibGLib::Private*).value.notify
    end

    def future
      GObject::PointerIterator.new(to_unsafe.as(LibGLib::Private*).value.future) { |__var0|
        __var0
      }
    end
  end

  class PtrArray
    include GObject::WrappedType

    def self.new(pdata : Void*? = nil, len : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibGLib::PtrArray*))
      __var0.pdata = pdata unless pdata.nil?
      __var0.len = len unless len.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::PtrArray*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::PtrArray*)
    end

    def to_unsafe_ptrarray
      @pointer.not_nil!.as(LibGLib::PtrArray*)
    end

    def pdata
      to_unsafe.as(LibGLib::PtrArray*).value.pdata
    end

    def pdata=(value : Void*)
      to_unsafe.as(LibGLib::PtrArray*).value.pdata = value
    end

    def len
      to_unsafe.as(LibGLib::PtrArray*).value.len
    end

    def len=(value : UInt32)
      to_unsafe.as(LibGLib::PtrArray*).value.len = UInt32.new(value)
    end
  end

  class Queue
    include GObject::WrappedType

    def self.new(head : Void*? = nil, tail : Void*? = nil, length : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGLib::Queue*))
      __var0.head = head unless head.nil?
      __var0.tail = tail unless tail.nil?
      __var0.length = length unless length.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::Queue*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Queue*)
    end

    def to_unsafe_queue
      @pointer.not_nil!.as(LibGLib::Queue*)
    end

    def clear
      LibGLib.queue_clear(@pointer.as(LibGLib::Queue*))
      nil
    end

    def clear_full(free_func : GLib::DestroyNotify?)
      LibGLib.queue_clear_full(@pointer.as(LibGLib::Queue*), free_func ? free_func : nil)
      nil
    end

    def free
      LibGLib.queue_free(@pointer.as(LibGLib::Queue*))
      nil
    end

    def free_full(free_func : GLib::DestroyNotify)
      LibGLib.queue_free_full(@pointer.as(LibGLib::Queue*), free_func)
      nil
    end

    def length
      __var0 = LibGLib.queue_get_length(@pointer.as(LibGLib::Queue*))
      __var0
    end

    def index(data : Void*?)
      __var0 = LibGLib.queue_index(@pointer.as(LibGLib::Queue*), data ? data : Pointer(Void).null)
      __var0
    end

    def init
      LibGLib.queue_init(@pointer.as(LibGLib::Queue*))
      nil
    end

    def empty?
      __var0 = LibGLib.queue_is_empty(@pointer.as(LibGLib::Queue*))
      (__var0 == 1)
    end

    def peek_head
      LibGLib.queue_peek_head(@pointer.as(LibGLib::Queue*))
      nil
    end

    def peek_nth(n : ::Int)
      LibGLib.queue_peek_nth(@pointer.as(LibGLib::Queue*), UInt32.new(n))
      nil
    end

    def peek_tail
      LibGLib.queue_peek_tail(@pointer.as(LibGLib::Queue*))
      nil
    end

    def pop_head
      LibGLib.queue_pop_head(@pointer.as(LibGLib::Queue*))
      nil
    end

    def pop_nth(n : ::Int)
      LibGLib.queue_pop_nth(@pointer.as(LibGLib::Queue*), UInt32.new(n))
      nil
    end

    def pop_tail
      LibGLib.queue_pop_tail(@pointer.as(LibGLib::Queue*))
      nil
    end

    def push_head(data : Void*?)
      LibGLib.queue_push_head(@pointer.as(LibGLib::Queue*), data ? data : Pointer(Void).null)
      nil
    end

    def push_nth(data : Void*?, n : ::Int)
      LibGLib.queue_push_nth(@pointer.as(LibGLib::Queue*), data ? data : Pointer(Void).null, Int32.new(n))
      nil
    end

    def push_tail(data : Void*?)
      LibGLib.queue_push_tail(@pointer.as(LibGLib::Queue*), data ? data : Pointer(Void).null)
      nil
    end

    def remove(data : Void*?)
      __var0 = LibGLib.queue_remove(@pointer.as(LibGLib::Queue*), data ? data : Pointer(Void).null)
      (__var0 == 1)
    end

    def remove_all(data : Void*?)
      __var0 = LibGLib.queue_remove_all(@pointer.as(LibGLib::Queue*), data ? data : Pointer(Void).null)
      __var0
    end

    def reverse
      LibGLib.queue_reverse(@pointer.as(LibGLib::Queue*))
      nil
    end

    def head
      GLib::ListIterator(Void*, Pointer(Void)*).new(GLib::List.new(to_unsafe.as(LibGLib::Queue*).value.head.as(LibGLib::List*)))
    end

    def head=(value : Void*)
      to_unsafe.as(LibGLib::Queue*).value.head = value
    end

    def tail
      GLib::ListIterator(Void*, Pointer(Void)*).new(GLib::List.new(to_unsafe.as(LibGLib::Queue*).value.tail.as(LibGLib::List*)))
    end

    def tail=(value : Void*)
      to_unsafe.as(LibGLib::Queue*).value.tail = value
    end
  end

  class RWLock
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(16u64, 0u8).as(LibGLib::RWLock*))
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::RWLock*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::RWLock*)
    end

    def to_unsafe_rwlock
      @pointer.not_nil!.as(LibGLib::RWLock*)
    end

    def clear
      LibGLib.r_w_lock_clear(@pointer.as(LibGLib::RWLock*))
      nil
    end

    def init
      LibGLib.r_w_lock_init(@pointer.as(LibGLib::RWLock*))
      nil
    end

    def reader_lock
      LibGLib.r_w_lock_reader_lock(@pointer.as(LibGLib::RWLock*))
      nil
    end

    def reader_trylock
      __var0 = LibGLib.r_w_lock_reader_trylock(@pointer.as(LibGLib::RWLock*))
      (__var0 == 1)
    end

    def reader_unlock
      LibGLib.r_w_lock_reader_unlock(@pointer.as(LibGLib::RWLock*))
      nil
    end

    def writer_lock
      LibGLib.r_w_lock_writer_lock(@pointer.as(LibGLib::RWLock*))
      nil
    end

    def writer_trylock
      __var0 = LibGLib.r_w_lock_writer_trylock(@pointer.as(LibGLib::RWLock*))
      (__var0 == 1)
    end

    def writer_unlock
      LibGLib.r_w_lock_writer_unlock(@pointer.as(LibGLib::RWLock*))
      nil
    end

    def p
      to_unsafe.as(LibGLib::RWLock*).value.p
    end

    def i
      GObject::PointerIterator.new(to_unsafe.as(LibGLib::RWLock*).value.i) { |__var0|
        __var0
      }
    end
  end

  class Rand
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::Rand*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Rand*)
    end

    def to_unsafe_rand
      @pointer.not_nil!.as(LibGLib::Rand*)
    end

    def double
      __var0 = LibGLib.rand_double(@pointer.as(LibGLib::Rand*))
      __var0
    end

    def double_range(_begin : ::Float, _end : ::Float)
      __var0 = LibGLib.rand_double_range(@pointer.as(LibGLib::Rand*), Float64.new(_begin), Float64.new(_end))
      __var0
    end

    def free
      LibGLib.rand_free(@pointer.as(LibGLib::Rand*))
      nil
    end

    def int
      __var0 = LibGLib.rand_int(@pointer.as(LibGLib::Rand*))
      __var0
    end

    def int_range(_begin : ::Int, _end : ::Int)
      __var0 = LibGLib.rand_int_range(@pointer.as(LibGLib::Rand*), Int32.new(_begin), Int32.new(_end))
      __var0
    end

    def seed=(seed : ::Int)
      LibGLib.rand_set_seed(@pointer.as(LibGLib::Rand*), UInt32.new(seed))
      nil
    end

    def set_seed_array(seed : ::Int, seed_length : ::Int)
      LibGLib.rand_set_seed_array(@pointer.as(LibGLib::Rand*), seed, UInt32.new(seed_length))
      nil
    end
  end

  class RecMutex
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(16u64, 0u8).as(LibGLib::RecMutex*))
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::RecMutex*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::RecMutex*)
    end

    def to_unsafe_recmutex
      @pointer.not_nil!.as(LibGLib::RecMutex*)
    end

    def clear
      LibGLib.rec_mutex_clear(@pointer.as(LibGLib::RecMutex*))
      nil
    end

    def init
      LibGLib.rec_mutex_init(@pointer.as(LibGLib::RecMutex*))
      nil
    end

    def lock
      LibGLib.rec_mutex_lock(@pointer.as(LibGLib::RecMutex*))
      nil
    end

    def trylock
      __var0 = LibGLib.rec_mutex_trylock(@pointer.as(LibGLib::RecMutex*))
      (__var0 == 1)
    end

    def unlock
      LibGLib.rec_mutex_unlock(@pointer.as(LibGLib::RecMutex*))
      nil
    end

    def p
      to_unsafe.as(LibGLib::RecMutex*).value.p
    end

    def i
      GObject::PointerIterator.new(to_unsafe.as(LibGLib::RecMutex*).value.i) { |__var0|
        __var0
      }
    end
  end

  class Regex
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::Regex*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Regex*)
    end

    def to_unsafe_regex
      @pointer.not_nil!.as(LibGLib::Regex*)
    end

    def self.new(pattern : ::String, compile_options : GLib::RegexCompileFlags, match_options : GLib::RegexMatchFlags) : self
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.regex_new(pattern.to_unsafe, compile_options, match_options, pointerof(__var0))
      GLib::Error.assert(__var0)
      __var2 = cast(GLib::Regex.new(__var1)) if __var1
      __var2
    end

    def capture_count
      __var0 = LibGLib.regex_get_capture_count(@pointer.as(LibGLib::Regex*))
      __var0
    end

    def compile_flags
      __var0 = LibGLib.regex_get_compile_flags(@pointer.as(LibGLib::Regex*))
      GLib::RegexCompileFlags.new(__var0)
    end

    def has_cr_or_lf
      __var0 = LibGLib.regex_get_has_cr_or_lf(@pointer.as(LibGLib::Regex*))
      (__var0 == 1)
    end

    def match_flags
      __var0 = LibGLib.regex_get_match_flags(@pointer.as(LibGLib::Regex*))
      GLib::RegexMatchFlags.new(__var0)
    end

    def max_backref
      __var0 = LibGLib.regex_get_max_backref(@pointer.as(LibGLib::Regex*))
      __var0
    end

    def max_lookbehind
      __var0 = LibGLib.regex_get_max_lookbehind(@pointer.as(LibGLib::Regex*))
      __var0
    end

    def pattern
      __var0 = LibGLib.regex_get_pattern(@pointer.as(LibGLib::Regex*))
      GObject.raise_unexpected_null("g_regex_get_pattern") if __var0.null?
      ::String.new(__var0)
    end

    def string_number(name : ::String)
      __var0 = LibGLib.regex_get_string_number(@pointer.as(LibGLib::Regex*), name.to_unsafe)
      __var0
    end

    def match(string : ::String, match_options : GLib::RegexMatchFlags, match_info : GLib::MatchInfo?)
      __var0 = LibGLib.regex_match(@pointer.as(LibGLib::Regex*), string.to_unsafe, match_options, match_info)
      (__var0 == 1)
    end

    def match_all(string : ::String, match_options : GLib::RegexMatchFlags, match_info : GLib::MatchInfo?)
      __var0 = LibGLib.regex_match_all(@pointer.as(LibGLib::Regex*), string.to_unsafe, match_options, match_info)
      (__var0 == 1)
    end

    def match_all_full(string : ::Enumerable, start_position : ::Int, match_options : GLib::RegexMatchFlags, match_info : GLib::MatchInfo?)
      string_len = string.size
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.regex_match_all_full(@pointer.as(LibGLib::Regex*), (__string_ary = string.map { |__item| __item.to_unsafe }.to_a).to_unsafe, Int64.new(string_len), Int32.new(start_position), match_options, match_info, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def match_full(string : ::Enumerable, start_position : ::Int, match_options : GLib::RegexMatchFlags, match_info : GLib::MatchInfo?)
      string_len = string.size
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.regex_match_full(@pointer.as(LibGLib::Regex*), (__string_ary = string.map { |__item| __item.to_unsafe }.to_a).to_unsafe, Int64.new(string_len), Int32.new(start_position), match_options, match_info, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def ref
      __var0 = LibGLib.regex_ref(@pointer.as(LibGLib::Regex*))
      GObject.raise_unexpected_null("g_regex_ref") if __var0.null?
      GLib::Regex.new(__var0)
    end

    def replace(string : ::Enumerable, start_position : ::Int, replacement : ::String, match_options : GLib::RegexMatchFlags)
      string_len = string.size
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.regex_replace(@pointer.as(LibGLib::Regex*), (__string_ary = string.map { |__item| __item.to_unsafe }.to_a).to_unsafe, Int64.new(string_len), Int32.new(start_position), replacement.to_unsafe, match_options, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_regex_replace") if __var1.null?
      ::String.new(__var1)
    end

    def replace_literal(string : ::Enumerable, start_position : ::Int, replacement : ::String, match_options : GLib::RegexMatchFlags)
      string_len = string.size
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.regex_replace_literal(@pointer.as(LibGLib::Regex*), (__string_ary = string.map { |__item| __item.to_unsafe }.to_a).to_unsafe, Int64.new(string_len), Int32.new(start_position), replacement.to_unsafe, match_options, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_regex_replace_literal") if __var1.null?
      ::String.new(__var1)
    end

    def split(string : ::String, match_options : GLib::RegexMatchFlags)
      __var0 = LibGLib.regex_split(@pointer.as(LibGLib::Regex*), string.to_unsafe, match_options)
      GObject.raise_unexpected_null("g_regex_split") if __var0.null?
      GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      }
    end

    def split_full(string : ::Enumerable, start_position : ::Int, match_options : GLib::RegexMatchFlags, max_tokens : ::Int)
      string_len = string.size
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.regex_split_full(@pointer.as(LibGLib::Regex*), (__string_ary = string.map { |__item| __item.to_unsafe }.to_a).to_unsafe, Int64.new(string_len), Int32.new(start_position), match_options, Int32.new(max_tokens), pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_regex_split_full") if __var1.null?
      GObject::PointerIterator.new(__var1) { |__var2|
        ::String.new(__var2)
      }
    end

    def unref
      LibGLib.regex_unref(@pointer.as(LibGLib::Regex*))
      nil
    end

    def self.check_replacement(replacement : ::String)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.regex_check_replacement(replacement.to_unsafe, out has_references, pointerof(__var0))
      GLib::Error.assert(__var0)
      {(__var1 == 1), (has_references == 1)}
    end

    def self.error_quark
      __var0 = LibGLib.regex_error_quark
      __var0
    end

    def self.escape_nul(string : ::String, length : ::Int)
      __var0 = LibGLib.regex_escape_nul(string.to_unsafe, Int32.new(length))
      GObject.raise_unexpected_null("g_regex_escape_nul") if __var0.null?
      ::String.new(__var0)
    end

    def self.escape_string(string : ::Enumerable)
      length = string.size
      __var0 = LibGLib.regex_escape_string((__string_ary = string.map { |__item| __item.to_unsafe }.to_a).to_unsafe, Int32.new(length))
      GObject.raise_unexpected_null("g_regex_escape_string") if __var0.null?
      ::String.new(__var0)
    end

    def self.match_simple(pattern : ::String, string : ::String, compile_options : GLib::RegexCompileFlags, match_options : GLib::RegexMatchFlags)
      __var0 = LibGLib.regex_match_simple(pattern.to_unsafe, string.to_unsafe, compile_options, match_options)
      (__var0 == 1)
    end

    def self.split_simple(pattern : ::String, string : ::String, compile_options : GLib::RegexCompileFlags, match_options : GLib::RegexMatchFlags)
      __var0 = LibGLib.regex_split_simple(pattern.to_unsafe, string.to_unsafe, compile_options, match_options)
      GObject.raise_unexpected_null("g_regex_split_simple") if __var0.null?
      GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      }
    end
  end

  @[Flags]
  enum RegexCompileFlags : UInt32
    ZERO_NONE         =        0
    CASELESS          =        1
    MULTILINE         =        2
    DOTALL            =        4
    EXTENDED          =        8
    ANCHORED          =       16
    DOLLAR_ENDONLY    =       32
    UNGREEDY          =      512
    RAW               =     2048
    NO_AUTO_CAPTURE   =     4096
    OPTIMIZE          =     8192
    FIRSTLINE         =   262144
    DUPNAMES          =   524288
    NEWLINE_CR        =  1048576
    NEWLINE_LF        =  2097152
    NEWLINE_CRLF      =  3145728
    NEWLINE_ANYCRLF   =  5242880
    BSR_ANYCRLF       =  8388608
    JAVASCRIPT_COMPAT = 33554432
  end

  enum RegexError : UInt32
    COMPILE                                      =   0
    OPTIMIZE                                     =   1
    REPLACE                                      =   2
    MATCH                                        =   3
    INTERNAL                                     =   4
    STRAY_BACKSLASH                              = 101
    MISSING_CONTROL_CHAR                         = 102
    UNRECOGNIZED_ESCAPE                          = 103
    QUANTIFIERS_OUT_OF_ORDER                     = 104
    QUANTIFIER_TOO_BIG                           = 105
    UNTERMINATED_CHARACTER_CLASS                 = 106
    INVALID_ESCAPE_IN_CHARACTER_CLASS            = 107
    RANGE_OUT_OF_ORDER                           = 108
    NOTHING_TO_REPEAT                            = 109
    UNRECOGNIZED_CHARACTER                       = 112
    POSIX_NAMED_CLASS_OUTSIDE_CLASS              = 113
    UNMATCHED_PARENTHESIS                        = 114
    INEXISTENT_SUBPATTERN_REFERENCE              = 115
    UNTERMINATED_COMMENT                         = 118
    EXPRESSION_TOO_LARGE                         = 120
    MEMORY_ERROR                                 = 121
    VARIABLE_LENGTH_LOOKBEHIND                   = 125
    MALFORMED_CONDITION                          = 126
    TOO_MANY_CONDITIONAL_BRANCHES                = 127
    ASSERTION_EXPECTED                           = 128
    UNKNOWN_POSIX_CLASS_NAME                     = 130
    POSIX_COLLATING_ELEMENTS_NOT_SUPPORTED       = 131
    HEX_CODE_TOO_LARGE                           = 134
    INVALID_CONDITION                            = 135
    SINGLE_BYTE_MATCH_IN_LOOKBEHIND              = 136
    INFINITE_LOOP                                = 140
    MISSING_SUBPATTERN_NAME_TERMINATOR           = 142
    DUPLICATE_SUBPATTERN_NAME                    = 143
    MALFORMED_PROPERTY                           = 146
    UNKNOWN_PROPERTY                             = 147
    SUBPATTERN_NAME_TOO_LONG                     = 148
    TOO_MANY_SUBPATTERNS                         = 149
    INVALID_OCTAL_VALUE                          = 151
    TOO_MANY_BRANCHES_IN_DEFINE                  = 154
    DEFINE_REPETION                              = 155
    INCONSISTENT_NEWLINE_OPTIONS                 = 156
    MISSING_BACK_REFERENCE                       = 157
    INVALID_RELATIVE_REFERENCE                   = 158
    BACKTRACKING_CONTROL_VERB_ARGUMENT_FORBIDDEN = 159
    UNKNOWN_BACKTRACKING_CONTROL_VERB            = 160
    NUMBER_TOO_BIG                               = 161
    MISSING_SUBPATTERN_NAME                      = 162
    MISSING_DIGIT                                = 163
    INVALID_DATA_CHARACTER                       = 164
    EXTRA_SUBPATTERN_NAME                        = 165
    BACKTRACKING_CONTROL_VERB_ARGUMENT_REQUIRED  = 166
    INVALID_CONTROL_CHAR                         = 168
    MISSING_NAME                                 = 169
    NOT_SUPPORTED_IN_CLASS                       = 171
    TOO_MANY_FORWARD_REFERENCES                  = 172
    NAME_TOO_LONG                                = 175
    CHARACTER_VALUE_TOO_LARGE                    = 176
  end
  alias RegexEvalCallback = LibGLib::RegexEvalCallback

  @[Flags]
  enum RegexMatchFlags : UInt32
    ZERO_NONE        =         0
    ANCHORED         =        16
    NOTBOL           =       128
    NOTEOL           =       256
    NOTEMPTY         =      1024
    PARTIAL          =     32768
    NEWLINE_CR       =   1048576
    NEWLINE_LF       =   2097152
    NEWLINE_CRLF     =   3145728
    NEWLINE_ANY      =   4194304
    NEWLINE_ANYCRLF  =   5242880
    BSR_ANYCRLF      =   8388608
    BSR_ANY          =  16777216
    PARTIAL_SOFT     =     32768
    PARTIAL_HARD     = 134217728
    NOTEMPTY_ATSTART = 268435456
  end

  class SList
    include GObject::WrappedType

    def self.new(data : Void*? = nil, next _next : Void*? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibGLib::SList*))
      __var0.data = data unless data.nil?
      __var0.next = _next unless _next.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::SList*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::SList*)
    end

    def to_unsafe_slist
      @pointer.not_nil!.as(LibGLib::SList*)
    end

    def data
      to_unsafe.as(LibGLib::SList*).value.data
    end

    def data=(value : Void*)
      to_unsafe.as(LibGLib::SList*).value.data = value
    end

    def next
      GLib::SListIterator(Void*, Pointer(Void)*).new(GLib::SList.new(to_unsafe.as(LibGLib::SList*).value._next.as(LibGLib::SList*)))
    end

    def next=(value : Void*)
      to_unsafe.as(LibGLib::SList*).value._next = value
    end
  end

  class Scanner
    include GObject::WrappedType

    def self.new(user_data : Void*? = nil, max_parse_errors : UInt32? = nil, parse_errors : UInt32? = nil, input_name : ::String? = nil, qdata : GLib::Data? = nil, config : GLib::ScannerConfig? = nil, token : GLib::TokenType? = nil, value : GLib::TokenValue? = nil, line : UInt32? = nil, position : UInt32? = nil, next_token : GLib::TokenType? = nil, next_value : GLib::TokenValue? = nil, next_line : UInt32? = nil, next_position : UInt32? = nil, msg_handler : GLib::ScannerMsgFunc? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(144u64, 0u8).as(LibGLib::Scanner*))
      __var0.user_data = user_data unless user_data.nil?
      __var0.max_parse_errors = max_parse_errors unless max_parse_errors.nil?
      __var0.parse_errors = parse_errors unless parse_errors.nil?
      __var0.input_name = input_name unless input_name.nil?
      __var0.qdata = qdata unless qdata.nil?
      __var0.config = config unless config.nil?
      __var0.token = token unless token.nil?
      __var0.value = value unless value.nil?
      __var0.line = line unless line.nil?
      __var0.position = position unless position.nil?
      __var0.next_token = next_token unless next_token.nil?
      __var0.next_value = next_value unless next_value.nil?
      __var0.next_line = next_line unless next_line.nil?
      __var0.next_position = next_position unless next_position.nil?
      __var0.msg_handler = msg_handler unless msg_handler.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::Scanner*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Scanner*)
    end

    def to_unsafe_scanner
      @pointer.not_nil!.as(LibGLib::Scanner*)
    end

    def cur_line
      __var0 = LibGLib.scanner_cur_line(@pointer.as(LibGLib::Scanner*))
      __var0
    end

    def cur_position
      __var0 = LibGLib.scanner_cur_position(@pointer.as(LibGLib::Scanner*))
      __var0
    end

    def cur_token
      __var0 = LibGLib.scanner_cur_token(@pointer.as(LibGLib::Scanner*))
      GLib::TokenType.new(__var0)
    end

    def destroy
      LibGLib.scanner_destroy(@pointer.as(LibGLib::Scanner*))
      nil
    end

    def eof
      __var0 = LibGLib.scanner_eof(@pointer.as(LibGLib::Scanner*))
      (__var0 == 1)
    end

    def next_token
      __var0 = LibGLib.scanner_get_next_token(@pointer.as(LibGLib::Scanner*))
      GLib::TokenType.new(__var0)
    end

    def input_file(input_fd : ::Int)
      LibGLib.scanner_input_file(@pointer.as(LibGLib::Scanner*), Int32.new(input_fd))
      nil
    end

    def input_text(text : ::String, text_len : ::Int)
      LibGLib.scanner_input_text(@pointer.as(LibGLib::Scanner*), text.to_unsafe, UInt32.new(text_len))
      nil
    end

    def lookup_symbol(symbol : ::String)
      LibGLib.scanner_lookup_symbol(@pointer.as(LibGLib::Scanner*), symbol.to_unsafe)
      nil
    end

    def peek_next_token
      __var0 = LibGLib.scanner_peek_next_token(@pointer.as(LibGLib::Scanner*))
      GLib::TokenType.new(__var0)
    end

    def scope_add_symbol(scope_id : ::Int, symbol : ::String, value : Void*?)
      LibGLib.scanner_scope_add_symbol(@pointer.as(LibGLib::Scanner*), UInt32.new(scope_id), symbol.to_unsafe, value ? value : Pointer(Void).null)
      nil
    end

    def scope_lookup_symbol(scope_id : ::Int, symbol : ::String)
      LibGLib.scanner_scope_lookup_symbol(@pointer.as(LibGLib::Scanner*), UInt32.new(scope_id), symbol.to_unsafe)
      nil
    end

    def scope_remove_symbol(scope_id : ::Int, symbol : ::String)
      LibGLib.scanner_scope_remove_symbol(@pointer.as(LibGLib::Scanner*), UInt32.new(scope_id), symbol.to_unsafe)
      nil
    end

    def scope=(scope_id : ::Int)
      __var0 = LibGLib.scanner_set_scope(@pointer.as(LibGLib::Scanner*), UInt32.new(scope_id))
      __var0
    end

    def sync_file_offset
      LibGLib.scanner_sync_file_offset(@pointer.as(LibGLib::Scanner*))
      nil
    end

    def unexp_token(expected_token : GLib::TokenType, identifier_spec : ::String, symbol_spec : ::String, symbol_name : ::String, message : ::String, is_error : ::Int)
      LibGLib.scanner_unexp_token(@pointer.as(LibGLib::Scanner*), expected_token, identifier_spec.to_unsafe, symbol_spec.to_unsafe, symbol_name.to_unsafe, message.to_unsafe, Int32.new(is_error))
      nil
    end

    def user_data
      to_unsafe.as(LibGLib::Scanner*).value.user_data
    end

    def user_data=(value : Void*)
      to_unsafe.as(LibGLib::Scanner*).value.user_data = value
    end

    def max_parse_errors
      to_unsafe.as(LibGLib::Scanner*).value.max_parse_errors
    end

    def max_parse_errors=(value : UInt32)
      to_unsafe.as(LibGLib::Scanner*).value.max_parse_errors = UInt32.new(value)
    end

    def parse_errors
      to_unsafe.as(LibGLib::Scanner*).value.parse_errors
    end

    def parse_errors=(value : UInt32)
      to_unsafe.as(LibGLib::Scanner*).value.parse_errors = UInt32.new(value)
    end

    def input_name
      ::String.new(to_unsafe.as(LibGLib::Scanner*).value.input_name)
    end

    def input_name=(value : ::String)
      to_unsafe.as(LibGLib::Scanner*).value.input_name = value.to_unsafe
    end

    def qdata
      GLib::Data.new(to_unsafe.as(LibGLib::Scanner*).value.qdata)
    end

    def qdata=(value : GLib::Data)
      to_unsafe.as(LibGLib::Scanner*).value.qdata = value.to_unsafe.as(LibGLib::Data*)
    end

    def config
      GLib::ScannerConfig.new(to_unsafe.as(LibGLib::Scanner*).value.config)
    end

    def config=(value : GLib::ScannerConfig)
      to_unsafe.as(LibGLib::Scanner*).value.config = value.to_unsafe.as(LibGLib::ScannerConfig*)
    end

    def token
      GLib::TokenType.new(to_unsafe.as(LibGLib::Scanner*).value.token)
    end

    def token=(value : GLib::TokenType)
      to_unsafe.as(LibGLib::Scanner*).value.token = value
    end

    def value
      GLib::TokenValue.new(to_unsafe.as(LibGLib::Scanner*).value.value)
    end

    def value=(value : GLib::TokenValue)
      to_unsafe.as(LibGLib::Scanner*).value.value = value
    end

    def line
      to_unsafe.as(LibGLib::Scanner*).value.line
    end

    def line=(value : UInt32)
      to_unsafe.as(LibGLib::Scanner*).value.line = UInt32.new(value)
    end

    def position
      to_unsafe.as(LibGLib::Scanner*).value.position
    end

    def position=(value : UInt32)
      to_unsafe.as(LibGLib::Scanner*).value.position = UInt32.new(value)
    end

    def next_value
      GLib::TokenValue.new(to_unsafe.as(LibGLib::Scanner*).value.next_value)
    end

    def next_value=(value : GLib::TokenValue)
      to_unsafe.as(LibGLib::Scanner*).value.next_value = value
    end

    def next_line
      to_unsafe.as(LibGLib::Scanner*).value.next_line
    end

    def next_line=(value : UInt32)
      to_unsafe.as(LibGLib::Scanner*).value.next_line = UInt32.new(value)
    end

    def next_position
      to_unsafe.as(LibGLib::Scanner*).value.next_position
    end

    def next_position=(value : UInt32)
      to_unsafe.as(LibGLib::Scanner*).value.next_position = UInt32.new(value)
    end

    def symbol_table
      to_unsafe.as(LibGLib::Scanner*).value.symbol_table
    end

    def input_fd
      to_unsafe.as(LibGLib::Scanner*).value.input_fd
    end

    def text
      ::String.new(to_unsafe.as(LibGLib::Scanner*).value.text)
    end

    def text_end
      ::String.new(to_unsafe.as(LibGLib::Scanner*).value.text_end)
    end

    def buffer
      ::String.new(to_unsafe.as(LibGLib::Scanner*).value.buffer)
    end

    def scope_id
      to_unsafe.as(LibGLib::Scanner*).value.scope_id
    end

    def msg_handler
      to_unsafe.as(LibGLib::Scanner*).value.msg_handler
    end

    def msg_handler=(value : GLib::ScannerMsgFunc)
      to_unsafe.as(LibGLib::Scanner*).value.msg_handler = value
    end
  end

  class ScannerConfig
    include GObject::WrappedType

    def self.new(cset_skip_characters : ::String? = nil, cset_identifier_first : ::String? = nil, cset_identifier_nth : ::String? = nil, cpair_comment_single : ::String? = nil, case_sensitive : UInt32? = nil, skip_comment_multi : UInt32? = nil, skip_comment_single : UInt32? = nil, scan_comment_multi : UInt32? = nil, scan_identifier : UInt32? = nil, scan_identifier_1char : UInt32? = nil, scan_identifier_NULL : UInt32? = nil, scan_symbols : UInt32? = nil, scan_binary : UInt32? = nil, scan_octal : UInt32? = nil, scan_float : UInt32? = nil, scan_hex : UInt32? = nil, scan_hex_dollar : UInt32? = nil, scan_string_sq : UInt32? = nil, scan_string_dq : UInt32? = nil, numbers_2_int : UInt32? = nil, int_2_float : UInt32? = nil, identifier_2_string : UInt32? = nil, char_2_token : UInt32? = nil, symbol_2_token : UInt32? = nil, scope_0_fallback : UInt32? = nil, store_int64 : UInt32? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(128u64, 0u8).as(LibGLib::ScannerConfig*))
      __var0.cset_skip_characters = cset_skip_characters unless cset_skip_characters.nil?
      __var0.cset_identifier_first = cset_identifier_first unless cset_identifier_first.nil?
      __var0.cset_identifier_nth = cset_identifier_nth unless cset_identifier_nth.nil?
      __var0.cpair_comment_single = cpair_comment_single unless cpair_comment_single.nil?
      __var0.case_sensitive = case_sensitive unless case_sensitive.nil?
      __var0.skip_comment_multi = skip_comment_multi unless skip_comment_multi.nil?
      __var0.skip_comment_single = skip_comment_single unless skip_comment_single.nil?
      __var0.scan_comment_multi = scan_comment_multi unless scan_comment_multi.nil?
      __var0.scan_identifier = scan_identifier unless scan_identifier.nil?
      __var0.scan_identifier_1char = scan_identifier_1char unless scan_identifier_1char.nil?
      __var0.scan_identifier_NULL = scan_identifier_NULL unless scan_identifier_NULL.nil?
      __var0.scan_symbols = scan_symbols unless scan_symbols.nil?
      __var0.scan_binary = scan_binary unless scan_binary.nil?
      __var0.scan_octal = scan_octal unless scan_octal.nil?
      __var0.scan_float = scan_float unless scan_float.nil?
      __var0.scan_hex = scan_hex unless scan_hex.nil?
      __var0.scan_hex_dollar = scan_hex_dollar unless scan_hex_dollar.nil?
      __var0.scan_string_sq = scan_string_sq unless scan_string_sq.nil?
      __var0.scan_string_dq = scan_string_dq unless scan_string_dq.nil?
      __var0.numbers_2_int = numbers_2_int unless numbers_2_int.nil?
      __var0.int_2_float = int_2_float unless int_2_float.nil?
      __var0.identifier_2_string = identifier_2_string unless identifier_2_string.nil?
      __var0.char_2_token = char_2_token unless char_2_token.nil?
      __var0.symbol_2_token = symbol_2_token unless symbol_2_token.nil?
      __var0.scope_0_fallback = scope_0_fallback unless scope_0_fallback.nil?
      __var0.store_int64 = store_int64 unless store_int64.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::ScannerConfig*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::ScannerConfig*)
    end

    def to_unsafe_scannerconfig
      @pointer.not_nil!.as(LibGLib::ScannerConfig*)
    end

    def cset_skip_characters
      ::String.new(to_unsafe.as(LibGLib::ScannerConfig*).value.cset_skip_characters)
    end

    def cset_skip_characters=(value : ::String)
      to_unsafe.as(LibGLib::ScannerConfig*).value.cset_skip_characters = value.to_unsafe
    end

    def cset_identifier_first
      ::String.new(to_unsafe.as(LibGLib::ScannerConfig*).value.cset_identifier_first)
    end

    def cset_identifier_first=(value : ::String)
      to_unsafe.as(LibGLib::ScannerConfig*).value.cset_identifier_first = value.to_unsafe
    end

    def cset_identifier_nth
      ::String.new(to_unsafe.as(LibGLib::ScannerConfig*).value.cset_identifier_nth)
    end

    def cset_identifier_nth=(value : ::String)
      to_unsafe.as(LibGLib::ScannerConfig*).value.cset_identifier_nth = value.to_unsafe
    end

    def cpair_comment_single
      ::String.new(to_unsafe.as(LibGLib::ScannerConfig*).value.cpair_comment_single)
    end

    def cpair_comment_single=(value : ::String)
      to_unsafe.as(LibGLib::ScannerConfig*).value.cpair_comment_single = value.to_unsafe
    end

    def case_sensitive
      to_unsafe.as(LibGLib::ScannerConfig*).value.case_sensitive
    end

    def case_sensitive=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.case_sensitive = UInt32.new(value)
    end

    def skip_comment_multi
      to_unsafe.as(LibGLib::ScannerConfig*).value.skip_comment_multi
    end

    def skip_comment_multi=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.skip_comment_multi = UInt32.new(value)
    end

    def skip_comment_single
      to_unsafe.as(LibGLib::ScannerConfig*).value.skip_comment_single
    end

    def skip_comment_single=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.skip_comment_single = UInt32.new(value)
    end

    def scan_comment_multi
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_comment_multi
    end

    def scan_comment_multi=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_comment_multi = UInt32.new(value)
    end

    def scan_identifier
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_identifier
    end

    def scan_identifier=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_identifier = UInt32.new(value)
    end

    def scan_identifier_1char
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_identifier_1char
    end

    def scan_identifier_1char=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_identifier_1char = UInt32.new(value)
    end

    def scan_identifier_NULL
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_identifier_NULL
    end

    def scan_identifier_NULL=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_identifier_NULL = UInt32.new(value)
    end

    def scan_symbols
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_symbols
    end

    def scan_symbols=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_symbols = UInt32.new(value)
    end

    def scan_binary
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_binary
    end

    def scan_binary=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_binary = UInt32.new(value)
    end

    def scan_octal
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_octal
    end

    def scan_octal=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_octal = UInt32.new(value)
    end

    def scan_float
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_float
    end

    def scan_float=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_float = UInt32.new(value)
    end

    def scan_hex
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_hex
    end

    def scan_hex=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_hex = UInt32.new(value)
    end

    def scan_hex_dollar
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_hex_dollar
    end

    def scan_hex_dollar=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_hex_dollar = UInt32.new(value)
    end

    def scan_string_sq
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_string_sq
    end

    def scan_string_sq=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_string_sq = UInt32.new(value)
    end

    def scan_string_dq
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_string_dq
    end

    def scan_string_dq=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.scan_string_dq = UInt32.new(value)
    end

    def numbers_2_int
      to_unsafe.as(LibGLib::ScannerConfig*).value.numbers_2_int
    end

    def numbers_2_int=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.numbers_2_int = UInt32.new(value)
    end

    def int_2_float
      to_unsafe.as(LibGLib::ScannerConfig*).value.int_2_float
    end

    def int_2_float=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.int_2_float = UInt32.new(value)
    end

    def identifier_2_string
      to_unsafe.as(LibGLib::ScannerConfig*).value.identifier_2_string
    end

    def identifier_2_string=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.identifier_2_string = UInt32.new(value)
    end

    def char_2_token
      to_unsafe.as(LibGLib::ScannerConfig*).value.char_2_token
    end

    def char_2_token=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.char_2_token = UInt32.new(value)
    end

    def symbol_2_token
      to_unsafe.as(LibGLib::ScannerConfig*).value.symbol_2_token
    end

    def symbol_2_token=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.symbol_2_token = UInt32.new(value)
    end

    def scope_0_fallback
      to_unsafe.as(LibGLib::ScannerConfig*).value.scope_0_fallback
    end

    def scope_0_fallback=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.scope_0_fallback = UInt32.new(value)
    end

    def store_int64
      to_unsafe.as(LibGLib::ScannerConfig*).value.store_int64
    end

    def store_int64=(value : UInt32)
      to_unsafe.as(LibGLib::ScannerConfig*).value.store_int64 = UInt32.new(value)
    end

    def padding_dummy
      to_unsafe.as(LibGLib::ScannerConfig*).value.padding_dummy
    end
  end

  alias ScannerMsgFunc = LibGLib::ScannerMsgFunc

  enum SeekType : UInt32
    CUR = 0
    SET = 1
    END = 2
  end

  class Sequence
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::Sequence*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Sequence*)
    end

    def to_unsafe_sequence
      @pointer.not_nil!.as(LibGLib::Sequence*)
    end

    def append(data : Void*?)
      __var0 = LibGLib.sequence_append(@pointer.as(LibGLib::Sequence*), data ? data : Pointer(Void).null)
      GObject.raise_unexpected_null("g_sequence_append") if __var0.null?
      GLib::SequenceIter.new(__var0)
    end

    def free
      LibGLib.sequence_free(@pointer.as(LibGLib::Sequence*))
      nil
    end

    def begin_iter
      __var0 = LibGLib.sequence_get_begin_iter(@pointer.as(LibGLib::Sequence*))
      GObject.raise_unexpected_null("g_sequence_get_begin_iter") if __var0.null?
      GLib::SequenceIter.new(__var0)
    end

    def end_iter
      __var0 = LibGLib.sequence_get_end_iter(@pointer.as(LibGLib::Sequence*))
      GObject.raise_unexpected_null("g_sequence_get_end_iter") if __var0.null?
      GLib::SequenceIter.new(__var0)
    end

    def iter_at_pos(pos : ::Int)
      __var0 = LibGLib.sequence_get_iter_at_pos(@pointer.as(LibGLib::Sequence*), Int32.new(pos))
      GObject.raise_unexpected_null("g_sequence_get_iter_at_pos") if __var0.null?
      GLib::SequenceIter.new(__var0)
    end

    def length
      __var0 = LibGLib.sequence_get_length(@pointer.as(LibGLib::Sequence*))
      __var0
    end

    def empty?
      __var0 = LibGLib.sequence_is_empty(@pointer.as(LibGLib::Sequence*))
      (__var0 == 1)
    end

    def prepend(data : Void*?)
      __var0 = LibGLib.sequence_prepend(@pointer.as(LibGLib::Sequence*), data ? data : Pointer(Void).null)
      GObject.raise_unexpected_null("g_sequence_prepend") if __var0.null?
      GLib::SequenceIter.new(__var0)
    end

    def self.get(iter : GLib::SequenceIter)
      LibGLib.sequence_get(iter.to_unsafe.as(LibGLib::SequenceIter*))
      nil
    end

    def self.insert_before(iter : GLib::SequenceIter, data : Void*?)
      __var0 = LibGLib.sequence_insert_before(iter.to_unsafe.as(LibGLib::SequenceIter*), data ? data : Pointer(Void).null)
      GObject.raise_unexpected_null("g_sequence_insert_before") if __var0.null?
      GLib::SequenceIter.new(__var0)
    end

    def self.move(src : GLib::SequenceIter, dest : GLib::SequenceIter)
      LibGLib.sequence_move(src.to_unsafe.as(LibGLib::SequenceIter*), dest.to_unsafe.as(LibGLib::SequenceIter*))
      nil
    end

    def self.move_range(dest : GLib::SequenceIter, _begin : GLib::SequenceIter, _end : GLib::SequenceIter)
      LibGLib.sequence_move_range(dest.to_unsafe.as(LibGLib::SequenceIter*), _begin.to_unsafe.as(LibGLib::SequenceIter*), _end.to_unsafe.as(LibGLib::SequenceIter*))
      nil
    end

    def self.range_get_midpoint(_begin : GLib::SequenceIter, _end : GLib::SequenceIter)
      __var0 = LibGLib.sequence_range_get_midpoint(_begin.to_unsafe.as(LibGLib::SequenceIter*), _end.to_unsafe.as(LibGLib::SequenceIter*))
      GObject.raise_unexpected_null("g_sequence_range_get_midpoint") if __var0.null?
      GLib::SequenceIter.new(__var0)
    end

    def self.remove(iter : GLib::SequenceIter)
      LibGLib.sequence_remove(iter.to_unsafe.as(LibGLib::SequenceIter*))
      nil
    end

    def self.remove_range(_begin : GLib::SequenceIter, _end : GLib::SequenceIter)
      LibGLib.sequence_remove_range(_begin.to_unsafe.as(LibGLib::SequenceIter*), _end.to_unsafe.as(LibGLib::SequenceIter*))
      nil
    end

    def self.set(iter : GLib::SequenceIter, data : Void*?)
      LibGLib.sequence_set(iter.to_unsafe.as(LibGLib::SequenceIter*), data ? data : Pointer(Void).null)
      nil
    end

    def self.swap(a : GLib::SequenceIter, b : GLib::SequenceIter)
      LibGLib.sequence_swap(a.to_unsafe.as(LibGLib::SequenceIter*), b.to_unsafe.as(LibGLib::SequenceIter*))
      nil
    end
  end

  class SequenceIter
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::SequenceIter*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::SequenceIter*)
    end

    def to_unsafe_sequenceiter
      @pointer.not_nil!.as(LibGLib::SequenceIter*)
    end

    def compare(b : GLib::SequenceIter)
      __var0 = LibGLib.sequence_iter_compare(@pointer.as(LibGLib::SequenceIter*), b.to_unsafe.as(LibGLib::SequenceIter*))
      __var0
    end

    def position
      __var0 = LibGLib.sequence_iter_get_position(@pointer.as(LibGLib::SequenceIter*))
      __var0
    end

    def sequence
      __var0 = LibGLib.sequence_iter_get_sequence(@pointer.as(LibGLib::SequenceIter*))
      GObject.raise_unexpected_null("g_sequence_iter_get_sequence") if __var0.null?
      GLib::Sequence.new(__var0)
    end

    def begin?
      __var0 = LibGLib.sequence_iter_is_begin(@pointer.as(LibGLib::SequenceIter*))
      (__var0 == 1)
    end

    def end?
      __var0 = LibGLib.sequence_iter_is_end(@pointer.as(LibGLib::SequenceIter*))
      (__var0 == 1)
    end

    def move(delta : ::Int)
      __var0 = LibGLib.sequence_iter_move(@pointer.as(LibGLib::SequenceIter*), Int32.new(delta))
      GObject.raise_unexpected_null("g_sequence_iter_move") if __var0.null?
      GLib::SequenceIter.new(__var0)
    end

    def next
      __var0 = LibGLib.sequence_iter_next(@pointer.as(LibGLib::SequenceIter*))
      GObject.raise_unexpected_null("g_sequence_iter_next") if __var0.null?
      GLib::SequenceIter.new(__var0)
    end

    def prev
      __var0 = LibGLib.sequence_iter_prev(@pointer.as(LibGLib::SequenceIter*))
      GObject.raise_unexpected_null("g_sequence_iter_prev") if __var0.null?
      GLib::SequenceIter.new(__var0)
    end
  end

  alias SequenceIterCompareFunc = LibGLib::SequenceIterCompareFunc

  enum ShellError : UInt32
    BAD_QUOTING  = 0
    EMPTY_STRING = 1
    FAILED       = 2
  end

  enum SliceConfig : UInt32
    ZERO_NONE          = 0
    ALWAYS_MALLOC      = 1
    BYPASS_MAGAZINES   = 2
    WORKING_SET_MSECS  = 3
    COLOR_INCREMENT    = 4
    CHUNK_SIZES        = 5
    CONTENTION_COUNTER = 6
  end

  class Source
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(96u64, 0u8).as(LibGLib::Source*))
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::Source*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Source*)
    end

    def to_unsafe_source
      @pointer.not_nil!.as(LibGLib::Source*)
    end

    def self.new(source_funcs : GLib::SourceFuncs, struct_size : ::Int) : self
      __var0 = LibGLib.source_new(source_funcs.to_unsafe.as(LibGLib::SourceFuncs*), UInt32.new(struct_size))
      GObject.raise_unexpected_null("g_source_new") if __var0.null?
      cast(GLib::Source.new(__var0))
    end

    def add_child_source(child_source : GLib::Source)
      LibGLib.source_add_child_source(@pointer.as(LibGLib::Source*), child_source.to_unsafe.as(LibGLib::Source*))
      nil
    end

    def add_poll(fd : GLib::PollFD)
      LibGLib.source_add_poll(@pointer.as(LibGLib::Source*), fd.to_unsafe.as(LibGLib::PollFD*))
      nil
    end

    def add_unix_fd(fd : ::Int, events : GLib::IOCondition)
      LibGLib.source_add_unix_fd(@pointer.as(LibGLib::Source*), Int32.new(fd), events)
      nil
    end

    def attach(context : GLib::MainContext?)
      __var0 = LibGLib.source_attach(@pointer.as(LibGLib::Source*), context ? context.to_unsafe.as(LibGLib::MainContext*) : Pointer(LibGLib::MainContext).null)
      __var0
    end

    def destroy
      LibGLib.source_destroy(@pointer.as(LibGLib::Source*))
      nil
    end

    def can_recurse
      __var0 = LibGLib.source_get_can_recurse(@pointer.as(LibGLib::Source*))
      (__var0 == 1)
    end

    def context
      __var0 = LibGLib.source_get_context(@pointer.as(LibGLib::Source*))
      __var1 = GLib::MainContext.new(__var0) if __var0
      __var1
    end

    def current_time(timeval : GLib::TimeVal)
      LibGLib.source_get_current_time(@pointer.as(LibGLib::Source*), timeval.to_unsafe.as(LibGLib::TimeVal*))
      nil
    end

    def id
      __var0 = LibGLib.source_get_id(@pointer.as(LibGLib::Source*))
      __var0
    end

    def name
      __var0 = LibGLib.source_get_name(@pointer.as(LibGLib::Source*))
      GObject.raise_unexpected_null("g_source_get_name") if __var0.null?
      ::String.new(__var0)
    end

    def priority
      __var0 = LibGLib.source_get_priority(@pointer.as(LibGLib::Source*))
      __var0
    end

    def ready_time
      __var0 = LibGLib.source_get_ready_time(@pointer.as(LibGLib::Source*))
      __var0
    end

    def time
      __var0 = LibGLib.source_get_time(@pointer.as(LibGLib::Source*))
      __var0
    end

    def destroyed?
      __var0 = LibGLib.source_is_destroyed(@pointer.as(LibGLib::Source*))
      (__var0 == 1)
    end

    def modify_unix_fd(tag : Void*, new_events : GLib::IOCondition)
      LibGLib.source_modify_unix_fd(@pointer.as(LibGLib::Source*), tag, new_events)
      nil
    end

    def query_unix_fd(tag : Void*)
      __var0 = LibGLib.source_query_unix_fd(@pointer.as(LibGLib::Source*), tag)
      GLib::IOCondition.new(__var0)
    end

    def ref
      __var0 = LibGLib.source_ref(@pointer.as(LibGLib::Source*))
      GObject.raise_unexpected_null("g_source_ref") if __var0.null?
      GLib::Source.new(__var0)
    end

    def remove_child_source(child_source : GLib::Source)
      LibGLib.source_remove_child_source(@pointer.as(LibGLib::Source*), child_source.to_unsafe.as(LibGLib::Source*))
      nil
    end

    def remove_poll(fd : GLib::PollFD)
      LibGLib.source_remove_poll(@pointer.as(LibGLib::Source*), fd.to_unsafe.as(LibGLib::PollFD*))
      nil
    end

    def remove_unix_fd(tag : Void*)
      LibGLib.source_remove_unix_fd(@pointer.as(LibGLib::Source*), tag)
      nil
    end

    def set_callback(func : GLib::SourceFunc, data : Void*?, notify : GLib::DestroyNotify?)
      LibGLib.source_set_callback(@pointer.as(LibGLib::Source*), func, data ? data : Pointer(Void).null, notify ? notify : nil)
      nil
    end

    def set_callback_indirect(callback_data : Void*?, callback_funcs : GLib::SourceCallbackFuncs)
      LibGLib.source_set_callback_indirect(@pointer.as(LibGLib::Source*), callback_data ? callback_data : Pointer(Void).null, callback_funcs.to_unsafe.as(LibGLib::SourceCallbackFuncs*))
      nil
    end

    def can_recurse=(can_recurse : ::Bool)
      LibGLib.source_set_can_recurse(@pointer.as(LibGLib::Source*), LibC::Int.new(can_recurse ? 1 : 0))
      nil
    end

    def funcs=(funcs : GLib::SourceFuncs)
      LibGLib.source_set_funcs(@pointer.as(LibGLib::Source*), funcs.to_unsafe.as(LibGLib::SourceFuncs*))
      nil
    end

    def name=(name : ::String)
      LibGLib.source_set_name(@pointer.as(LibGLib::Source*), name.to_unsafe)
      nil
    end

    def priority=(priority : ::Int)
      LibGLib.source_set_priority(@pointer.as(LibGLib::Source*), Int32.new(priority))
      nil
    end

    def ready_time=(ready_time : ::Int)
      LibGLib.source_set_ready_time(@pointer.as(LibGLib::Source*), Int64.new(ready_time))
      nil
    end

    def unref
      LibGLib.source_unref(@pointer.as(LibGLib::Source*))
      nil
    end

    def self.remove(tag : ::Int)
      __var0 = LibGLib.source_remove(UInt32.new(tag))
      (__var0 == 1)
    end

    def self.remove_by_funcs_user_data(funcs : GLib::SourceFuncs, user_data : Void*?)
      __var0 = LibGLib.source_remove_by_funcs_user_data(funcs.to_unsafe.as(LibGLib::SourceFuncs*), user_data ? user_data : Pointer(Void).null)
      (__var0 == 1)
    end

    def self.remove_by_user_data(user_data : Void*?)
      __var0 = LibGLib.source_remove_by_user_data(user_data ? user_data : Pointer(Void).null)
      (__var0 == 1)
    end

    def self.set_name_by_id(tag : ::Int, name : ::String)
      LibGLib.source_set_name_by_id(UInt32.new(tag), name.to_unsafe)
      nil
    end

    def callback_data
      to_unsafe.as(LibGLib::Source*).value.callback_data
    end

    def callback_funcs
      GLib::SourceCallbackFuncs.new(to_unsafe.as(LibGLib::Source*).value.callback_funcs)
    end

    def source_funcs
      GLib::SourceFuncs.new(to_unsafe.as(LibGLib::Source*).value.source_funcs)
    end

    def ref_count
      to_unsafe.as(LibGLib::Source*).value.ref_count
    end

    def flags
      to_unsafe.as(LibGLib::Source*).value.flags
    end

    def source_id
      to_unsafe.as(LibGLib::Source*).value.source_id
    end

    def poll_fds
      GLib::SListIterator(Void*, Pointer(Void)*).new(GLib::SList.new(to_unsafe.as(LibGLib::Source*).value.poll_fds.as(LibGLib::SList*)))
    end

    def prev
      GLib::Source.new(to_unsafe.as(LibGLib::Source*).value.prev)
    end

    def next
      GLib::Source.new(to_unsafe.as(LibGLib::Source*).value._next)
    end

    def priv
      GLib::SourcePrivate.new(to_unsafe.as(LibGLib::Source*).value.priv)
    end
  end

  class SourceCallbackFuncs
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGLib::SourceCallbackFuncs*))
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::SourceCallbackFuncs*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::SourceCallbackFuncs*)
    end

    def to_unsafe_sourcecallbackfuncs
      @pointer.not_nil!.as(LibGLib::SourceCallbackFuncs*)
    end

    def ref
      to_unsafe.as(LibGLib::SourceCallbackFuncs*).value.ref
    end

    def unref
      to_unsafe.as(LibGLib::SourceCallbackFuncs*).value.unref
    end

    def get
      to_unsafe.as(LibGLib::SourceCallbackFuncs*).value.get
    end
  end

  alias SourceDisposeFunc = LibGLib::SourceDisposeFunc
  alias SourceDummyMarshal = LibGLib::SourceDummyMarshal
  alias SourceFunc = LibGLib::SourceFunc

  class SourceFuncs
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(48u64, 0u8).as(LibGLib::SourceFuncs*))
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::SourceFuncs*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::SourceFuncs*)
    end

    def to_unsafe_sourcefuncs
      @pointer.not_nil!.as(LibGLib::SourceFuncs*)
    end

    def prepare
      to_unsafe.as(LibGLib::SourceFuncs*).value.prepare
    end

    def check
      to_unsafe.as(LibGLib::SourceFuncs*).value.check
    end

    def dispatch
      to_unsafe.as(LibGLib::SourceFuncs*).value.dispatch
    end

    def _finalize
      to_unsafe.as(LibGLib::SourceFuncs*).value.finalize
    end

    def closure_callback
      to_unsafe.as(LibGLib::SourceFuncs*).value.closure_callback
    end

    def closure_marshal
      to_unsafe.as(LibGLib::SourceFuncs*).value.closure_marshal
    end
  end

  class SourcePrivate
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::SourcePrivate*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::SourcePrivate*)
    end

    def to_unsafe_sourceprivate
      @pointer.not_nil!.as(LibGLib::SourcePrivate*)
    end
  end

  alias SpawnChildSetupFunc = LibGLib::SpawnChildSetupFunc

  enum SpawnError : UInt32
    FORK    = 0
    READ    = 1
    CHDIR   = 2
    ACCES   = 3
    PERM    = 4
    TOO_BIG = 5
    # 2BIG = 5
    NOEXEC      =  6
    NAMETOOLONG =  7
    NOENT       =  8
    NOMEM       =  9
    NOTDIR      = 10
    LOOP        = 11
    TXTBUSY     = 12
    IO          = 13
    NFILE       = 14
    MFILE       = 15
    INVAL       = 16
    ISDIR       = 17
    LIBBAD      = 18
    FAILED      = 19
  end

  @[Flags]
  enum SpawnFlags : UInt32
    DEFAULT                =   0
    LEAVE_DESCRIPTORS_OPEN =   1
    DO_NOT_REAP_CHILD      =   2
    SEARCH_PATH            =   4
    STDOUT_TO_DEV_NULL     =   8
    STDERR_TO_DEV_NULL     =  16
    CHILD_INHERITS_STDIN   =  32
    FILE_AND_ARGV_ZERO     =  64
    SEARCH_PATH_FROM_ENVP  = 128
    CLOEXEC_PIPES          = 256
  end

  class StatBuf
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::StatBuf*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::StatBuf*)
    end

    def to_unsafe_statbuf
      @pointer.not_nil!.as(LibGLib::StatBuf*)
    end
  end

  class String
    include GObject::WrappedType

    def self.new(str : ::String? = nil, len : UInt64? = nil, allocated_len : UInt64? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGLib::String*))
      __var0.str = str unless str.nil?
      __var0.len = len unless len.nil?
      __var0.allocated_len = allocated_len unless allocated_len.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::String*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::String*)
    end

    def to_unsafe_string
      @pointer.not_nil!.as(LibGLib::String*)
    end

    def append(val : ::String)
      __var0 = LibGLib.string_append(@pointer.as(LibGLib::String*), val.to_unsafe)
      GObject.raise_unexpected_null("g_string_append") if __var0.null?
      GLib::String.new(__var0)
    end

    def append_c(c : ::Int)
      __var0 = LibGLib.string_append_c(@pointer.as(LibGLib::String*), Int8.new(c))
      GObject.raise_unexpected_null("g_string_append_c") if __var0.null?
      GLib::String.new(__var0)
    end

    def append_len(val : ::String, len : ::Int)
      __var0 = LibGLib.string_append_len(@pointer.as(LibGLib::String*), val.to_unsafe, Int64.new(len))
      GObject.raise_unexpected_null("g_string_append_len") if __var0.null?
      GLib::String.new(__var0)
    end

    def append_unichar(wc : UInt8)
      __var0 = LibGLib.string_append_unichar(@pointer.as(LibGLib::String*), UInt8.new(wc))
      GObject.raise_unexpected_null("g_string_append_unichar") if __var0.null?
      GLib::String.new(__var0)
    end

    def append_uri_escaped(unescaped : ::String, reserved_chars_allowed : ::String, allow_utf8 : ::Bool)
      __var0 = LibGLib.string_append_uri_escaped(@pointer.as(LibGLib::String*), unescaped.to_unsafe, reserved_chars_allowed.to_unsafe, LibC::Int.new(allow_utf8 ? 1 : 0))
      GObject.raise_unexpected_null("g_string_append_uri_escaped") if __var0.null?
      GLib::String.new(__var0)
    end

    def ascii_down
      __var0 = LibGLib.string_ascii_down(@pointer.as(LibGLib::String*))
      GObject.raise_unexpected_null("g_string_ascii_down") if __var0.null?
      GLib::String.new(__var0)
    end

    def ascii_up
      __var0 = LibGLib.string_ascii_up(@pointer.as(LibGLib::String*))
      GObject.raise_unexpected_null("g_string_ascii_up") if __var0.null?
      GLib::String.new(__var0)
    end

    def assign(rval : ::String)
      __var0 = LibGLib.string_assign(@pointer.as(LibGLib::String*), rval.to_unsafe)
      GObject.raise_unexpected_null("g_string_assign") if __var0.null?
      GLib::String.new(__var0)
    end

    def down
      __var0 = LibGLib.string_down(@pointer.as(LibGLib::String*))
      GObject.raise_unexpected_null("g_string_down") if __var0.null?
      GLib::String.new(__var0)
    end

    def equal(v2 : GLib::String)
      __var0 = LibGLib.string_equal(@pointer.as(LibGLib::String*), v2.to_unsafe.as(LibGLib::String*))
      (__var0 == 1)
    end

    def erase(pos : ::Int, len : ::Int)
      __var0 = LibGLib.string_erase(@pointer.as(LibGLib::String*), Int64.new(pos), Int64.new(len))
      GObject.raise_unexpected_null("g_string_erase") if __var0.null?
      GLib::String.new(__var0)
    end

    def free(free_segment : ::Bool)
      __var0 = LibGLib.string_free(@pointer.as(LibGLib::String*), LibC::Int.new(free_segment ? 1 : 0))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def free_to_bytes
      __var0 = LibGLib.string_free_to_bytes(@pointer.as(LibGLib::String*))
      GObject.raise_unexpected_null("g_string_free_to_bytes") if __var0.null?
      GLib::Bytes.new(__var0)
    end

    def hash
      __var0 = LibGLib.string_hash(@pointer.as(LibGLib::String*))
      __var0
    end

    def insert(pos : ::Int, val : ::String)
      __var0 = LibGLib.string_insert(@pointer.as(LibGLib::String*), Int64.new(pos), val.to_unsafe)
      GObject.raise_unexpected_null("g_string_insert") if __var0.null?
      GLib::String.new(__var0)
    end

    def insert_c(pos : ::Int, c : ::Int)
      __var0 = LibGLib.string_insert_c(@pointer.as(LibGLib::String*), Int64.new(pos), Int8.new(c))
      GObject.raise_unexpected_null("g_string_insert_c") if __var0.null?
      GLib::String.new(__var0)
    end

    def insert_len(pos : ::Int, val : ::String, len : ::Int)
      __var0 = LibGLib.string_insert_len(@pointer.as(LibGLib::String*), Int64.new(pos), val.to_unsafe, Int64.new(len))
      GObject.raise_unexpected_null("g_string_insert_len") if __var0.null?
      GLib::String.new(__var0)
    end

    def insert_unichar(pos : ::Int, wc : UInt8)
      __var0 = LibGLib.string_insert_unichar(@pointer.as(LibGLib::String*), Int64.new(pos), UInt8.new(wc))
      GObject.raise_unexpected_null("g_string_insert_unichar") if __var0.null?
      GLib::String.new(__var0)
    end

    def overwrite(pos : ::Int, val : ::String)
      __var0 = LibGLib.string_overwrite(@pointer.as(LibGLib::String*), UInt64.new(pos), val.to_unsafe)
      GObject.raise_unexpected_null("g_string_overwrite") if __var0.null?
      GLib::String.new(__var0)
    end

    def overwrite_len(pos : ::Int, val : ::String, len : ::Int)
      __var0 = LibGLib.string_overwrite_len(@pointer.as(LibGLib::String*), UInt64.new(pos), val.to_unsafe, Int64.new(len))
      GObject.raise_unexpected_null("g_string_overwrite_len") if __var0.null?
      GLib::String.new(__var0)
    end

    def prepend(val : ::String)
      __var0 = LibGLib.string_prepend(@pointer.as(LibGLib::String*), val.to_unsafe)
      GObject.raise_unexpected_null("g_string_prepend") if __var0.null?
      GLib::String.new(__var0)
    end

    def prepend_c(c : ::Int)
      __var0 = LibGLib.string_prepend_c(@pointer.as(LibGLib::String*), Int8.new(c))
      GObject.raise_unexpected_null("g_string_prepend_c") if __var0.null?
      GLib::String.new(__var0)
    end

    def prepend_len(val : ::String, len : ::Int)
      __var0 = LibGLib.string_prepend_len(@pointer.as(LibGLib::String*), val.to_unsafe, Int64.new(len))
      GObject.raise_unexpected_null("g_string_prepend_len") if __var0.null?
      GLib::String.new(__var0)
    end

    def prepend_unichar(wc : UInt8)
      __var0 = LibGLib.string_prepend_unichar(@pointer.as(LibGLib::String*), UInt8.new(wc))
      GObject.raise_unexpected_null("g_string_prepend_unichar") if __var0.null?
      GLib::String.new(__var0)
    end

    def size=(len : ::Int)
      __var0 = LibGLib.string_set_size(@pointer.as(LibGLib::String*), UInt64.new(len))
      GObject.raise_unexpected_null("g_string_set_size") if __var0.null?
      GLib::String.new(__var0)
    end

    def truncate(len : ::Int)
      __var0 = LibGLib.string_truncate(@pointer.as(LibGLib::String*), UInt64.new(len))
      GObject.raise_unexpected_null("g_string_truncate") if __var0.null?
      GLib::String.new(__var0)
    end

    def up
      __var0 = LibGLib.string_up(@pointer.as(LibGLib::String*))
      GObject.raise_unexpected_null("g_string_up") if __var0.null?
      GLib::String.new(__var0)
    end

    def str
      ::String.new(to_unsafe.as(LibGLib::String*).value.str)
    end

    def str=(value : ::String)
      to_unsafe.as(LibGLib::String*).value.str = value.to_unsafe
    end

    def len
      to_unsafe.as(LibGLib::String*).value.len
    end

    def len=(value : UInt64)
      to_unsafe.as(LibGLib::String*).value.len = UInt64.new(value)
    end

    def allocated_len
      to_unsafe.as(LibGLib::String*).value.allocated_len
    end

    def allocated_len=(value : UInt64)
      to_unsafe.as(LibGLib::String*).value.allocated_len = UInt64.new(value)
    end
  end

  class StringChunk
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::StringChunk*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::StringChunk*)
    end

    def to_unsafe_stringchunk
      @pointer.not_nil!.as(LibGLib::StringChunk*)
    end

    def clear
      LibGLib.string_chunk_clear(@pointer.as(LibGLib::StringChunk*))
      nil
    end

    def free
      LibGLib.string_chunk_free(@pointer.as(LibGLib::StringChunk*))
      nil
    end

    def insert(string : ::String)
      __var0 = LibGLib.string_chunk_insert(@pointer.as(LibGLib::StringChunk*), string.to_unsafe)
      GObject.raise_unexpected_null("g_string_chunk_insert") if __var0.null?
      ::String.new(__var0)
    end

    def insert_const(string : ::String)
      __var0 = LibGLib.string_chunk_insert_const(@pointer.as(LibGLib::StringChunk*), string.to_unsafe)
      GObject.raise_unexpected_null("g_string_chunk_insert_const") if __var0.null?
      ::String.new(__var0)
    end

    def insert_len(string : ::String, len : ::Int)
      __var0 = LibGLib.string_chunk_insert_len(@pointer.as(LibGLib::StringChunk*), string.to_unsafe, Int64.new(len))
      GObject.raise_unexpected_null("g_string_chunk_insert_len") if __var0.null?
      ::String.new(__var0)
    end
  end

  class TestCase
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::TestCase*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::TestCase*)
    end

    def to_unsafe_testcase
      @pointer.not_nil!.as(LibGLib::TestCase*)
    end
  end

  class TestConfig
    include GObject::WrappedType

    def self.new(test_initialized : ::Bool? = nil, test_quick : ::Bool? = nil, test_perf : ::Bool? = nil, test_verbose : ::Bool? = nil, test_quiet : ::Bool? = nil, test_undefined : ::Bool? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGLib::TestConfig*))
      __var0.test_initialized = test_initialized unless test_initialized.nil?
      __var0.test_quick = test_quick unless test_quick.nil?
      __var0.test_perf = test_perf unless test_perf.nil?
      __var0.test_verbose = test_verbose unless test_verbose.nil?
      __var0.test_quiet = test_quiet unless test_quiet.nil?
      __var0.test_undefined = test_undefined unless test_undefined.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::TestConfig*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::TestConfig*)
    end

    def to_unsafe_testconfig
      @pointer.not_nil!.as(LibGLib::TestConfig*)
    end

    def test_initialized
      (to_unsafe.as(LibGLib::TestConfig*).value.test_initialized == 1)
    end

    def test_initialized=(value : ::Bool)
      to_unsafe.as(LibGLib::TestConfig*).value.test_initialized = LibC::Int.new(value ? 1 : 0)
    end

    def test_quick
      (to_unsafe.as(LibGLib::TestConfig*).value.test_quick == 1)
    end

    def test_quick=(value : ::Bool)
      to_unsafe.as(LibGLib::TestConfig*).value.test_quick = LibC::Int.new(value ? 1 : 0)
    end

    def test_perf
      (to_unsafe.as(LibGLib::TestConfig*).value.test_perf == 1)
    end

    def test_perf=(value : ::Bool)
      to_unsafe.as(LibGLib::TestConfig*).value.test_perf = LibC::Int.new(value ? 1 : 0)
    end

    def test_verbose
      (to_unsafe.as(LibGLib::TestConfig*).value.test_verbose == 1)
    end

    def test_verbose=(value : ::Bool)
      to_unsafe.as(LibGLib::TestConfig*).value.test_verbose = LibC::Int.new(value ? 1 : 0)
    end

    def test_quiet
      (to_unsafe.as(LibGLib::TestConfig*).value.test_quiet == 1)
    end

    def test_quiet=(value : ::Bool)
      to_unsafe.as(LibGLib::TestConfig*).value.test_quiet = LibC::Int.new(value ? 1 : 0)
    end

    def test_undefined
      (to_unsafe.as(LibGLib::TestConfig*).value.test_undefined == 1)
    end

    def test_undefined=(value : ::Bool)
      to_unsafe.as(LibGLib::TestConfig*).value.test_undefined = LibC::Int.new(value ? 1 : 0)
    end
  end

  alias TestDataFunc = LibGLib::TestDataFunc

  enum TestFileType : UInt32
    DIST  = 0
    BUILT = 1
  end
  alias TestFixtureFunc = LibGLib::TestFixtureFunc
  alias TestFunc = LibGLib::TestFunc

  class TestLogBuffer
    include GObject::WrappedType

    def self.new : self
      new(Pointer(UInt8).malloc(16u64, 0u8).as(LibGLib::TestLogBuffer*))
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::TestLogBuffer*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::TestLogBuffer*)
    end

    def to_unsafe_testlogbuffer
      @pointer.not_nil!.as(LibGLib::TestLogBuffer*)
    end

    def free
      LibGLib.test_log_buffer_free(@pointer.as(LibGLib::TestLogBuffer*))
      nil
    end

    def push(bytes : ::Int)
      __bytes = bytes
      n_bytes = __bytes_ary.size
      LibGLib.test_log_buffer_push(@pointer.as(LibGLib::TestLogBuffer*), UInt32.new(n_bytes), __bytes)
      nil
    end

    def data
      GLib::String.new(to_unsafe.as(LibGLib::TestLogBuffer*).value.data)
    end

    def msgs
      GLib::SListIterator(Void*, Pointer(Void)*).new(GLib::SList.new(to_unsafe.as(LibGLib::TestLogBuffer*).value.msgs.as(LibGLib::SList*)))
    end
  end

  alias TestLogFatalFunc = LibGLib::TestLogFatalFunc

  class TestLogMsg
    include GObject::WrappedType

    def self.new(log_type : GLib::TestLogType? = nil, n_strings : UInt32? = nil, strings : ::String? = nil, n_nums : UInt32? = nil, nums : Void*? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(32u64, 0u8).as(LibGLib::TestLogMsg*))
      __var0.log_type = log_type unless log_type.nil?
      __var0.n_strings = n_strings unless n_strings.nil?
      __var0.strings = strings unless strings.nil?
      __var0.n_nums = n_nums unless n_nums.nil?
      __var0.nums = nums unless nums.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::TestLogMsg*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::TestLogMsg*)
    end

    def to_unsafe_testlogmsg
      @pointer.not_nil!.as(LibGLib::TestLogMsg*)
    end

    def free
      LibGLib.test_log_msg_free(@pointer.as(LibGLib::TestLogMsg*))
      nil
    end

    def log_type
      GLib::TestLogType.new(to_unsafe.as(LibGLib::TestLogMsg*).value.log_type)
    end

    def log_type=(value : GLib::TestLogType)
      to_unsafe.as(LibGLib::TestLogMsg*).value.log_type = value
    end

    def n_strings
      to_unsafe.as(LibGLib::TestLogMsg*).value.n_strings
    end

    def n_strings=(value : UInt32)
      to_unsafe.as(LibGLib::TestLogMsg*).value.n_strings = UInt32.new(value)
    end

    def strings
      ::String.new(to_unsafe.as(LibGLib::TestLogMsg*).value.strings)
    end

    def strings=(value : ::String)
      to_unsafe.as(LibGLib::TestLogMsg*).value.strings = value.to_unsafe
    end

    def n_nums
      to_unsafe.as(LibGLib::TestLogMsg*).value.n_nums
    end

    def n_nums=(value : UInt32)
      to_unsafe.as(LibGLib::TestLogMsg*).value.n_nums = UInt32.new(value)
    end

    def nums
      to_unsafe.as(LibGLib::TestLogMsg*).value.nums
    end

    def nums=(value : Void*)
      to_unsafe.as(LibGLib::TestLogMsg*).value.nums = value
    end
  end

  enum TestLogType : UInt32
    NONE         =  0
    ERROR        =  1
    START_BINARY =  2
    LIST_CASE    =  3
    SKIP_CASE    =  4
    START_CASE   =  5
    STOP_CASE    =  6
    MIN_RESULT   =  7
    MAX_RESULT   =  8
    MESSAGE      =  9
    START_SUITE  = 10
    STOP_SUITE   = 11
  end

  enum TestResult : UInt32
    SUCCESS    = 0
    SKIPPED    = 1
    FAILURE    = 2
    INCOMPLETE = 3
  end

  @[Flags]
  enum TestSubprocessFlags : UInt32
    ZERO_NONE = 0
    STDIN     = 1
    STDOUT    = 2
    STDERR    = 4
  end

  class TestSuite
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::TestSuite*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::TestSuite*)
    end

    def to_unsafe_testsuite
      @pointer.not_nil!.as(LibGLib::TestSuite*)
    end

    def add(test_case : GLib::TestCase)
      LibGLib.test_suite_add(@pointer.as(LibGLib::TestSuite*), test_case.to_unsafe.as(LibGLib::TestCase*))
      nil
    end

    def add_suite(nestedsuite : GLib::TestSuite)
      LibGLib.test_suite_add_suite(@pointer.as(LibGLib::TestSuite*), nestedsuite.to_unsafe.as(LibGLib::TestSuite*))
      nil
    end
  end

  @[Flags]
  enum TestTrapFlags : UInt32
    ZERO_NONE      =   0
    SILENCE_STDOUT = 128
    SILENCE_STDERR = 256
    INHERIT_STDIN  = 512
  end

  class Thread
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::Thread*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Thread*)
    end

    def to_unsafe_thread
      @pointer.not_nil!.as(LibGLib::Thread*)
    end

    def join
      LibGLib.thread_join(@pointer.as(LibGLib::Thread*))
      nil
    end

    def ref
      __var0 = LibGLib.thread_ref(@pointer.as(LibGLib::Thread*))
      GObject.raise_unexpected_null("g_thread_ref") if __var0.null?
      GLib::Thread.new(__var0)
    end

    def unref
      LibGLib.thread_unref(@pointer.as(LibGLib::Thread*))
      nil
    end

    def self.error_quark
      __var0 = LibGLib.thread_error_quark
      __var0
    end

    def self.exit(retval : Void*?)
      LibGLib.thread_exit(retval ? retval : Pointer(Void).null)
      nil
    end

    def self.self
      __var0 = LibGLib.thread_self
      GObject.raise_unexpected_null("g_thread_self") if __var0.null?
      GLib::Thread.new(__var0)
    end

    def self.yield
      LibGLib.thread_yield
      nil
    end
  end

  enum ThreadError : UInt32
    THREAD_ERROR_AGAIN = 0
  end
  alias ThreadFunc = LibGLib::ThreadFunc

  class ThreadPool
    include GObject::WrappedType

    def self.new(func : GLib::Func? = nil, user_data : Void*? = nil, exclusive : ::Bool? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(24u64, 0u8).as(LibGLib::ThreadPool*))
      __var0.func = func unless func.nil?
      __var0.user_data = user_data unless user_data.nil?
      __var0.exclusive = exclusive unless exclusive.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::ThreadPool*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::ThreadPool*)
    end

    def to_unsafe_threadpool
      @pointer.not_nil!.as(LibGLib::ThreadPool*)
    end

    def free(immediate : ::Bool, wait_ : ::Bool)
      LibGLib.thread_pool_free(@pointer.as(LibGLib::ThreadPool*), LibC::Int.new(immediate ? 1 : 0), LibC::Int.new(wait_ ? 1 : 0))
      nil
    end

    def max_threads
      __var0 = LibGLib.thread_pool_get_max_threads(@pointer.as(LibGLib::ThreadPool*))
      __var0
    end

    def num_threads
      __var0 = LibGLib.thread_pool_get_num_threads(@pointer.as(LibGLib::ThreadPool*))
      __var0
    end

    def move_to_front(data : Void*?)
      __var0 = LibGLib.thread_pool_move_to_front(@pointer.as(LibGLib::ThreadPool*), data ? data : Pointer(Void).null)
      (__var0 == 1)
    end

    def push(data : Void*?)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.thread_pool_push(@pointer.as(LibGLib::ThreadPool*), data ? data : Pointer(Void).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def set_max_threads(max_threads : ::Int)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.thread_pool_set_max_threads(@pointer.as(LibGLib::ThreadPool*), Int32.new(max_threads), pointerof(__var0))
      GLib::Error.assert(__var0)
      (__var1 == 1)
    end

    def unprocessed
      __var0 = LibGLib.thread_pool_unprocessed(@pointer.as(LibGLib::ThreadPool*))
      __var0
    end

    def self.max_idle_time
      __var0 = LibGLib.thread_pool_get_max_idle_time
      __var0
    end

    def self.max_unused_threads
      __var0 = LibGLib.thread_pool_get_max_unused_threads
      __var0
    end

    def self.num_unused_threads
      __var0 = LibGLib.thread_pool_get_num_unused_threads
      __var0
    end

    def self.set_max_idle_time(interval : ::Int)
      LibGLib.thread_pool_set_max_idle_time(UInt32.new(interval))
      nil
    end

    def self.set_max_unused_threads(max_threads : ::Int)
      LibGLib.thread_pool_set_max_unused_threads(Int32.new(max_threads))
      nil
    end

    def self.stop_unused_threads
      LibGLib.thread_pool_stop_unused_threads
      nil
    end

    def func
      to_unsafe.as(LibGLib::ThreadPool*).value.func
    end

    def func=(value : GLib::Func)
      to_unsafe.as(LibGLib::ThreadPool*).value.func = value
    end

    def user_data
      to_unsafe.as(LibGLib::ThreadPool*).value.user_data
    end

    def user_data=(value : Void*)
      to_unsafe.as(LibGLib::ThreadPool*).value.user_data = value
    end

    def exclusive
      (to_unsafe.as(LibGLib::ThreadPool*).value.exclusive == 1)
    end

    def exclusive=(value : ::Bool)
      to_unsafe.as(LibGLib::ThreadPool*).value.exclusive = LibC::Int.new(value ? 1 : 0)
    end
  end

  enum TimeType : UInt32
    STANDARD  = 0
    DAYLIGHT  = 1
    UNIVERSAL = 2
  end

  class TimeVal
    include GObject::WrappedType

    def self.new(tv_sec : Int64? = nil, tv_usec : Int64? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(16u64, 0u8).as(LibGLib::TimeVal*))
      __var0.tv_sec = tv_sec unless tv_sec.nil?
      __var0.tv_usec = tv_usec unless tv_usec.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::TimeVal*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::TimeVal*)
    end

    def to_unsafe_timeval
      @pointer.not_nil!.as(LibGLib::TimeVal*)
    end

    def add(microseconds : ::Int)
      LibGLib.time_val_add(@pointer.as(LibGLib::TimeVal*), Int64.new(microseconds))
      nil
    end

    def to_iso8601
      __var0 = LibGLib.time_val_to_iso8601(@pointer.as(LibGLib::TimeVal*))
      __var1 = ::String.new(__var0) if __var0
      __var1
    end

    def self.from_iso8601(iso_date : ::String, time_ : GLib::TimeVal)
      __var0 = LibGLib.time_val_from_iso8601(iso_date.to_unsafe, time_)
      (__var0 == 1)
    end

    def tv_sec
      to_unsafe.as(LibGLib::TimeVal*).value.tv_sec
    end

    def tv_sec=(value : Int64)
      to_unsafe.as(LibGLib::TimeVal*).value.tv_sec = Int64.new(value)
    end

    def tv_usec
      to_unsafe.as(LibGLib::TimeVal*).value.tv_usec
    end

    def tv_usec=(value : Int64)
      to_unsafe.as(LibGLib::TimeVal*).value.tv_usec = Int64.new(value)
    end
  end

  class TimeZone
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::TimeZone*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::TimeZone*)
    end

    def to_unsafe_timezone
      @pointer.not_nil!.as(LibGLib::TimeZone*)
    end

    def self.new(identifier : ::String?) : self
      __var0 = LibGLib.time_zone_new(identifier ? identifier.to_unsafe : Pointer(UInt8).null)
      GObject.raise_unexpected_null("g_time_zone_new") if __var0.null?
      cast(GLib::TimeZone.new(__var0))
    end

    def self.new_local : self
      __var0 = LibGLib.time_zone_new_local
      GObject.raise_unexpected_null("g_time_zone_new_local") if __var0.null?
      cast(GLib::TimeZone.new(__var0))
    end

    def self.new_offset(seconds : ::Int) : self
      __var0 = LibGLib.time_zone_new_offset(Int32.new(seconds))
      GObject.raise_unexpected_null("g_time_zone_new_offset") if __var0.null?
      cast(GLib::TimeZone.new(__var0))
    end

    def self.new_utc : self
      __var0 = LibGLib.time_zone_new_utc
      GObject.raise_unexpected_null("g_time_zone_new_utc") if __var0.null?
      cast(GLib::TimeZone.new(__var0))
    end

    def adjust_time(type : GLib::TimeType, time_ : ::Int)
      __var0 = LibGLib.time_zone_adjust_time(@pointer.as(LibGLib::TimeZone*), type, time_)
      __var0
    end

    def find_interval(type : GLib::TimeType, time_ : ::Int)
      __var0 = LibGLib.time_zone_find_interval(@pointer.as(LibGLib::TimeZone*), type, Int64.new(time_))
      __var0
    end

    def abbreviation(interval : ::Int)
      __var0 = LibGLib.time_zone_get_abbreviation(@pointer.as(LibGLib::TimeZone*), Int32.new(interval))
      GObject.raise_unexpected_null("g_time_zone_get_abbreviation") if __var0.null?
      ::String.new(__var0)
    end

    def identifier
      __var0 = LibGLib.time_zone_get_identifier(@pointer.as(LibGLib::TimeZone*))
      GObject.raise_unexpected_null("g_time_zone_get_identifier") if __var0.null?
      ::String.new(__var0)
    end

    def offset(interval : ::Int)
      __var0 = LibGLib.time_zone_get_offset(@pointer.as(LibGLib::TimeZone*), Int32.new(interval))
      __var0
    end

    def dst?(interval : ::Int)
      __var0 = LibGLib.time_zone_is_dst(@pointer.as(LibGLib::TimeZone*), Int32.new(interval))
      (__var0 == 1)
    end

    def ref
      __var0 = LibGLib.time_zone_ref(@pointer.as(LibGLib::TimeZone*))
      GObject.raise_unexpected_null("g_time_zone_ref") if __var0.null?
      GLib::TimeZone.new(__var0)
    end

    def unref
      LibGLib.time_zone_unref(@pointer.as(LibGLib::TimeZone*))
      nil
    end
  end

  class Timer
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::Timer*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Timer*)
    end

    def to_unsafe_timer
      @pointer.not_nil!.as(LibGLib::Timer*)
    end

    def continue
      LibGLib.timer_continue(@pointer.as(LibGLib::Timer*))
      nil
    end

    def destroy
      LibGLib.timer_destroy(@pointer.as(LibGLib::Timer*))
      nil
    end

    def elapsed(microseconds : ::Int)
      __var0 = LibGLib.timer_elapsed(@pointer.as(LibGLib::Timer*), microseconds)
      __var0
    end

    def active?
      __var0 = LibGLib.timer_is_active(@pointer.as(LibGLib::Timer*))
      (__var0 == 1)
    end

    def reset
      LibGLib.timer_reset(@pointer.as(LibGLib::Timer*))
      nil
    end

    def start
      LibGLib.timer_start(@pointer.as(LibGLib::Timer*))
      nil
    end

    def stop
      LibGLib.timer_stop(@pointer.as(LibGLib::Timer*))
      nil
    end
  end

  enum TokenType : UInt32
    EOF             =   0
    LEFT_PAREN      =  40
    RIGHT_PAREN     =  41
    LEFT_CURLY      = 123
    RIGHT_CURLY     = 125
    LEFT_BRACE      =  91
    RIGHT_BRACE     =  93
    EQUAL_SIGN      =  61
    COMMA           =  44
    NONE            = 256
    ERROR           = 257
    CHAR            = 258
    BINARY          = 259
    OCTAL           = 260
    INT             = 261
    HEX             = 262
    FLOAT           = 263
    STRING          = 264
    SYMBOL          = 265
    IDENTIFIER      = 266
    IDENTIFIER_NULL = 267
    COMMENT_SINGLE  = 268
    COMMENT_MULTI   = 269
  end

  class TokenValue
    include GObject::WrappedType
    alias Union = TokenValue | Void* | ::String | UInt64 | UInt64 | UInt64 | UInt64 | Float64 | UInt64 | ::String | ::String | UInt8 | UInt32

    def v_symbol
      to_unsafe.as(LibGLib::TokenValue*).value.v_symbol
    end

    def v_identifier
      ::String.new(to_unsafe.as(LibGLib::TokenValue*).value.v_identifier)
    end

    def v_binary
      to_unsafe.as(LibGLib::TokenValue*).value.v_binary
    end

    def v_octal
      to_unsafe.as(LibGLib::TokenValue*).value.v_octal
    end

    def v_int
      to_unsafe.as(LibGLib::TokenValue*).value.v_int
    end

    def v_int64
      to_unsafe.as(LibGLib::TokenValue*).value.v_int64
    end

    def v_float
      to_unsafe.as(LibGLib::TokenValue*).value.v_float
    end

    def v_hex
      to_unsafe.as(LibGLib::TokenValue*).value.v_hex
    end

    def v_string
      ::String.new(to_unsafe.as(LibGLib::TokenValue*).value.v_string)
    end

    def v_comment
      ::String.new(to_unsafe.as(LibGLib::TokenValue*).value.v_comment)
    end

    def v_char
      to_unsafe.as(LibGLib::TokenValue*).value.v_char
    end

    def v_error
      to_unsafe.as(LibGLib::TokenValue*).value.v_error
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::TokenValue*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::TokenValue*)
    end

    def to_unsafe_tokenvalue
      @pointer.not_nil!.as(LibGLib::TokenValue*)
    end
  end

  alias TranslateFunc = LibGLib::TranslateFunc

  class TrashStack
    include GObject::WrappedType

    def self.new(next _next : GLib::TrashStack? = nil) : self
      __var0 = new(Pointer(UInt8).malloc(8u64, 0u8).as(LibGLib::TrashStack*))
      __var0.next = _next unless _next.nil?
      __var0
    end

    @pointer : Void*

    def initialize(pointer : LibGLib::TrashStack*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::TrashStack*)
    end

    def to_unsafe_trashstack
      @pointer.not_nil!.as(LibGLib::TrashStack*)
    end

    def self.height(stack_p : GLib::TrashStack)
      __var0 = LibGLib.trash_stack_height(stack_p.to_unsafe.as(LibGLib::TrashStack*))
      __var0
    end

    def self.peek(stack_p : GLib::TrashStack)
      LibGLib.trash_stack_peek(stack_p.to_unsafe.as(LibGLib::TrashStack*))
      nil
    end

    def self.pop(stack_p : GLib::TrashStack)
      LibGLib.trash_stack_pop(stack_p.to_unsafe.as(LibGLib::TrashStack*))
      nil
    end

    def self.push(stack_p : GLib::TrashStack, data_p : Void*)
      LibGLib.trash_stack_push(stack_p.to_unsafe.as(LibGLib::TrashStack*), data_p)
      nil
    end

    def next
      GLib::TrashStack.new(to_unsafe.as(LibGLib::TrashStack*).value._next)
    end

    def next=(value : GLib::TrashStack)
      to_unsafe.as(LibGLib::TrashStack*).value._next = value.to_unsafe.as(LibGLib::TrashStack*)
    end
  end

  @[Flags]
  enum TraverseFlags : UInt32
    ZERO_NONE  = 0
    LEAVES     = 1
    NON_LEAVES = 2
    ALL        = 3
    MASK       = 3
    LEAFS      = 1
    NON_LEAFS  = 2
  end
  alias TraverseFunc = LibGLib::TraverseFunc

  enum TraverseType : UInt32
    IN_ORDER    = 0
    PRE_ORDER   = 1
    POST_ORDER  = 2
    LEVEL_ORDER = 3
  end

  class Tree
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::Tree*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Tree*)
    end

    def to_unsafe_tree
      @pointer.not_nil!.as(LibGLib::Tree*)
    end

    def destroy
      LibGLib.tree_destroy(@pointer.as(LibGLib::Tree*))
      nil
    end

    def height
      __var0 = LibGLib.tree_height(@pointer.as(LibGLib::Tree*))
      __var0
    end

    def insert(key : Void*?, value : Void*?)
      LibGLib.tree_insert(@pointer.as(LibGLib::Tree*), key ? key : Pointer(Void).null, value ? value : Pointer(Void).null)
      nil
    end

    def lookup(key : Void*?)
      LibGLib.tree_lookup(@pointer.as(LibGLib::Tree*), key ? key : Pointer(Void).null)
      nil
    end

    def lookup_extended(lookup_key : Void*?, orig_key : Void*?, value : Void*?)
      __var0 = LibGLib.tree_lookup_extended(@pointer.as(LibGLib::Tree*), lookup_key ? lookup_key : Pointer(Void).null, orig_key, value)
      (__var0 == 1)
    end

    def nnodes
      __var0 = LibGLib.tree_nnodes(@pointer.as(LibGLib::Tree*))
      __var0
    end

    def remove(key : Void*?)
      __var0 = LibGLib.tree_remove(@pointer.as(LibGLib::Tree*), key ? key : Pointer(Void).null)
      (__var0 == 1)
    end

    def replace(key : Void*?, value : Void*?)
      LibGLib.tree_replace(@pointer.as(LibGLib::Tree*), key ? key : Pointer(Void).null, value ? value : Pointer(Void).null)
      nil
    end

    def steal(key : Void*?)
      __var0 = LibGLib.tree_steal(@pointer.as(LibGLib::Tree*), key ? key : Pointer(Void).null)
      (__var0 == 1)
    end

    def unref
      LibGLib.tree_unref(@pointer.as(LibGLib::Tree*))
      nil
    end
  end

  enum UnicodeBreakType : UInt32
    MANDATORY                    =  0
    CARRIAGE_RETURN              =  1
    LINE_FEED                    =  2
    COMBINING_MARK               =  3
    SURROGATE                    =  4
    ZERO_WIDTH_SPACE             =  5
    INSEPARABLE                  =  6
    NON_BREAKING_GLUE            =  7
    CONTINGENT                   =  8
    SPACE                        =  9
    AFTER                        = 10
    BEFORE                       = 11
    BEFORE_AND_AFTER             = 12
    HYPHEN                       = 13
    NON_STARTER                  = 14
    OPEN_PUNCTUATION             = 15
    CLOSE_PUNCTUATION            = 16
    QUOTATION                    = 17
    EXCLAMATION                  = 18
    IDEOGRAPHIC                  = 19
    NUMERIC                      = 20
    INFIX_SEPARATOR              = 21
    SYMBOL                       = 22
    ALPHABETIC                   = 23
    PREFIX                       = 24
    POSTFIX                      = 25
    COMPLEX_CONTEXT              = 26
    AMBIGUOUS                    = 27
    UNKNOWN                      = 28
    NEXT_LINE                    = 29
    WORD_JOINER                  = 30
    HANGUL_L_JAMO                = 31
    HANGUL_V_JAMO                = 32
    HANGUL_T_JAMO                = 33
    HANGUL_LV_SYLLABLE           = 34
    HANGUL_LVT_SYLLABLE          = 35
    CLOSE_PARANTHESIS            = 36
    CONDITIONAL_JAPANESE_STARTER = 37
    HEBREW_LETTER                = 38
    REGIONAL_INDICATOR           = 39
    EMOJI_BASE                   = 40
    EMOJI_MODIFIER               = 41
    ZERO_WIDTH_JOINER            = 42
  end

  enum UnicodeScript : Int32
    INVALID_CODE           =  -1
    COMMON                 =   0
    INHERITED              =   1
    ARABIC                 =   2
    ARMENIAN               =   3
    BENGALI                =   4
    BOPOMOFO               =   5
    CHEROKEE               =   6
    COPTIC                 =   7
    CYRILLIC               =   8
    DESERET                =   9
    DEVANAGARI             =  10
    ETHIOPIC               =  11
    GEORGIAN               =  12
    GOTHIC                 =  13
    GREEK                  =  14
    GUJARATI               =  15
    GURMUKHI               =  16
    HAN                    =  17
    HANGUL                 =  18
    HEBREW                 =  19
    HIRAGANA               =  20
    KANNADA                =  21
    KATAKANA               =  22
    KHMER                  =  23
    LAO                    =  24
    LATIN                  =  25
    MALAYALAM              =  26
    MONGOLIAN              =  27
    MYANMAR                =  28
    OGHAM                  =  29
    OLD_ITALIC             =  30
    ORIYA                  =  31
    RUNIC                  =  32
    SINHALA                =  33
    SYRIAC                 =  34
    TAMIL                  =  35
    TELUGU                 =  36
    THAANA                 =  37
    THAI                   =  38
    TIBETAN                =  39
    CANADIAN_ABORIGINAL    =  40
    YI                     =  41
    TAGALOG                =  42
    HANUNOO                =  43
    BUHID                  =  44
    TAGBANWA               =  45
    BRAILLE                =  46
    CYPRIOT                =  47
    LIMBU                  =  48
    OSMANYA                =  49
    SHAVIAN                =  50
    LINEAR_B               =  51
    TAI_LE                 =  52
    UGARITIC               =  53
    NEW_TAI_LUE            =  54
    BUGINESE               =  55
    GLAGOLITIC             =  56
    TIFINAGH               =  57
    SYLOTI_NAGRI           =  58
    OLD_PERSIAN            =  59
    KHAROSHTHI             =  60
    UNKNOWN                =  61
    BALINESE               =  62
    CUNEIFORM              =  63
    PHOENICIAN             =  64
    PHAGS_PA               =  65
    NKO                    =  66
    KAYAH_LI               =  67
    LEPCHA                 =  68
    REJANG                 =  69
    SUNDANESE              =  70
    SAURASHTRA             =  71
    CHAM                   =  72
    OL_CHIKI               =  73
    VAI                    =  74
    CARIAN                 =  75
    LYCIAN                 =  76
    LYDIAN                 =  77
    AVESTAN                =  78
    BAMUM                  =  79
    EGYPTIAN_HIEROGLYPHS   =  80
    IMPERIAL_ARAMAIC       =  81
    INSCRIPTIONAL_PAHLAVI  =  82
    INSCRIPTIONAL_PARTHIAN =  83
    JAVANESE               =  84
    KAITHI                 =  85
    LISU                   =  86
    MEETEI_MAYEK           =  87
    OLD_SOUTH_ARABIAN      =  88
    OLD_TURKIC             =  89
    SAMARITAN              =  90
    TAI_THAM               =  91
    TAI_VIET               =  92
    BATAK                  =  93
    BRAHMI                 =  94
    MANDAIC                =  95
    CHAKMA                 =  96
    MEROITIC_CURSIVE       =  97
    MEROITIC_HIEROGLYPHS   =  98
    MIAO                   =  99
    SHARADA                = 100
    SORA_SOMPENG           = 101
    TAKRI                  = 102
    BASSA_VAH              = 103
    CAUCASIAN_ALBANIAN     = 104
    DUPLOYAN               = 105
    ELBASAN                = 106
    GRANTHA                = 107
    KHOJKI                 = 108
    KHUDAWADI              = 109
    LINEAR_A               = 110
    MAHAJANI               = 111
    MANICHAEAN             = 112
    MENDE_KIKAKUI          = 113
    MODI                   = 114
    MRO                    = 115
    NABATAEAN              = 116
    OLD_NORTH_ARABIAN      = 117
    OLD_PERMIC             = 118
    PAHAWH_HMONG           = 119
    PALMYRENE              = 120
    PAU_CIN_HAU            = 121
    PSALTER_PAHLAVI        = 122
    SIDDHAM                = 123
    TIRHUTA                = 124
    WARANG_CITI            = 125
    AHOM                   = 126
    ANATOLIAN_HIEROGLYPHS  = 127
    HATRAN                 = 128
    MULTANI                = 129
    OLD_HUNGARIAN          = 130
    SIGNWRITING            = 131
    ADLAM                  = 132
    BHAIKSUKI              = 133
    MARCHEN                = 134
    NEWA                   = 135
    OSAGE                  = 136
    TANGUT                 = 137
    MASARAM_GONDI          = 138
    NUSHU                  = 139
    SOYOMBO                = 140
    ZANABAZAR_SQUARE       = 141
    DOGRA                  = 142
    GUNJALA_GONDI          = 143
    HANIFI_ROHINGYA        = 144
    MAKASAR                = 145
    MEDEFAIDRIN            = 146
    OLD_SOGDIAN            = 147
    SOGDIAN                = 148
    ELYMAIC                = 149
    NANDINAGARI            = 150
    NYIAKENG_PUACHUE_HMONG = 151
    WANCHO                 = 152
  end

  enum UnicodeType : UInt32
    CONTROL             =  0
    FORMAT              =  1
    UNASSIGNED          =  2
    PRIVATE_USE         =  3
    SURROGATE           =  4
    LOWERCASE_LETTER    =  5
    MODIFIER_LETTER     =  6
    OTHER_LETTER        =  7
    TITLECASE_LETTER    =  8
    UPPERCASE_LETTER    =  9
    SPACING_MARK        = 10
    ENCLOSING_MARK      = 11
    NON_SPACING_MARK    = 12
    DECIMAL_NUMBER      = 13
    LETTER_NUMBER       = 14
    OTHER_NUMBER        = 15
    CONNECT_PUNCTUATION = 16
    DASH_PUNCTUATION    = 17
    CLOSE_PUNCTUATION   = 18
    FINAL_PUNCTUATION   = 19
    INITIAL_PUNCTUATION = 20
    OTHER_PUNCTUATION   = 21
    OPEN_PUNCTUATION    = 22
    CURRENCY_SYMBOL     = 23
    MODIFIER_SYMBOL     = 24
    MATH_SYMBOL         = 25
    OTHER_SYMBOL        = 26
    LINE_SEPARATOR      = 27
    PARAGRAPH_SEPARATOR = 28
    SPACE_SEPARATOR     = 29
  end
  alias UnixFDSourceFunc = LibGLib::UnixFDSourceFunc

  enum UserDirectory : UInt32
    DIRECTORY_DESKTOP      = 0
    DIRECTORY_DOCUMENTS    = 1
    DIRECTORY_DOWNLOAD     = 2
    DIRECTORY_MUSIC        = 3
    DIRECTORY_PICTURES     = 4
    DIRECTORY_PUBLIC_SHARE = 5
    DIRECTORY_TEMPLATES    = 6
    DIRECTORY_VIDEOS       = 7
    N_DIRECTORIES          = 8
  end

  class Variant
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::Variant*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::Variant*)
    end

    def to_unsafe_variant
      @pointer.not_nil!.as(LibGLib::Variant*)
    end

    def self.new_array(child_type : GLib::VariantType?, children : ::Enumerable?) : self
      n_children = children ? children.size : 0
      if children
        __children = children ? (__children_ary = children.map { |__item| __item.to_unsafe.as(LibGLib::Variant*) }.to_a).to_unsafe : Pointer(Pointer(LibGLib::Variant)).null
        n_children = __children_ary.size
      else
        n_children = 0
      end

      __var0 = LibGLib.variant_new_array(child_type ? child_type.to_unsafe.as(LibGLib::VariantType*) : Pointer(LibGLib::VariantType).null, __children, UInt64.new(n_children))
      GObject.raise_unexpected_null("g_variant_new_array") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_boolean(value : ::Bool) : self
      __var0 = LibGLib.variant_new_boolean(LibC::Int.new(value ? 1 : 0))
      GObject.raise_unexpected_null("g_variant_new_boolean") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_byte(value : ::Int) : self
      __var0 = LibGLib.variant_new_byte(UInt8.new(value))
      GObject.raise_unexpected_null("g_variant_new_byte") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_bytestring(string : ::Bytes) : self
      __var0 = LibGLib.variant_new_bytestring(string.to_unsafe)
      GObject.raise_unexpected_null("g_variant_new_bytestring") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_bytestring_array(strv : ::Enumerable) : self
      length = strv.size
      __var0 = LibGLib.variant_new_bytestring_array((__strv_ary = strv.map { |__item| __item.to_unsafe }.to_a).to_unsafe, Int64.new(length))
      GObject.raise_unexpected_null("g_variant_new_bytestring_array") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_dict_entry(key : GLib::Variant, value : GLib::Variant) : self
      __var0 = LibGLib.variant_new_dict_entry(key.to_unsafe.as(LibGLib::Variant*), value.to_unsafe.as(LibGLib::Variant*))
      GObject.raise_unexpected_null("g_variant_new_dict_entry") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_double(value : ::Float) : self
      __var0 = LibGLib.variant_new_double(Float64.new(value))
      GObject.raise_unexpected_null("g_variant_new_double") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_fixed_array(element_type : GLib::VariantType, elements : Void*?, element_size : ::Int) : self
      if elements
        __elements = elements ? elements : Pointer(Void).null
        n_elements = __elements_ary.size
      else
        n_elements = 0
      end

      __var0 = LibGLib.variant_new_fixed_array(element_type.to_unsafe.as(LibGLib::VariantType*), __elements, UInt64.new(n_elements), UInt64.new(element_size))
      GObject.raise_unexpected_null("g_variant_new_fixed_array") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_from_bytes(type : GLib::VariantType, bytes : GLib::Bytes, trusted : ::Bool) : self
      __var0 = LibGLib.variant_new_from_bytes(type.to_unsafe.as(LibGLib::VariantType*), bytes.to_unsafe.as(LibGLib::Bytes*), LibC::Int.new(trusted ? 1 : 0))
      GObject.raise_unexpected_null("g_variant_new_from_bytes") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_from_data(type : GLib::VariantType, data : ::Bytes, trusted : ::Bool, notify : GLib::DestroyNotify, user_data : Void*?) : self
      size = data.size
      __var0 = LibGLib.variant_new_from_data(type.to_unsafe.as(LibGLib::VariantType*), data.to_unsafe, UInt64.new(size), LibC::Int.new(trusted ? 1 : 0), notify, user_data ? user_data : Pointer(Void).null)
      GObject.raise_unexpected_null("g_variant_new_from_data") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_handle(value : ::Int) : self
      __var0 = LibGLib.variant_new_handle(Int32.new(value))
      GObject.raise_unexpected_null("g_variant_new_handle") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_int16(value : ::Int) : self
      __var0 = LibGLib.variant_new_int16(Int16.new(value))
      GObject.raise_unexpected_null("g_variant_new_int16") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_int32(value : ::Int) : self
      __var0 = LibGLib.variant_new_int32(Int32.new(value))
      GObject.raise_unexpected_null("g_variant_new_int32") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_int64(value : ::Int) : self
      __var0 = LibGLib.variant_new_int64(Int64.new(value))
      GObject.raise_unexpected_null("g_variant_new_int64") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_maybe(child_type : GLib::VariantType?, child : GLib::Variant?) : self
      __var0 = LibGLib.variant_new_maybe(child_type ? child_type.to_unsafe.as(LibGLib::VariantType*) : Pointer(LibGLib::VariantType).null, child ? child.to_unsafe.as(LibGLib::Variant*) : Pointer(LibGLib::Variant).null)
      GObject.raise_unexpected_null("g_variant_new_maybe") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_object_path(object_path : ::String) : self
      __var0 = LibGLib.variant_new_object_path(object_path.to_unsafe)
      GObject.raise_unexpected_null("g_variant_new_object_path") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_objv(strv : ::Enumerable) : self
      length = strv.size
      __var0 = LibGLib.variant_new_objv((__strv_ary = strv.map { |__item| __item.to_unsafe }.to_a).to_unsafe, Int64.new(length))
      GObject.raise_unexpected_null("g_variant_new_objv") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_signature(signature : ::String) : self
      __var0 = LibGLib.variant_new_signature(signature.to_unsafe)
      GObject.raise_unexpected_null("g_variant_new_signature") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_string(string : ::String) : self
      __var0 = LibGLib.variant_new_string(string.to_unsafe)
      GObject.raise_unexpected_null("g_variant_new_string") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_strv(strv : ::Enumerable) : self
      length = strv.size
      __var0 = LibGLib.variant_new_strv((__strv_ary = strv.map { |__item| __item.to_unsafe }.to_a).to_unsafe, Int64.new(length))
      GObject.raise_unexpected_null("g_variant_new_strv") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_tuple(children : ::Enumerable) : self
      n_children = children.size
      __children = (__children_ary = children.map { |__item| __item.to_unsafe.as(LibGLib::Variant*) }.to_a).to_unsafe
      n_children = __children_ary.size
      __var0 = LibGLib.variant_new_tuple(__children, UInt64.new(n_children))
      GObject.raise_unexpected_null("g_variant_new_tuple") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_uint16(value : ::Int) : self
      __var0 = LibGLib.variant_new_uint16(UInt16.new(value))
      GObject.raise_unexpected_null("g_variant_new_uint16") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_uint32(value : ::Int) : self
      __var0 = LibGLib.variant_new_uint32(UInt32.new(value))
      GObject.raise_unexpected_null("g_variant_new_uint32") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_uint64(value : ::Int) : self
      __var0 = LibGLib.variant_new_uint64(UInt64.new(value))
      GObject.raise_unexpected_null("g_variant_new_uint64") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def self.new_variant(value : GLib::Variant) : self
      __var0 = LibGLib.variant_new_variant(value.to_unsafe.as(LibGLib::Variant*))
      GObject.raise_unexpected_null("g_variant_new_variant") if __var0.null?
      cast(GLib::Variant.new(__var0))
    end

    def byteswap
      __var0 = LibGLib.variant_byteswap(@pointer.as(LibGLib::Variant*))
      GObject.raise_unexpected_null("g_variant_byteswap") if __var0.null?
      GLib::Variant.new(__var0)
    end

    def check_format_string(format_string : ::String, copy_only : ::Bool)
      __var0 = LibGLib.variant_check_format_string(@pointer.as(LibGLib::Variant*), format_string.to_unsafe, LibC::Int.new(copy_only ? 1 : 0))
      (__var0 == 1)
    end

    def classify
      __var0 = LibGLib.variant_classify(@pointer.as(LibGLib::Variant*))
      GLib::VariantClass.new(__var0)
    end

    def compare(two : GLib::Variant)
      __var0 = LibGLib.variant_compare(@pointer.as(LibGLib::Variant*), two.to_unsafe.as(LibGLib::Variant*))
      __var0
    end

    def dup_bytestring
      __var0 = LibGLib.variant_dup_bytestring(@pointer.as(LibGLib::Variant*), out length)
      GObject.raise_unexpected_null("g_variant_dup_bytestring") if __var0.null?
      {GObject::PointerIterator.new(__var0) { |__var1|
        __var1
      }, length}
    end

    def dup_bytestring_array
      __var0 = LibGLib.variant_dup_bytestring_array(@pointer.as(LibGLib::Variant*), out length)
      GObject.raise_unexpected_null("g_variant_dup_bytestring_array") if __var0.null?
      {GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      }, length}
    end

    def dup_objv
      __var0 = LibGLib.variant_dup_objv(@pointer.as(LibGLib::Variant*), out length)
      GObject.raise_unexpected_null("g_variant_dup_objv") if __var0.null?
      {GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      }, length}
    end

    def dup_string
      __var0 = LibGLib.variant_dup_string(@pointer.as(LibGLib::Variant*), out length)
      GObject.raise_unexpected_null("g_variant_dup_string") if __var0.null?
      {::String.new(__var0), length}
    end

    def dup_strv
      __var0 = LibGLib.variant_dup_strv(@pointer.as(LibGLib::Variant*), out length)
      GObject.raise_unexpected_null("g_variant_dup_strv") if __var0.null?
      {GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      }, length}
    end

    def equal(two : GLib::Variant)
      __var0 = LibGLib.variant_equal(@pointer.as(LibGLib::Variant*), two.to_unsafe.as(LibGLib::Variant*))
      (__var0 == 1)
    end

    def boolean
      __var0 = LibGLib.variant_get_boolean(@pointer.as(LibGLib::Variant*))
      (__var0 == 1)
    end

    def byte
      __var0 = LibGLib.variant_get_byte(@pointer.as(LibGLib::Variant*))
      __var0
    end

    def bytestring
      __var0 = LibGLib.variant_get_bytestring(@pointer.as(LibGLib::Variant*))
      GObject.raise_unexpected_null("g_variant_get_bytestring") if __var0.null?
      GObject::PointerIterator.new(__var0) { |__var1|
        __var1
      }
    end

    def bytestring_array
      __var0 = LibGLib.variant_get_bytestring_array(@pointer.as(LibGLib::Variant*), out length)
      GObject.raise_unexpected_null("g_variant_get_bytestring_array") if __var0.null?
      {GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      }, length}
    end

    def child_value(index_ : ::Int)
      __var0 = LibGLib.variant_get_child_value(@pointer.as(LibGLib::Variant*), UInt64.new(index_))
      GObject.raise_unexpected_null("g_variant_get_child_value") if __var0.null?
      GLib::Variant.new(__var0)
    end

    def data
      LibGLib.variant_get_data(@pointer.as(LibGLib::Variant*))
      nil
    end

    def data_as_bytes
      __var0 = LibGLib.variant_get_data_as_bytes(@pointer.as(LibGLib::Variant*))
      GObject.raise_unexpected_null("g_variant_get_data_as_bytes") if __var0.null?
      GLib::Bytes.new(__var0)
    end

    def double
      __var0 = LibGLib.variant_get_double(@pointer.as(LibGLib::Variant*))
      __var0
    end

    def handle
      __var0 = LibGLib.variant_get_handle(@pointer.as(LibGLib::Variant*))
      __var0
    end

    def int16
      __var0 = LibGLib.variant_get_int16(@pointer.as(LibGLib::Variant*))
      __var0
    end

    def int32
      __var0 = LibGLib.variant_get_int32(@pointer.as(LibGLib::Variant*))
      __var0
    end

    def int64
      __var0 = LibGLib.variant_get_int64(@pointer.as(LibGLib::Variant*))
      __var0
    end

    def maybe
      __var0 = LibGLib.variant_get_maybe(@pointer.as(LibGLib::Variant*))
      __var1 = GLib::Variant.new(__var0) if __var0
      __var1
    end

    def normal_form
      __var0 = LibGLib.variant_get_normal_form(@pointer.as(LibGLib::Variant*))
      GObject.raise_unexpected_null("g_variant_get_normal_form") if __var0.null?
      GLib::Variant.new(__var0)
    end

    def objv
      __var0 = LibGLib.variant_get_objv(@pointer.as(LibGLib::Variant*), out length)
      GObject.raise_unexpected_null("g_variant_get_objv") if __var0.null?
      {GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      }, length}
    end

    def size
      __var0 = LibGLib.variant_get_size(@pointer.as(LibGLib::Variant*))
      __var0
    end

    def string
      __var0 = LibGLib.variant_get_string(@pointer.as(LibGLib::Variant*), out length)
      GObject.raise_unexpected_null("g_variant_get_string") if __var0.null?
      {::String.new(__var0), length}
    end

    def strv
      __var0 = LibGLib.variant_get_strv(@pointer.as(LibGLib::Variant*), out length)
      GObject.raise_unexpected_null("g_variant_get_strv") if __var0.null?
      {GObject::PointerIterator.new(__var0) { |__var1|
        ::String.new(__var1)
      }, length}
    end

    def type
      __var0 = LibGLib.variant_get_type(@pointer.as(LibGLib::Variant*))
      GObject.raise_unexpected_null("g_variant_get_type") if __var0.null?
      GLib::VariantType.new(__var0)
    end

    def type_string
      __var0 = LibGLib.variant_get_type_string(@pointer.as(LibGLib::Variant*))
      GObject.raise_unexpected_null("g_variant_get_type_string") if __var0.null?
      ::String.new(__var0)
    end

    def uint16
      __var0 = LibGLib.variant_get_uint16(@pointer.as(LibGLib::Variant*))
      __var0
    end

    def uint32
      __var0 = LibGLib.variant_get_uint32(@pointer.as(LibGLib::Variant*))
      __var0
    end

    def uint64
      __var0 = LibGLib.variant_get_uint64(@pointer.as(LibGLib::Variant*))
      __var0
    end

    def variant
      __var0 = LibGLib.variant_get_variant(@pointer.as(LibGLib::Variant*))
      GObject.raise_unexpected_null("g_variant_get_variant") if __var0.null?
      GLib::Variant.new(__var0)
    end

    def hash
      __var0 = LibGLib.variant_hash(@pointer.as(LibGLib::Variant*))
      __var0
    end

    def container?
      __var0 = LibGLib.variant_is_container(@pointer.as(LibGLib::Variant*))
      (__var0 == 1)
    end

    def floating?
      __var0 = LibGLib.variant_is_floating(@pointer.as(LibGLib::Variant*))
      (__var0 == 1)
    end

    def normal_form?
      __var0 = LibGLib.variant_is_normal_form(@pointer.as(LibGLib::Variant*))
      (__var0 == 1)
    end

    def of_type?(type : GLib::VariantType)
      __var0 = LibGLib.variant_is_of_type(@pointer.as(LibGLib::Variant*), type.to_unsafe.as(LibGLib::VariantType*))
      (__var0 == 1)
    end

    def lookup_value(key : ::String, expected_type : GLib::VariantType?)
      __var0 = LibGLib.variant_lookup_value(@pointer.as(LibGLib::Variant*), key.to_unsafe, expected_type ? expected_type.to_unsafe.as(LibGLib::VariantType*) : Pointer(LibGLib::VariantType).null)
      GObject.raise_unexpected_null("g_variant_lookup_value") if __var0.null?
      GLib::Variant.new(__var0)
    end

    def n_children
      __var0 = LibGLib.variant_n_children(@pointer.as(LibGLib::Variant*))
      __var0
    end

    def print(type_annotate : ::Bool)
      __var0 = LibGLib.variant_print(@pointer.as(LibGLib::Variant*), LibC::Int.new(type_annotate ? 1 : 0))
      GObject.raise_unexpected_null("g_variant_print") if __var0.null?
      ::String.new(__var0)
    end

    def ref
      __var0 = LibGLib.variant_ref(@pointer.as(LibGLib::Variant*))
      GObject.raise_unexpected_null("g_variant_ref") if __var0.null?
      GLib::Variant.new(__var0)
    end

    def ref_sink
      __var0 = LibGLib.variant_ref_sink(@pointer.as(LibGLib::Variant*))
      GObject.raise_unexpected_null("g_variant_ref_sink") if __var0.null?
      GLib::Variant.new(__var0)
    end

    def store(data : Void*)
      LibGLib.variant_store(@pointer.as(LibGLib::Variant*), data)
      nil
    end

    def take_ref
      __var0 = LibGLib.variant_take_ref(@pointer.as(LibGLib::Variant*))
      GObject.raise_unexpected_null("g_variant_take_ref") if __var0.null?
      GLib::Variant.new(__var0)
    end

    def unref
      LibGLib.variant_unref(@pointer.as(LibGLib::Variant*))
      nil
    end

    def self.object_path?(string : ::String)
      __var0 = LibGLib.variant_is_object_path(string.to_unsafe)
      (__var0 == 1)
    end

    def self.signature?(string : ::String)
      __var0 = LibGLib.variant_is_signature(string.to_unsafe)
      (__var0 == 1)
    end

    def self.parse(type : GLib::VariantType?, text : ::String, limit : ::String?, endptr : ::String?)
      __var0 = Pointer(LibGLib::Error).null
      __var1 = LibGLib.variant_parse(type ? type.to_unsafe.as(LibGLib::VariantType*) : Pointer(LibGLib::VariantType).null, text.to_unsafe, limit ? limit.to_unsafe : Pointer(UInt8).null, endptr ? endptr.to_unsafe : Pointer(UInt8).null, pointerof(__var0))
      GLib::Error.assert(__var0)
      GObject.raise_unexpected_null("g_variant_parse") if __var1.null?
      GLib::Variant.new(__var1)
    end

    def self.parse_error_print_context(error : LibGLib::Error*, source_str : ::String)
      __var0 = LibGLib.variant_parse_error_print_context(error, source_str.to_unsafe)
      GObject.raise_unexpected_null("g_variant_parse_error_print_context") if __var0.null?
      ::String.new(__var0)
    end

    def self.parse_error_quark
      __var0 = LibGLib.variant_parse_error_quark
      __var0
    end

    def self.parser_get_error_quark
      __var0 = LibGLib.variant_parser_get_error_quark
      __var0
    end
  end

  class VariantBuilder
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::VariantBuilder*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::VariantBuilder*)
    end

    def to_unsafe_variantbuilder
      @pointer.not_nil!.as(LibGLib::VariantBuilder*)
    end

    def self.new(type : GLib::VariantType) : self
      __var0 = LibGLib.variant_builder_new(type.to_unsafe.as(LibGLib::VariantType*))
      GObject.raise_unexpected_null("g_variant_builder_new") if __var0.null?
      cast(GLib::VariantBuilder.new(__var0))
    end

    def add_value(value : GLib::Variant)
      LibGLib.variant_builder_add_value(@pointer.as(LibGLib::VariantBuilder*), value.to_unsafe.as(LibGLib::Variant*))
      nil
    end

    def close
      LibGLib.variant_builder_close(@pointer.as(LibGLib::VariantBuilder*))
      nil
    end

    def end
      __var0 = LibGLib.variant_builder_end(@pointer.as(LibGLib::VariantBuilder*))
      GObject.raise_unexpected_null("g_variant_builder_end") if __var0.null?
      GLib::Variant.new(__var0)
    end

    def open(type : GLib::VariantType)
      LibGLib.variant_builder_open(@pointer.as(LibGLib::VariantBuilder*), type.to_unsafe.as(LibGLib::VariantType*))
      nil
    end

    def ref
      __var0 = LibGLib.variant_builder_ref(@pointer.as(LibGLib::VariantBuilder*))
      GObject.raise_unexpected_null("g_variant_builder_ref") if __var0.null?
      GLib::VariantBuilder.new(__var0)
    end

    def unref
      LibGLib.variant_builder_unref(@pointer.as(LibGLib::VariantBuilder*))
      nil
    end
  end

  enum VariantClass : UInt32
    ZERO_NONE   =   0
    BOOLEAN     =  98
    BYTE        = 121
    INT16       = 110
    UINT16      = 113
    INT32       = 105
    UINT32      = 117
    INT64       = 120
    UINT64      = 116
    HANDLE      = 104
    DOUBLE      = 100
    STRING      = 115
    OBJECT_PATH = 111
    SIGNATURE   = 103
    VARIANT     = 118
    MAYBE       = 109
    ARRAY       =  97
    TUPLE       =  40
    DICT_ENTRY  = 123
  end

  class VariantDict
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::VariantDict*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::VariantDict*)
    end

    def to_unsafe_variantdict
      @pointer.not_nil!.as(LibGLib::VariantDict*)
    end

    def self.new(from_asv : GLib::Variant?) : self
      __var0 = LibGLib.variant_dict_new(from_asv ? from_asv.to_unsafe.as(LibGLib::Variant*) : Pointer(LibGLib::Variant).null)
      GObject.raise_unexpected_null("g_variant_dict_new") if __var0.null?
      cast(GLib::VariantDict.new(__var0))
    end

    def clear
      LibGLib.variant_dict_clear(@pointer.as(LibGLib::VariantDict*))
      nil
    end

    def contains(key : ::String)
      __var0 = LibGLib.variant_dict_contains(@pointer.as(LibGLib::VariantDict*), key.to_unsafe)
      (__var0 == 1)
    end

    def end
      __var0 = LibGLib.variant_dict_end(@pointer.as(LibGLib::VariantDict*))
      GObject.raise_unexpected_null("g_variant_dict_end") if __var0.null?
      GLib::Variant.new(__var0)
    end

    def insert_value(key : ::String, value : GLib::Variant)
      LibGLib.variant_dict_insert_value(@pointer.as(LibGLib::VariantDict*), key.to_unsafe, value.to_unsafe.as(LibGLib::Variant*))
      nil
    end

    def lookup_value(key : ::String, expected_type : GLib::VariantType?)
      __var0 = LibGLib.variant_dict_lookup_value(@pointer.as(LibGLib::VariantDict*), key.to_unsafe, expected_type ? expected_type.to_unsafe.as(LibGLib::VariantType*) : Pointer(LibGLib::VariantType).null)
      GObject.raise_unexpected_null("g_variant_dict_lookup_value") if __var0.null?
      GLib::Variant.new(__var0)
    end

    def ref
      __var0 = LibGLib.variant_dict_ref(@pointer.as(LibGLib::VariantDict*))
      GObject.raise_unexpected_null("g_variant_dict_ref") if __var0.null?
      GLib::VariantDict.new(__var0)
    end

    def remove(key : ::String)
      __var0 = LibGLib.variant_dict_remove(@pointer.as(LibGLib::VariantDict*), key.to_unsafe)
      (__var0 == 1)
    end

    def unref
      LibGLib.variant_dict_unref(@pointer.as(LibGLib::VariantDict*))
      nil
    end
  end

  enum VariantParseError : UInt32
    FAILED                       =  0
    BASIC_TYPE_EXPECTED          =  1
    CANNOT_INFER_TYPE            =  2
    DEFINITE_TYPE_EXPECTED       =  3
    INPUT_NOT_AT_END             =  4
    INVALID_CHARACTER            =  5
    INVALID_FORMAT_STRING        =  6
    INVALID_OBJECT_PATH          =  7
    INVALID_SIGNATURE            =  8
    INVALID_TYPE_STRING          =  9
    NO_COMMON_TYPE               = 10
    NUMBER_OUT_OF_RANGE          = 11
    NUMBER_TOO_BIG               = 12
    TYPE_ERROR                   = 13
    UNEXPECTED_TOKEN             = 14
    UNKNOWN_KEYWORD              = 15
    UNTERMINATED_STRING_CONSTANT = 16
    VALUE_EXPECTED               = 17
    RECURSION                    = 18
  end

  class VariantType
    include GObject::WrappedType

    @pointer : Void*

    def initialize(pointer : LibGLib::VariantType*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGLib::VariantType*)
    end

    def to_unsafe_varianttype
      @pointer.not_nil!.as(LibGLib::VariantType*)
    end

    def self.new(type_string : ::String) : self
      __var0 = LibGLib.variant_type_new(type_string.to_unsafe)
      GObject.raise_unexpected_null("g_variant_type_new") if __var0.null?
      cast(GLib::VariantType.new(__var0))
    end

    def self.new_array(element : GLib::VariantType) : self
      __var0 = LibGLib.variant_type_new_array(element.to_unsafe.as(LibGLib::VariantType*))
      GObject.raise_unexpected_null("g_variant_type_new_array") if __var0.null?
      cast(GLib::VariantType.new(__var0))
    end

    def self.new_dict_entry(key : GLib::VariantType, value : GLib::VariantType) : self
      __var0 = LibGLib.variant_type_new_dict_entry(key.to_unsafe.as(LibGLib::VariantType*), value.to_unsafe.as(LibGLib::VariantType*))
      GObject.raise_unexpected_null("g_variant_type_new_dict_entry") if __var0.null?
      cast(GLib::VariantType.new(__var0))
    end

    def self.new_maybe(element : GLib::VariantType) : self
      __var0 = LibGLib.variant_type_new_maybe(element.to_unsafe.as(LibGLib::VariantType*))
      GObject.raise_unexpected_null("g_variant_type_new_maybe") if __var0.null?
      cast(GLib::VariantType.new(__var0))
    end

    def self.new_tuple(items : ::Enumerable) : self
      length = items.size
      __var0 = LibGLib.variant_type_new_tuple((__items_ary = items.map { |__item| __item.to_unsafe.as(LibGLib::VariantType*) }.to_a).to_unsafe, Int32.new(length))
      GObject.raise_unexpected_null("g_variant_type_new_tuple") if __var0.null?
      cast(GLib::VariantType.new(__var0))
    end

    def copy
      __var0 = LibGLib.variant_type_copy(@pointer.as(LibGLib::VariantType*))
      GObject.raise_unexpected_null("g_variant_type_copy") if __var0.null?
      GLib::VariantType.new(__var0)
    end

    def dup_string
      __var0 = LibGLib.variant_type_dup_string(@pointer.as(LibGLib::VariantType*))
      GObject.raise_unexpected_null("g_variant_type_dup_string") if __var0.null?
      ::String.new(__var0)
    end

    def element
      __var0 = LibGLib.variant_type_element(@pointer.as(LibGLib::VariantType*))
      GObject.raise_unexpected_null("g_variant_type_element") if __var0.null?
      GLib::VariantType.new(__var0)
    end

    def equal(type2 : GLib::VariantType)
      __var0 = LibGLib.variant_type_equal(@pointer.as(LibGLib::VariantType*), type2.to_unsafe.as(LibGLib::VariantType*))
      (__var0 == 1)
    end

    def first
      __var0 = LibGLib.variant_type_first(@pointer.as(LibGLib::VariantType*))
      GObject.raise_unexpected_null("g_variant_type_first") if __var0.null?
      GLib::VariantType.new(__var0)
    end

    def free
      LibGLib.variant_type_free(@pointer.as(LibGLib::VariantType*))
      nil
    end

    def string_length
      __var0 = LibGLib.variant_type_get_string_length(@pointer.as(LibGLib::VariantType*))
      __var0
    end

    def hash
      __var0 = LibGLib.variant_type_hash(@pointer.as(LibGLib::VariantType*))
      __var0
    end

    def array?
      __var0 = LibGLib.variant_type_is_array(@pointer.as(LibGLib::VariantType*))
      (__var0 == 1)
    end

    def basic?
      __var0 = LibGLib.variant_type_is_basic(@pointer.as(LibGLib::VariantType*))
      (__var0 == 1)
    end

    def container?
      __var0 = LibGLib.variant_type_is_container(@pointer.as(LibGLib::VariantType*))
      (__var0 == 1)
    end

    def definite?
      __var0 = LibGLib.variant_type_is_definite(@pointer.as(LibGLib::VariantType*))
      (__var0 == 1)
    end

    def dict_entry?
      __var0 = LibGLib.variant_type_is_dict_entry(@pointer.as(LibGLib::VariantType*))
      (__var0 == 1)
    end

    def maybe?
      __var0 = LibGLib.variant_type_is_maybe(@pointer.as(LibGLib::VariantType*))
      (__var0 == 1)
    end

    def subtype_of?(supertype : GLib::VariantType)
      __var0 = LibGLib.variant_type_is_subtype_of(@pointer.as(LibGLib::VariantType*), supertype.to_unsafe.as(LibGLib::VariantType*))
      (__var0 == 1)
    end

    def tuple?
      __var0 = LibGLib.variant_type_is_tuple(@pointer.as(LibGLib::VariantType*))
      (__var0 == 1)
    end

    def variant?
      __var0 = LibGLib.variant_type_is_variant(@pointer.as(LibGLib::VariantType*))
      (__var0 == 1)
    end

    def key
      __var0 = LibGLib.variant_type_key(@pointer.as(LibGLib::VariantType*))
      GObject.raise_unexpected_null("g_variant_type_key") if __var0.null?
      GLib::VariantType.new(__var0)
    end

    def n_items
      __var0 = LibGLib.variant_type_n_items(@pointer.as(LibGLib::VariantType*))
      __var0
    end

    def next
      __var0 = LibGLib.variant_type_next(@pointer.as(LibGLib::VariantType*))
      GObject.raise_unexpected_null("g_variant_type_next") if __var0.null?
      GLib::VariantType.new(__var0)
    end

    def value
      __var0 = LibGLib.variant_type_value(@pointer.as(LibGLib::VariantType*))
      GObject.raise_unexpected_null("g_variant_type_value") if __var0.null?
      GLib::VariantType.new(__var0)
    end

    def self.checked_(arg0 : ::String)
      __var0 = LibGLib.variant_type_checked_(arg0.to_unsafe)
      GObject.raise_unexpected_null("g_variant_type_checked_") if __var0.null?
      GLib::VariantType.new(__var0)
    end

    def self.string_get_depth_(type_string : ::String)
      __var0 = LibGLib.variant_type_string_get_depth_(type_string.to_unsafe)
      __var0
    end

    def self.string_is_valid(type_string : ::String)
      __var0 = LibGLib.variant_type_string_is_valid(type_string.to_unsafe)
      (__var0 == 1)
    end

    def self.string_scan(string : ::String, limit : ::String?)
      __var0 = LibGLib.variant_type_string_scan(string.to_unsafe, limit ? limit.to_unsafe : Pointer(UInt8).null, out endptr)
      {(__var0 == 1), ::String.new(endptr)}
    end
  end

  alias VoidFunc = LibGLib::VoidFunc
end
