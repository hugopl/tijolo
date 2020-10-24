require "./text_document_position_params"
require "./document_symbol_params"

module LSP
  alias RequestType = (TextDocumentPositionParams |
                       DocumentSymbolParams)?

  struct RequestMessage
    include JSON::Serializable

    @jsonrpc = "2.0"
    property id : Int32
    property method : String

    @[JSON::Field(emit_null: true)]
    property params : RequestType

    def initialize(@id, @method, @params = nil)
    end
  end
end
