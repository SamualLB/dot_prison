class DotPrison::Prison::Object::ElectricChair < DotPrison::Prison::Object
  include ObjectProperties
  include Powered

  handle(:switch, :Bool, :Switch)


end
