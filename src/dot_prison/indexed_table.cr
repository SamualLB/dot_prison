# A consumer for `Table`s that are indexed from 0
#
# Starting at "[i 0]" and going up to (size-1) "[i size-1]"
struct DotPrison::IndexedTable(T) < DotPrison::Consumer
  consume :size, Int32, :Size
  # Seems to be used on some newer stuff, probably don't care about it
  consume :array_type_id, String, :tID

  def [](i : Int32) : T
    T.new(table.parse_table("[i #{i}]"))
  end

  def []?(i : Int32) : T?
    tab = table.parse_table?("[i #{i}]")
    return nil unless tab
    T.new(tab)
  end

  def unconsumed
    old = previous_def
    new = Array(String).new
    old.each { |s| new << s if (/^\[i [0-9]+\]$/ =~ s) == nil }
    new
  end

  def each(&block)
    (0...size).each do |i|
      v = self[i]?
      yield v if v
    end
  end
end
