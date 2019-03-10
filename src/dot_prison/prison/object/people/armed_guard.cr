class DotPrison::Prison::Object::ArmedGuard < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include PatrolProperties
  include Orientation
  include StaffNeeds
  include EquipmentProperties
  include SecondaryEquipmentProperties
  include ArmourProperties
  include Carrying

  handle(:squad_member, :Int32, :SquadMember)
  handle(:tazer_trained, :Bool, :TazerTrained)
  handle(:weapon_drawn, :Float64, :WeaponDrawn)
end
