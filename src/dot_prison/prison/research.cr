class DotPrison::Prison::Research < DotPrison::StoreConsumer
  handle(:desired, :Bool, :Desired)
  handle(:progress, :Float64, :Progress)
end

require "./research/*"
