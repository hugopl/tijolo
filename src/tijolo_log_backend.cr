require "log"

class TijoloLogBackend < Log::Backend
  @gtk_buffer : Gtk::TextBuffer?
  @buffer = Array(Log::Entry).new

  def self.instance
    @@instance ||= TijoloLogBackend.new
  end

  def gtk_buffer=(gtk_buffer : Gtk::TextBuffer)
    raise ArgumentError.new unless @gtk_buffer.nil?

    gtk_buffer.ref
    @gtk_buffer = gtk_buffer
  end

  def write(entry : Log::Entry)
    if @gtk_buffer.nil?
      @buffer << entry
    else
      flush_buffer if @buffer.any?
      write_to_gtk(entry)
    end
  end

  private def bufferize(entry)
    @buffer = buffer = [] of Log::Entry if @buffer.nil?
    buffer << entry
  end

  private def flush_buffer
    @buffer.each do |entry|
      write_to_gtk(entry)
    end
    @buffer.clear
  end

  def write_to_gtk(entry : Log::Entry)
    gtk_buffer = @gtk_buffer.not_nil!
    str = format(entry)

    # This can be called from a different threads, so we make sure to call GTK on main thread.
    GLib.idle_add do
      iter = gtk_buffer.start_iter
      gtk_buffer.insert_markup(iter, str, str.bytesize)
      false
    end
  end

  private def format(entry) : String
    # FIXME: These gsubs are ugly and slow...
    message = entry.message.gsub("&", "&amp;").gsub("<", "&lt;")
    if entry.message.index('\e')
      message = message.gsub(/\e\[0m/, "</span>")
        .gsub(/\e\[31m/, "<span foreground=\"#E2246B\">") # red
        .gsub(/\e\[32m/, "<span foreground=\"#A1D82B\">") # green
        .gsub(/\e\[34m/, "<span foreground=\"#268BD2\">") # blue
    end
    time = entry.timestamp
    space = entry.source.empty? ? "" : " "
    sprintf("<i>%02d:%02d:%02d</i> <b>%s</b> %s%s%s\n", time.hour, time.minute, time.second,
      entry.severity.to_s.upcase, entry.source, space, message)
  end
end
