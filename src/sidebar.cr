class Sidebar < Adw::Bin
  @project_root : String
  @dir_models = Hash(String, Gtk::DirectoryList).new
  @selection_model : Gtk::SingleSelection

  private DIR_MODEL_ATTRS = "#{Gio::FILE_ATTRIBUTE_STANDARD_NAME}," \
                            "#{Gio::FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON}," \
                            "#{Gio::FILE_ATTRIBUTE_STANDARD_SORT_ORDER}"

  def initialize(@project_root : String)
    super()

    @selection_model = Gtk::NoSelection.new
    change_model(project_root.to_s)
    list_view = Gtk::ListView.new(model: @selection_model)
    factory = Gtk::SignalListItemFactory.new
    factory.setup_signal.connect(->setup_item(GObject::Object))
    factory.bind_signal.connect(->bind_item(GObject::Object))
    list_view.factory = factory

    scrolled_window = Gtk::ScrolledWindow.new(vexpand: true, width_request: 250)
    scrolled_window.child = list_view
    self.child = scrolled_window

    list_view.activate_signal.connect(->activate(UInt32))
  end

  private def activate(position : UInt32) : Nil
    file_info = @selection_model.item(position)
    return unless file_info.is_a?(Gio::FileInfo)

    gfile = Gio::File.cast(file_info.attribute_object("standard::file"))
    if file_info.file_type.directory?
      change_model(gfile.path.to_s)
    else
      activate_action("win.open_file", gfile.path.to_s)
    end
  end

  private def change_model(path : String)
    model = @dir_models[path.to_s] ||= Gtk::DirectoryList.new(attributes: DIR_MODEL_ATTRS,
      file: Gio::File.new_for_path(path),
      monitored: true)
    @selection_model.model = model
  end

  def view_changed(view : View?)
    if view.nil?
      change_model(@project_root)
    elsif view.is_a?(DocumentView)
      resource = view.resource
      change_model(resource.dirname) if resource
    end
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
