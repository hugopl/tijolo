require "colorize"

require "./from_json_any"
require "./observable"
require "./lsp"

module LspClientListener
  abstract def lsp_client_initialized
end

abstract class LspAbstractResponseHandler
  abstract def exec(json : JSON::Any)
end

class LspResponseHandler(T) < LspAbstractResponseHandler
  @proc : Proc(T, Nil)

  def initialize(@proc)
  end

  def exec(json : JSON::Any)
    GLib.idle_add do
      {% if T == Nil %}
        @proc.call(nil)
      {% else %}
        result = json.raw.nil? ? T.new : T.new(json)
        @proc.call(result)
      {% end %}
      false
    end
  end
end

class LspClient
  include LSP

  observable_by LspClientListener

  Log = ::Log.for("LSP")

  getter? initialized = false
  getter lang_id : String
  private getter log : ::Log

  @server : Process
  # Next request ID
  @next_id = 0
  @response_handlers = Hash(Int32, LspAbstractResponseHandler).new
  getter server_capabilities = ServerCapabilities.new

  delegate definition_provider?, to: @server_capabilities
  delegate document_symbol_provider?, to: @server_capabilities

  def initialize(command : String, @lang_id : String)
    @log = Log.for(@lang_id.titleize)
    @server = Process.new(command, shell: true, input: :pipe, output: :pipe, error: :pipe)
    log.info { "Starting LSP for #{command.inspect} on pid #{@server.pid}" }

    request_initialize do |result|
      @initialized = true
      @server_capabilities = result.capabilities

      notify("initialized", VoidParams.new)
      assync_notify_lsp_client_initialized
      log.info &.emit("#{@lang_id.titleize} language server ready!", notify: true)
    end

    # Need to use Thread.new instead of `spawn` here, so a new SO thread is always really created independent of
    # CRYSTAL_WORKERS variable.
    Thread.new do
      receiver_loop
    end
  end

  private def lsp_uri(path : Path)
    "file://#{path}"
  end

  private def request_initialize(&block : Proc(InitializeResult, Nil))
    handler = LspResponseHandler(InitializeResult).new(block)
    request(0, initialize_request_payload, handler)
  end

  private def request_shutdown(&block : Proc(Nil, Nil))
    handler = LspResponseHandler(Nil).new(block)
    request("shutdown", nil, handler)
  end

  def request_text_document_definition(uri : Path, line : Int32, col : Int32, &block : Proc(Array(LSP::Location | LSP::LocationLink), Nil))
    params = LSP::TextDocumentPositionParams.new(uri: lsp_uri(uri), line: line, character: col)
    handler = LspResponseHandler(Array(LSP::Location | LSP::LocationLink)).new(block)
    request("textDocument/definition", params, handler)
  end

  def request_text_document_document_symbols(uri : Path, &block : Proc(Array(LSP::SymbolInformation), Nil))
    params = LSP::DocumentSymbolParams.new(uri: lsp_uri(uri))
    handler = LspResponseHandler(Array(LSP::SymbolInformation)).new(block)
    request("textDocument/documentSymbol", params, handler)
  end

  private def request(method : String, params : RequestType, handler : LspAbstractResponseHandler)
    return unless initialized?

    id = next_id
    payload = RequestMessage.new(id, method, params).to_json
    request(id, payload, handler)
  end

  # Initialize request use this directly... all others use the overload above
  private def request(id : Int32, payload : String, handler : LspAbstractResponseHandler)
    @response_handlers[id] = handler
    send(payload)
  end

  def notify(method : String, params : NotificationType)
    return unless initialized?

    payload = NotificationMessage.new(method, params).to_json
    send?(payload)
  end

  private def initialize_request_payload : String
    root_path = Dir.current
    root_uri = "file://#{root_path}"
    {
      "jsonrpc" => "2.0",
      "id"      => 0,
      "method"  => "initialize",
      "params"  => {
        "processId"    => Process.pid,
        "rootPath"     => root_path,
        "rootUri"      => root_uri,
        "capabilities" => {
          "workspace" => {
            "applyEdit"     => true,
            "workspaceEdit" => {
              "documentChanges" => true,
            },
            "didChangeConfiguration" => {
              "dynamicRegistration" => false,
            },
            "didChangeWatchedFiles" => {
              "dynamicRegistration" => false,
            },
            #   "symbol" => {
            #     "dynamicRegistration" => true,
            #     "symbolKind"          => {"valueSet" => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26]},
            #   },
            #   "executeCommand"   => {"dynamicRegistration" => true},
            #   "configuration"    => true,
            "workspaceFolders" => true,
          },
          "textDocument" => {
            # "publishDiagnostics" => {
            #   "relatedInformation" => true,
            # },
            "synchronization" => {
              "dynamicRegistration" => false,
              "willSave"            => true,
              "willSaveWaitUntil"   => false,
              "didSave"             => true,
            },
            # "completion" => {
            #   "dynamicRegistration" => true,
            #   "contextSupport"      => true,
            #   "completionItem"      => {
            #     "snippetSupport"          => true,
            #     "commitCharactersSupport" => true,
            #     "documentationFormat"     => ["markdown", "plaintext"],
            #     "deprecatedSupport"       => true,
            #     "preselectSupport"        => true,
            #   },
            #   "completionItemKind" => {
            #     "valueSet" => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
            #   },
            # },
            # "hover" => {
            #   "dynamicRegistration" => true,
            #   "contentFormat"       => ["markdown", "plaintext"],
            # },
            # "signatureHelp" => {
            #   "dynamicRegistration"  => true,
            #   "signatureInformation" => {
            #     "documentationFormat" => ["markdown", "plaintext"],
            #   },
            # },
            "definition" => {
              "dynamicRegistration" => false,
              "linkSupport"         => true,
            },
            "declaration" => {
              "dynamicRegistration" => false,
              "linkSupport"         => true,
            },
            # "references" => {
            #   "dynamicRegistration" => true,
            # },
            "documentHighlight" => {
              "dynamicRegistration" => false,
            },
            "documentSymbol" => {
              "dynamicRegistration" => false,
              "symbolKind"          => {
                "valueSet" => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26],
              },
              "hierarchicalDocumentSymbolSupport" => false,
            },
            # "codeAction" => {
            #   "dynamicRegistration"      => true,
            #   "codeActionLiteralSupport" => {
            #     "codeActionKind" => {
            #       "valueSet" => ["", "quickfix", "refactor", "refactor.extract", "refactor.inline", "refactor.rewrite", "source", "source.organizeImports"],
            #     },
            #   },
            # },
            # "codeLens"         => {"dynamicRegistration" => true},
            # "formatting"       => {"dynamicRegistration" => true},
            # "rangeFormatting"  => {"dynamicRegistration" => true},
            # "onTypeFormatting" => {"dynamicRegistration" => true},
            # "rename"           => {"dynamicRegistration" => true},
            # "documentLink"     => {"dynamicRegistration" => true},
            # "typeDefinition"   => {"dynamicRegistration" => true},
            # "implementation"   => {"dynamicRegistration" => true},
            # "colorProvider"    => {"dynamicRegistration" => true},
            # "foldingRange"     => {"dynamicRegistration" => true, "rangeLimit" => 5000, "lineFoldingOnly" => true},
          },
        },
        "trace"            => "off",
        "workspaceFolders" => [{"uri" => root_uri, "name" => "project"}],
      },
    }.to_json
  end

  private def next_id
    @next_id += 1
  end

  private def send?(payload : String) : Bool
    send(payload)
    true
  rescue e : AppError
    false
  end

  private def send(payload : String) : Nil
    return log.fatal { "Server died" } unless @server.exists?

    output = @server.input
    output << "Content-Length: #{payload.bytesize}\r\n\r\n#{payload}"

    log.debug { "==> #{payload.colorize(:green)}" }
  rescue e : IO::Error
    msg = "#{@lang_id.titleize} language server crashed."
    log.error &.emit(msg, notify: true)
    raise AppError.new(msg)
  end

  def shutdown
    # FIXME: Need to block the thread to give time to the server to answer before we quit, breaking the server pipe.
    #        The way it's written now, the exit notify is never sent.
    request_shutdown do
      notify("exit", nil)
    end
  end

  # All code bellow runs in a separete thread
  ###########################################

  private def receiver_loop
    buffer = IO::Memory.new(1024)
    input = @server.output
    content_length = 0
    loop do
      line = input.read_line
      if line =~ /Content-Length: (\d+)/
        content_length = $1.to_i
      elsif line.empty?
        IO.copy(input, buffer, content_length)
        log.debug { "<== #{buffer.to_s.colorize(:blue)}" }
        buffer.rewind
        decode_server_message(buffer)
        buffer.clear
      end
    end
  rescue e : IO::EOFError
    log.error { "Server closed output." }
  rescue e : IO::Error | AppError
    log.error &.emit(e.message.to_s, notify: true)
  end

  private def decode_server_message(io : IO)
    json = JSON.parse(io)

    msg_id = json["id"]?.try(&.as_i?)
    if msg_id.nil?
      handle_notification(json)
    elsif json["method"]? != nil
      handle_server_request(msg_id, json)
    else
      handle_server_response(msg_id, json)
    end
  rescue e : JSON::ParseException
    log.error { "Bad message from server: #{e.message}" }
  end

  private def handle_server_response(msg_id : Int32, json : JSON::Any) : Nil
    handler = @response_handlers.delete(msg_id)
    if handler.nil?
      log.warn { "No response handler for request #{msg_id}." }
      return
    end

    result = json["result"]? || JSON::Any.new(nil)
    handler.exec(result)
  rescue e
    log.error(exception: e) { "Error reading LS response: #{e.message}" }
  end

  private def handle_server_request(msg_id : Int32, json : JSON::Any)
    method = json["method"]?.try(&.to_s)
    send(error_payload(msg_id, :method_not_found, "Unhandled method #{method}"))
  end

  private def error_payload(msg_id : Int32, code : LSP::ErrorCodes, message : String) : String
    {"jsonrpc" => "2.0",
     "id"      => msg_id,
     "error"   => {"code" => code, "message" => message}}.to_json
  end

  private def handle_notification(json : JSON::Any)
    method = json["method"]?.try(&.to_s)
    if method == "window/logMessage" || method == "window/showMessage"
      type = json.dig?("params", "type")
      return if type.nil?

      message = json.dig?("params", "message").try(&.to_s)
      return if message.nil? || message.empty?

      message = message.to_s
      case MessageType.type_to_log_severity(type.as_i)
      when ::Log::Severity::Error then log.error { message }
      when ::Log::Severity::Warn  then log.warn { message }
      else
        log.info { message }
      end
    end
  end
end
