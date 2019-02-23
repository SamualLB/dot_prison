abstract class DotPrison::Prison::Object
  getter prison : Prison

  property id : Int32
  property unique_id : Int32
  property x : Float64
  property y : Float64
  property type : String? = nil
  property sub_type : Int32

  def initialize(@prison, store : Store)
    @id = store.parse_int("Id.i")
    @unique_id = store.parse_int("Id.u")
    @x = store.parse_float( "Pos.x")
    @y = store.parse_float("Pos.y")
    @type = store.parse_string("Type")
    @sub_type = store.parse_int("SubType")
  end

  # Delegate to sub classes
  def self.new(prison : Prison, store : Store) : Object
    type = store.parse_string("Type") || ""
    parse_object(type).new(prison, store)
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
end

require "./object/abstracts/*"
require "./object/**"
