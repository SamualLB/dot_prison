enum DotPrison::Prison::Weather::Event
  None
  Overcast

  def self.from_store(str) : Event | String
    return None unless str.is_a? String
    parsed = parse? str
    return parsed if parsed
    DotPrison.logger.debug "Unknown weather event: #{str}"
    str
  end
end
