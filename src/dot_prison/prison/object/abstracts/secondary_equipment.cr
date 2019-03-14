module DotPrison::Prison::Object::SecondaryEquipmentProperties
  macro included
    custom_handle(:secondary_equipment, :"SecondaryEquipment | String", :SecondaryEquipment)
  end

  def initialize(store : Store, prison : Prison)
    super
    equipment = SecondaryEquipment.from_store(store.parse_string(:Equipment))
  end
end

enum DotPrison::Prison::Object::SecondaryEquipment
  Baton
  Tazer

  def self.from_store(str) : SecondaryEquipment | String
    str = str || ""
    parsed = parse?(str)
    return parsed if parsed
    DotPrison.logger.debug "Unknown secondary equipment #{str}" unless str.empty?
    str
  end
end
