module DotPrison::Prison::Object::Slot

  @slots = {} of Int32 => PrisonerReference

  def initialize(prison : Prison, store : Store)
    super
    (0...no_slots).each do |n|
      id = store.parse_int("Slot#{n}.i")
      uid = store.parse_int("Slot#{n}.u")
      if id != 0 && uid != 0
        @slots[n] = PrisonerReference.new(prison, id, uid)
      else
        @slots[n] = PrisonerReference.new(prison)
      end
    end
  end

  abstract def no_slots : Int32
end
