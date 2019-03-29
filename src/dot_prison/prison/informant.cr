class DotPrison::Prison::Informant < DotPrison::StoreConsumer
  handle :prisoner, :"Reference(Object::Prisoner)", :"Prisoner.i", :"Prisoner.u"
  handle :timer, :Float64, :Timer
  handle :coverage, :Float64, :Coverage
  handle :burn_point, :Float64, :BurnPoint
  handle :highest_suspicion, :Float64, :HighestSuspicion

  custom_handle :state, :String, :State # TODO
end
