struct DotPrison::Prison::WaterTile < DotPrison::Consumer
  consume :pipe_type, Int32, :PipeType
  consume :pressure, Tuple(Float64, Float64), :PressureX, :PressureY
end
