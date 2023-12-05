require "spec"
require "libadwaita"
require "log"
require "../src/application"
require "../src/monkey_patches"

class TestView < View
  def initialize(name : String = "noname")
    super(Adw::Bin.new)
    self.label = name
  end

  def grab_focus
  end
end

macro assert_visible(*views)
  {{ views }}.each do |view|
    view.visible.should eq(true)
  end
end

macro assert_not_visible(*views)
  {{ views }}.each do |view|
    view.visible.should eq(false)
  end
end

Adw.init
