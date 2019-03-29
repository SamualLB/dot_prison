class DotPrison::Prison::Weather::Condition < DotPrison::StoreConsumer
  handle :coldest_hour, :Float64, :ColdestHour
  handle :coldest_temp, :Float64, :ColdestTemp
  handle :hottest_temp, :Float64, :HottestTemp
end
