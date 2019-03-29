enum DotPrison::Prison::Stats::Stat
  EntityDeath
  Funds
  HealthGrading
  NumIncidents
  NumPrisoners
  NumStaff
  PrisonerCapacity
  PrisonerDeaths
  PrisonSize
  PrisonValue
  Profit
  PunishmentGrading
  ReformGrading
  ReleasedPrisoners
  ReoffendingRate
  SecurityGrading
  TotalDeaths
  TotalIncidents
  TotalReleasedPrisoners

  def self.from_store(str) : Stat | String | Nil
    return nil unless str.is_a? String
    parsed = parse? str
    return parsed if parsed
    DotPrison.logger.debug "Unknown stat: #{str}"
    str
  end
end
