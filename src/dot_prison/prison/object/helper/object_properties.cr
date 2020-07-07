module DotPrison::Prison::Object::ObjectProperties
  macro included
    consume :id, Int32, :"Id.i"
    consume :uid, Int32, :"Id.u"
    consume :type, String, :Type
    consume :sub_type, Int32, :SubType
    consume :pos, Tuple(Float64, Float64), :"Pos.x", :"Pos.y"
  end
end
