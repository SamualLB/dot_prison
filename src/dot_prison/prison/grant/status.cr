enum DotPrison::Prison::Grant::Status
  Unknown
  Completed

  DEFAULT = Unknown

  def self.from_store(str) : Status | String
    return DEFAULT unless str.is_a? String
    parsed = parse?(str)
    return parsed if parsed
    DotPrison.logger.debug "Unknown grant status: #{str}"
    str
  end
end
