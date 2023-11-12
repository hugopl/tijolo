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

  def self.detect(resource : Path) : CodeLanguage
    lang = GtkSource::LanguageManager.default.guess_language(resource.to_s, nil)
    pp! lang

    lang_id = lang ? lang.id : ""
    CodeLanguage.new(lang_id, lang)
  end
end
