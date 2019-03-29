enum DotPrison::Prison::Reform::Program::Type
  AlcoholicsMeeting
  Carpentry
  DeathRowAppeal
  FoundationEducation
  KitchenInduction
  Methadone
  ParoleHearing
  SpiritualGuidance
  TazerTraining
  Therapy
  WorkshopInduction

  def self.from_store(str) : Type | String | Nil
    return nil unless str.is_a? String
    parsed = parse? str
    return parsed if parsed
    DotPrison.logger.debug "Unknown reform program type: #{str}"
    str
  end
end
