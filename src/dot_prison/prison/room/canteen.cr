struct DotPrison::Prison::Room::Canteen < DotPrison::Prison::Room
  include RoomProperties
  consume :meal_quality, Int32, :MealQuality
  consume :meal_variety, Int32, :MealVariety
  consume :quality, Int32, :Quality
end
