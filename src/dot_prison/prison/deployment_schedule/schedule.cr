class DotPrison::Prison::DeploymentSchedule::Schedule < DotPrison::StoreConsumer
  custom_handle :deployments, :"Array(Deployment)", :i

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    @deployments = [] of Deployment
    store.parse_store_array(:i).each do |dep|
      deployments << Deployment.new(dep, prison)
    end
  end
end
