class DotPrison::Prison::Tunnel < DotPrison::StoreConsumer
  handle :progress, :Float64, :Dug
  handle :entrance, :Bool, :Entrance
end

require "./tunnel/*"
