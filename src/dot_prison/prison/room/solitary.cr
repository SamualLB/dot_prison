struct DotPrison::Prison::Room::Solitary < DotPrison::Prison::Room
  include RoomProperties
  consume :entity_id, Int32, :"Entity.i"
  consume :entity_uid, Int32, :"Entity.u"
end
