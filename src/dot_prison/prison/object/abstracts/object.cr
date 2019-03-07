module DotPrison::Prison::Object::ObjectProperties
  macro included
    handle(:id, :Int32, :"Id.i")
    handle(:uid, :Int32, :"Id.u")
    handle(:x, :Float64, :"Pos.x")
    handle(:y, :Float64, :"Pos.y")
    handle(:type, :String, :Type)
    handle(:sub_type, :Int32, :SubType)
  end
end
