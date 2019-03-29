class DotPrison::Prison::Reform::Allocation < DotPrison::StoreConsumer
  handle :object, :"Reference(Object)", :"Object.i", :"Object.u"
  handle :student, :"Reference(Object)", :"Student.i", :"Student.u"
  handle :last_used, :Float64, :LastUsed
  handle :slot_id, :Int32, :SlotId
end
