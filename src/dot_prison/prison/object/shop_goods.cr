class DotPrison::Prison::Object::ShopGoods < DotPrison::Prison::Object
  include ObjectProperties

  def initialize(store : Store, prison : Prison)
    super
  end
end
