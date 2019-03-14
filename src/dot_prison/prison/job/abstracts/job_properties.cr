module DotPrison::Prison::Job::JobProperties
  macro included
    handle(:id, :Int32, :Id)
    handle(:type, :String, :Type)
    handle(:in_progress, :Bool, :InProg)
    handle(:stolen, :Int32, :Stolen)
    handle(:high_priority, :Bool, :HighPri)
    handle(:failures, :Int32, :NumFails)
    handle(:failure_timer, :Float64, :FailureTimer)
    handle(:location, :"Tuple(Int32, Int32)", :CellX, :CellY)
  end
end
