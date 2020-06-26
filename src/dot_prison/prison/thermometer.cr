struct DotPrison::Prison::Thermometer < DotPrison::Consumer
  consume :desired, Float64, :Desired
  consume :rate_of_change, Float64, :RateOfChange
  consume :happy_prisoners, Float64, :HappyPrisoners
  consume :unhappy_prisoners, Float64, :UnhappyPrisoners
  consume :locked_up_prisoners, Float64, :LockedUpPrisoners
  consume :well_fed_prisoners, Float64, :WellFedPrisoners
  consume :suppressed_prisoners, Float64, :SuppressedPrisoners
  consume :active_armed_guards, Float64, :ActiveArmedGuards
  consume :calming_warden, Float64, :CalmingWarden
  consume :recent_deaths, Float64, :RecentDeaths
  consume :recent_punishment, Float64, :RecentPunishments
  consume :recent_searches, Float64, :RecentSearches
  consume :recent_calmed, Float64, :RecentCalmed
  consume :hours_on_roll_call, Float64, :HoursOnRollcall
end
