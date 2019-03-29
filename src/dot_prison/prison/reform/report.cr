class DotPrison::Prison::Reform::Report < DotPrison::StoreConsumer
  handle :started, :Int32, :Started
  handle :finished, :Int32, :Finished
  handle :passed, :Int32, :Passed
end
