struct DotPrison::Prison::Object::Prisoner < DotPrison::Prison::Object
  struct Bio < DotPrison::Consumer
    struct Conviction < DotPrison::Consumer
      # TODO: Enum (Murder, AttemptedMurder, GreviousBodilyHarm, ArmedRobbery)
      consume :crime, String, :Crime
      consume :sentence, Int32, :Sentence
      consume :guilty, Bool, :Guilty
    end

    struct FamilyMember < DotPrison::Consumer
      # TODO: Enum
      consume :type, String, :Type
      consume :age, Float64, :Age
      # TODO: Enum it!!!
      consume :body_type, String, :BodyType
      # TODO: Enum again
      consume :head_type, String, :HeadType
      consume :body_scale, Float64, :BodyScale
      consume :skin_colour, Colour, :SkinColour
      consume :clothing_colour, Colour, :ClothingColour
    end

    consume :forename, String, :Forname
    consume :surname, String, :Surname
    consume :age, Float64, :Age
    # TODO: Int Enum?
    consume :body_type, Int32, :BodyType
    # TODO String Enum?
    consume :head_type, String, :HeadType
    # TODO: New consumer, Array(Enum) kind of thing
    consume :traits, Array(String), :Traits
    consume :reputation_revealed, Bool, :ReputationRevealed
    consume :sentence, Int32, :Sentence
    consume :served, Float64, :Served
    # TODO: Enum? (Failed)
    consume :next_parole, String, :NextParole
    # TODO: May be an array somewhere?
    consume :drug_addiction, String, :DrugAddiction
    consume :clemency_chance, Float64, :ClemencyChance
    # TODO: Enum it
    consume :original_category, String, :OriginalCategory
    consume :skin_colour, Colour, :SkinColour
    consume :convictions, IndexedTable(Conviction), :Convictions
    consume :family, IndexedTable(FamilyMember), :Family
  end

  include ObjectProperties
  consume :cell_id, Int32, :"Cell.i"
  consume :cell_uid, Int32, :"Cell.u"
  consume :bio, Bio, :Bio
end
