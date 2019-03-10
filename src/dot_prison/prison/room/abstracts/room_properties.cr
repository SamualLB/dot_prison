module DotPrison::Prison::Room::RoomProperties
  macro included
    handle(:id, :Int32, :"Id.i")
    handle(:uid, :Int32, :"Id.u")
    handle(:requirements_failed, :Bool, :RequirementsFailed)
    handle(:room_type, :String, :RoomType)
    handle(:name, :String, :Name)
  end
end
