class Language
  getter line_comment : String
  getter id : String

  NONE = "none"

  def initialize
    @id = NONE
    @line_comment = ""
  end

  def initialize(@id, @line_comment = "")
  end

  def none?
    @id == NONE
  end

  def gtk_language : GtkSource::Language?
    return if none?

    GtkSource::LanguageManager.default.language(@id)
  end
end
