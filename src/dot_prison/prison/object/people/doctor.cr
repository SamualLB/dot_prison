class DotPrison::Prison::Object::Doctor < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include Orientation
  include EquipmentProperties

  handle(:room, :"Reference(Room)", :"AssignedRoom.i", :"AssignedRoom.u")

  def initialize(store : Store, prison : Prison)
    super
  end
end
