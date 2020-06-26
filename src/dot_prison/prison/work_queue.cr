require "./work_queue_item"

struct DotPrison::Prison::WorkQueue < DotPrison::Consumer
  consume :next, Int32, :Next
  consume :items, DotPrison::IndexedTable(DotPrison::Prison::WorkQueueItem), :Items
end
