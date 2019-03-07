module DotPrison::Prison::Object::Powered
  macro included
    handle(:powered, :Bool, :Powered)
    handle(:power_on, :Bool, :On)
  end
end
