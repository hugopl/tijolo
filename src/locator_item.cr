class LocatorItem < GObject::Object
  @[GObject::Property]
  property name : String
  @[GObject::Property]
  property icon_name : String
  @[GObject::Property]
  property description : String

  def initialize(@name = "", @description = "", @icon_name = "")
    super()
  end
end
