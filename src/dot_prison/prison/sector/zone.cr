enum DotPrison::Prison::Sector::Zone
  Shared
  MedSecOnly
  MaxSecOnly
  ProtectedOnly
  SuperMaxOnly
  DeathRowOnly
  StaffOnly
  Unlocked

  DEFAULT = Shared

  def self.from_store(str) : Zone | String
    return DEFAULT unless str.is_a? String
    parsed = parse?(str)
    return parsed if parsed
    DotPrison.logger.debug "Unrecognised zone: #{str}"
    str
  end
end
