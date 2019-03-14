module DotPrison::Prison::Object::ArmourProperties
  macro included
    custom_handle(:armour, :"Armour | String", :BodyArmour)
  end

  def initialize(store : Store, prison : Prison)
    super
    armour = Armour.from_store(store.parse_string(:BodyArmour))
  end
end

enum DotPrison::Prison::Object::Armour
  StabVest

  def self.from_store(str) : Armour | String
    str = str || ""
    parsed = parse?(str)
    return parsed if parsed
    DotPrison.logger.debug "Unknown armour: #{str}" unless str.empty?
    str
  end
end
