module LSP
  struct DidOpenTextDocumentParams
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentItem

    def initialize(*, uri : String, language_id : String, version : Int32, text : String)
      @text_document = TextDocumentItem.new(uri, language_id, version, text)
    end
  end

  struct TextDocumentItem
    include JSON::Serializable

    property uri : String

    @[JSON::Field(key: "languageId")]
    property language_id : String

    property version : Int32
    property text : String

    def initialize(@uri, @language_id, @version, @text)
    end
  end
end
