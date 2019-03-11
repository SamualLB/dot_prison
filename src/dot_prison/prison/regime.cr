class DotPrison::Prison::Regime < DotPrison::StoreConsumer; end

require "./regime/*"

class DotPrison::Prison::Regime < DotPrison::StoreConsumer
  HOUR_KEYS = [] of Symbol

  {% for i in 0..23 %}
    HOUR_KEYS << :"[i {{i}}]"
    no_handle(:"[i {{i}}]")
  {% end %}
  
  custom_handle(:current_activity, :"Activity | String", :CurrentActivity)
  custom_handle(:previous_activity, :"Activity | String", :PreviousActivity)

  @activities = {} of Int32 => Activity | String

  def initialize(store : Store, @prison : Prison)
    init_store(store)
    @current_activity = Activity.from_store(store.parse_string(:CurrentActivity))
    @previous_activity = Activity.from_store(store.parse_string(:PreviousActivity))
    (0..23).each do |i|
      @activities[i] = Activity.from_store(store.parse_string(HOUR_KEYS[i]))
    end
  end

  def activities
    @activities
  end
end
