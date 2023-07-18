require "./text_view"

class ViewFactory
  def self.build(resource : Path, project : Project)
    case resource.extension
    when /\.(png|jpg|jpeg|bmp)/i
      # ImageView.new(file.not_nil!, project_path)
      raise TijoloError.new "images not supported yet"
    else
      # create_text_view(file, project_path)
      TextView.new(resource, project)
    end
  end

  def self.label_for(resource : Path, project : Project) : String
    resource.relative_to(project.root).to_s
  end
end
