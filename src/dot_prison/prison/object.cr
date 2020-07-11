abstract struct DotPrison::Prison::Object < DotPrison::Consumer
  def self.new(table : DotPrison::Table)
    parse_object(table.parse_string(:Type)).new(table)
  end

  private def self.parse_object(name)
    {% begin %}
      case name
      {% for sub in @type.subclasses %}
        {% unless sub.abstract? %}
          when {{sub.name.split("::").last.underscore.camelcase}} then {{sub.name.id}}
        {% end %}
      {% end %}
      else
        Log.info { "Unrecognised object type #{name}" } if name
        UnknownObject
      end
    {% end %}
  end
end

require "./object/helper/*"
require "./object/*"
