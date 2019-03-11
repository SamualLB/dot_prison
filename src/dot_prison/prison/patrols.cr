class DotPrison::Prison::Patrols
  @patrols = {} of {Int32, Int32} => Point
  property! stations : Station::Container

  def initialize(store : Store, @prison : Prison)
    @stations = Station::Container.new(store.parse_store(:Stations), prison)
    store.each do |k, v|
      next if k == "Stations"
      next unless v.is_a?(Store)
      coords = self.parse_coords(k)
      unless coords
        DotPrison.logger.debug "Unrecognised coordinates for patrol: #{k}"
        next
      end
      @patrols[coords] = Point.new(v, prison)
    end
  end

  # "39 131" => {39, 131}
  protected def parse_coords(str) : {Int32, Int32}?
    arr = str.split ' '
    return nil unless arr.size >= 2
    x, y = arr
    x = x.to_i32?; y = y.to_i32?
    return nil unless x && y
    {x, y}
  end

  def patrols
    @patrols
  end
end

require "./patrols/*"
