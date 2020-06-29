struct DotPrison::Prison::DeploymentSchedule < DotPrison::Consumer
  # TODO: Guessing this goes from 0...24
  struct Schedules < DotPrison::Consumer
    struct Entry < DotPrison::Consumer
      consume :sector_id, Int32, :SectorId
      consume :num_guards, Int32, :NumGuards
      consume :num_dogs, Int32, :NumDogs
      consume :num_armed_guards, Int32, :NumArmedGuards
      consume :num_orderly, Int32, :NumOrderly
      consume :num_cooks, Int32, :NumCooks
      consume :num_doctors, Int32, :NumDoctors
      consume :num_janitors, Int32, :NumJanitors
      consume :num_gardeners, Int32, :NumGardeners
      consume :priority_level, Int32, :PriorityLevel
    end

    {% for i in 0..0 %}
      consume :"Schedule {{i}}"
    {% end %}

    def [](i : Int32)
      DotPrison::ArrayTable(Entry).new(table.parse_table("Schedule #{i}"))
    end
  end

  # TODO: Don't know what this does
  consume :chosen_schedule, DotPrison::Table, :ChosenSchedule
  consume :schedules, Schedules, :Schedules
end
