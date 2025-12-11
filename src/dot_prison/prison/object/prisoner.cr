struct DotPrison::Prison::Object::Prisoner < DotPrison::Prison::Object
  enum Category
    Protected
    MinSec
    Normal
    MaxSec
    SuperMax
    DeathRow
  end

  struct Bio < DotPrison::Consumer
    struct Conviction < DotPrison::Consumer
      enum Crime
        AggravatedAssault
        AggravatedBurglary
        AggravatedVehicleTheft
        ArmedRobbery
        Arson
        Assault
        AssaultingAnOfficer
        AttemptedMurder
        Blackmail
        Bribery
        CarJacking
        CarTheft
        CounterfeightingCurrency
        Burglary
        CriminalDamage
        DangerousDriving
        DeathByDangerousDriving
        DrivingUnderInfluence
        DrunkDisorderlyBehaviour
        FalseAccounting
        FalseImprisonment
        Forgery
        Fraud
        GreviousBodilyHarm
        GrossIndecency
        HandlingStolenGoods
        IndieVideoGamePiracy
        InsiderTrading
        JoyRiding
        Kidnapping
        Manslaughter
        MoneyLaundering
        Murder
        Perjury
        Pickpocketing
        Possession
        PossessionIntentToSupply
        Rape
        Rioting
        Robbery
        Shoplifting
        Torture
        Trafficking
        Vandalism
        VideoGamePiracy
        ViolentDisorder
        Voyeurism
      end

      consume :crime, Crime, :Crime
      consume :sentence, Int32, :Sentence
      consume :guilty, Bool, :Guilty
    end

    struct FamilyMember < DotPrison::Consumer
      enum Type
        Daughter
        ExWife
        Father
        Girlfriend
        Mother
        Son
        Wife
      end

      enum BodyType
        FemaleBody
        FemaleBody2
        FemaleBody3
        Prisoner
        Prisoner2
        Prisoner3
        Prisoner4
      end

      enum HeadType
        FaceDaughter
        FaceDaughter2
        {% for i in 1..5 %}
          FaceOldMan{{i}}
        {% end %}
        {% for i in 1..3 %}
          FaceOldWoman{{i}}
        {% end %}
        FaceWife
        FaceSon
        FaceSon2
        FemaleHeadGang
        FemaleHeadGang2
        {% for i in 1..25 %}
          FemaleHead{{i}}
        {% end %}
        Head3
        Head5
        Head7
        Head10
        Head11
        Head14
        Head18
        Head20
        Head21
        Head22
        Head24
        Head26
        Head29
        Head30
        Head34
        Head39
      end

      consume :type, Type, :Type
      consume :age, Float64, :Age
      consume :body_type, BodyType, :BodyType
      consume :head_type, HeadType, :HeadType
      consume :body_scale, Float64, :BodyScale
      consume :skin_colour, Colour, :SkinColour
      consume :clothing_colour, Colour, :ClothingColour
    end

    enum HeadType
      Fig2
      Fig46854
      Fig81147
      Fig88222
      Fig103155
      Fig165219
      Fig370087
      {% for i in 1..40 %}
        Head{{i}}
      {% end %}
    end

    enum NextParole
      Failed
      Half
      ThreeQuarters
    end

    consume :forename, String, :Forname
    consume :surname, String, :Surname
    consume :age, Float64, :Age
    # TODO: Int Enum?
    consume :body_type, Int32, :BodyType
    consume :head_type, HeadType, :HeadType
    # TODO: New consumer, Array(Enum) kind of thing
    consume :traits, Array(String), :Traits
    consume :reputation_revealed, Bool, :ReputationRevealed
    consume :sentence, Int32, :Sentence
    consume :served, Float64, :Served
    consume :next_parole, NextParole, :NextParole
    # TODO: May be an array somewhere?
    consume :drug_addiction, String, :DrugAddiction
    consume :clemency_chance, Float64, :ClemencyChance
    consume :original_category, Category, :OriginalCategory
    consume :skin_colour, Colour, :SkinColour
    consume :convictions, IndexedTable(Conviction), :Convictions
    consume :family, IndexedTable(FamilyMember), :Family
  end

  struct Need < DotPrison::Consumer
    enum Type
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
    end

    consume :id, Int32, :"id.i"
    consume :uid, Int32, :"id.u"
    consume :type, Type, :Type
    consume :action_point, Float64, :ActionPoint
    consume :time_to_action, Float64, :TimeToAction
    consume :time_to_failure, Float64, :TimeToFailure
    consume :charge, Float64, :Charge
  end

  struct Needs < DotPrison::Consumer
    enum Action
      DoRegime
      Eat
      Use
      UsePhone
      ReadBook
      ReformProgram
      Visitation
      Work

      def self.parse?(string : String) : self?
        {% begin %}
          case string.camelcase.downcase
          {% for member in @type.constants %}
           when {{member.stringify.camelcase.downcase}}
              new({{@type.constant(member)}})
          {% end %}
          when {{"Do-Regime".camelcase.downcase}} then new(DoRegime)
          else
            nil
          end
        {% end %}
      end

      def to_s : String
        return "Do-Regime" if self == DoRegime
        {% for member, i in @type.constants %}
          if value == {{@type.constant(member)}}
            return {{member.stringify}}
          end
        {% end %}
        value.to_s
      end
    end

    consume :timer, Float64, :Timer
    # TODO: is this an enum? Maybe just a count of unfulfilled needs
    consume :complaining, Int32, :Complaining
    consume :action, Action, :Action
    # TODO: Might be an Enum but who knows
    consume :priority, Int32, :Priority
    consume :last_ate, Float64, :LastAte
    consume :complain_need_id, Int32, :"ComplainNeedId.i"
    consume :complain_need_uid, Int32, :"ComplainNeedId.u"
    consume :starve_timer, Float64, :StarveTimer
    consume :needs, IndexedTable(Need), :Needs
  end

  struct ExperienceStats < DotPrison::Consumer
    consume :total_time, Float64, :TotalTime
    consume :misconduct, Float64, :Misconduct
    consume :locked_down, Float64, :LockedDown
    consume :regime, Float64, :Regime
    consume :sleep, Float64, :Sleep
    consume :work, Float64, :Work
    consume :exercise, Float64, :Exercise
    consume :classes, Float64, :Class
    consume :freetime, Float64, :Freetime
    consume :mood_bad, Float64, :MoodBad
    consume :mood_normal, Float64, :MoodNormal
    consume :mood_good, Float64, :MoodGood
    consume :no_condition, Float64, :NoCondition
    consume :kod, Float64, :KOd
    consume :suppresssed, Float64, :Suppressed
    consume :reform_attendance, Float64, :ReformAttendance
    consume :reform_understanding, Float64, :ReformUnderstanding
  end

  struct ExperienceResult < DotPrison::Consumer
    consume :passed, Int32, :Passed
    consume :failed, Int32, :Failed
    consume :attended, Float64, :Attended
  end

  # TODO: consume enums I guess
  struct Results < DotPrison::Consumer
    consume :kitchen_induction, ExperienceResult, :KitchenInduction
  end

  struct Experience < DotPrison::Consumer
    consume :tick_timer, Float64, :TickTimer
    consume :starting_reoffending_chance, Int32, :StartingReoffendingChance
    consume :experience, ExperienceStats, :Experience
    consume :results, Results, :Results
  end

  include ObjectProperties
  consume :cell_id, Int32, :"Cell.i"
  consume :cell_uid, Int32, :"Cell.u"
  consume :category, Category, :Category
  consume :bio, Bio, :Bio
  consume :needs, Needs, :Needs
  consume :experience, Experience, :Experience
end
