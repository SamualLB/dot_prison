class DotPrison::Prison::Victory::Condition < DotPrison::StoreConsumer
  handle :value, :Int32, :Value
  handle :timer, :Float64, :Timer

  custom_handle :state, :String, :State # TODO
end
