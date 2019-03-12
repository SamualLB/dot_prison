enum DotPrison::Prison::Research::Objective
  None
  Warden
  Maintainance
  Security
  Legal
  MentalHealth
  Finance
  Cctv
  RemoteAccess
  Health
  Cleaning
  GroundsKeeping
  Deployment
  Patrols
  Dogs
  PrisonLabour
  Education
  LandExpansion
  Contraband
  Policy
  Armoury
  BodyArmour
  Tazers
  TazersForEveryone
  BankLoans
  LowerTaxes1
  LowerTaxes2
  ExtraGrant
  AdvancedManagement
  Deathrow
  PermanentPunishment
  RemoveMinCellSize
  ReduceExecutionLiability
  LegalPrep
  LegalDefense
  GuardTowers
  Unknown

  def self.from_store(str) : Objective | String
    return Unknown unless str.is_a? String
    parsed = parse? str
    return parsed if parsed
    DotPrison.logger.debug "Unknown research type: #{str}"
    str
  end
end
