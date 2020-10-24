module LSP
  enum TextDocumentSyncKind
    None
    Full
    Incremental
  end

  struct TextDocumentSyncOptions
    include JSON::Serializable

    @[JSON::Field(key: "openClose")]
    property? open_close : Bool?

    property change : TextDocumentSyncKind?

    def full?
      @change ? @change.not_nil!.full? : false
    end

    def incremental?
      @change ? @change.not_nil!.incremental? : false
    end

    def none?
      @change ? @change.not_nil!.none? : true
    end
  end

  struct CompletionOptions
    include JSON::Serializable

    @[JSON::Field(key: "resolveProvider")]
    property resolve_provider : Bool = false
    @[JSON::Field(key: "triggerCharacters")]
    property trigger_characters : Array(String)

    def initialize(@resolve_provider = false, @trigger_characters = [] of String)
    end
  end

  # FIXME: This struct is REALLY imcomplete... and will fail for a lot of servers, I'm fixing when I see a server using a
  #        sub struct that is not here, to fix all is very easy, but boring and time consuming... just read the LSP spec
  #        and create the structs.
  struct ServerCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "textDocumentSync")]
    property text_document_sync : TextDocumentSyncOptions | TextDocumentSyncKind

    @[JSON::Field(key: "completionProvider")]
    property? completion_provider : CompletionOptions?

    @[JSON::Field(key: "documentFormattingProvider")]
    property? document_formatting_provider : Bool = false

    @[JSON::Field(key: "documentRangeFormattingProvider")]
    property? document_range_formatting_provider : Bool = false

    @[JSON::Field(key: "documentHighlightProvider")]
    property? document_highlight_provider : Bool = false

    @[JSON::Field(key: "definitionProvider")]
    property? definition_provider : Bool = false

    @[JSON::Field(key: "documentSymbolProvider")]
    property? document_symbol_provider : Bool = false

    @[JSON::Field(key: "hoverProvider")]
    property? hover_provider : Bool = false

    @[JSON::Field(key: "referencesProvider")]
    property? references_provider : Bool = false

    @[JSON::Field(key: "workspaceSymbolProvider")]
    property? workspace_symbol_provider : Bool = false

    def initialize(*, @text_document_sync = TextDocumentSyncKind::None, @document_formatting_provider = false,
                   @document_range_formatting_provider = false,
                   @definition_provider = false, @document_highlight_provider = false, @references_provider = false,
                   @document_symbol_provider = false, @workspace_symbol_provider = false, @hover_provider = false,
                   @completion_provider = CompletionOptions.new(false))
    end

    def open_close?
      sync_options = @text_document_sync.as?(TextDocumentSyncOptions)
      sync_options ? sync_options.open_close? : true
    end
  end
end
