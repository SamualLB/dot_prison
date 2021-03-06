struct DotPrison::Prison::Tunnels < DotPrison::Consumer
  struct Tunnel < DotPrison::Consumer
    consume :dug, Float64, :Dug
    consume :entrance, Bool, :Entrance
  end

  # TODO: Unknown format
  struct Digger < DotPrison::Consumer

  end

  struct Room < DotPrison::Consumer
    consume :id, Int32, :"Id.i"
    consume :uid, Int32, :"Id.u"
  end

  consume :last_dig_time, Float64, :LastDigTime
  consume :next_tunnel_delay, Float64, :DelayUntilNextTunnel
  consume :diggers, DotPrison::IndexedTable(Digger), :Diggers
  consume :rooms, Array(Room), :Rooms

  def [](xy : {Int32, Int32}) : Tunnel
    Tunnel.new(table.parse_table("#{xy[0]} #{xy[1]}"))
  end

  def [](x : Int32, y : Int32)
    Tunnel.new(table.parse_table("#{x} #{y}"))
  end

  def unconsumed
    old = previous_def
    new = Array(String).new
    old.each { |s| new << s if (/^[0-9]+ [0-9]+$/ =~ s) == nil }
    new
  end
end
