struct DotPrison::Prison::Room::Yard < DotPrison::Prison::Room
  include RoomProperties
  consume :quality, Int32, :Quality
end
