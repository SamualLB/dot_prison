abstract class DotPrison::Prison::Object
end

require "./object/property/*"

abstract class DotPrison::Prison::Object
  include Property::Helper
  include Property::ID
  include Property::Type
  include Property::Position

  getter prison : Prison

  # Delegate to sub classes
  #
  # Use macro to generate 'when', contains the class name
  def self.new(prison : Prison, store : Store)
    {% begin %}
      type = store["Type"]?
      case type
      {% for sub in @type.subclasses %}
        {% unless sub.abstract? %}
          when {{sub.name.split("::").last}} then {{sub.name.id}}.new(prison, store)
        {% end %}
      {% end %}
      when "CctvMonitor"  then CCTVMonitor.new(prison, store)
      when "Cctv"         then CCTV.new(prison, store)
      when "LargeTv"      then LargeTV.new(prison, store)
      when "Tv"           then TV.new(prison, store)
      else DotPrison.logger.debug "Unknown object: #{type}"
      end
    {% end %}
  end

  def initialize(@prison, store : Store)
    super
  end
end

require "./object/**"
