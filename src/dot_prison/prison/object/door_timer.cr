class DotPrison::Prison::Object::DoorTimer < DotPrison::Prison::Object
  include ObjectProperties
  include ConnectionProperties
  include Powered
  include RegimeProperties

  handle(:doors_open, :Bool, :DoorsOpen)
  handle(:regime_category, :Int32, :RegimeCategory)

  property! active_times : Hash(Int32, Bool)

  TIMES = [] of Symbol
  {% for i in 0...24 %}
    TIMES << :Time{{i}}
    no_handle(:Time{{i}})
  {% end %}

  def initialize(store : Store, prison : Prison)
    super
    active_times = Hash(Int32, Bool).new
    TIMES.each_with_index do |key, i|
      active_times[i] = store.parse_bool(key)
    end
  end
end
