struct CodeLanguage
  NONE = CodeLanguage.new("")

  @lang : GtkSource::Language?
  getter id : String

  def initialize(@id, @lang : GtkSource::Language? = nil)
  end

  def none?
    @id.empty?
  end

  def self.detect(_nil : Nil) : CodeLanguage
    CodeLanguage::NONE
  end

  def line_comment : String
    @lang.try(&.metadata("line-comment-start")) || ""
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
