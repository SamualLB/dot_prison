enum DotPrison::Prison::Object::Prisoner::ExperienceType
  Class
  Exercise
  Freetime
  Hurt
  Intoxicated
  KOd
  LockedDown
  Misconduct
  MoodBad
  MoodGood
  MoodNormal
  NoCondition
  ReformAttendance
  ReformUnderstanding
  Regime
  Sleep
  Suppressed
  TotalTime
  Work

  def self.from_store(str) : ExperienceType | String | Nil
    return nil unless str.is_a? String
    parsed = parse? str
    return parsed if parsed
    DotPrison.logger.debug "Unknown prisoner experience type: #{str}"
    str
  end
end
