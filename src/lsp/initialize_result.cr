require "./server_capabilities"

module LSP
  struct InitializeResult
    include JSON::Serializable

    property capabilities : ServerCapabilities

    def initialize(@capabilities)
    end
  end
end
