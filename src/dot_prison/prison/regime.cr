struct DotPrison::Regime < DotPrison::Consumer
  consume :previous_hour, Int32, :PreviousHour
  consume :bangup, Bool, :Bangup
  consume :none_regime, DotPrison::CategoryRegime, :None
  consume :min_regime, DotPrison::CategoryRegime, :MinSec
  consume :med_regime, DotPrison::CategoryRegime, :Normal
  consume :max_regime, DotPrison::CategoryRegime, :MaxSec
  consume :protected_regime, DotPrison::CategoryRegime, :Protected
  consume :supermax_regime, DotPrison::CategoryRegime, :SuperMax
  consume :death_row_regime, DotPrison::CategoryRegime, :DeathRow
  consume :insane_regime, DotPrison::CategoryRegime, :Insane
end
