class DotPrison::Prison::Production::ManufacturedObject < DotPrison::StoreConsumer
  handle :type, :Int32, :Type
  handle :count, :Int32, :Count
end
