require "ecr"

module UiBuilderHelper
  macro builder_for(file)
    {% if flag?(:release) %}
    Gtk::Builder.new_from_string({{ read_file("#{__DIR__}/ui/" + file + ".glade") }}, -1)
    {% else %}
    Gtk::Builder.new_from_file("#{__DIR__}/ui/" + {{ file }} + ".glade")
    {% end %}
  end

  protected def apply_css(scheme : GtkSource::StyleScheme)
    display = Gdk::Display.default.not_nil!
    screen = display.default_screen
    css_provider = Gtk::CssProvider.new
    css_provider.load_from_data(css_for(scheme))
    Gtk::StyleContext.add_provider_for_screen(screen, css_provider, Gtk::STYLE_PROVIDER_PRIORITY_APPLICATION)
  end

  private def css_for(scheme)
    css_enabled = true
    begin
      bg_style = load_style(scheme, "background-pattern")
      text_style = load_style(scheme, "text")
      selection_style = load_style(scheme, "selection")

      text_style_fg = text_style.foreground
      text_style_bg = text_style.background
      bg_style_bg = bg_style.background
      selection_style_fg = selection_style.foreground
      selection_style_bg = selection_style.background
    rescue e
      Log.warn { e.message }
      css_enabled = false
    end

    ECR.render("#{__DIR__}/ui/application.css.ecr")
  end

  private def load_style(scheme, style)
    scheme.style(style) || raise "Failed to load style #{style} on #{scheme.name}."
  end
end
