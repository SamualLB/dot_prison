class DotPrison::Prison::Job::DumpObject < DotPrison::Prison::Job
  include JobProperties
  include Object
  include Target
  include Progress
  include ObjectType
end
