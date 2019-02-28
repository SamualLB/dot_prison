module DotPrison::Prison::Object::ReferenceSlot
  macro included
    {% if @type.has_constant?(:NO_SLOTS) %}
      {% for s in 0...@type.constant(:NO_SLOTS) %}
        HANDLED_PROPERTIES.push "Slot{{s}}.i", "Slot{{s}}.u"
      {% end %}
    {% else %}
      {{raise "NO_SLOTS must be set before including Slot"}}
    {% end %}
  end

  @slots = {} of Int32 => Reference(Prisoner)

  def initialize(prison : Prison, store : Store)
    super
    (0...{{@type.constant(:NO_SLOTS)}}).each do |n|
      id = store.parse_int("Slot#{n}.i")
      uid = store.parse_int("Slot#{n}.u")
      if id != 0 && uid != 0
        @slots[n] = Reference(Prisoner).new(prison, id, uid)
      else
        @slots[n] = Reference(Prisoner).new(prison)
      end
    end
  end
end
