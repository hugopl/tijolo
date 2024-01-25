class CodeBuffer < GtkSource::Buffer
  def initialize
    super
  end

  def save(io : IO)
    remove_trailing_spaces!
    self.modified = false
    # TODO: Use a file GtkSource::FileSaver here to speed up things
    io.write(text.to_slice)
  end

  def code_language : CodeLanguage
    lang = language.try(&.id) || ""
    CodeLanguage.new(lang)
  end

  private def remove_trailing_spaces!
    user_action do
      iter = start_iter
      loop do
        iter.forward_to_line_end
        end_line = iter.copy
        while iter.backward_char
          break unless iter.char.in?(' ', '\t')
        end
        iter.forward_char

        delete(iter, end_line)
        break unless iter.forward_line
      end
    end
  end
end
