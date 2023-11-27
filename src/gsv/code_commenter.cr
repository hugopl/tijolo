module CodeCommenter
  def comment_code : Nil
    buffer = source_buffer
    return unless editable?

    start_iter, end_iter = buffer.selection_bounds
    start_iter.line_offset = 0

    count = end_iter.line - start_iter.line
    count += 1 unless end_iter.starts_line
    count = 1 if count.zero?

    if lines_uncommentable?(start_iter.copy, count)
      uncomment_lines(start_iter.copy, count)
    else
      comment_lines(start_iter, count)
    end
  end

  private def lines_uncommentable?(iter : Gtk::TextIter, count : Int32) : Bool
    line_comment = language.line_comment
    count.times do
      return false if iter.is_end
      return false unless iter.forward_whitespaces
      return false unless iter.find_text_forward(line_comment)

      iter.forward_line
    end
    true
  end

  def find_text_indent(iter : Gtk::TextIter, count : Int32) : Int32
    indent = Int32::MAX
    count.times do
      return 0 if iter.is_end
      return 0 unless iter.forward_whitespaces

      line_indent = iter.line_offset
      indent = line_indent if line_indent < indent
      iter.forward_line
    end
    indent
  end

  private def comment_lines(iter : Gtk::TextIter, count : Int32)
    line_comment = language.line_comment
    indent = find_text_indent(iter.copy, count)
    buffer = source_buffer

    buffer.user_action do
      count.times do
        iter.forward_chars(indent)
        buffer.insert(iter, line_comment)
        iter.forward_line
      end
    end
  end

  private def uncomment_lines(iter : Gtk::TextIter, count : Int32)
    line_comment = language.line_comment
    indent = find_text_indent(iter.copy, count)
    buffer = source_buffer

    buffer.user_action do
      count.times do
        iter.forward_whitespaces
        end_iter = iter.dup
        end_iter.forward_chars(line_comment.size)
        buffer.delete(iter, end_iter)
        iter.forward_line
      end
    end
  end
end
