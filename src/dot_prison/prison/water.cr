class DotPrison::Prison::Water
  @pipes = {} of {Int32, Int32} => Pipes

  # TODO OffValves?
  def initialize(store : Store, @prison : Prison)
    store.each do |k, v|
      next unless v.is_a? Store
      next if k == "OffValves"
      coords = parse_coords(k)
      unless coords
        DotPrison.logger.debug "Unrecognised coordinates for water: #{k}"
        next
      end
      @pipes[coords] = Pipes.new(v, prison)
    end
  end

  private def parse_coords(str) : {Int32, Int32}?
    arr = str.split ' '
    return nil unless arr.size >= 2
    x, y = arr
    x = x.to_i32?; y = y.to_i32?
    return nil unless x && y
    {x, y}
  end
end

require "./water/*"
