require "colorize"

struct TijoloLogFormat
  extend Log::Formatter

  def self.format(entry : Log::Entry, io : IO)
    # Timestamp
    io << entry.timestamp.hour << ':' << entry.timestamp.minute << " "

    # Colored severity
    (6 - entry.severity.label.size).times do
      io << ' '
    end
    color = case entry.severity
            when .error?  then Colorize::ColorANSI::Red
            when .fatal?  then Colorize::ColorANSI::Red
            when .notice? then Colorize::ColorANSI::Blue
            when .info?   then Colorize::ColorANSI::Green
            when .warn?   then Colorize::ColorANSI::Yellow
            when .trace?  then Colorize::ColorANSI::Cyan
            else
              Colorize::ColorANSI::Default
            end
    entry.severity.label.colorize(color).to_s(io)

    # Message
    io << ": " << entry.message
  end
end
