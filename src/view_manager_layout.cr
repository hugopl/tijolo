class ViewManagerLayout < Gtk::LayoutManager
  def initialize
    super
  end

  @[GObject::Virtual]
  def allocate(view_manager : ViewManager, @width : Int32, @height : Int32, base_line : Int32)
    root = view_manager.root?
    if root.nil?
      view_manager.place_holder.size_allocate(0, 0, width, height, -1)
      return
    end

    root.size_allocate(0, 0, width, height)
  end

  # Code above is to implement measure virtual function
  # it's manual due to https://github.com/hugopl/gi-crystal/issues/32
  private def self._vfunc_measure(this : Pointer(Void), lib_widget : Pointer(Void), lib_orientation : UInt32,
                                  lib_for_size : Int32, lib_minimum : Pointer(Int32), lib_natural : Pointer(Int32),
                                  lib_minimum_baseline : Pointer(Int32), lib_natural_baseline : Pointer(Int32)) : Void
    view_manager = ViewManager.new(lib_widget, :none)
    if view_manager.views.empty?
      LibGtk.gtk_widget_measure(view_manager.place_holder, lib_orientation, -1, lib_minimum, lib_natural, nil, nil)
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
