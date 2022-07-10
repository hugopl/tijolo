require "./text_view"

class ViewFactory
  def self.build(resource : Path)
    case resource.extension
    when /\.(png|jpg|jpeg|bmp)/i
      # ImageView.new(file.not_nil!, project_path)
      raise TijoloError.new "images not supported yet"
    else
      # create_text_view(file, project_path)
      TextView.new(resource)
    end
  end
end
