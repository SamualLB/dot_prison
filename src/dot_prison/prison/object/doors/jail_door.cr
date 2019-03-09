class DotPrison::Prison::Object::JailDoor < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation
  include DoorProperties

  handle(:cell, :"Reference(Room)", :"CellId.i", :"CellId.u")
end
