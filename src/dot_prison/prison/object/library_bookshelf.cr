class DotPrison::Prison::Object::LibraryBookshelf < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation

  handle(:num_books, :Int32, :NumBooks)

  def initialize(store : Store, prison : Prison)
    super
  end
end
