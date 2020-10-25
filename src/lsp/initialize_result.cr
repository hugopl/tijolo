require "json"
require "./server_capabilities"

module LSP
  struct ServerInfo
    include JSON::Serializable

    getter name : String
    getter version : String?
  end

  struct InitializeResult
    include JSON::Serializable

    property capabilities : ServerCapabilities

    @server_info : ServerInfo?

    def initialize(@capabilities)
    end
  end
end
