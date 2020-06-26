# Consumes an actual Table array
#
# Duplicate keys are sometimes used in the original .prison file,
# so when encountered, they are silently transformed to an array.
#
# If an array is expected, any single values will be cast and will
# be consumable using this helper
struct DotPrison::ArrayTable(T)
  def initialize(@arr : Array(DotPrison::Table))
  end

  def [](i : Int32) : T
    T.new(@arr[i])
  end
end
