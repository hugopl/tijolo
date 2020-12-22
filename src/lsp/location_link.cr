require "./range"

module LSP
  struct LocationLink
    include JSON::Serializable

    @[JSON::Field(key: "originSelectionRange")]
    property origin_selection_range : Range?
    @[JSON::Field(key: "targetUri")]
    property target_uri : String
    @[JSON::Field(key: "targetRange")]
    property target_range : Range
    @[JSON::Field(key: "targetSelectionRange")]
    property target_selection_range : Range

    def uri_full_path : Path
      Path.new(URI.parse(@target_uri).full_path)
    end

    def range
      @target_range
    end
  end
end
