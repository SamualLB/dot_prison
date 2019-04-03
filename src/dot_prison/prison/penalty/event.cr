enum DotPrison::Prison::Penalty::Event
  #TODO
  One = 1
  Two = 2
  Three = 3
  Four = 4

  Unknown = -1

  def self.from_store(str) : Event | Int32
    return Unknown unless str.is_a?(Int32)
    parsed = from_value?(str)
    return parsed if parsed
    DotPrison.logger.debug "Unknown penalty event #{str}"
    str
  end
end
