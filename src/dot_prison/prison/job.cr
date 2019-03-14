abstract class DotPrison::Prison::Job < DotPrison::StoreConsumer
  property! prison : Prison

  macro inherited
    def initialize(store : Store, prison : Prison)
      init_store(store, prison)
    end
  end

  def self.parse(store : Store, prison : Prison) : Tuple(Array(Job), Int32)
    ret = [] of Job
    inner = store.parse_store(:Items)
    inner.each do |k, job|
      next unless job.is_a?(Store)
      ret << parse_job(job.parse_string(:Type)).new(job, prison)
    end
    {ret, store.parse_int(:Next)}
  end

  protected def self.parse_job(name : String?) : Class
    {% begin %}
      case name
      {% for sub in @type.subclasses %}
        when {{ sub.name.split("::").last }} then {{ sub.name.id }}
      {% end %}
      else DotPrison.logger.debug "Unknown job type: #{name}"
        UnknownJob
      end
    {% end %}
  end
end

require "./job/abstracts/*"
require "./job/**"
