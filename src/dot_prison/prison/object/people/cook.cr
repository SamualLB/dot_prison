class DotPrison::Prison::Object::Cook < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation

  handle(:assigned_room, :"Reference(Room)", :"AssignedRoom.i", :"AssignedRoom.u")
end
