struct CodeLanguage
  @lang : GtkSource::Language?

  def initialize(@id, @lang : GtkSource::Language?)
  end

  def line_comment : Bytes
    lang = @lang
    return Bytes.new if lang.nil?

    line_comment = lang.metadata("line-comment-start")
    return Bytes.new if line_comment

    line_comment.to_slice
  end

  def self.detect(file : Path) : CodeLanguage
    lang_manager = GtkSource::LanguageManager.default
    lang = lang_manager.guess_language(file.to_s, nil)
    if lang.nil?
      type = content_type(file)
      lang = lang_manager.guess_language(nil, type) if type
    end
    lang_id = lang ? lang.id : ""
    CodeLanguage.new(lang_id, lang)
  end

  private def self.content_type(file : Path) : String?
    data = File.read(file).to_slice
    Gio.content_type_guess(file.basename, data)
  rescue IO::Error
    nil
  end
end
