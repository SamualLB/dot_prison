# TODO: Enum indexing instead of category_i 
struct DotPrison::Prison::PolicyData < DotPrison::Consumer
  struct Category < DotPrison::Consumer
    struct Misconduct < DotPrison::Consumer
      struct Policy < DotPrison::Consumer
        enum Punishment
          None
          Lockdown
          Solitary
        end

        enum CategoryChange
          None
          Up
          SetMax
        end

        consume :punishment, Punishment, :Punishment
        consume :quantity, Int32, :Quantity
        consume :search_prisoner, Bool, :SearchPrisoner
        consume :search_cell, Bool, :SearchCell
        consume :category_change, CategoryChange, :CategoryChange
      end

      enum Infraction
        None
        Complaint
        Destruction
        EscapeAttempt
        InjuredPrisoner
        InjuredStaff
        SeriousInjury
        Intoxicated
        Murder
        ContrabandWeapons
        ContrabandTools
        ContrabandNarcotics
        ContrabandLuxuries
      end

      {% for i in Infraction.constants %}
        consume :{{i.id.underscore}}, Policy, :{{i.id}}
      {% end %}
    end

    struct Privilege < DotPrison::Consumer
      enum Identifier
        None
        Visitation
        Mail
        PrisonLabour
        Programs
        WorkPrograms
        EducationPrograms
        WellnessPrograms
      end

      {% for i in Identifier.constants %}
        consume :{{i.id.underscore}}, Bool, :{{i.id}}
      {% end %}
    end

    consume :quantity, Int32, :Quantity
    consume :variety, Int32, :Variety
    consume :parole_cutoff, Int32, :ParoleCutoff
    consume :misconduct, Misconduct, :Misconduct
    consume :privilege, Privilege, :Privilege
  end

  {% for i in 0..6 %}
    consume :category_{{i}}, Category, :"{{i}}"
  {% end %}
end
