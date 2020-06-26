require "./penalty"

struct DotPrison::Prison::Penalties < DotPrison::Consumer
  consume :points, Float64, :Points
  consume :penalties, DotPrison::IndexedTable(DotPrison::Prison::Penalty), :Penalties
end
