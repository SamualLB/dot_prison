class DotPrison::Prison::Sector::Job < DotPrison::StoreConsumer
  handle(:worker, :"Reference(Object)", :"Entity.i", :"Entity.u")
  handle(:last_occupied, :Float64, :LastOccupied)
end
