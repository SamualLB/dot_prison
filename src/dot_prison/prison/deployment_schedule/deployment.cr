class DotPrison::Prison::DeploymentSchedule::Deployment < DotPrison::StoreConsumer
  handle :sector_id, :Int32, :SectorId
  handle :guards, :Int32, :NumGuards
end
