module DotPrison::Prison::Job::Target
  macro included
    handle(:target, :"Reference(Object)", :"TargetObj.i", :"TargetObj.u")
  end
end
