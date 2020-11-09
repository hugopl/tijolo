@[Link("editorconfig", pkg_config: "editorconfig")]
lib LibEditorConfig
  fun handle_init = editorconfig_handle_init : Void*
  fun handle_destroy = editorconfig_handle_destroy(handle : Void*) : Int32
  fun name_value_count = editorconfig_handle_get_name_value_count(Void*) : Int32
  fun name_value = editorconfig_handle_get_name_value(handle : Void*, n : Int32, name : UInt8**, value : UInt8**) : Void
  fun parse = editorconfig_parse(full_filename : UInt8*, handle : Void*) : Int32
end

module EditorConfig
  class Error < RuntimeError
  end

  INDENT_STYLE             = "indent_style"
  INDENT_SIZE              = "indent_size"
  TAB_WIDTH                = "tab_width"
  END_OF_LINE              = "end_of_line"
  CHARSET                  = "charset"
  TRIM_TRAILING_WHITESPACE = "trim_trailing_whitespace"
  INSERT_FINAL_NEWLINE     = "insert_final_newline"
  MAX_LINE_LENGTH          = "max_line_length"

  def parse(file_path : String)
    parse(Path.new(file_path))
  end

  def parse(file_path : Path) : Hash(String, String)
    file_path = file_path.expand unless file_path.absolute?

    handle = LibEditorConfig.handle_init
    raise Error.new("Failed to create editorconfig handle") if handle.nil?

    err = LibEditorConfig.parse(file_path.to_s, handle)
    raise Error.new("Error parsing file") if err < 0

    n = LibEditorConfig.name_value_count(handle)
    Hash(String, String).new(initial_capacity: n).tap do |hash|
      n.times do |i|
        LibEditorConfig.name_value(handle, i, out name_ptr, out value_ptr)
        hash[String.new(name_ptr)] = String.new(value_ptr)
      end
    end
  ensure
    LibEditorConfig.handle_destroy(handle) unless handle.nil?
  end

  extend self
end
