struct DotPrison::Prison::Events < DotPrison::Consumer
  # TODO: Unknown format
  struct Event

  end

  consume :cooldown, Float64, :Cooldown
  consume :next_update, Float64, :NextUpdate
  consume :active_events, DotPrison::IndexedTable(Event), :ActiveEvents
  # TODO: Unknown format
  consume :history, DotPrison::Table, :History
end
