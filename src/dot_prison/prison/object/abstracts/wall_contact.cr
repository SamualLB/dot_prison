module DotPrison::Prison::Object::WallContact
  macro included
    custom_handle(:wall_contact_x, :LRContact, :"Walls.x")
    custom_handle(:wall_contact_y, :UDContact, :"Walls.y")
  end

  def initialize(store : Store, prison : Prison)
    super
    x_flt = store.parse_float("Walls.x")
    @wall_contact_x = LRContact.from_value?(x_flt.to_i) || LRContact::None
    y_flt = store.parse_float("Walls.y")
    @wall_contact_y = UDContact.from_value?(y_flt.to_i) || UDContact::None
  end

  enum UDContact
    None    = 0
    Up      = -1
    Down    = 1
  end

  enum LRContact
    None    = 0
    Left    = -1
    Right   = 1
  end
end
