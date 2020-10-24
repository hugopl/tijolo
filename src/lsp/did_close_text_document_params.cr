require "./text_document_identifier"

module LSP
  struct DidCloseTextDocumentParams
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    def initialize(uri : String)
      @text_document = TextDocumentIdentifier.new(uri)
    end
  end
end
