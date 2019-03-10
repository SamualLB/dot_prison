class DotPrison::Prison::Job::DismantleObject < DotPrison::Prison::Job
  include JobProperties
  include Object
  include ObjectType
  include Progress
end
