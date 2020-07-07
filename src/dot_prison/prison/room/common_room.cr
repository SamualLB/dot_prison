struct DotPrison::Prison::Room::CommonRoom < DotPrison::Prison::Room
  include RoomProperties
  consume :quality, Int32, :Quality
end
