require "./position"

module LSP
  struct Range
    include JSON::Serializable

    property start : Position
    property end : Position

    def initialize(start_line, start_col, end_line, end_col)
      @start = Position.new(start_line, start_col)
      @end = Position.new(end_line, end_col)
    end
  end
end
