module DotPrison::Prison::Object::Velocity
  macro included
    handle(:velocity_x, :Float64, :"Vel.x")
    handle(:velocity_y, :Float64, :"Vel.y")
  end
end
