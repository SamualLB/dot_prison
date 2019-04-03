class DotPrison::Prison::Object::Guard < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include RestStateProperties
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
  handle(:station, :"Reference(Room)", :"Station.i", :"Station.u")
  handle :has_keys, :Bool, :HasKeys
  handle :tazer_recharge, :Float64, :TazerRecharge

  def initialize(store : Store, prison : Prison)
    super
  end
end
