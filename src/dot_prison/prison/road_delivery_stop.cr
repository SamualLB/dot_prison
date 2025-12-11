struct DotPrison::Prison::RoadDeliveryStop < DotPrison::Consumer
  # TODO: Check this
  struct Zone < DotPrison::Consumer
    consume :id, Int32, :"Id.i"
    consume :uid, Int32, :"Id.u"
  end
  
  consume :is_new, Bool, :IsNew
  consume :delivery_zones, Array(Zone), :DeliveryZones
  consume :garbage_zones, Array(Zone), :GarbageZones
  consume :export_zones, Array(Zone), :ExportZones
  consume :intake_zones, Array(Zone), :IntakeZones
end