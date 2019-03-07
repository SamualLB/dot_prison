module DotPrison::Prison::Object::Velocity
  macro included
    custom_handle(:velocity, :"Tuple(Float64, Float64)", :"Vel.x", :"Vel.y")
  end

  def initialize(store : Store, prison : Prison)
    super
    @velocity = {store.parse_float(:"Vel.x"), store.parse_float(:"Vel.y")}
  end
end
