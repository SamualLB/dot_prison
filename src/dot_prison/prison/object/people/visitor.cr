class DotPrison::Prison::Object::Visitor < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include Orientation

  handle(:leaving, :Bool, :Leaving)

  custom_handle(:bio, :Store, :Bio)

  def initialize(store : Store, prison : Prison)
    super
    @bio = store.parse_store(:Bio)
  end
end
