module LSP
  enum TextDocumentSyncKind
    None
    Full
    Incremental
  end

  struct SaveOptions
    include JSON::Serializable

    @[JSON::Field(key: "includeText")]
    getter? include_text : Bool?
  end

  struct TextDocumentSyncOptions
    include JSON::Serializable

    @[JSON::Field(key: "openClose")]
    getter? open_close : Bool?
    getter change : TextDocumentSyncKind?
    @[JSON::Field(key: "willSave")]
    getter will_save : Bool?
    @[JSON::Field(key: "willSaveWaitUntil")]
    getter will_save_wait_until : Bool?
    getter save : SaveOptions | Bool | Nil

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
    @resolve_provider : Bool? = false
    @[JSON::Field(key: "triggerCharacters")]
    @trigger_characters : Array(String)?
    @[JSON::Field(key: "allCommitCharacters")]
    @all_commit_characters : Array(String)?
  end

  struct SignatureHelpOptions
    include JSON::Serializable

    @[JSON::Field(key: "triggerCharacters")]
    @trigger_characters : Array(String)?
    @[JSON::Field(key: "retriggerCharacters")]
    @retrigger_characters : Array(String)?
  end

  struct CodeActionOptions
    include JSON::Serializable

    @[JSON::Field(key: "codeActionKinds")]
    @code_action_kinds : Array(String)?
  end

  struct CodeLensOptions
    include JSON::Serializable

    @[JSON::Field(key: "resolveProvider")]
    @resolve_provider : Bool?
  end

  struct DocumentOnTypeFormattingOptions
    include JSON::Serializable

    @[JSON::Field(key: "firstTriggerCharacter")]
    @first_trigger_character : String

    @[JSON::Field(key: "moreTriggerCharacter")]
    @more_trigger_character : Array(String)?
  end

  struct DocumentLinkOptions
    include JSON::Serializable

    @[JSON::Field(key: "resolveProvider")]
    @resolve_provider : Bool? = false
  end

  struct ExecuteCommandOptions
    include JSON::Serializable

    @commands : Array(String)
  end

  struct RenameOptions
    include JSON::Serializable

    @[JSON::Field(key: "prepareProvider")]
    @prepare_provider : Bool? = false
  end

  struct WorkspaceFoldersServerCapabilities
    include JSON::Serializable

    @supported : Bool?
    @[JSON::Field(key: "changeNotifications")]
    @change_notifications : Bool | String | Nil
  end

  struct WorkspaceOptions
    include JSON::Serializable

    @[JSON::Field(key: "workspaceFolders")]
    @workspace_folders : WorkspaceFoldersServerCapabilities
  end

  # FIXME: This struct is REALLY imcomplete... and will fail for a lot of servers, I'm fixing when I see a server using a
  #        sub struct that is not here, to fix all is very easy, but boring and time consuming... just read the LSP spec
  #        and create the structs.
  struct ServerCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "codeActionProvider")]
    @code_action_provider : CompletionOptions | Bool | Nil = false

    @[JSON::Field(key: "codeLensProvider")]
    @code_lens_provider : CodeLensOptions?

    @[JSON::Field(key: "completionProvider")]
    @completion_provider : CompletionOptions?

    @[JSON::Field(key: "declarationProvider")]
    @declaration_provider : Bool? = false

    @[JSON::Field(key: "definitionProvider")]
    @definition_provider : Bool? = false

    @[JSON::Field(key: "documentFormattingProvider")]
    @document_formatting_provider : Bool? = false

    @[JSON::Field(key: "documentHighlightProvider")]
    @document_highlight_provider : Bool? = false

    @[JSON::Field(key: "documentLinkProvider")]
    @document_link_provider : DocumentLinkOptions?

    @[JSON::Field(key: "documentOnTypeFormattingProvider")]
    @document_on_type_formatting_provider : DocumentOnTypeFormattingOptions?

    @[JSON::Field(key: "documentRangeFormattingProvider")]
    @document_range_formatting_provider : Bool? = false

    @[JSON::Field(key: "documentSymbolProvider")]
    @document_symbol_provider : Bool? = false

    @[JSON::Field(key: "executeCommandProvider")]
    @execute_command_provider : ExecuteCommandOptions?

    @[JSON::Field(key: "foldingRangeProvider")]
    @folding_range_provider : Bool? = false

    @[JSON::Field(key: "hoverProvider")]
    @hover_provider : Bool? = false

    @[JSON::Field(key: "implementationProvider")]
    @implementation_provider : Bool? = false

    @[JSON::Field(key: "referencesProvider")]
    @references_provider : Bool? = false

    @[JSON::Field(key: "renameProvider")]
    @rename_provider : RenameOptions | Bool | Nil = false

    @[JSON::Field(key: "signatureHelpProvider")]
    @signature_help_provider : SignatureHelpOptions?

    @[JSON::Field(key: "textDocumentSync")]
    @text_document_sync : TextDocumentSyncOptions | Int32 | Nil

    @[JSON::Field(key: "typeDefinitionProvider")]
    @type_definition_provider : Bool? = false

    @workspace : WorkspaceOptions?

    @[JSON::Field(key: "workspaceSymbolProvider")]
    @workspace_symbol_provider : Bool? = false

    def initialize
    end

    def open_close?
      sync_options = @text_document_sync.as?(TextDocumentSyncOptions)
      sync_options ? sync_options.open_close? : true
    end

    def text_document_sync : TextDocumentSyncKind
      sync = @text_document_sync
      case sync
      in Int32                   then TextDocumentSyncKind.new(sync)
      in Nil                     then TextDocumentSyncKind::None
      in TextDocumentSyncOptions then sync.change || TextDocumentSyncKind::None
      end
    end

    def definition_provider? : Bool
      !!@definition_provider
    end

    def document_symbol_provider? : Bool
      !!@document_symbol_provider
    end
  end
end
