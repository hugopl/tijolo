require "lsp"

class LspClient
  include LSP::Protocol

  alias ResponseCallback = Proc(ResponseMessage, Nil)

  Log = ::Log.for("LSP")

  getter? initialized = false

  @server : Process
  # Next request ID
  @next_id = 0
  @response_handlers = Hash(Int32, Proc(ResponseMessage, Nil)).new

  def initialize(command : String)
    @server = Process.new(command, shell: true, input: :pipe, output: :pipe, error: :pipe)
    Log.info { "Starting LSP for #{command.inspect} on pid #{@server.pid}" }

    initialize_request do |_response|
      @initialized = true
      notify("initialized", VoidParams.new)
    end

    spawn do
      receiver_loop
    end
    Fiber.yield
  end

  def request(method : String, params : RequestType, &block : Proc(ResponseMessage, Nil))
    return unless initialized?

    id = next_id
    payload = RequestMessage.new(id, method, params).to_json
    request(id, payload, &block)
  end

  private def request(id : Int32, payload : String, &block : Proc(ResponseMessage, Nil))
    @response_handlers[id] = block
    send(payload)
  end

  def notify(method : String, params : NotificationType)
    return unless initialized?

    payload = NotificationMessage.new(method, params).to_json
    send(payload)
  end

  private def initialize_request(&block : ResponseCallback)
    request(0, initialize_request_payload, &block)
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
              "dynamicRegistration" => true,
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
            },
            # "references" => {
            #   "dynamicRegistration" => true,
            # },
            "documentHighlight" => {
              "dynamicRegistration" => false,
            },
            # "documentSymbol" => {
            #   "dynamicRegistration" => true,
            #   "symbolKind"          => {
            #     "valueSet" => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26],
            #   },
            #   "hierarchicalDocumentSymbolSupport" => true,
            # },
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

  private def send(payload : String) : Nil
    return Log.fatal { "Server died" } unless @server.exists?

    output = @server.input
    output << "Content-Length: #{payload.bytesize}\r\n\r\n#{payload}"

    Log.info { "> #{payload}" }
  end

  # All code bellow runs in a separete thread
  ###########################################

  private def receiver_loop
    input = @server.output
    content_length = 0
    loop do
      line = input.read_line
      if line =~ /Content-Length: (\d+)/
        content_length = $1.to_i
      elsif line.empty?
        bytes = Bytes.new(content_length)
        input.read(bytes)
        decode_server_message(String.new(bytes))
      end
    end
  rescue e : IO::EOFError
    Log.fatal { "Server closed output." }
  end

  private def decode_server_message(data : String)
    json = JSON.parse(data)

    msg_id = json["id"]?
    return if msg_id.nil?

    handler = @response_handlers[msg_id]?
    return if handler.nil?

    Log.info { "< #{data}" }
    # TODO: Handle server requets
    message = ResponseMessage.from_json(data)
    GLib.timeout(0) do
      handler.try(&.call(message))
      false
    end
    @response_handlers.delete(msg_id)
  end
end
