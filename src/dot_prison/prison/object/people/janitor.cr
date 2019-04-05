class DotPrison::Prison::Object::Janitor < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include RestStateProperties
  include StaffNeeds
  include Orientation
  include Job
  include Carrying

  handle :walk_speed, :Float64, :AiWalkSpeed

  def initialize(store : Store, prison : Prison)
    super
  end
end
