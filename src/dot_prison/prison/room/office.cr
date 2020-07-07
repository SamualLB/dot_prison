struct DotPrison::Prison::Room::Office < DotPrison::Prison::Room
  include RoomProperties

  # TODO: Maybe some sort of ref
  consume :entity_id, Int32, :"Entity.i"
  consume :entity_uid, Int32, :"Entity.u"
end
