enum DotPrison::Prison::Warden
  # TODO Check these
  TheWarden      = 0
  TheLobbyist    = 1
  Rita           = 2
  JWPeriwinkle   = 3
  ThePacifier    = 4
  SapharaAcknova = 5

  def self.from_store(num) : Warden | Int32
    return TheWarden unless num.is_a? Int32
    parsed = from_value? num
    return parsed if parsed
    DotPrison.logger.debug "Unknown warden: #{num}"
    num
  end
end
