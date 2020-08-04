require "./lsp_client.cr"

class Language
  include LspClientListener

  NONE = "none"

  getter line_comment : String
  getter id : String
  getter! lsp_client : LspClient?

  @views_to_open : Array(TextView)?

  def initialize
    @id = NONE
    @line_comment = ""
  end

  def initialize(@id, @line_comment = "")
    cmd = Config.instance.language_servers[@id]?
    @lsp_client = start_lsp(cmd) if cmd
  end

  def none?
    @id == NONE
  end

  private def lsp_disabled?
    @lsp_client.nil?
  end

  private def lsp_ready?(feature : String, &proc : Proc(LspClient, Bool)) : Bool
    lsp_client = @lsp_client
    raise AppError.new("This feature requires a Language Server.") if lsp_client.nil?

    return false unless lsp_client.initialized?

    has_feature = proc.call(lsp_client)
    raise AppError.new("#{@id} Language Server doesn't support #{feature}.") unless has_feature
    true
  end

  def gtk_language : GtkSource::Language?
    return if none?

    LanguageManager.find_gtk_lang(@id)
  end

  def start_lsp(cmd)
    lsp = LspClient.new(cmd)
    lsp.add_lsp_client_listener(self)
    lsp
  rescue
    Log.fatal { "Failed to start language server for #{@id}: #{cmd}" }
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

  def goto_definition(path : Path, line : Int32, col : Int32, &block : Proc(String, Int32, Int32, Nil))
    return unless lsp_ready?("Go To Definition", &.definition_provider?)

    params = LSP::TextDocumentPositionParams.new(uri: uri(path), line: line, character: col)
    lsp_client.request("textDocument/definition", params) do |response|
      result = response.result.as?(Array(LSP::Location))
      next if result.nil? || result.empty?

      location = result.first
      uri = URI.parse(location.uri).full_path
      line = location.range.start.line
      col = location.range.start.character
      block.call(uri, line, col)
    end
  end

  def document_symbols(path : Path, &block : Proc(Array(LSP::SymbolInformation), Nil))
    return unless lsp_ready?("Document Symbols", &.document_symbol_provider?)

    params = LSP::DocumentSymbolParams.new(uri: uri(path))
    lsp_client.request("textDocument/documentSymbol", params) do |response|
      result = response.result.as?(Array(LSP::SymbolInformation))
      block.call(result) if result
    end
  end
end
