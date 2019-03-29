class DotPrison::Prison::Tunnel::Digger < DotPrison::StoreConsumer
  handle :prisoner, :"Reference(Object::Prisoner)", :"Id.i", :"Id.u"
  handle :timer, :Float64, :Timer

  custom_handle :state, :String, :State # TODO enum
  no_handle :Route # TODO arr
end
