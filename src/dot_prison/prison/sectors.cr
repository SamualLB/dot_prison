struct DotPrison::Prison::Sector < DotPrison::Consumer
  struct Station < DotPrison::Consumer
    consume :entity_id, Int32, :"Entity.i"
    consume :entity_uid, Int32, :"Entity.u"
    consume :last_occupied, Float64, :LastOccupied
  end

  consume :id, Int32, :id
  consume :top_left, Tuple(Int32, Int32), :"TopLeft.x", :"TopLeft.y"
  consume :bottom_right, Tuple(Int32, Int32), :"BottomRight.x", :"BottomRight.y"
  consume :centre, Tuple(Float64, Float64), :"Centre.x", :"Centre.y"
  consume :indoor, Bool, :Indoor
  consume :num_squares, Int32, :NumSquares
  consume :num_floor_squares, Int32, :NumFloorSquares

  # TODO: Enum this
  consume :zone, String, :Zone
  consume :room_id, Int32, :"Room.i"
  consume :room_uid, Int32, :"Room.u"
  {% for i in 0..10 %}
    consume :custom_zone_{{i}}, Bool, :CustomZone{{i}}
  {% end %}
  consume :stations, DotPrison::IndexedTable(Station), :Stations
  consume :dog_stations, DotPrison::IndexedTable(Station), :DogStations
  consume :armed_guard_stations, DotPrison::IndexedTable(Station), :ArmedGuardStations
  consume :orderly_stations, DotPrison::IndexedTable(Station), :OrderlyStations
  consume :cook_stations, DotPrison::IndexedTable(Station), :CookStations
  consume :doctor_stations, DotPrison::IndexedTable(Station), :DoctorStations
  consume :janitor_stations, DotPrison::IndexedTable(Station), :JanitorStations
  consume :gardener_stations, DotPrison::IndexedTable(Station), :GardenerStations
  consume :jobs, DotPrison::IndexedTable(Station), :Jobs
  consume :targets, DotPrison::IndexedTable(Int32), :Targets
end

struct DotPrison::Prison::Sectors < DotPrison::Consumer
  consume :next_id, Int32, :NextSectorId
  consume :sectors, DotPrison::IndexedTable(DotPrison::Prison::Sector), :Sectors
end
