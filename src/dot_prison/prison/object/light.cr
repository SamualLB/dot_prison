class DotPrison::Prison::Object::Light < DotPrison::Prison::Object
  include ObjectProperties
  include Powered

  handle(:external_power, :Bool, :ExternalPower)
end
