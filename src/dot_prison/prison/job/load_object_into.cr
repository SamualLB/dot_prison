class DotPrison::Prison::Job::LoadObjectInto < DotPrison::Prison::Job
  include JobProperties
  include Object
  include Target
  include ObjectType
  include MaterialType
end
