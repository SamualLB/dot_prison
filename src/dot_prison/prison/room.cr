class DotPrison::Prison::Room < DotPrison::StoreConsumer
  getter! prison : Prison

  macro inherited
    def initialize(store : Store, @prison : Prison)
      init_store(store, prison)
    end
  end

  def self.new(store : Store, prison : Prison) : Room
      type = store.parse_string(:RoomType) || ""
      parse_room(type).new(store, prison)
  end

  protected def self.parse_room(name : String) : Class
    {% begin %}
      case name
      {% for sub in @type.subclasses %}
        when {{sub.name.split("::").last}} then {{sub.name.id}}
      {% end %}
      else
        DotPrison.logger.debug "Unknown room type: #{name}"
        UnknownRoom
      end
    {% end %}
  end

  def self.parse(store : Store, prison : Prison) : Array(Room)
    arr = Array(Room).new
    store.parse_indexed_store do |room|
      arr << Room.new(room, prison)
    end
    arr
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

require "./room/abstracts/*"
require "./room/**"
