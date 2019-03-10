class DotPrison::Prison::Job::StoreObject < DotPrison::Prison::Job
  include JobProperties
  include Object
  include Target

  handle(:mat_type, :String, :MatType)
end
