class DotPrison::Prison::Job < DotPrison::StoreConsumer
  property! prison : Prison

  macro inherited
    def initialize(store : Store, @prison : Prison)
      init_store(store)
    end
  end

  def self.parse(store : Store, prison : Prison) : Tuple(Array(Job), Int32)
    ret = [] of Job
    inner = store.parse_store(:Items)
    inner.each do |k, job|
      ret << Job.new(job, prison)
    end
    {ret, store.parse_int(:Next)}
  end
end
