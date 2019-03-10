class DotPrison::Prison::Room::Dormitory < DotPrison::Prison::Room
  include RoomProperties

  handle(:quality, :Int32, :Quality)
  handle(:num_prisoners, :Int32, :NumPrisoners)
end
