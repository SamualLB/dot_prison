module DotPrison::Prison::Object::Job
  macro included
    handle(:job_id, :Int32, :JobId)
  end
end
