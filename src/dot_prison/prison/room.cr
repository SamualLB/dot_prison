abstract struct DotPrison::Prison::Room < DotPrison::Consumer
  def self.new(table : DotPrison::Table)
    parse_room(table.parse_string(:RoomType)).new(table)
  end

  private def self.parse_room(name)
    {% begin %}
      case name
        {% for sub in @type.subclasses %}
          {% unless sub.abstract? %}
            when {{sub.name.split("::").last.underscore.camelcase}} then {{sub.name.id}}
          {% end %}
        {% end %}
      else
        Log.info { "Unrecognised room type #{name}" } if name
        UnknownRoom
      end
    {% end %}
  end
end

require "./room/helper/*"
require "./room/*"
