private def style_scheme_for_color_scheme(scheme = Adw::StyleManager.default.color_scheme)
  style_manager = GtkSource::StyleSchemeManager.default
  if scheme.force_dark?
    style_manager.scheme("monokai")
  else
    style_manager.scheme("Adwaita")
  end
end

class CodeBuffer < GtkSource::Buffer
  @source_file : GtkSource::File

  def initialize
    super(style_scheme: style_scheme_for_color_scheme)

    @source_file = GtkSource::File.new
  end

  def load(resource : Path)
    @source_file.location = Gio::File.new_for_path(resource.to_s)
    loader = GtkSource::FileLoader.new(self, @source_file)
    finished_callback = ->(obj : GObject::Object?, result : Gio::AsyncResult) {
      loader.load_finish(result)
      iter = iter_at_offset(0)
      place_cursor(iter)
      nil
    }
    loader.load_async(GLib::PRIORITY_DEFAULT, finished_callback)
  end

  def save(resource : Path)
    Log.info { "Saving buffer to #{resource}" }
    remove_trailing_spaces!
    @source_file.location = Gio::File.new_for_path(resource.to_s)
    saver = GtkSource::FileSaver.new(self, @source_file)
    saver.save_async(GLib::PRIORITY_DEFAULT, nil, nil, nil, nil, nil, nil)
    self.modified = false
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

  def color_scheme=(scheme : Adw::ColorScheme)
    self.style_scheme = style_scheme_for_color_scheme(scheme)
  end
end
