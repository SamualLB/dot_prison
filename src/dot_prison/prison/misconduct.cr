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

  end

  consume :time_without_incident, Float64, :TimeWithoutIncident
  consume :total_death_count, Int32, :TotalDeathCount
  consume :reports, DotPrison::IndexedTable(Report), :MisconductReports
  consume :policy, Policy, :Policy
end
