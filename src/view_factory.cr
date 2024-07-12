require "./text_view"
require "./hex_view"

class ViewFactory
  @@buffer = Bytes.new(128)

  def self.build(resource : Path, project : Project) : View
    if image?(resource)
      HexView.new(resource, project).tap do |view|
        view.add_toast("Image files are not supported yet. Have fun with an hex editor 😅")
      end
    elsif binary?(resource)
      {% if flag?(:no_hexeditor) %}
        raise TijoloError.new("Tijolo was compiled without support for an hexeditor 😢.")
      {% else %}
        HexView.new(resource, project)
      {% end %}
    else
      TextView.new(resource, project)
    end
  end

  private def self.image?(resource) : Bool
    resource.extension.matches?(/\.(png|jpg|jpeg|bmp|heic|gif)/i)
  end

  private def self.binary?(resource) : Bool
    File.open(resource) do |file|
      size = file.read(@@buffer)
      index = @@buffer.index(0)
      return false if index.nil? || index >= size
    end
    true
  end
end
