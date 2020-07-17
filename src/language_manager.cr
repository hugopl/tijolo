require "./language"
require "./helper"

# Thin wrapper for GtkSource::LanguageManager
class LanguageManager
  @@languages = Hash(String, Language).new
  @@initied = false

  private def self.gtk_lang_manager : GtkSource::LanguageManager
    return GtkSource::LanguageManager.default if @@initied

    manager = GtkSource::LanguageManager.default
    manager.search_path = usr_share_paths("language-specs", manager.search_path.to_a)

    @@initied = true
    manager
  end

  def self.find_gtk_lang(id : String)
    gtk_lang_manager.language(id)
  end

  def self.find(id : String)
    @@languages[id]? || create_lang(gtk_lang_manager.language(id))
  end

  def self.guess_language(file : String, mimetype : String?) : Language
    gtk_lang = gtk_lang_manager.guess_language(file, mimetype)

    id = gtk_lang ? gtk_lang.id : Language::NONE
    @@languages[id]? || create_lang(gtk_lang)
  end

  def self.shutdown
    @@languages.each_value(&.shutdown)
  end

  private record LanguageGlob, language_id : String, glob : String

  def self.start_languages_for(files : Enumerable(Path)) : Nil
    manager = gtk_lang_manager
    globs = Array(LanguageGlob).new
    Config.instance.language_servers.keys.each do |lang_id|
      lang_globs = manager.language(lang_id).try(&.globs)
      next if lang_globs.nil?

      lang_globs.each do |glob|
        globs << LanguageGlob.new(lang_id, glob)
      end
    end

    files.each do |file|
      return if globs.empty?

      glob = globs.find { |e| File.match?(e.glob, file.basename) }
      if glob
        find(glob.language_id)                                  # Start the language.
        globs.reject! { |e| e.language_id == glob.language_id } # Remove the language globs
      end
    end
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
