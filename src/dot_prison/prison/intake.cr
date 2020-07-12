struct DotPrison::Prison::Intake < DotPrison::Consumer
  struct Category < DotPrison::Consumer
    enum Type
      MinSec
      Normal
      MaxSec
      SuperMax
      DeathRow
      Insane
      PrisonerTransfer
    end

    consume :category, Type, :PrisonerCategory
    consume :pool, Int32, :Pool
    consume :ratio, Float64, :Ratio
    consume :next_intake, Int32, :NextIntake
    consume :queue, Int32, :Queue
    consume :num_nitg, Int32, :NumNITGs
  end

  # TODO: Enum int!
  consume :type, Int32, :IntakeType
  consume :num, Int32, :IntakeNum
  consume :death_row_blocked, Int32, :DeathRowBlocked
  consume :categories, Array(Category), :Categories
end
