class ViewManagerLayout < Gtk::LayoutManager
  @switcher_width = 0
  @switcher_height = 0

  def initialize
    super
  end

  @[GObject::Virtual]
  def allocate(view_manager : ViewManager, width : Int32, height : Int32, base_line : Int32)
    view_manager.place_holder.size_allocate(0, 0, width, height, -1) if view_manager.place_holder.should_layout

    if view_manager.view_switcher.should_layout
      x = (width - @switcher_width) // 2
      y = (height - @switcher_height) // 2
      view_manager.view_switcher.size_allocate(x, y, @switcher_width, @switcher_height, -1)
    end

    root = view_manager.root?
    return if root.nil?

    root = view_manager.current_node.not_nil! if view_manager.maximized_view
    x, y = root.size_allocate(0, 0, width, height, view_manager.glow_view)
    if view_manager.focus_glow.should_layout
      view = view_manager.current_view?
      view_manager.focus_glow.size_allocate(x, y, view.width, view.height, -1) if view
    end
  end

  # Code above is to implement measure virtual function
  # it's manual due to https://github.com/hugopl/gi-crystal/issues/32, so expect some pointers and casts bellow

  def switch_width_ptr
    pointerof(@switcher_width)
  end

  def switch_height_ptr
    pointerof(@switcher_height)
  end

  private def self._vfunc_measure(this : Pointer(Void), lib_widget : Pointer(Void), lib_orientation : UInt32,
                                  lib_for_size : Int32, lib_minimum : Pointer(Int32), lib_natural : Pointer(Int32),
                                  lib_minimum_baseline : Pointer(Int32), lib_natural_baseline : Pointer(Int32)) : Void
    layout = ViewManagerLayout.new(this, :none)
    view_manager = ViewManager.new(lib_widget, :none)
    if view_manager.empty?
      LibGtk.gtk_widget_measure(view_manager.place_holder, lib_orientation, -1, lib_minimum, lib_natural, nil, nil)
    else
      integer = 0
      unused = pointerof(integer)
      if lib_orientation == 0
        LibGtk.gtk_widget_measure(view_manager.view_switcher, 0, -1, unused, layout.switch_width_ptr, unused, unused)
      else
        LibGtk.gtk_widget_measure(view_manager.view_switcher, 1, -1, unused, layout.switch_height_ptr, unused, unused)
      end
    end

    lib_minimum_baseline.value = -1
    lib_natural_baseline.value = -1
  end

  def self._class_init(type_struct : Pointer(LibGObject::TypeClass), user_data : Pointer(Void)) : Nil
    vfunc_ptr = (type_struct.as(Pointer(Void)) + 144).as(Pointer(Pointer(Void)))
    vfunc_ptr.value = (->_vfunc_measure(Pointer(Void), Pointer(Void), UInt32, Int32, Pointer(Int32), Pointer(Int32), Pointer(Int32), Pointer(Int32))).pointer
    previous_def
  end
end
