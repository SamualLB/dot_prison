struct DotPrison::Prison::Intake < DotPrison::Consumer
  # TODO: Enum it!
  consume :type, Int32, :IntakeType
  consume :num, Int32, :IntakeNum
  consume :death_row_blocked, Int32, :DeathRowBlocked
  # TODO: i indexed
  consume :categories, DotPrison::Table, :Categories
end
