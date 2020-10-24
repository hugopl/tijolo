module LSP
  struct DidSaveTextDocumentParams
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    property text : String?

    def initialize(uri : String)
      @text_document = TextDocumentIdentifier.new(uri)
    end
  end
end
