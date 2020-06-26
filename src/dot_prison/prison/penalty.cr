struct DotPrison::Prison::Penalty < DotPrison::Consumer
  # TODO: Ready for enumming
  consume :event, Int32, :Event
  consume :object_id, Int32, :"ObjectId.i"
  consume :object_uid, Int32, :"ObjectId.u"
  consume :time, Float64, :Time
  consume :committed, Bool, :Committed
end
