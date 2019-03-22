abstract class DotPrison::Prison::Object < DotPrison::StoreConsumer
  getter! prison : Prison

  macro inherited
    def initialize(store : Store, @prison : Prison)
      init_store(store, prison)
    end
  end

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
  end

  # Delegate to sub classes
  def self.new(store : Store, prison : Prison) : Object
    parse_object(store.parse_string(:Type)).new(store, prison)
  end

  # Use macro to generate 'when', contains the class name
  protected def self.parse_object(name) : Class
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

  def self.parse(store : Store, prison : Prison) : Array(Object)
    arr = Array(Object).new
    store.parse_indexed_store do |obj|
      arr << Object.new(obj, prison)
    end
    arr
  end
end

require "./object/abstracts/*"
require "./object/**"
