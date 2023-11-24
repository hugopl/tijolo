class ViewSwitcher < Adw::Bin
  @list_view : Gtk::ListView
  getter selection_model : Gtk::SingleSelection

  def initialize
    super(css_name: "view_switcher", visible: false)

    @selection_model = Gtk::SingleSelection.new(autoselect: false)
    @list_view = Gtk::ListView.new(model: @selection_model)
    @list_view.parent = self

    factory = Gtk::SignalListItemFactory.new
    factory.setup_signal.connect(->setup_item(GObject::Object))
    factory.bind_signal.connect(->bind_item(GObject::Object))
    @list_view.factory = factory
  end

  def model=(model : Gio::ListModel)
    @selection_model.model = model
  end

  private def setup_item(obj : GObject::Object) : Nil
    list_item = Gtk::ListItem.cast(obj)
    box = Gtk::Box.new(:horizontal, 6)
    # icon = Gtk::Image.new
    label = Gtk::Label.new
    # box.append(icon)
    box.append(label)
    list_item.child = box
  end

  private def bind_item(obj : GObject::Object)
    list_item = Gtk::ListItem.cast(obj)
    box = Gtk::Box.cast(list_item.child)
    view = View.cast(list_item.item)
    # Gtk::Image.cast(box.first_child).icon_name = doc.icon_name
    Gtk::Label.cast(box.last_child).label = view.label
  end
end
