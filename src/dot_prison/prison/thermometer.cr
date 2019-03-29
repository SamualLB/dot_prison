class DotPrison::Prison::Thermometer < DotPrison::StoreConsumer
  handle(:desired, :Float64, :Desired)
  handle(:rate_of_change, :Float64, :RateOfChange)
  handle(:staff_morale_desired, :Float64, :StaffMoraleDesired)
  handle(:staff_morale_roc, :Float64, :StafMoraleRateOfChange) # typo
  handle(:happy_prisoners, :Float64, :HappyPrisoners)
  handle(:unhappy_prisoners, :Float64, :UnhappyPrisoners)
  handle(:locked_up_prisoners, :Float64, :LockedUpPrisoners)
  handle(:suppressed_prisoners, :Float64, :SuppressedPrisoners)
  handle(:happy_staff, :Float64, :HappyStaff)
  handle(:unhappy_staff, :Float64, :UnhappyStaff)
  handle(:calming_warden, :Float64, :CalmingWarden)
  handle(:recent_deaths, :Float64, :RecentDeaths)
  handle(:recent_punishments, :Float64, :RecentPunishments)
  handle(:recent_searches, :Float64, :RecentSearches)
  handle(:active_armed_guards, :Float64, :ActiveArmedGuards)
end
