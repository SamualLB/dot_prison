struct DotPrison::Prison::Victory < DotPrison::Consumer
  # TODO: Separate out depending on `type`
  struct Log < DotPrison::Consumer
    # TODO: Enum
    consume :type, String, :Type
    consume :time_index, Float64, :TimeIndex
    consume :reoffending_chance, Float64, :ReoffendingChance
    consume :grading_punishment, Int32, :Grading_Punishment
    consume :grading_reform, Int32, :Grading_Reform
    consume :grading_health, Int32, :Grading_Health
    consume :grading_security, Int32, :Grading_Security
    consume :prisoner_id, Int32, :"PrisonerId.i"
    consume :prisoner_uid, Int32, :"PrisonerId.u"
  end

  # TODO: Some sort of enum?
  #
  # Uses Value attribute for all
  struct Conditions < DotPrison::Consumer

  end

  consume :recent_death, {Float64, Float64}, :"RecentDeath.x", :"RecentDeath.y"
  consume :recent_escape, {Float64, Float64}, :"RecentEscape.x", :"RecentEscape.y"
  consume :log, DotPrison::IndexedTable(Log), :Log
  consume :conditions, Conditions, :Conditions
end
