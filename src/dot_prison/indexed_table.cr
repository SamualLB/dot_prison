# A consumer for `Table`s that are indexed from 0
#
# Starting at "[i 0]" and going up to (size-1) "[i size-1]"
struct DotPrison::IndexedTable(T) < DotPrison::Consumer
  consume :size, Int32, :Size

  def [](i : Int32) : T
    T.new(table.parse_table("[i #{i}]"))
  end

  def unhandled
    old = previous_def
    new = Array(String).new
    old.each { |s| new << s if (/^\[i [0-9]+\]$/ =~ s) == nil }
    new
  end
end
