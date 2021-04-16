require "./lsp_client.cr"

class Language
  include LspClientListener

  NONE_ID = "none"
  NONE    = Language.new

  getter line_comment : String
  getter id : String
  getter! lsp_client : LspClient?
  getter gtk_language : GtkSource::Language?

  @views_to_open : Array(TextView)?

  def initialize
    @id = NONE_ID
    @line_comment = ""
  end

  @@running_language_servers = Hash(String, LspClient).new

  def initialize(gtk_language : GtkSource::Language)
    @id = gtk_language.id
    @line_comment = gtk_language.metadata("line-comment-start").to_s
    @gtk_language = gtk_language

    config = Config.instance
    return unless config.language_servers_enabled?

    cmd = config.language_servers[@id]?
    if cmd.nil?
      Log.info &.emit("No language server for \"#{@id}\" found.", notify: true)
    elsif cmd.blank?
      Log.info &.emit("Language server for \"#{@id}\" is disabled.", notify: true)
    else
      @lsp_client = start_lsp(cmd)
    end
  end

  def none?
    @id == NONE_ID
  end

  private def lsp_disabled?
    @lsp_client.nil?
  end

  private def lsp_ready?(feature : String, &proc : Proc(LspClient, Bool)) : Bool
    lsp_client = @lsp_client
    if lsp_client.nil?
      msg = if none?
              "This feature doesn't work on files in unknown languages."
            elsif !Config.instance.language_servers_enabled?
              "Enable language server support to use this feature."
            else
              "This feature requires a Language Server for #{@id}."
            end
      raise AppError.new(msg)
    end

    return false unless lsp_client.initialized?

    has_feature = proc.call(lsp_client)
    raise AppError.new("#{@id} Language Server doesn't support #{feature}.") unless has_feature
    true
  end

  def start_lsp(cmd) : LspClient?
    return unless Config.instance.language_servers_enabled?

    lsp = @@running_language_servers[cmd]?
    if lsp
      Log.info { %Q(Reusing "#{lsp.lang_id}" language server for "#{@id}".) }
      return lsp
    end

    program = cmd.split.first
    if Process.find_executable(program).nil?
      Log.error &.emit("Can't find a executable for: #{program}", notify: true)
      return
    end
    lsp = LspClient.new(cmd, @id)
    lsp.add_lsp_client_listener(self)
    @@running_language_servers[cmd] = lsp
  rescue
    Log.error &.emit("Failed to start language server for #{@id}: #{cmd}", notify: true)
    nil
  end

  def lsp_client_initialized
    views_to_open = @views_to_open
    return if views_to_open.nil?

    views_to_open.each do |view|
      file_opened(view)
    end
    @views_to_open = nil
  end

  def shutdown
    lsp_client.shutdown unless lsp_disabled?
  end

  private def uri(path : Path)
    "file://#{path}"
  end

  def file_opened(text_view : TextView)
    return if lsp_disabled? || text_view.file_path.nil? || !lsp_client.server_capabilities.open_close?

    if lsp_client.initialized?
      path = text_view.file_path.not_nil!
      params = LSP::DidOpenTextDocumentParams.new(
        uri: uri(path),
        language_id: @id,
        version: text_view.version,
        text: text_view.text)
      lsp_client.notify("textDocument/didOpen", params)
    else
      @views_to_open ||= Array(TextView).new
      @views_to_open.not_nil! << text_view
    end
  end

  def file_closed(text_view : TextView)
    return if lsp_disabled? || text_view.file_path.nil? || !lsp_client.server_capabilities.open_close?

    if lsp_client.initialized?
      path = text_view.file_path.not_nil!
      params = LSP::DidCloseTextDocumentParams.new(uri: uri(path))
      lsp_client.notify("textDocument/didClose", params)
    else
      @views_to_open.try(&.delete(text_view))
    end
  end

  def file_changed_by_insertion(text_view : TextView, line : Int32, col : Int32, text : String)
    return if lsp_disabled? || text_view.file_path.nil?

    document_sync = lsp_client.server_capabilities.text_document_sync
    if document_sync.full?
      file_changed_full_sync(text_view)
    elsif document_sync.incremental?
      uri = uri(text_view.file_path.not_nil!)
      params = LSP::DidChangeTextDocumentParams.new(uri, text_view.next_version, line, col, text)
      lsp_client.notify("textDocument/didChange", params)
    end
  end

  def file_changed_by_deletion(text_view : TextView, start_line, start_col, end_line, end_col)
    return if lsp_disabled? || text_view.file_path.nil?

    document_sync = lsp_client.server_capabilities.text_document_sync
    if document_sync.full?
      file_changed_full_sync(text_view)
    elsif document_sync.incremental?
      uri = uri(text_view.file_path.not_nil!)
      version = text_view.next_version
      params = LSP::DidChangeTextDocumentParams.new(uri, version, start_line, start_col, end_line, end_col)
      lsp_client.notify("textDocument/didChange", params)
    end
  end

  private def file_changed_full_sync(_text_view : TextView)
    # FIXME: Calling text_view.text too many times is very slow... so I'm disabling full sync for now.
    # uri = uri(text_view.file_path.not_nil!)
    # version = text_view.next_version
    # params = LSP::DidChangeTextDocumentParams.new(uri, version, text_view.text)
    # lsp_client.notify("textDocument/didChange", params)
  end

  def notify_did_save(text_view : TextView)
    return if lsp_disabled? || text_view.file_path.nil?

    uri = uri(text_view.file_path.not_nil!)
    params = LSP::DidSaveTextDocumentParams.new(uri)
    lsp_client.notify("textDocument/didSave", params)
  end

  def goto_definition(path : Path, line : Int32, col : Int32, &block : Proc(Array(LSP::Location | LSP::LocationLink), Nil))
    return unless lsp_ready?("Go To Definition", &.definition_provider?)

    lsp_client.request_text_document_definition(path, line, col, &block)
  end

  def document_symbols(path : Path, &block : Proc(Array(LSP::SymbolInformation), Nil))
    return unless lsp_ready?("Document Symbols", &.document_symbol_provider?)

    lsp_client.request_text_document_document_symbols(path, &block)
  end
end
