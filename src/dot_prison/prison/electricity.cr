class DotPrison::Prison::Electricity
  @coords = [] of {Int32, Int32}

  def initialize(store : Store, @prison : Prison)
    store.each do |k, v|
      next unless v.is_a?(Store)
      xy = parse_coords(k)
      unless xy
        DotPrison.logger.debug "Electricity coordinates invalid #{k}"
        next
      end
      @coords << xy
    end
  end

  def parse_coords(str : String) : {Int32, Int32}?
    arr = str.split ' '
    return nil unless arr.size >= 2
    x, y = arr
    x = x.to_i32?; y = y.to_i32?
    return nil unless x && y
    {x, y}
  end
end
