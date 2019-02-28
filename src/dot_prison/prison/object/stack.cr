class DotPrison::Prison::Object::Stack < DotPrison::Prison::Object
  HANDLED_PROPERTIES.push "Quantity", "Contents", "LastAccess", "CarrierId.i", "CarrierId.u", "Loaded", "Carried"

  include Orientation

  property quantity : Int32
  property contents : String
  property last_access : Float64
  property carrier : Reference(Object)
  property loaded : Bool
  property carried : Int32 #???

  def initialize(prison : Prison, store : Store)
    super
    @quantity = store.parse_int("Quantity")
    @contents = store.parse_string("Contents") || ""
    @last_access = store.parse_float("LastAccess")
    #@carrier = CarrierReference.new(prison, store.parse_int("CarrierId.i"), store.parse_int("CarrierId.u"))
    @carrier = Reference(Object).new(prison, store.parse_int("CarrierId.i"), store.parse_int("CarrierId.u"))
    @loaded = store.parse_bool("Loaded")
    @carried = store.parse_int("Carried")
  end
end
