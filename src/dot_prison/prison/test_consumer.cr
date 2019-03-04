class DotPrison::Prison::TestConsumer < DotPrison::Prison::StoreConsumer
  handle(:test, String, :Test)
end
