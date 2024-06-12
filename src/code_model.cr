require "./code_symbol"

# Code model is just a container of symbols in the project
# classes, functions, etc...
#
# Initially there will be just 2 code models
#
# EmptyCodeModel: the default do-nothing code model.
# LameRegexCrystalCodeModel: A lame code model that just run a basic regex to
#                            fetch class and function definitions, so I can have
#                            something to test UIX
# The future:
#
# - LSPCodeModel: A code model backed by a LSP-client
# - TreeSitterCodeModel: A code model backed by tree-sitter parsers
# - Throw away the LameRegexCrystalCodeModel.
abstract class CodeModel
  def file_opened(source : Path) : Nil
  end

  def file_closed(source : Path) : Nil
  end

  def insert_text(source : Path, text : String, offset : Int64, len : Int64)
  end

  def delete_text(source : Path, offset : Int64, len : Int64)
  end

  abstract def resource_symbols(source : Path) : Array(CodeSymbol)

  abstract def find_symbols(name : String) : Array(CodeSymbol)
end
