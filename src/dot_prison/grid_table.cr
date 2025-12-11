# A consumer for `Table`s that use 2 coordinates separated by spaces
#
# Such as "0 0" and "100 100"
struct DotPrison::GridTable(T) < DotPrison::Consumer
  def [](xy : {Int32, Int32}) : T
    T.new(table.parse_table("#{xy[0]} #{xy[1]}"))
  end

  def [](x : Int32, y : Int32)
    T.new(table.parse_table("#{x} #{y}"))
  end

  # Custom `#unconsumed` that removes `#[]` entries
  #
  # Keys for the associated table that have not been consumed
  #
  # This may be because they have not been implemented yet,
  # they may have an unknown purpose, or could be part of an
  # unsupported mod
  def unconsumed
    old = previous_def
    new = Array(String).new
    old.each { |s| new << s if (/^[0-9]+ [0-9]+$/ =~ s) == nil }
    new
  end
end
