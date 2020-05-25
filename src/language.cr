class Language
  getter gtk_language : GtkSource::Language
  getter line_comment : String
  getter id : String

  def initialize(@gtk_language)
    @line_comment = @gtk_language.metadata("line-comment-start").to_s
    @id = @gtk_language.id
  end
end
