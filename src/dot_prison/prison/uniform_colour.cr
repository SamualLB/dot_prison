struct DotPrison::Prison::UniformColour < DotPrison::Consumer
  consume :uniform_colour_none, DotPrison::Colour, :None_colourUniform
  consume :uniform_colour_min_sec, DotPrison::Colour, :MinSec_colourUniform
  consume :uniform_colour_normal, DotPrison::Colour, :Normal_colourUniform
  consume :uniform_colour_max_sec, DotPrison::Colour, :MaxSec_colourUniform
  consume :uniform_colour_protected, DotPrison::Colour, :Protected_colourUniform
  consume :uniform_colour_super_max, DotPrison::Colour, :SuperMax_colourUniform
  consume :uniform_colour_death_row, DotPrison::Colour, :DeathRow_colourUniform
  consume :uniform_colour_insane, DotPrison::Colour, :Insane_colourUniform
  consume :uniform_colour_transfer_prisoner, DotPrison::Colour, :PrisonerTransfer_colourUniform
end