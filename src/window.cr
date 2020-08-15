require "./ui_builder_helper"

abstract class Window
  include UiBuilderHelper

  getter application : Application
  getter root : Gtk::Widget

  delegate main_window, to: @application

  def initialize(@application : Application, builder : Gtk::Builder)
    @root = Gtk::Widget.cast(builder["root"])
    @root.ref
  end

  def destroy
    @root.destroy
    @root.unref
  end
end
