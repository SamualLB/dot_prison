class DotPrison::Prison::Object::Prisoner::Needs < DotPrison::StoreConsumer
  handle :timer, :Float64, :Timer
  handle :priority, :Int32, :Priority
  handle :last_ate, :Float64, :LastAte
  handle :target, :"Reference(NeedProvider)", :"Target.i", :"Target.u"
  handle :complain_need, :"Reference(Need)", :"ComplainNeedId.i", :"ComplainNeedId.u"
  handle :complaining, :Int32, :Complaining
  handle :starve_timer, :Float64, :StarveTimer
  
  custom_handle :action, :String, :Action # enum
  custom_handle :needs, :"Hash(NeedType | String, Need)", :Needs

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    @needs = {} of NeedType | String => Need
    store.parse_indexed_store(:Needs) do |need|
      typ = NeedType.from_store(need.parse_string(:Type))
      next unless typ
      needs[typ] = Need.new(need, prison)
    end
  end
end
