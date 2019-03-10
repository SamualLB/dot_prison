class DotPrison::Prison::Object::Cook < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include Orientation
  include StaffNeeds
  include Job
  include Carrying

  handle(:assigned_room, :"Reference(Room)", :"AssignedRoom.i", :"AssignedRoom.u")
end
