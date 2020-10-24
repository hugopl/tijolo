require "./range"

module LSP
  struct TextDocumentContentChangeEvent
    include JSON::Serializable

    property range : Range?
    property text : String

    @[JSON::Field(key: "rangeLength")]
    property range_length : Int32?

    def initialize(@text, @range = nil, @range_length = nil)
    end
  end
end
