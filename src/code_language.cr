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
    # FIXME: Remove this Ugly workaround
    lang = lang_manager.language("docker") if lang.nil? && file.basename == "Dockerfile"

    lang_id = lang ? lang.id : ""
    CodeLanguage.new(lang_id, lang)
  end
end
