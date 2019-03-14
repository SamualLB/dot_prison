class DotPrison::Prison::Object::Accountant < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include Office
  include Orientation
  include EquipmentProperties

  def initialize(store : Store, prison : Prison)
    super
  end
end
