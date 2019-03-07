module DotPrison::Prison::Object::ObjectProperties
  macro included
    handle(:id, :Int32, :"Id.i")
    handle(:uid, :Int32, :"Id.u")
  end
end
