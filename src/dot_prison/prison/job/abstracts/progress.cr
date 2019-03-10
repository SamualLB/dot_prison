module DotPrison::Prison::Job::Progress
  macro included
    handle(:work_total, :Float64, :WorkTotal)
    handle(:work_done, :Float64, :WorkDone)
  end
end
