class DotPrison::Prison::Production < DotPrison::StoreConsumer
  handle :objects, :"Array(ManufacturedObject)", :ManufacturedObjects

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    objects = [] of ManufacturedObject
    store.parse_store(:ManufacturedObjects).parse_store_array(:i).each do |obj|
      objects << ManufacturedObject.new(obj, prison)
    end
  end
end

require "./production/*"
