class DotPrison::Prison::Research::Container < DotPrison::StoreConsumer
  property! research : Array({Objective | String, Research})

  def initialize(store : Store, prison : Prison)
    @research = Array({Objective | String, Research}).new
    store.each do |k, v|
      next unless v.is_a? Store
      obj = Objective.from_store(k)
      research << {obj, Research.new(v, prison)}
    end
  end
end
