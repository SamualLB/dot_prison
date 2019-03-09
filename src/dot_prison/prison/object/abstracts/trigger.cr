module DotPrison::Prison::Object::Trigger
  macro included
    handle(:triggered, :Int32, :Triggered)
    handle(:trigger_time, :Float64, :TriggerTime)
    handle(:triggered_by, :"Reference(Object)", :"TriggeredBy.i", :"TriggeredBy.u")
  end
end

