class DotPrison::Prison::Intake < DotPrison::StoreConsumer
  handle :type, :Int32, :IntakeType # TODO enum
  handle :number, :Int32, :IntakeNum # is this current pop?
  handle :death_row_blocked, :Int32, :DeathRowBlocked

  custom_handle :pools, :"Hash(Category | String, Pool)", :Categories

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    pools = {} of Category | String => Pool
    store.parse_store(:Categories).parse_store_array(:i).each do |pool|
      tup = Pool.from_store(pool, prison)
      pools[tup[0]] = tup[1]
    end
  end
end

require "./intake/*"
