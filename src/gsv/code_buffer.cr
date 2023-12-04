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
    remove_trailing_spaces!
    @buffer.modified = false
    # TODO: Use a file GtkSource::FileSaver here to speed up things
    io.write(@buffer.text.to_slice)
  end

  def language : CodeLanguage
    lang = @buffer.language.try(&.id) || ""
    CodeLanguage.new(lang)
  end

  delegate cursor_position, to: @buffer

  private def remove_trailing_spaces!
    @buffer.user_action do
      iter = @buffer.start_iter
      loop do
        iter.forward_to_line_end
        end_line = iter.copy
        while iter.backward_char
          break unless iter.char.in?(' ', '\t')
        end
        iter.forward_char

        @buffer.delete(iter, end_line)
        break unless iter.forward_line
      end
    end
  end
end
