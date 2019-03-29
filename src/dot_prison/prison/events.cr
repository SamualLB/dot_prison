class DotPrison::Prison::Events < DotPrison::StoreConsumer
  handle :cooldown, :Float64, :Cooldown
  handle :next_update, :Float64, :NextUpdate
end
