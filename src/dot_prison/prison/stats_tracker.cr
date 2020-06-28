struct DotPrison::Prison::StatsTracker < DotPrison::Consumer
  struct TodayStats < DotPrison::Consumer
    consume :profit, Float64, :Profit
    consume :released_prisoners, Float64, :ReleasedPrisoners
  end

  struct PersistentStats < DotPrison::Consumer
    consume :guard_deaths, Float64, :GuardDeaths
    consume :prisoner_deaths, Float64, :PrisonerDeaths
    consume :total_deaths, Float64, :TotalDeaths
    consume :total_escaped_prisoners, Float64, :TotalEscapedPrisoners
    consume :total_incidents, Float64, :TotalIncidents
    consume :total_released_prisoners, Float64, :TotalReleasedPrisoners
  end

  enum Tracked
    EntityDeath
    EscapedPrisoners
    Funds
    GuardDeaths
    HealthGrading
    NumIncidents
    NumPrisoners
    NumStaff
    PrisonSize
    PrisonValue
    PrisonerCapacity
    PrisonerDeaths
    Profit
    PunishmentGrading
    ReformGrading
    ReleasedPrisoners
    ReoffendingRate
    SecurityGrading
    TotalDeaths
    TotalEscapedPrisoners
    TotalIncidents
    TotalReleasedPrisoners
  end

  # TODO: Array of NewDirectory
  struct Tracker < DotPrison::Consumer
  end

  struct History < DotPrison::Consumer
    {% for t in Tracked.constants %}
      consume :{{t.id.underscore}}, Tracker, :{{t.id}}
    {% end %}
  end

  consume :today, TodayStats, :Today
  consume :persistent, PersistentStats, :Persistent
  consume :history, History, :History
end
