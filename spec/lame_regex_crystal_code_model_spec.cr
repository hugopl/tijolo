require "./spec_helper"

# The code in this block is used on tests, so don't move it!
# Only add things at end or some tests will fail due to line number changes.
macro macro_for_testing!
end

def method_for_testing!
end

private class Classs
  def self.method_for_testing!
  end

  def method_for_testing=(_bar)
  end
end

describe "Nop" do
  it "test" do
  end
end

# End of test code 😎️

private def filtered_symbols(filter : CodeSymbol::Kind)
  code_model = LameRegexCrystalCodeModel.new
  code_model.file_opened(Path.new(__FILE__))
  code_model.resource_symbols(Path.new(__FILE__)).select do |symbol|
    symbol.kind == filter
  end
end

describe LameRegexCrystalCodeModel do
  it "find methods" do
    symbols = filtered_symbols(:method)
    symbols[0].name.should eq("method_for_testing!")
    symbols[0].location.line.should eq(7)
    symbols[1].name.should eq("self.method_for_testing!")
    symbols[1].location.line.should eq(11)
    symbols[2].name.should eq("method_for_testing=")
    symbols[2].location.line.should eq(14)
  end

  it "find test cases" do
    symbols = filtered_symbols(:test_case)
    symbols[0].name == "test"
    symbols[0].location.line.should eq(19)
  end

  it "find macros" do
    symbols = filtered_symbols(:macro)
    symbols.size.should eq(1)
    symbols[0].name.should eq("macro_for_testing!")
    symbols[0].location.line.should eq(4)
  end
end
