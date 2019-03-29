enum DotPrison::Prison::Category
  MinSec
  Normal
  MaxSec
  Protected
  SuperMax
  DeathRow

  DEFAULT = Normal
  
  def self.from_store(str) : Category | String
    return DEFAULT unless str.is_a?(String)
    parsed = parse?(str)
    return parsed if parsed
    DotPrison.logger.debug "Unknown category: #{str}"
    str
  end
end
