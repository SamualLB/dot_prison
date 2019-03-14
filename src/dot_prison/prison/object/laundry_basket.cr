class DotPrison::Prison::Object::LaundryBasket < DotPrison::Prison::Object
  NO_SLOTS = 1

  include ObjectProperties
  include ReferenceSlot

  handle(:home_sector, :"Reference(Sector)", :"HomeSector.i", :"HomeSector.u")
end
