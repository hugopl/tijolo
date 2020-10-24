require "./text_document_identifier"
require "./position"

module LSP
  struct TextDocumentPositionParams
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    property position : Position

    def initialize(uri : String, line : Int32, character : Int32)
      @text_document = TextDocumentIdentifier.new(uri)
      @position = Position.new(line, character)
    end
  end
end
