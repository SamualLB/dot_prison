class DotPrison::Prison::Penalty::InnerContainer
  property! penalties : Array(Penalty)

  def initialize(store : Store, prison : Prison)
    size = store.parse_int(:Size)
    @penalties = Array(Penalty).new
    current_index = 0
    store.each do |k, v|
      next if k == "Size"
      unless v.is_a? Store
        DotPrison.logger.debug "Unknown penalty property: #{k}, #{v}"
        next
      end
      parsed_index = parse_index(k)
      next unless parsed_index
      unless current_index == parsed_index
        DotPrison.logger.debug "Penalty index incorrect #{parsed_index}/#{current_index}"
      end
      penalties << Penalty.new(v, prison)
      current_index += 1
    end
    unless penalties.size == size
      DotPrison.logger.debug "Penalty size incorrect #{penalties.size}/#{size}"
    end
  end

  private def parse_index(str) : Int32?
    return nil unless str.is_a? String
    arr = str.split ' '
    unless arr.size >= 2
      DotPrison.logger.debug "Unknown penalty index #{str}"
      return nil
    end
    _, i = arr
    i = i[0...-1]
    i = i.to_i32?
    unless i
      DotPrison.logger.debug "Invalid penalty index #{str}"
      return nil
    end
    i
  end
end
