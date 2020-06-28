struct DotPrison::Prison::WeatherMap < DotPrison::Consumer
  struct Climate < DotPrison::Consumer
    struct Weather < DotPrison::Consumer
      consume :coldest_hour, Float64, :ColdestHour
      consume :coldest_temp, Float64, :ColdestTemp
      consume :hottest_temp, Float64, :HottestTemp
    end

    consume :interval, Float64, :Interval
    consume :timer, Float64, :Timer
    consume :day, Int32, :Day
    consume :weather_timer, Float64, :WeatherTimer
    # TODO: Enum this
    consume :current_weather, String, :CurrentWeather
    consume :weather_duration, Float64, :WeatherDuration
    consume :current, Weather, :Current
    consume :next, Weather, :Next
  end

  struct Temperature < DotPrison::Consumer  
    consume :temp, Int32, :Temp
  end

  consume :climate, Climate, :Climate
  consume :temperatures, DotPrison::GridTable(Temperature), :Temperatures
end
