struct DotPrison::Prison::Events < DotPrison::Consumer
  # TODO: Unknown format
  struct Event

  end

  # TODO: Unknown format
  struct SurplyCounter

  end

  consume :cooldown, Float64, :Cooldown
  consume :next_update, Float64, :NextUpdate
  consume :last_event, Float64, :LastEvent
  consume :last_weather_type, Int32, :LastWeatherType # TODO: Maybe an Enum?
  consume :active_events, DotPrison::IndexedTable(Event), :ActiveEvents
  # TODO: Unknown format
  consume :history, DotPrison::Table, :History
  consume :surply_counters, DotPrison::IndexedTable(Int32), :SurplayCounters
end
