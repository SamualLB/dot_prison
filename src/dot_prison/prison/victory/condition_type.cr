enum DotPrison::Prison::Victory::Condition::Type
  Bankrupt
  Executions
  Income
  InnocentsExecuted
  PrisonValue
  Prisoners
  PrisonersDied
  PrisonersEscaped
  PrisonersExecuted
  PrisonersExecutedInnocent
  PrisonersExecutedAppealedPostMortem
  PrisonersParoled
  PrisonersReleased
  PrisonersReoffended
  Reoffenders
  Riot
  StaffDeaths
  StaffPayRise
  StaffStrike
  TooManyDeaths
  TooManyEscapes
  WardenDeaths

  def self.from_store(str) : Type | String | Nil
    return nil unless str.is_a? String
    parsed = parse? str
    return parsed if parsed
    DotPrison.logger.debug "Unknown victory condition type: #{str}"
    str
  end
end
