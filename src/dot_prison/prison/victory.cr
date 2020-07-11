struct DotPrison::Prison::Victory < DotPrison::Consumer
  struct LogEntry < DotPrison::Consumer
    enum Type
      Died
      Escaped
      Executed
      ServedTerm
    end

    consume :type, Type, :Type
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

  consume :recent_death, Tuple(Float64, Float64), :"RecentDeath.x", :"RecentDeath.y"
  consume :recent_escape, Tuple(Float64, Float64), :"RecentEscape.x", :"RecentEscape.y"
  consume :log, DotPrison::IndexedTable(LogEntry), :Log
  consume :conditions, Conditions, :Conditions
end
