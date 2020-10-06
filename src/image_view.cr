class ImageView < View
  def initialize(file_path : Path, project_path : Path? = nil)
    @image = Gtk::Image.new_from_file(file_path.to_s)
    super(@image, file_path, project_path)
  end

  def modified? : Bool
    false
  end

  def grab_focus
  end
end
