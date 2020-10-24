module LSP
  struct DocumentSymbolParams
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    def initialize(uri : String)
      @text_document = TextDocumentIdentifier.new(uri)
    end
  end
end
