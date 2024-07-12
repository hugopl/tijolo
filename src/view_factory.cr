require "./text_view"
require "./hex_view"

class ViewFactory
  private ELF_SIGNATURE = 0x7f454c46 # In Big endian 0x7f, 'E', 'L', 'F'

  def self.build(resource : Path, project : Project) : View
    if image?(resource)
      raise TijoloError.new("Image files are not supported yet 😅.")
    elsif elf?(resource)
      HexView.new(resource, project)
    else
      TextView.new(resource, project)
    end
  end

  private def self.image?(resource) : Bool
    resource.extension.matches?(/\.(png|jpg|jpeg|bmp|heic|gif)/i)
  end

  private def self.elf?(resource) : Bool
    File.open(resource) do |f|
      signature = f.read_bytes(Int32, IO::ByteFormat::BigEndian)
      return signature == ELF_SIGNATURE
    end
    false
  end
end
