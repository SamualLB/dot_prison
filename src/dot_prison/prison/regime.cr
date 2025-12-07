struct DotPrison::Prison::Regime < DotPrison::Consumer
  consume :previous_hour, Int32, :PreviousHour
  consume :bangup, Bool, :Bangup
  consume :none_regime, Prison::CategoryRegime, :None
  consume :min_regime, Prison::CategoryRegime, :MinSec
  consume :med_regime, Prison::CategoryRegime, :Normal
  consume :max_regime, Prison::CategoryRegime, :MaxSec
  consume :protected_regime, Prison::CategoryRegime, :Protected
  consume :supermax_regime, Prison::CategoryRegime, :SuperMax
  consume :death_row_regime, Prison::CategoryRegime, :DeathRow
  consume :insane_regime, Prison::CategoryRegime, :Insane
end
