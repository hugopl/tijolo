require "./code_model"

class EmptyCodeModel < CodeModel
  @no_symbols = [] of CodeSymbol

  def resource_symbols(source : Path) : Array(CodeSymbol)
    @no_symbols
  end

  def find_symbols(name : String) : Array(CodeSymbol)
    @no_symbols
  end
end
