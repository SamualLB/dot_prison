struct DotPrison::Prison::CalamityRewards < DotPrison::Consumer
  struct Reward < DotPrison::Consumer
    consume :last_time_awarded, Float64, :LastTimeAwarded
    consume :continous_and_active, Bool, :ContinousAndActive
  end

  consume :counter_health, Int32, :CounterHealth
  consume :counter_damage, Int32, :CounterDamage
  consume :counter_security, Int32, :CounterSecurity
  consume :time_prison_powered, Float64, :TimePrisonPowered
  consume :weather_start_time, Float64, :WeatherStartTime
  consume :rat_infestation_level, Int32, :RatInfestationLevel
  consume :highest_weather_level, Int32, :HighestWeatherLevel

  {% for i in 0..11 %}
    # TODO: Change this to an array or something
    consume :reward_{{i}}, Reward, :"{{i}}"
  {% end %}
end