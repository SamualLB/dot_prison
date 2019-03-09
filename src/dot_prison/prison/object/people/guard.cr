class DotPrison::Prison::Object::Guard < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation
  include Velocity
  include StaffNeeds
  include PatrolProperties

  handle(:tazer_trained, :Bool, :TazerTrained)
end
