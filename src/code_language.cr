require "./code_model_factory"

class CodeLanguage
  NONE = CodeLanguage.new("")

  @lang : GtkSource::Language?
  getter code_model : CodeModel
  getter id : String

  @@languages = Hash(String, CodeLanguage).new

  def initialize(@id, @lang : GtkSource::Language? = nil)
    @code_model = CodeModelFactory.build(@lang.try(&.id))
  end

  def none?
    @id.empty?
  end

  def identifier_boundaries : String
    " \n\r\t()[]{}.,;></\\+=#|`-"
  end

  def self.detect(_nil : Nil) : CodeLanguage
    CodeLanguage::NONE
  end

  def line_comment : String
    @lang.try(&.metadata("line-comment-start")) || ""
  end

  def self.detect(file : Path) : CodeLanguage
    lang_manager = GtkSource::LanguageManager.default
    lang = lang_manager.language("docker") if file.basename == "Dockerfile"
    lang ||= lang_manager.guess_language(file.to_s, nil)
    lang ||= detect_by_content(file)

    lang_id = lang ? lang.id : ""
    @@languages[lang_id] ||= CodeLanguage.new(lang_id, lang)
  end

  def self.detect_by_content(file) : GtkSource::Language?
    File.open(file) do |io|
      contents = Bytes.new(2048) # No need to read the entire file
      contents_size = io.read(contents)
      mime = Gio.content_type_guess(file.to_s, contents[0, contents_size])
      return GtkSource::LanguageManager.default.guess_language(file.to_s, mime)
    end
  end
end
