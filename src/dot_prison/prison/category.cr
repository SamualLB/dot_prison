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
    return parsed if parsed = parse?(str)
    DotPrison.logger.debug "Unknown category: #{str}"
    str
  end
end
