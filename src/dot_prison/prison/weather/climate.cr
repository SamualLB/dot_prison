class DotPrison::Prison::Weather::Climate < DotPrison::StoreConsumer
  handle :interval, :Float64, :Interval
  handle :timer, :Float64, :Timer
  handle :day, :Int32, :Day
  handle :weather_timer, :Float64, :WeatherTimer
  handle :duration, :Float64, :WeatherDuration

  custom_handle :current_weather, :"Event | String", :CurrentWeather
  custom_handle :current, :Condition, :Current
  custom_handle :next, :Condition, :Next
  custom_handle :flood_cells, :"Array({Float64, Float64})", :FloodCells

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    @current_weather = Event.from_store(store.parse_string(:CurrentWeather))
    @current = Condition.new(store.parse_store(:Current), prison)
    @next = Condition.new(store.parse_store(:Next), prison)
    @flood_cells = [] of {Float64, Float64}
    store.parse_indexed_store(:FloodCells) do |cell|
      flood_cells << {cell.parse_float(:x), cell.parse_float(:y)}
    end
  end
end
