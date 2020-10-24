module LSP
  struct Position
    include JSON::Serializable

    property line : Int32
    property character : Int32

    def initialize(@line, @character)
    end
  end
end
