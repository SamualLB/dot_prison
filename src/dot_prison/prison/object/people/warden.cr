class DotPrison::Prison::Object::Warden < DotPrison::Prison::Object
  include ObjectProperties
  include Office
  include PeopleProperties
  include Orientation
  include EquipmentProperties

  def initialize(store : Store, prison : Prison)
    super
  end
end
