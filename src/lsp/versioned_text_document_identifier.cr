module LSP
  struct VersionedTextDocumentIdentifier
    include JSON::Serializable

    property uri : String
    property version : Int32

    def initialize(@uri, @version)
    end
  end
end
