class DotPrison::Prison::Sector::Job::Container
  property! jobs : Array(Job)

  def initialize(store : Store, prison : Prison)
    size = store.parse_int(:Size)
    jobs = Array(Job).new
    store.each do |k, v|
      next if k == "Size"
      next unless v.is_a? Store
      id = parse_id(k)
      unless id
        DotPrison.logger.debug "Unrecognised job index: #{k}, #{v}"
        next
      end
      jobs << Job.new(v, prison)
    end
    unless size == jobs.size
      DotPrison.logger.debug "Number of jobs does not match: #{jobs.size}/#{size}"
    end
  end

  private def parse_id(str) : Int32?
    return nil unless str.is_a? String
    arr = str.split ' '
    return nil unless arr.size >= 2
    _, i = arr
    i = i[0...-1].to_i32?
    return nil unless i
    i
  end
end
