struct DotPrison::Prison::Misconduct < DotPrison::Consumer
  struct Report < DotPrison::Consumer
    struct Entry < DotPrison::Consumer
      enum Type
        ContrabandLuxuries
        ContrabandNarcotics
        ContrabandTools
        ContrabandWeapons
        Destruction
        EscapeAttempt
        InjuredPrisoner
        InjuredStaff
        Intoxicated
        Murder
        SeriousInjury
      end

      consume :quantity, Float64, :Quantity
      consume :convicted, Bool, :Convicted
      consume :punished, Bool, :Punished
      consume :type, Type, :Type
    end

    consume :prisoner_id, Int32, :"PrisonerId.i"
    consume :prisoner_uid, Int32, :"PrisonerId.u"
    consume :scratched, Bool, :Scratched
    consume :current_punishment, Int32, :CurrentPunishment
    consume :none_punishment, Float64, :Punishment_None
    consume :lockdown_punishment, Float64, :Punishment_Lockdown
    consume :solitary_punishment, Float64, :Punishment_Solitary
    consume :entries, DotPrison::IndexedTable(Entry), :MisconductEntries
  end

  # TODO: fill with enum stuff
  struct Policy < DotPrison::Consumer
    consume :none, DotPrison::Table, :None
    consume :complaint, DotPrison::Table, :Complaint
    consume :destruction, DotPrison::Table, :Destruction
    consume :escape_attempt, DotPrison::Table, :EscapeAttempt
    consume :injured_prisoner, DotPrison::Table, :InjuredPrisoner
    consume :injured_staff, DotPrison::Table, :InjuredStaff
    consume :serious_injury, DotPrison::Table, :SeriousInjury
    consume :intoxicated, DotPrison::Table, :Intoxicated
    consume :murder, DotPrison::Table, :Murder
    consume :contraband_weapons, DotPrison::Table, :ContrabandWeapons
    consume :contraband_tools, DotPrison::Table, :ContrabandTools
    consume :contraband_narcotics, DotPrison::Table, :ContrabandNarcotics
    consume :produced_narcotics, DotPrison::Table, :ProducedNarcotics
    consume :contraband_luxuries, DotPrison::Table, :ContrabandLuxuries
  end

  consume :time_without_incident, Float64, :TimeWithoutIncident
  consume :total_death_count, Int32, :TotalDeathCount
  consume :reports, DotPrison::IndexedTable(Report), :MisconductReports
  consume :policy, Policy, :Policy
end
