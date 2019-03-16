class DotPrison::Prison::Grant < DotPrison::StoreConsumer
  custom_handle(:status, :"Status | String", :Status)

  def initialize(store : Store, prison : Prison)
    init_store(store, prison)
    @status = Status.from_store(store.parse_string(:Status))
  end
end

require "./grant/*"
