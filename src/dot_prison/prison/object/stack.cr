class DotPrison::Prison::Object::Stack < DotPrison::Prison::Object
  handle(:quantity, :Int32, :Quantity)
  handle(:contents, :String, :Contents)
  handle(:last_access, :Float64, :LastAccess)
  handle(:loaded, :Bool, :Loaded)
  handle(:carried, :Int32, :Carried)
  handle(:carrier, :"Reference(Object)", :"CarrierId.i", :"CarrierId.u")
  handle(:garbage, :Bool, :Garbage)

  include ObjectProperties
  include Orientation

  def initialize(store : Store, prison : Prison)
    super
  end
end
