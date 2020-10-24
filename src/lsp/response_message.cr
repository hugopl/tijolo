require "./initialize_result"
require "./location"
require "./response_error"
require "./symbol_information"

module LSP
  # Add a response type when needed
  alias ResponseTypes = Array(Location) | Array(SymbolInformation) | Location | InitializeResult

  struct ResponseMessage
    include JSON::Serializable

    @[JSON::Field(emit_null: true)]
    property id : Int32 | String | Nil

    property result : ResponseTypes?
    property error : ResponseError?

    @jsonrpc = "2.0"

    def initialize(@id, @result)
    end

    def initialize(@result)
    end

    def initialize(ex : Exception)
      @error = ResponseError.new(ex)
    end
  end
end
