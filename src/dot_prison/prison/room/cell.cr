struct DotPrison::Prison::Room::Cell < DotPrison::Prison::Room
  include RoomProperties
  consume :large_window, Bool, :LargeWindow
  consume :quality, Int32, :Quality
  consume :entity_id, Int32, :"Entity.i"
  consume :entity_uid, Int32, :"Entity.u"
end
