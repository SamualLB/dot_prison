enum DotPrison::Prison::Regime::Activity
  Eat
  FreeTime
  Nothing
  Shower
  Sleep
  Unspecified
  Work
  WorkLockdown
  Yard

  DEFAULT = Unspecified
  def self.from_store(str) : Activity | String
    return DEFAULT unless str.is_a?(String)
    parsed = parse?(str)
    return parsed if parsed
    DotPrison.logger.debug "Unknown regime activity: #{str}"
    str
  end
end
