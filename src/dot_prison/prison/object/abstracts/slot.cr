module DotPrison::Prison::Object::Slot
  macro included
    {% if @type.has_constant?(:NO_SLOTS) %}
      {% for s in 0...@type.constant(:NO_SLOTS) %}
        HANDLED_PROPERTIES.push "Slot{{s}}.i"
      {% end %}
    {% else %}
      {{raise "NO_SLOTS must be set before including Slot"}}
    {% end %}
  end

  @slots = {} of Int32 => Int32

  def initialize(prison : Prison, store : Store)
    super
    (0...{{@type.constant(:NO_SLOTS)}}).each do |n|
      int = store.parse_int("Slot#{n}.i")
      @slots[n] = int
    end
  end
end
