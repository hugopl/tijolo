module LSP
  struct TextDocumentIdentifier
    include JSON::Serializable

    property uri : String

    def initialize(@uri)
    end
  end
end
