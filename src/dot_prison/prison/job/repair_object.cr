class DotPrison::Prison::Job::RepairObject < DotPrison::Prison::Job
  include JobProperties
  include Progress
  include Object
  include ObjectType
end
