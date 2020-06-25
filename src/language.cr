require "./lsp_client.cr"

class Language
  include LSP

  getter line_comment : String
  getter id : String

  getter! lsp_client : LspClient?

  NONE = "none"

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

  def gtk_language : GtkSource::Language?
    return if none?

    GtkSource::LanguageManager.default.language(@id)
  end

  def start_lsp(cmd)
    LspClient.new(cmd)
  rescue
    Log.fatal { "Failed to start language server for #{@id}: #{cmd}" }
    nil
  end

  private def uri(path : Path)
    "file://#{path}"
  end

  def file_opened(path : Path, text : String)
    return if lsp_disabled?

    params = Protocol::DidOpenTextDocumentParams.new(uri: path.to_uri.to_s, language_id: @id, version: 0, text: text)
    lsp_client.notify("didOpen", params)
  end

  def file_closed(path : Path)
    return if lsp_disabled?

    params = Protocol::DidCloseTextDocumentParams.new(uri: uri(path))
    lsp_client.notify("didClose", params)
  end

  def goto_definition(path : Path, line : Int32, col : Int32, &block : Proc(String, Int32, Int32, Nil))
    return if lsp_disabled?

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
