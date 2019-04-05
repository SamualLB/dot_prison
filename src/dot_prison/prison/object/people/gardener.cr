class DotPrison::Prison::Object::Gardener < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include RestStateProperties
  include StaffNeeds
  include Orientation
  include Job

  handle :walk_speed, :Float64, :AiWalkSpeed

  def initialize(store : Store, prison : Prison)
    super
  end
end
