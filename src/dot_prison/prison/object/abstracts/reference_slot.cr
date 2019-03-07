module DotPrison::Prison::Object::ReferenceSlot
  macro included
    {% if @type.has_constant?(:NO_SLOTS) %}
      {% for s in 0...@type.constant(:NO_SLOTS) %}
        custom_handle(:slot_{{s}}, :Int32, :"Slot{{s}}.i", :"Slot{{s}}.u")
      {% end %}
    {% else %}
      {{raise "NO_SLOTS must be set before including Slot"}}
    {% end %}
  end

  @slots : Hash(Int32, Reference(Prisoner)) = {} of Int32 => Reference(Prisoner)

  def initialize(store : Store, prison : Prison)
    super
    (0...{{@type.constant(:NO_SLOTS)}}).each do |n|
      id = store.parse_int("Slot#{n}.i")
      uid = store.parse_int("Slot#{n}.u")
      @slots[n] = Reference(Prisoner).new(prison, id, uid)
    end
  end
end
