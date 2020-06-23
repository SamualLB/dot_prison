# A consumer for `Store`s that use 2 coordinates separated by spaces
#
# Such as "0 0" and "100 100"
struct DotPrison::GridStore(T) < DotPrison::Consumer
  def [](xy : {Int32, Int32}) : T
    T.new(store.parse_store("#{xy[0]} #{xy[1]}"))
  end

  def [](x : Int32, y : Int32)
    T.new(store.parse_store("#{x} #{y}"))
  end

  def unhandled
    old = previous_def
    new = Array(String).new
    old.each { |s| new << s if (/^[0-9]+ [0-9]+$/ =~ s) == nil }
    new
  end
end
