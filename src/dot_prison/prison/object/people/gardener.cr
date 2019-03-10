class DotPrison::Prison::Object::Gardener < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include StaffNeeds
  include Orientation
  include Job
end
