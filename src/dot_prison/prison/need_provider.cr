class DotPrison::Prison::NeedProvider < DotPrison::StoreConsumer
  handle :type, :Int32, :Type # TODO Enum?
  handle :position, :"Tuple(Float64, Float64)", :"Pos.x", :"Pos.y"
  handle :slot_id, :Int32, :BroadcastSlotId
  handle :id, :Int32, :"Id.i"
  handle :uid, :Int32, :"Id.u"
  handle :object, :"Reference(Object)", :"ObjId.i", :"ObjId.u"
  handle :consumer, :"Reference(Object)", :"ConsumerId.i", :"ConsumerId.u"
  handle :broadcaster, :"Reference(Object)", :"Broadcaster.i", :"Broadcaster.u"
end
