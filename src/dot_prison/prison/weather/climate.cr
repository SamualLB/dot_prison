class DotPrison::Prison::Weather::Climate < DotPrison::StoreConsumer
  handle :interval, :Float64, :Interval
  handle :timer, :Float64, :Timer
  handle :day, :Int32, :Day
  handle :weather_timer, :Float64, :WeatherTimer
  handle :duration, :Float64, :WeatherDuration

  custom_handle :current_weather, :"Event | String", :CurrentWeather
  custom_handle :current, :Condition, :Current
  custom_handle :next, :Condition, :Next

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    @current_weather = Event.from_store(store.parse_string(:CurrentWeather))
    @current = Condition.new(store.parse_store(:Current), prison)
    @next = Condition.new(store.parse_store(:Next), prison)
  end
end
