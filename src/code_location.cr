struct CodeLocation
  getter line : Int32
  getter column : Int32
  getter source : String

  def initialize(@source, @line, @column)
  end
end
