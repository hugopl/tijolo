require "./language"

class LanguageManager
  @@languages = Hash(String, Language).new

  def self.find(id : String)
    @@languages[id]? || create_lang(GtkSource::LanguageManager.default.language(id))
  end

  def self.guess_language(file : String, mimetype : String?) : Language
    gtk_lang = GtkSource::LanguageManager.default.guess_language(file, mimetype)

    id = gtk_lang ? gtk_lang.id : Language::NONE
    @@languages[id]? || create_lang(gtk_lang)
  end

  private def self.create_lang(gtk_lang)
    lang = if gtk_lang.nil?
             Language.new(Language::NONE, "")
           else
             Language.new(gtk_lang.id, gtk_lang.metadata("line-comment-start").to_s)
           end
    @@languages[lang.id] = lang
  end
end
