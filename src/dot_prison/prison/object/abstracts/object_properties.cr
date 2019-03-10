module DotPrison::Prison::Object::ObjectProperties
  macro included
    handle(:id, :Int32, :"Id.i")
    handle(:uid, :Int32, :"Id.u")
    handle(:type, :String, :Type)
    handle(:sub_type, :Int32, :SubType)
    handle(:damage, :Float64, :Damage)
    handle(:carrier, :"Reference(Object)", :"CarrierId.i", :"CarrierId.u")
    handle(:carried, :Int32, :Carried)
    handle(:loaded, :Bool, :Loaded)
    handle(:locked, :Bool, :Locked)
    handle(:hidden, :Bool, :Hidden)
    handle(:grant, :String, :Name)

    custom_handle(:position, :"Tuple(Float64, Float64)", :"Pos.x", :"Pos.y")
  end

  def initialize(store : Store, prison : Prison)
    super
    @position = {store.parse_float(:"Pos.x"), store.parse_float(:"Pos.y")}
  end
end
