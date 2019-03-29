class DotPrison::Prison::Tunnel::Container < DotPrison::StoreConsumer
  handle(:last_dig_time, :Float64, :LastDigTime)
  handle(:next_tunnel_delay, :Float64, :DelayUntilNextTunnel)

  custom_handle :diggers, :"Array(Digger)", :Diggers
  custom_handle :rooms, :"Array(Reference(Room))", :Rooms

  property! tunnels : Hash(Tuple(Int32, Int32), Tunnel)

  def initialize(store : Store, prison : Prison)
    @last_dig_time = store.parse_float(:LastDigTime)
    @next_tunnel_delay = store.parse_float(:DelayUntilNextTunnel)
    store.delete :LastDigTime.to_s
    store.delete :DelayUntilNextTunnel.to_s
    @diggers = [] of Digger
    store.parse_indexed_store(:Diggers) do |digger|
      diggers << Digger.new(digger, prison)
    end
    store.delete :Diggers.to_s
    @rooms = [] of Reference(Room)
    store.parse_store(:Rooms).parse_store_array(:i).each do |room|
      rooms << Reference(Room).new(prison, room.parse_int(:"Id.i"), room.parse_int(:"Id.u"))
    end
    store.delete :Rooms.to_s
    @tunnels = {} of {Int32, Int32} => Tunnel
    store.each do |k, v|
      next log(k, v) unless v.is_a? Store
      coords = parse_coords(k)
      next log(k, v) unless coords
      tunnels[coords] = Tunnel.new(v, prison)
    end
  end

  private def parse_coords(str) : Tuple(Int32, Int32)?
    return nil unless str.is_a? String
    arr = str.split ' '
    return nil unless arr.size == 2
    x = arr[0].to_i32?
    y = arr[1].to_i32?
    return nil unless x && y
    {x, y}
  end

  private def log(k, v)
    DotPrison.logger.debug "Unhandled tunnel property #{k}: #{v.class}"
  end
end
