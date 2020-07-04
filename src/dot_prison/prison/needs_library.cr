# TODO: pretty much seems like a forwarder
struct DotPrison::Prison::NeedsLibrary < DotPrison::Consumer
  struct Provider < DotPrison::Consumer
    # TODO: Enum it
    consume :type, Int32, :Type
    consume :pos, Tuple(Float64, Float64), :"Pos.x", :"Pos.y"
    consume :broadcast_slot_id, Int32, :BroadcastSlotId
    consume :id, Int32, :"Id.i"
    consume :uid, Int32, :"Id.u"
    consume :object_id, Int32, :"ObjId.i"
    consume :object_uid, Int32, :"ObjId.u"
    consume :consumer_id, Int32, :"ConsumerId.i"
    consume :consumer_uid, Int32, :"ConsumerId.u"
    consume :broadcaster_id, Int32, :"Broadcaster.i"
    consume :broadcaster_uid, Int32, :"Broadcaster.u"
  end

  consume :providers, DotPrison::IndexedTable(Provider), :ActiveNeedProviders
end
