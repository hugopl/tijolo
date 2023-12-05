class ViewSwitcher < Adw::Bin
  @list_view : Gtk::ListView
  @selection_model : Gtk::SingleSelection

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
    flat_model = Gtk::FlattenListModel.new(model)
    @selection_model.model = flat_model
  end

  def reset
    @selection_model.selected = 0
  end

  def rotate(reverse : Bool)
    n_items = @selection_model.n_items
    return if n_items.zero?

    max_pos = n_items - 1
    pos = @selection_model.selected
    if reverse
      pos = pos.zero? ? max_pos : pos - 1
    else
      pos = pos == max_pos ? 0 : pos + 1
    end
    @selection_model.selected = pos.to_u32
  end

  def selected_view
    @selection_model.selected_item.as(View)
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
