struct DotPrison::WaterTile < DotPrison::Consumer
  consume :pipe_type, Int32, :PipeType
  consume :pressure, {Float64, Float64}, :PressureX, :PressureY
end
