class DotPrison::Prison::Sector::InnerContainer
  property! sectors : Array(Sector)

  def initialize(store : Store, prison : Prison)
    size = store.parse_int(:Size)
    sectors = Array(Sector).new
    store.each do |k, v|
      next if k == "Size"
      unless v.is_a? Store
        DotPrison.logger.debug "Unrecognised sector: #{k}, #{v}"
        next
      end
      parsed_id = parse_id(k)
      unless parsed_id == v.parse_int(:id)
        DotPrison.logger.debug "Unmatched sector id: #{parsed_id}, #{v.parse_int(:id)}"
      end
      sectors << Sector.new(v, prison)
    end
  end

  private def parse_id(str) : Int32?
    return nil unless str.is_a? String
    arr = str.split ' '
    return nil unless arr.size >= 2
    _, i = arr
    i = i[0...-1]
    i = i.to_i32?
    unless i
      DotPrison.logger.debug "Invalid sector key id: #{str}"
      return nil
    end
    i
  end
end
