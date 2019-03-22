enum DotPrison::Prison::Misconduct::Punishment
  None = 0

  DEFAULT = None

  def self.from_store(i) : Punishment | Int32
    return DEFAULT unless i.is_a? Int32
    parsed = from_value? i
    return parsed if parsed
    DotPrison.logger.debug "Unknown prisoner punishment: #{i}"
    i
  end
end
