abstract class DotPrison::Prison::Object
  getter prison : Prison

  property id = 0
  property unique_id = 0

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
      else DotPrison.logger.debug "Unknown object: #{type}"
      end
    {% end %}
  end

  def initialize(@prison, store : Store)
  end
end

require "./object/*"
