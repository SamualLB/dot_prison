class DotPrison::Prison::Contraband::Prisoner < DotPrison::StoreConsumer
  handle(:prisoner, :"Reference(Object::Prisoner)", :"PrisonerId.i", :"PrisonerId.u")
  handle(:room, :"Reference(Room)", :"RoomId.i", :"RoomId.u")
  handle(:time_index, :Float64, :TimeIndex)
  handle(:max_chance, :Float64, :MaxChance)

  custom_handle(:theft_item, :String, :TheftItem)
end
