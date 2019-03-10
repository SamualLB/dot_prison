class DotPrison::Prison::Room::Cell < DotPrison::Prison::Room
  include RoomProperties
  include Entity

  handle(:quality, :Int32, :Quality)
end
