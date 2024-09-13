require "./code_model"

# Missing things
# - Update model when file gets updated.
# - Parse entire project
# - Thrown all this away and write a generic tree-sitter code model
class LameRegexCrystalCodeModel < CodeModel
  Log = ::Log.for(LameRegexCrystalCodeModel)

  METHOD_REGEX    = /\A\s*(?:abstract |private |protected )?\s*def\s+((?:self\.)?\w[\w+\d+]*[!\?=]*)/
  MACRO_REGEX     = /\A\s*macro\s+(\w[\w+\d+]*[!\?]*)/
  SPEC_TEST_REGEX = /\A\s*it\s*(.*)do\s*\z/

  @symbols = Hash(String, Array(CodeSymbol)).new

  def initialize
    Log.info { "LameRegexCrystalCodeModel is on!" }
  end

  def file_opened(source : Path) : Nil
    @symbols[source.to_s] = scan_symbols(source)
  end

  def resource_symbols(source : Path) : Array(CodeSymbol)
    @symbols[source.to_s]? || [] of CodeSymbol
  end

  private def scan_symbols(source : Path) : Array(CodeSymbol)
    symbols = [] of CodeSymbol
    line_number = -1
    is_spec = source =~ /_spec\...\z/

    File.open(source).each_line do |line|
      line_number += 1
      case line
      when METHOD_REGEX
        location = CodeLocation.new(source.to_s, line_number, 0)
        symbols << CodeSymbol.new($1, :method, location)
      when MACRO_REGEX
        location = CodeLocation.new(source.to_s, line_number, 0)
        symbols << CodeSymbol.new($1, :macro, location)
      when SPEC_TEST_REGEX
        location = CodeLocation.new(source.to_s, line_number, 0)
        symbols << CodeSymbol.new($1, :test_case, location)
      else
        next
      end
    end
    symbols
  end

  def find_symbols(name : String) : Array(CodeSymbol)
    symbols_found = [] of CodeSymbol

    @symbols.each_value do |symbols|
      symbols.each do |symbol|
        symbols_found << symbol if symbol.name == name
      end
    end
    symbols_found
  end
end
