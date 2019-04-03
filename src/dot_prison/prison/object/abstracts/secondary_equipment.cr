module DotPrison::Prison::Object::SecondaryEquipmentProperties
  macro included
    custom_handle(:secondary_equipment, :"Equipment | String", :SecondaryEquipment)
  end

  def initialize(store : Store, prison : Prison)
    super
    equipment = Equipment.from_store(store.parse_string(:Equipment))
  end
end
