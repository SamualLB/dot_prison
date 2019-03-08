class DotPrison::Prison::Object::Cook < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation
  include Velocity
  include StaffNeeds

  handle(:assigned_room, :"Reference(Room)", :"AssignedRoom.i", :"AssignedRoom.u")
end
