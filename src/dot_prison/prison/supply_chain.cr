struct DotPrison::SupplyChain < DotPrison::Consumer
  consume :timer, Float64, :Timer
  consume :previous_hour, Int32, :PreviousHour
  consume :prevous_actual_hour, Int32, :PreviousActualHour
  
  # TODO: Unknown order format
  consume :order, DotPrison::Store, :Order
end
