require "./range"

module LSP
  struct Location
    include JSON::Serializable

    property uri : String
    property range : Range

    def initialize(@uri, @range)
    end
  end
end
