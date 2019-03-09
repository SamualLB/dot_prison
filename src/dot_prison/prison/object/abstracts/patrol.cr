module DotPrison::Prison::Object::PatrolProperties
  macro included
    no_handle(:"Patrol.Active")
    no_handle(:"Patrol.LastPos.x", :"Patrol.LastPos.y")
    no_handle(:"Patrol.ThisPos.x", :"Patrol.ThisPos.y")

    property! patrol : Patrol
  end

  def initialize(store : Store, prison : Prison)
    super
    @patrol = Patrol.new(store, prison)
  end
end

class DotPrison::Prison::Object::Patrol
  property! active : Bool
  property! last_position : Tuple(Int32, Int32)
  property! this_position : Tuple(Int32, Int32)

  def initialize(store : Store, prison : Prison)
    super
    @active = store.parse_bool(:"Patrol.Active")
    @last_position = {store.parse_int(:"Patrol.LastPos.x"), store.parse_int(:"Patrol.LastPos.y")}
    @this_position = {store.parse_int(:"Patrol.ThisPos.x"), store.parse_int(:"Patrol.ThisPos.y")}
  end
end
