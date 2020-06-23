struct DotPrison::Tile < DotPrison::Consumer
  consume :material, String, :Mat
  consume :condition, Float64, :Con
  consume :indoors, Bool, :Ind
  consume :prisoner_direction, Int32, :PrisonDir
  consume :staff_direction, Int32, :StaffDir
end
