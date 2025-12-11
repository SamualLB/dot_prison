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
    consume :prison_value, DotPrison::Table, :PrisonValue
    consume :income, DotPrison::Table, :Income
    consume :prisoners, DotPrison::Table, :Prisoners
    consume :prisoners_released, DotPrison::Table, :PrisonersReleased
    consume :prisoners_died, DotPrison::Table, :PrisonersDied
    consume :prisoners_escaped, DotPrison::Table, :PrisonersEscaped
    consume :prisoners_paroled, DotPrison::Table, :PrisonersParoled
    consume :prisoners_reoffended, DotPrison::Table, :PrisonersReoffended
    consume :prisoners_executed, DotPrison::Table, :PrisonersExecuted
    consume :prisoners_executed_innocent, DotPrison::Table, :PrisonersExecutedInnocent
    consume :prisoners_executed_appealed_post_mortem, DotPrison::Table, :PrisonersExecutedAppealedPostMortem
    consume :staff_deaths, DotPrison::Table, :StaffDeaths
    consume :bankrupt, DotPrison::Table, :Bankrupt
    consume :riot, DotPrison::Table, :Riot
    consume :too_many_deaths, DotPrison::Table, :TooManyDeaths
    consume :too_many_escapes, DotPrison::Table, :TooManyEscapes
    consume :warden_deaths, DotPrison::Table, :WardenDeaths
    consume :reoffenders, DotPrison::Table, :Reoffenders
    consume :executions, DotPrison::Table, :Executions
    consume :innocents_executed, DotPrison::Table, :InnocentsExecuted
    consume :staff_pay_rise, DotPrison::Table, :StaffPayRise
    consume :staff_strike, DotPrison::Table, :StaffStrike
    consume :insane_prisoners_deaths, DotPrison::Table, :InsanePrisonersDeaths
    consume :insane_prisoners_abused, DotPrison::Table, :InsanePrisonersAbused
  end

  consume :recent_death, Tuple(Float64, Float64), :"RecentDeath.x", :"RecentDeath.y"
  consume :recent_escape, Tuple(Float64, Float64), :"RecentEscape.x", :"RecentEscape.y"
  consume :log, DotPrison::IndexedTable(LogEntry), :Log
  consume :conditions, Conditions, :Conditions
end
