abstract struct DotPrison::Prison::Object < DotPrison::Consumer
  def self.new(table : DotPrison::Table)
    parse_object(table.parse_string(:Type)).new(table)
  end

  private def self.parse_object(name)
    {% begin %}
      case name
      {% for sub in @type.subclasses %}
        {% unless sub.abstract? %}
          {% unless sub == DotPrison::Prison::Object::UnknownObject ||
              sub == DotPrison::Prison::Object::CCTVMonitor ||
              sub == DotPrison::Prison::Object::CCTV ||
              sub == DotPrison::Prison::Object::LargeTV ||
              sub == DotPrison::Prison::Object::TV %}
            when {{sub.name.split("::").last}} then {{sub.name.id}}
          {% end %}
        {% end %}
      {% end %}
      when "CctvMonitor" then CCTVMonitor
      when "Cctv" then CCTV
      when "LargeTv" then LargeTV
      when "Tv" then TV
      else
        Log.info { "Unrecognised object type #{name}" }
        UnknownObject
      end
    {% end %}
  end
end

require "./object/*"
