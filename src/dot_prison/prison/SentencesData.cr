# TODO: Fix these criteria structures
struct DotPrison::Prison::SentencesData < DotPrison::Consumer
  struct ExtensionCriteria < DotPrison::Consumer
    consume :injured_staff, Bool, :InjuredStaff
    consume :injured_prisoner, Bool, :InjuredPrisoner
    consume :serious_injury, Bool, :SeriousInjury
    consume :murder, Bool, :Murder
    consume :escape_attempt, Bool, :EscapeAttempt
  end
  
  struct ReductionCriteria < DotPrison::Consumer
    consume :no_incidents, Bool, :NoIncidents
    consume :programs_completed, Bool, :ProgramsCompleted
    consume :days_in_labour, Bool, :DaysInLabour
    consume :lowered_rate, Bool, :LoweredRate
  end
  
  struct ExtensionCriteriaValues < DotPrison::Consumer
    consume :injured_staff, Int32, :InjuredStaff
    consume :injured_prisoner, Int32, :InjuredPrisoner
    consume :serious_injury, Int32, :SeriousInjury
    consume :murder, Int32, :Murder
    consume :escape_attempt, Int32, :EscapeAttempt
  end
  
  struct ReductionCriteriaValues < DotPrison::Consumer
    consume :no_incidents, Int32, :NoIncidents
    consume :programs_completed, Int32, :ProgramsCompleted
    consume :days_in_labour, Int32, :DaysInLabour
    consume :lowered_rate, Int32, :LoweredRate
  end
  
  struct CriteriaMet < DotPrison::Consumer
    consume :criteria_met, Int32, :CriteriaMet
  end

  consume :enabled, Bool, :SentencesEnabled
  consume :extension_value, Float64, :ExtensionValue
  consume :reduction_value, Float64, :ReductionValue
  consume :extension_criteria, ExtensionCriteria, :ExtensionCriteria
  consume :reduction_criteria, ReductionCriteria, :ReductionCriteria
  consume :extention_criteria_values, ExtensionCriteriaValues, :ExtensionCriteriaValues
  consume :reduction_criteria_values, ReductionCriteriaValues, :ReductionCriteriaValues
  consume :extension_criteria_met, CriteriaMet, :ExtensionCriteriaMet
  consume :reduction_criteria_met, CriteriaMet, :ReductionCriteriaMet
end