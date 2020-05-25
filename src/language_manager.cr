require "./language"

class LanguageManager
  @@languages = Hash(String, Language).new

  def self.find(lang_id : String) : Language?
    lang = @@languages[lang_id]?
    return lang if lang

    gtk_lang = GtkSource::LanguageManager.default.language(lang_id)
    create_lang(gtk_lang)
  end

  def self.guess_language(file : String, mimetype : String?) : Language?
    gtk_lang = GtkSource::LanguageManager.default.guess_language(file, mimetype)
    return if gtk_lang.nil?

    lang_id = gtk_lang.id
    lang = @@languages[lang_id]?
    return lang if lang

    create_lang(gtk_lang)
  end

  private def self.create_lang(gtk_lang)
    return if gtk_lang.nil?

    @@languages[gtk_lang.id] = Language.new(gtk_lang)
  end
end
