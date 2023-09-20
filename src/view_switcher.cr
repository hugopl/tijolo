class ViewSwitcher < Adw::Bin
  @list_view : Gtk::ListView

  def initialize
    super(css_name: "view_switcher", visible: false)

    @list_view = Gtk::ListView.new
    @list_view.parent = self

    factory = Gtk::SignalListItemFactory.new
    # FIXME: It's crashing on this, not sure if a GC stuff, some ref I forgot to increase
    # or some bad stuff being done during casts.
    #
    # factory.setup_signal.connect(->setup_item(GObject::Object))
    # factory.bind_signal.connect(->bind_item(GObject::Object))
    @list_view.factory = factory
  end

  def model=(model : Gio::ListModel)
    selection_model = Gtk::SingleSelection.new(model)
    selection_model.autoselect = false
    @list_view.model = Gtk::SingleSelection.new(selection_model)
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
