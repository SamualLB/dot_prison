module DotPrison::Prison::Object::EquipmentProperties
  macro included
    custom_handle(:equipment, :"Equipment | String", :Equipment)
  end

  def initialize(store : Store, prison : Prison)
    super
    @equipment = Equipment.from_store(store.parse_string(:Equipment))
  end
end

enum DotPrison::Prison::Object::Equipment
  Baton
  Clipboard
  DogLeash
  Needle
  Rifle
  Shotgun

  def self.from_store(str) : Equipment | String
    str = str || ""
    parsed = parse? str
    return parsed if parsed
    DotPrison.logger.debug "Unknown equipment #{str}" unless str.empty?
    str
  end
end
