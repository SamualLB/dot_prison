module DotPrison::Prison::Object::PeopleProperties
  macro included
    handle(:energy, :Float64, :Energy)
    handle(:attack_timer, :Float64, :AttackTimer)
    handle(:timer, :Float64, :Timer)

    custom_handle(:destination, :"Tuple(Float64, Float64)", :"Dest.x", :"Dest.y")
    custom_handle(:velocity, :"Tuple(Float64, Float64)", :"Vel.x", :"Vel.y")
  end

  def initialize(store : Store, prison : Prison)
    super
    @destination = {store.parse_float(:"Dest.x"), store.parse_float(:"Dest.y")}
    @velocity = {store.parse_float(:"Vel.x"), store.parse_float(:"Vel.y")}
  end
end
