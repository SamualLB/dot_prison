enum DotPrison::Prison::Object::Prisoner::NeedType
  Alcohol
  Bladder
  Bowels
  Clothing
  Comfort
  Drugs
  Environment
  Exercise
  Family
  Food
  Freedom
  Hygiene
  Literacy
  Luxuries
  Privacy
  Recreation
  Safety
  Sleep
  Spirituality
  Warmth

  def self.from_store(str) : NeedType | String | Nil
    return nil unless str.is_a? String
    parsed = parse? str
    return parsed if parsed
    DotPrison.logger.debug "Unknown prisoner need type: #{str}"
    str
  end
end
