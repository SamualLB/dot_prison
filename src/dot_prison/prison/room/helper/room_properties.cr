module DotPrison::Prison::Room::RoomProperties
  macro included
    consume :id, Int32, :"Id.i"
    consume :uid, Int32, :"Id.u"
    consume :room_type, String, :RoomType
    consume :name, String, :Name
    consume :requirements_failed, Bool, :RequirementsFailed
  end
end
