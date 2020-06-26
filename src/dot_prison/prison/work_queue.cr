require "./work_queue_item"

struct DotPrison::WorkQueue < DotPrison::Consumer
  consume :next, Int32, :Next
  consume :items, DotPrison::IndexedTable(DotPrison::WorkQueueItem), :Items
end
