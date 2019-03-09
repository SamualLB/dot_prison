class DotPrison::Prison::Object::Doctor < DotPrison::Prison::Object
  include ObjectProperties
  include Velocity
  include Orientation

  handle(:room, :"Reference(Room)", :"AssignedRoom.i", :"AssignedRoom.u")
end
