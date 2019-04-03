enum DotPrison::Prison::Regime::Activity
  None
  Eat
  FreeTime
  Lockdown
  Nothing
  Shower
  Sleep
  Unspecified
  Work
  WorkLockdown
  Yard

  def self.from_store(str) : Activity | String
    return None unless str.is_a?(String)
    parsed = parse?(str)
    return parsed if parsed
    DotPrison.logger.debug "Unknown regime activity: #{str}"
    str
  end
end
