require "./code_location"

class CodeSymbol
  enum Kind
    Macro
    Method
    TestCase
    # ...
  end

  getter name : String
  getter kind : Kind
  getter location : CodeLocation

  def initialize(@name, @kind, @location)
  end

  def icon_name : String
    case @kind
    when .method?    then "tijolo-method-symbolic"
    when .macro?     then "tijolo-macro-symbolic"
    when .test_case? then "tijolo-test-case-symbolic"
    else                  "text-x-generic-symbolic"
    end
  end
end
