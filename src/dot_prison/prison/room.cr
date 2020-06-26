struct DotPrison::Prison::Room < DotPrison::Consumer
  consume :id, Int32, :"Id.i"
  consume :uid, Int32, :"Id.u"
  consume :entity_id, Int32, :"Entity.i"
  consume :entity_uid, Int32, :"Entity.u"
  consume :type, String, :RoomType
  consume :name, String, :Name
  consume :requirementes_failed, Bool, :RequirementsFailed
  consume :meal_quality, Int32, :MealQuality
  consume :mean_variety, Int32, :MealVariety
  consume :quality, Int32, :Quality
  consume :num_prisoners, Int32, :NumPrisoners
end
