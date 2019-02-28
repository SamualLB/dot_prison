class DotPrison::Prison::Object::FoodTrayDirty < DotPrison::Prison::Object
  HANDLED_PROPERTIES.push "CarrierId.i", "CarrierId.u", "Loaded"
  NO_SLOTS = 2

  include Slot
  include Orientation

  property carrier : Reference(Object)
  property loaded : Bool

  def initialize(prison : Prison, store : Store)
    super
#    @carrier = CarrierReference.new(prison, store.parse_int("CarrierId.i"), store.parse_int("CarrierId.u"))
    @carrier = Reference(Object).new(prison, store.parse_int("CarrierId.i"), store.parse_int("CarrierId.u"))
    @loaded = store.parse_bool("Loaded")
  end
end
