class DotPrison::Prison::Weather < DotPrison::StoreConsumer
  custom_handle :climate, :Climate, :Climate
  custom_handle :temperatures, :"Hash({Int32, Int32}, Int32)", :Temperatures

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    @climate = Climate.new(store.parse_store(:Climate), prison)
    @temperatures = {} of {Int32, Int32} => Int32
    store.parse_store(:Temperatures).each do |k, v|
      next unless v.is_a? Store
      coords = parse_coords(k)
      next unless coords
      v.each do |ik, iv|
        unless ik == :Temp.to_s
          DotPrison.logger.debug "Unknown temperature property: #{ik}: #{iv}"
          next
        else
          temperatures[coords] = v.parse_int(:Temp)
        end
      end
    end
  end

  private def parse_coords(str) : {Int32, Int32}?
    return nil unless str.is_a? String
    arr = str.split ' '
    return nil unless arr.size == 2
    x = arr[0].to_i32?
    y = arr[1].to_i32?
    return nil unless x && y
    {x, y}
  end
end

require "./weather/*"
