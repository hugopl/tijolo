require "./lsp_client.cr"

class Language
  include LSP
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

  private def require_lsp!
    raise AppError.new("This feature requires a Language Server, but #{@id} doesn't seems to have one.") if lsp_disabled?
  end

  def gtk_language : GtkSource::Language?
    return if none?

    GtkSource::LanguageManager.default.language(@id)
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
      params = Protocol::DidOpenTextDocumentParams.new(
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
      params = Protocol::DidCloseTextDocumentParams.new(uri: uri(path))
      lsp_client.notify("textDocument/didClose", params)
    else
      @views_to_open.try(&.delete(text_view))
    end
  end

  def file_changed_by_insertion(text_view : TextView, line : Int32, col : Int32, text : String)
    return if lsp_disabled? || text_view.file_path.nil?

    document_sync =lsp_client.server_capabilities.text_document_sync
    if document_sync.full?
      file_changed_full_sync(text_view)
    elsif document_sync.incremental?
      uri = uri(text_view.file_path.not_nil!)
      params = Protocol::DidChangeTextDocumentParams.new(uri, text_view.next_version, line, col, text)
      lsp_client.notify("textDocument/didChange", params)
    end
  end

  def file_changed_by_deletion(text_view : TextView, start_line, start_col, end_line, end_col)
    return if lsp_disabled? || text_view.file_path.nil?

    document_sync =lsp_client.server_capabilities.text_document_sync
    if document_sync.full?
      file_changed_full_sync(text_view)
    elsif document_sync.incremental?
      uri = uri(text_view.file_path.not_nil!)
      version = text_view.next_version
      params = Protocol::DidChangeTextDocumentParams.new(uri, version, start_line, start_col, end_line, end_col)
      lsp_client.notify("textDocument/didChange", params)
    end
  end

  private def file_changed_full_sync(text_view : TextView)
    uri = uri(text_view.file_path.not_nil!)
    version = text_view.next_version
    params = Protocol::DidChangeTextDocumentParams.new(uri, version, text_view.text)
    lsp_client.notify("textDocument/didChange", params)
  end

  def goto_definition(path : Path, line : Int32, col : Int32, &block : Proc(String, Int32, Int32, Nil))
    require_lsp!
    return unless lsp_client.initialized?
    raise AppError.new("#{@id} Language Server doesn't support Go To Definition") unless lsp_client.definition_provider?

    params = Protocol::TextDocumentPositionParams.new(uri: uri(path), line: line, character: col)
    lsp_client.request("textDocument/definition", params) do |response|
      result = response.result.as?(Array(LSP::Protocol::Location))
      next if result.nil? || result.empty?

      location = result.first
      uri = URI.parse(location.uri).full_path
      line = location.range.start.line
      col = location.range.start.character
      block.call(uri, line, col)
    end
  end
end
