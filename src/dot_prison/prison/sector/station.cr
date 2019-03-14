class DotPrison::Prison::Sector::Station < DotPrison::StoreConsumer
  handle(:guard, :"Reference(Object)", :"Entity.i", :"Entity.u")
  handle(:last_occupied, :Float64, :LastOccupied)
end
