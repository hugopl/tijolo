require "./language"
require "./helper"

# Thin wrapper for GtkSource::LanguageManager
class LanguageManager
  @languages = Hash(String, Language).new

  def self.gtk_lang_manager : GtkSource::LanguageManager
    GtkSource::LanguageManager.default
  end

  private def find_gtk_lang(id : String)
    LanguageManager.gtk_lang_manager.language(id)
  end

  def find(id : String) : Language
    @languages[id]? || create_lang(find_gtk_lang(id))
  end

  def guess_language(file : Path) : Language
    manager = LanguageManager.gtk_lang_manager
    gtk_lang = manager.guess_language(file.basename, nil)
    if gtk_lang.nil?
      content_type = content_type(file)
      gtk_lang = manager.guess_language(nil, content_type) if content_type
    end

    id = gtk_lang ? gtk_lang.id : Language::NONE_ID
    @languages[id]? || create_lang(gtk_lang)
  end

  private def content_type(file : Path)
    data = File.read(file).to_slice
    contents, _uncertain = Gio.content_type_guess(file.basename, data)
    contents
  rescue IO::Error
    nil
  end

  def shutdown
    @languages.each_value(&.shutdown)
  end

  private record LanguageGlob, language_id : String, glob : String

  def start_languages_for(files : Enumerable(Path)) : Nil
    config = Config.instance
    return unless config.language_servers_enabled?

    manager = LanguageManager.gtk_lang_manager
    globs = Array(LanguageGlob).new
    config.language_servers.keys.each do |lang_id|
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
        Log.info { "Detected #{glob.language_id} in the project due to '#{file}'." }
        find(glob.language_id)                                  # Start the language.
        globs.reject! { |e| e.language_id == glob.language_id } # Remove the language globs
      end
    end
  end

  private def create_lang(gtk_lang)
    lang = if gtk_lang.nil?
             Language::NONE
           else
             Language.new(gtk_lang)
           end
    @languages[lang.id] = lang
  end
end
