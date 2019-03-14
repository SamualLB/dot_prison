class DotPrison::Prison::Object::ParoleLawyer < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include EmptyNeeds
  include ExternalTeacher
  include Rotation

  def initialize(store : Store, prison : Prison)
    super
  end
end
