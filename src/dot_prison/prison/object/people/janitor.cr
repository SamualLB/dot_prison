class DotPrison::Prison::Object::Janitor < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include StaffNeeds
  include Orientation
  include Job
  include Carrying
end
