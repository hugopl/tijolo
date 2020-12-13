module LSP
  enum MessageType
    Error   = 1
    Warning = 2
    Info    = 3
    Log     = 4

    def self.type_to_log_severity(value : Int32)
      case value
      when Error   then ::Log::Severity::Error
      when Warning then ::Log::Severity::Warn
      else
        ::Log::Severity::Info
      end
    end
  end
end
