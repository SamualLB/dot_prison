struct DotPrison::Prison::ScriptZones < DotPrison::Consumer
  # TODO: Find format of inner properties
  consume :properties, IndexedTable(Nil), :Properties
end
