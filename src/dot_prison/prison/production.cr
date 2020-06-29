struct DotPrison::Prison::Production < DotPrison::Consumer
  struct ManufacturedObject < DotPrison::Consumer
    # TODO: Enum or something?
    consume :type, Int32, :Type
    consume :count, Int32, :Count
  end

  consume :manufactured, Array(ManufacturedObject), :ManufacturedObjects
end
