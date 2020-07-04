# TODO: Do Something with type, maybe
struct DotPrison::Prison::WorkQueueItem < DotPrison::Consumer
  consume :id, Int32, :Id
  consume :type, String, :Type
  consume :tile, Tuple(Int32, Int32), :CellX, :CellY
  consume :high_priority, Bool, :HighPri
  consume :in_progress, Bool, :InProg
  consume :work_done, Float64, :WorkDone
  consume :work_total, Float64, :WorkTotal
  consume :stolen, Int32, :Stolen
  consume :target_object_id, Int32, :"TargetObj.i"
  consume :target_object_uid, Int32, :"TargetObj.u"
  consume :material_type, String, :MatType
  consume :object_assigned_id, Int32, :"ObjAssigned.i"
  consume :object_assigned_uid, Int32, :"ObjAssigned.u"
end
