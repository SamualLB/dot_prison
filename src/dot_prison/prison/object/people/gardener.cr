class DotPrison::Prison::Object::Gardener < DotPrison::Prison::Object
  include ObjectProperties
  include StaffNeeds
  include Orientation
  include Velocity
end
