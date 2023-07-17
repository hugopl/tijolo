struct CodeBuffer
  getter buffer : GtkSource::Buffer

  def initialize(@buffer)
  end

  def bind_property(source_property, target, target_property, flags : GObject::BindingFlags)
    if source_property == "modified"
      @buffer.modified_changed_signal.connect do
        target.set_property(target_property, @buffer.modified)
      end
    else
      @buffer.bind_property(source_property, target, target_property, flags)
    end
  end

  def save(io : IO)
    io.write(@buffer.text.to_slice)
  end

  delegate cursor_position, to: @buffer
end
