struct DotPrison::Prison::Room::Dormitory < DotPrison::Prison::Room
  include RoomProperties
  consume :quality, Int32, :Quality
  consume :num_prisoners, Int32, :NumPrisoners
end
