require "./range"

module LSP
  struct Location
    include JSON::Serializable

    property uri : String
    property range : Range

    def initialize(@uri, @range)
    end

    def uri_full_path : Path
      Path.new(URI.parse(@uri).request_target)
    end
  end
end
