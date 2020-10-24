require "./text_document_content_change_event.cr"
require "./versioned_text_document_identifier"

module LSP
  struct DidChangeTextDocumentParams
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : VersionedTextDocumentIdentifier

    @[JSON::Field(key: "contentChanges")]
    property content_changes : Array(TextDocumentContentChangeEvent)

    # Insertion
    def initialize(uri : String, version : Int32, line : Int32, col : Int32, text : String)
      @text_document = VersionedTextDocumentIdentifier.new(uri, version)
      range = Range.new(line, col, line, col)
      @content_changes = Array(TextDocumentContentChangeEvent).new(1, TextDocumentContentChangeEvent.new(text, range, 0))
    end

    # Deletion
    def initialize(uri : String, version : Int32, start_line, start_col, end_line, end_col)
      @text_document = VersionedTextDocumentIdentifier.new(uri, version)
      range = Range.new(start_line, start_col, end_line, end_col)
      @content_changes = Array(TextDocumentContentChangeEvent).new(1, TextDocumentContentChangeEvent.new("", range))
    end

    # Full text sync
    def initialize(uri : String, version : Int32, text : String)
      @text_document = VersionedTextDocumentIdentifier.new(uri, version)
      @content_changes = Array(TextDocumentContentChangeEvent).new(1, TextDocumentContentChangeEvent.new(text))
    end
  end
end
