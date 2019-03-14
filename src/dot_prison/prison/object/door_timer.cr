class DotPrison::Prison::Object::DoorTimer < DotPrison::Prison::Object
  include ObjectProperties
  include Powered

  handle(:doors_open, :Bool, :DoorsOpen)

  def initialize(store : Store, prison : Prison)
    super
  end
end
