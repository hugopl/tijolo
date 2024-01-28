require "./empty_code_model"
require "./lame_regex_crystal_code_model"

class CodeModelFactory
  def self.build(lang_id : String?) : CodeModel
    # Remove Ruby form here once LSP is back working
    if lang_id.in?("crystal", "ruby")
      LameRegexCrystalCodeModel.new
    else
      EmptyCodeModel.new
    end
  end
end
