abstract class DotPrison::Prison::Object < DotPrison::StoreConsumer
  getter! prison : Prison

  macro inherited
    def initialize(store : Store, @prison : Prison)
      init_store(store, prison)
    end
  end

  # Delegate to sub classes
  def self.new(store : Store, prison : Prison) : Object
    type = store.parse_string("Type") || ""
    parse_object(type).new(store, prison)
  end

  # Use macro to generate 'when', contains the class name
  protected def self.parse_object(name : String) : Class
    {% begin %}
      case name
      {% for sub in @type.subclasses %}
        {% unless sub.abstract? %}
          when {{sub.name.split("::").last}} then {{sub.name.id}}
        {% end %}
      {% end %}
      when "CctvMonitor" then CCTVMonitor
      when "Cctv"        then CCTV
      when "LargeTv"     then LargeTV
      when "Tv"          then TV
      else
        DotPrison.logger.debug "Unknown object: #{name}"
        UnknownObject
      end
    {% end %}
  end

  def self.parse(store : Store, prison : Prison) : Tuple(Hash(Int32, Object), Int32)
    ret = Hash(Int32, Object).new
    store.each do |id, obj|
      next unless obj.is_a?(Store)
      id = parse_id(id)
      next unless id
      ret[id] = Object.new(obj, prison)
    end
    {ret, store.parse_int(:Size)}
  end

  private def self.parse_id(str : String) : Int32?
    arr = str.split ' '
    if arr.size >= 2
      id = arr[1]
    else
      return nil
    end
    id[0...-1].to_i32?
  end
end

require "./object/abstracts/*"
require "./object/**"
