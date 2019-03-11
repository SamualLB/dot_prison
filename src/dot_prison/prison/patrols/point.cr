class DotPrison::Prison::Patrols::Point < DotPrison::StoreConsumer
  handle(:set, :Bool, :Set)
  handle(:last_visit, :Float64, :Visit)
  handle(:last_visitor, :"Reference(Object)", :"LastVisitor.i", :"LastVisitor.u")
end
