class DotPrison::Prison::Object::Prisoner::Need < DotPrison::StoreConsumer
  handle :id, :Int32, :"id.i"
  handle :uid, :Int32, :"id.u"
  handle :action_point, :Float64, :ActionPoint
  handle :time_to_action, :Float64, :TimeToAction
  handle :time_to_failure, :Float64, :TimeToFailure
  handle :charge, :Float64, :Charge
  handle :discharged_lat_tick, :Bool, :DischargedLastTick
  handle :discharging, :Bool, :Discharging

  custom_handle :type, :"NeedType | String", :Type

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    @type = NeedType.from_store(store.parse_string(:Type))
  end
end
