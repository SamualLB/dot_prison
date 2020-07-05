require "./consumer"

# Consumes an actual Table array
#
# Duplicate keys are sometimes used in the original .prison file,
# so when encountered, they are silently transformed to an array.
#
# If an array is expected, any single values will be cast and will
# be consumable using this helper
struct DotPrison::ArrayTable(T) < DotPrison::Consumer
  consume :i

  def [](i : Int32) : T
    T.new(table.parse_table_array(:i)[i])
  end

  def size
    table.parse_table_array(:i).size
  end
end
