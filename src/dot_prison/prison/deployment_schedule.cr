struct DotPrison::Prison::DeploymentSchedule < DotPrison::Consumer
  # TODO: i indexed
  struct Schedule < DotPrison::Consumer

  end

  # TODO: Guessing this goes from 0...24
  struct Schedules < DotPrison::Consumer
    {% for i in 0..0 %}
      consume :"Schedule {{i}}"
    {% end %}

    def [](i : Int32) : Schedule
      Schedule.new(table.parse_table("Schedule #{i}"))
    end
  end

  # TODO: Don't know what this does
  consume :chosen_schedule, DotPrison::Table, :ChosenSchedule
  consume :schedules, Schedules, :Schedules
end
