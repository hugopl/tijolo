module LSP
  enum TextDocumentSyncKind : Int32
    None        = 0
    Full        = 1
    Incremental = 2
  end

  struct SaveOptions
    include JSON::Serializable

    @[JSON::Field(key: "includeText")]
    getter? include_text : Bool = false
  end

  struct TextDocumentSyncOptions
    include JSON::Serializable

    @[JSON::Field(key: "openClose")]
    getter? open_close : Bool = false
    getter change = LSP::TextDocumentSyncKind::None
    @[JSON::Field(key: "willSave")]
    getter? will_save : Bool = false
    @[JSON::Field(key: "willSaveWaitUntil")]
    getter? will_save_wait_until : Bool = false
    getter save : SaveOptions | Bool = false
  end

  struct CompletionOptions
    include JSON::Serializable

    @[JSON::Field(key: "resolveProvider")]
    @resolve_provider : Bool = false
    @[JSON::Field(key: "triggerCharacters")]
    @trigger_characters = [] of String
    @[JSON::Field(key: "allCommitCharacters")]
    @all_commit_characters = [] of String
  end

  struct SignatureHelpOptions
    include JSON::Serializable

    @[JSON::Field(key: "triggerCharacters")]
    @trigger_characters = [] of String
    @[JSON::Field(key: "retriggerCharacters")]
    @retrigger_characters = [] of String
  end

  struct CodeActionOptions
    include JSON::Serializable

    @[JSON::Field(key: "codeActionKinds")]
    @code_action_kinds : Array(String)?
  end

  struct CodeLensOptions
    include JSON::Serializable

    @[JSON::Field(key: "resolveProvider")]
    @resolve_provider : Bool = false
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
    @resolve_provider : Bool = false
  end

  struct ExecuteCommandOptions
    include JSON::Serializable

    @commands : Array(String)
  end

  struct RenameOptions
    include JSON::Serializable

    @[JSON::Field(key: "prepareProvider")]
    @prepare_provider : Bool = false
  end

  struct WorkspaceFoldersServerCapabilities
    include JSON::Serializable

    @supported : Bool?
    @[JSON::Field(key: "changeNotifications")]
    @change_notifications : Bool | String = false
  end

  struct WorkspaceOptions
    include JSON::Serializable

    @[JSON::Field(key: "workspaceFolders")]
    @workspace_folders : WorkspaceFoldersServerCapabilities
  end

  # FIXME: This struct is REALLY imcomplete... and will fail for a lot of servers, I'm fixing when I see a server using a
  #        sub struct that is not here, to fix all is very easy, but boring and time consuming... just read the LSP spec
  #        and create the structs.
  class ServerCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "codeActionProvider")]
    @code_action_provider : CompletionOptions | Bool = false

    @[JSON::Field(key: "codeLensProvider")]
    @code_lens_provider : CodeLensOptions?

    @[JSON::Field(key: "completionProvider")]
    @completion_provider : CompletionOptions?

    @[JSON::Field(key: "declarationProvider")]
    @declaration_provider : Bool = false

    @[JSON::Field(key: "definitionProvider")]
    getter? definition_provider : Bool = false

    @[JSON::Field(key: "documentFormattingProvider")]
    @document_formatting_provider : Bool = false

    @[JSON::Field(key: "documentHighlightProvider")]
    @document_highlight_provider : Bool = false

    @[JSON::Field(key: "documentLinkProvider")]
    @document_link_provider : DocumentLinkOptions?

    @[JSON::Field(key: "documentOnTypeFormattingProvider")]
    @document_on_type_formatting_provider : DocumentOnTypeFormattingOptions?

    @[JSON::Field(key: "documentRangeFormattingProvider")]
    @document_range_formatting_provider : Bool = false

    @[JSON::Field(key: "documentSymbolProvider")]
    getter? document_symbol_provider : Bool = false

    @[JSON::Field(key: "executeCommandProvider")]
    @execute_command_provider : ExecuteCommandOptions?

    @[JSON::Field(key: "foldingRangeProvider")]
    @folding_range_provider : Bool = false

    @[JSON::Field(key: "hoverProvider")]
    @hover_provider : Bool = false

    @[JSON::Field(key: "implementationProvider")]
    @implementation_provider : Bool = false

    @[JSON::Field(key: "referencesProvider")]
    @references_provider : Bool = false

    @[JSON::Field(key: "renameProvider")]
    @rename_provider : RenameOptions | Bool = false

    @[JSON::Field(key: "signatureHelpProvider")]
    @signature_help_provider : SignatureHelpOptions?

    @[JSON::Field(key: "textDocumentSync")]
    @text_document_sync : TextDocumentSyncOptions | Int32 = LSP::TextDocumentSyncKind::None.value

    @[JSON::Field(key: "typeDefinitionProvider")]
    @type_definition_provider : Bool = false

    @workspace : WorkspaceOptions?

    @[JSON::Field(key: "workspaceSymbolProvider")]
    @workspace_symbol_provider : Bool = false

    def initialize
    end

    def open_close?
      sync_options = @text_document_sync.as?(TextDocumentSyncOptions)
      sync_options ? sync_options.open_close? : true
    end

    def text_document_sync : TextDocumentSyncKind
      sync = @text_document_sync
      case sync
      in Int32                   then TextDocumentSyncKind.from_value(sync)
      in TextDocumentSyncOptions then sync.change
      end
    end
  end
end
