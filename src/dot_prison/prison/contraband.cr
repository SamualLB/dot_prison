struct DotPrison::Prison::Contraband < DotPrison::Consumer
  struct Prisoner < DotPrison::Consumer
    consume :prisoner_id, Int32, :"PrisonerId.i"
    consume :prisoner_uid, Int32, :"PrisonerId.u"
    consume :room_id, Int32, :"RoomId.i"
    consume :room_uid, Int32, :"RoomId.u"
    consume :time_index, Float64, :TimeIndex
    # TODO: Enum? Object?
    consume :theft_item, String, :TheftItem
    consume :max_chance, Float64, :MaxChance
  end

  struct Tracker < DotPrison::Consumer
    # TODO: Enum
    consume :item_type, String, :ItemType
    consume :found_pos, {Float64, Float64}, :"FoundPos.x", :"FoundPos.y"
    # TODO: Enum
    consume :state, String, :State
    consume :birth_time, Float64, :BirthTime
    consume :found_time, Float64, :FoundTime
    consume :prisoner_id, Int32, :"Prisoner.i"
    consume :prisoner_uid, Int32, :"Prisoner.u"
    consume :prisoner_chance, Float64, :"Prisoner.chance"
    consume :object_id, Int32, :"Object.i"
    consume :object_uid, Int32, :"Object.u"
    consume :object_chance, Float64, :"Object.chance"
    consume :from_room_id, Int32, :"FromRoom.i"
    consume :from_room_uid, Int32, :"FromRoom.u"
    # TODO: ["i"] used as Store array of log items
    consume :log, DotPrison::Table, :Log
  end

  consume :timer, Float64, :Timer
  consume :object_index, Int32, :ObjectIndex
  consume :prisoners, DotPrison::IndexedTable(Prisoner), :Prisoners
  consume :trackers, DotPrison::IndexedTable(Tracker), :Trackers
  consume :historical_trackers, DotPrison::IndexedTable(Tracker), :HistoricalTrackers
end
