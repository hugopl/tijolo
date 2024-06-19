private def style_scheme_for_color_scheme(scheme = Adw::StyleManager.default.color_scheme)
  style_manager = GtkSource::StyleSchemeManager.default
  if scheme.force_dark?
    style_manager.scheme("monokai")
  else
    style_manager.scheme("Adwaita")
  end
end

class CodeBuffer < GtkSource::Buffer
  def initialize
    super(style_scheme: style_scheme_for_color_scheme)
  end

  def code_language : CodeLanguage
    lang = language.try(&.id) || ""
    CodeLanguage.new(lang)
  end

  def remove_trailing_spaces!
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

  def color_scheme=(scheme : Adw::ColorScheme)
    self.style_scheme = style_scheme_for_color_scheme(scheme)
  end
end
