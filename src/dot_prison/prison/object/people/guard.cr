class DotPrison::Prison::Object::Guard < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include StaffNeeds
  include Orientation
  include PatrolProperties
  include Carrying
  include Job
  include EquipmentProperties
  include SecondaryEquipmentProperties
  include ArmourProperties

  handle(:tazer_trained, :Bool, :TazerTrained)
  handle(:training, :Float64, :Training)
end
