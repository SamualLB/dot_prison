struct DotPrison::Prison::Contraband < DotPrison::Consumer
  enum Item
    Booze
    Cigs
    Club
    Drill
    Drugs
    Fork
    FountainPen
    Hammer
    Knife
    Lighter
    MobilePhone
    Needle
    Poison
    Rope
    Saw
    Scissors
    SedativeSyringe
    Shank
    Sheers
    Spoon
    WoodenPickAxe
  end

  struct Prisoner < DotPrison::Consumer
    consume :prisoner_id, Int32, :"PrisonerId.i"
    consume :prisoner_uid, Int32, :"PrisonerId.u"
    consume :room_id, Int32, :"RoomId.i"
    consume :room_uid, Int32, :"RoomId.u"
    consume :time_index, Float64, :TimeIndex
    consume :theft_item, Item, :TheftItem
    consume :max_chance, Float64, :MaxChance
  end

  struct Tracker < DotPrison::Consumer
    struct LogEntry < DotPrison::Consumer
      enum Event
        Hidden
        Position
        Smuggled
        Stolen
        Thrown
        Traded
      end

      consume :log, Event, :Log
      consume :time, Float64, :Time
      consume :confirmed, Bool, :Confirmed
      consume :pos, Tuple(Float64, Float64), :"Pos.x", :"Pos.y"
    end

    enum State
      Stolen
      Owned
    end

    consume :item_type, Item, :ItemType
    consume :found_pos, Tuple(Float64, Float64), :"FoundPos.x", :"FoundPos.y"
    consume :state, State, :State
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
    consume :log, Array(LogEntry), :Log
  end

  consume :timer, Float64, :Timer
  consume :object_index, Int32, :ObjectIndex
  consume :prisoners, DotPrison::IndexedTable(Prisoner), :Prisoners
  consume :trackers, DotPrison::IndexedTable(Tracker), :Trackers
  consume :historical_trackers, DotPrison::IndexedTable(Tracker), :HistoricalTrackers
end
