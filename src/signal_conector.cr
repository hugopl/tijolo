module SignalConnector
  @connections = [] of GObject::SignalConnection

  macro connect(signal, &slot)
    %id = {{ signal }}.connect {{ slot }}
    @connections << %id
  end

  def disconnect_signals
    Log.info { "Disconnecting #{@connections.size} signals from #{self.class.name}" }
    @connections.each(&.disconnect)
    @connections.clear
  end
end
