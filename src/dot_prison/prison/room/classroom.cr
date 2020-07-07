struct DotPrison::Prison::Room::Classroom < DotPrison::Prison::Room
  include RoomProperties
  consume :quality, Int32, :Quality
end
