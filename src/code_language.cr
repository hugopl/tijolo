struct CodeLanguage
  NONE = CodeLanguage.new("")

  getter id : String

  def initialize(@id)
  end

  def none?
    @id.empty?
  end

  def line_comment : Bytes
    # FIXME: Get this from language.
    "#".to_slice
  end

  def self.detect(_nil : Nil) : CodeLanguage
    CodeLanguage::NONE
  end

  {% if flag?(:experimental) %}
    def self.detect(resource : Path) : CodeLanguage
      # FIXME: Replace this scafold with a real implementation in crystal-tree-sitter shard
      #        Meanwhile just JSON and C for testing 😅️
      lang = case resource.extension
             when ".json" then "json"
             when ".c"    then "c"
             else
               return CodeLanguage::NONE
             end
      CodeLanguage.new(lang)
    end
  {% end %}
end
