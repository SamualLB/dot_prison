class DotPrison::Prison
  property version = ""
  property width = 0
  property height = 0
  property origin_x = 0
  property origin_y = 0
  property origin_width = 0
  property origin_height = 0
  property time_index = 0.0
  property random_seed = 0
  property seconds_played = 0
  property next_object_id = 0
  property electricity_enabled = false
  property water_enabled = false
  property food_enabled = false
  property misconduct_enabled = false
  property decay_enabled = false
  property visibility_enabled = false
  property weather_enabled = false

  property cells = Hash({Int32, Int32}, Cell).new
  property objects = Hash(Int32, Object).new

  def initialize(store : Store)
    @width = store.parse_int("NumCellsX")
    @height = store.parse_int("NumCellsY")
    parse_cells(store)
    parse_objects(store)
  end

  def parse_cells(store : Store)
    return unless (store_cells = store["Cells"]).is_a?(Store)
    store_cells.each do |coords, sub|
      x, y = coords.split ' '
      x = x.to_i32; y = y.to_i32
      next unless sub.is_a? Store
      cells[{x, y}] = Cell.new(self, sub)
    end
  end

  def parse_objects(store : Store)
    obj_store = store["Objects"]?
    unless obj_store.is_a?(Store)
      DotPrison.logger.debug "'Objects' is not a store! Malformed file?"
      return
    end
    obj_store.each do |id, obj|
      next unless obj.is_a? Store
      _, id = id.split ' '
      id = id[0...-1].to_i
      objects[id] = Object.new(self, obj)
    end
  end

  def find_room(id)
    raise "Unimplemented \#find_room"
  end

  def find_room?(id)
    nil
  end

  def find_unique_room(id)
    raise "Unimplemented \#find_unique_room"
  end

  def find_unique_room?(id)
    nil
  end

  protected def find(uid : Int32?, id : Int32?, type : Class) : Room | Cell | Object | Nil
    case type
      when Room
        return nil
      when Cell
        return nil
      #when specific object
      when Prison::Object # use uid???
        return objects[id]? if id
        objects.each do |k, obj|
          return obj if obj.unique_id == uid
        end
      else
        #uid
        return nil
    end
    nil
  end
end

require "./prison/*"
