class Sidebar < Adw::Bin
  @list_view = Gtk::ListView.new
  @model : Gtk::DirectoryList

  def initialize(project_root : Path)
    super()

    @model = Gtk::DirectoryList.new(attributes: Gio::FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON,
      file: Gio::File.new_for_path(project_root.to_s),
      monitored: true)
    @list_view.model = Gtk::SingleSelection.new(@model)
    factory = Gtk::SignalListItemFactory.new
    factory.setup_signal.connect(->setup_item(GObject::Object))
    factory.bind_signal.connect(->bind_item(GObject::Object))
    @list_view.factory = factory

    scrolled_window = Gtk::ScrolledWindow.new(vexpand: true, width_request: 250)
    scrolled_window.child = @list_view
    self.child = scrolled_window

    @list_view.activate_signal.connect(->activate(UInt32))
  end

  private def activate(position : UInt32) : Nil
    file_info = @model.item(position)
    return unless file_info.is_a?(Gio::FileInfo)
    return if file_info.file_type.directory?

    gfile = Gio::File.cast(file_info.attribute_object("standard::file"))
    activate_action("win.open_file", gfile.path.to_s)
  end

  private def setup_item(obj : GObject::Object)
    list_item = Gtk::ListItem.cast(obj)
    box = Gtk::Box.new(:horizontal, 6)
    box.append(Gtk::Image.new)
    box.append(Gtk::Label.new)
    list_item.child = box
  end

  private def bind_item(obj : GObject::Object)
    list_item = Gtk::ListItem.cast(obj)
    box = list_item.child.as(Gtk::Box)
    image = box.first_child.as(Gtk::Image)
    label = box.last_child.as(Gtk::Label)

    file = Gio::FileInfo.cast(list_item.item)
    label.label = file.name.to_s
    image.gicon = file.symbolic_icon
  end
end
