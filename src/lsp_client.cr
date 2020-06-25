require "lsp"

class LspClient
  include LSP::Protocol

  alias ResponseCallback = Proc(ResponseMessage, Nil)

  Log = ::Log.for("LSP")

  getter? initialized = false

  @server : Process
  # Next request ID
  @next_id = -1
  @response_handlers = Hash(Int32, Proc(ResponseMessage, Nil)).new

  def initialize(command : String)
    @server = Process.new(command, shell: true, input: :pipe, output: :pipe, error: :pipe)
    Log.info { "Starting LSP for #{command.inspect} on pid #{@server.pid}" }

    initialize_request do |_response|
      @initialized = true
    end

    spawn do
      receiver_loop
    end
    Fiber.yield
  end

  def request(method : String, params : RequestType, &block : Proc(ResponseMessage, Nil))
    return unless initialized? || params.is_a?(InitializeParams)

    id = next_id
    @response_handlers[id] = block
    send(RequestMessage.new(id, method, params))
  end

  def notify(method : String, params : NotificationType)
    return unless initialized?

    send(NotificationMessage.new(method, params))
  end

  private def initialize_request(&block : ResponseCallback)
    capabilities = ClientCapabilities.new
    capabilities.text_document = TextDocumentClientCapabilities.new(definition: DefinitionClientCapabilities.new(false, true))

    params = InitializeParams.new(process_id: Process.pid,
      root_uri: "file://#{Dir.current}",
      client_info: ClientInfo.new("tijolo", VERSION),
      capabilities: capabilities)

    request("initialize", params, &block)
  end

  private def next_id
    @next_id += 1
  end

  private def send(message : RequestMessage | NotificationMessage) : Nil
    return Log.fatal { "Server died" } unless @server.exists?

    payload = message.to_json
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
